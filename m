Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8276485E7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89E10E55B;
	Fri,  9 Dec 2022 15:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E910E557;
 Fri,  9 Dec 2022 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670600960; x=1702136960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/lbJBcLCkKz7IW0CLSdmyfW1H10YoaFN2t/x2AGEu9o=;
 b=dz7A7roao9cRMqsgTjE3neYRTCM6f6qU68PBhjGX2j/tyi7VMvPI9/rP
 WxTFeMlAsPD5sG7xS/nTs4h+67zoak32t6/HLeEH9WyuUAiqbRlnyOyYt
 gp4KAtMkThOe1Frb3UjELDLScUdbPs5frhoJvoKeqHiesbCEysZuBJsBi
 ZKU8H4dCUSiUUZa/uhKxOcQqOYNq0p0n1nx+crkyNs4LBPFz8LL8iOU3Q
 AxPKlemr779DBBL8iy79eu0QltgekdgXIYqnGHiLKxsPnZybyJokx9QxW
 SUHCQhFH4lY5t17eXLEI0DqOFCyVRdKejT7PLXxQfdF4oKL6tnVyi7x3t Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="315119798"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="315119798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="647433341"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="647433341"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 07:49:16 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/display: kill fetch_and_zero usage
Date: Fri,  9 Dec 2022 16:48:40 +0100
Message-Id: <20221209154843.4162814-2-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209154843.4162814-1-andrzej.hajda@intel.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Better use recently introduced kernel core helper.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  6 ++---
 drivers/gpu/drm/i915/display/intel_display.c  |  4 ++--
 .../drm/i915/display/intel_display_power.c    | 22 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dmc.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  6 ++---
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  3 ++-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  4 ++--
 drivers/gpu/drm/i915/display/intel_pps.c      |  4 ++--
 drivers/gpu/drm/i915/display/intel_tc.c       |  4 ++--
 10 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index d16b30a2dded33..629b51ef7bfcce 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1425,7 +1425,7 @@ static void gen11_dsi_disable_io_power(struct intel_encoder *encoder)
 	for_each_dsi_port(port, intel_dsi->ports) {
 		intel_wakeref_t wakeref;
 
-		wakeref = fetch_and_zero(&intel_dsi->io_wakeref[port]);
+		wakeref = exchange(&intel_dsi->io_wakeref[port], 0);
 		intel_display_power_put(dev_priv,
 					port == PORT_A ?
 					POWER_DOMAIN_PORT_DDI_IO_A :
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 5f9a2410fc4c35..9486768fb9d38e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -902,7 +902,7 @@ main_link_aux_power_domain_put(struct intel_digital_port *dig_port,
 		intel_ddi_main_link_aux_domain(dig_port, crtc_state);
 	intel_wakeref_t wf;
 
-	wf = fetch_and_zero(&dig_port->aux_wakeref);
+	wf = exchange(&dig_port->aux_wakeref, 0);
 	if (!wf)
 		return;
 
@@ -2678,7 +2678,7 @@ static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
 	if (!intel_tc_port_in_tbt_alt_mode(dig_port))
 		intel_display_power_put(dev_priv,
 					dig_port->ddi_io_power_domain,
-					fetch_and_zero(&dig_port->ddi_io_wakeref));
+					exchange(&dig_port->ddi_io_wakeref, 0));
 
 	intel_ddi_disable_clock(encoder);
 }
@@ -2705,7 +2705,7 @@ static void intel_ddi_post_disable_hdmi(struct intel_atomic_state *state,
 
 	intel_display_power_put(dev_priv,
 				dig_port->ddi_io_power_domain,
-				fetch_and_zero(&dig_port->ddi_io_wakeref));
+				exchange(&dig_port->ddi_io_wakeref, 0));
 
 	intel_ddi_disable_clock(encoder);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 32b25715718644..fd9f7ab71ee84c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -964,7 +964,7 @@ void intel_display_finish_reset(struct drm_i915_private *i915)
 	if (!test_bit(I915_RESET_MODESET, &to_gt(i915)->reset.flags))
 		return;
 
-	state = fetch_and_zero(&i915->display.restore.modeset_state);
+	state = exchange(&i915->display.restore.modeset_state, NULL);
 	if (!state)
 		goto unlock;
 
@@ -7591,7 +7591,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 * cleanup. So copy and reset the dsb structure to sync with
 		 * commit_done and later do dsb cleanup in cleanup_work.
 		 */
-		old_crtc_state->dsb = fetch_and_zero(&new_crtc_state->dsb);
+		old_crtc_state->dsb = exchange(&new_crtc_state->dsb, 0);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 3adba64937de68..34a155bf825c87 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -474,7 +474,7 @@ intel_display_power_grab_async_put_ref(struct drm_i915_private *dev_priv,
 
 	cancel_delayed_work(&power_domains->async_put_work);
 	intel_runtime_pm_put_raw(&dev_priv->runtime_pm,
-				 fetch_and_zero(&power_domains->async_put_wakeref));
+				 exchange(&power_domains->async_put_wakeref, 0));
 out_verify:
 	verify_async_put_domains_state(power_domains);
 
@@ -660,7 +660,7 @@ intel_display_power_put_async_work(struct work_struct *work)
 	 * Bail out if all the domain refs pending to be released were grabbed
 	 * by subsequent gets or a flush_work.
 	 */
-	old_work_wakeref = fetch_and_zero(&power_domains->async_put_wakeref);
+	old_work_wakeref = exchange(&power_domains->async_put_wakeref, 0);
 	if (!old_work_wakeref)
 		goto out_verify;
 
@@ -675,7 +675,7 @@ intel_display_power_put_async_work(struct work_struct *work)
 		bitmap_zero(power_domains->async_put_domains[1].bits,
 			    POWER_DOMAIN_NUM);
 		queue_async_put_domains_work(power_domains,
-					     fetch_and_zero(&new_work_wakeref));
+					     exchange(&new_work_wakeref, 0));
 	} else {
 		/*
 		 * Cancel the work that got queued after this one got dequeued,
@@ -729,7 +729,7 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 	} else {
 		set_bit(domain, power_domains->async_put_domains[0].bits);
 		queue_async_put_domains_work(power_domains,
-					     fetch_and_zero(&work_wakeref));
+					     exchange(&work_wakeref, 0));
 	}
 
 out_verify:
@@ -763,7 +763,7 @@ void intel_display_power_flush_work(struct drm_i915_private *i915)
 
 	mutex_lock(&power_domains->lock);
 
-	work_wakeref = fetch_and_zero(&power_domains->async_put_wakeref);
+	work_wakeref = exchange(&power_domains->async_put_wakeref, 0);
 	if (!work_wakeref)
 		goto out_verify;
 
@@ -891,7 +891,7 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
 		intel_wakeref_t __maybe_unused wf = -1;
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
-		wf = fetch_and_zero(&power_domain_set->wakerefs[domain]);
+		wf = exchange(&power_domain_set->wakerefs[domain], 0);
 #endif
 		intel_display_power_put(i915, domain, wf);
 		clear_bit(domain, power_domain_set->mask.bits);
@@ -1943,12 +1943,12 @@ void intel_power_domains_init_hw(struct drm_i915_private *i915, bool resume)
 void intel_power_domains_driver_remove(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref __maybe_unused =
-		fetch_and_zero(&i915->display.power.domains.init_wakeref);
+		exchange(&i915->display.power.domains.init_wakeref, 0);
 
 	/* Remove the refcount we took to keep power well support disabled. */
 	if (!i915->params.disable_power_well)
 		intel_display_power_put(i915, POWER_DOMAIN_INIT,
-					fetch_and_zero(&i915->display.power.domains.disable_wakeref));
+					exchange(&i915->display.power.domains.disable_wakeref, 0));
 
 	intel_display_power_flush_work_sync(i915);
 
