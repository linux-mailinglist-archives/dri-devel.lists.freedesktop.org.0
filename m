Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ED25E6E8F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 23:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FCD10E3F5;
	Thu, 22 Sep 2022 21:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D763610E3F5;
 Thu, 22 Sep 2022 21:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882781; x=1695418781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j0rnanO5DtDk6IX8NhBjBPMFxk7d4qm/FF0j4kD2Vqs=;
 b=errQLkQJ/JqRvGKbeHs3AsBN7APojyuBMuQev/7R7QNb/VMHpTzlKg+0
 Oszlze/7XYaTtaZYXW7hJVvRukVFuszY2Aonzu+ixa6caY0M9zRqrS2lh
 0x/VcLo88JfxjU5Qhc+9THWVwdfFvHi7RENN8UrWFJBoaf3yGJut9rigv
 w0HeNBPkxDaV/1S8M4RlFC7j46tQQbwPiiiLKgeOgA/XED1eccW0KVayH
 9xiPZI7ZL43+Ly0+6MzNzsaKXYNSfIzUQP7a9oy6DNepQDvErICeN4TUy
 FPKVS86+IXJ81dhHkPpyYSD8z9Mcy2/zmLtHUPs97xKVJ6ZJMrQ9W5uch Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="326765793"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="326765793"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:39:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="615382020"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 22 Sep 2022 14:39:40 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove unused function parameter
Date: Thu, 22 Sep 2022 14:39:16 -0700
Message-Id: <20220922213916.12112-1-niranjana.vishwanathapura@intel.com>
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

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

