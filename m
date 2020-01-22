Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37137144EBF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 10:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEDC6F43E;
	Wed, 22 Jan 2020 09:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E696F43E;
 Wed, 22 Jan 2020 09:31:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 01:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,349,1574150400"; d="scan'208";a="227619165"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 22 Jan 2020 01:31:23 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2] intel: drm_intel_bo_gem_create_from_* on platforms
 w/o HW tiling
Date: Wed, 22 Jan 2020 11:31:22 +0200
Message-Id: <20200122093122.15476-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.23.1
In-Reply-To: <20200120164343.2262-1-imre.deak@intel.com>
References: <20200120164343.2262-1-imre.deak@intel.com>
MIME-Version: 1.0
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
Cc: Eric Engestrom <eric@engestrom.ch>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platforms without a HW detiler doesn't support the get_tiling IOCTL.
Fix the drm_intel_bo_gem_create_from_* functions assuming the default
no-tiling, no-swizzling setting for the GEM buffer in this case.

v2:
- Add the missing gem handle IOCTL parameter. (Eric)

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Eric Engestrom <eric@engestrom.ch>
---
 intel/intel_bufmgr_gem.c | 43 +++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/intel/intel_bufmgr_gem.c b/intel/intel_bufmgr_gem.c
index fbf48730..ade13a4c 100644
--- a/intel/intel_bufmgr_gem.c
+++ b/intel/intel_bufmgr_gem.c
@@ -1069,6 +1069,28 @@ check_bo_alloc_userptr(drm_intel_bufmgr *bufmgr,
 					  tiling_mode, stride, size, flags);
 }
 
+static int get_tiling_mode(drm_intel_bufmgr_gem *bufmgr_gem,
+			   uint32_t gem_handle,
+			   uint32_t *tiling_mode,
+			   uint32_t *swizzle_mode)
+{
+	struct drm_i915_gem_get_tiling get_tiling = {
+		.handle = gem_handle,
+	};
+	int ret;
+
+	ret = drmIoctl(bufmgr_gem->fd,
+		       DRM_IOCTL_I915_GEM_GET_TILING,
+		       &get_tiling);
+	if (ret != 0 && errno != EOPNOTSUPP)
+		return ret;
+
+	*tiling_mode = get_tiling.tiling_mode;
+	*swizzle_mode = get_tiling.swizzle_mode;
+
+	return 0;
+}
+
 /**
  * Returns a drm_intel_bo wrapping the given buffer object handle.
  *
@@ -1084,7 +1106,6 @@ drm_intel_bo_gem_create_from_name(drm_intel_bufmgr *bufmgr,
 	drm_intel_bo_gem *bo_gem;
 	int ret;
 	struct drm_gem_open open_arg;
-	struct drm_i915_gem_get_tiling get_tiling;
 
 	/* At the moment most applications only have a few named bo.
 	 * For instance, in a DRI client only the render buffers passed
@@ -1146,16 +1167,11 @@ drm_intel_bo_gem_create_from_name(drm_intel_bufmgr *bufmgr,
 	HASH_ADD(name_hh, bufmgr_gem->name_table,
 		 global_name, sizeof(bo_gem->global_name), bo_gem);
 
-	memclear(get_tiling);
-	get_tiling.handle = bo_gem->gem_handle;
-	ret = drmIoctl(bufmgr_gem->fd,
-		       DRM_IOCTL_I915_GEM_GET_TILING,
-		       &get_tiling);
+	ret = get_tiling_mode(bufmgr_gem, bo_gem->gem_handle,
+			      &bo_gem->tiling_mode, &bo_gem->swizzle_mode);
 	if (ret != 0)
 		goto err_unref;
 
-	bo_gem->tiling_mode = get_tiling.tiling_mode;
-	bo_gem->swizzle_mode = get_tiling.swizzle_mode;
 	/* XXX stride is unknown */
 	drm_intel_bo_gem_set_in_aperture_size(bufmgr_gem, bo_gem, 0);
 	DBG("bo_create_from_handle: %d (%s)\n", handle, bo_gem->name);
@@ -2634,7 +2650,6 @@ drm_intel_bo_gem_create_from_prime(drm_intel_bufmgr *bufmgr, int prime_fd, int s
 	int ret;
 	uint32_t handle;
 	drm_intel_bo_gem *bo_gem;
-	struct drm_i915_gem_get_tiling get_tiling;
 
 	pthread_mutex_lock(&bufmgr_gem->lock);
 	ret = drmPrimeFDToHandle(bufmgr_gem->fd, prime_fd, &handle);
@@ -2688,15 +2703,11 @@ drm_intel_bo_gem_create_from_prime(drm_intel_bufmgr *bufmgr, int prime_fd, int s
 	bo_gem->has_error = false;
 	bo_gem->reusable = false;
 
-	memclear(get_tiling);
-	get_tiling.handle = bo_gem->gem_handle;
-	if (drmIoctl(bufmgr_gem->fd,
-		     DRM_IOCTL_I915_GEM_GET_TILING,
-		     &get_tiling))
+	ret = get_tiling_mode(bufmgr_gem, handle,
+			      &bo_gem->tiling_mode, &bo_gem->swizzle_mode);
+	if (ret)
 		goto err;
 
-	bo_gem->tiling_mode = get_tiling.tiling_mode;
-	bo_gem->swizzle_mode = get_tiling.swizzle_mode;
 	/* XXX stride is unknown */
 	drm_intel_bo_gem_set_in_aperture_size(bufmgr_gem, bo_gem, 0);
 
-- 
2.23.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
