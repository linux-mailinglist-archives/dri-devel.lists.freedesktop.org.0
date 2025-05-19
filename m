Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC29ABC7FD
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 21:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF4210E11F;
	Mon, 19 May 2025 19:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A384C10E338
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 19:48:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uH6TX-0002eY-9C; Mon, 19 May 2025 21:48:39 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <l.stach@pengutronix.de>) id 1uH6TW-000IR0-07;
 Mon, 19 May 2025 21:48:38 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH] drm/bridge: adv7511: expose test mode as parameter
Date: Mon, 19 May 2025 21:48:37 +0200
Message-Id: <20250519194837.963227-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Tretter <m.tretter@pengutronix.de>

The ADV7533 supports a test mode that simply prints vertical bars on the
output whenever the MIPI-DSI clock is running. This allows to test the
clock without making sure that the data lanes produce valid data.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 122ad91e8a32..707796b91bad 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -7,6 +7,10 @@
 
 #include "adv7511.h"
 
+static bool test_mode;
+module_param(test_mode, bool, 0644);
+MODULE_PARM_DESC(test_mode, "Enable test mode");
+
 static const struct reg_sequence adv7533_fixed_registers[] = {
 	{ 0x16, 0x20 },
 	{ 0x9a, 0xe0 },
@@ -85,8 +89,10 @@ void adv7533_dsi_power_on(struct adv7511 *adv)
 
 	/* enable hdmi */
 	regmap_write(adv->regmap_cec, 0x03, 0x89);
-	/* disable test mode */
-	regmap_write(adv->regmap_cec, 0x55, 0x00);
+	if (test_mode)
+		regmap_write(adv->regmap_cec, 0x55, 0x80);
+	else
+		regmap_write(adv->regmap_cec, 0x55, 0x00);
 
 	regmap_register_patch(adv->regmap_cec, adv7533_cec_fixed_registers,
 			      ARRAY_SIZE(adv7533_cec_fixed_registers));
-- 
2.39.5

