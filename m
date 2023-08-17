Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F40877FDBE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 20:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5991810E575;
	Thu, 17 Aug 2023 18:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0125010E573;
 Thu, 17 Aug 2023 18:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wpNvn+yqhe73QXNzChOkRUjDE6Bq2McrBGfbGxLraHE=; b=eFbM+ZwKAOWR9xKNTpXtJqaNoi
 jgoTDV8OKTnk8EluvS/4Nitato5I17tsI+KYiXpFbJWWJGn+DBKFt5pq+MuYRo3lPqPpC2gMo8Pow
 ZoUDl1lNveSkly0Grfcb8DAkBQ2ls4APXX8DKIHF5+TJSdawJrwFVa5dgYYrwQPhzT5BzxJNiagcc
 1T8m+mErTE291plaWY+QsIsZumQXbYMeZBWKHp1n6wX1B8iMyNH7pAIUpcMY4+mZvdAfuhK+kIUFF
 Qzp39cW50t6LIAdE4yhniax7N0OhGo31y5SutagknqTiloYGYrvjhJ1h1fyiorYOTGYyE40Pbm8oP
 bXZy4baA==;
Received: from [191.193.179.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qWhcM-0021I9-KG; Thu, 17 Aug 2023 20:21:11 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] drm/amdgpu: Move coredump code to amdgpu_reset file
Date: Thu, 17 Aug 2023 15:20:49 -0300
Message-ID: <20230817182050.205925-5-andrealmeid@igalia.com>
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

Giving that we use codedump just for device resets, move it's functions
and structs to a more semantic file, the amdgpu_reset.{c, h}.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v5: no change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  9 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 78 ----------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 76 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 10 +++
 4 files changed, 86 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 56d78ca6e917..b11187d153ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -781,15 +781,6 @@ struct amdgpu_mqd {
 #define AMDGPU_PRODUCT_NAME_LEN 64
 struct amdgpu_reset_domain;
 
-#ifdef CONFIG_DEV_COREDUMP
-struct amdgpu_coredump_info {
-	struct amdgpu_device	*adev;
-	struct amdgpu_task_info reset_task_info;
-	struct timespec64	reset_time;
-	bool			reset_vram_lost;
-};
-#endif
-
 struct amdgpu_reset_info {
 	/* reset dump register */
 	u32 *reset_dump_reg_list;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 96975591841d..883953f2ae53 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -32,8 +32,6 @@
 #include <linux/slab.h>
 #include <linux/iommu.h>
 #include <linux/pci.h>
-#include <linux/devcoredump.h>
-#include <generated/utsrelease.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/apple-gmux.h>
 
@@ -4799,82 +4797,6 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
 	return 0;
 }
 
-#ifndef CONFIG_DEV_COREDUMP
-static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
-			    struct amdgpu_reset_context *reset_context)
-{
-}
-#else
-static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
-		size_t count, void *data, size_t datalen)
-{
-	struct drm_printer p;
-	struct amdgpu_coredump_info *coredump = data;
-	struct drm_print_iterator iter;
-	int i;
-
-	iter.data = buffer;
-	iter.offset = 0;
-	iter.start = offset;
-	iter.remain = count;
-
-	p = drm_coredump_printer(&iter);
-
-	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
-	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
-	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
-	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
-	if (coredump->reset_task_info.pid)
-		drm_printf(&p, "process_name: %s PID: %d\n",
-			   coredump->reset_task_info.process_name,
-			   coredump->reset_task_info.pid);
-
-	if (coredump->reset_vram_lost)
-		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
-	if (coredump->adev->reset_info.num_regs) {
-		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
-
-		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
-			drm_printf(&p, "0x%08x: 0x%08x\n",
-				   coredump->adev->reset_info.reset_dump_reg_list[i],
-				   coredump->adev->reset_info.reset_dump_reg_value[i]);
-	}
-
-	return count - iter.remain;
-}
-
-static void amdgpu_devcoredump_free(void *data)
-{
-	kfree(data);
-}
-
-static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
-			    struct amdgpu_reset_context *reset_context)
-{
-	struct amdgpu_coredump_info *coredump;
-	struct drm_device *dev = adev_to_drm(adev);
-
-	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
-
-	if (!coredump) {
-		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
-		return;
-	}
-
-	coredump->reset_vram_lost = vram_lost;
-
-	if (reset_context->job && reset_context->job->vm)
-		coredump->reset_task_info = reset_context->job->vm->task_info;
-
-	coredump->adev = adev;
-
-	ktime_get_ts64(&coredump->reset_time);
-
-	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
-		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
-}
-#endif
-
 int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 			 struct amdgpu_reset_context *reset_context)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 5fed06ffcc6b..579b70a3cdab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -21,6 +21,9 @@
  *
  */
 
+#include <linux/devcoredump.h>
+#include <generated/utsrelease.h>
+
 #include "amdgpu_reset.h"
 #include "aldebaran.h"
 #include "sienna_cichlid.h"
@@ -167,5 +170,78 @@ void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain)
 	up_write(&reset_domain->sem);
 }
 
+#ifndef CONFIG_DEV_COREDUMP
+void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+		     struct amdgpu_reset_context *reset_context)
+{
+}
+#else
+static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
+		size_t count, void *data, size_t datalen)
+{
+	struct drm_printer p;
+	struct amdgpu_coredump_info *coredump = data;
+	struct drm_print_iterator iter;
+	int i;
+
+	iter.data = buffer;
+	iter.offset = 0;
+	iter.start = offset;
+	iter.remain = count;
+
+	p = drm_coredump_printer(&iter);
+
+	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
+	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
+	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
+	if (coredump->reset_task_info.pid)
+		drm_printf(&p, "process_name: %s PID: %d\n",
+			   coredump->reset_task_info.process_name,
+			   coredump->reset_task_info.pid);
+
+	if (coredump->reset_vram_lost)
+		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
+	if (coredump->adev->reset_info.num_regs) {
+		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
+
+		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
+			drm_printf(&p, "0x%08x: 0x%08x\n",
+				   coredump->adev->reset_info.reset_dump_reg_list[i],
+				   coredump->adev->reset_info.reset_dump_reg_value[i]);
+	}
+
+	return count - iter.remain;
+}
 
+static void amdgpu_devcoredump_free(void *data)
+{
+	kfree(data);
+}
 
+void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+			    struct amdgpu_reset_context *reset_context)
+{
+	struct amdgpu_coredump_info *coredump;
+	struct drm_device *dev = adev_to_drm(adev);
+
+	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
+
+	if (!coredump) {
+		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
+		return;
+	}
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
+	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
+		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+}
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index f4a501ff87d9..01e8183ade4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -87,6 +87,14 @@ struct amdgpu_reset_domain {
 	atomic_t reset_res;
 };
 
+#ifdef CONFIG_DEV_COREDUMP
+struct amdgpu_coredump_info {
+	struct amdgpu_device		*adev;
+	struct amdgpu_task_info         reset_task_info;
+	struct timespec64               reset_time;
+	bool                            reset_vram_lost;
+};
+#endif
 
 int amdgpu_reset_init(struct amdgpu_device *adev);
 int amdgpu_reset_fini(struct amdgpu_device *adev);
@@ -126,4 +134,6 @@ void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain);
 
 void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain);
 
+void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
+		     struct amdgpu_reset_context *reset_context);
 #endif
-- 
2.41.0

