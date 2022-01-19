Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B0B493302
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 03:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187CE10E690;
	Wed, 19 Jan 2022 02:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9710E690
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/HZWinBxVyJNHUB9jwez23UnAa2EpEuqRmUA1S9vG/FdubUQEoX6jFhmkXHHHh2menOttlF4O7XqPisqymDRKhX9zHt0IUUe+9IBxLa+3cjQSabmRZLkpiFf5KPuc6j/IE3bLkIkKZ1V2WPf/9NA2S9el7hdolsPZndnfEaI9A3AWlCHlV6lbH82MrAzzkH7bSa8gqAMzAbctktOYRgcW/C3RBZmcmxq3gGjXRdxd08crpglWaKsnFm0XIHcZSBMlGbo29Je9nNwPXEjZx6nBnwKAnFLZ0A6TAkVDhx7OWUdkgWih3Ie3Gf+aIF/9cKVBSKWD3m0GO7pCYgro3fIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnJ5yxdI7HHJD0XMNqupCI6R887JEfSr30UT0n2cnmg=;
 b=CLVvkCXd2KEWD0tN8MdcfmjjLPe3g9s3IBRE1Hl4pMRC4PK/hW45ylXDvdZfuwgEuargFQG8sZGjAnVvoMnV1uxb+LnQDcr5r6zZ+HXQwCGAflp1cwjuwwYa2JOnonG9rLc4/dF/oD1TyICUs+UHYld1WJp3HH3zqJx7pIyuN0xGRpwfs8KPenRGZIhyELTVELtBm67xwKNROVMcRJxkjn3JAAdvhfQeBKxn8DXg1snLWWYYFqG31I44oFsJoCQnQqEgPrrMBIeYfxHZBpHBVAC6dL7/5MrEV3c4wCwwLzCiCYRZoGI89Qeu+W11p6RvKnD8ruR5eROCfVAwlXmfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnJ5yxdI7HHJD0XMNqupCI6R887JEfSr30UT0n2cnmg=;
 b=Q55FkdahyaSmAqC3pobY3aQ409JiWHJy6fK1OZD+9Z675/UBKN+KrAAzGww+cgXZq26MELvK3MG0o4p0tDINNz6gfdm6dvTHiGkVgUIdng2lMCSbNUVr2LIe/IP+mRHwWpDARIrDxoCXjJJuUfZ8iWNtTSZKr3Aa0hvLzvyMIZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB5543.eurprd04.prod.outlook.com (2603:10a6:20b:99::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 02:38:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 02:38:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2] phy: dphy: Correct clk_pre parameter
