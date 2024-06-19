Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C490F5E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C740710E23C;
	Wed, 19 Jun 2024 18:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2DD10E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 18:22:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sJzwX-00049h-K6; Wed, 19 Jun 2024 20:22:01 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sJzwX-003WTo-1y; Wed, 19 Jun 2024 20:22:01 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH v2 10/14] drm/bridge: analogix_dp: move macro reset after link
 bandwidth setting
Date: Wed, 19 Jun 2024 20:21:56 +0200
Message-Id: <20240619182200.3752465-10-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619182200.3752465-1-l.stach@pengutronix.de>
References: <20240619182200.3752465-1-l.stach@pengutronix.de>
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

Setting the link bandwidth may change the PLL parameters, which will cause
the PLL to go out of lock, so make sure to apply the MACRO_RST, which
according to the comment is required to be pulsed after the PLL is locked.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bbf2c0808ace..d2c7a9117ce3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -243,6 +243,11 @@ static int analogix_dp_link_start(struct analogix_dp_device *dp)
 
 	/* Set link rate and count as you want to establish*/
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	/*
+	 * MACRO_RST must be applied after the PLL_LOCK to avoid
+	 * the DP inter pair skew issue for at least 10 us
+	 */
+	analogix_dp_reset_macro(dp);
 	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
 
 	/* Setup RX configuration */
@@ -562,12 +567,6 @@ static int analogix_dp_full_link_train(struct analogix_dp_device *dp,
 	int retval = 0;
 	bool training_finished = false;
 
-	/*
-	 * MACRO_RST must be applied after the PLL_LOCK to avoid
-	 * the DP inter pair skew issue for at least 10 us
-	 */
-	analogix_dp_reset_macro(dp);
-
 	/* Initialize by reading RX's DPCD */
 	analogix_dp_get_max_rx_bandwidth(dp, &dp->link_train.link_rate);
 	analogix_dp_get_max_rx_lane_count(dp, &dp->link_train.lane_count);
@@ -634,9 +633,12 @@ static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
 	u8 link_align, link_status[2];
 	enum pll_status status;
 
-	analogix_dp_reset_macro(dp);
-
 	analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
+	/*
+	 * MACRO_RST must be applied after the PLL_LOCK to avoid
+	 * the DP inter pair skew issue for at least 10 us
+	 */
+	analogix_dp_reset_macro(dp);
 	analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
 	analogix_dp_set_lane_link_training(dp);
 
-- 
2.39.2

