Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409095FFCC3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 02:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9896E10E662;
	Sun, 16 Oct 2022 00:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF89310E662
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 00:36:06 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0B27084B85;
 Sun, 16 Oct 2022 02:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665880564;
 bh=U50KRrC+7aSi/a8UrPbzr/SGnLeuglWqA1XJjYP8HyA=;
 h=From:To:Cc:Subject:Date:From;
 b=G2F4k/JeUf0BXu4613KxGA3vNAysnGLGL3ah30ARvrEq5navJRcQvU+2aDeiJ02Hw
 6Mtf1ez0kC+1x9S7+ubMdILztKK4PHSELSEfZI5liAe2BsSe7NGO7VY3CmW+zLm6bt
 yN5RCvOCVDk/S9JJlL2PaVW1AUjNlN1FWbXY6KrQq0KF9gEtOlMa3BMrpT3KdRhhdn
 +2nEbpNvQLYfGHyI3qYiwE/c2jF0Q9+0RqVx/VUY76ak/nkxgOR78XRSCH4Pl0kRkM
 ARJKC0b/c2h5SLapkrZZRZ9y6hqaGjG4PNHy75JrA7ovpUnKgzJpD/ipDtfdTckgsh
 QkuEos91XMmFg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358767: Set default CLRSIPO count
Date: Sun, 16 Oct 2022 02:35:56 +0200
Message-Id: <20221016003556.406441-1-marex@denx.de>
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

The current CLRSIPO count is still marginal and does not work with high
DSI clock rates in burst mode. Increase it further to allow the DSI link
to work at up to 1Gbps lane speed. This returns the counts to defaults
as provided by datasheet.

Fixes: ea6490b02240b ("drm/bridge: tc358767: increase CLRSIPO count")
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
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 98cfb50a83bec..67f294f96e823 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1267,10 +1267,10 @@ static int tc_dsi_rx_enable(struct tc_data *tc)
 	u32 value;
 	int ret;
 
-	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 5);
-	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 5);
-	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 5);
-	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 5);
+	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 25);
+	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 25);
+	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 25);
+	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 25);
 	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
 	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
 	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
-- 
2.35.1

