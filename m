Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377DF77FDBC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 20:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C00F10E574;
	Thu, 17 Aug 2023 18:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA37410E572;
 Thu, 17 Aug 2023 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iUYe9g2MBePpeImYFZSYmc73rD01LVejX27ZWnGqtrg=; b=SY1uUsqWfuvjq6yENvUMBo1gqM
 SC9arx0L3MSypUGtfvK41ncQFrO1ADfv0LvGbu4HK1dVwBJ1Kc6bZlnSbkdqCPtR2Di6B/XbGDzjl
 pXSqqX8A5vcEvbEeqif571LDArSCs4OrivzcngH+koG87KNF0wHBzuZxPJCWMaZ4HOHP9Nu1djJ2p
 m2vdgMuNmDucHx6h6eBQ1yHnnculLgxon+8YriDf5zXs2h1M+sI9fZVnaF1aX/ampnTenit2fXOpB
 ceLV86A34+yv4MNCqIfzm2WFVvfEy9mYDxdxKlvWAn9ndgX8jaUAvbnC51D8my54bBD/RSDuEiZd4
 FZtXpE/A==;
Received: from [191.193.179.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qWhcJ-0021I9-BT; Thu, 17 Aug 2023 20:21:07 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] drm/amdgpu: Encapsulate all device reset info
Date: Thu, 17 Aug 2023 15:20:48 -0300
Message-ID: <20230817182050.205925-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817182050.205925-1-andrealmeid@igalia.com>
References: <20230817182050.205925-1-andrealmeid@igalia.com>
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
 Shashank Sharma <shashank.sharma@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To better organize struct amdgpu_device, keep all reset information
related fields together in a separated struct.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v5: new patch, as requested by Shashank Sharma
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         | 34 +++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 16 +++++-----
 3 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 0d560b713948..56d78ca6e917 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -781,6 +781,26 @@ struct amdgpu_mqd {
 #define AMDGPU_PRODUCT_NAME_LEN 64
 struct amdgpu_reset_domain;
 
+#ifdef CONFIG_DEV_COREDUMP
+struct amdgpu_coredump_info {
+	struct amdgpu_device	*adev;
+	struct amdgpu_task_info reset_task_info;
+	struct timespec64	reset_time;
+	bool			reset_vram_lost;
+};
+#endif
+
+struct amdgpu_reset_info {
+	/* reset dump register */
+	u32 *reset_dump_reg_list;
+	u32 *reset_dump_reg_value;
+	int num_regs;
+
+#ifdef CONFIG_DEV_COREDUMP
+	struct amdgpu_coredump_info *coredump_info;
+#endif
+};
+
 /*
  * Non-zero (true) if the GPU has VRAM. Zero (false) otherwise.
  */
@@ -1084,10 +1104,7 @@ struct amdgpu_device {
 
 	struct mutex			benchmark_mutex;
 
-	/* reset dump register */
-	uint32_t                        *reset_dump_reg_list;
-	uint32_t			*reset_dump_reg_value;
-	int                             num_regs;
+	struct amdgpu_reset_info	reset_info;
 
 	bool                            scpm_enabled;
 	uint32_t                        scpm_status;
@@ -1100,15 +1117,6 @@ struct amdgpu_device {
 	uint32_t			aid_mask;
 };
 
-#ifdef CONFIG_DEV_COREDUMP
-struct amdgpu_coredump_info {
-	struct amdgpu_device		*adev;
-	struct amdgpu_task_info         reset_task_info;
-	struct timespec64               reset_time;
-	bool                            reset_vram_lost;
-};
-#endif
-
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
 {
 	return container_of(ddev, struct amdgpu_device, ddev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index a4faea4fa0b5..3136a0774dd9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -2016,8 +2016,8 @@ static ssize_t amdgpu_reset_dump_register_list_read(struct file *f,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < adev->num_regs; i++) {
-		sprintf(reg_offset, "0x%x\n", adev->reset_dump_reg_list[i]);
+	for (i = 0; i < adev->reset_info.num_regs; i++) {
+		sprintf(reg_offset, "0x%x\n", adev->reset_info.reset_dump_reg_list[i]);
 		up_read(&adev->reset_domain->sem);
 		if (copy_to_user(buf + len, reg_offset, strlen(reg_offset)))
 			return -EFAULT;
@@ -2074,9 +2074,9 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 	if (ret)
 		goto error_free;
 
-	swap(adev->reset_dump_reg_list, tmp);
-	swap(adev->reset_dump_reg_value, new);
-	adev->num_regs = i;
+	swap(adev->reset_info.reset_dump_reg_list, tmp);
+	swap(adev->reset_info.reset_dump_reg_value, new);
+	adev->reset_info.num_regs = i;
 	up_write(&adev->reset_domain->sem);
 	ret = size;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b5b879bcc5c9..96975591841d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4790,10 +4790,10 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
 
 	lockdep_assert_held(&adev->reset_domain->sem);
 
-	for (i = 0; i < adev->num_regs; i++) {
-		adev->reset_dump_reg_value[i] = RREG32(adev->reset_dump_reg_list[i]);
-		trace_amdgpu_reset_reg_dumps(adev->reset_dump_reg_list[i],
-					     adev->reset_dump_reg_value[i]);
+	for (i = 0; i < adev->reset_info.num_regs; i++) {
+		adev->reset_info.reset_dump_reg_value[i] = RREG32(adev->reset_info.reset_dump_reg_list[i]);
+		trace_amdgpu_reset_reg_dumps(adev->reset_info.reset_dump_reg_list[i],
+					     adev->reset_info.reset_dump_reg_value[i]);
 	}
 
 	return 0;
@@ -4831,13 +4831,13 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 
 	if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
-	if (coredump->adev->num_regs) {
+	if (coredump->adev->reset_info.num_regs) {
 		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
 
-		for (i = 0; i < coredump->adev->num_regs; i++)
+		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
 			drm_printf(&p, "0x%08x: 0x%08x\n",
-				   coredump->adev->reset_dump_reg_list[i],
-				   coredump->adev->reset_dump_reg_value[i]);
+				   coredump->adev->reset_info.reset_dump_reg_list[i],
+				   coredump->adev->reset_info.reset_dump_reg_value[i]);
 	}
 
 	return count - iter.remain;
-- 
2.41.0

