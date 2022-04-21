Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D947850A8F2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 21:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216810E9F8;
	Thu, 21 Apr 2022 19:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434EA10E04A;
 Thu, 21 Apr 2022 19:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650568838; x=1682104838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAnyxfLIOUPHnmSNusUOK5vUe3M9S9hQsZxoFQCK9J0=;
 b=F/LDu9ZCarmqUkWIamESZ9TpLiwTOTnx8wi1Sq8/jgFRKtryQ+hfQHTn
 2pDnGxGvUPXrzthacqIo/HSB5Dq8G+FMVlA3eqCF8Zoe/tKvjjeF7mNl2
 WtWVfpFDD5Hdw9J9Nec7VCrUBwVQ3RbPp5ntKnuxC8EhaoZV+YoH3G1Mz
 pA3tqAfdEiYUtPd6QQgaiT9DTOVhiJ4ECWL6t8cGNaEsIOSsJiKSwXnyf
 h+h5cqCkl8gHujTCP7+dHsWK1gM629hcLCa6BMgGelVkyGyIrjk8Q2Iuf
 /rwap6awKgVfBlJr7wG8DW2O+sEzKuj59BDGOjQxZMSnWMc8m4U75zr2w Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="251776737"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="251776737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 12:20:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="533556669"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.139])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 12:20:36 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/display: Replace crtc_state's has_drrs by
 drrs_downclock_mode
Date: Thu, 21 Apr 2022 12:22:04 -0700
Message-Id: <20220421192205.32649-2-jose.souza@intel.com>
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

Will be adding some additional control options to DRRS that will
require to have the DRRS downclock mode stored in the crtc_state.

So to optimize memory usage a bit here using it to replace has_drrs
as we can check if the drrs_downclock_mode pointer is different than
null to have the same behavior has has_drrs.

Cc: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c         | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_types.h   | 4 +++-
 drivers/gpu/drm/i915/display/intel_dp.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c            | 4 ++--
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0ddfce21a828d..a5f5caeced9a0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5360,7 +5360,7 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 
 	drm_dbg_kms(&dev_priv->drm, "ips: %i, double wide: %i, drrs: %i\n",
 		    pipe_config->ips_enabled, pipe_config->double_wide,
-		    pipe_config->has_drrs);
+		    CRTC_STATE_HAS_DRRS(pipe_config));
 
 	intel_dpll_dump_hw_state(dev_priv, &pipe_config->dpll_hw_state);
 
@@ -7088,7 +7088,7 @@ static void intel_crtc_copy_fastset(const struct intel_crtc_state *old_crtc_stat
 	new_crtc_state->fdi_m_n = old_crtc_state->fdi_m_n;
 	new_crtc_state->dp_m_n = old_crtc_state->dp_m_n;
 	new_crtc_state->dp_m2_n2 = old_crtc_state->dp_m2_n2;
-	new_crtc_state->has_drrs = old_crtc_state->has_drrs;
+	new_crtc_state->drrs_downclock_mode = old_crtc_state->drrs_downclock_mode;
 }
 
 static int intel_crtc_add_planes_to_state(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 452d773fd4e34..f9720562336da 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1096,7 +1096,7 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 
 		/* DRRS Supported */
 		seq_printf(m, "\tDRRS Enabled: %s\n",
-			   str_yes_no(crtc_state->has_drrs));
+			   str_yes_no(CRTC_STATE_HAS_DRRS(crtc_state)));
 
 		seq_printf(m, "\tDRRS Active: %s\n",
 			   str_yes_no(intel_drrs_is_active(crtc)));
@@ -1786,7 +1786,7 @@ static int i915_drrs_ctl_set(void *data, u64 val)
 		crtc_state = to_intel_crtc_state(crtc->base.state);
 
 		if (!crtc_state->hw.active ||
-		    !crtc_state->has_drrs)
+		    !CRTC_STATE_HAS_DRRS(crtc_state))
 			goto out;
 
 		commit = crtc_state->uapi.commit;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index cfd042117b109..f0b3cfd3138ce 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1056,7 +1056,7 @@ struct intel_crtc_state {
 
 	/* m2_n2 for eDP downclock */
 	struct intel_link_m_n dp_m2_n2;
-	bool has_drrs;
+	const struct drm_display_mode *drrs_downclock_mode;
 
 	/* PSR is supported but might not be enabled due the lack of enabled planes */
 	bool has_psr;
@@ -1264,6 +1264,8 @@ enum drrs_refresh_rate {
 	DRRS_REFRESH_RATE_LOW,
 };
 
+#define CRTC_STATE_HAS_DRRS(crtc_state) (!!((crtc_state)->drrs_downclock_mode))
+
 #define INTEL_PIPE_CRC_ENTRIES_NR	128
 struct intel_pipe_crc {
 	spinlock_t lock;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d55acc4a028a8..feea172dd2753 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1881,7 +1881,7 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 	if (IS_IRONLAKE(i915) || IS_SANDYBRIDGE(i915) || IS_IVYBRIDGE(i915))
 		pipe_config->msa_timing_delay = i915->vbt.edp.drrs_msa_timing_delay;
 
-	pipe_config->has_drrs = true;
+	pipe_config->drrs_downclock_mode = downclock_mode;
 
 	pixel_clock = downclock_mode->clock;
 	if (pipe_config->splitter.enable)
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 166caf293f7bc..dd527dfc2d1d5 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -144,7 +144,7 @@ void intel_drrs_activate(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
-	if (!crtc_state->has_drrs)
+	if (!CRTC_STATE_HAS_DRRS(crtc_state))
 		return;
 
 	if (!crtc_state->hw.active)
@@ -176,7 +176,7 @@ void intel_drrs_deactivate(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 
-	if (!old_crtc_state->has_drrs)
+	if (!CRTC_STATE_HAS_DRRS(old_crtc_state))
 		return;
 
 	if (!old_crtc_state->hw.active)
-- 
2.36.0

