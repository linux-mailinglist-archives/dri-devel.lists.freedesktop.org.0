Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB490F635
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C72110ED87;
	Wed, 19 Jun 2024 18:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B41F10ED83
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 18:43:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sK0H6-0005bs-HP; Wed, 19 Jun 2024 20:43:16 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sJzwX-003WTo-CF; Wed, 19 Jun 2024 20:22:01 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH v2 14/14] drm/bridge: analogix_dp: handle AUX transfer timeouts
Date: Wed, 19 Jun 2024 20:22:00 +0200
Message-Id: <20240619182200.3752465-14-l.stach@pengutronix.de>
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

Timeouts on the AUX bus are to be expected in certain normal operating
conditions. There is no need to raise an error log or re-initialize the
whole AUX state machine. Simply acknowledge the AUX_ERR interrupt and
let upper layers know about the timeout.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de> (rk3288-veyron and rk3399-gru)
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 3 +++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 0f016dca9f3d..3afc73c858c4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -1016,6 +1016,9 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 
 		writel(AUX_ERR, dp->reg_base + ANALOGIX_DP_INT_STA);
 
+		if (aux_status == AUX_STATUS_TIMEOUT_ERROR)
+			return -ETIMEDOUT;
+
 		dev_warn(dp->dev, "AUX CH error happened: %#x (%d)\n",
 			 aux_status, !!(reg & AUX_ERR));
 		goto aux_error;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
index e284ee8da58b..12735139046c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h
@@ -361,6 +361,15 @@
 /* ANALOGIX_DP_AUX_CH_STA */
 #define AUX_BUSY				(0x1 << 4)
 #define AUX_STATUS_MASK				(0xf << 0)
+#define AUX_STATUS_OK				(0x0 << 0)
+#define AUX_STATUS_NACK_ERROR			(0x1 << 0)
+#define AUX_STATUS_TIMEOUT_ERROR		(0x2 << 0)
+#define AUX_STATUS_UNKNOWN_ERROR		(0x3 << 0)
+#define AUX_STATUS_MUCH_DEFER_ERROR		(0x4 << 0)
+#define AUX_STATUS_TX_SHORT_ERROR		(0x5 << 0)
+#define AUX_STATUS_RX_SHORT_ERROR		(0x6 << 0)
+#define AUX_STATUS_NACK_WITHOUT_M_ERROR		(0x7 << 0)
+#define AUX_STATUS_I2C_NACK_ERROR		(0x8 << 0)
 
 /* ANALOGIX_DP_AUX_CH_DEFER_CTL */
 #define DEFER_CTRL_EN				(0x1 << 7)
-- 
2.39.2

