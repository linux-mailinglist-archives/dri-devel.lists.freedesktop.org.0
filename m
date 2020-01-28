Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7314BFB0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 19:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A406EF2D;
	Tue, 28 Jan 2020 18:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EACD6EF2D;
 Tue, 28 Jan 2020 18:27:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:27:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310816807"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:27:41 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [Intel-gfx] [PATCH v5 02/21] drm/i915/display/audio: Make WARN* drm
 specific where drm_priv ptr is available
Date: Tue, 28 Jan 2020 23:45:44 +0530
Message-Id: <20200128181603.27767-3-pankaj.laxminarayan.bharadiya@intel.com>
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
patch. checkpatch errors/warnings are fixed manually.

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
 drivers/gpu/drm/i915/display/intel_audio.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 3926b9b9a09f..5ffacb9c3982 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -571,7 +571,7 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
 		     encoder->base.base.id, encoder->base.name,
 		     pipe_name(pipe));
 
-	if (WARN_ON(port == PORT_A))
+	if (drm_WARN_ON(&dev_priv->drm, port == PORT_A))
 		return;
 
 	if (HAS_PCH_IBX(dev_priv)) {
@@ -622,7 +622,7 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 		    encoder->base.base.id, encoder->base.name,
 		    pipe_name(pipe), drm_eld_size(eld));
 
-	if (WARN_ON(port == PORT_A))
+	if (drm_WARN_ON(&dev_priv->drm, port == PORT_A))
 		return;
 
 	/*
@@ -818,7 +818,7 @@ static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 
 	drm_modeset_acquire_init(&ctx, 0);
 	state = drm_atomic_state_alloc(&dev_priv->drm);
-	if (WARN_ON(!state))
+	if (drm_WARN_ON(&dev_priv->drm, !state))
 		return;
 
 	state->acquire_ctx = &ctx;
@@ -839,7 +839,7 @@ static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 		goto retry;
 	}
 
-	WARN_ON(ret);
+	drm_WARN_ON(&dev_priv->drm, ret);
 
 	drm_atomic_state_put(state);
 
@@ -927,7 +927,7 @@ static int i915_audio_component_get_cdclk_freq(struct device *kdev)
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
 
-	if (WARN_ON_ONCE(!HAS_DDI(dev_priv)))
+	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_DDI(dev_priv)))
 		return -ENODEV;
 
 	return dev_priv->cdclk.hw.cdclk;
@@ -950,7 +950,8 @@ static struct intel_encoder *get_saved_enc(struct drm_i915_private *dev_priv,
 
 	/* MST */
 	if (pipe >= 0) {
-		if (WARN_ON(pipe >= ARRAY_SIZE(dev_priv->av_enc_map)))
+		if (drm_WARN_ON(&dev_priv->drm,
+				pipe >= ARRAY_SIZE(dev_priv->av_enc_map)))
 			return NULL;
 
 		encoder = dev_priv->av_enc_map[pipe];
@@ -1069,10 +1070,12 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
 	int i;
 
-	if (WARN_ON(acomp->base.ops || acomp->base.dev))
+	if (drm_WARN_ON(&dev_priv->drm, acomp->base.ops || acomp->base.dev))
 		return -EEXIST;
 
-	if (WARN_ON(!device_link_add(hda_kdev, i915_kdev, DL_FLAG_STATELESS)))
+	if (drm_WARN_ON(&dev_priv->drm,
+			!device_link_add(hda_kdev, i915_kdev,
+					 DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
 	drm_modeset_lock_all(&dev_priv->drm);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