@@ -2004,7 +2004,7 @@ void intel_power_domains_sanitize_state(struct drm_i915_private *i915)
 void intel_power_domains_enable(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref __maybe_unused =
-		fetch_and_zero(&i915->display.power.domains.init_wakeref);
+		exchange(&i915->display.power.domains.init_wakeref, 0);
 
 	intel_display_power_put(i915, POWER_DOMAIN_INIT, wakeref);
 	intel_power_domains_verify_state(i915);
@@ -2044,7 +2044,7 @@ void intel_power_domains_suspend(struct drm_i915_private *i915,
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
 	intel_wakeref_t wakeref __maybe_unused =
-		fetch_and_zero(&power_domains->init_wakeref);
+		exchange(&power_domains->init_wakeref, 0);
 
 	intel_display_power_put(i915, POWER_DOMAIN_INIT, wakeref);
 
@@ -2069,7 +2069,7 @@ void intel_power_domains_suspend(struct drm_i915_private *i915,
 	 */
 	if (!i915->params.disable_power_well)
 		intel_display_power_put(i915, POWER_DOMAIN_INIT,
-					fetch_and_zero(&i915->display.power.domains.disable_wakeref));
+					exchange(&i915->display.power.domains.disable_wakeref, 0));
 
 	intel_display_power_flush_work(i915);
 	intel_power_domains_verify_state(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index eff3add706117c..17399955024bd0 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -838,7 +838,7 @@ static void intel_dmc_runtime_pm_get(struct drm_i915_private *dev_priv)
 static void intel_dmc_runtime_pm_put(struct drm_i915_private *dev_priv)
 {
 	intel_wakeref_t wakeref __maybe_unused =
-		fetch_and_zero(&dev_priv->display.dmc.wakeref);
+		exchange(&dev_priv->display.dmc.wakeref, 0);
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_INIT, wakeref);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 1aca7552a85d03..70661b40f0f979 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -285,17 +285,17 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 	struct i915_vma *vma;
 
 	if (!intel_fb_uses_dpt(fb)) {
-		vma = fetch_and_zero(&old_plane_state->ggtt_vma);
+		vma = exchange(&old_plane_state->ggtt_vma, NULL);
 		if (vma)
 			intel_unpin_fb_vma(vma, old_plane_state->flags);
 	} else {
 		struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 
-		vma = fetch_and_zero(&old_plane_state->dpt_vma);
+		vma = exchange(&old_plane_state->dpt_vma, NULL);
 		if (vma)
 			intel_unpin_fb_vma(vma, old_plane_state->flags);
 
-		vma = fetch_and_zero(&old_plane_state->ggtt_vma);
+		vma = exchange(&old_plane_state->ggtt_vma, NULL);
 		if (vma)
 			intel_dpt_unpin(intel_fb->dpt_vm);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 03ed4607a46d21..d59b4cc6b36f33 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -591,7 +591,8 @@ void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
 
 void intel_fbdev_fini(struct drm_i915_private *dev_priv)
 {
-	struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv->display.fbdev.fbdev);
+	struct intel_fbdev *ifbdev = exchange(&dev_priv->display.fbdev.fbdev,
+					      NULL);
 
 	if (!ifbdev)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index c12bdca8da9ba6..89b39b933be7e3 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -355,7 +355,7 @@ static void intel_overlay_release_old_vma(struct intel_overlay *overlay)
 {
 	struct i915_vma *vma;
 
-	vma = fetch_and_zero(&overlay->old_vma);
+	vma = exchange(&overlay->old_vma, NULL);
 	if (drm_WARN_ON(&overlay->i915->drm, !vma))
 		return;
 
@@ -1428,7 +1428,7 @@ void intel_overlay_cleanup(struct drm_i915_private *dev_priv)
 {
 	struct intel_overlay *overlay;
 
-	overlay = fetch_and_zero(&dev_priv->display.overlay);
+	overlay = exchange(&dev_priv->display.overlay, NULL);
 	if (!overlay)
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 9bbf41a076f728..b28a6f955a57e8 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -690,7 +690,7 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
 
 	intel_display_power_put(dev_priv,
 				intel_aux_power_domain(dig_port),
-				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
+				exchange(&intel_dp->pps.vdd_wakeref, 0));
 }
 
 void intel_pps_vdd_off_sync(struct intel_dp *intel_dp)
@@ -866,7 +866,7 @@ void intel_pps_off_unlocked(struct intel_dp *intel_dp)
 	/* We got a reference when we enabled the VDD. */
 	intel_display_power_put(dev_priv,
 				intel_aux_power_domain(dig_port),
-				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
+				exchange(&intel_dp->pps.vdd_wakeref, 0));
 }
 
 void intel_pps_off(struct intel_dp *intel_dp)
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 70624b4b2d38c1..7701daef66ff5c 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -671,7 +671,7 @@ static void intel_tc_port_update_mode(struct intel_digital_port *dig_port,
 
 	/* Get power domain matching the new mode after reset. */
 	tc_cold_unblock(dig_port, dig_port->tc_lock_power_domain,
-			fetch_and_zero(&dig_port->tc_lock_wakeref));
+			exchange(&dig_port->tc_lock_wakeref, 0));
 	if (dig_port->tc_mode != TC_PORT_DISCONNECTED)
 		dig_port->tc_lock_wakeref = tc_cold_block(dig_port,
 							  &dig_port->tc_lock_power_domain);
@@ -767,7 +767,7 @@ void intel_tc_port_sanitize_mode(struct intel_digital_port *dig_port)
 		icl_tc_phy_disconnect(dig_port);
 
 		tc_cold_unblock(dig_port, dig_port->tc_lock_power_domain,
-				fetch_and_zero(&dig_port->tc_lock_wakeref));
+				exchange(&dig_port->tc_lock_wakeref, 0));
 	}
 
 	drm_dbg_kms(&i915->drm, "Port %s: sanitize mode (%s)\n",
-- 
2.34.1

