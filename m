Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A93D3943D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 11:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A666F10E20E;
	Sun, 18 Jan 2026 10:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8racZWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38A310E20E
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768732519; x=1800268519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fc5fY3cc6f/Am0DtQn1mfKj8uzQQuXVSWimgp+g/jfI=;
 b=J8racZWhLK622h3EChzsABcL8HFMUL9CVeuvJb4dIWsyhn0gjs+7N+Iy
 Ksn9jPZJ+FyBS7pR0DBvBx/EgJmhwU7PKjJPwcj9IxUAj8dgtyC96Dg+w
 kPgkLGrp9MDaYkVW3Qlu89yn8vudTRSEqGTf4VD9OVFYFJDokTYHpm1xM
 ET45PFsd2tbiYgH6KbLM3QLYu1LLIxA7XQk6diRTnJvE8Yi/cwIz1Pb+A
 wveFxjJiCebnaQOQFSDRtANfD5tTE0ct5K6U49rszRY1Z5TIFZOHBll9v
 35r/kGlWq8Gpi7+2cX2jin+dZFx3MDWrFMpy1Pl71T0VZFIC8zFIgsjzC Q==;
X-CSE-ConnectionGUID: L8pF3V8rR62kcVW+ykmkVA==
X-CSE-MsgGUID: JSaPP9/wQ5W6LQBLuc4TKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="80610082"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="80610082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 02:35:18 -0800
X-CSE-ConnectionGUID: jiX1APw9TMqBYD4ehICdLw==
X-CSE-MsgGUID: nV6pGx8zRuqZjed95dZSww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205657130"
Received: from dberech-mobl.ger.corp.intel.com (HELO
 soc-PF53RESW.clients.intel.com) ([10.245.130.193])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 02:35:17 -0800
From: Farah Kassabri <farah.kassabri@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	ilia.levi@intel.com
Subject: [PATCH] drm/gem: add helper to detect self-imported PRIME dma-bufs
Date: Sun, 18 Jan 2026 12:35:02 +0200
Message-Id: <20260118103502.5162-1-farah.kassabri@intel.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/gpu/drm/drm_prime.c | 48 ++++++++++++++++++++++++++++++-------
 include/drm/drm_prime.h     |  5 +++-
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 21809a82187b..6c9ad3957f42 100644
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
@@ -1116,3 +1110,41 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
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
+	/*
+	 * Importing dmabuf exported from our own gem increases
+	 * refcount on gem itself instead of f_count of dmabuf.
+	 */
+	drm_gem_object_get(obj);
+
+	return obj;
+}
+EXPORT_SYMBOL(drm_gem_prime_self_import);
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index f50f862f0d8b..4cdb543b9eb7 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -54,6 +54,7 @@ struct device;
 struct dma_buf_export_info;
 struct dma_buf;
 struct dma_buf_attachment;
+struct dma_buf_ops;
 struct iosys_map;
 
 enum dma_data_direction;
@@ -108,6 +109,9 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 						struct device *attach_dev);
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf);
+struct drm_gem_object *drm_gem_prime_self_import(struct drm_device *dev,
+						 struct dma_buf *dma_buf,
+						 const struct dma_buf_ops *expected_ops);
 
 void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg);
 
@@ -115,5 +119,4 @@ int drm_prime_sg_to_page_array(struct sg_table *sgt, struct page **pages,
 			       int max_pages);
 int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
 				   int max_pages);
-
 #endif /* __DRM_PRIME_H__ */
-- 
2.43.0

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

