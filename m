Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8D4F64D3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCA810E529;
	Wed,  6 Apr 2022 16:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDB410E506
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649262373;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=/Yq+n6cNzT+gxBZbrCtn24poPh8ut1JXnQGOstsLGOc=;
 b=jkAB9q+SB9vNysgSIZNi3GPEW3S+QAnQq2/gPBTKLq8V0nEokg0tSLcS/GbdD7vlCh
 5/Y2Ob90/X94q+oh30hBRMip+vhYVeTGPjOiZUPLoX+kBK1NovlLaT1Gj66LglwCXSoe
 7uEjGG4IiY+CkdfHYzYiwa7l9+sr5VL7QuLGqghn3t75tofLkg24tlkmg3R2r9piXdKK
 tUhyJROIl4zoEvbXKd4Xl/uxnVn4CsqAImoN0Ws1jBsjKceAMuCxRa2mqinP+LHGCNi3
 P14ZtC6gHTxPGG4ZBKQVLfHKYqOyHfc+dN3EbMzxFaGe8Nrw7BEt+qhccG7+FWTM+QNC
 4tpQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbgcbPa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy36GQDgVP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 6 Apr 2022 18:26:13 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v17 3/6] drm/bridge: dw-hdmi: filter out YUV output formats
 when DVI
Date: Wed,  6 Apr 2022 18:26:05 +0200
Message-Id: <92fce442c23ff855041bec2dfa4b4d4649c206be.1649262368.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1649262368.git.hns@goldelico.com>
References: <cover.1649262368.git.hns@goldelico.com>
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
Cc: letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Neil Armstrong <narmstrong@baylibre.com>

When the display is not an HDMI sink, only the RGB output format is
valid. Thus stop returning YUV output formats when sink is not HDMI.

Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a563460f8d209..f50af40e10340 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2538,6 +2538,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
 	struct drm_display_mode *mode = &crtc_state->mode;
+	struct dw_hdmi *hdmi = bridge->driver_private;
 	u8 max_bpc = conn_state->max_requested_bpc;
 	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
 			     (info->color_formats & DRM_COLOR_FORMAT_YCBCR420);
@@ -2564,7 +2565,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	 * If the current mode enforces 4:2:0, force the output but format
 	 * to 4:2:0 and do not add the YUV422/444/RGB formats
 	 */
-	if (conn->ycbcr_420_allowed &&
+	if (hdmi->sink_is_hdmi && conn->ycbcr_420_allowed &&
 	    (drm_mode_is_420_only(info, mode) ||
 	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
 
@@ -2595,36 +2596,36 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	 */
 
 	if (max_bpc >= 16 && info->bpc == 16) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
 	}
 
 	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
 	}
 
 	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	/* Default 8bit RGB fallback */
-- 
2.33.0

