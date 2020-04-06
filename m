Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C69019F4C4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304546E357;
	Mon,  6 Apr 2020 11:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6336E354;
 Mon,  6 Apr 2020 11:37:49 +0000 (UTC)
IronPort-SDR: SnDplGuQvUHaIPwqQJzmDtrgq9NPkg4ej/25MUFmgZfLYQcHIidBu5izu5XUYkcenxIjEMKkl+
 mXHMGaZ5t+0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:37:48 -0700
IronPort-SDR: B6XxZFGhyes014mVbEAvUuvNR2SkqYNOfR7r8J3JHNzZGjBY9+t8Laz0XX8vVkhmCdRbbAt6rT
 8xf68wmGr2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192383"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:37:44 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH 07/18] drm/i915/display/dpll_mgr: Prefer drm_WARN_ON over
 WARN_ON
Date: Mon,  6 Apr 2020 16:57:49 +0530
Message-Id: <20200406112800.23762-8-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
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

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN_ON over WARN_ON at places where struct drm_device
pointer can be extracted.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 2d47f1f756a2..b45185b80bec 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -80,7 +80,7 @@ intel_atomic_get_shared_dpll_state(struct drm_atomic_state *s)
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(s);
 
-	WARN_ON(!drm_modeset_is_locked(&s->dev->mode_config.connection_mutex));
+	drm_WARN_ON(s->dev, !drm_modeset_is_locked(&s->dev->mode_config.connection_mutex));
 
 	if (!state->dpll_set) {
 		state->dpll_set = true;
@@ -979,7 +979,7 @@ hsw_ddi_spll_get_dpll(struct intel_atomic_state *state,
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
-	if (WARN_ON(crtc_state->port_clock / 2 != 135000))
+	if (drm_WARN_ON(crtc->base.dev, crtc_state->port_clock / 2 != 135000))
 		return NULL;
 
 	crtc_state->dpll_hw_state.spll = SPLL_PLL_ENABLE | SPLL_FREQ_1350MHz |
@@ -1616,7 +1616,7 @@ static int skl_ddi_wrpll_get_freq(struct drm_i915_private *i915,
 	dco_freq += ((pll_state->cfgcr1 & DPLL_CFGCR1_DCO_FRACTION_MASK) >> 9) *
 		    ref_clock / 0x8000;
 
-	if (WARN_ON(p0 == 0 || p1 == 0 || p2 == 0))
+	if (drm_WARN_ON(&i915->drm, p0 == 0 || p1 == 0 || p2 == 0))
 		return 0;
 
 	return dco_freq / (p0 * p1 * p2 * 5);
@@ -2074,7 +2074,7 @@ bxt_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state,
 
 	clk_div->p1 = best_clock.p1;
 	clk_div->p2 = best_clock.p2;
-	WARN_ON(best_clock.m1 != 2);
+	drm_WARN_ON(&i915->drm, best_clock.m1 != 2);
 	clk_div->n = best_clock.n;
 	clk_div->m2_int = best_clock.m2 >> 22;
 	clk_div->m2_frac = best_clock.m2 & ((1 << 22) - 1);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
