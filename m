Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5131354B2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 09:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D016E8DE;
	Thu,  9 Jan 2020 08:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from manjaro.org (mail.manjaro.org [176.9.38.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A7E6E8DE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 08:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by manjaro.org (Postfix) with ESMTP id 9069F36E4E55;
 Thu,  9 Jan 2020 09:49:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYu5Us4bT7v6; Thu,  9 Jan 2020 09:49:13 +0100 (CET)
From: Tobias Schramm <t.schramm@manjaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 1/1] drm/bridge: anx78xx: fix integer type used for storing dp
 link rate
Date: Thu,  9 Jan 2020 09:48:01 +0100
Message-Id: <20200109084801.3117-2-t.schramm@manjaro.org>
In-Reply-To: <20200109084801.3117-1-t.schramm@manjaro.org>
References: <20200109084801.3117-1-t.schramm@manjaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Tobias Schramm <t.schramm@manjaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit ff1e8fb68ea0 ("drm/bridge: analogix-anx78xx: Avoid drm_dp_link helpers")
changed the link training logic to remove use of drm_dp_link helpers. However
the new logic stores the maximum link rate in a u8, overflowing it.
This commit changes the logic to store the max link rate in a unsigned int
instead.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 drivers/gpu/drm/bridge/analogix-anx78xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index 274989f96a91..0f38b8c40dff 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -748,6 +748,7 @@ static int anx78xx_init_pdata(struct anx78xx *anx78xx)
 static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
 {
 	u8 dp_bw, dpcd[2];
+	unsigned int max_link_rate;
 	int err;
 
 	err = regmap_write(anx78xx->map[I2C_IDX_RX_P0], SP_HDMI_MUTE_CTRL_REG,
@@ -866,8 +867,8 @@ static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
 	if (err)
 		return err;
 
-	dpcd[0] = drm_dp_max_link_rate(anx78xx->dpcd);
-	dpcd[0] = drm_dp_link_rate_to_bw_code(dpcd[0]);
+	max_link_rate = drm_dp_max_link_rate(anx78xx->dpcd);
+	dpcd[0] = drm_dp_link_rate_to_bw_code(max_link_rate);
 	err = regmap_write(anx78xx->map[I2C_IDX_TX_P0],
 			   SP_DP_MAIN_LINK_BW_SET_REG, dpcd[0]);
 	if (err)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
