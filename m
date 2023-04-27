Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0296F076B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 16:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8D110EB4D;
	Thu, 27 Apr 2023 14:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3989D10E386
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 14:29:46 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id A1E7320B63;
 Thu, 27 Apr 2023 16:29:43 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v1 9/9] drm/bridge: tc358768: remove unused variable
Date: Thu, 27 Apr 2023 16:29:34 +0200
Message-Id: <20230427142934.55435-10-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427142934.55435-1-francesco@dolcini.it>
References: <20230427142934.55435-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Remove the unused phy_delay_nsk variable, before it was wrongly used
to compute some register value, the fixed computation is no longer using
it and therefore can be removed.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 947c7dca567a..d3af42a16e69 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -641,7 +641,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	u32 val, val2, lptxcnt, hact, data_type;
 	s32 raw_val;
 	const struct drm_display_mode *mode;
-	u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
+	u32 dsibclk_nsk, dsiclk_nsk, ui_nsk;
 	u32 dsiclk, dsibclk, video_start;
 	const u32 internal_delay = 40;
 	int ret, i;
@@ -725,11 +725,9 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 				  dsibclk);
 	dsiclk_nsk = (u32)div_u64((u64)1000000000 * TC358768_PRECISION, dsiclk);
 	ui_nsk = dsiclk_nsk / 2;
-	phy_delay_nsk = dsibclk_nsk + 2 * dsiclk_nsk;
 	dev_dbg(priv->dev, "dsiclk_nsk: %u\n", dsiclk_nsk);
 	dev_dbg(priv->dev, "ui_nsk: %u\n", ui_nsk);
 	dev_dbg(priv->dev, "dsibclk_nsk: %u\n", dsibclk_nsk);
-	dev_dbg(priv->dev, "phy_delay_nsk: %u\n", phy_delay_nsk);
 
 	/* LP11 > 100us for D-PHY Rx Init */
 	val = tc358768_ns_to_cnt(100 * 1000, dsibclk_nsk) - 1;
-- 
2.25.1

