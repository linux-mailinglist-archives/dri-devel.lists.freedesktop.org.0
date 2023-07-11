Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FC74F9D1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 23:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC21610E438;
	Tue, 11 Jul 2023 21:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA5610E437;
 Tue, 11 Jul 2023 21:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KTRbZwUZgZnlGc0WMOlsXvvWVPDAjN3SirsI8t8QzuM=; b=LFtKd7KQNb4Fif9xGzTjkrwSAi
 lfL8gI2EaPuNVIs6NFCmsMRqH0V/NuNdlvlUF4hdZfU7CuC6zIvOKXh3M5DQwyHgKiBTsijeK0nUb
 yzpxrSB7wWWOtsB1O0lu2mkIZyX6Oy5LbBXb5soTTi6MOshDZrv9QJPiahvi03mThXHRF998PwxFc
 Sy0ES6jvMweiKXBx2ALG9adsHdvTH1KoJ9DDIzKxSDZa/MUBWtWo+YTz+GLOJxqXnIZB6W9D0lvjs
 mDKvG1Eat2DrOcZwBFH+rOLKIHMXsD4JWBDCMF2gqeOIC3SY/PKO5g0UAE783NOssKaJAXpoWawTQ
 OJZsyAdA==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qJL1R-00Cl0M-IK; Tue, 11 Jul 2023 23:35:49 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] drm/amdgpu: Rework coredump to use memory dynamically
Date: Tue, 11 Jul 2023 18:34:58 -0300
Message-ID: <20230711213501.526237-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711213501.526237-1-andrealmeid@igalia.com>
References: <20230711213501.526237-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of storing coredump information inside amdgpu_device struct,
move if to a proper separated struct and allocate it dynamically. This
will make it easier to further expand the logged information.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 65 ++++++++++++++--------
 2 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index dbe062a087c5..e1cc83a89d46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1068,11 +1068,6 @@ struct amdgpu_device {
 	uint32_t                        *reset_dump_reg_list;
 	uint32_t			*reset_dump_reg_value;
 	int                             num_regs;
-#ifdef CONFIG_DEV_COREDUMP
-	struct amdgpu_task_info         reset_task_info;
-	bool                            reset_vram_lost;
-	struct timespec64               reset_time;
-#endif
 
 	bool                            scpm_enabled;
 	uint32_t                        scpm_status;
@@ -1085,6 +1080,15 @@ struct amdgpu_device {
 	uint32_t			aid_mask;
 };
 
+#ifdef CONFIG_DEV_COREDUMP
+struct amdgpu_coredump_info {
+	struct amdgpu_device		*adev;
+	struct amdgpu_task_info         reset_task_info;
+	struct timespec64               reset_time;
+	bool                            reset_vram_lost;
+};
+#endif
+
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
 {
 	return container_of(ddev, struct amdgpu_device, ddev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e25f085ee886..23b9784e9787 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4963,12 +4963,17 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
 	return 0;
 }
 
-#ifdef CONFIG_DEV_COREDUMP
+#ifndef CONFIG_DEV_COREDUMP
+static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+			    struct amdgpu_reset_context *reset_context)
+{
+}
+#else
 static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
 {
 	struct drm_printer p;
-	struct amdgpu_device *adev = data;
+	struct amdgpu_coredump_info *coredump = data;
 	struct drm_print_iterator iter;
 	int i;
 
@@ -4982,21 +4987,21 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
 	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
 	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
-	drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, adev->reset_time.tv_nsec);
-	if (adev->reset_task_info.pid)
+	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
+	if (coredump->reset_task_info.pid)
 		drm_printf(&p, "process_name: %s PID: %d\n",
-			   adev->reset_task_info.process_name,
-			   adev->reset_task_info.pid);
+			   coredump->reset_task_info.process_name,
+			   coredump->reset_task_info.pid);
 
-	if (adev->reset_vram_lost)
+	if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
-	if (adev->num_regs) {
+	if (coredump->adev->num_regs) {
 		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
 
-		for (i = 0; i < adev->num_regs; i++)
+		for (i = 0; i < coredump->adev->num_regs; i++)
 			drm_printf(&p, "0x%08x: 0x%08x\n",
-				   adev->reset_dump_reg_list[i],
-				   adev->reset_dump_reg_value[i]);
+				   coredump->adev->reset_dump_reg_list[i],
+				   coredump->adev->reset_dump_reg_value[i]);
 	}
 
 	return count - iter.remain;
@@ -5004,14 +5009,34 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 
 static void amdgpu_devcoredump_free(void *data)
 {
+	kfree(data);
 }
 
-static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
+static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+			    struct amdgpu_reset_context *reset_context)
 {
+	struct amdgpu_coredump_info *coredump;
 	struct drm_device *dev = adev_to_drm(adev);
 
-	ktime_get_ts64(&adev->reset_time);
-	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
+	coredump = kmalloc(sizeof(*coredump), GFP_KERNEL);
+
+	if (!coredump) {
+		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
+		return;
+	}
+
+	memset(coredump, 0, sizeof(*coredump));
+
+	coredump->reset_vram_lost = vram_lost;
+
+	if (reset_context->job && reset_context->job->vm)
+		coredump->reset_task_info = reset_context->job->vm->task_info;
+
+	coredump->adev = adev;
+
+	ktime_get_ts64(&coredump->reset_time);
+
+	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
 		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
 }
 #endif
@@ -5119,15 +5144,9 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 					goto out;
 
 				vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
-#ifdef CONFIG_DEV_COREDUMP
-				tmp_adev->reset_vram_lost = vram_lost;
-				memset(&tmp_adev->reset_task_info, 0,
-						sizeof(tmp_adev->reset_task_info));
-				if (reset_context->job && reset_context->job->vm)
-					tmp_adev->reset_task_info =
-						reset_context->job->vm->task_info;
-				amdgpu_reset_capture_coredumpm(tmp_adev);
-#endif
+
+				amdgpu_coredump(tmp_adev, vram_lost, reset_context);
+
 				if (vram_lost) {
 					DRM_INFO("VRAM is lost due to GPU reset!\n");
 					amdgpu_inc_vram_lost(tmp_adev);
-- 
2.41.0

