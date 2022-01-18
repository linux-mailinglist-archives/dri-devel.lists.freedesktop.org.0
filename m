Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF2491A61
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 04:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214BC112949;
	Tue, 18 Jan 2022 03:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5C4112950
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 03:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLrJXZA1s1NyGZqz69cIy3DQIlYGEmwHNm2XrVjxRj8GTFiS4/PbX0IJNOy0ZYfkqlfjPHr8fGSr64EB1roFjB5xiDxYiCZjtnIOZLFhcMBjmfFR5XcOXpSnNtgNCax8rKPZXCfB8Z7kBqbhOE3WgDHSAQ0PxsoRGC/NLJavXcqJLUGymZ90CA3zEj8hTPSNhz52Ejar/pokDVwu31rSLD0O18tgLPAXDl5ZRJlMk4Ph3dA+yz1v06uViLtaz91BWWSTCl04506of6QmsDxmaXb+CmCHKwAtF/G5NOACdOvq/rky59xdrbrR+RDaCy4XGYE6yyIqoZoSB9ryPmZL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCDwhEtmmEYLIzpIeV9i0fc7ATrkV+SpOyNtCaGDeSM=;
 b=G2TC5ijf6arJ5omNCvJYKFRPh41mY0Jn5wJTbUOpLKgTsdvcLnvlZWSqloPD1kA88Sq2l+fKPe5l5EN0DEmNm5BOa9qcuBlZqm6PsAFO073S3kH1/fY1yrJfjN8FqsZoWcutMg6zKW0RTFbVWr025+wiCRGc/k7/anDd3ES/yz0m3Xv09V9DHlhu/Nf9D+JTMRne/Um+1hPfEwuTuh/DjYPRh5PeP+B1bOEDw7Wiq7Bws3Kn+WFAh0IUN3SzGKCr+kHOplaz/gZl8nHqlrclRtsHVe2gjwzq9GE1kxsAl3mBAhIoOVGJDXPIiDykyslXq2rJ6POkH8O/zUeWvskJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCDwhEtmmEYLIzpIeV9i0fc7ATrkV+SpOyNtCaGDeSM=;
 b=QiG/ldUrvJIqiyyNNSTDkCKfZ3LLxTHvHaoffDq4xYp8wFf2c8lWCk/QfjsTH9kCYD7mfxA2Vj9TsaxyUniqKWXbIuEqR+HGJZzhp4fJg1SelGvRqvnYQsBSUd2+9FLzInj8ARjxMGasBvqfvlr0asYYOs04K6DBvdiSi+asmI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM5PR04MB2978.eurprd04.prod.outlook.com (2603:10a6:206:5::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 03:01:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 03:01:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] phy: dphy: Correct clk_pre parameter
