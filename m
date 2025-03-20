Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB101A6AA9E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2B710E665;
	Thu, 20 Mar 2025 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l4q+8nmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03210E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:44 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA3BC1AA2;
 Thu, 20 Mar 2025 16:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486339;
 bh=2qJfC7oDxsjuiQHnkQy9vy3BrMM57VcAHQdpuKoTbDE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=l4q+8nmiKdZvGDdc4OF/N3AdHW/hYrdnKPDiPj/sJk6FfqycU2hhQ93rZv1efxbaB
 LznJj8ygVtS9xZVB4yYIVCvdSGhF1pTPNhcCL6vShI5sUrfl+uXqES+ESVhoYkc2ap
 LrbFF6/MzrQxRW0ZjQPL7ANVXp9KZr1qtnsK9hts=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Mar 2025 18:00:06 +0200
Subject: [PATCH 11/18] drm/bridge: cdns-dsi: Remove broken fifo emptying check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-cdns-dsi-impro-v1-11-725277c5f43b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2637;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2qJfC7oDxsjuiQHnkQy9vy3BrMM57VcAHQdpuKoTbDE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3DuaQq9hV+Av0sNdDt5WPw0dUmqMOoU6xMT7X
 vNEd8uoI8aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7mgAKCRD6PaqMvJYe
 9VwuD/wOzrCBJ07hi2Fzd8rgAuPYU4vIAjyi0cYLPgPPSuo5f9GUyA5kIfobRS3C8XQuvfoPqXx
 WJi4nr8P0/3yU+1+KjRO8GS7hMRwNuRoYH1b7SpQaF0UFViTd1YLlv7HBaoxe/A5IHiKRxuxsEa
 s/F3TeTfmTpo6v8g5nRJCORUsKfAWzbEuiqnMVG+hHVd1O9wZ2tT1QHkZFgKEd8xu1QMhXrQar/
 VXJLYi0XAGqeWgdrnZlgxVODy7Em6JTK96/LOcF5S9pkV6R49Ceq7R+08R70N1bVpvzf9vKk6RO
 ufH0ndj5MHWMP6ocByN/vZm+57FacEACdaUXRJ3od2f78jqk/Qfrc5w9fu+adN1OLNaQOMdf2Iv
 gW3tk/LRQ0Rh1aziNOghLhUpJI1VmYVDHCOXpkZ5IZaTWjlImcw2/F8NEAgDqH5Ygm8sTnm7kRr
 +cqsmF2xeAwW1H6YnSi3hjaUlXPTqUlJ6GZTtcA0/hE6O2Tv7GdwzP/yRlhEkjrIN7mCHaGvaAl
 KkyBnR1c0+bR1rCPGalh6i/Ze1PLT3JlPpIr8uaIXVw8vsFoS/gEgKTwMOn0n8EZuwxwo5NI9L7
 6T9DCNBtAniF7T5W9n/wVtxSM8vwALecjTYgik2u8v/36cLBf2Oz68Cg25NNrSwq+PeZ3usOEts
 41ThLQtzdq22QqQ==
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

The driver check if "DPI(HFP) > DSI(HSS+HSA+HSE+HBP)", and rejects the
mode if not.

However, testing shows that this doesn't hold at all. I can set the hfp
to very small values, with no errors. The feedback from the HW team also
was that the check is not right, although it's not clear if there's a
way to validate the FIFO emptying.

The check rejects quite a lot of modes, apparently for no good reason,
so drop the check.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 28 --------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 9797e6faa29d..e85c8652c96e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -453,15 +453,6 @@ bridge_to_cdns_dsi_input(struct drm_bridge *bridge)
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
@@ -583,7 +574,6 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 {
 	struct cdns_dsi_output *output = &dsi->output;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
-	unsigned long dsi_hss_hsa_hse_hbp;
 	unsigned int nlanes = output->dev->lanes;
 	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
 	unsigned long req_hs_clk_rate;
@@ -617,24 +607,6 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 		return -EINVAL;
 	}
 
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
-		dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_PULSE_OVERHEAD;
-		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
-	} else {
-		dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_EVENT_OVERHEAD;
-	}
-
-	/*
-	 * Make sure DPI(HFP) > DSI(HSS+HSA+HSE+HBP) to guarantee that the FIFO
-	 * is empty before we start a receiving a new line on the DPI
-	 * interface.
-	 */
-	if ((u64)phy_cfg->hs_clk_rate *
-	    mode_to_dpi_hfp(mode, mode_valid_check) * nlanes <
-	    (u64)dsi_hss_hsa_hse_hbp *
-	    (mode_valid_check ? mode->clock : mode->crtc_clock) * 1000)
-		return -EINVAL;
-
 	return 0;
 }
 

-- 
2.43.0

