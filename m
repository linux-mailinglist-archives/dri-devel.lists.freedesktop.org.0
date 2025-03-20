Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB90A6AAF9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3494B10E66B;
	Thu, 20 Mar 2025 16:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KHS/h/2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6438110E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:45 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1E0B836;
 Thu, 20 Mar 2025 16:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486340;
 bh=yg2ZEQSdiQylg810dHQuElWWoHgC3iltx0QPHEXmIO4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KHS/h/2KVruGDJXCBF7rM16LKwIG40LahulNfoPOx2tltCJbjLhMEarJSrgFxQt/m
 EIglisci0EWFCUniOaMj/aqeCqYONd6ju3L50qWH7gVwNMz7pUZADkDzt5sw0BXTMB
 6QKmFtsAjidi2P0L/JOu602ok+zt5gyMWUEoiVDM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Mar 2025 18:00:07 +0200
Subject: [PATCH 12/18] drm/bridge: cdns-dsi: Drop checks that shouldn't be
 in .mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-cdns-dsi-impro-v1-12-725277c5f43b@ideasonboard.com>
References: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
In-Reply-To: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5390;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=yg2ZEQSdiQylg810dHQuElWWoHgC3iltx0QPHEXmIO4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3Dua0EwNSD2oiucuSY05peszdbkGeyXUidhXF
 pKZKnNiicyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7mgAKCRD6PaqMvJYe
 9QLGEACE61QaniGMe2V3HoBhAty8dGaNXTIkEZBlfr5Avk5piW0VhVaC77eKw1+xKKOrqMiWjIq
 zQPs2Hgewpy6xpEowa+baIDGUy1OqP9GheUFDyC/WRay64HDlN6pLQiYdXpjIqkW8Ar49KKt6Sn
 WZ5DxpzcqtZjY/3hMHAocpo7lF4/UjuSequFAOwb00H0E8QGpndzaJqAVEBNQMwuRrFb8gvWmze
 YdvpGA0nS+m/XwL+pdRewOqZRpy7VkrY7oDEvtZ2u/1miIadFcsEMrvvpKYd3EnXJK7SlLDcSl8
 BzTGQ/NUD993v0ZMbdUNYUdyEIjW1KZnViqM9shk4B5soPK1JRszdvBXuC2xvcxsbqx8uYEEXiX
 US1dXUpX5S7Mcn+SVZQGW++QgRoQfIwDCWH8o6F9rZ06ZOeeDL42OUluxLu6ptv7Z+yNw3sbLdG
 1WWiuEu+vZDbqgt4Ba3RBloK34SV0OH4h8gca1gF0pS89+3oVsHAW1XRXvJwSzh0icd2DEQgAU1
 K8A86iLgNY03RG49961vgWpGdp1dUj3mhaAwED/n2K31Q3O2fgE9Ulm2b6XbEzMzZA+ycO6as+I
 8+7vLdXRbEMqDR5LVgiCGQbv3O8w3eIlvHVYa/mJyTxgWQ/QDApnLos5w0InHBr9mSU0gv3HH07
 re1ppcJzFsBBoAg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

The docs say about mode_valid():

"it is not allowed to look at anything else but the passed-in mode, and
validate it against configuration-invariant hardware constraints"

We're doing a lot more than just looking at the mode. The main issue
here is that we're doing checks based on the pixel clock, before we know
what the pixel clock from the crtc actually is.

So, drop the checks from .mode_valid(). This also allows us to remove
the 'mode_valid_check' parameter from internal functions, and the
related code.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 44 ++++++++------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index e85c8652c96e..cf783680b1b4 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -469,25 +469,17 @@ static unsigned int dpi_to_dsi_timing(unsigned int dpi_timing,
 
 static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 			     const struct drm_display_mode *mode,
-			     struct cdns_dsi_cfg *dsi_cfg,
-			     bool mode_valid_check)
+			     struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	u32 dpi_hsa, dpi_hbp, dpi_hfp, dpi_hact;
 	bool sync_pulse;
 	int bpp;
 
