Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE86F4637
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EA510E589;
	Tue,  2 May 2023 14:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5735A10E589;
 Tue,  2 May 2023 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038375; x=1714574375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qQ6Q1v1VFyY+PzlfwfGKTZsgF6lskGF6w8gf0hEQDZg=;
 b=Tm9Xtqe6B/KY4/GSzGBKvxfUgTrlxUmDqSuREv5Swh5TLk/M2HtxbmUt
 W/B/sdhUO5fNfHANzTsw5IbLV/9MGUf/jkvGBmiHstDngcNDx/w84mrP4
 ++Mwg23EBZTg5F+kbB94dqp6vpunffV4rKcrCqfV9eIK6WXUW75bn3FmN
 1I8N9hm+RF+9ncgKfUUV1jLYsdjuJ6bTiAT724eKLzY+iyVxHiegdptYf
 GOgEyUmupNS8CW9mPYixRUJsAQiSfv1BB2NrFWUYIT4dbK3h6R+YmysX8
 Na8Y8f+fnAz3FY7eN24nM+Imsub8Qx+lKPKdUofnRlp0+zWoAASsZSkIJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351396921"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351396921"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991772"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991772"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:26 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/i915: Fix FEC state dump
Date: Tue,  2 May 2023 17:39:01 +0300
Message-Id: <20230502143906.2401-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop dumping state while reading it out. We have a proper
place for that stuff.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_crtc_state_dump.c    |  2 ++
 drivers/gpu/drm/i915/display/intel_ddi.c            | 13 +++----------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 0cdcaa49656f..91242ffe0768 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -257,6 +257,8 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		intel_dump_m_n_config(pipe_config, "dp m2_n2",
 				      pipe_config->lane_count,
 				      &pipe_config->dp_m2_n2);
+		drm_dbg_kms(&i915->drm, "fec: %s\n",
+			    str_enabled_disabled(pipe_config->fec_enable));
 	}
 
 	drm_dbg_kms(&i915->drm, "framestart delay: %d, MSA timing delay: %d\n",
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 41cfa28166e4..4246133950fd 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3725,17 +3725,10 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 		intel_cpu_transcoder_get_m2_n2(crtc, cpu_transcoder,
 					       &pipe_config->dp_m2_n2);
 
-		if (DISPLAY_VER(dev_priv) >= 11) {
-			i915_reg_t dp_tp_ctl = dp_tp_ctl_reg(encoder, pipe_config);
-
+		if (DISPLAY_VER(dev_priv) >= 11)
 			pipe_config->fec_enable =
-				intel_de_read(dev_priv, dp_tp_ctl) & DP_TP_CTL_FEC_ENABLE;
-
-			drm_dbg_kms(&dev_priv->drm,
-				    "[ENCODER:%d:%s] Fec status: %u\n",
-				    encoder->base.base.id, encoder->base.name,
-				    pipe_config->fec_enable);
-		}
+				intel_de_read(dev_priv,
+					      dp_tp_ctl_reg(encoder, pipe_config)) & DP_TP_CTL_FEC_ENABLE;
 
 		if (dig_port->lspcon.active && dig_port->dp.has_hdmi_sink)
 			pipe_config->infoframes.enable |=
-- 
2.39.2

