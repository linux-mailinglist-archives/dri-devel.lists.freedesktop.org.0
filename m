Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F712C6583
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E131A6ED8F;
	Fri, 27 Nov 2020 12:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CE16ED8F;
 Fri, 27 Nov 2020 12:12:15 +0000 (UTC)
IronPort-SDR: w1b36wxSEBfWqVkoYZ/yMV6/QuTKO+TDmc82yoezYfXOfHxfXLywWIlSgrz5Ad4dB3D6WhucC3
 2DmLvJIzWW+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883848"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883848"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:15 -0800
IronPort-SDR: k4pJ2m81oaZKz2rOL/Ff7b5GdE5K+K3xaPORIJvyjmYQ2D9zVnnz6Aa9+9rxisvGso556tL/YV
 T6lZhPilltkA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030013"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:13 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 149/162] drm/i915: suspend/resume handling of perma-pinned
 objects
Date: Fri, 27 Nov 2020 12:07:05 +0000
Message-Id: <20201127120718.454037-150-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

The objects which are perma-pinned (like guc), use memcpy to evict these objects.
Since the objects are always have pinned pages, so can't use present existing
swapout/swapin functions.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 105 +++++++++++++++++++++++++++-----
 1 file changed, 89 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index eb5383e4a30b..c8af68227020 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1103,7 +1103,54 @@ static int i915_drm_prepare(struct drm_device *dev)
 	return 0;
 }
 
-static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
+static int i915_gem_perma_pinned_object_swapout(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct drm_i915_gem_object *dst;
+	int err = -EINVAL;
+
+	assert_object_held(obj);
+	dst = i915_gem_object_create_shmem(i915, obj->base.size);
+	if (IS_ERR(dst))
+		return PTR_ERR(dst);
+
+	i915_gem_object_lock_isolated(dst);
+	err = i915_gem_object_memcpy(dst, obj);
+	i915_gem_object_unlock(dst);
+
+	if (!err) {
+		obj->swapto = dst;
+		obj->evicted = true;
+	} else
+		i915_gem_object_put(dst);
+
+	return err;
+}
+
+static int i915_gem_perma_pinned_object_swapin(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_gem_object *src;
+	int err = -EINVAL;
+
+	assert_object_held(obj);
+	src = obj->swapto;
+
+	if (WARN_ON(!i915_gem_object_trylock(src)))
+		return -EBUSY;
+
+	err = i915_gem_object_memcpy(obj, src);
+	i915_gem_object_unlock(src);
+
+	if (!err) {
+		obj->swapto = NULL;
+		obj->evicted = false;
+		i915_gem_object_put(src);
+	}
+	return err;
+}
+
+static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend,
+				    bool perma_pin)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_object *obj;
@@ -1133,24 +1180,37 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
 				if (in_suspend) {
 					obj->swapto = NULL;
 					obj->evicted = false;
-					obj->do_swapping = true;
 
-					i915_gem_object_unbind(obj, 0);
+					ret = i915_gem_object_unbind(obj, 0);
+					if (ret || i915_gem_object_has_pinned_pages(obj)) {
+						if (!i915_gem_object_trylock(obj)) {
+							ret = -EBUSY;
+							goto next;
+						}
+						ret = i915_gem_perma_pinned_object_swapout(obj);
+						i915_gem_object_unlock(obj);
+						goto next;
+					}
 
+					obj->do_swapping = true;
 					ret = __i915_gem_object_put_pages(obj);
 					obj->do_swapping = false;
-					if (ret) {
-						/*
-						 * FIXME: internal ctx objects still pinned
-						 * returning as BUSY. Presently just evicting
-						 * the user objects, will fix it later
-						 */
+					if (ret)
 						obj->evicted = false;
-						ret = 0;
-					} else
+					else
 						obj->evicted = true;
 				} else {
-					if (obj->swapto && obj->evicted) {
+					if (i915_gem_object_has_pinned_pages(obj) && perma_pin) {
+						if (!i915_gem_object_trylock(obj)) {
+							ret = -EBUSY;
+							goto next;
+						}
+						ret = i915_gem_perma_pinned_object_swapin(obj);
+						/* FIXME: Where is this error message taken care of? */
+						i915_gem_object_unlock(obj);
+					}
+
+					if (obj->swapto && obj->evicted && !perma_pin) {
 						ret = i915_gem_object_pin_pages(obj);
 						if (ret) {
 							i915_gem_object_put(obj);
@@ -1160,7 +1220,10 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
 						}
 					}
 				}
+next:
 				mutex_lock(&mem->objects.lock);
+				if (ret)
+					break;
 			}
 			list_splice_tail(&still_in_list, &mem->objects.list);
 			mutex_unlock(&mem->objects.lock);
@@ -1228,7 +1291,7 @@ static int i915_drm_suspend(struct drm_device *dev)
 	intel_dp_mst_suspend(dev_priv);
 
 	if (HAS_LMEM(dev_priv))	{
-		ret = intel_dmem_evict_buffers(dev, true);
+		ret = intel_dmem_evict_buffers(dev, true, false);
 		if (ret)
 			return ret;
 
@@ -1410,6 +1473,14 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	drm_mode_config_reset(dev);
 
+	if (HAS_LMEM(dev_priv)) {
+		ret = intel_dmem_evict_buffers(dev, false, true);
+		if (ret) {
+			DRM_ERROR("perma pinned obj's failed with err=%d\n", ret);
+			return ret;
+		}
+	}
+
 	i915_gem_resume(dev_priv);
 
 	if (HAS_LMEM(dev_priv)) {
@@ -1419,9 +1490,11 @@ static int i915_drm_resume(struct drm_device *dev)
 		if (ret)
 			GEM_BUG_ON(ret);
 
-		ret = intel_dmem_evict_buffers(dev, false);
-		if (ret)
-			DRM_ERROR("i915_resume:i915_gem_object_pin_pages failed with err=%d\n", ret);
+		ret = intel_dmem_evict_buffers(dev, false, false);
+		if (ret) {
+			DRM_ERROR("gem_object_pin_pages failed with err=%d\n", ret);
+			return ret;
+		}
 	}
 
 	intel_modeset_init_hw(dev_priv);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
