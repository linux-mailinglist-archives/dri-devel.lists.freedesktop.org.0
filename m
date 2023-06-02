Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BD772099F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 21:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4B810E618;
	Fri,  2 Jun 2023 19:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55110E618
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 19:15:14 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q5AEq-0001Z5-Vo; Fri, 02 Jun 2023 21:15:05 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH 2/2] drm: bridge: tc358767: give VSDELAY some positive value
Date: Fri,  2 Jun 2023 21:15:01 +0200
Message-Id: <20230602191501.4138433-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602191501.4138433-1-l.stach@pengutronix.de>
References: <20230602191501.4138433-1-l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Jander <david@protonic.nl>

The documentation is not clear about how this delay works.
Empirical tests have shown that with a VSDELAY of 0, the first
scanline is not properly formatted in the output stream when
DSI->DP mode is used. The calculation spreadsheets from Toshiba
seem to always make this value equal to the HFP + 10 for DSI->DP
use-case. For DSI->DPI this value should be > 2 and for DPI->DP
it seems to always be 0x64.

Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 46916ae30f8f..9f2c67b4a488 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -817,7 +817,7 @@ static int tc_set_common_video_mode(struct tc_data *tc,
 	 * sync signals
 	 */
 	ret = regmap_write(tc->regmap, VPCTRL0,
-			   FIELD_PREP(VSDELAY, 0) |
+			   FIELD_PREP(VSDELAY, right_margin + 10) |
 			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
 	if (ret)
 		return ret;
-- 
2.39.2

