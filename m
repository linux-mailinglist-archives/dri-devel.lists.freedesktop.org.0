Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB03CA749
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3176E8A6;
	Thu, 15 Jul 2021 18:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C086E8A6;
 Thu, 15 Jul 2021 18:50:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210657870"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="210657870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 11:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="495603414"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 15 Jul 2021 11:50:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Jul 2021 21:50:05 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Extract intel_crtc_initial_commit()
Date: Thu, 15 Jul 2021 21:49:53 +0300
Message-Id: <20210715184954.7794-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
References: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract intel_crtc_initial_commit() from intel_initial_commit().
Should make subsequent changes a bit less convoluted.

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 96 +++++++++++---------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 65ddb6ca16e6..3718399c4c2f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12129,12 +12129,60 @@ static void intel_update_fdi_pll_freq(struct drm_i915_private *dev_priv)
 	drm_dbg(&dev_priv->drm, "FDI PLL freq=%d\n", dev_priv->fdi_pll_freq);
 }
 
+static int intel_crtc_initial_commit(struct intel_atomic_state *state,
+				     struct intel_crtc *crtc)
+{
+	struct intel_crtc_state *crtc_state;
+	struct intel_encoder *encoder;
+	int ret;
+
+	crtc_state = intel_atomic_get_crtc_state(&state->base, crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	if (!crtc_state->hw.active)
+		return 0;
+
+	/*
+	 * We've not yet detected sink capabilities
+	 * (audio,infoframes,etc.) and thus we don't want to
+	 * force a full state recomputation yet. We want that to
+	 * happen only for the first real commit from userspace.
+	 * So preserve the inherited flag for the time being.
+	 */
+	crtc_state->inherited = true;
+
+	ret = drm_atomic_add_affected_planes(&state->base, &crtc->base);
+	if (ret)
+		return ret;
+
+	/*
+	 * FIXME hack to force a LUT update to avoid the
+	 * plane update forcing the pipe gamma on without
+	 * having a proper LUT loaded. Remove once we
+	 * have readout for pipe gamma enable.
+	 */
+	crtc_state->uapi.color_mgmt_changed = true;
+
+	for_each_intel_encoder_mask(state->base.dev, encoder, crtc_state->uapi.encoder_mask) {
+		if (encoder->initial_fastset_check &&
+		    !encoder->initial_fastset_check(encoder, crtc_state)) {
+			ret = drm_atomic_add_affected_connectors(&state->base,
+								 &crtc->base);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int intel_initial_commit(struct drm_device *dev)
 {
-	struct drm_atomic_state *state = NULL;
 	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
 	struct intel_crtc *crtc;
-	int ret = 0;
+	int ret;
 
 	state = drm_atomic_state_alloc(dev);
 	if (!state)
@@ -12146,49 +12194,9 @@ static int intel_initial_commit(struct drm_device *dev)
 	state->acquire_ctx = &ctx;
 
 	for_each_intel_crtc(dev, crtc) {
-		struct intel_crtc_state *crtc_state =
-			intel_atomic_get_crtc_state(state, crtc);
-
-		if (IS_ERR(crtc_state)) {
-			ret = PTR_ERR(crtc_state);
+		ret = intel_crtc_initial_commit(to_intel_atomic_state(state), crtc);
+		if (ret)
 			goto out;
-		}
-
-		if (crtc_state->hw.active) {
-			struct intel_encoder *encoder;
-
-			/*
-			 * We've not yet detected sink capabilities
-			 * (audio,infoframes,etc.) and thus we don't want to
-			 * force a full state recomputation yet. We want that to
-			 * happen only for the first real commit from userspace.
-			 * So preserve the inherited flag for the time being.
-			 */
-			crtc_state->inherited = true;
-
-			ret = drm_atomic_add_affected_planes(state, &crtc->base);
-			if (ret)
-				goto out;
-
-			/*
-			 * FIXME hack to force a LUT update to avoid the
-			 * plane update forcing the pipe gamma on without
-			 * having a proper LUT loaded. Remove once we
-			 * have readout for pipe gamma enable.
-			 */
-			crtc_state->uapi.color_mgmt_changed = true;
-
-			for_each_intel_encoder_mask(dev, encoder,
-						    crtc_state->uapi.encoder_mask) {
-				if (encoder->initial_fastset_check &&
-				    !encoder->initial_fastset_check(encoder, crtc_state)) {
-					ret = drm_atomic_add_affected_connectors(state,
-										 &crtc->base);
-					if (ret)
-						goto out;
-				}
-			}
-		}
 	}
 
 	ret = drm_atomic_commit(state);
-- 
2.31.1

