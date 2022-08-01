Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC538586BC0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C57BAFDDE;
	Mon,  1 Aug 2022 13:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B36AF2B9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:16:01 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 08A7D8415B;
 Mon,  1 Aug 2022 15:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659359760;
 bh=qKyxjWJfcbuLwp1KZT4dPgBv4lQ6t8tk/aDzvhEtjcU=;
 h=From:To:Cc:Subject:Date:From;
 b=jVP/oGFO+I+T5/61kjqaDDZz6s4R2lI6l6HvyCa+oBfZIjHje3X3j+NM9hCckDeCK
 bBqW5L9WL1aFAwyhmMSY4mYXwM/M+TsJez48IndvZYRBiC9e3MmKEqWtXbXWlWmcHO
 3ycXFFEEyUCycX+CV5Mz4IDTcbBUdUeKZO0SQnzrFP8voKA2+WhOcYEM+/jWscCcCC
 g+UhGHzKq9ntUxjzcp80e+aFCVl3lC4Pg0a+LGJ6hNl++GrgN323s2V9193ubFFGpl
 Nkl/mSr+XplUfjjxXJuOWu7DXBUVdzZJqRm4r/todNZiB9/v2EggluPcHb+sIUJRnV
 OGR5Z8xPRvfzA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: icn6211: Add and use hs_rate and lp_rate
Date: Mon,  1 Aug 2022 15:15:55 +0200
Message-Id: <20220801131555.182969-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
adjust DSI input frequency calculations such that they expect the DSI host
to configure HS clock according to hs_rate.

This is an optimization for the DSI burst mode case. In case the DSI device
supports DSI burst mode, it is recommended to operate the DSI interface at
the highest possible HS clock frequency which the DSI device supports. This
permits the DSI host to send as short as possible bursts of data on the DSI
link and keep the DSI data lanes in LP mode otherwise, which reduces power
consumption.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 481c86b2406e8..65966f280cf4e 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -259,7 +259,7 @@ static void chipone_configure_pll(struct chipone *icn,
 
 	/*
 	 * DSI byte clock frequency (input into PLL) is calculated as:
-	 *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 8
+	 *  DSI_CLK = HS clock / 4
 	 *
 	 * DPI pixel clock frequency (output from PLL) is mode clock.
 	 *
@@ -273,8 +273,7 @@ static void chipone_configure_pll(struct chipone *icn,
 	 * It seems the PLL input clock after applying P pre-divider have
 	 * to be lower than 20 MHz.
 	 */
-	fin = mode_clock * mipi_dsi_pixel_format_to_bpp(icn->dsi->format) /
-	      icn->dsi->lanes / 8; /* in Hz */
+	fin = icn->dsi->hs_rate / 4; /* in Hz */
 
 	/* Minimum value of P predivider for PLL input in 5..20 MHz */
 	p_min = clamp(DIV_ROUND_UP(fin, 20000000), 1U, 31U);
@@ -515,6 +514,8 @@ static int chipone_dsi_attach(struct chipone *icn)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->hs_rate = 500000000;
+	dsi->lp_rate = 16000000;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0)
-- 
2.35.1

