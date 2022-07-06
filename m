Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B4568961
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1FF11B6C7;
	Wed,  6 Jul 2022 13:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F190511B6CA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:28:19 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o954h-0007T5-7b; Wed, 06 Jul 2022 15:28:15 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/3] drm/bridge: tc358767: increase CLRSIPO count
Date: Wed,  6 Jul 2022 15:28:11 +0200
Message-Id: <20220706132812.2171250-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706132812.2171250-1-l.stach@pengutronix.de>
References: <20220706132812.2171250-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current CLRSIPO count is marginal and does not work with high
DSI clock rates. Increase it a bit to allow the DSI link to work at
up to 1Gbps lane speed.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 3b31f63ad36c..fd4936215b55 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1257,10 +1257,10 @@ static int tc_dsi_rx_enable(struct tc_data *tc)
 	u32 value;
 	int ret;
 
-	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 5);
+	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 5);
+	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 5);
+	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 5);
 	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
 	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
 	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
-- 
2.30.2

