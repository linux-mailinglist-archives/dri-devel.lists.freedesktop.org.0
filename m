Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7AE428145
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EA16E30D;
	Sun, 10 Oct 2021 12:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF5D6E30F;
 Sun, 10 Oct 2021 12:34:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10132"; a="224140878"
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; d="scan'208";a="224140878"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2021 05:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; d="scan'208";a="658297901"
Received: from amanna.iind.intel.com ([10.223.74.76])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2021 05:34:12 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, mika.kahola@intel.com, jani.nikula@intel.com,
 manasi.d.navare@intel.com, jose.souza@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 5/5] drm/i915/panelreplay: Added state checker for panel
 replay state
Date: Sun, 10 Oct 2021 17:40:39 +0530
Message-Id: <20211010121039.14725-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211010121039.14725-1-animesh.manna@intel.com>
References: <20211010121039.14725-1-animesh.manna@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

has_panel_replay flag is used to check panel replay state
which is part of crtc_state structure.

v1: RFC version.
v2: has_panel_replay flag updated as per hw readout. [Jani]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 +
 drivers/gpu/drm/i915/display/intel_psr.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4f0badb11bbb..a30b6fe87dfc 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8136,6 +8136,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 			PIPE_CONF_CHECK_BOOL(has_psr);
 			PIPE_CONF_CHECK_BOOL(has_psr2);
 			PIPE_CONF_CHECK_BOOL(enable_psr2_sel_fetch);
+			PIPE_CONF_CHECK_BOOL(has_panel_replay);
 			PIPE_CONF_CHECK_I(dc3co_exitline);
 		}
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 49f6242c2fde..d1a30b82ce6f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1054,6 +1054,12 @@ void intel_psr_get_config(struct intel_encoder *encoder,
 	pipe_config->has_psr2 = intel_dp->psr.psr2_enabled;
 	pipe_config->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
 
+	if (HAS_PANEL_REPLAY(dev_priv) && HAS_DP20(dev_priv)) {
+		val = intel_de_read(dev_priv, TRANS_DP2_CTL(intel_dp->psr.transcoder));
+		if (val & TRANS_DP2_PANEL_REPLAY_ENABLE)
+			pipe_config->has_panel_replay = true;
+	}
+
 	if (!intel_dp->psr.psr2_enabled)
 		goto unlock;
 
-- 
2.29.0

