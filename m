Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6065FFCC6
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 02:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B9810E664;
	Sun, 16 Oct 2022 00:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A1310E664
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 00:36:38 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 36DA084B85;
 Sun, 16 Oct 2022 02:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665880596;
 bh=EPg+0LOarfriNQNX6KiyBHGTGiW3jqfPww7zGfyzImk=;
 h=From:To:Cc:Subject:Date:From;
 b=Kwva37GbDlrqaX9MN3ztWu3t+DRqRwJRPXD2ZeE3Bqc3aE7Lf4CCHLolnVQad43jO
 /ixTw2pazOM6i30VyLFNvGs7uHripRDGIBTA5uD7IUWkL0YpdApAibg36+Wkyjqz6F
 /6y8txZT+KUZpbf5REy/s9ERrnOqIra6TfWs3IBZPgt5EvAa21F2bQeHPQZLRkiA36
 f5WI5Vpb2QrnWDTImLqyUGGgpwzFz5SFmICF8L34omcTB/7RJtNR8efxFXsT4W8vrq
 9EVkPw6J06XrJCgdnXg1GA9To7+dYgGMeN88TgGWqrVv0NykHHv4qPjAIfOv8LzE/n
 MJn5yIkX/brLw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358767: Enable DSI burst mode, LPM,
 non-continuous clock
Date: Sun, 16 Oct 2022 02:36:32 +0200
Message-Id: <20221016003632.406468-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are capable of DSI burst mode, which
is more energy efficient than the non-burst modes. Make use of it.

The TC358767/TC358867/TC9595 are capable of DSI non-continuous clock,
since it sources the internal PLL clock from external clock source.
The DSI non-continuous clock further reduces power utilization.

The TC358767/TC358867/TC9595 may use DSI LPM for command transmissions,
make sure this is configured correctly in the DSI mode flags.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 67f294f96e823..b5f4e5328eaf9 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1899,10 +1899,10 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 				     "failed to create dsi device\n");
 
 	tc->dsi = dsi;
-
 	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
-- 
2.35.1

