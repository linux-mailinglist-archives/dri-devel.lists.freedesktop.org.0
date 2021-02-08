Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2430313209
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 13:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969286E8BF;
	Mon,  8 Feb 2021 12:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs34.siol.net [185.57.226.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83D66E8B8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 12:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 3B1F25224FA;
 Mon,  8 Feb 2021 13:18:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 8mikjengUDjL; Mon,  8 Feb 2021 13:18:02 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id BB8975224F1;
 Mon,  8 Feb 2021 13:18:02 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id 58A29522491;
 Mon,  8 Feb 2021 13:18:00 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v2 1/5] clk: sunxi-ng: mp: fix parent rate change flag check
Date: Mon,  8 Feb 2021 13:17:48 +0100
Message-Id: <20210208121752.2255465-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208121752.2255465-1-jernej.skrabec@siol.net>
References: <20210208121752.2255465-1-jernej.skrabec@siol.net>
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
one. Fix that.

Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when allowed")
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index fa4ecb915590..5f40be6d2dfd 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -108,7 +108,7 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
 	max_m = cmp->m.max ?: 1 << cmp->m.width;
 	max_p = cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
 
-	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+	if (!(clk_hw_get_flags(&cmp->common.hw) & CLK_SET_RATE_PARENT)) {
 		ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
 		rate = *parent_rate / p / m;
 	} else {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
