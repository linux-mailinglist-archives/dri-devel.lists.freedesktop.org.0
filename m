Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F05B79AB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 20:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A0310E1C7;
	Tue, 13 Sep 2022 18:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7220310E0C3;
 Tue, 13 Sep 2022 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663094059; x=1694630059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R3OnSYxX1HJAfkSbuxNxo/plWSGohAmAF1a8dNk/fa4=;
 b=AB4kAeez8or5dflNPjSdTSuI9jaXhrRL+SQTvxZdN50eZgwJkr2zBWU8
 hdJXcbxMGEpNtjrcdfWMmlkl0ZuR+vhZdEXbfUS2nW1gkKzYp6CwTJmic
 foc2Rs7PyShOROmgCHpRviyW++T+/KcuCH9qs62WoWYXsy565QPtZjDHM
 2rHTTpKEqlsovb3k5uxI0HN2Yv9BGmW8WiFkOOcZm8mCt7GIVHiY1Rtzf
 scL/qZ+TSQ6ZlxYrXG7H6P6sIun2qT8dLNsbOPjQ14isVrX/ZYaqqqtoA
 62stmTWCeT7ae6+1tw4kTPNB/qTSA48NUrSk0G5Fkoqp5Z8rQiCglolZK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="281235529"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="281235529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="647045106"
Received: from invictus.jf.intel.com ([10.165.21.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 5/5] drm/i915/mtl: Update CHICKEN_TRANS* register addresses
Date: Tue, 13 Sep 2022 11:33:41 -0700
Message-Id: <20220913183341.908028-6-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
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

In Display version 14, Transcoder Chicken Registers have updated address.
This patch performs checks to use the right register when required.

v2: Omit display version check in i915_reg.h(Jani)
v3:
 - Remove extra whitespace introduced
 - Fix reg definitions for MTL_CHICKEN_TRANS(MattR)

Bspec: 34387, 50054
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c  |  5 ++++-
 drivers/gpu/drm/i915/i915_reg.h              |  7 +++++++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a0829dcfd6d3..e94a7e1d6fe6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -620,7 +620,10 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
 	if (!IS_I830(dev_priv))
 		val &= ~PIPECONF_ENABLE;
 
-	if (DISPLAY_VER(dev_priv) >= 12)
+	if (DISPLAY_VER(dev_priv) >= 14)
+		intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(cpu_transcoder),
+			     FECSTALL_DIS_DPTSTREAM_DPTTG, 0);
+	else if (DISPLAY_VER(dev_priv) >= 12)
 		intel_de_rmw(dev_priv, CHICKEN_TRANS(cpu_transcoder),
 			     FECSTALL_DIS_DPTSTREAM_DPTTG, 0);
 
@@ -1840,7 +1843,9 @@ static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	i915_reg_t reg = CHICKEN_TRANS(crtc_state->cpu_transcoder);
+	enum transcoder transcoder = crtc_state->cpu_transcoder;
+	i915_reg_t reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(transcoder) :
+			 CHICKEN_TRANS(transcoder);
 	u32 val;
 
 	val = intel_de_read(dev_priv, reg);
@@ -4037,6 +4042,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_display_power_domain_set power_domain_set = { };
+	i915_reg_t reg;
 	bool active;
 	u32 tmp;
 
@@ -4128,7 +4134,9 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	}
 
 	if (!transcoder_is_dsi(pipe_config->cpu_transcoder)) {
-		tmp = intel_de_read(dev_priv, CHICKEN_TRANS(pipe_config->cpu_transcoder));
+		reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(pipe_config->cpu_transcoder) :
+			CHICKEN_TRANS(pipe_config->cpu_transcoder);
+		tmp = intel_de_read(dev_priv, reg);
 
 		pipe_config->framestart_delay = REG_FIELD_GET(HSW_FRAME_START_DELAY_MASK, tmp) + 1;
 	} else {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 5adfd226d6c4..03604a37931c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -565,7 +565,10 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
 				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
 
-	if (DISPLAY_VER(dev_priv) >= 12 && pipe_config->fec_enable)
+	if (DISPLAY_VER(dev_priv) >= 14 && pipe_config->fec_enable)
+		intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(trans), 0,
+			     FECSTALL_DIS_DPTSTREAM_DPTTG);
+	else if (DISPLAY_VER(dev_priv) >= 12 && pipe_config->fec_enable)
 		intel_de_rmw(dev_priv, CHICKEN_TRANS(trans), 0,
 			     FECSTALL_DIS_DPTSTREAM_DPTTG);
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index fc57f304c16e..acfcd155c8d0 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -5728,6 +5728,13 @@
 					    [TRANSCODER_B] = _CHICKEN_TRANS_B, \
 					    [TRANSCODER_C] = _CHICKEN_TRANS_C, \
 					    [TRANSCODER_D] = _CHICKEN_TRANS_D))
+
+#define _MTL_CHICKEN_TRANS_A	0x604e0
+#define _MTL_CHICKEN_TRANS_B	0x614e0
+#define MTL_CHICKEN_TRANS(trans)	_MMIO_TRANS((trans), \
+						    _MTL_CHICKEN_TRANS_A, \
+						    _MTL_CHICKEN_TRANS_B)
+
 #define  HSW_FRAME_START_DELAY_MASK	REG_GENMASK(28, 27)
 #define  HSW_FRAME_START_DELAY(x)	REG_FIELD_PREP(HSW_FRAME_START_DELAY_MASK, x)
 #define  VSC_DATA_SEL_SOFTWARE_CONTROL	REG_BIT(25) /* GLK */
-- 
2.34.1

