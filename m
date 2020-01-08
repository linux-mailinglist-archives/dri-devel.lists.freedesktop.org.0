Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FB134E92
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 22:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D732E6E34C;
	Wed,  8 Jan 2020 21:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354F86E34B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=kvEiAQjl/OxAvtM+IX3ZURXJtqGWvCvtd2Q+tKQM1BA=;
 b=iz+qXBkMROU4Y0sSg912VZwSCEh8GA+X8oCo3Y57gxmZst4OLeQbVHQsMjhFguhWx4hY
 qbFl+c1QHhCJ5vaNXZhZmyaKP/Fpz4pj5aSmEeHGmFTl8cFUZCN2hvzqXMfNqMI2HovO4s
 VUXaWV8kL4+X6BoSOPYzkTnnULMVZKiBY=
Received: by filterdrecv-p3mdw1-56c97568b5-x76nl with SMTP id
 filterdrecv-p3mdw1-56c97568b5-x76nl-20-5E1644A3-76
 2020-01-08 21:07:48.0331912 +0000 UTC m=+1974281.103082123
Received: from bionic.localdomain (unknown [98.128.173.80])
 by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP id WNEkziO3RYi0w9ydGOW-yA
 Wed, 08 Jan 2020 21:07:47.836 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 02/14] phy/rockchip: inno-hdmi: round fractal pixclock in
 rk3328 recalc_rate
Date: Wed, 08 Jan 2020 21:07:48 +0000 (UTC)
Message-Id: <20200108210740.28769-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108210740.28769-1-jonas@kwiboo.se>
References: <20200108210740.28769-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hx+0AeuHEQuiq3zZ5?=
 =?us-ascii?Q?XraD34ofAE4bYf4Q8jqDlwDF8lHreCjGZjdQ8I6?=
 =?us-ascii?Q?ZTvRsXMwExxThJZrfy5gYdtShlKcwsPyMUVwGED?=
 =?us-ascii?Q?O0mcoFMv5NXaYglR7eOOgVUr+llj+QQWG2hwdt3?=
 =?us-ascii?Q?pfOHwHEkghobRiZDVX6+VDiyB9jSGukUbUj1gz=2F?=
 =?us-ascii?Q?jAbwFkVntI22Log4C3fwg=3D=3D?=
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Zheng Yang <zhengyang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zheng Yang <zhengyang@rock-chips.com>

inno_hdmi_phy_rk3328_clk_recalc_rate() is returning a rate not found
in the pre pll config table when the fractal divider is used.
This can prevent proper power_on because a tmdsclock for the new rate
is not found in the pre pll config table.

Fix this by saving and returning a rounded pixel rate that exist
in the pre pll config table.

Fixes: 53706a116863 ("phy: add Rockchip Innosilicon hdmi phy")
Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index b0ac1d3ee390..093d2334e8cd 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -745,10 +745,12 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 		do_div(vco, (nd * (no_a == 1 ? no_b : no_a) * no_d * 2));
 	}
 
-	inno->pixclock = vco;
-	dev_dbg(inno->dev, "%s rate %lu\n", __func__, inno->pixclock);
+	inno->pixclock = DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
 
-	return vco;
+	dev_dbg(inno->dev, "%s rate %lu vco %llu\n",
+		__func__, inno->pixclock, vco);
+
+	return inno->pixclock;
 }
 
 static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