Date: Tue, 18 Jan 2022 10:59:18 +0800
Message-Id: <20220118025918.1444288-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3e97a0f-e19d-499c-fe3d-08d9da2ed1cf
X-MS-TrafficTypeDiagnostic: AM5PR04MB2978:EE_
X-Microsoft-Antispam-PRVS: <AM5PR04MB2978C5D6FFB7DC145CE1EA6998589@AM5PR04MB2978.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2iwM/wfyhdFleFMe08me5erqKcvye4dFDeE0bWdgpEhfcVOlTYGk5mkxsSqQ5IeDrAbZ3sAmkFdMNPfjfpXkDvchTCO0Vb1IqAZ5QI7woNR+WC19ZU7U+ilA2qTV4fTOO2hWbshCawNTfUTsCkkPDjZ9DtLAHNFJNnT1bKMoCefdRT1ukuPpGsjyNBuvAxFYCm2915ttb9GD/7QJwdi467fzyMWYKpudLtrKTkhJneoFRJvStGHpdTTGuk5rKvztHkReslClgUNyeKNn7DZ0DZhCCGcfnV/LHHf+hTWI7eHXHqN2N/HaWKJ3N2UA/bcclsvKeqxcDlvKqdIuAJcrGujdKQdaIFyav+LxOEpM5F6pQAjgoxjxtN2REJNvFQDHrfYmdPH4FX/xaGILg7JLHWZJd7lTzzTVgYZzonf78YYkbE8IXcp96mySwqxSvYpWPqHT4jRCMVQgPluw/jhu7e7O8S13tolOyg6j0h02X48/m3DFGKWNIyWcaNBgmgPgy6ixoKjSzHTEi8wR4LsWW1d2MbiaockaSOOLFqH8p5loesxaws5C4uM7KThV/364vAQz+k/d/u26348+JbWz0jhdVyE/NSsQfzcOxyEigDM+2aQkOPg1FEZ9qwVTQCa2hbDfaHv/M4kNHGeNR39SCXlv0tYUQ+vBE9tq9MLrVadPL41txIs/TQCZ2OONQzjq3+TEiwmvMBKxs5LVhS3eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(4326008)(6506007)(6486002)(186003)(316002)(2906002)(7416002)(508600001)(26005)(2616005)(66476007)(66556008)(54906003)(8936002)(38350700002)(52116002)(86362001)(66574015)(83380400001)(36756003)(38100700002)(6666004)(1076003)(6512007)(66946007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjV1TFpaejhjL1JSNm1Ienl2TDVtM0xWNWNrQ0dXZHBMTTkycURFVktHcWVs?=
 =?utf-8?B?TFRCUkNRbHRjT2dVQjg3QmV4UUNybVVTMDJ5aXZQRE1LbnNGWmlGMmZXdFdR?=
 =?utf-8?B?V3liVXMwQk4xemt4anlVUEZTZ3dQNWhoNytCdFB5U29WclEyTmRuanZpRktQ?=
 =?utf-8?B?YnVyMmdtRTArRVU0QXRWL1ovajZRU0Y3VnA1SnVveVVQUm9zSGIzUVJKZDhO?=
 =?utf-8?B?TjZZVzhzV2EzR2liZEMwUS9MSmErOUsrY3luT0dEbDYxWFcwaUw1YlMrcmJX?=
 =?utf-8?B?R29WNmFNWjJtUkJ1TDcraTZpOXdtOWxpejJTT2xHcEE1YThWRGtndWxUczJC?=
 =?utf-8?B?SW14L2J2cUxja1BKWkYvS2FUM2hxSkNTbnRab1BCcCtKZ2FpQWlWQlZVTDY1?=
 =?utf-8?B?SlZFV2EwRUF0V21ZQlV5emZrblNkTklMSWZEb3lhWWxNVXJtMG1YM0NoN2w4?=
 =?utf-8?B?YjdSdXNJb3dWeTNweHBjZU45Rm5zTDZDYTRsdjJCcU1JaDFzSzRRcnRPa0Uy?=
 =?utf-8?B?djliM3ZDV2gwS0Zuc3d5YjFRRENoZUFFOG5nZVd1RTdhTXdCMTViQnJNTWo5?=
 =?utf-8?B?bFlsbGVIamQzREhwVjh4NWNZM3MyZk84TVNvc09TWUdEMXJLU250bmRNVWsr?=
 =?utf-8?B?V1VzNWs1ZEZPWlppWGwvTjNVazhRRzBka0JQRjdUVXd2WjNUK3E5L3VFUXds?=
 =?utf-8?B?bHd3S2tYMGFCY0ZXUWV5aUNZMmNNbDBsWEduZzZKZUdzZTR0N010SzQvUG5D?=
 =?utf-8?B?S2I1S2pnTTA5UTZyK3VFMFBNM3RDaUxhQkVocUduRk16K0NCakxobG12TVdw?=
 =?utf-8?B?ZFNmSzhmZEluMVRzVTFpZHJsQWlwZ2k0TlRzQlZheUxmZi9HdTk3Sy9SUGlX?=
 =?utf-8?B?ZjYrcTVqNDlEVlJFcUI2QUlrT211SStoMzRjbEZGVENCcVpYUUppL1J3L09J?=
 =?utf-8?B?YTlnTi9EaHRwNTJCM2g4UlorN0RHNUtTbXZReUhRNGVrZVhyVGIxeGRnWjY3?=
 =?utf-8?B?SkkrZmUyelJlVnIvYlMzclM3R0tjTW94OWwwdE1RcFQ2cUdBTVlkcUlENzMy?=
 =?utf-8?B?ZkpJOXkxdzNmcFNEczBQNzcyWldmUXhQU2Z0MTRlSWxvNWZnZzRpMUhKYk1Q?=
 =?utf-8?B?eVgvOGxnWHh4VHJ5MU9mUlI4N2dnTm83RGxVMVRxa05XQ3dZUVMwaFV0SmZF?=
 =?utf-8?B?bTRHWjhEd2IyNjZsVENlbjJXaFZySDNHZjdSb1haaElkUkFmQTFoOXh1WFhT?=
 =?utf-8?B?bmlpQVdKR2ZiWmVRRllxUUR6Uml3N1l4dzUrdEJsdVZ2ZWs0MHlUbzYvRDA2?=
 =?utf-8?B?R1NMaXhLM0tjQ2pXajJ4cE5BbUpmWjlhb3JQYTFyMFVVZzU0Y1ZseUNZcGlo?=
 =?utf-8?B?ZmV6T3Q1NzM4UEpnOGhzMGVTcjEzc3pLMFNMQkttejZxWDc4L0EzQUN6ajlr?=
 =?utf-8?B?aUd0YStrd2xoaG1hR29JenFnNkpJQWhwQWZ2eVVub3lGQmpKTTZpRDlrN1Bs?=
 =?utf-8?B?K05pb1ZoSlV2ZXlDR09wRTh2VjJlMHZ6alpQVDFxNkpNa0ZzcUVwZHpyVi9w?=
 =?utf-8?B?YXUrUG1RR1l5Qkx1YjRpeXIrbEg1UGRKbFVlQTlkckxBUXpwUDBBd2xLME5N?=
 =?utf-8?B?alNpWkw0MWJ5ZlpLNUJHVlY4QXB1Q2pQZmZNd0NlTjZvN1UxTlZXYnUxSVVT?=
 =?utf-8?B?MXFQZXY3NFNJY29KbVJvME9zcytjSEk5cGtodFhUZGhJVVJiY1d0YThOTTJl?=
 =?utf-8?B?V2tUOUFkYlU0WTlQNmdudE82WnZyU1JCcEh3ZVJBcmR4ZEJwOFZwYXJpSnJm?=
 =?utf-8?B?aWxSZ2hYZkVhMEVIekVVRHNCOXFyOWt3cTNYdStpa1BTSVJYVjA1RlRmVjdT?=
 =?utf-8?B?Q28wLzR6Z3dHc1BtVE1vblQzaVVTMm82LzZ5M2RVZWNsS0taZGl6Y0JhVTNV?=
 =?utf-8?B?ZHJjdjVOdmZGcW5NcXNydDg0bjZXaWNTOStFK0FLRC9PL0NMdGkwYkM5ZkU3?=
 =?utf-8?B?SGQrTUoyZjVuMVJPZlU5eTBOVWZzeHlkUVA4aW1Ra1ZGTENpWGltYlZHRlVk?=
 =?utf-8?B?YXZoOXR1NE5WSUFuQVJPUy9zai91M3BSNkVlNUwxalQrT2IrTS96RnhFS2Z4?=
 =?utf-8?B?SUhmazFyZHBMUytmMGdxWVNmUW9IYXFJbUord2FiRDVvb0dWaFdCMHNtUW0w?=
 =?utf-8?Q?dextzwZdxtomss9DrfemaCU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e97a0f-e19d-499c-fe3d-08d9da2ed1cf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 03:01:27.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYZ3/FSB27af1F5Ati2MzTZXhlOjcQZaHaDwzdHLLi7yy3uHOqiG6IVeckuXfi9syCmMnEKscLCxuerZBISjZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2978
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
mentions that it should be in UI.  However, the dphy core driver wrongly
sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
is '8 UI', instead of 8.

So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
value according to the D-PHY specification.

I'm assuming that all impacted custom drivers shall program values in
TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
specification mentions that the frequency of TxByteClkHS is exactly 1/8
the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
custom driver code is changed to program those values as
DIV_ROUND_UP(cfg->clk_pre, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD), then.

Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
as I don't have the hardwares.

Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Guido Günther <agx@sigxcpu.org>
Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c                 | 7 ++-----
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    | 3 ++-
 drivers/phy/phy-core-mipi-dphy.c                 | 4 ++--
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c | 3 ++-
 include/linux/phy/phy-mipi-dphy.h                | 4 +++-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index a7389a0facfb..f1fdcdf763ee 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -196,12 +196,9 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
 /*
  * ui2bc - UI time periods to byte clock cycles
  */
-static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
+static u32 ui2bc(struct nwl_dsi *dsi, unsigned int ui)
 {
-	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-
-	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
-				  dsi->mode.clock * 1000 * bpp);
+	return DIV_ROUND_UP(ui, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD);
 }
 
 /*
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index cd2332bf0e31..8a818cdb7606 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -250,7 +250,8 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
 		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
 		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
 	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
-		     DIV_ROUND_UP(priv->config.clk_pre, temp));
+		     DIV_ROUND_UP(priv->config.clk_pre,
+				  MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD));
 
 	regmap_write(priv->regmap, MIPI_DSI_HS_TIM,
 		     DIV_ROUND_UP(priv->config.hs_exit, temp) |
diff --git a/drivers/phy/phy-core-mipi-dphy.c b/drivers/phy/phy-core-mipi-dphy.c
index 288c9c67aa74..ccb4045685cd 100644
--- a/drivers/phy/phy-core-mipi-dphy.c
+++ b/drivers/phy/phy-core-mipi-dphy.c
@@ -36,7 +36,7 @@ int phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
 
 	cfg->clk_miss = 0;
 	cfg->clk_post = 60000 + 52 * ui;
-	cfg->clk_pre = 8000;
+	cfg->clk_pre = 8;
 	cfg->clk_prepare = 38000;
 	cfg->clk_settle = 95000;
 	cfg->clk_term_en = 0;
@@ -97,7 +97,7 @@ int phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg)
 	if (cfg->clk_post < (60000 + 52 * ui))
 		return -EINVAL;
 
-	if (cfg->clk_pre < 8000)
+	if (cfg->clk_pre < 8)
 		return -EINVAL;
 
 	if (cfg->clk_prepare < 38000 || cfg->clk_prepare > 95000)
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 347dc79a18c1..67b0a17be7e3 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -364,7 +364,8 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 	 * The value of counter for HS Tclk-pre
 	 * Tclk-pre = Tpin_txbyteclkhs * value
 	 */
-	clk_pre = DIV_ROUND_UP(cfg->clk_pre, t_txbyteclkhs);
+	clk_pre = DIV_ROUND_UP(cfg->clk_pre,
+			       MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD);
 
 	/*
 	 * The value of counter for HS Tlpx Time
diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
index a877ffee845d..ab1f736fbcd3 100644
--- a/include/linux/phy/phy-mipi-dphy.h
+++ b/include/linux/phy/phy-mipi-dphy.h
@@ -6,6 +6,8 @@
 #ifndef __PHY_MIPI_DPHY_H_
 #define __PHY_MIPI_DPHY_H_
 
+#define MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD	8
+
 /**
  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
  *
@@ -42,7 +44,7 @@ struct phy_configure_opts_mipi_dphy {
 	 * the transmitter prior to any associated Data Lane beginning
 	 * the transition from LP to HS mode.
 	 *
-	 * Minimum value: 8 UI
+	 * Minimum value: 8
 	 */
 	unsigned int		clk_pre;
 
-- 
2.25.1

