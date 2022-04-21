Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FED50A903
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 21:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92910EA06;
	Thu, 21 Apr 2022 19:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4670010E9FE;
 Thu, 21 Apr 2022 19:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650568840; x=1682104840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4zJD5o0xz54+cLZ7r+RO+pHT6q8ZtCPoTP/HP9FXUU8=;
 b=Us4u//ECin3UrXCQtC7i/W5ajqn3oRwlh8TWclAV7tUfnny2REcC5Q6L
 9UtJyb6zUxtU02gWO1uA+MDmXMRX9gI7DRQHu7nDff89ZvHoq2uyj6jX5
 kBoJkYRYlB952nWuohVnI+0W13c6rlzdP9xlki7rXoxpDeuvJbh2y8yVo
 cBHx/TZ01K4tCFsloaCvX8vaXoVCpRxIC1bjMKzuGbd2Gv8FNFHbp1spv
 8ioFZVeH3WquvzncwRf3dLcKhjov7lB2PgzE/dWo5EiwJNC45v02UT8Nj
 SAdOhmZDGaBKZQM9O0LXN7ExGN+XRbmqfhvq54ySrO2IYZbgqNsOByR4S A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="251776742"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="251776742"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 12:20:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="533556682"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.139])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 12:20:38 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/display: Implement seamless mode switch
Date: Thu, 21 Apr 2022 12:22:05 -0700
Message-Id: <20220421192205.32649-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220421192205.32649-1-jose.souza@intel.com>
References: <20220421192205.32649-1-jose.souza@intel.com>
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Vidya Srinivas <vidya.srinivas@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As described in previous commit "drm: Add infrastructure to allow
seamless mode switches" here doing the i915 implementation.

The main steps are:
- drm_atomic_helper_check_modeset() will call
atomic_seamless_mode_switch_check()/intel_drrs_seamless_mode_switch_check()
if conditions match
- intel_drrs_seamless_mode_switch_check() will check if seamless DRRS
is enabled and if the requested mode matches with fixed or downclock
mode
- now at the atomic commit phase during the execution of
intel_pre_plane_update(), intel_drrs_deactivate() will
return without change the DRRS state if seamless_mode_switch_enabled
or seamless_mode_changed is set and there is no modeset happening in
this pipe(something after drm_atomic_helper_check_modeset() could
still require a modeset and set mode_changed)
- then in intel_post_plane_update(), intel_drrs_activate() is called
and DRRS mode is switched if seamless_mode_changed is set or the
function is skipped if seamless_mode_switch_enabled is set
and pipe don't need a modeset

After a modeset, seamless_mode_switch_enabled is set to 0 and
DRRS is back to automatic mode until the next commit
that intel_drrs_seamless_mode_switch_check() is executed and
it supports the mode.

Cc: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c     | 10 +++
 drivers/gpu/drm/i915/display/intel_display.c  |  5 +-
 .../drm/i915/display/intel_display_debugfs.c  |  5 +-
 .../drm/i915/display/intel_display_types.h    |  3 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +
 drivers/gpu/drm/i915/display/intel_drrs.c     | 73 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_drrs.h     |  5 +-
 7 files changed, 96 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 4442aa355f868..d411daa0b2bab 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -215,6 +215,15 @@ static int intel_crtc_late_register(struct drm_crtc *crtc)
 	return 0;
 }
 
+static int intel_crtc_seamless_mode_switch_check(struct drm_atomic_state *_state,
+						 struct drm_crtc *_crtc)
+{
+	struct intel_atomic_state *state = to_intel_atomic_state(_state);
+	struct intel_crtc *crtc = to_intel_crtc(_crtc);
+
+	return intel_drrs_seamless_mode_switch_check(state, crtc);
+}
+
 #define INTEL_CRTC_FUNCS \
 	.set_config = drm_atomic_helper_set_config, \
 	.destroy = intel_crtc_destroy, \
