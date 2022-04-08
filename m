Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A24F93B0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 13:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D888B10EEF3;
	Fri,  8 Apr 2022 11:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8320F10E1CA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 11:22:48 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmhS-0002HX-65; Fri, 08 Apr 2022 13:22:46 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmhR-001n3p-2F; Fri, 08 Apr 2022 13:22:43 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmhO-005Z3d-63; Fri, 08 Apr 2022 13:22:42 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 01/24] clk: rk3568: Mark hclk_vo as critical
Date: Fri,  8 Apr 2022 13:22:15 +0200
Message-Id: <20220408112238.1274817-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408112238.1274817-1-s.hauer@pengutronix.de>
References: <20220408112238.1274817-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever pclk_vo is enabled hclk_vo must be enabled as well. This is
described in the Reference Manual as:

| 2.8.6 NIU Clock gating reliance
|
| A part of niu clocks have a dependence on another niu clock in order to
| sharing the internal bus. When these clocks are in use, another niu
| clock must be opened, and cannot be gated.  These clocks and the special
| clock on which they are relied are as following:
|
| Clocks which have dependency     The clock which can not be gated
| -----------------------------------------------------------------
| ...
| pclk_vo_niu, hclk_vo_s_niu       hclk_vo_niu
| ...

The clock framework doesn't offer a way to enable clock B whenever clock A is
enabled, at least not when B is not an ancestor of A. Workaround this by
marking hclk_vo as critical so it is never disabled. This is suboptimal in
terms of power consumption, but a stop gap solution until the clock framework
has a way to deal with this.

We have this clock tree:

|      aclk_vo                  2        2        0   300000000          0     0  50000         Y
|         aclk_hdcp             0        0        0   300000000          0     0  50000         N
|         pclk_vo               2        3        0    75000000          0     0  50000         Y
|            pclk_edp_ctrl      0        0        0    75000000          0     0  50000         N
|            pclk_dsitx_1       0        0        0    75000000          0     0  50000         N
|            pclk_dsitx_0       1        2        0    75000000          0     0  50000         Y
|            pclk_hdmi_host     1        2        0    75000000          0     0  50000         Y
|            pclk_hdcp          0        0        0    75000000          0     0  50000         N
|         hclk_vo               2        5        0   150000000          0     0  50000         Y
|            hclk_hdcp          0        0        0   150000000          0     0  50000         N
|            hclk_vop           0        2        0   150000000          0     0  50000         N

Without this patch the edp, dsitx, hdmi and hdcp driver would enable their
clocks which then enables pclk_vo, but hclk_vo stays disabled and register
accesses just hang. hclk_vo is enabled by the VOP2 driver, so reproducibility
of this issue depends on the probe order.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---

Notes:
    Changes since v8:
    - new patch

 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 606ae6cd918b2..f85902e2590c7 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1591,6 +1591,7 @@ static const char *const rk3568_cru_critical_clocks[] __initconst = {
 	"hclk_php",
 	"pclk_php",
 	"hclk_usb",
+	"hclk_vo",
 };
 
 static const char *const rk3568_pmucru_critical_clocks[] __initconst = {
-- 
2.30.2

