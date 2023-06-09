Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A190372993F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC5D10E6B0;
	Fri,  9 Jun 2023 12:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335DC10E6AD;
 Fri,  9 Jun 2023 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312721; x=1717848721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUBLkvTpbUMIeIekgGGrKHjYcQ/G0tZeuASBPvxWLeI=;
 b=mKNLG4GMDa+Ca4ISiF2w3gUsQpYGDmbRMgsYVMAWhwZMpis6wftQi8ux
 9XwytISSTZ68Hg9Cs1JUH+1/Ul4OpPKw7PdZniHfsmI1Km1m+MLaLL21O
 HziMjvaFVnll8ckgFbJrQBaK+yE1Q/m2fJ98sUORsfXX9MlERy3SzfImj
 3eWLv7++6ZTnjQllHt68gKSQb8aHkNwKQ+LjdGw1QNBqaal4jKazcR9wD
 G72VDUJWLG3jRgNoOVwvdBUgSQMHgeuqaw8tTTQkYMuhFEPvh5tYBW+uY
 eOlANIevNmHO1y+HPF5UChyXTqFpf/9kU620I4gNJUMi24mAhBSsqOKOj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356474760"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356474760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740150892"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="740150892"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.210.241])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:59 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm: Add drm_gem_prime_fd_to_handle_obj
Date: Fri,  9 Jun 2023 13:11:41 +0100
Message-Id: <20230609121143.1232420-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
References: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I need a new flavour of the drm_gem_prime_fd_to_handle helper, one which
will return a reference to a newly created GEM objects (if created), in
order to enable tracking of imported i915 GEM objects in the following
patch.

Minor code reshuffule and only trivial additions on top of
drm_gem_prime_fd_to_handle.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_prime.c | 41 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_prime.h     |  4 ++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d29dafce9bb0..ef75f67e3057 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -284,11 +284,12 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
 EXPORT_SYMBOL(drm_gem_dmabuf_release);
 
 /**
- * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
+ * drm_gem_prime_fd_to_handle_obj - PRIME import function for GEM drivers
  * @dev: drm_device to import into
  * @file_priv: drm file-private structure
  * @prime_fd: fd id of the dma-buf which should be imported
  * @handle: pointer to storage for the handle of the imported buffer object
+ * @objp: optional pointer in which reference to created GEM object can be returned
  *
  * This is the PRIME import function which must be used mandatorily by GEM
  * drivers to ensure correct lifetime management of the underlying GEM object.
@@ -297,9 +298,10 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
  *
  * Returns 0 on success or a negative error code on failure.
  */
-int drm_gem_prime_fd_to_handle(struct drm_device *dev,
-			       struct drm_file *file_priv, int prime_fd,
-			       uint32_t *handle)
+int drm_gem_prime_fd_to_handle_obj(struct drm_device *dev,
+				   struct drm_file *file_priv, int prime_fd,
+				   uint32_t *handle,
+				   struct drm_gem_object **objp)
 {
 	struct dma_buf *dma_buf;
 	struct drm_gem_object *obj;
@@ -336,7 +338,8 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 
 	/* _handle_create_tail unconditionally unlocks dev->object_name_lock. */
 	ret = drm_gem_handle_create_tail(file_priv, obj, handle);
-	drm_gem_object_put(obj);
+	if (!objp)
+		drm_gem_object_put(obj);
 	if (ret)
 		goto out_put;
 
@@ -348,6 +351,9 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 
 	dma_buf_put(dma_buf);
 
+	if (objp)
+		*objp = obj;
+
 	return 0;
 
 fail:
@@ -356,6 +362,8 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 	 */
 	drm_gem_handle_delete(file_priv, *handle);
 	dma_buf_put(dma_buf);
+	if (objp)
+		drm_gem_object_put(obj);
 	return ret;
 
 out_unlock:
@@ -365,6 +373,29 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 	dma_buf_put(dma_buf);
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_prime_fd_to_handle_obj);
+
+/**
+ * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
+ * @dev: drm_device to import into
+ * @file_priv: drm file-private structure
+ * @prime_fd: fd id of the dma-buf which should be imported
+ * @handle: pointer to storage for the handle of the imported buffer object
+ *
+ * This is the PRIME import function which must be used mandatorily by GEM
+ * drivers to ensure correct lifetime management of the underlying GEM object.
+ * The actual importing of GEM object from the dma-buf is done through the
+ * &drm_driver.gem_prime_import driver callback.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_gem_prime_fd_to_handle(struct drm_device *dev,
+			       struct drm_file *file_priv, int prime_fd,
+			       uint32_t *handle)
+{
+	return drm_gem_prime_fd_to_handle_obj(dev, file_priv, prime_fd, handle,
+					      NULL);
+}
 EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
 
 int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 2a1d01e5b56b..10d145ce6586 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -69,6 +69,10 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
 
 int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
+int drm_gem_prime_fd_to_handle_obj(struct drm_device *dev,
+				   struct drm_file *file_priv, int prime_fd,
+				   uint32_t *handle,
+				   struct drm_gem_object **obj);
 int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
 			       int *prime_fd);
-- 
2.39.2

