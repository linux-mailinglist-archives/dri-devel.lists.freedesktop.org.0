Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0096D6D4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 13:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B94210E0D7;
	Thu,  5 Sep 2024 11:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="Ym9zbzFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3845C10E100
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 11:14:10 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725534841; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LwMdIyFw98pkF8PckExUs/RxaClSNRPk8OwYaEfQsbA/Lfvd53FhF9VjMZP5ix2anux679DW8Bg3COwTX43TuoHxSJlj50gEKTmACfY210+PfKhXBalf4p5GtcdIEMMG5y7nV9T64Jhp9uFXj1CrtfseJLhHwBaPWiV99a7d5do=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725534841;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NBGO/wd9GUl4PZyD8FAxAuruxJAxsPb2IZdrKettOI4=; 
 b=T8bDlogkFPYi+IN2ObW7QgxZuQeJ4B4+dQk5le/OGv67Y45zV/WFaWmJe/dElogpDVitrlYjlTFHsszvdIjMnackQx6FXeecYFfG2IYV4+J6wQscaqHp7J8q4/Dmdn9ZkT1yaRLPRjXEqt8OovTs65q7vPJXxk9JcnWpgetZrDo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725534841; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NBGO/wd9GUl4PZyD8FAxAuruxJAxsPb2IZdrKettOI4=;
 b=Ym9zbzFzGM1IBFI4y8q3fsMjmXOYljhZmN6yI7oIg/isbATbJ90TnR6BM8S+NvJX
 gcbwqIH7z5lMmH3CK+RwxyimvgctPHe+bswXpzciFSpth9I9KA5UY12K5K+3hCpDWDc
 DG2CbU48bOEZ5JjNPxFfcjod9vxsL/xZazryuAQw=
Received: by mx.zohomail.com with SMTPS id 1725534840278552.1455558587656;
 Thu, 5 Sep 2024 04:14:00 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query
Date: Thu,  5 Sep 2024 13:13:38 +0200
Message-ID: <20240905111338.95714-3-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905111338.95714-1-mary.guillemard@collabora.com>
References: <20240905111338.95714-1-mary.guillemard@collabora.com>
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

Expose allowed group priorities with a new device query.

This new uAPI will be used in Mesa to properly report what priorities a
user can use for EGL_IMG_context_priority.

Since this extends the uAPI and because userland needs a way to
advertise priorities accordingly, this also bumps the driver minor
version.

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 61 ++++++++++++++++++---------
 include/uapi/drm/panthor_drm.h        | 38 +++++++++++++++++
 2 files changed, 80 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 7b1db2adcb4c..f85aa2d99f09 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -170,6 +170,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_timestamp_info, current_timestamp), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_group_priorities_info, pad), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
@@ -777,11 +778,41 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 	return 0;
 }
 
+static int group_priority_permit(struct drm_file *file,
+				 u8 priority)
+{
+	/* Ensure that priority is valid */
+	if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
+		return -EINVAL;
+
+	/* Medium priority and below are always allowed */
+	if (priority <= PANTHOR_GROUP_PRIORITY_MEDIUM)
+		return 0;
+
+	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
+	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
+		return 0;
+
+	return -EACCES;
+}
+
+static void panthor_query_group_priorities_info(struct drm_file *file,
+						struct drm_panthor_group_priorities_info *arg)
+{
+	int prio;
+
+	for (prio = PANTHOR_GROUP_PRIORITY_REALTIME; prio >= 0; prio--) {
+		if (!group_priority_permit(file, prio))
+			arg->allowed_mask |= 1 << prio;
+	}
+}
+
 static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 	struct drm_panthor_dev_query *args = data;
 	struct drm_panthor_timestamp_info timestamp_info;
+	struct drm_panthor_group_priorities_info priorities_info;
 	int ret;
 
 	if (!args->pointer) {
@@ -798,6 +829,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(timestamp_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO:
+			args->size = sizeof(priorities_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -818,6 +853,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, timestamp_info);
 
+	case DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO:
+		panthor_query_group_priorities_info(file, &priorities_info);
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
+
 	default:
 		return -EINVAL;
 	}
@@ -1037,24 +1076,6 @@ static int panthor_ioctl_group_destroy(struct drm_device *ddev, void *data,
 	return panthor_group_destroy(pfile, args->group_handle);
 }
 
-static int group_priority_permit(struct drm_file *file,
-				 u8 priority)
-{
-	/* Ensure that priority is valid */
-	if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
-		return -EINVAL;
-
-	/* Medium priority and below are always allowed */
-	if (priority <= PANTHOR_GROUP_PRIORITY_MEDIUM)
-		return 0;
-
-	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
-	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
-		return 0;
-
-	return -EACCES;
-}
-
 static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 				      struct drm_file *file)
 {
@@ -1436,6 +1457,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * PanCSF driver version:
  * - 1.0 - initial interface
  * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
+ * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
+ *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1449,7 +1472,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.desc = "Panthor DRM driver",
 	.date = "20230801",
 	.major = 1,
-	.minor = 1,
+	.minor = 2,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 011a555e4674..520c467f946d 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -263,6 +263,11 @@ enum drm_panthor_dev_query_type {
 
 	/** @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information. */
 	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO,
+
+	/**
+	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
+	 */
+	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
 };
 
 /**
@@ -399,6 +404,39 @@ struct drm_panthor_timestamp_info {
 	__u64 timestamp_offset;
 };
 
+/**
+ * enum drm_panthor_allowed_group_priority - Allowed group priority flags
+ */
+enum drm_panthor_group_allow_priority_flags {
+	/** @PANTHOR_GROUP_ALLOW_PRIORITY_LOW: Allow low priority group. */
+	PANTHOR_GROUP_ALLOW_PRIORITY_LOW = 1 << 0,
+
+	/** @PANTHOR_GROUP_ALLOW_PRIORITY_MEDIUM: Allow medium priority group. */
+	PANTHOR_GROUP_ALLOW_PRIORITY_MEDIUM = 1 << 1,
+
+	/** @PANTHOR_GROUP_ALLOW_PRIORITY_HIGH: Allow high priority group. */
+	PANTHOR_GROUP_ALLOW_PRIORITY_HIGH = 1 << 2,
+
+	/** @PANTHOR_GROUP_ALLOW_PRIORITY_REALTIME: Allow realtime priority group. */
+	PANTHOR_GROUP_ALLOW_PRIORITY_REALTIME = 1 << 3,
+};
+
+/**
+ * struct drm_panthor_group_priorities_info - Group priorities information
+ *
+ * Structure grouping all queryable information relating to the allowed group priorities.
+ */
+struct drm_panthor_group_priorities_info {
+	/**
+	 * @allowed_mask: A mask of drm_panthor_group_allow_priority_flags flags containing the
+	 * allowed group priorities.
+	 */
+	__u8 allowed_mask;
+
+	/** @pad: Padding fields, MBZ. */
+	__u8 pad[3];
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
-- 
2.46.0