Date: Wed, 19 Jan 2022 10:37:14 +0800
Message-Id: <20220119023714.1498508-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb769a4-2ab6-4f02-ebee-08d9daf4ba81
X-MS-TrafficTypeDiagnostic: AM6PR04MB5543:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB55439CF6C586B334233D546998599@AM6PR04MB5543.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0De4MzA40eNG7v9yOW3neQdSNkL5LwoK2/JY2OEXHrheUb0DRgl/Zfu473NjWCtBXVJs46M+nHpcw0OvX8wIsa1oXVIa8k4R5P4rSuqGwwlS33G3zwu6fJ4i96kFSbB7giA9/qtAbzGFJIKM8cBxUF+4J8XwaZpSu2IVuN9060qyhzFKGF5eC3EBR+DfRAe0qbEIz9LKTzTopM3HKi3Mw00q7d7BBhmoFa/6zJCvWbeJttbnWrNsg2CNQcVSwOHN8ohkBQpy2b/FxlRqG7VyBQLe/yHdsCPXoxOrekwvmRI6TUsJTEojOnovsKF+RMVCFJYzyYZHAGQmtpNLVFeS2K9UTiRMo/6nyZa3ni0TqaBFyf3hGWmNuxNZRYNuMRqo9Dsz8NZghCre9RdcnMXadBeTdcrdJMUwJHAmgYK4wCYnFoXfZaW1wzopDuW/XXdS+kLpMEWCR7xwS79cCUgtu+2egXjTz2sLK79M3zH0svtePr3hF9aKqmqMvacEwl1XvfnRF5wM3oEg0cWk0103lTVJ3+kXdA+JZtowiCLxlrNRoEnM4Bhhyp521vGommCWF1xbm8IF0FRAPg5bher3yleSq/21krxuWMip0vCiwP1vNSE662ObWqiQI2rk4OmrtFtVEW8187d9/G6I/gIALnN2NXJh6v2B9zBowvbJIqvZm/dH4Suxb94cSelhsShlBeel5sfnBOYC6/YPrwaEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38350700002)(38100700002)(66476007)(66556008)(316002)(52116002)(36756003)(186003)(6506007)(6666004)(1076003)(8936002)(26005)(2616005)(4326008)(66574015)(83380400001)(86362001)(7416002)(508600001)(66946007)(2906002)(6512007)(54906003)(5660300002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kzd3aGdkZHVNbUMzSzd1RGZsQk1HdzdNZVJuMThqTjJSanBJeURncFpCdklB?=
 =?utf-8?B?WGpMbjhuTTI5NVV2NlNWNTIzVkJUMUZQQ2pmeWczakRRaTdabURSakloSnZF?=
 =?utf-8?B?VkUxMVpubFlhU2ZjN2RXaFNDNUd1OEprVHlhMm5tc2xEanFFMWhHRzJSbmhi?=
 =?utf-8?B?Y1JwMTFYRS9PSUFOMW9wN0ZDS3RnWlQzLzlSbXBDKys2OFZkL1ZZK0RQcmUz?=
 =?utf-8?B?MjV6dEpPK05SenFZVmRJejBtZ3JLcGdSamRMMGU4cENOV1hIUXBWSjJJc3BG?=
 =?utf-8?B?Z1A2RmFsZlZXa0h3SVJzMllzVWM5cW5naWhUWTIzUCtxUVVMemNydFZVdVFE?=
 =?utf-8?B?QnAwbmNwSVEvaVVFQnZTRnJtdXAwclZVWlpid3NaRzRXTDluTlAxcW9oRUpv?=
 =?utf-8?B?dGxIUWNzdUJjbmhLZVRCNE5KdlBVYjRwLzNZVnRqN3ZkMC9hRmM1U09YeGox?=
 =?utf-8?B?Ty94VXAvSnVkTWY2bnVDUXFEYU1kejBUQm9RL0VtSFhSLzByc2pmRS9vVmV1?=
 =?utf-8?B?S3FleUhqTS9WOHUzUU5KSkg3ZFVZYmJVSEdxK2pQNDNrQjF6clJUeDhubWlZ?=
 =?utf-8?B?N2xIZ1FFRW1VVCtURlNveUF4U2l1WE55RDdqS0h5UVRRVFlzRk5EMHlrblFQ?=
 =?utf-8?B?dlB0RkxTKzBzaVFBYU02ZEVld1d3ZWR6SS82N2c5SlVsekl5U281enJCMTRI?=
 =?utf-8?B?QkpURXpwdmpmN3JhaTJjN1l0R3l5L1FIWWpLdDVjTmVxSU4wWldpQjdSRmxv?=
 =?utf-8?B?Z2pnUjd2cTZDYTcyUXkyWWcwdFJSUG1FQUhySXdUNVptZlYxZXZGTnd2L1ZI?=
 =?utf-8?B?eU1WYklxTlVUUEh6Nkw0RFhpcnRzK0FERVEyVm5vZ3lnbXRmZ1A3Z1hNRThq?=
 =?utf-8?B?VVNmNnhkeFBQSEE2RTk0aVExWkpJMWNYWEp5c3RKdVlFdVNwdUZ2eVA4UmxI?=
 =?utf-8?B?a1NhNWJzWC9nNlNUWEI0QmtHS0xRcElObSt4Y1BqVkhSMzUzZE5CRXRIQ3Zv?=
 =?utf-8?B?N0ZvbkpwZnFxb01kbTZ0N0lIZnVkcVZwWSt6VndLbm9vcnBoeHdzbjFyVXBF?=
 =?utf-8?B?UU1aRW9EazBmelJkUy92Snc3d2dQK2NLclFaK0cvTUVEOElTblppLzZmS2Iz?=
 =?utf-8?B?cVdhNDVoWkNabUFmQVdHU3NyQngwdHkvcSt5c3ZxRy9hREZvMFl6MlJlWmlO?=
 =?utf-8?B?a05IM2F1T004ZXhpcGlib1ZSdExJVGM3YVcvd0JKbm1QUG45YlA5TlpnbDBE?=
 =?utf-8?B?MHFjN2grMUg4aHZTMUZodGlWTzNROEJybW50QWVKdFRwaTBCeXA4N3NxUDVn?=
 =?utf-8?B?bVRHNUpESVlaOXFZaTZPVnJIekM1UVR3bjlTZnE5RHN5WHB5R2M1QnNBQnBl?=
 =?utf-8?B?YmtSTitUeWwyZkVRWm84QmFzV3lLOWJpN0dtNXNSZmNpalN1Z0s4N3prT1RB?=
 =?utf-8?B?Wlo1bFIzWXl4S2ZxRFFxZVVqVE5QeGw4aDh4Z2cxTWM3MjdhNXZLWmdEcUZo?=
 =?utf-8?B?Yng2MndtL0FiWTJhNFlrRVlYNktTcWZVdU02RlphVk4xV2hFMHJ5VkpsUTlC?=
 =?utf-8?B?Q2ljN1hVQVphNWhuK2F3TkdqdkxldXdNR2JOUnVPM1RzM3JCbU1WQnFJZGZG?=
 =?utf-8?B?dk5EK2xHTWIzL1VEaU9Qdy9mS3VnRk5sQTBqc3A3RVJiTTN2NVZpM1NrM1BP?=
 =?utf-8?B?ZGkwT1BhOElkaWFqS0Nkamp2K1JuSmF5TkkvRnRvQ0ltMVlyTzFkemVMY1di?=
 =?utf-8?B?NFNOQmNjRFFZd1VuUmZOQ1kyRXFjYWd1K2EraFZkUTV5SzFwQ1JNVnFwYUpx?=
 =?utf-8?B?U21xUkxadTRwWDFTTWo1Mkg3NDFRNUpzdjZJU2FiUkJnb3I3VnA0L0k4Z0xJ?=
 =?utf-8?B?ZlA2MFEzd3NBdklydExWVisxaUhraWVpRmJuTndXTFlRVUtxQVBRWkVrUnJU?=
 =?utf-8?B?ZUxER2EvTmNoUzN0MnloRWR4ZVcwRkVZd05EWU5oYXZSVFRWbG1lQnROSGJK?=
 =?utf-8?B?RDZ5WjQ0ZFJDV1pEVHRrSy94eEFuNW11eHdUdXdoMzlYRklnUVdhTTB4di9i?=
 =?utf-8?B?cUJFU2N5UWdYNzhDTHJwa0F4N3FUTmtwb2RPZzBST01EUDBnREQwcVAyN3Y1?=
 =?utf-8?B?czZCWWpiZVVsdVBzaDZyYVFNUFNhWXN4R3B4TmN0eE81eXU5WEhpU2FVempF?=
 =?utf-8?Q?JLS3wQ9+HeDfX45OA3oIVCw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb769a4-2ab6-4f02-ebee-08d9daf4ba81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 02:38:08.8868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stLubDZYpPueqJF6FzsG4jPwFnyBBjeKvxv40o50IKLdq5mjE9K4tB6cLmRfQr2MROlhm9RxfjuuDRRvjxG0bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5543
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
DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.

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
v1->v2:
* Use BITS_PER_BYTE macro. (Andrzej)
* Drop dsi argument from ui2bc() in nwl-dsi.c.

 drivers/gpu/drm/bridge/nwl-dsi.c                 | 12 +++++-------
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    |  3 ++-
 drivers/phy/phy-core-mipi-dphy.c                 |  4 ++--
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 ++-
 include/linux/phy/phy-mipi-dphy.h                |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index a7389a0facfb..af07eeb47ca0 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/math64.h>
@@ -196,12 +197,9 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
 /*
  * ui2bc - UI time periods to byte clock cycles
  */
-static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
+static u32 ui2bc(unsigned int ui)
 {
-	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-
-	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
-				  dsi->mode.clock * 1000 * bpp);
+	return DIV_ROUND_UP(ui, BITS_PER_BYTE);
 }
 
 /*
@@ -232,12 +230,12 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
 	}
 
 	/* values in byte clock cycles */
