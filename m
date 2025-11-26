Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D1AC89D60
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EB410E5D6;
	Wed, 26 Nov 2025 12:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Bh9Nb75W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CEA10E5CF;
 Wed, 26 Nov 2025 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764161116;
 bh=B5OZ4b9OJPPPMmGadRhX2SYK9KhXIjDiW/v4epBvtmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bh9Nb75W8DOKHgH4GleJb+HheDbSvrJV9iF39/WSUSgtNb6+4kc1hEZNv6Ejid0g4
 PA5+t8VfvQEG2oazHcHYpAnU4XpYw3bMg/CD+SIOLn93wIcLrubXJkcO5spIa/dSz2
 hIv9s5m6IaUyT2hX3HOBMwOhA1Bdpr67horjNj2zgtigWylSctm9yaczOkXLP2Q5y/
 2n2Myy1E37g0SMwO7nIQK1u611rBkd2vAvJbzHYunpoCMhtLF1rqP6VcnKv32mUH6X
 eAJjAp92Pzipue9P5zizM1Olwmnxcgt1OOEb8UhZXqoSHBfpYmSXQ4lYd7aMocTH9t
 mh4pO7vXCzlsQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 440A517E142F;
 Wed, 26 Nov 2025 13:45:15 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v6 08/16] drm/panthor: Add an ioctl to query BO flags
Date: Wed, 26 Nov 2025 13:44:47 +0100
Message-ID: <20251126124455.3656651-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126124455.3656651-1-boris.brezillon@collabora.com>
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is useful when importing BOs, so we can know about cacheability
and flush the caches when needed.

We can also know when the buffer comes from a different subsystem and
take proper actions (avoid CPU mappings, or do kernel-based syncs
instead of userland cache flushes).

v2:
- New commit

v3:
- Add Steve's R-b

v4:
- No changes

v5:
- No changes

v6:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 24 +++++++++++
 include/uapi/drm/panthor_drm.h        | 57 +++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 7aba9e5d2579..5df874538e88 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1434,6 +1434,29 @@ static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
 	return ret;
 }
 
+static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
+				       struct drm_file *file)
+{
+	struct drm_panthor_bo_query_info *args = data;
+	struct panthor_gem_object *bo;
+	struct drm_gem_object *obj;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	bo = to_panthor_bo(obj);
+	args->pad = 0;
+	args->create_flags = bo->flags;
+
+	args->extra_flags = 0;
+	if (drm_gem_is_imported(&bo->base.base))
+		args->extra_flags |= DRM_PANTHOR_BO_IS_IMPORTED;
+
+	drm_gem_object_put(obj);
+	return 0;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1509,6 +1532,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(BO_QUERY_INFO, bo_query_info, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index bb12760abe99..7eec9f922183 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -147,6 +147,13 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
 	DRM_PANTHOR_BO_SYNC,
+
+	/**
+	 * @DRM_PANTHOR_BO_QUERY_INFO: Query information about a BO.
+	 *
+	 * This is useful for imported BOs.
+	 */
+	DRM_PANTHOR_BO_QUERY_INFO,
 };
 
 /**
@@ -1123,6 +1130,54 @@ struct drm_panthor_bo_sync {
 	struct drm_panthor_obj_array ops;
 };
 
+/**
+ * enum drm_panthor_bo_extra_flags - Set of flags returned on a BO_QUERY_INFO request
+ *
+ * Those are flags reflecting BO properties that are not directly coming from the flags
+ * passed are creation time, or information on BOs that were imported from other drivers.
+ */
+enum drm_panthor_bo_extra_flags {
+	/**
+	 * @DRM_PANTHOR_BO_IS_IMPORTED: BO has been imported from an external driver.
+	 *
+	 * Note that imported dma-buf handles are not flagged as imported if they
+	 * where exported by panthor. Only buffers that are coming from other drivers
+	 * (dma heaps, other GPUs, display controllers, V4L, ...).
+	 *
+	 * It's also important to note that all imported BOs are mapped cached and can't
+	 * be considered IO-coherent even if the GPU is. This means they require explicit
+	 * syncs that must go through the DRM_PANTHOR_BO_SYNC ioctl (userland cache
+	 * maintenance is not allowed in that case, because extra operations might be
+	 * needed to make changes visible to the CPU/device, like buffer migration when the
+	 * exporter is a GPU with its own VRAM).
+	 */
+	DRM_PANTHOR_BO_IS_IMPORTED = (1 << 0),
+};
+
+/**
+ * struct drm_panthor_bo_query_info - Query BO info
+ */
+struct drm_panthor_bo_query_info {
+	/** @handle: Handle of the buffer object to query flags on. */
+	__u32 handle;
+
+	/**
+	 * @extra_flags: Combination of enum drm_panthor_bo_extra_flags flags.
+	 */
+	__u32 extra_flags;
+
+	/**
+	 * @create_flags: Flags passed at creation time.
+	 *
+	 * Combination of enum drm_panthor_bo_flags flags.
+	 * Will be zero if the buffer comes from a different driver.
+	 */
+	__u32 create_flags;
+
+	/** @pad: Will be zero on return. */
+	__u32 pad;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1171,6 +1226,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
 	DRM_IOCTL_PANTHOR_BO_SYNC =
 		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
+	DRM_IOCTL_PANTHOR_BO_QUERY_INFO =
+		DRM_IOCTL_PANTHOR(WR, BO_QUERY_INFO, bo_query_info),
 };
 
 #if defined(__cplusplus)
-- 
2.51.1

