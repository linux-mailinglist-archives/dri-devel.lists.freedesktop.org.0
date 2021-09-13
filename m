Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C366840A1B4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CDF6E2D5;
	Mon, 13 Sep 2021 23:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0FF6E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 23:48:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285516270"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285516270"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="543534421"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC v1 1/6] drm/atomic: Move out_fence creation/setup into a
 separate function
Date: Mon, 13 Sep 2021 16:35:24 -0700
Message-Id: <20210913233529.3194401-2-vivek.kasireddy@intel.com>
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

This is needed to leverage the out_fence machinery for similar but
additional singalling mechanisms.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 57 ++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 909f31833181..6436677fa2f8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1135,6 +1135,38 @@ static int setup_out_fence(struct drm_out_fence_state *fence_state,
 	return 0;
 }
 
+static struct dma_fence *crtc_create_out_fence(struct drm_crtc *crtc,
+				struct drm_out_fence_state **fence_state,
+				s32 __user *fence_ptr,
+				unsigned int *num_fences)
+{
+	struct dma_fence *fence;
+	struct drm_out_fence_state *f;
+	int ret;
+
+	f = krealloc(*fence_state, sizeof(**fence_state) *
+		     (*num_fences + 1), GFP_KERNEL);
+	if (!f)
+		return ERR_PTR(-ENOMEM);
+
+	memset(&f[*num_fences], 0, sizeof(*f));
+
+	f[*num_fences].out_fence_ptr = fence_ptr;
+	*fence_state = f;
+
+	fence = drm_crtc_create_fence(crtc);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	ret = setup_out_fence(&f[(*num_fences)++], fence);
+	if (ret) {
+		dma_fence_put(fence);
+		return ERR_PTR(ret);
+	}
+
+	return fence;
+}
+
 static int prepare_signaling(struct drm_device *dev,
 				  struct drm_atomic_state *state,
 				  struct drm_mode_atomic *arg,
@@ -1152,6 +1184,7 @@ static int prepare_signaling(struct drm_device *dev,
 		return 0;
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct dma_fence *fence;
 		s32 __user *fence_ptr;
 
 		fence_ptr = get_out_fence_for_crtc(crtc_state->state, crtc);
@@ -1182,28 +1215,12 @@ static int prepare_signaling(struct drm_device *dev,
 		}
 
 		if (fence_ptr) {
-			struct dma_fence *fence;
-			struct drm_out_fence_state *f;
-
-			f = krealloc(*fence_state, sizeof(**fence_state) *
-				     (*num_fences + 1), GFP_KERNEL);
-			if (!f)
-				return -ENOMEM;
-
-			memset(&f[*num_fences], 0, sizeof(*f));
+			fence = crtc_create_out_fence(crtc, fence_state,
+						      fence_ptr, num_fences);
+			if (IS_ERR(fence))
+				return PTR_ERR(fence);
 
-			f[*num_fences].out_fence_ptr = fence_ptr;
-			*fence_state = f;
 
-			fence = drm_crtc_create_fence(crtc);
-			if (!fence)
-				return -ENOMEM;
-
-			ret = setup_out_fence(&f[(*num_fences)++], fence);
-			if (ret) {
-				dma_fence_put(fence);
-				return ret;
-			}
 
 			crtc_state->event->base.fence = fence;
 		}
-- 
2.30.2

