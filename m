Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944334BC35F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C7610EAA1;
	Sat, 19 Feb 2022 00:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4694A10EA7E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:07 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A138683BA7;
 Sat, 19 Feb 2022 01:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230545;
 bh=8G+mZS1H1Dpc2GiUJHF619u1Fp150ZofVi99t8q/8Cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hJ7qKpA8wVBYYMuPZQT9HLs7E4tm5dueRy4rvqA/T4RyCbACumqJozwtwfuRwv/Ot
 VAbcG1W3GWrGE+hjGRcO9zC4TQJlBgJzo5zwIC2I9+9K2CTHBj0PfkH+Nd4dEGSIi9
 FUnkTcg5i3jqrh7uFiTp6FFzb0jPChGAEb+glqi+PnRddp4nzRmlCuvuRjs8oU48HZ
 thFvecUvaNoQ7cfEe3o/cvz2vM1Cl8iLT+t4sF0XzSjc7h9zHdnXgwZjxUqIdCwWkJ
 dHuJhubWpB/RVsFIbqrij7yZ7ik7mjogxwQ9oGhMkl5utQPT+UAs48wQbRk/1Hl1wQ
 JyVFeH5f3861A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/bridge: dw-mipi-dsi: Prefer DSI bus clock settings
 from bridge_state
Date: Sat, 19 Feb 2022 01:28:43 +0100
Message-Id: <20220219002844.362157-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219002844.362157-1-marex@denx.de>
References: <20220219002844.362157-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge_state now contains clock frequency required by the next bridge.
This information is optional, since very few drivers pass this information
now. In case the required clock frequency is part of bridge state, use it
for the DSI bus clock frequency, otherwise fall back to the old guesswork.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 0132e576339dd..e3fea94db9bfa 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -258,13 +258,17 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 
 	pll_in_khz = (unsigned int)(clk_get_rate(dsi->pllref_clk) / 1000);
 
-	/* Compute requested pll out */
-	bpp = mipi_dsi_pixel_format_to_bpp(format);
-	pll_out_khz = mode->clock * bpp / lanes;
+	pll_out_khz = bridge_state->output_bus_cfg.clock;
 
-	/* Add 20% to pll out to be higher than pixel bw (burst mode only) */
-	if (mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
-		pll_out_khz = (pll_out_khz * 12) / 10;
+	if (pll_out_khz == 0) {
+		/* Guess requested pll out */
+		bpp = mipi_dsi_pixel_format_to_bpp(format);
+		pll_out_khz = mode->clock * bpp / lanes;
+
+		/* Add 20% to pll out to be higher than pixel bw (burst mode only) */
+		if (mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+			pll_out_khz = (pll_out_khz * 12) / 10;
+	}
 
 	if (pll_out_khz > dsi->lane_max_kbps) {
 		pll_out_khz = dsi->lane_max_kbps;
-- 
2.34.1

