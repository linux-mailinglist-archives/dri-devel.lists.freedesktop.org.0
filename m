Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B451C45C0
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 20:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF626E455;
	Mon,  4 May 2020 18:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D7F6E455;
 Mon,  4 May 2020 18:24:22 +0000 (UTC)
IronPort-SDR: zBCsLEXatfJibP94RAkk5RTdytM91Nzmndj74wE7jnf1DMuY+8omNFCFf+Gth7ITERR+q++xIk
 e7L6XHPw+J1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 11:24:22 -0700
IronPort-SDR: +HmZQlRI3NDBlIJJrMSsNyufWTIxTr8q13Dqhjfftf0dROcSrC19AyIMhXZ/maHlxFQyBwkNsy
 I3+Ps30qjEpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="369172118"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2020 11:24:17 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: [PATCH v2 3/9] drm/i915/display/sdvo: Prefer drm_WARN* over WARN*
Date: Mon,  4 May 2020 23:45:54 +0530
Message-Id: <20200504181600.18503-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN* over WARN* calls.

changes since v1:
- Added dev_priv local variable and used it in drm_WARN* calls (Jani)

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index bc6c26818e15..773523dcd107 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -411,6 +411,7 @@ static const char *sdvo_cmd_name(u8 cmd)
 static void intel_sdvo_debug_write(struct intel_sdvo *intel_sdvo, u8 cmd,
 				   const void *args, int args_len)
 {
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
 	const char *cmd_name;
 	int i, pos = 0;
 	char buffer[64];
@@ -431,7 +432,7 @@ static void intel_sdvo_debug_write(struct intel_sdvo *intel_sdvo, u8 cmd,
 	else
 		BUF_PRINT("(%02X)", cmd);
 
-	WARN_ON(pos >= sizeof(buffer) - 1);
+	drm_WARN_ON(&dev_priv->drm, pos >= sizeof(buffer) - 1);
 #undef BUF_PRINT
 
 	DRM_DEBUG_KMS("%s: W: %02X %s\n", SDVO_NAME(intel_sdvo), cmd, buffer);
@@ -533,6 +534,7 @@ static bool intel_sdvo_write_cmd(struct intel_sdvo *intel_sdvo, u8 cmd,
 static bool intel_sdvo_read_response(struct intel_sdvo *intel_sdvo,
 				     void *response, int response_len)
 {
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
 	const char *cmd_status;
 	u8 retry = 15; /* 5 quick checks, followed by 10 long checks */
 	u8 status;
@@ -597,7 +599,7 @@ static bool intel_sdvo_read_response(struct intel_sdvo *intel_sdvo,
 		BUF_PRINT(" %02X", ((u8 *)response)[i]);
 	}
 
-	WARN_ON(pos >= sizeof(buffer) - 1);
+	drm_WARN_ON(&dev_priv->drm, pos >= sizeof(buffer) - 1);
 #undef BUF_PRINT
 
 	DRM_DEBUG_KMS("%s: R: %s\n", SDVO_NAME(intel_sdvo), buffer);
@@ -1081,6 +1083,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
 					     struct intel_crtc_state *crtc_state,
 					     struct drm_connector_state *conn_state)
 {
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
 	struct hdmi_avi_infoframe *frame = &crtc_state->infoframes.avi.avi;
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
@@ -1106,7 +1109,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
 					   HDMI_QUANTIZATION_RANGE_FULL);
 
 	ret = hdmi_avi_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(&dev_priv->drm, ret))
 		return false;
 
 	return true;
@@ -1115,6 +1118,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
 static bool intel_sdvo_set_avi_infoframe(struct intel_sdvo *intel_sdvo,
 					 const struct intel_crtc_state *crtc_state)
 {
+	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
 	u8 sdvo_data[HDMI_INFOFRAME_SIZE(AVI)];
 	const union hdmi_infoframe *frame = &crtc_state->infoframes.avi;
 	ssize_t len;
@@ -1123,11 +1127,12 @@ static bool intel_sdvo_set_avi_infoframe(struct intel_sdvo *intel_sdvo,
 	     intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_AVI)) == 0)
 		return true;
 
-	if (WARN_ON(frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
+	if (drm_WARN_ON(&dev_priv->drm,
+			frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
 		return false;
 
 	len = hdmi_infoframe_pack_only(frame, sdvo_data, sizeof(sdvo_data));
-	if (WARN_ON(len < 0))
+	if (drm_WARN_ON(&dev_priv->drm, len < 0))
 		return false;
 
 	return intel_sdvo_write_infoframe(intel_sdvo, SDVO_HBUF_INDEX_AVI_IF,
@@ -1237,6 +1242,7 @@ intel_sdvo_get_preferred_input_mode(struct intel_sdvo *intel_sdvo,
 
 static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
 {
+	struct drm_i915_private *dev_priv = to_i915(pipe_config->uapi.crtc->dev);
 	unsigned dotclock = pipe_config->port_clock;
 	struct dpll *clock = &pipe_config->dpll;
 
@@ -1257,7 +1263,8 @@ static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
 		clock->m1 = 12;
 		clock->m2 = 8;
 	} else {
-		WARN(1, "SDVO TV clock out of range: %i\n", dotclock);
+		drm_WARN(&dev_priv->drm, 1,
+			 "SDVO TV clock out of range: %i\n", dotclock);
 	}
 
 	pipe_config->clock_set = true;
@@ -2293,7 +2300,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
 				return 0;
 			}
 
-		WARN_ON(1);
+		drm_WARN_ON(connector->dev, 1);
 		*val = 0;
 	} else if (property == intel_sdvo_connector->top ||
 		   property == intel_sdvo_connector->bottom)
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
