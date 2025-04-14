Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62978A87E99
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D082B10E57D;
	Mon, 14 Apr 2025 11:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bQ23WiUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DD410E56E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:12:13 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E3301961;
 Mon, 14 Apr 2025 13:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744629011;
 bh=5EGyGJnWI+/QCfDK21G2d3wbljoQGlKsUVbo0NY8UQY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bQ23WiUnqRx4VT8DSbHYU8HNrS19k3vpcjRxrknoGHaVyKv1BwAQna5Xs1TBfWfHY
 s1wGr0Lq3NbBg70SH+4faCtghvsQzbet1Oq4tTTNfSoTUcEl8NaMHu6TDrzzqXXibR
 L+MBXn4cesA6M4CklYFFPEFCNR4V0rpOtqNflKYQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 14 Apr 2025 14:11:16 +0300
Subject: [PATCH v3 07/17] drm/bridge: cdns-dsi: Drop crtc_* code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-cdns-dsi-impro-v3-7-4e52551d4f07@ideasonboard.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
In-Reply-To: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6355;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5EGyGJnWI+/QCfDK21G2d3wbljoQGlKsUVbo0NY8UQY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/O1+35kJUwgCKIRHTiEhA7H9qZV309KhJjlw1
 uz0HjikwFeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/ztfgAKCRD6PaqMvJYe
 9S6RD/wOzrA4ogYFrY6jZC+ZDaX6zSRmDgRQE1sdJ4KODlcRM7KfFfri91CxGco3uTDuSij8K+h
 UfLnUqo+WluamwDB9U+Wo1YKzuajyri9RsnQ/Qf0dqFX0uUsVipUq3PY2RStbWvFIYDHUwgsRyl
 XmNRipGLYdhw8EKqOuYi7inun7WMdTAKD732JHsyCWtifoTfxxicB33JMM+6kd7QCmBdNiUMzVI
 gO+08bF0cpY9RiuLgsqC7lSz5J9Uk+FkCfNXqGUBKPnzOX9a90R8dNpdS+V9RdLD+NiTztzlL8L
 LKacsE/ElddiZczdGaSeubvqPQRk4w99gY2JPMLz61/Suf/k49oJYG257b1YqLaZM7UKRi4+G+6
 htLQ6RniYpeh7kUkJRjWkwjo8VruV0eZaDuyKGivLEjjSl6D7M2Pcxx13COcsjtCClDlRelU3Jf
 ExIVCZyBMzsZvTiWcrWSi2pyZJpHS9ljMz6O2a7u5tsthy2soQ3XfUDcn8vWFOUdofHh6YalX6n
 rOsb9/fMxuZIwalKi88Ozib+I7bioB7TmUtjy+j2obNDa/2MVYnfhBe/iUcj4SrovHtKRtRyEAv
 HZSFTg12VqvTUuzrk3ZvloPcdirmd9RFsBjOykI1kmJhTuXBxfLpH298p7FPlVSnP1OkGPEDcP/
 3XBizVCawwLRylQ==
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

With recent change the cdns_dsi_check_conf() is always called with
mode_valid_check = true. We can thus remove all the code related to the
"false" paths.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 60 ++++++++------------------
 1 file changed, 17 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 5315d572f7ab..d521ddb8bf75 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -452,15 +452,6 @@ bridge_to_cdns_dsi_input(struct drm_bridge *bridge)
 	return container_of(bridge, struct cdns_dsi_input, bridge);
 }
 
-static unsigned int mode_to_dpi_hfp(const struct drm_display_mode *mode,
-				    bool mode_valid_check)
-{
-	if (mode_valid_check)
-		return mode->hsync_start - mode->hdisplay;
-
-	return mode->crtc_hsync_start - mode->crtc_hdisplay;
-}
-
 static unsigned int dpi_to_dsi_timing(unsigned int dpi_timing,
 				      unsigned int dpi_bpp,
 				      unsigned int dsi_pkt_overhead)
@@ -477,8 +468,7 @@ static unsigned int dpi_to_dsi_timing(unsigned int dpi_timing,
 
 static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 			     const struct drm_display_mode *mode,
-			     struct cdns_dsi_cfg *dsi_cfg,
-			     bool mode_valid_check)
+			     struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	unsigned int tmp;
@@ -492,30 +482,20 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 
 	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
 
-	if (mode_valid_check)
-		tmp = mode->htotal -
-		      (sync_pulse ? mode->hsync_end : mode->hsync_start);
-	else
-		tmp = mode->crtc_htotal -
-		      (sync_pulse ?
-		       mode->crtc_hsync_end : mode->crtc_hsync_start);
+	tmp = mode->htotal -
+		(sync_pulse ? mode->hsync_end : mode->hsync_start);
 
 	dsi_cfg->hbp = dpi_to_dsi_timing(tmp, bpp, DSI_HBP_FRAME_OVERHEAD);
 
 	if (sync_pulse) {
-		if (mode_valid_check)
-			tmp = mode->hsync_end - mode->hsync_start;
-		else
-			tmp = mode->crtc_hsync_end - mode->crtc_hsync_start;
+		tmp = mode->hsync_end - mode->hsync_start;
 
 		dsi_cfg->hsa = dpi_to_dsi_timing(tmp, bpp,
 						 DSI_HSA_FRAME_OVERHEAD);
 	}
 
