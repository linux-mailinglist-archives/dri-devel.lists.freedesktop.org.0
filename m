Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB496595E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4855810E847;
	Fri, 30 Aug 2024 08:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="AZsD1QXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B708110E847
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:05:10 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725005102; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CVxeSOctJTmA7Ut9nVLZW38P3ecXYY1P1mg+su3XGG6Bs3q8Ao8YLyqheIshsvy8hTKbNEWy0k+XQIoTVArQ1SKspkC929GU/WVYVlOVoQRNfkw2SLMfJUAUnKsbI18SoSCeFIiNKtvKxdcKBeUvogxefPtshyjVvJHzuR/5PNk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725005102;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5ajYkd4eRomYZsQcvoDBlY+ZV0yLaH0KXxX1AuIprVs=; 
 b=ljjzsT7JSDsjlCTclLTTTJqgpMjjiLgmctST+J5raVJbJ2jtObRfp2SIG/i61gBnjfXEGq2+UJlEX/Ibq5z/tvo3bKk359F+pZ1L6QzdxS+2MIAx3t/JzB4fE5W2qRTicMFIhtq6iXBA28AOp8MYSkMtJ6poG7osnJG1AgEVtys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725005102; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5ajYkd4eRomYZsQcvoDBlY+ZV0yLaH0KXxX1AuIprVs=;
 b=AZsD1QXABAgBOnBjCmhbwvWUMDqtEYrENTG1YGod9ir9dIbwhxVmCeQHwKBmsEvN
 TomEBT2G24NT2tyFIWNogSBzH1LlXsyeaAcJ/MV8Q7Lyr2NEdLwzBy8fzb7cAeubwwP
 gOeK3E16gMn+vFT/FlxKAOw1YQGU6maftZt/T9so=
Received: by mx.zohomail.com with SMTPS id 1725005099443412.49504026312945;
 Fri, 30 Aug 2024 01:04:59 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: kernel@collabora.com, Mary Guillemard <mary.guillemard@collabora.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Date: Fri, 30 Aug 2024 10:03:50 +0200
Message-ID: <20240830080349.24736-2-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose timestamp information supported by the GPU with a new device
query.

Mali uses an external timer as GPU system time. On ARM, this is wired to
the generic arch timer so we wire cntfrq_el0 as device frequency.

This new uAPI will be used in Mesa to implement timestamp queries and
VK_KHR_calibrated_timestamps.

Since this extends the uAPI and because userland needs a way to advertise
those features conditionally, this also bumps the driver minor version.

v2:
- Rewrote to use GPU timestamp register
- Added timestamp_offset to drm_panthor_timestamp_info
- Add missing include for arch_timer_get_cntfrq
- Rework commit message

v3:
- Add panthor_gpu_read_64bit_counter
- Change panthor_gpu_read_timestamp to use
  panthor_gpu_read_64bit_counter

v4:
- Fix multiple typos in uAPI documentation
- Mention behavior when the timestamp frequency is unknown
- Use u64 instead of unsigned long long
  for panthor_gpu_read_timestamp
- Apply r-b from Mihail

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 43 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gpu.c | 47 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gpu.h |  4 +++
 include/uapi/drm/panthor_drm.h        | 22 +++++++++++++
 4 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index b5e7b919f241..444e3bb1cfb5 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -3,6 +3,10 @@
 /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
 /* Copyright 2019 Collabora ltd. */
 