-	cycles = ui2bc(dsi, cfg->clk_pre);
+	cycles = ui2bc(cfg->clk_pre);
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_pre: 0x%x\n", cycles);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_T_PRE, cycles);
 	cycles = ps2bc(dsi, cfg->lpx + cfg->clk_prepare + cfg->clk_zero);
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_tx_gap (pre): 0x%x\n", cycles);
-	cycles += ui2bc(dsi, cfg->clk_pre);
+	cycles += ui2bc(cfg->clk_pre);
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_post: 0x%x\n", cycles);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_T_POST, cycles);
 	cycles = ps2bc(dsi, cfg->hs_exit);
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index cd2332bf0e31..fdbd64c03e12 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -250,7 +251,7 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
 		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
 		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
 	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
-		     DIV_ROUND_UP(priv->config.clk_pre, temp));
+		     DIV_ROUND_UP(priv->config.clk_pre, BITS_PER_BYTE));
 
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
index 347dc79a18c1..630e01b5c19b 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -5,6 +5,7 @@
  * Author: Wyon Bi <bivvy.bi@rock-chips.com>
  */
 
+#include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
@@ -364,7 +365,7 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 	 * The value of counter for HS Tclk-pre
 	 * Tclk-pre = Tpin_txbyteclkhs * value
 	 */
-	clk_pre = DIV_ROUND_UP(cfg->clk_pre, t_txbyteclkhs);
+	clk_pre = DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE);
 
 	/*
 	 * The value of counter for HS Tlpx Time
diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
index a877ffee845d..59a5e77ab409 100644
--- a/include/linux/phy/phy-mipi-dphy.h
+++ b/include/linux/phy/phy-mipi-dphy.h
@@ -42,7 +42,7 @@ struct phy_configure_opts_mipi_dphy {
 	 * the transmitter prior to any associated Data Lane beginning
 	 * the transition from LP to HS mode.
 	 *
-	 * Minimum value: 8 UI
+	 * Minimum value: 8
 	 */
 	unsigned int		clk_pre;
 
-- 
2.25.1