@@ -233,6 +242,7 @@ static const struct drm_crtc_funcs bdw_crtc_funcs = {
 	.enable_vblank = bdw_enable_vblank,
 	.disable_vblank = bdw_disable_vblank,
 	.get_vblank_timestamp = intel_crtc_get_vblank_timestamp,
+	.atomic_seamless_mode_switch_check = intel_crtc_seamless_mode_switch_check,
 };
 
 static const struct drm_crtc_funcs ilk_crtc_funcs = {
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a5f5caeced9a0..ebfa7d68e35fe 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1329,7 +1329,7 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
 
-	intel_drrs_deactivate(old_crtc_state);
+	intel_drrs_deactivate(old_crtc_state, new_crtc_state);
 
 	intel_psr_pre_plane_update(state, crtc);
 
@@ -7089,6 +7089,7 @@ static void intel_crtc_copy_fastset(const struct intel_crtc_state *old_crtc_stat
 	new_crtc_state->dp_m_n = old_crtc_state->dp_m_n;
 	new_crtc_state->dp_m2_n2 = old_crtc_state->dp_m2_n2;
 	new_crtc_state->drrs_downclock_mode = old_crtc_state->drrs_downclock_mode;
+	new_crtc_state->drrs_fixed_mode = old_crtc_state->drrs_fixed_mode;
 }
 
 static int intel_crtc_add_planes_to_state(struct intel_atomic_state *state,
@@ -7716,6 +7717,8 @@ static int intel_atomic_check(struct drm_device *dev,
 		if (!intel_crtc_needs_modeset(new_crtc_state)) {
 			if (intel_crtc_is_bigjoiner_slave(new_crtc_state))
 				copy_bigjoiner_crtc_state_nomodeset(state, crtc);
+			else if (new_crtc_state->uapi.seamless_mode_changed)
+				intel_crtc_copy_uapi_to_hw_state_modeset(state, crtc);
 			else
 				intel_crtc_copy_uapi_to_hw_state_nomodeset(state, crtc);
 			continue;
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index f9720562336da..1d27ed2b68210 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1108,6 +1108,9 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 			   crtc->drrs.refresh_rate == DRRS_REFRESH_RATE_LOW ?
 			   "low" : "high");
 
+		seq_printf(m, "Seamless mode switch enabled: %s\n",
+			   str_yes_no(crtc->drrs.seamless_mode_switch_enabled));
+
 		mutex_unlock(&crtc->drrs.mutex);
 	}
 
@@ -1802,7 +1805,7 @@ static int i915_drrs_ctl_set(void *data, u64 val)
 		if (val)
 			intel_drrs_activate(crtc_state);
 		else
-			intel_drrs_deactivate(crtc_state);
+			intel_drrs_deactivate(crtc_state, crtc_state);
 
 out:
 		drm_modeset_unlock(&crtc->base.mutex);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f0b3cfd3138ce..b04922fd45e45 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1056,7 +1056,7 @@ struct intel_crtc_state {
 
 	/* m2_n2 for eDP downclock */
 	struct intel_link_m_n dp_m2_n2;
-	const struct drm_display_mode *drrs_downclock_mode;
+	const struct drm_display_mode *drrs_fixed_mode, *drrs_downclock_mode;
 
 	/* PSR is supported but might not be enabled due the lack of enabled planes */
 	bool has_psr;
@@ -1316,6 +1316,7 @@ struct intel_crtc {
 		unsigned int busy_frontbuffer_bits;
 		enum transcoder cpu_transcoder;
 		struct intel_link_m_n m_n, m2_n2;
+		bool seamless_mode_switch_enabled;
 	} drrs;
 
 	int scanline_offset;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index feea172dd2753..82f13c3b0f2b3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1881,6 +1881,8 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 	if (IS_IRONLAKE(i915) || IS_SANDYBRIDGE(i915) || IS_IVYBRIDGE(i915))
 		pipe_config->msa_timing_delay = i915->vbt.edp.drrs_msa_timing_delay;
 
+	pipe_config->drrs_fixed_mode = intel_panel_fixed_mode(connector,
+							      &pipe_config->hw.adjusted_mode);
 	pipe_config->drrs_downclock_mode = downclock_mode;
 
 	pixel_clock = downclock_mode->clock;
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index dd527dfc2d1d5..3a801f7e79187 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -155,6 +155,23 @@ void intel_drrs_activate(const struct intel_crtc_state *crtc_state)
 
 	mutex_lock(&crtc->drrs.mutex);
 
+	/* Until the next modeset user-space will control the refresh rate */
+	if (crtc_state->uapi.seamless_mode_changed &&
+	    !intel_crtc_needs_modeset(crtc_state)) {
+		enum drrs_refresh_rate rate = DRRS_REFRESH_RATE_HIGH;
+
+		if (drm_mode_match(&crtc_state->hw.adjusted_mode,
+				   crtc_state->drrs_downclock_mode,
+				   DRM_MODE_MATCH_CLOCK))
+			rate = DRRS_REFRESH_RATE_LOW;
+
+		crtc->drrs.seamless_mode_switch_enabled = true;
+		intel_drrs_set_state(crtc, rate);
+	}
+
+	if (crtc->drrs.seamless_mode_switch_enabled)
+		goto unlock;
+
 	crtc->drrs.cpu_transcoder = crtc_state->cpu_transcoder;
 	crtc->drrs.m_n = crtc_state->dp_m_n;
 	crtc->drrs.m2_n2 = crtc_state->dp_m2_n2;
@@ -162,7 +179,7 @@ void intel_drrs_activate(const struct intel_crtc_state *crtc_state)
 	crtc->drrs.busy_frontbuffer_bits = 0;
 
 	intel_drrs_schedule_work(crtc);
-
+unlock:
 	mutex_unlock(&crtc->drrs.mutex);
 }
 
@@ -172,7 +189,8 @@ void intel_drrs_activate(const struct intel_crtc_state *crtc_state)
  *
  * Deactivates DRRS on the crtc.
  */
-void intel_drrs_deactivate(const struct intel_crtc_state *old_crtc_state)
+void intel_drrs_deactivate(const struct intel_crtc_state *old_crtc_state,
+			   const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 
@@ -187,13 +205,25 @@ void intel_drrs_deactivate(const struct intel_crtc_state *old_crtc_state)
 
 	mutex_lock(&crtc->drrs.mutex);
 
+	/*
+	 * When seamless_mode_switch_enabled is enabled, user-space is in
+	 * control of DRRS and it will only go to the automatic mode on the
+	 * next modeset
+	 */
+	if ((crtc->drrs.seamless_mode_switch_enabled ||
+	     new_crtc_state->uapi.seamless_mode_changed) &&
+	    !intel_crtc_needs_modeset(new_crtc_state))
+		goto unlock;
+
 	if (intel_drrs_is_active(crtc))
 		intel_drrs_set_state(crtc, DRRS_REFRESH_RATE_HIGH);
 
 	crtc->drrs.cpu_transcoder = INVALID_TRANSCODER;
 	crtc->drrs.frontbuffer_bits = 0;
 	crtc->drrs.busy_frontbuffer_bits = 0;
+	crtc->drrs.seamless_mode_switch_enabled = false;
 
+unlock:
 	mutex_unlock(&crtc->drrs.mutex);
 
 	cancel_delayed_work_sync(&crtc->drrs.work);
@@ -205,7 +235,8 @@ static void intel_drrs_downclock_work(struct work_struct *work)
 
 	mutex_lock(&crtc->drrs.mutex);
 
-	if (intel_drrs_is_active(crtc) && !crtc->drrs.busy_frontbuffer_bits)
+	if (intel_drrs_is_active(crtc) && !crtc->drrs.busy_frontbuffer_bits &&
+	    !crtc->drrs.seamless_mode_switch_enabled)
 		intel_drrs_set_state(crtc, DRRS_REFRESH_RATE_LOW);
 
 	mutex_unlock(&crtc->drrs.mutex);
@@ -236,6 +267,11 @@ static void intel_drrs_frontbuffer_update(struct drm_i915_private *dev_priv,
 		else
 			crtc->drrs.busy_frontbuffer_bits &= ~frontbuffer_bits;
 
+		if (crtc->drrs.seamless_mode_switch_enabled) {
+			mutex_unlock(&crtc->drrs.mutex);
+			continue;
+		}
+
 		/* flush/invalidate means busy screen hence upclock */
 		intel_drrs_set_state(crtc, DRRS_REFRESH_RATE_HIGH);
 
@@ -300,3 +336,34 @@ void intel_crtc_drrs_init(struct intel_crtc *crtc)
 	mutex_init(&crtc->drrs.mutex);
 	crtc->drrs.cpu_transcoder = INVALID_TRANSCODER;
 }
+
+int intel_drrs_seamless_mode_switch_check(struct intel_atomic_state *state,
+					  struct intel_crtc *crtc)
+{
+	const unsigned int match_mode_flags = DRM_MODE_MATCH_TIMINGS |
+					      DRM_MODE_MATCH_FLAGS |
+					      DRM_MODE_MATCH_3D_FLAGS |
+					      DRM_MODE_MATCH_ASPECT_RATIO;
+	struct intel_crtc_state *new_crtc_state;
+
+	new_crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+	if (IS_ERR(new_crtc_state))
+		return PTR_ERR(new_crtc_state);
+
+	if (!CRTC_STATE_HAS_DRRS(new_crtc_state))
+		return -EOPNOTSUPP;
+
+	/* Requested mode matches with fixed or downclock mode? */
+	if (!drm_mode_match(&new_crtc_state->uapi.mode,
+			    new_crtc_state->drrs_fixed_mode,
+			    match_mode_flags) &&
+	    !drm_mode_match(&new_crtc_state->uapi.mode,
+			    new_crtc_state->drrs_downclock_mode,
+			    match_mode_flags))
+		return -EOPNOTSUPP;
+
+	drm_mode_copy(&new_crtc_state->uapi.adjusted_mode,
+		      &new_crtc_state->uapi.mode);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.h b/drivers/gpu/drm/i915/display/intel_drrs.h
index 3ad1be1ad9c13..85ad987c45945 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.h
+++ b/drivers/gpu/drm/i915/display/intel_drrs.h
@@ -18,11 +18,14 @@ struct intel_connector;
 const char *intel_drrs_type_str(enum drrs_type drrs_type);
 bool intel_drrs_is_active(struct intel_crtc *crtc);
 void intel_drrs_activate(const struct intel_crtc_state *crtc_state);
-void intel_drrs_deactivate(const struct intel_crtc_state *crtc_state);
+void intel_drrs_deactivate(const struct intel_crtc_state *old_crtc_state,
+			   const struct intel_crtc_state *new_crtc_state);
 void intel_drrs_invalidate(struct drm_i915_private *dev_priv,
 			   unsigned int frontbuffer_bits);
 void intel_drrs_flush(struct drm_i915_private *dev_priv,
 		      unsigned int frontbuffer_bits);
 void intel_crtc_drrs_init(struct intel_crtc *crtc);
+int intel_drrs_seamless_mode_switch_check(struct intel_atomic_state *state,
+					  struct intel_crtc *crtc);
 
 #endif /* __INTEL_DRRS_H__ */
-- 
2.36.0

