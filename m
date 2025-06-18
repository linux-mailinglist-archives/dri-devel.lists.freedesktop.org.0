Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6656BADE7A5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6AC10E7EE;
	Wed, 18 Jun 2025 09:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aJeeBGXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1110E7E6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:59:53 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0350C19A6;
 Wed, 18 Jun 2025 11:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750240780;
 bh=g0WEGwdA677eE1wtHfqeBIq1gyCesh/osK0XfjAWftA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aJeeBGXyOGQQDFdT8RnsKkZYW+e1+LjC+nunZBMAiDkfHPlL4VZDBpAhYkk9kVCir
 65Zsl/Kj/cZDkqa260px3WOT5sY0MNSPeqo+ghqu2HMGuKVVLLoirVHfqAqlL6xo9w
 hvG0nGyFYQ+e9wwttSUjvndWtJ99Ri3nB8b+XsXw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:19 +0300
Subject: [PATCH v4 16/17] drm/bridge: cdns-dsi: Tune adjusted_mode->clock
 according to dsi needs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-16-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=g0WEGwdA677eE1wtHfqeBIq1gyCesh/osK0XfjAWftA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo4CAptNbsfNWBWTUdionvulprZN4Hgpf00bq
 wIc4E2NJAiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKOAgAKCRD6PaqMvJYe
 9S+7D/wMeA1XGmizKAG3Ctowp6TLK45kbppQ8HF2fNIPG5iZQQoDL1Ektc8gxmmR/YJldZ25W8T
 wGBFdyVBU3QZNNr+HP0PRf8pSs083IIR4b92JrJ54VWGx0KNFV7YtGXdw1vPkJtK3f7Cvuop4aB
 AyE7inyZpfhZcIGP5KGA4GGujhju3lr26zdTA91u47HXno+7tn/QsfOy1YGUNPGLpp2U1rtnaHn
 9uhZxL6NIfEzUS81ytAirBoMNpId8O9y4HJqCnNiWxmRJA+/SG8h+HLmd5AasWRtmjLxQuGmxC+
 CpgaEf0hh9eL4Qho1xlt2MZWmOCP4/llFuqpXWCQ+l1Xs64UF7jfXf1Uu2QFb2NS7fE1op4tanZ
 64EyvO0NuvzyKzhrm57jOPBo/gEhflEAFNnoNzQ26qsmFIzLqOMOlDSLS9CPIrcZANehYFZBNR3
 Kyl4U98K4+3OPSwXbAYDHbedijNQva29m3oNkv7ifEG9nyodjYSchrbUBEZNY5zw+Pj8unQu/wx
 UMNckjF1G02Lmx2KPXZETFRKxyqpVLk+GIzkq+j549gVJ5pX8/z/T/hZkvwVeWFAvfG5BJDiOul
 r6yVST/wUHm/3bdIjOjfb1E7iN+HvzOIYhQdyvlUy5dVyjUnhymPuFmqcf3nNPCWW02VFUfpAX+
 R6qIJ64uIQzOhtA==
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

The driver currently expects the pixel clock and the HS clock to be
compatible, but the DPHY PLL doesn't give very finely grained rates.
This often leads to the situation where the pipeline just fails, as the
resulting HS clock is just too off.

We could change the driver to do a better job on adjusting the DSI
blanking values, hopefully getting a working pipeline even if the pclk
and HS clocks are not exactly compatible. But that is a bigger work.

What we can do easily is to see in .atomic_check() what HS clock rate we
can get, based on the pixel clock rate, and then convert the HS clock
rate back to pixel clock rate and ask that rate from the crtc. If the
crtc has a good PLL (which is the case for TI K3 SoCs), this will fix
any issues wrt. the clock rates.

If the crtc cannot provide the requested clock, well, we're no worse off
with this patch than what we have at the moment.

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 3bc4d011b4c6..114d883c65dc 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -915,6 +915,28 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static long cdns_dsi_round_pclk(struct cdns_dsi *dsi, unsigned long pclk)
+{
+	struct cdns_dsi_output *output = &dsi->output;
+	unsigned int nlanes = output->dev->lanes;
+	union phy_configure_opts phy_opts = { 0 };
+	u32 bitspp;
+	int ret;
+
+	bitspp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
+
+	ret = phy_mipi_dphy_get_default_config(pclk, bitspp, nlanes,
+					       &phy_opts.mipi_dphy);
+	if (ret)
+		return ret;
+
+	ret = phy_validate(dsi->dphy, PHY_MODE_MIPI_DPHY, 0, &phy_opts);
+	if (ret)
+		return ret;
+
+	return div_u64((u64)phy_opts.mipi_dphy.hs_clk_rate * nlanes, bitspp);
+}
+
 static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 					struct drm_bridge_state *bridge_state,
 					struct drm_crtc_state *crtc_state,
@@ -926,11 +948,26 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
 	struct videomode vm;
+	long pclk;
 
 	/* cdns-dsi requires negative syncs */
 	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	adjusted_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
 
+	/*
+	 * The DPHY PLL has quite a coarsely grained clock rate options. See
+	 * what hsclk rate we can achieve based on the pixel clock, convert it
+	 * back to pixel clock, set that to the adjusted_mode->clock. This is
+	 * all in hopes that the CRTC will be able to provide us the requested
+	 * clock, as otherwise the DPI and DSI clocks will be out of sync.
+	 */
+
+	pclk = cdns_dsi_round_pclk(dsi, adjusted_mode->clock * 1000);
+	if (pclk < 0)
+		return (int)pclk;
+
+	adjusted_mode->clock = pclk / 1000;
+
 	drm_display_mode_to_videomode(adjusted_mode, &vm);
 
 	return cdns_dsi_check_conf(dsi, &vm, dsi_cfg);

-- 
2.43.0