-	dsi_cfg->hact = dpi_to_dsi_timing(mode_valid_check ?
-					  mode->hdisplay : mode->crtc_hdisplay,
-					  bpp, 0);
-	dsi_cfg->hfp = dpi_to_dsi_timing(mode_to_dpi_hfp(mode, mode_valid_check),
+	dsi_cfg->hact = dpi_to_dsi_timing(mode->hdisplay, bpp, 0);
+	dsi_cfg->hfp = dpi_to_dsi_timing(mode->hsync_start - mode->hdisplay,
 					 bpp, DSI_HFP_FRAME_OVERHEAD);
 
 	return 0;
@@ -524,14 +504,12 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 			      struct cdns_dsi_cfg *dsi_cfg,
 			      struct phy_configure_opts_mipi_dphy *phy_cfg,
-			      const struct drm_display_mode *mode,
-			      bool mode_valid_check)
+			      const struct drm_display_mode *mode)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	unsigned long long dlane_bps;
 	unsigned long adj_dsi_htotal;
 	unsigned long dsi_htotal;
-	unsigned long dpi_htotal;
 	unsigned long dpi_hz;
 	unsigned int dsi_hfp_ext;
 	unsigned int lanes = output->dev->lanes;
@@ -552,12 +530,11 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	if (dsi_htotal % lanes)
 		adj_dsi_htotal += lanes - (dsi_htotal % lanes);
 
-	dpi_hz = (mode_valid_check ? mode->clock : mode->crtc_clock) * 1000;
+	dpi_hz = mode->clock * 1000;
 	dlane_bps = (unsigned long long)dpi_hz * adj_dsi_htotal;
 
 	/* data rate in bytes/sec is not an integer, refuse the mode. */
-	dpi_htotal = mode_valid_check ? mode->htotal : mode->crtc_htotal;
-	if (do_div(dlane_bps, lanes * dpi_htotal))
+	if (do_div(dlane_bps, lanes * mode->htotal))
 		return -EINVAL;
 
 	/* data rate was in bytes/sec, convert to bits/sec. */
@@ -572,27 +549,25 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 
 static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 			       const struct drm_display_mode *mode,
-			       struct cdns_dsi_cfg *dsi_cfg,
-			       bool mode_valid_check)
+			       struct cdns_dsi_cfg *dsi_cfg)
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
 	unsigned long dsi_hss_hsa_hse_hbp;
 	unsigned int nlanes = output->dev->lanes;
-	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
 	int ret;
 
-	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg, mode_valid_check);
+	ret = cdns_dsi_mode2cfg(dsi, mode, dsi_cfg);
 	if (ret)
 		return ret;
 
-	ret = phy_mipi_dphy_get_default_config(mode_clock * 1000,
+	ret = phy_mipi_dphy_get_default_config(mode->clock * 1000,
 					       mipi_dsi_pixel_format_to_bpp(output->dev->format),
 					       nlanes, phy_cfg);
 	if (ret)
 		return ret;
 
-	ret = cdns_dsi_adjust_phy_config(dsi, dsi_cfg, phy_cfg, mode, mode_valid_check);
+	ret = cdns_dsi_adjust_phy_config(dsi, dsi_cfg, phy_cfg, mode);
 	if (ret)
 		return ret;
 
@@ -610,9 +585,8 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	 * interface.
 	 */
 	if ((u64)phy_cfg->hs_clk_rate *
-	    mode_to_dpi_hfp(mode, mode_valid_check) * nlanes <
-	    (u64)dsi_hss_hsa_hse_hbp *
-	    (mode_valid_check ? mode->clock : mode->crtc_clock) * 1000)
+	    (mode->hsync_start - mode->hdisplay) * nlanes <
+	    (u64)dsi_hss_hsa_hse_hbp * mode->clock  * 1000)
 		return -EINVAL;
 
 	return 0;
@@ -662,7 +636,7 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if ((mode->hdisplay * bpp) % 32)
 		return MODE_H_ILLEGAL;
 
-	ret = cdns_dsi_check_conf(dsi, mode, &dsi_cfg, true);
+	ret = cdns_dsi_check_conf(dsi, mode, &dsi_cfg);
 	if (ret)
 		return MODE_BAD;
 
@@ -993,7 +967,7 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	const struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
 
-	return cdns_dsi_check_conf(dsi, adjusted_mode, dsi_cfg, true);
+	return cdns_dsi_check_conf(dsi, adjusted_mode, dsi_cfg);
 }
 
 static struct drm_bridge_state *

-- 
2.43.0

