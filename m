Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADD05E5A53
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 06:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB0010E0E5;
	Thu, 22 Sep 2022 04:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0211D10E0E5;
 Thu, 22 Sep 2022 04:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663821817; x=1695357817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JGBXONMCuAb2nAaH12QB3wjj0vHdfYb7rYMUzhWVcBI=;
 b=TSA3BHyavGQhUIwSdgMNGaGuCYlZWEZ95Ula3ANbQHqowDvZPdFOdMZy
 RHVTj7MieFkUrVfo47XobYoxcUmMQbkO9rnzI/JjEuGD+C1xY5XHoAd/h
 O1qwmlJ/YdCrHk8fzfAKaTiQDCn3HYLeBm6kxE9tGCO5d1FqUUEcPCIsl
 T42BehfTtQ9BhqN5NNMQeoS5fYkbmhD8HGD85cfoieYP/EjIp5yZ+Z7ry
 GfLcb3Hb1E71GNB+dwNtJQ9hivU0YIqYYRZysO7TQjNKiUXRoZOHsP1Wi
 K39XQV+aY/f0KXTtvAVNu/JFgap4yxv5gezUaVpis0ZN1DnOPe0qj+qhX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280566563"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="280566563"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 21:43:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="948439502"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Sep 2022 21:43:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove unused function parameter
Date: Wed, 21 Sep 2022 21:43:11 -0700
Message-Id: <20220922044311.7361-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
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
Cc: chris@chris-wilson.co.uk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function parameter 'exclude' in funciton
i915_sw_fence_await_reservation() is not used.
Remove it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 ++---
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c       | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c              | 1 -
 drivers/gpu/drm/i915/i915_sw_fence.h              | 1 -
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index aaa6708256d5..ecb8d71d36c0 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1005,7 +1005,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		 */
 		if (intel_crtc_needs_modeset(crtc_state)) {
 			ret = i915_sw_fence_await_reservation(&state->commit_ready,
-							      old_obj->base.resv, NULL,
+							      old_obj->base.resv,
 							      false, 0,
 							      GFP_KERNEL);
 			if (ret < 0)
@@ -1039,8 +1039,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
-						      obj->base.resv, NULL,
-						      false,
+						      obj->base.resv, false,
 						      i915_fence_timeout(dev_priv),
 						      GFP_KERNEL);
 		if (ret < 0)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 0512afdd20d8..b3b398fe689c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -113,7 +113,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 		clflush = clflush_work_create(obj);
 	if (clflush) {
 		i915_sw_fence_await_reservation(&clflush->base.chain,
-						obj->base.resv, NULL, true,
+						obj->base.resv, true,
 						i915_fence_timeout(i915),
 						I915_FENCE_GFP);
 		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 6fc0d1b89690..cc2a8821d22a 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -571,7 +571,6 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 
 int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    struct dma_resv *resv,
-				    const struct dma_fence_ops *exclude,
 				    bool write,
 				    unsigned long timeout,
 				    gfp_t gfp)
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index 619fc5a22f0c..f752bfc7c6e1 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -91,7 +91,6 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 
 int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    struct dma_resv *resv,
-				    const struct dma_fence_ops *exclude,
 				    bool write,
 				    unsigned long timeout,
 				    gfp_t gfp);
-- 
2.21.0.rc0.32.g243a4c7e27

