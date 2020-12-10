Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE352D53E7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 07:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7A06E9DC;
	Thu, 10 Dec 2020 06:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505FE6E9DC;
 Thu, 10 Dec 2020 06:40:36 +0000 (UTC)
IronPort-SDR: c6mgnklOVBhrqRHTm26nPGulGO0zwaMWM5nCBR/fLz0Rzn7kzzASLPx/Gk3MUa5UftbP3Q/UtT
 RozDBCFaa3IA==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174322186"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="174322186"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:36 -0800
IronPort-SDR: icUJOgzPij/QRwoWQA7KUG/mLJdog14mALKwO+18h15vw8vh7cd1DBNTO+wCh8bWJe3FkhMMAu
 PSpuPIRMUiRw==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="318854368"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:33 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 05/18] drm/i915/hdcp: DP MST transcoder for link and stream
Date: Thu, 10 Dec 2020 11:56:27 +0530
Message-Id: <20201210062640.11783-6-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210062640.11783-1-anshuman.gupta@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, Karthik B S <karthik.b.s@intel.com>,
 uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gen12 has H/W delta with respect to HDCP{1.x,2.x} display engine
instances lies in Transcoder instead of DDI as in Gen11.

This requires hdcp driver to use mst_master_transcoder for link
authentication and stream transcoder for stream encryption
separately.

This will be used for both HDCP 1.4 and HDCP 2.2 over DP MST
on Gen12.

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c          |  2 +-
 .../gpu/drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c         | 15 +++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h         |  2 +-
 5 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 6863236df1d0..14c2c0a15464 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4252,7 +4252,7 @@ static void intel_enable_ddi(struct intel_atomic_state *state,
 	if (conn_state->content_protection ==
 	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
 		intel_hdcp_enable(to_intel_connector(conn_state->connector),
-				  crtc_state->cpu_transcoder,
+				  crtc_state,
 				  (u8)conn_state->hdcp_content_type);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5bc5bfbc4551..729a9792051f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -436,6 +436,8 @@ struct intel_hdcp {
 	 * Hence caching the transcoder here.
 	 */
 	enum transcoder cpu_transcoder;
+	/* Only used for DP MST stream encryption */
+	enum transcoder stream_transcoder;
 };
 
 struct intel_connector {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 27f04aed8764..47beb442094f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -569,7 +569,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 	if (conn_state->content_protection ==
 	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
 		intel_hdcp_enable(to_intel_connector(conn_state->connector),
-				  pipe_config->cpu_transcoder,
+				  pipe_config,
 				  (u8)conn_state->hdcp_content_type);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 7d63e9495956..293f72d1d215 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2095,7 +2095,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 }
 
 int intel_hdcp_enable(struct intel_connector *connector,
-		      enum transcoder cpu_transcoder, u8 content_type)
+		      const struct intel_crtc_state *pipe_config, u8 content_type)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
@@ -2117,10 +2117,17 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	drm_WARN_ON(&dev_priv->drm,
 		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
 	hdcp->content_type = content_type;
-	hdcp->cpu_transcoder = cpu_transcoder;
+
+	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
+		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
+		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
+	} else {
+		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
+		hdcp->stream_transcoder = INVALID_TRANSCODER;
+	}
 
 	if (INTEL_GEN(dev_priv) >= 12)
-		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(cpu_transcoder);
+		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
 
 	/*
 	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
@@ -2240,7 +2247,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 
 	if (desired_and_not_enabled || content_protection_type_changed)
 		intel_hdcp_enable(connector,
-				  crtc_state->cpu_transcoder,
+				  crtc_state,
 				  (u8)conn_state->hdcp_content_type);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index 1bbf5b67ed0a..bc51c1e9b481 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -25,7 +25,7 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 int intel_hdcp_init(struct intel_connector *connector, enum port port,
 		    const struct intel_hdcp_shim *hdcp_shim);
 int intel_hdcp_enable(struct intel_connector *connector,
-		      enum transcoder cpu_transcoder, u8 content_type);
+		      const struct intel_crtc_state *pipe_config, u8 content_type);
 int intel_hdcp_disable(struct intel_connector *connector);
 void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 			    struct intel_encoder *encoder,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
