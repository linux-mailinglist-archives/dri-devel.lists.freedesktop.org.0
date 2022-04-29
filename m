Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4351560F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FE910FA94;
	Fri, 29 Apr 2022 20:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B22D10FA94
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:46:30 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2E4CE83966;
 Fri, 29 Apr 2022 22:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651265188;
 bh=j3YsoQEdJyq9GF8B7NmfGdjRDsgl+JHUImemUjEJVto=;
 h=From:To:Cc:Subject:Date:From;
 b=Q58lzEk2u18nvGMFzZl0bWGE+dHJ4ESHQbGCnLnL4WatcB2WdEVTW/lYElgjsadOX
 fsZq8xQDYTqEZ0O1ReHn7vHd6G/eA13IStfvm39FC3ol4YvcN0sWDEVLspi2tqnXmH
 28TJvYrfU1X/+BKGgHktMtYuDKMVD3HD1GTeqDu3oAikpFpW3M7Qj9LOvZRZUU1X5X
 oY88bCjJXXtj+MA0zg1nSWdqR8qIyAhI6KIF/8YwJ1BRm1XT0IPM711r1c8N7DC+jQ
 gSJ78rg2USunam/6AVoPEjpuQR5Glb3W25p+C8WKWBctmc+hi4FIHNHIDUl8g7EQ5M
 /wmuqJZSXEGEg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358767: Fix DP bridge mode detection from DT
 endpoints
Date: Fri, 29 Apr 2022 22:46:25 +0200
Message-Id: <20220429204625.241591-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per toshiba,tc358767.yaml DT binding document, port@2 the output (e)DP
port is optional. In case this port is not described in DT, the bridge
driver operates in DPI-to-DP mode. Make sure the driver treats this as
a valid mode of operation instead of reporting invalid mode.

Fixes: 71f7d9c03118 ("drm/bridge: tc358767: Detect bridge mode from connected endpoints in DT")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 7dde71313b84..485717c8f0b4 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1964,7 +1964,9 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 	struct of_endpoint endpoint;
 	struct device_node *node = NULL;
 	const u8 mode_dpi_to_edp = BIT(1) | BIT(2);
+	const u8 mode_dpi_to_dp = BIT(1);
 	const u8 mode_dsi_to_edp = BIT(0) | BIT(2);
+	const u8 mode_dsi_to_dp = BIT(0);
 	const u8 mode_dsi_to_dpi = BIT(0) | BIT(1);
 	u8 mode = 0;
 
@@ -1990,11 +1992,11 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 		mode |= BIT(endpoint.port);
 	}
 
-	if (mode == mode_dpi_to_edp)
+	if (mode == mode_dpi_to_edp || mode == mode_dpi_to_dp)
 		return tc_probe_edp_bridge_endpoint(tc);
 	else if (mode == mode_dsi_to_dpi)
 		return tc_probe_dpi_bridge_endpoint(tc);
-	else if (mode == mode_dsi_to_edp)
+	else if (mode == mode_dsi_to_edp || mode == mode_dsi_to_dp)
 		dev_warn(dev, "The mode DSI-to-(e)DP is not supported!\n");
 	else
 		dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
-- 
2.35.1

