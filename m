Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C694AD74
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2EE10E140;
	Wed,  7 Aug 2024 15:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="k1j6QRuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2024 15:56:11 UTC
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F25010E140
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:56:11 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723045260; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DU7OWCqAz0FZT/u3wc42RXAsw0Y3kv2Mnvndu74RsKFT4/C34hkMFAC442JfbX4G+CQonDv+yU2t7REa+wjN801vGguonBdmmut3XplBtfg7kNrng7FC+5zMCFBWkV9wNiOJOg+Wjoc7bSA3D/hUvDGjKXAurjbDloi3sPMqnnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723045260;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WQoGa0XBu3b69uiy2cyi8oxe0wNEc8ohUf3Wgv4UvEo=; 
 b=WBLOFUapwgIKvPbISQEjEwbGH7gec4eedvf7ZSJIMNQNTdiH5tMLvAELLb376e1KNUOWHnlkcgMnNeTzssfo1kJhi2DZp+xreY3op/VSehReB1QFypTuZRr/Jp657n3hXte+fDnfFTmXVBlBg0MiOM3M1vVEbVBgt3NoYLt7sf8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723045260; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WQoGa0XBu3b69uiy2cyi8oxe0wNEc8ohUf3Wgv4UvEo=;
 b=k1j6QRuJ0rdLBf2Vz7ikCt8jhHFUeKVaQs/MwSUKnSNWeXNjBI+i9X4vaEiuaSk5
 gOtqZfKXhFFbIlKbxSsXblLRBnsO+cxeDesJQJ7sGAXdoALJKw0OW+Fwv+Lj//8n2Fk
 MnDcCF0P6tWL6yZOkR1QMZRTTJfzXDoGrn8hn+D4=
Received: by mx.zohomail.com with SMTPS id 1723045257902301.0406463087128;
 Wed, 7 Aug 2024 08:40:57 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Date: Wed,  7 Aug 2024 17:35:54 +0200
Message-ID: <20240807153553.142325-2-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.45.2
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

Expose system timestamp and frequency supported by the GPU with a new
device query.

Mali uses the generic arch timer as GPU system time so we currently
wire cntvct_el0 and cntfrq_el0 respectively to a new device query.
We could have directly read those values from userland but handling
this here allows us to be future proof in case of architectural changes
or erratas related to timers for example.

This new uAPI will be used in Mesa to implement timestamp queries and
VK_KHR_calibrated_timestamps.

Since this extends the uAPI and because userland needs a way to advertise
those features conditionally, this also bumps the driver minor version.

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 23 ++++++++++++++++++++++-
 include/uapi/drm/panthor_drm.h        | 16 ++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index b8a84f26b3ef..4d62ff3fbe03 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -164,6 +164,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 	_Generic(_obj_name, \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
@@ -750,10 +751,21 @@ static void panthor_submit_ctx_cleanup(struct panthor_submit_ctx *ctx,
 	kvfree(ctx->jobs);
 }
 
+static void panthor_ioctl_query_timestamp(struct drm_panthor_timestamp_info *arg)
+{
+#ifdef CONFIG_ARM_ARCH_TIMER
+	arg->timestamp_frequency = arch_timer_get_cntfrq();
+	arg->current_timestamp = __arch_counter_get_cntvct();
+#else
+	memset(arg, 0, sizeof(*arg));
+#endif
+}
+
 static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 	struct drm_panthor_dev_query *args = data;
+	struct drm_panthor_timestamp_info timestamp_info;
 
 	if (!args->pointer) {
 		switch (args->type) {
@@ -765,6 +777,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(ptdev->csif_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO:
+			args->size = sizeof(timestamp_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -777,6 +793,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
 
+	case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO:
+		panthor_ioctl_query_timestamp(&timestamp_info);
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, timestamp_info);
+
 	default:
 		return -EINVAL;
 	}
@@ -1372,6 +1392,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
 /*
  * PanCSF driver version:
  * - 1.0 - initial interface
+ * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1385,7 +1406,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.desc = "Panthor DRM driver",
 	.date = "20230801",
 	.major = 1,
-	.minor = 0,
+	.minor = 1,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index aaed8e12ad0b..8d39a2f91769 100644
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
@@ -377,6 +380,19 @@ struct drm_panthor_csif_info {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_timestamp_info - Timestamp information
+ *
+ * Structure grouping all queryable information relating to the GPU timestamp.
+ */
+struct drm_panthor_timestamp_info {
+	/** @timestamp_frequency: The frequency of the timestamp timer. */
+	__u64 timestamp_frequency;
+
+	/** @current_timestamp: The current timestamp. */
+	__u64 current_timestamp;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */

base-commit: f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452
-- 
2.45.2

