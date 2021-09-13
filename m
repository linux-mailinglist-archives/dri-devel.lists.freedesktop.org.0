Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E251540A1B8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271846E2DF;
	Mon, 13 Sep 2021 23:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25686E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 23:48:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285516271"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285516271"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="543534424"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC v1 2/6] drm/atomic: Add support for release_fence and its
 associated property
Date: Mon, 13 Sep 2021 16:35:25 -0700
Message-Id: <20210913233529.3194401-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
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

Release_fence is very similar if not the same as out_fence; it
is an additional signalling mechanism for a page flip completion.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 43 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_crtc.c        |  2 ++
 drivers/gpu/drm/drm_mode_config.c |  6 +++++
 include/drm/drm_atomic.h          |  1 +
 include/drm/drm_file.h            |  9 +++++++
 include/drm/drm_mode_config.h     |  7 +++++
 6 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 6436677fa2f8..5d0bf3e525b3 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -367,6 +367,23 @@ static s32 __user *get_out_fence_for_crtc(struct drm_atomic_state *state,
 	return fence_ptr;
 }
 
+static void set_release_fence_for_crtc(struct drm_atomic_state *state,
+				   struct drm_crtc *crtc, s32 __user *fence_ptr)
+{
+	state->crtcs[drm_crtc_index(crtc)].release_fence_ptr = fence_ptr;
+}
+
+static s32 __user *get_release_fence_for_crtc(struct drm_atomic_state *state,
+					      struct drm_crtc *crtc)
+{
+	s32 __user *fence_ptr;
+
+	fence_ptr = state->crtcs[drm_crtc_index(crtc)].release_fence_ptr;
+	state->crtcs[drm_crtc_index(crtc)].release_fence_ptr = NULL;
+
+	return fence_ptr;
+}
+
 static int set_out_fence_for_connector(struct drm_atomic_state *state,
 					struct drm_connector *connector,
 					s32 __user *fence_ptr)
@@ -482,6 +499,16 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 			return -EFAULT;
 
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
+	} else if (property == config->prop_release_fence_ptr) {
+		s32 __user *fence_ptr = u64_to_user_ptr(val);
+
+		if (!fence_ptr)
+			return 0;
+
+		if (put_user(-1, fence_ptr))
+			return -EFAULT;
+
+		set_release_fence_for_crtc(state->state, crtc, fence_ptr);
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
 	} else if (crtc->funcs->atomic_set_property) {
@@ -519,6 +546,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
+	else if (property == config->prop_release_fence_ptr)
+		*val = 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
 	else if (crtc->funcs->atomic_get_property)
@@ -1185,7 +1214,7 @@ static int prepare_signaling(struct drm_device *dev,
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct dma_fence *fence;
-		s32 __user *fence_ptr;
+		s32 __user *fence_ptr, *rel_fence_ptr;
 
 		fence_ptr = get_out_fence_for_crtc(crtc_state->state, crtc);
 
@@ -1220,9 +1249,19 @@ static int prepare_signaling(struct drm_device *dev,
 			if (IS_ERR(fence))
 				return PTR_ERR(fence);
 
+			crtc_state->event->base.fence = fence;
+		}
 
+		rel_fence_ptr = get_release_fence_for_crtc(crtc_state->state,
+							   crtc);
+		if (rel_fence_ptr) {
+			fence = crtc_create_out_fence(crtc, fence_state,
+						      rel_fence_ptr,
+						      num_fences);
+			if (IS_ERR(fence))
+				return PTR_ERR(fence);
 
-			crtc_state->event->base.fence = fence;
+			crtc_state->event->base.release_fence = fence;
 		}
 
 		c++;
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 26a77a735905..e682ac04f873 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -312,6 +312,8 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
 		drm_object_attach_property(&crtc->base, config->prop_mode_id, 0);
 		drm_object_attach_property(&crtc->base,
 					   config->prop_out_fence_ptr, 0);
+		drm_object_attach_property(&crtc->base,
+					   config->prop_release_fence_ptr, 0);
 		drm_object_attach_property(&crtc->base,
 					   config->prop_vrr_enabled, 0);
 	}
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37b4b9f0e468..fc1f5a8d2991 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -297,6 +297,12 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.prop_out_fence_ptr = prop;
 
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"RELEASE_FENCE_PTR", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.prop_release_fence_ptr = prop;
+
 	prop = drm_property_create_object(dev, DRM_MODE_PROP_ATOMIC,
 			"CRTC_ID", DRM_MODE_OBJECT_CRTC);
 	if (!prop)
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5c..00f5fad87757 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -177,6 +177,7 @@ struct __drm_crtcs_state {
 	struct drm_crtc_commit *commit;
 
 	s32 __user *out_fence_ptr;
+	s32 __user *release_fence_ptr;
 	u64 last_vblank_count;
 };
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index a3acb7ac3550..ba79e1765721 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -124,6 +124,15 @@ struct drm_pending_event {
 	 */
 	struct dma_fence *fence;
 
+	/**
+	 * @release_fence:
+	 *
+	 * Optional DMA fence that will be signalled by the drm driver to
+	 * indicate that all references on FBs associated with a page flip
+	 * can be dropped.
+	 */
+	struct dma_fence *release_fence;
+
 	/**
 	 * @file_priv:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 48b7de80daf5..12b964540069 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -642,6 +642,13 @@ struct drm_mode_config {
 	 * value of type s32, and then cast that pointer to u64.
 	 */
 	struct drm_property *prop_out_fence_ptr;
+	/**
+	 * @prop_release_fence_ptr: Sync File fd pointer that is used as an
+	 * additional flip completion signalling mechanism. Userspace should
+	 * provide a pointer to a value of type s32, and then cast that pointer
+	 * to u64.
+	 */
+	struct drm_property *prop_release_fence_ptr;
 	/**
 	 * @prop_crtc_id: Default atomic plane property to specify the
 	 * &drm_crtc.
-- 
2.30.2

