Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D244287F14A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 21:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415711206D;
	Mon, 18 Mar 2024 20:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B43311206D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 20:39:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rmJlY-0004vE-1b; Mon, 18 Mar 2024 21:39:28 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rmJlV-0078y6-E7; Mon, 18 Mar 2024 21:39:25 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 1/3] drm/bridge: analogix_dp: properly handle zero sized AUX
 transactions
Date: Mon, 18 Mar 2024 21:39:23 +0100
Message-Id: <20240318203925.2837689-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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

Address only transactions without any data are valid and should not
be flagged as short transactions. Simply return the message size when
no transaction errors occured.

CC: stable@vger.kernel.org
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 6a4f20fccf84..7b0bc9704eac 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -1027,7 +1027,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 	u32 status_reg;
 	u8 *buffer = msg->buffer;
 	unsigned int i;
-	int num_transferred = 0;
 	int ret;
 
 	/* Buffer size of AUX CH is 16 bytes */
@@ -1079,7 +1078,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 			reg = buffer[i];
 			writel(reg, dp->reg_base + ANALOGIX_DP_BUF_DATA_0 +
 			       4 * i);
-			num_transferred++;
 		}
 	}
 
@@ -1127,7 +1125,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 			reg = readl(dp->reg_base + ANALOGIX_DP_BUF_DATA_0 +
 				    4 * i);
 			buffer[i] = (unsigned char)reg;
-			num_transferred++;
 		}
 	}
 
@@ -1144,7 +1141,7 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
 		 (msg->request & ~DP_AUX_I2C_MOT) == DP_AUX_NATIVE_READ)
 		msg->reply = DP_AUX_NATIVE_REPLY_ACK;
 
-	return num_transferred > 0 ? num_transferred : -EBUSY;
+	return msg->size;
 
 aux_error:
 	/* if aux err happen, reset aux */
-- 
2.39.2

