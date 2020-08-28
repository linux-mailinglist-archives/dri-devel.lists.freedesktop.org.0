Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ECE256644
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE1D6EB89;
	Sat, 29 Aug 2020 09:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651A36E497
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZsW2omH8Ko7Wf78vgP15zYMnFLeRI8mgWg2XRO1POp6GtkkTsYA8Oixg2tIEMyFTBXIWyfr0qzo2kqWd/ZaGfjwTqgGfjKfGZKTqW5ZlqVlSpxuDq2J3pZ7ZDtu8+mEUW8QNCuS1jXyjtEqeLFRnemFWOiqzKAvdQ8QfYWZnE+ZjWTIWrNDkLYNr8yjBzR+QrPBziSxdvZi3v9db0z+Grl82rFjrC19RWCk3yIXVcQpnEoavk1RzlUc0m4sOkxjBhHrMbLapBwfDBssJ7PsuWUM5FLickv5X8wf1zXCJEHBZoJz4sOk6e5nfLhDWt68tGudKaGs9HQk5EHs8vR+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOHgqXFx+pTi6SkxWTbEdx7Q5/536ZQq8NLguXeWJ7Q=;
 b=g9R8abI1AQ8uFvAwCVN6y9cQ5wyL06p6Xb3WfbvJ5uTjbVretOHlsC1IYWpsgewEYgGiiRF7itLbC2I9xnYzkKdjm/7u93iYEJdlp0c4aYSPmoXhAYZcS6K2lnhwBbE/yuxym0rSGqyw9fuuITf2PKBn/WZv00Dvy9uKAUwxjzjQygysU247fKAwm7LrvLDPjt+W/1w3xOjde9j5XofrmDqssv/CtEbsurUnRLn2qfxnypMp6hReg7ds44HyZEktyEqS6BK4EN8TI+SNt8ioa/7EE+DffRAgqCwc+hgTRi7W/tEvkxxHTMHkOGqRq/e3RgDaWn+CiftZAndLxWo2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOHgqXFx+pTi6SkxWTbEdx7Q5/536ZQq8NLguXeWJ7Q=;
 b=SNDsGEhVdv5Qj1tdJ2Hv6IRN+qlZB13J5rdgbWwL64Os28j886VOwLIJ66iRAli7k+El9nwRrdiQ8QRvv83Hs4VCxb1m5uF7+bemQNlOjcq+5ZoJ1wxNMjcHuXhNCweoLi0ZrRbVDgVQ/lVwGnMir7tDAQgXEsfet4jhZ01hseM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com (2603:10a6:4:39::7)
 by DBAPR04MB7413.eurprd04.prod.outlook.com (2603:10a6:10:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 11:13:46 +0000
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334]) by DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334%4]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 11:13:46 +0000
From: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Fabio Estevam <festevam@gmail.com>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 3/5] drm/bridge: nwl-dsi: Add support for clock-drop-level
Date: Fri, 28 Aug 2020 14:13:30 +0300
Message-Id: <1598613212-1113-4-git-send-email-robert.chiras@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0114.eurprd07.prod.outlook.com
 (2603:10a6:207:7::24) To DB6PR0401MB2598.eurprd04.prod.outlook.com
 (2603:10a6:4:39::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-120.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0114.eurprd07.prod.outlook.com (2603:10a6:207:7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3348.7 via Frontend Transport; Fri, 28 Aug 2020 11:13:44 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a3e804a-7c66-44df-6d25-08d84b436e63
X-MS-TrafficTypeDiagnostic: DBAPR04MB7413:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7413AAF3876055F7D0A56E65A2520@DBAPR04MB7413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gMbKgQkS/oJjwP3eOvf0ci8/HJgXT4tqTVB4J6fA8GKwPV9Ca0muqojBmLO4S017nv42YCZ1OT0F0taQx0QUbFayfFEHEDlnTv3g7Wg+EXsrePkpeLaLUSis2HDayejX6v3wDVE0WuXB6jxeyBV0pxDKkQoEwpT+8UnIXoWHKB0AVQmzQDINTLTZvyTIsKdd0xdlo+PvNpfLSI+kZa6Q22mX1EAAd7EW1mC7Zsegxto1oUC4q3vFd9gO4tNuMTs70DFuJ7evnz68jn1D5OWb2aV8HLGg0KMl2mAhxCc8kbPwljh5t0Ofsjpn2sMSfY9d9Q751nq/QunSxva3dV1sL3GSwu1oNl2lkeFFJlXU5XygqvVCWA/AbwkJWYqb+dw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2598.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(16526019)(52116002)(86362001)(26005)(316002)(8676002)(6486002)(66556008)(8936002)(2616005)(54906003)(66946007)(6512007)(6506007)(186003)(478600001)(66476007)(7416002)(110136005)(2906002)(83380400001)(6666004)(5660300002)(956004)(4326008)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: AL3bSPx4NGF+UEGe6B1gAJJSplBnl1qT9dSAtOy/FD9mXx45eFhfYb7tem/VVuD/VocYwOYKc8cdSBRiaG7+Dz115SzY0i6Ac7GdBihgDD5yqKdMfUAfMxZDeAwmJhVX+tZLmdvuaHPFpnZqVNeXfCwmkfeM4tZj6LUYzCX5XtnTok2+kSb3cPDT1q3JDPl6tgc24u2CsLFc2xKO+WXITYAuxm6oOf0j3ZloQh8bdnzWt7WZCKevXOJdgbogOSzjbQXF8jdyRHA0i7j69YkvO8gSb03Qb5Zd7TnU04SZYRZqWzMqUxrmiIMC4mm1i+WZ/RNdp2fYaIWGHpov4eQnMb8p2F8bWFsJm3ltfxDwa2piNGRLZ9VtBxtGFTdDz5dgbL6g7xE1QHjT2jiFD33GSgJ9G1K8AjikUenPj6LosjyOQXuE0rsujkP8LXARMHRyDQBqnMDwcgu1Gy7ivSeyARkDDEVF89irwNrPyiFLzSzRHvZclDQ8DlVEExt1jv0CD92I+s6XPL9AETZLB9OCl+1PBx9jsVcZX6d4xdeF7tiobvbKxI48dxmwuQ1eriZnxugVnoWNJymBB9ChQT/8GP0M1zHqoRpKQ5BNEy9wo4Qq+ZYJtSwW71s4Fydr7kAz7xWWHKmwhrR/BWqYydoLcg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3e804a-7c66-44df-6d25-08d84b436e63
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2598.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 11:13:46.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSW0s7AS1AgxxbCj5oEbOds5FERTjwISSoD9fjGrBjxCdxqq5i3YcF2JWiI2pN2pf5KZLPiIQCeOO4396IAh3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7413
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Chiras <robert.chiras@nxp.com>

The clock-drop-level is needed in order to add more blanking space needed
by DSI panels when sending DSI commands. One level is the equivalent of
phy_ref rate from the PLL rate. Since the PLL rate is targeted as highest
possible, each level should not get the crtc_clock too low, compared to
the actual clock.

Example for a clock of 132M, with "clock-drop-level = <1>" in dts file
will result in a crtc_clock of 129M, using the following logic:
- video_pll rate to provide both phy_ref rate of 24M and pixel-clock
  of 132M is 1056M (divisor /43 for phy_ref and /8 for pixel-clock)
- from this rate, we subtract the equivalent of phy_ref (24M) but
  keep the same divisor. This way, the video_pll rate will be 1056 - 24
= 1032M.
- new pixel-clock will be: 1032 / 8 = 129M

For a "clock-drop-level = <2>", new pixel-clock will be:
(1056 - (24 * 2)) / 8 = 1008 / 8 = 126M

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 1228466..ac4aa0a 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -142,6 +142,7 @@ struct nwl_dsi {
 
 	struct nwl_dsi_transfer *xfer;
 	struct list_head valid_modes;
+	u32 clk_drop_lvl;
 };
 
 static const struct regmap_config nwl_dsi_regmap_config = {
@@ -842,13 +843,14 @@ static unsigned long nwl_dsi_get_lcm(unsigned long a, unsigned long b)
 
 	return ((unsigned long long)a * b) / gcf;
 }
-
 /*
  * This function tries to adjust the crtc_clock for a DSI device in such a way
  * that the video pll will be able to satisfy both Display Controller pixel
  * clock (feeding out DPI interface) and our input phy_ref clock.
+ * Also, the DC pixel clock must be lower than the actual clock in order to
+ * have enough blanking space to send DSI commands, if the device is a panel.
  */
-static void nwl_dsi_setup_pll_config(struct mode_config *config)
+static void nwl_dsi_setup_pll_config(struct mode_config *config, u32 lvl)
 {
 	unsigned long pll_rate;
 	int div;
@@ -908,7 +910,6 @@ static void nwl_dsi_setup_pll_config(struct mode_config *config)
 	}
 }
 
-
 /*
  * This function will try the required phy speed for current mode
  * If the phy speed can be achieved, the phy will save the speed
@@ -1103,7 +1104,7 @@ nwl_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 
 	pll_rate = config->pll_rates[config->phy_rate_idx];
 	if (dsi->pll_clk && !pll_rate)
-		nwl_dsi_setup_pll_config(config);
+		nwl_dsi_setup_pll_config(config, dsi->clk_drop_lvl);
 
 	return MODE_OK;
 }
@@ -1248,6 +1249,7 @@ static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
 static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
 {
 	struct platform_device *pdev = to_platform_device(dsi->dev);
+	struct device_node *np = dsi->dev->of_node;
 	struct clk *clk;
 	void __iomem *base;
 	int ret;
@@ -1364,6 +1366,8 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
 		return PTR_ERR(dsi->rst_dpi);
 	}
 
+	of_property_read_u32(np, "fsl,clock-drop-level", &dsi->clk_drop_lvl);
+
 	INIT_LIST_HEAD(&dsi->valid_modes);
 
 	return 0;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
