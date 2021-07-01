Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294A63B9799
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E396EC60;
	Thu,  1 Jul 2021 20:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A8A6EC13;
 Thu,  1 Jul 2021 20:25:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436164"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436164"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564506"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 35/53] drm/i915/dg2: Skip shared DPLL handling
Date: Thu,  1 Jul 2021 13:24:09 -0700
Message-Id: <20210701202427.1547543-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DG2 has no shared DPLL's or DDI clock muxing.  The Port PLL is embedded
within the PHY.

Bspec: 54032
Bspec: 54034
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 10 +++++++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  5 ++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 026c28c612f0..c673d0c8fb4a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3474,7 +3474,8 @@ static void icl_ddi_bigjoiner_pre_enable(struct intel_atomic_state *state,
 		 * Enable sequence steps 1-7 on bigjoiner master
 		 */
 		intel_encoders_pre_pll_enable(state, master);
-		intel_enable_shared_dpll(master_crtc_state);
+		if (master_crtc_state->shared_dpll)
+			intel_enable_shared_dpll(master_crtc_state);
 		intel_encoders_pre_enable(state, master);
 
 		/* and DSC on slave */
@@ -8633,10 +8634,11 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_BOOL(double_wide);
 
-	PIPE_CONF_CHECK_P(shared_dpll);
+	if (dev_priv->dpll.mgr)
+		PIPE_CONF_CHECK_P(shared_dpll);
 
 	/* FIXME do the readout properly and get rid of this quirk */
-	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE)) {
+	if (dev_priv->dpll.mgr && !PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE)) {
 		PIPE_CONF_CHECK_X(dpll_hw_state.dpll);
 		PIPE_CONF_CHECK_X(dpll_hw_state.dpll_md);
 		PIPE_CONF_CHECK_X(dpll_hw_state.fp0);
@@ -8668,7 +8670,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_X(dpll_hw_state.mg_pll_ssc);
 		PIPE_CONF_CHECK_X(dpll_hw_state.mg_pll_bias);
 		PIPE_CONF_CHECK_X(dpll_hw_state.mg_pll_tdc_coldst_bias);
+	}
 
+	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE)) {
 		PIPE_CONF_CHECK_X(dsi_pll.ctrl);
 		PIPE_CONF_CHECK_X(dsi_pll.div);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 882bfd499e55..5688d9704636 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4462,7 +4462,10 @@ void intel_shared_dpll_init(struct drm_device *dev)
 	const struct dpll_info *dpll_info;
 	int i;
 
-	if (IS_ALDERLAKE_P(dev_priv))
+	if (IS_DG2(dev_priv))
+		/* No shared DPLLs on DG2; port PLLs are part of the PHY */
+		dpll_mgr = NULL;
+	else if (IS_ALDERLAKE_P(dev_priv))
 		dpll_mgr = &adlp_pll_mgr;
 	else if (IS_ALDERLAKE_S(dev_priv))
 		dpll_mgr = &adls_pll_mgr;
-- 
2.25.4