+#ifdef CONFIG_ARM_ARCH_TIMER
+#include <asm/arch_timer.h>
+#endif
+
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -164,6 +168,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 	_Generic(_obj_name, \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
@@ -750,10 +755,33 @@ static void panthor_submit_ctx_cleanup(struct panthor_submit_ctx *ctx,
 	kvfree(ctx->jobs);
 }
 
+static int panthor_query_timestamp_info(struct panthor_device *ptdev,
+					struct drm_panthor_timestamp_info *arg)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ptdev->base.dev);
+	if (ret)
+		return ret;
+
+#ifdef CONFIG_ARM_ARCH_TIMER
+	arg->timestamp_frequency = arch_timer_get_cntfrq();
+#else
+	arg->timestamp_frequency = 0;
+#endif
+	arg->current_timestamp = panthor_gpu_read_timestamp(ptdev);
+	arg->timestamp_offset = panthor_gpu_read_timestamp_offset(ptdev);
+
+	pm_runtime_put(ptdev->base.dev);
+	return 0;
+}
+
 static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 	struct drm_panthor_dev_query *args = data;
+	struct drm_panthor_timestamp_info timestamp_info;
+	int ret;
 
 	if (!args->pointer) {
 		switch (args->type) {
@@ -765,6 +793,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(ptdev->csif_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO:
+			args->size = sizeof(timestamp_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -777,6 +809,14 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
 
+	case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO:
+		ret = panthor_query_timestamp_info(ptdev, &timestamp_info);
+
+		if (ret)
+			return ret;
+
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, timestamp_info);
+
 	default:
 		return -EINVAL;
 	}
@@ -1372,6 +1412,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
 /*
  * PanCSF driver version:
  * - 1.0 - initial interface
+ * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1385,7 +1426,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.desc = "Panthor DRM driver",
 	.date = "20230801",
 	.major = 1,
-	.minor = 0,
+	.minor = 1,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 5251d8764e7d..2d3529a0b156 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -480,3 +480,50 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
 	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
 	panthor_gpu_l2_power_on(ptdev);
 }
+
+/**
+ * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
+ * @ptdev: Device.
+ * @reg: The offset of the register to read.
+ *
+ * Return: The counter value.
+ */
+static u64
+panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
+{
+	u32 hi, lo;
+
+	do {
+		hi = gpu_read(ptdev, reg + 0x4);
+		lo = gpu_read(ptdev, reg);
+	} while (hi != gpu_read(ptdev, reg + 0x4));
+
+	return ((u64)hi << 32) | lo;
+}
+
+/**
+ * panthor_gpu_read_timestamp() - Read the timestamp register.
+ * @ptdev: Device.
+ *
+ * Return: The GPU timestamp value.
+ */
+u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
+{
+	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
+}
+
+/**
+ * panthor_gpu_read_timestamp_offset() - Read the timestamp offset register.
+ * @ptdev: Device.
+ *
+ * Return: The GPU timestamp offset value.
+ */
+u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
+{
+	u32 hi, lo;
+
+	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
+	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
+
+	return ((u64)hi << 32) | lo;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index bba7555dd3c6..7f6133a66127 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -5,6 +5,8 @@
 #ifndef __PANTHOR_GPU_H__
 #define __PANTHOR_GPU_H__
 
+#include <linux/types.h>
+
 struct panthor_device;
 
 int panthor_gpu_init(struct panthor_device *ptdev);
@@ -48,5 +50,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
 int panthor_gpu_soft_reset(struct panthor_device *ptdev);
+u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev);
+u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev);
 
 #endif
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 926b1deb1116..95e3a984c69a 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -260,6 +260,9 @@ enum drm_panthor_dev_query_type {
 
 	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
 	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
+	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
 };
 
 /**
@@ -377,6 +380,25 @@ struct drm_panthor_csif_info {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_timestamp_info - Timestamp information
+ *
+ * Structure grouping all queryable information relating to the GPU timestamp.
+ */
+struct drm_panthor_timestamp_info {
+	/**
+	 * @timestamp_frequency: The frequency of the timestamp timer or 0 if
+	 * unknown.
+	 */
+	__u64 timestamp_frequency;
+
+	/** @current_timestamp: The current timestamp. */
+	__u64 current_timestamp;
+
+	/** @timestamp_offset: The offset of the timestamp timer. */
+	__u64 timestamp_offset;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */

base-commit: e75356ef5baef69e9f577023c453d91a902dc082
-- 
2.46.0

