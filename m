Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E902D909939
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F93810E189;
	Sat, 15 Jun 2024 17:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="WmR8yjQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AED910E14C
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718471684; bh=Bcu9b3VrUd6qIU98W1LB1PWRhdR9Skrn32v3O+4jLys=;
 b=WmR8yjQJ8G8B/+CqcRQLW/tvsMzggN+xQcunsrBB82JYLoeYr2cKQNfqO0B0EjCngvF+WXbe7
 2+S3vqrg/lKB1N5Y6wkig+rVLvLcKFZ1AqnChvpGti9tXm0NOEzAbsHQGxfREQ+buhuFSgyfwvF
 /GFlhbovTUjy1CVdM1nAjWoaLXTw7+oiqYQoZHWSXgH8mQzFQkTmvf0dvqF76cEyRIvIZr8gfFY
 qGwBp0lLmAHCSFoxfcJIOGzTlib6I9hQhD9HSBixjG+gBMLzWIJt49tTzXFULeSgdJ/urw4SWcI
 4HaLn8DtZYMhL1/qJjFEItQESIjYi6UQV6TX9myKQVSw==
From: Jonas Karlman <jonas@kwiboo.se>
To: dri-devel@lists.freedesktop.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Yakir Yang <kuankuan.y@gmail.com>, Jeffy Chen
 <jeffy.chen@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>, linux-clk@vger.kernel.org
Subject: [PATCH 02/13] clk: rockchip: Set parent rate for DCLK_VOP clock on
 RK3228
Date: Sat, 15 Jun 2024 17:03:53 +0000
Message-ID: <20240615170417.3134517-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 666dc9a024e0254b39803ff3
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

Similar to DCLK_LCDC on RK3328, the DCLK_VOP on RK3228 is typically
parented by the hdmiphy clk and it is expected that the DCLK_VOP and
hdmiphy clk rate are kept in sync.

Use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags, same as used
on RK3328, to make full use of all possible supported display modes.

Fixes: 0a9d4ac08ebc ("clk: rockchip: set the clock ids for RK3228 VOP")
Fixes: 307a2e9ac524 ("clk: rockchip: add clock controller for rk3228")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/clk/rockchip/clk-rk3228.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index a24a35553e13..7343d2d7676b 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
 	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
 			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
-	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
+	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
-- 
2.45.2

