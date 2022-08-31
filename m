Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3D5A887E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD9C10E50F;
	Wed, 31 Aug 2022 21:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFE410E4FC;
 Wed, 31 Aug 2022 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982633; x=1693518633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+8rlYXMj72qCk6HjdAqhiECsNGTLqQrR1uLFxxPqBk=;
 b=axvWr4eVXLwCHtUEWqyIRnDuP17gjyiqw4AzTHQKyfkZ3LWU2aF+DzQs
 dD+jZ73BNLk6o6bvaQ7s6tbqBY+HuMClimSvtw+XVyPnlB0kT7srBcqBc
 6FFAxBI7nbhJEq5Z1VtTJTaRfa7HLinklD+PMuTESC71fnMedtLTFe/vq
 vJEoVzNIdTCbDwGoMTtPCUOa5L1pYsKVzAVEFQdaQ4YKKcj+8oJs9GCOk
 Awj4QSnuAYP5mVhqS3VjHmzT3n8TX8Qp3AkVeKVZB35BCH5cGEnT+A7tr
 cGkTlKdUcHQr99qRysW2QmW8vKp8DSb3oSSGLNJ1mHF0Uorgpb09HTqxM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="357270168"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="357270168"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586243"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:32 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/11] drm/i915/mtl: Update CHICKEN_TRANS* register
 addresses
Date: Wed, 31 Aug 2022 14:49:57 -0700
Message-Id: <20220831214958.109753-11-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>

In Display version 14, Transcoder Chicken Registers are moved from DPRZ to DRPOS
to reduce register signal crossings for Unit Interface Optimization.

This patch modifies the CHICKEN_TRANS macro to add a DISPLAY_VER check for
calculating the correct platform offsets.

(And also updates existing CHICKEN_TRANS occurrences to the new definition)

v2: Omit display version check in i915_reg.h(Jani)

Bspec: 34387, 50054
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c  |  5 +++-
 drivers/gpu/drm/i915/display/intel_psr.c     |  6 +++--
 drivers/gpu/drm/i915/i915_reg.h              | 25 +++++++++++++++-----
 4 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index be7cff722196..a3d0d12084a9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -618,7 +618,10 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
 	if (!IS_I830(dev_priv))
 		val &= ~PIPECONF_ENABLE;
 
-	if (DISPLAY_VER(dev_priv) >= 12)
+	if (DISPLAY_VER(dev_priv) >= 14)
+		intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(cpu_transcoder),
+			     FECSTALL_DIS_DPTSTREAM_DPTTG, 0);
+	else if (DISPLAY_VER(dev_priv) >= 12)
 		intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder),
 			     FECSTALL_DIS_DPTSTREAM_DPTTG, 0);
 
@@ -1838,7 +1841,9 @@ static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	i915_reg_t reg = CHICKEN_TRANS(crtc_state->cpu_transcoder);
+	enum transcoder transcoder = crtc_state->cpu_transcoder;
+	i915_reg_t reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(transcoder) :
+			 CHICKEN_TRANS(transcoder);
 	u32 val;
 
 	val = intel_de_read(dev_priv, reg);
@@ -4033,6 +4038,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_display_power_domain_set power_domain_set = { };
+	i915_reg_t reg;
 	bool active;
 	u32 tmp;
 
@@ -4124,7 +4130,9 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	}
 
 	if (!transcoder_is_dsi(pipe_config->cpu_transcoder)) {
-		tmp = intel_de_read(dev_priv, CHICKEN_TRANS(pipe_config->cpu_transcoder));
+		reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(pipe_config->cpu_transcoder) :
+			CHICKEN_TRANS(pipe_config->cpu_transcoder);
+		tmp = intel_de_read(dev_priv, reg);
 
 		pipe_config->framestart_delay = REG_FIELD_GET(HSW_FRAME_START_DELAY_MASK, tmp) + 1;
 	} else {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 13abe2b2170e..298004cae5a5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -568,7 +568,10 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
 				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
 
-	if (DISPLAY_VER(dev_priv) >= 12 && pipe_config->fec_enable)
+	if (DISPLAY_VER(dev_priv) >= 14 && pipe_config->fec_enable)
+		intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(trans), 0,
+			     FECSTALL_DIS_DPTSTREAM_DPTTG);
+	else if (DISPLAY_VER(dev_priv) >= 12 && pipe_config->fec_enable)
 		intel_de_rmw(dev_priv, CHICKEN_TRANS(trans), 0,
 			     FECSTALL_DIS_DPTSTREAM_DPTTG);
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 079b7d3d0c53..da2d0661b630 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1139,7 +1139,8 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 
 	if (intel_dp->psr.psr2_enabled) {
 		if (DISPLAY_VER(dev_priv) == 9)
-			intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder), 0,
+			intel_de_rmw(dev_priv,
+				     CHICKEN_TRANS(cpu_transcoder), 0,
 				     PSR2_VSC_ENABLE_PROG_HEADER |
 				     PSR2_ADD_VERTICAL_LINE_COUNT);
 
