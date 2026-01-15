Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F292CD251E4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 15:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D88E10E77A;
	Thu, 15 Jan 2026 14:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4ehvF9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CB810E77A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768489154; x=1800025154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0MwqGGj8i+ORC/wPoW947Zv06SkZYdZXU/NQHf1Nnmk=;
 b=a4ehvF9s7sYcM7iqKNb16GFTCRM6ctS8zCbLzvm6Wu5Z93sDCpam8PCA
 WEGXnFdAwRsKy4o3zoZGhBmuZFgvGL9E4Uym4R/f+MwxIHmVtp6bHv3Xb
 7RefS+ARunqb0Y0QCKufYnUg7VjH8OoT4Tngn9r3BexXjpMgGoPtW3Hhq
 5yZuwcUoAA0mCGyc8eKOOkJ0bCJ0OcViHCxPTnV5UJfi0nMjLtXtTtlPF
 8770CguI23rteKVKXRla/KhQPtvd4QKic7sXom7gLvYVeM+NpUuoi2sI5
 T9hC9767ohL0naclvePwgxcwjPzLpj1ggD78VkLiChKsWf7J1CD8S0tmn w==;
X-CSE-ConnectionGUID: GKo/RKMFRGuXFefq57ttBw==
X-CSE-MsgGUID: ztsnPkH2RWK3AMekrJjcxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="95272555"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="95272555"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:59:14 -0800
X-CSE-ConnectionGUID: skcVhNaPSSKSY2lbiA1VPg==
X-CSE-MsgGUID: WLz+egIARbWn5OnPb0SUKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209831007"
Received: from fkassabr-vm-u24.iil.labsad.intel.com ([10.111.56.80])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:59:13 -0800
From: Farah Kassabri <farah.kassabri@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	ilia.levi@intel.com
Subject: [PATCH] drm/gem: add helper to detect self-imported PRIME dma-bufs
Date: Thu, 15 Jan 2026 16:58:57 +0200
Message-ID: <20260115145857.911466-1-farah.kassabri@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Add drm_gem_prime_self_import() to detect and handle the case where a
PRIME dma-buf being imported was exported by the same DRM device.

When the dma-buf originates from the importing device and uses the
expected dma-buf ops, the helper returns the associated GEM object and
takes an extra reference on it. This allows drivers to bypass the
generic PRIME import path and avoid taking an additional reference on
the dma-buf file.

The helper simplifies self-import handling and avoids duplication of
this pattern across DRM drivers.

Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
---
 drivers/gpu/drm/drm_prime.c | 44 ++++++++++++++++++++++++++++++-------
 include/drm/drm_prime.h     |  5 ++++-
 2 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 21809a82187b..bf0bd111fb79 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -974,15 +974,9 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	int ret;
 
-	if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
-		/*
-		 * Importing dmabuf exported from our own gem increases
-		 * refcount on gem itself instead of f_count of dmabuf.
-		 */
-		obj = dma_buf->priv;
-		drm_gem_object_get(obj);
+	obj = drm_gem_prime_self_import(dev, dma_buf, &drm_gem_prime_dmabuf_ops);
+	if (obj)
 		return obj;
-	}
 
 	if (!dev->driver->gem_prime_import_sg_table)
 		return ERR_PTR(-EINVAL);
@@ -1116,3 +1110,37 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
 	dma_buf_put(dma_buf);
 }
 EXPORT_SYMBOL(drm_prime_gem_destroy);
+
+/**
+ * drm_gem_prime_self_import - Attempt to import a dma-buf exported by this DRM device
+ * @dev: DRM device performing the import
+ * @dma_buf: dma-buf to import
+ * @expected_ops: dma-buf ops used by this driver
+ *
+ * If @dma_buf was exported by this DRM device using @expected_ops, return the
+ * corresponding GEM object and take an extra reference on it. In this case,
+ * the import avoids taking a reference on the dma-buf file and instead bumps
+ * the GEM object's refcount directly.
+ *
+ * Returns:
+ * A referenced GEM object on success, or %NULL if the dma-buf was not exported
+ * by this device or does not match @expected_ops.
+ */
+struct drm_gem_object *drm_gem_prime_self_import(struct drm_device *dev,
+						 struct dma_buf *dma_buf,
+						 const struct dma_buf_ops *expected_ops)
+{
+	struct drm_gem_object *obj;
+
+	if (dma_buf->ops != expected_ops)
+		return NULL;
+
+	obj = dma_buf->priv;
+	if (!obj || obj->dev != dev)
+		return NULL;
+
+	drm_gem_object_get(obj);
+
+	return obj;
+}
+EXPORT_SYMBOL(drm_gem_prime_self_import);
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index f50f862f0d8b..ab293b5dcca3 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -61,6 +61,7 @@ enum dma_data_direction;
 struct drm_device;
 struct drm_gem_object;
 struct drm_file;
+struct dma_buf_ops;
 
 /* core prime functions */
 struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
@@ -115,5 +116,7 @@ int drm_prime_sg_to_page_array(struct sg_table *sgt, struct page **pages,
 			       int max_pages);
 int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
 				   int max_pages);
-
+struct drm_gem_object *drm_gem_prime_self_import(struct drm_device *dev,
+						 struct dma_buf *dma_buf,
+						 const struct dma_buf_ops *expected_ops);
 #endif /* __DRM_PRIME_H__ */
-- 
2.43.0

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

