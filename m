Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19733CA74A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9A66E8A7;
	Thu, 15 Jul 2021 18:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EF76E8A4;
 Thu, 15 Jul 2021 18:50:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="296252436"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="296252436"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 11:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="506036893"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 15 Jul 2021 11:50:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Jul 2021 21:50:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Use drm_modeset_lock_ctx_retry() & co.
Date: Thu, 15 Jul 2021 21:49:54 +0300
Message-Id: <20210715184954.7794-5-ville.syrjala@linux.intel.com>
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

We have the modeset lock dance hand rolled in quite a few places.
Use drm_modeset_lock_ctx_retry() and drm_modeset_lock_all_ctx_retry()
to simplify our lives.

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/g4x_dp.c         |  17 +--
 drivers/gpu/drm/i915/display/intel_audio.c    |  17 +--
 drivers/gpu/drm/i915/display/intel_ddi.c      |  16 +--
 drivers/gpu/drm/i915/display/intel_display.c  | 102 ++++++------------
 .../drm/i915/display/intel_display_debugfs.c  |  45 +++-----
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  38 +++----
 6 files changed, 69 insertions(+), 166 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index de0f358184aa..68e7f4233fa9 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -1167,23 +1167,10 @@ intel_dp_hotplug(struct intel_encoder *encoder,
 
 	state = intel_encoder_hotplug(encoder, connector);
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	for (;;) {
+	drm_modeset_lock_ctx_retry(&ctx, NULL, 0, ret)
 		ret = intel_dp_retrain_link(encoder, &ctx);
 
-		if (ret == -EDEADLK) {
-			drm_modeset_backoff(&ctx);
-			continue;
-		}
-
-		break;
-	}
-
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
-	drm_WARN(encoder->base.dev, ret,
-		 "Acquiring modeset locks failed with %i\n", ret);
+	drm_WARN_ON(encoder->base.dev, ret);
 
 	/*
 	 * Keeping it consistent with intel_ddi_hotplug() and
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 5f4f316b3ab5..a3b6b00e6633 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -969,28 +969,17 @@ static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 	if (!crtc)
 		return;
 
-	drm_modeset_acquire_init(&ctx, 0);
 	state = drm_atomic_state_alloc(&dev_priv->drm);
 	if (drm_WARN_ON(&dev_priv->drm, !state))
 		return;
 
-	state->acquire_ctx = &ctx;
-
-retry:
-	ret = glk_force_audio_cdclk_commit(to_intel_atomic_state(state), crtc,
-					   enable);
-	if (ret == -EDEADLK) {
-		drm_atomic_state_clear(state);
-		drm_modeset_backoff(&ctx);
-		goto retry;
-	}
+	drm_modeset_lock_ctx_retry(&ctx, state, 0, ret)
+		ret = glk_force_audio_cdclk_commit(to_intel_atomic_state(state),
+						   crtc, enable);
 
 	drm_WARN_ON(&dev_priv->drm, ret);
 
 	drm_atomic_state_put(state);
-
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
 }
 
 static unsigned long i915_audio_component_get_power(struct device *kdev)
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 26a3aa73fcc4..9aa7369d8dbe 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4210,26 +4210,14 @@ intel_ddi_hotplug(struct intel_encoder *encoder,
 
 	state = intel_encoder_hotplug(encoder, connector);
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	for (;;) {
+	drm_modeset_lock_ctx_retry(&ctx, NULL, 0, ret) {
 		if (connector->base.connector_type == DRM_MODE_CONNECTOR_HDMIA)
 			ret = intel_hdmi_reset_link(encoder, &ctx);
 		else
 			ret = intel_dp_retrain_link(encoder, &ctx);
-
-		if (ret == -EDEADLK) {
-			drm_modeset_backoff(&ctx);
-			continue;
-		}
-
-		break;
 	}
 
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
-	drm_WARN(encoder->base.dev, ret,
-		 "Acquiring modeset locks failed with %i\n", ret);
+	drm_WARN_ON(encoder->base.dev, ret);
 
 	/*
 	 * Unpowered type-c dongles can take some time to boot and be
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3718399c4c2f..6f5bc56d68e0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12057,40 +12057,30 @@ static void sanitize_watermarks(struct drm_i915_private *dev_priv)
 
 	intel_state = to_intel_atomic_state(state);
 
-	drm_modeset_acquire_init(&ctx, 0);
+	drm_modeset_lock_ctx_retry(&ctx, state, 0, ret) {
+		/*
+		 * Hardware readout is the only time we don't want to calculate
+		 * intermediate watermarks (since we don't trust the current
+		 * watermarks).
+		 */
+		if (!HAS_GMCH(dev_priv))
+			intel_state->skip_intermediate_wm = true;
 
-retry:
-	state->acquire_ctx = &ctx;
+		ret = sanitize_watermarks_add_affected(state);
+		if (ret)
+			continue;
 
-	/*
-	 * Hardware readout is the only time we don't want to calculate
-	 * intermediate watermarks (since we don't trust the current
-	 * watermarks).
-	 */
-	if (!HAS_GMCH(dev_priv))
-		intel_state->skip_intermediate_wm = true;
+		ret = intel_atomic_check(&dev_priv->drm, state);
+		if (ret)
+			continue;
 
-	ret = sanitize_watermarks_add_affected(state);
-	if (ret)
-		goto fail;
+		/* Write calculated watermark values back */
+		for_each_new_intel_crtc_in_state(intel_state, crtc, crtc_state, i) {
+			crtc_state->wm.need_postvbl_update = true;
+			dev_priv->display.optimize_watermarks(intel_state, crtc);
 
-	ret = intel_atomic_check(&dev_priv->drm, state);
-	if (ret)
-		goto fail;
-
-	/* Write calculated watermark values back */
-	for_each_new_intel_crtc_in_state(intel_state, crtc, crtc_state, i) {
-		crtc_state->wm.need_postvbl_update = true;
-		dev_priv->display.optimize_watermarks(intel_state, crtc);
-
-		to_intel_crtc_state(crtc->base.state)->wm = crtc_state->wm;
-	}
-
-fail:
-	if (ret == -EDEADLK) {
-		drm_atomic_state_clear(state);
-		drm_modeset_backoff(&ctx);
-		goto retry;
+			to_intel_crtc_state(crtc->base.state)->wm = crtc_state->wm;
+		}
 	}
 
 	/*
@@ -12108,9 +12098,6 @@ static void sanitize_watermarks(struct drm_i915_private *dev_priv)
 		 "Could not determine valid watermarks for inherited state\n");
 
 	drm_atomic_state_put(state);
-
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
 }
 
 static void intel_update_fdi_pll_freq(struct drm_i915_private *dev_priv)
@@ -12181,38 +12168,28 @@ static int intel_initial_commit(struct drm_device *dev)
 {
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_atomic_state *state;
-	struct intel_crtc *crtc;
 	int ret;
 
 	state = drm_atomic_state_alloc(dev);
 	if (!state)
 		return -ENOMEM;
 
-	drm_modeset_acquire_init(&ctx, 0);
+	drm_modeset_lock_ctx_retry(&ctx, state, 0, ret) {
+		struct intel_crtc *crtc;
 
-retry:
-	state->acquire_ctx = &ctx;
-
-	for_each_intel_crtc(dev, crtc) {
-		ret = intel_crtc_initial_commit(to_intel_atomic_state(state), crtc);
+		for_each_intel_crtc(dev, crtc) {
+			ret = intel_crtc_initial_commit(to_intel_atomic_state(state), crtc);
+			if (ret)
+				break;
+		}
 		if (ret)
-			goto out;
-	}
+			continue;
 
-	ret = drm_atomic_commit(state);
-
-out:
-	if (ret == -EDEADLK) {
-		drm_atomic_state_clear(state);
-		drm_modeset_backoff(&ctx);
-		goto retry;
+		ret = drm_atomic_commit(state);
 	}
 
 	drm_atomic_state_put(state);
 
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
-
 	return ret;
 }
 
@@ -13323,25 +13300,14 @@ void intel_display_resume(struct drm_device *dev)
 		return;
 
 	dev_priv->modeset_restore_state = NULL;
-	if (state)
-		state->acquire_ctx = &ctx;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
-		if (ret != -EDEADLK)
-			break;
-
-		drm_modeset_backoff(&ctx);
-	}
-
-	if (!ret)
+	drm_modeset_lock_all_ctx_retry(dev, &ctx, state, 0, ret) {
 		ret = __intel_display_resume(dev, state, &ctx);
+		if (ret)
+			continue;
 
-	intel_enable_ipc(dev_priv);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+		intel_enable_ipc(dev_priv);
+	}
 
 	if (ret)
 		drm_err(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 65832c4d962f..e523a0ec6534 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -2294,44 +2294,32 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
 	struct drm_device *dev = connector->dev;
-	struct drm_crtc *crtc;
-	struct intel_dp *intel_dp;
 	struct drm_modeset_acquire_ctx ctx;
-	struct intel_crtc_state *crtc_state = NULL;
-	int ret = 0;
-	bool try_again = false;
+	int ret;
 
-	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
+	drm_modeset_lock_ctx_retry(&ctx, NULL, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret) {
+		struct intel_crtc_state *crtc_state;
+		struct intel_dp *intel_dp;
+		struct drm_crtc *crtc;
 
-	do {
-		try_again = false;
 		ret = drm_modeset_lock(&dev->mode_config.connection_mutex,
 				       &ctx);
-		if (ret) {
-			if (ret == -EDEADLK && !drm_modeset_backoff(&ctx)) {
-				try_again = true;
-				continue;
-			}
-			break;
-		}
+		if (ret)
+			continue;
+
 		crtc = connector->state->crtc;
 		if (connector->status != connector_status_connected || !crtc) {
 			ret = -ENODEV;
-			break;
+			continue;
 		}
+
 		ret = drm_modeset_lock(&crtc->mutex, &ctx);
-		if (ret == -EDEADLK) {
-			ret = drm_modeset_backoff(&ctx);
-			if (!ret) {
-				try_again = true;
-				continue;
-			}
-			break;
-		} else if (ret) {
-			break;
-		}
+		if (ret)
+			continue;
+
 		intel_dp = intel_attached_dp(to_intel_connector(connector));
 		crtc_state = to_intel_crtc_state(crtc->state);
+
 		seq_printf(m, "DSC_Enabled: %s\n",
 			   yesno(crtc_state->dsc.compression_enable));
 		seq_printf(m, "DSC_Sink_Support: %s\n",
@@ -2341,10 +2329,7 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 		if (!intel_dp_is_edp(intel_dp))
 			seq_printf(m, "FEC_Sink_Support: %s\n",
 				   yesno(drm_dp_sink_supports_fec(intel_dp->fec_capable)));
-	} while (try_again);
-
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 8ac263f471be..89435de4ff58 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -293,46 +293,34 @@ intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
 	state = drm_atomic_state_alloc(&dev_priv->drm);
 	if (!state) {
 		ret = -ENOMEM;
 		goto unlock;
 	}
 
-	state->acquire_ctx = &ctx;
+	drm_modeset_lock_ctx_retry(&ctx, state, 0, ret) {
+		pipe_config = intel_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(pipe_config)) {
+			ret = PTR_ERR(pipe_config);
+			continue;
+		}
 
-retry:
-	pipe_config = intel_atomic_get_crtc_state(state, crtc);
-	if (IS_ERR(pipe_config)) {
-		ret = PTR_ERR(pipe_config);
-		goto put_state;
-	}
+		pipe_config->uapi.mode_changed = pipe_config->has_psr;
+		pipe_config->crc_enabled = enable;
 
-	pipe_config->uapi.mode_changed = pipe_config->has_psr;
-	pipe_config->crc_enabled = enable;
+		if (IS_HASWELL(dev_priv) &&
+		    pipe_config->hw.active && crtc->pipe == PIPE_A &&
+		    pipe_config->cpu_transcoder == TRANSCODER_EDP)
+			pipe_config->uapi.mode_changed = true;
 
-	if (IS_HASWELL(dev_priv) &&
-	    pipe_config->hw.active && crtc->pipe == PIPE_A &&
-	    pipe_config->cpu_transcoder == TRANSCODER_EDP)
-		pipe_config->uapi.mode_changed = true;
-
-	ret = drm_atomic_commit(state);
-
-put_state:
-	if (ret == -EDEADLK) {
-		drm_atomic_state_clear(state);
-		drm_modeset_backoff(&ctx);
-		goto retry;
+		ret = drm_atomic_commit(state);
 	}
 
 	drm_atomic_state_put(state);
 unlock:
 	drm_WARN(&dev_priv->drm, ret,
 		 "Toggling workaround to %i returns %i\n", enable, ret);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
 }
 
 static int ivb_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
-- 
2.31.1