@@ -1149,7 +1150,8 @@ static void intel_psr_enable_source(struct intel_dp *intel_dp,
 		 * cause issues if non-supported panels are used.
 		 */
 		if (IS_ALDERLAKE_P(dev_priv))
-			intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder), 0,
+			intel_de_rmw(dev_priv,
+				     CHICKEN_TRANS(cpu_transcoder), 0,
 				     ADLP_1_BASED_X_GRANULARITY);
 
 		/* Wa_16011168373:adl-p */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index f9237586ab4f..8be7685e8a3e 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -5717,17 +5717,30 @@
 #define  SKL_PLANE1_STRETCH_MAX_X1	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 3)
 #define CHICKEN_PIPESL_1(pipe) _MMIO_PIPE(pipe, _CHICKEN_PIPESL_1_A, _CHICKEN_PIPESL_1_B)
 
+#define _MTL_CHICKEN_TRANS_A	0x604e0
+#define _MTL_CHICKEN_TRANS_B	0x614e0
+#define _MTL_CHICKEN_TRANS_C	0x624e0
+#define _MTL_CHICKEN_TRANS_D	0x634e0
+
 #define _CHICKEN_TRANS_A	0x420c0
 #define _CHICKEN_TRANS_B	0x420c4
 #define _CHICKEN_TRANS_C	0x420c8
 #define _CHICKEN_TRANS_EDP	0x420cc
 #define _CHICKEN_TRANS_D	0x420d8
-#define CHICKEN_TRANS(trans)	_MMIO(_PICK((trans), \
-					    [TRANSCODER_EDP] = _CHICKEN_TRANS_EDP, \
-					    [TRANSCODER_A] = _CHICKEN_TRANS_A, \
-					    [TRANSCODER_B] = _CHICKEN_TRANS_B, \
-					    [TRANSCODER_C] = _CHICKEN_TRANS_C, \
-					    [TRANSCODER_D] = _CHICKEN_TRANS_D))
+
+#define  CHICKEN_TRANS(trans)		    _MMIO(_PICK((trans), \
+						[TRANSCODER_EDP] = _CHICKEN_TRANS_EDP, \
+						[TRANSCODER_A] = _CHICKEN_TRANS_A, \
+						[TRANSCODER_B] = _CHICKEN_TRANS_B, \
+						[TRANSCODER_C] = _CHICKEN_TRANS_C, \
+						[TRANSCODER_D] = _CHICKEN_TRANS_D))
+
+#define  MTL_CHICKEN_TRANS(trans)	    _MMIO(_PICK((trans), \
+						[TRANSCODER_A] = _MTL_CHICKEN_TRANS_A, \
+						[TRANSCODER_B] = _MTL_CHICKEN_TRANS_B, \
+						[TRANSCODER_C] = _MTL_CHICKEN_TRANS_C, \
+						[TRANSCODER_D] = _MTL_CHICKEN_TRANS_D))
+
 #define  HSW_FRAME_START_DELAY_MASK	REG_GENMASK(28, 27)
 #define  HSW_FRAME_START_DELAY(x)	REG_FIELD_PREP(HSW_FRAME_START_DELAY_MASK, x)
 #define  VSC_DATA_SEL_SOFTWARE_CONTROL	REG_BIT(25) /* GLK */
-- 
2.25.1

