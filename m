Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0EF23C6BC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7D289FDD;
	Wed,  5 Aug 2020 07:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de [95.129.51.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D636E48F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:56:12 +0000 (UTC)
Received: from mxout4.routing.net (unknown [192.168.10.112])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id AD31796135;
 Tue,  4 Aug 2020 16:56:10 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout4.routing.net (Postfix) with ESMTP id 65C451014A6;
 Tue,  4 Aug 2020 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sO6tybaMOJ1Y/9jRMHEuMbPOV8G3l1zST2AlvdQbQc4=;
 b=G5QrEXusd7O180Uc4HbCX88/NhgIAjUvUG/poFT8KiVuY+bL5KLI7P/3YGHEXMXVv5TjT3
 qhJxbMsqIrF5w4ESj438PffNefB0XFfEYy7yyKexhi36jJiz2qIRjPqK+POzfHiQ3Ie6AK
 op1YFQPXAET5ZGv7kQUNBgD8QrCh2YM=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 5B5443601C7;
 Tue,  4 Aug 2020 16:56:09 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4] net: ethernet: mtk_eth_soc: fix MTU warnings
Date: Tue,  4 Aug 2020 18:55:50 +0200
Message-Id: <20200804165555.75159-3-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Landen Chao <landen.chao@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Landen Chao <landen.chao@mediatek.com>

in recent kernel versions there are warnings about incorrect MTU size
like these:

eth0: mtu greater than device maximum
mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DSA overhead

Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
Fixes: 72579e14a1d3 ("net: dsa: don't fail to probe if we couldn't set the MTU")
Fixes: 7a4c53bee332 ("net: report invalid mtu value via netlink extack")
Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3->v4
  - fix commit-message (hyphernations,capitalisation) as suggested by Russell
  - add Signed-off-by Landen
  - dropped wrong signed-off from rene (because previous v1/2 was from him)
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 85735d32ecb0..a1c45b39a230 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2891,6 +2891,8 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	eth->netdev[id]->irq = eth->irq[0];
 	eth->netdev[id]->dev.of_node = np;
 
+	eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
+
 	return 0;
 
 free_netdev:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
