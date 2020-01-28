Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A20214BFBF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 19:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D57C6EF40;
	Tue, 28 Jan 2020 18:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299896EF3B;
 Tue, 28 Jan 2020 18:28:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310819650"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:28:28 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH v5 09/21] drm/i915/display/dpll_mgr: Make WARN*
 drm specific where drm_device ptr is available
Date: Tue, 28 Jan 2020 23:45:51 +0530
Message-Id: <20200128181603.27767-10-pankaj.laxminarayan.bharadiya@intel.com>
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
variants in functions where drm_device or drm_i915_private struct
pointer is readily available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_device *T = ...;
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_device *T,...) {
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule3@
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

@rule4@
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
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 37 ++++++++++---------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 13535c5ca3cf..2e596e88cf09 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -103,8 +103,8 @@ enum intel_dpll_id
 intel_get_shared_dpll_id(struct drm_i915_private *dev_priv,
 			 struct intel_shared_dpll *pll)
 {
-	if (WARN_ON(pll < dev_priv->shared_dplls||
-		    pll > &dev_priv->shared_dplls[dev_priv->num_shared_dpll]))
+	if (drm_WARN_ON(&dev_priv->drm, pll < dev_priv->shared_dplls ||
+			pll > &dev_priv->shared_dplls[dev_priv->num_shared_dpll]))
 		return -1;
 
 	return (enum intel_dpll_id) (pll - dev_priv->shared_dplls);
@@ -118,7 +118,8 @@ void assert_shared_dpll(struct drm_i915_private *dev_priv,
 	bool cur_state;
 	struct intel_dpll_hw_state hw_state;
 
-	if (WARN(!pll, "asserting DPLL %s with no DPLL\n", onoff(state)))
+	if (drm_WARN(&dev_priv->drm, !pll,
+		     "asserting DPLL %s with no DPLL\n", onoff(state)))
 		return;
 
 	cur_state = pll->info->funcs->get_hw_state(dev_priv, pll, &hw_state);
@@ -140,14 +141,14 @@ void intel_prepare_shared_dpll(const struct intel_crtc_state *crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 
-	if (WARN_ON(pll == NULL))
+	if (drm_WARN_ON(&dev_priv->drm, pll == NULL))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
-	WARN_ON(!pll->state.crtc_mask);
+	drm_WARN_ON(&dev_priv->drm, !pll->state.crtc_mask);
 	if (!pll->active_mask) {
 		DRM_DEBUG_DRIVER("setting up %s\n", pll->info->name);
-		WARN_ON(pll->on);
+		drm_WARN_ON(&dev_priv->drm, pll->on);
 		assert_shared_dpll_disabled(dev_priv, pll);
 
 		pll->info->funcs->prepare(dev_priv, pll);
@@ -169,14 +170,14 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 	unsigned int crtc_mask = drm_crtc_mask(&crtc->base);
 	unsigned int old_mask;
 
-	if (WARN_ON(pll == NULL))
+	if (drm_WARN_ON(&dev_priv->drm, pll == NULL))
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
 	old_mask = pll->active_mask;
 
-	if (WARN_ON(!(pll->state.crtc_mask & crtc_mask)) ||
-	    WARN_ON(pll->active_mask & crtc_mask))
+	if (drm_WARN_ON(&dev_priv->drm, !(pll->state.crtc_mask & crtc_mask)) ||
+	    drm_WARN_ON(&dev_priv->drm, pll->active_mask & crtc_mask))
 		goto out;
 
 	pll->active_mask |= crtc_mask;
@@ -186,11 +187,11 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		      crtc->base.base.id);
 
 	if (old_mask) {
-		WARN_ON(!pll->on);
+		drm_WARN_ON(&dev_priv->drm, !pll->on);
 		assert_shared_dpll_enabled(dev_priv, pll);
 		goto out;
 	}
-	WARN_ON(pll->on);
+	drm_WARN_ON(&dev_priv->drm, pll->on);
 
 	DRM_DEBUG_KMS("enabling %s\n", pll->info->name);
 	pll->info->funcs->enable(dev_priv, pll);
@@ -221,7 +222,7 @@ void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		return;
 
 	mutex_lock(&dev_priv->dpll_lock);
-	if (WARN_ON(!(pll->active_mask & crtc_mask)))
+	if (drm_WARN_ON(&dev_priv->drm, !(pll->active_mask & crtc_mask)))
 		goto out;
 
 	DRM_DEBUG_KMS("disable %s (active %x, on? %d) for crtc %d\n",
@@ -229,7 +230,7 @@ void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 		      crtc->base.base.id);
 
 	assert_shared_dpll_enabled(dev_priv, pll);
-	WARN_ON(!pll->on);
+	drm_WARN_ON(&dev_priv->drm, !pll->on);
 
 	pll->active_mask &= ~crtc_mask;
 	if (pll->active_mask)
@@ -256,7 +257,7 @@ intel_find_shared_dpll(struct intel_atomic_state *state,
 
 	shared_dpll = intel_atomic_get_shared_dpll_state(&state->base);
 
-	WARN_ON(dpll_mask & ~(BIT(I915_NUM_PLLS) - 1));
+	drm_WARN_ON(&dev_priv->drm, dpll_mask & ~(BIT(I915_NUM_PLLS) - 1));
 
 	for_each_set_bit(i, &dpll_mask, I915_NUM_PLLS) {
 		pll = &dev_priv->shared_dplls[i];
@@ -1100,7 +1101,7 @@ static bool skl_ddi_dpll0_get_hw_state(struct drm_i915_private *dev_priv,
 
 	/* DPLL0 is always enabled since it drives CDCLK */
 	val = intel_de_read(dev_priv, regs[id].ctl);
-	if (WARN_ON(!(val & LCPLL_PLL_ENABLE)))
+	if (drm_WARN_ON(&dev_priv->drm, !(val & LCPLL_PLL_ENABLE)))
 		goto out;
 
 	val = intel_de_read(dev_priv, DPLL_CTRL1);
@@ -3791,7 +3792,7 @@ void intel_shared_dpll_init(struct drm_device *dev)
 	dpll_info = dpll_mgr->dpll_info;
 
 	for (i = 0; dpll_info[i].name; i++) {
-		WARN_ON(i != dpll_info[i].id);
+		drm_WARN_ON(dev, i != dpll_info[i].id);
 		dev_priv->shared_dplls[i].info = &dpll_info[i];
 	}
 
@@ -3828,7 +3829,7 @@ bool intel_reserve_shared_dplls(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->dpll_mgr;
 
-	if (WARN_ON(!dpll_mgr))
+	if (drm_WARN_ON(&dev_priv->drm, !dpll_mgr))
 		return false;
 
 	return dpll_mgr->get_dplls(state, crtc, encoder);
@@ -3880,7 +3881,7 @@ void intel_update_active_dpll(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	const struct intel_dpll_mgr *dpll_mgr = dev_priv->dpll_mgr;
 
-	if (WARN_ON(!dpll_mgr))
+	if (drm_WARN_ON(&dev_priv->drm, !dpll_mgr))
 		return;
 
 	dpll_mgr->update_active_dpll(state, crtc, encoder);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