-	if (mode_valid_check) {
-		dpi_hsa = mode->hsync_end - mode->hsync_start;
-		dpi_hbp = mode->htotal - mode->hsync_end;
-		dpi_hfp = mode->hsync_start - mode->hdisplay;
-		dpi_hact = mode->hdisplay;
-	} else {
-		dpi_hsa = mode->crtc_hsync_end - mode->crtc_hsync_start;
-		dpi_hbp = mode->crtc_htotal - mode->crtc_hsync_end;
-		dpi_hfp =  mode->crtc_hsync_start - mode->crtc_hdisplay;
-		dpi_hact = mode->crtc_hdisplay;
-	}
+	dpi_hsa = mode->crtc_hsync_end - mode->crtc_hsync_start;
+	dpi_hbp = mode->crtc_htotal - mode->crtc_hsync_end;
+	dpi_hfp =  mode->crtc_hsync_start - mode->crtc_hdisplay;
+	dpi_hact = mode->crtc_hdisplay;
 
 	memset(dsi_cfg, 0, sizeof(*dsi_cfg));
 
@@ -518,8 +510,7 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 			      struct cdns_dsi_cfg *dsi_cfg,
 			      struct phy_configure_opts_mipi_dphy *phy_cfg,
-			      const struct drm_display_mode *mode,
-			      bool mode_valid_check)
+			      const struct drm_display_mode *mode)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	unsigned long long dlane_bps;
@@ -549,11 +540,11 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	if (dsi_htotal % lanes)
 		adj_dsi_htotal += lanes - (dsi_htotal % lanes);
 
-	dpi_hz = (mode_valid_check ? mode->clock : mode->crtc_clock) * 1000;
+	dpi_hz = mode->crtc_clock * 1000;
 	dlane_bps = (unsigned long long)dpi_hz * adj_dsi_htotal;
 
 	/* data rate in bytes/sec is not an integer, refuse the mode. */
-	dpi_htotal = mode_valid_check ? mode->htotal : mode->crtc_htotal;
+	dpi_htotal = mode->crtc_htotal;
 	if (do_div(dlane_bps, lanes * dpi_htotal))
 		return -EINVAL;
 
@@ -569,27 +560,25 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 
 static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 			       const struct drm_display_mode *mode,
-			       struct cdns_dsi_cfg *dsi_cfg,
-			       bool mode_valid_check)
+			       struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
 	unsigned int nlanes = output->dev->lanes;
-	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
 	unsigned long req_hs_clk_rate;
 	int ret;
 
-	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg, mode_valid_check);
+	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg);
 	if (ret)
 		return ret;
 
-	ret = phy_mipi_dphy_get_default_config(mode_clock * 1000,
+	ret = phy_mipi_dphy_get_default_config(mode->crtc_clock * 1000,
 					       mipi_dsi_pixel_format_to_bpp(output->dev->format),
 					       nlanes, phy_cfg);
 	if (ret)
 		return ret;
 
-	ret = cdns_dsi_adjust_phy_config(dsi, dsi_cfg, phy_cfg, mode, mode_valid_check);
+	ret = cdns_dsi_adjust_phy_config(dsi, dsi_cfg, phy_cfg, mode);
 	if (ret)
 		return ret;
 
@@ -635,8 +624,7 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_output *output = &dsi->output;
-	struct cdns_dsi_cfg dsi_cfg;
-	int bpp, ret;
+	int bpp;
 
 	/*
 	 * VFP_DSI should be less than VFP_DPI and VFP_DSI should be at
@@ -654,10 +642,6 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if ((mode->hdisplay * bpp) % 32)
 		return MODE_H_ILLEGAL;
 
-	ret = cdns_dsi_check_conf(dsi, mode, &dsi_cfg, true);
-	if (ret)
-		return MODE_BAD;
-
 	return MODE_OK;
 }
 
@@ -996,7 +980,7 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	adjusted_crtc_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	adjusted_crtc_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
 
-	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
+	return cdns_dsi_check_conf(dsi, mode, dsi_cfg);
 }
 
 static struct drm_bridge_state *

-- 
2.43.0

