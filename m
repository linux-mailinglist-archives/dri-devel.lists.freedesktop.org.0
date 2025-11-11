Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D1C4E09A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 14:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED54B10E586;
	Tue, 11 Nov 2025 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOseTmYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAD410E586;
 Tue, 11 Nov 2025 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866650; x=1794402650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NApmrkyEw8Dr+NVZLTvtfSOwBJRL0dkqO3PCJ0Aw7Ag=;
 b=WOseTmYvozwOgX2imgGUfu7MgjxNn05JFNMsqno+MqIE7P7cIoYG2e7Q
 H+Dd9U367uidgdaJbuZizNKvoXLP4Ib1FPaKptIrmABIR0CFj4hAs+mDF
 ZUfyao/P0B0j7Isd+nZfFh1rhf6LYsBC4i1/57+jmmijVYDKaP5/8EZWa
 0pOPH669haO28lD3fXzpCcKAPk2oeLNNSjkm5XY6w7cxpotGT+JOGptUi
 y7/o696T6Rf5a9UmAUeASNW7fdoZ4/9uRsohCdup9nziAP1RFssNoBU5l
 uDQ6l2a6qApKLEFzjyhn39cXd6v8c1/YeUIly3LsiTI8SIupx4wgSeiwC A==;
X-CSE-ConnectionGUID: LuJmekq9SUWQkwK6STKYKQ==
X-CSE-MsgGUID: 3Z3MdbaoT3K4TXkmf4/5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967465"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967465"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:10:50 -0800
X-CSE-ConnectionGUID: 93m7ZV54T7CCRi7fYBg2pA==
X-CSE-MsgGUID: 9/w02D52SbKvg271ryFLWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129221"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:10:47 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 02/10] drm/i915/alpm: alpm_init() for DP2.1
Date: Tue, 11 Nov 2025 18:13:08 +0530
Message-Id: <20251111124316.1421013-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251111124316.1421013-1-animesh.manna@intel.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize alpm for DP2.1 and separate out alpm mutex-init
from alpm-init.

v1: Initial version.
v2: Separate out mutex-init. [Jani]
v3: Refactor further to avoid DISPLAY_VER check in multiple places. [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 16 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_alpm.h |  3 ++-
 drivers/gpu/drm/i915/display/intel_dp.c   |  8 +++++++-
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 6372f533f65b..14acd6717e59 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -41,7 +41,20 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
 }
 
-void intel_alpm_init(struct intel_dp *intel_dp)
+bool intel_alpm_source_supported(struct intel_connector *connector)
+{
+	struct intel_display *display = to_intel_display(connector);
+
+	if (!((connector->base.connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	       DISPLAY_VER(display) >= 35) ||
+	    (connector->base.connector_type == DRM_MODE_CONNECTOR_eDP &&
+	     DISPLAY_VER(display) >= 20)))
+		return false;
+
+	return true;
+}
+
+void intel_alpm_get_sink_capability(struct intel_dp *intel_dp)
 {
 	u8 dpcd;
 
@@ -49,7 +62,6 @@ void intel_alpm_init(struct intel_dp *intel_dp)
 		return;
 
 	intel_dp->alpm_dpcd = dpcd;
-	mutex_init(&intel_dp->alpm.lock);
 }
 
 static int get_silence_period_symbols(const struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 53599b464dea..bcc354a46a1d 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -15,7 +15,8 @@ struct intel_connector;
 struct intel_atomic_state;
 struct intel_crtc;
 
-void intel_alpm_init(struct intel_dp *intel_dp);
+bool intel_alpm_source_supported(struct intel_connector *connector);
+void intel_alpm_get_sink_capability(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
 void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0ec82fcbcf48..81dd5bf7e3c5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6074,6 +6074,9 @@ intel_dp_detect(struct drm_connector *_connector,
 	if (ret == 1)
 		connector->base.epoch_counter++;
 
+	if (intel_alpm_source_supported(connector))
+		intel_alpm_get_sink_capability(intel_dp);
+
 	if (!intel_dp_is_edp(intel_dp))
 		intel_psr_init_dpcd(intel_dp);
 
@@ -6716,7 +6719,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 */
 	intel_hpd_enable_detection(encoder);
 
-	intel_alpm_init(intel_dp);
+	intel_alpm_get_sink_capability(intel_dp);
 
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp, connector);
@@ -6932,6 +6935,9 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 
 	intel_psr_init(intel_dp);
 
+	if (intel_alpm_source_supported(connector))
+		mutex_init(&intel_dp->alpm.lock);
+
 	return true;
 
 fail:
-- 
2.29.0

