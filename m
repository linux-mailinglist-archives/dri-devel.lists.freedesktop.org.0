Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597DE14BFCA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 19:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF276EF3F;
	Tue, 28 Jan 2020 18:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BDA6EF3F;
 Tue, 28 Jan 2020 18:29:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310822236"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:29:08 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] [PATCH v5 16/21] drm/i915/display/psr: Make WARN* drm
 specific where drm_priv ptr is available
Date: Tue, 28 Jan 2020 23:45:58 +0530
Message-Id: <20200128181603.27767-17-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 32 +++++++++++++-----------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index b9dd9763c0f7..edb7e28627f3 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -77,8 +77,8 @@ static bool intel_psr2_enabled(struct drm_i915_private *dev_priv,
 			       const struct intel_crtc_state *crtc_state)
 {
 	/* Cannot enable DSC and PSR2 simultaneously */
-	WARN_ON(crtc_state->dsc.compression_enable &&
-		crtc_state->has_psr2);
+	drm_WARN_ON(&dev_priv->drm, crtc_state->dsc.compression_enable &&
+		    crtc_state->has_psr2);
 
 	switch (dev_priv->psr.debug & I915_PSR_DEBUG_MODE_MASK) {
 	case I915_PSR_DEBUG_DISABLE:
@@ -469,7 +469,7 @@ static u8 psr_compute_idle_frames(struct intel_dp *intel_dp)
 	idle_frames = max(6, dev_priv->vbt.psr.idle_frames);
 	idle_frames = max(idle_frames, dev_priv->psr.sink_sync_latency + 1);
 
-	if (WARN_ON(idle_frames > 0xf))
+	if (drm_WARN_ON(&dev_priv->drm, idle_frames > 0xf))
 		idle_frames = 0xf;
 
 	return idle_frames;
@@ -628,7 +628,7 @@ tgl_dc3co_exitline_compute_config(struct intel_dp *intel_dp,
 	exit_scanlines =
 		intel_usecs_to_scanlines(&crtc_state->uapi.adjusted_mode, 200) + 1;
 
-	if (WARN_ON(exit_scanlines > crtc_vdisplay))
+	if (drm_WARN_ON(&dev_priv->drm, exit_scanlines > crtc_vdisplay))
 		return;
 
 	crtc_state->dc3co_exitline = crtc_vdisplay - exit_scanlines;
@@ -768,10 +768,12 @@ static void intel_psr_activate(struct intel_dp *intel_dp)
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
 	if (transcoder_has_psr2(dev_priv, dev_priv->psr.transcoder))
-		WARN_ON(intel_de_read(dev_priv, EDP_PSR2_CTL(dev_priv->psr.transcoder)) & EDP_PSR2_ENABLE);
+		drm_WARN_ON(&dev_priv->drm,
+			    intel_de_read(dev_priv, EDP_PSR2_CTL(dev_priv->psr.transcoder)) & EDP_PSR2_ENABLE);
 
-	WARN_ON(intel_de_read(dev_priv, EDP_PSR_CTL(dev_priv->psr.transcoder)) & EDP_PSR_ENABLE);
-	WARN_ON(dev_priv->psr.active);
+	drm_WARN_ON(&dev_priv->drm,
+		    intel_de_read(dev_priv, EDP_PSR_CTL(dev_priv->psr.transcoder)) & EDP_PSR_ENABLE);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->psr.active);
 	lockdep_assert_held(&dev_priv->psr.lock);
 
 	/* psr1 and psr2 are mutually exclusive.*/
@@ -846,7 +848,7 @@ static void intel_psr_enable_locked(struct drm_i915_private *dev_priv,
 	struct intel_dp *intel_dp = dev_priv->psr.dp;
 	u32 val;
 
-	WARN_ON(dev_priv->psr.enabled);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->psr.enabled);
 
 	dev_priv->psr.psr2_enabled = intel_psr2_enabled(dev_priv, crtc_state);
 	dev_priv->psr.busy_frontbuffer_bits = 0;
@@ -904,10 +906,10 @@ void intel_psr_enable(struct intel_dp *intel_dp,
 	if (!crtc_state->has_psr)
 		return;
 
-	if (WARN_ON(!CAN_PSR(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !CAN_PSR(dev_priv)))
 		return;
 
-	WARN_ON(dev_priv->drrs.dp);
+	drm_WARN_ON(&dev_priv->drm, dev_priv->drrs.dp);
 
 	mutex_lock(&dev_priv->psr.lock);
 
@@ -930,12 +932,12 @@ static void intel_psr_exit(struct drm_i915_private *dev_priv)
 		if (transcoder_has_psr2(dev_priv, dev_priv->psr.transcoder)) {
 			val = intel_de_read(dev_priv,
 					    EDP_PSR2_CTL(dev_priv->psr.transcoder));
-			WARN_ON(val & EDP_PSR2_ENABLE);
+			drm_WARN_ON(&dev_priv->drm, val & EDP_PSR2_ENABLE);
 		}
 
 		val = intel_de_read(dev_priv,
 				    EDP_PSR_CTL(dev_priv->psr.transcoder));
-		WARN_ON(val & EDP_PSR_ENABLE);
+		drm_WARN_ON(&dev_priv->drm, val & EDP_PSR_ENABLE);
 
 		return;
 	}
@@ -944,14 +946,14 @@ static void intel_psr_exit(struct drm_i915_private *dev_priv)
 		tgl_disallow_dc3co_on_psr2_exit(dev_priv);
 		val = intel_de_read(dev_priv,
 				    EDP_PSR2_CTL(dev_priv->psr.transcoder));
-		WARN_ON(!(val & EDP_PSR2_ENABLE));
+		drm_WARN_ON(&dev_priv->drm, !(val & EDP_PSR2_ENABLE));
 		val &= ~EDP_PSR2_ENABLE;
 		intel_de_write(dev_priv,
 			       EDP_PSR2_CTL(dev_priv->psr.transcoder), val);
 	} else {
 		val = intel_de_read(dev_priv,
 				    EDP_PSR_CTL(dev_priv->psr.transcoder));
-		WARN_ON(!(val & EDP_PSR_ENABLE));
+		drm_WARN_ON(&dev_priv->drm, !(val & EDP_PSR_ENABLE));
 		val &= ~EDP_PSR_ENABLE;
 		intel_de_write(dev_priv,
 			       EDP_PSR_CTL(dev_priv->psr.transcoder), val);
@@ -1012,7 +1014,7 @@ void intel_psr_disable(struct intel_dp *intel_dp,
 	if (!old_crtc_state->has_psr)
 		return;
 
-	if (WARN_ON(!CAN_PSR(dev_priv)))
+	if (drm_WARN_ON(&dev_priv->drm, !CAN_PSR(dev_priv)))
 		return;
 
 	mutex_lock(&dev_priv->psr.lock);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
