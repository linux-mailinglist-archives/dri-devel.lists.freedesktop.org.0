Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58E50069E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F9810FC87;
	Thu, 14 Apr 2022 07:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30087.outbound.protection.outlook.com [40.107.3.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915910FC87
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:09:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pr5uYfoSaBf1QdByodfh/vfKeIxcsNTjf6rQiJAWogrL7Her0Im/omOONJAYF59ncS3TKFkDa60i8TjutvQDdF74iK7H4U5BWDzHRBOcdM37yW0Lvccz6V283T/9XfTxntcTCdpF0VvavxoiX5ApNvf/sgWl4sorww+xup5d4PouUGlkNj7thcFcW8YUo2FaFSqNUqmNY0bPYRs5BczSjKWgKyGDLJEJrpne+9kyhyhsQqCuwpnDJEigBcP//+ftRgmOKdLf4GKCSac6p4bGlMYhucqCeJnILefaTj+uBp/HZyStjbKvnjuzPPeayH4EhxU3oLuwEXnBRp/sbVDF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L4vMIUf1mDanswpJo8fhPsQYyiOeSJQ+w6SBa7SJpo=;
 b=jqo7KkJ0TLJ/Dny2WltxeGKYw8BXpGUlHU24ZvpYUy5K2x2MmEYw1yrPyDMB8zBizKvwfg0FRjOOqXj0nMX1XK5hGIMMETSIBeONn5jgK/q0jkHHwjjNgP5buX0EFPHDsSnnnZuuDty7gGsRZTosB9PUTl2hknNNin402u29lUCbrALFj4dUxhxP68Mn5bCjNkKqy9fCDqOcWXnhf6zR1GRmc7EOWg62TDc4WFWgmGje8uiHvH4Am3opwRliGoKdYlHMaaepMDat5J2gZxucwb0VefVTTIdH1N2amG/4KSm8q47/nPAFkbeiohWm183MIfc0SziWehSk1DX/PwHWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L4vMIUf1mDanswpJo8fhPsQYyiOeSJQ+w6SBa7SJpo=;
 b=f0CJA6bzdNcM4Ct7ZC5N1RXly0heC5qZZ0LA6b3mTdaAOuwhslHEXrMSjJSwpoQX+ZMGoMtk/UjymuN/WjuXO+O2q0jjLFtF4N/DCESV4jtkAWjuWYXAUoUL42TbFjR+WRiIDPcD/csA6t1Zf5rJmA9hLsZWGppVJtUWtEmvclU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM5PR04MB3027.eurprd04.prod.outlook.com (2603:10a6:206:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 07:09:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 07:09:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 5/5] phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp
 LVDS PHY mode support
Date: Thu, 14 Apr 2022 15:10:39 +0800
Message-Id: <20220414071039.423271-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414071039.423271-1-victor.liu@nxp.com>
References: <20220414071039.423271-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4231c9ce-e569-4f99-c831-08da1de5b917
X-MS-TrafficTypeDiagnostic: AM5PR04MB3027:EE_
X-Microsoft-Antispam-PRVS: <AM5PR04MB30279075F6FD164BA8483A7A98EF9@AM5PR04MB3027.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71+iB3LFxeml02siSB9JJMbxXqAcA7flVoLuhYqItQX8IsTSSC67j/4123JW2cDYEhAqQdnAa5IFML32wr6Xy7MhGrmyHNGzLU08G8xf4SexaOQ83FD+c8XH43URpVx9bOPX2PwaeWlkJRhDtJ04NTYO0QCPpfgLBZwAE51qeRojyks4/Zb8VDcMOFNf8/PcLW2bY0qC3ab/8azTYFheR5sI1EUJl150g1l5BRw0D5KL8BdIarPp4TBlfGF1kKd4EQUg8OKDjowhi+mZHJXlhJ1YxbzMcHDtQmFw+ioZal9aTinUrveRk2Hv86o2IwbCCjBGlPoKpmLYeLhIMAwrBvipDn9qaMW4rNymRB4ZXchgNmmt/HbMHtRHrubulebTsJsgqAEWxHMCkq/xJXPFwB1IvhcHgdUf33CJOEIJHj4gkAAqTGZW0cDQoFy+ZJypQGnkPYPy6deHVi6zcm7Vjn6qj/l+1rozr0oiNPyQePhW5alc2xEidA+wWqRDoTJ4vdu+wrpD4oiKRRCVOR5H6zTicCKNFtyrD3sVLC8eJE+JDBX3CRDsM8f6/DYGifcX3nTqr4W/+kOwJYM8N1101V/KgZWBqvH3cOkpPsyVWI/yDsA4Ky7CTMrzbHA5b7Csf/P0kmWvujwg2OM/LydUwygUHC1mdmM3gg6MfRXd4ArqmferDW00W7Y0Y34Uxb+Q3lbDJUVtETA6c7mG95AvcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(316002)(8936002)(7416002)(66476007)(4326008)(508600001)(8676002)(66946007)(36756003)(38100700002)(38350700002)(66556008)(6486002)(83380400001)(52116002)(5660300002)(6512007)(2616005)(26005)(66574015)(30864003)(186003)(86362001)(6506007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0pqVG1ta2FybndhTzNQeXRjdkxDNVFYYk11Tk9KSTN6V3BDN1l2UW0xR01U?=
 =?utf-8?B?a1lMakp5enowRUFVWjRzOUF3ellFWlVNdlp4VTFzbkk4UlRJUTA5dXQvVnY3?=
 =?utf-8?B?UzZCODZQaHFlTW1ZNUZDMUhVbHR0SzZZclFVRjVtbzRhanlwY2lyNDZXUE43?=
 =?utf-8?B?Y2JONEJhQmdjcm9Kcmd0YURwbm02NjZRaG1rd3kvZVcrWERCU1RoMlg4V2o3?=
 =?utf-8?B?ZWppWldPU3BRdmxqTDNBZDRzWHN5REgyaXhvSEQ4MHMyNnVSS3VkVGl6RFN4?=
 =?utf-8?B?SUtvUWoyUFJCWGxxZUh4SDJhZTJKTDZIcEI2ZG5NV0l1VXljNTFBUXZyZmhX?=
 =?utf-8?B?ZmFhUHBRQjh0UG5YZExERXdBeVNIdUFvNXdCUUlJaFVsSVMzczd6MlZqdzhH?=
 =?utf-8?B?Ry9tUm1MSzRGcVQ2SzB1WFUxT3MvNDdHN0RyMXg4K05qYktoTk1laE5Ya0tl?=
 =?utf-8?B?VlZJMEVVMm1UQ1RPQ1RjVUtzK0x0UnZuQzRaR01BVEhiZVZPa3VOcHVwMVhO?=
 =?utf-8?B?QXR4UGFzME1Sb3hRa3pxME1xc1hqblNWWkRzWWVkUXY3NGM1YUhzVmYvNFZO?=
 =?utf-8?B?LytlSGdWWkx0YnlLQjhQd29HaWZpY0k0WmNydnFIczZzSDRRZVllckpXcG5H?=
 =?utf-8?B?Mk9iRGNyU2F2VnNQRUdhOG5sRTJSeEpxNGFkNWRhZDJQUTlpMDY4Ny9aU1VM?=
 =?utf-8?B?cE1iK3RsL25FbkR1OFd5bzd0NFJKVjhvTEFjVUZBK0xnaUpNQWtmd3czQ0xM?=
 =?utf-8?B?a01ySnRPcUhiTzAzTUgwbWduMnNoYkdwVWdsL203MUZWUFVMVFRTY0MzK1Ba?=
 =?utf-8?B?aFVSVktONzh2VW91dkQvdTRXdG5sa1BRMHNXWHZXVFBBdzFOVDZzRkgwRk9S?=
 =?utf-8?B?TzY1Y2JKMHlJVXNVRlFDQm1aby9Fb1BYOS9ZZVJRS2M0OHR6QVZVMDJNNTJI?=
 =?utf-8?B?TWJlSFo4c2lJeUJkMEFMOW5Ccm5ubnJkOUtveUtwQUpqNi9hb3NSd25sanJH?=
 =?utf-8?B?WGhwMGtjT3FLbWE2OWNuMjJXL2NEMW9RcEdYVGxhR1hvSGlqL3dwcWU1WlJF?=
 =?utf-8?B?WHE3ZTAxQUJHa0hGRTVXTkJMLy9xemNqVHY0WVlkMDRqbEx1M0prdWFZV0ZG?=
 =?utf-8?B?UG5vSW5RN1BHTjdwTFRBUjMwSE1obmp3L1FKSm4xRnVEbzhzVVRYdWYzZ1NB?=
 =?utf-8?B?UHMwcVltU1lYWnpqblZzVEhuZ1R4Yjdya1RNcU1yb0NuNlV5aVNIdkg2ME01?=
 =?utf-8?B?M0pCM2pWY2FjbWFtQldIRGovWWw4Wm9uQU1heDBsU0ZIVnhwNXhYMDBDQjQw?=
 =?utf-8?B?aHZWOTR1Mkt6T3g0TTB1NUZqWndHOXNnK2dZNG9MMnZ5cFRpTnVLNVhSdVRy?=
 =?utf-8?B?cjlYV1JWMHNjMGJLZXM4SFNrN1praFJFdkhVUzBibktRcHZhemJaNGFnaWhi?=
 =?utf-8?B?cmEzdTRlaTZHd2VPQXpQM0hnYU8xd2ZOMU1PNVVMMVNldGFSaHVYYlBvc2tL?=
 =?utf-8?B?dklnaUduRlpiRUpJQll3dzNTYnU5RXB6NEo4eDZEaXJMSnF2ZXhWZ09xcndR?=
 =?utf-8?B?YS9PV0UvTm5Uc1VJQm45QU5DOUdZaXdlNG85c016eDNZMUFRQ3BlbS9GQVVU?=
 =?utf-8?B?ZUt2WmVScTRQaTNidjQremU1U2FiamhVTWhLY3VOTWJ2aWZRWlJwUDhFUzFi?=
 =?utf-8?B?MURLbmlBaVpzeXp2dStyK1JUaVpvU29OaVp5YjNKVzFLKzAwRk1VcFlIOTBM?=
 =?utf-8?B?QkRaRE94U0lLRThMdFpWR2pGUXJhcEpHMFN3aFR2VEs1TDhZKzFVb0VQZ2Fo?=
 =?utf-8?B?TXhxZ1FzaXlXZVdOUkFITGNQSnpVcTZkL0VybDRPSE5wVnhSSHBHK3FLaGNU?=
 =?utf-8?B?clZsWmRxK1F1SjF6cGIzZVg0T0JsYmNYVVNwSWVGd3VPY01SOEtpd0NRSFZ6?=
 =?utf-8?B?VzB4MTBNQTJhTnd0ejFZUHU1U1FJOURvb2RmdVhFZTNRNzlXbWpjenhIM3Z6?=
 =?utf-8?B?WWpGN0hiY05GTjdnbVNQVFNETm9JZVNvaGQ1ZUNWNmdybVkybHpTeCtXSVFa?=
 =?utf-8?B?Nm1uZzVsMStCU1ZhTXJ0ODJmN0grQ0krNzNKdUh6SjEzZ3hWdlJJblBQZHIy?=
 =?utf-8?B?Zmx1WGZONjBwMEE4aFBGMmNXMzlGVlV1VkJnODZZNFlkcVorWU1BTklJck4v?=
 =?utf-8?B?YTVWRFpDTXhpcktpTDJlQm5OK0Q0OW0xVzBPSmlHVStDdWVncG5DS1JPa2Rr?=
 =?utf-8?B?MWExYUdFUmFybVAwSVltVnZaVkFDRkI0YXVOWnZheVcxVWVWLzFDaVNpMVNP?=
 =?utf-8?B?ZUxabEM5MnhqOUlHdWc2dzFydm1JaVRkbzVpTTZqbHlYNTVWTWt6QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4231c9ce-e569-4f99-c831-08da1de5b917
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 07:09:31.8905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oig5/gaXJnSAFwS/uQdpnU9GlM7Uj84eAFpdaF4NVwewUu/oUB8nCK4gPtZvg752AdEDpb6wTlFbvM8ojY0/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3027
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8qxp SoC embeds a Mixel MIPI DPHY + LVDS PHY combo which supports
either a MIPI DSI display or a LVDS display.  The PHY mode is controlled
by SCU firmware and the driver would call a SCU firmware function to
configure the PHY mode.  The single LVDS PHY has 4 data lanes to support
a LVDS display.  Also, with a master LVDS PHY and a slave LVDS PHY, they
may work together to support a LVDS display with 8 data lanes(usually, dual
LVDS link display).  Note that this patch supports the LVDS PHY mode only
for the i.MX8qxp Mixel combo PHY, i.e., the MIPI DPHY mode is yet to be
supported, so for now error would be returned from ->set_mode() if MIPI
DPHY mode is passed over to it for the combo PHY.

Cc: Guido Günther <agx@sigxcpu.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* Use marco instead of magic number for CCM and CA values.
* Suppress 'checkpatch --strict' warnings.
* Check !opts in mixel_dphy_configure().

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Add Guido's R-b tag.

v2->v3:
* Improve readability of mixel_dphy_set_mode(). (Guido)

v1->v2:
* Print invalid PHY mode in dmesg. (Guido)

 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 276 +++++++++++++++++-
 1 file changed, 265 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
index a95572b397ca..e625b32889bf 100644
--- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
@@ -4,17 +4,33 @@
  * Copyright 2019 Purism SPC
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
+#include <linux/firmware/imx/ipc.h>
+#include <linux/firmware/imx/svc/misc.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+/* Control and Status Registers(CSR) */
+#define PHY_CTRL			0x00
+#define  CCM_MASK			GENMASK(7, 5)
+#define  CCM(n)				FIELD_PREP(CCM_MASK, (n))
+#define  CCM_1_2V			0x5
+#define  CA_MASK			GENMASK(4, 2)
+#define  CA_3_51MA			0x4
+#define  CA(n)				FIELD_PREP(CA_MASK, (n))
+#define  RFB				BIT(1)
+#define  LVDS_EN			BIT(0)
 
 /* DPHY registers */
 #define DPHY_PD_DPHY			0x00
@@ -55,8 +71,15 @@
 #define PWR_ON	0
 #define PWR_OFF	1
 
+#define MIN_VCO_FREQ 640000000
+#define MAX_VCO_FREQ 1500000000
+
+#define MIN_LVDS_REFCLK_FREQ 24000000
+#define MAX_LVDS_REFCLK_FREQ 150000000
+
 enum mixel_dphy_devtype {
 	MIXEL_IMX8MQ,
+	MIXEL_IMX8QXP,
 };
 
 struct mixel_dphy_devdata {
@@ -65,6 +88,7 @@ struct mixel_dphy_devdata {
 	u8 reg_rxlprp;
 	u8 reg_rxcdrp;
 	u8 reg_rxhs_settle;
+	bool is_combo;	/* MIPI DPHY and LVDS PHY combo */
 };
 
 static const struct mixel_dphy_devdata mixel_dphy_devdata[] = {
@@ -74,6 +98,10 @@ static const struct mixel_dphy_devdata mixel_dphy_devdata[] = {
 		.reg_rxlprp = 0x40,
 		.reg_rxcdrp = 0x44,
 		.reg_rxhs_settle = 0x48,
+		.is_combo = false,
+	},
+	[MIXEL_IMX8QXP] = {
+		.is_combo = true,
 	},
 };
 
@@ -95,8 +123,12 @@ struct mixel_dphy_cfg {
 struct mixel_dphy_priv {
 	struct mixel_dphy_cfg cfg;
 	struct regmap *regmap;
+	struct regmap *lvds_regmap;
 	struct clk *phy_ref_clk;
 	const struct mixel_dphy_devdata *devdata;
+	struct imx_sc_ipc *ipc_handle;
+	bool is_slave;
+	int id;
 };
 
 static const struct regmap_config mixel_dphy_regmap_config = {
@@ -317,7 +349,8 @@ static int mixel_dphy_set_pll_params(struct phy *phy)
 	return 0;
 }
 
-static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+static int
+mixel_dphy_configure_mipi_dphy(struct phy *phy, union phy_configure_opts *opts)
 {
 	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
 	struct mixel_dphy_cfg cfg = { 0 };
@@ -345,15 +378,126 @@ static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	return 0;
 }
 
+static int
+mixel_dphy_configure_lvds_phy(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	struct phy_configure_opts_lvds *lvds_opts = &opts->lvds;
+	unsigned long data_rate;
+	unsigned long fvco;
+	u32 rsc;
+	u32 co;
+	int ret;
+
+	priv->is_slave = lvds_opts->is_slave;
+
+	/* LVDS interface pins */
+	regmap_write(priv->lvds_regmap, PHY_CTRL,
+		     CCM(CCM_1_2V) | CA(CA_3_51MA) | RFB);
+
+	/* enable MODE8 only for slave LVDS PHY */
+	rsc = priv->id ? IMX_SC_R_MIPI_1 : IMX_SC_R_MIPI_0;
+	ret = imx_sc_misc_set_control(priv->ipc_handle, rsc, IMX_SC_C_DUAL_MODE,
+				      lvds_opts->is_slave);
+	if (ret) {
+		dev_err(&phy->dev, "Failed to configure MODE8: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Choose an appropriate divider ratio to meet the requirement of
+	 * PLL VCO frequency range.
+	 *
+	 *  -----  640MHz ~ 1500MHz   ------------      ---------------
+	 * | VCO | ----------------> | CO divider | -> | LVDS data rate|
+	 *  -----       FVCO          ------------      ---------------
+	 *                            1/2/4/8 div     7 * differential_clk_rate
+	 */
+	data_rate = 7 * lvds_opts->differential_clk_rate;
+	for (co = 1; co <= 8; co *= 2) {
+		fvco = data_rate * co;
+
+		if (fvco >= MIN_VCO_FREQ)
+			break;
+	}
+
+	if (fvco < MIN_VCO_FREQ || fvco > MAX_VCO_FREQ) {
+		dev_err(&phy->dev, "VCO frequency %lu is out of range\n", fvco);
+		return -ERANGE;
+	}
+
+	/*
+	 * CO is configurable, while CN and CM are not,
+	 * as fixed ratios 1 and 7 are applied respectively.
+	 */
+	phy_write(phy, __ffs(co), DPHY_CO);
+
+	/* set reference clock rate */
+	clk_set_rate(priv->phy_ref_clk, lvds_opts->differential_clk_rate);
+
+	return ret;
+}
+
+static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	if (!opts) {
+		dev_err(&phy->dev, "No configuration options\n");
+		return -EINVAL;
+	}
+
+	if (phy->attrs.mode == PHY_MODE_MIPI_DPHY)
+		return mixel_dphy_configure_mipi_dphy(phy, opts);
+	else if (phy->attrs.mode == PHY_MODE_LVDS)
+		return mixel_dphy_configure_lvds_phy(phy, opts);
+
+	dev_err(&phy->dev,
+		"Failed to configure PHY with invalid PHY mode: %d\n", phy->attrs.mode);
+
+	return -EINVAL;
+}
+
+static int
+mixel_dphy_validate_lvds_phy(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct phy_configure_opts_lvds *lvds_cfg = &opts->lvds;
+
+	if (lvds_cfg->bits_per_lane_and_dclk_cycle != 7) {
+		dev_err(&phy->dev, "Invalid bits per LVDS data lane: %u\n",
+			lvds_cfg->bits_per_lane_and_dclk_cycle);
+		return -EINVAL;
+	}
+
+	if (lvds_cfg->lanes != 4) {
+		dev_err(&phy->dev, "Invalid LVDS data lanes: %u\n", lvds_cfg->lanes);
+		return -EINVAL;
+	}
+
+	if (lvds_cfg->differential_clk_rate < MIN_LVDS_REFCLK_FREQ ||
+	    lvds_cfg->differential_clk_rate > MAX_LVDS_REFCLK_FREQ) {
+		dev_err(&phy->dev,
+			"Invalid LVDS differential clock rate: %lu\n",
+			lvds_cfg->differential_clk_rate);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int mixel_dphy_validate(struct phy *phy, enum phy_mode mode, int submode,
 			       union phy_configure_opts *opts)
 {
-	struct mixel_dphy_cfg cfg = { 0 };
+	if (mode == PHY_MODE_MIPI_DPHY) {
+		struct mixel_dphy_cfg mipi_dphy_cfg = { 0 };
 
-	if (mode != PHY_MODE_MIPI_DPHY)
-		return -EINVAL;
+		return mixel_dphy_config_from_opts(phy, &opts->mipi_dphy,
+						   &mipi_dphy_cfg);
+	} else if (mode == PHY_MODE_LVDS) {
+		return mixel_dphy_validate_lvds_phy(phy, opts);
+	}
 
-	return mixel_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
+	dev_err(&phy->dev,
+		"Failed to validate PHY with invalid PHY mode: %d\n", mode);
+	return -EINVAL;
 }
 
 static int mixel_dphy_init(struct phy *phy)
@@ -373,26 +517,74 @@ static int mixel_dphy_exit(struct phy *phy)
 	return 0;
 }
 
-static int mixel_dphy_power_on(struct phy *phy)
+static int mixel_dphy_power_on_mipi_dphy(struct phy *phy)
 {
 	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
 	u32 locked;
 	int ret;
 
-	ret = clk_prepare_enable(priv->phy_ref_clk);
-	if (ret < 0)
-		return ret;
-
 	phy_write(phy, PWR_ON, DPHY_PD_PLL);
 	ret = regmap_read_poll_timeout(priv->regmap, DPHY_LOCK, locked,
 				       locked, PLL_LOCK_SLEEP,
 				       PLL_LOCK_TIMEOUT);
 	if (ret < 0) {
 		dev_err(&phy->dev, "Could not get DPHY lock (%d)!\n", ret);
-		goto clock_disable;
+		return ret;
 	}
 	phy_write(phy, PWR_ON, DPHY_PD_DPHY);
 
+	return 0;
+}
+
+static int mixel_dphy_power_on_lvds_phy(struct phy *phy)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	u32 locked;
+	int ret;
+
+	regmap_update_bits(priv->lvds_regmap, PHY_CTRL, LVDS_EN, LVDS_EN);
+
+	phy_write(phy, PWR_ON, DPHY_PD_DPHY);
+	phy_write(phy, PWR_ON, DPHY_PD_PLL);
+
+	/* do not wait for slave LVDS PHY being locked */
+	if (priv->is_slave)
+		return 0;
+
+	ret = regmap_read_poll_timeout(priv->regmap, DPHY_LOCK, locked,
+				       locked, PLL_LOCK_SLEEP,
+				       PLL_LOCK_TIMEOUT);
+	if (ret < 0) {
+		dev_err(&phy->dev, "Could not get LVDS PHY lock (%d)!\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mixel_dphy_power_on(struct phy *phy)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(priv->phy_ref_clk);
+	if (ret < 0)
+		return ret;
+
+	if (phy->attrs.mode == PHY_MODE_MIPI_DPHY) {
+		ret = mixel_dphy_power_on_mipi_dphy(phy);
+	} else if (phy->attrs.mode == PHY_MODE_LVDS) {
+		ret = mixel_dphy_power_on_lvds_phy(phy);
+	} else {
+		dev_err(&phy->dev,
+			"Failed to power on PHY with invalid PHY mode: %d\n",
+							phy->attrs.mode);
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		goto clock_disable;
+
 	return 0;
 clock_disable:
 	clk_disable_unprepare(priv->phy_ref_clk);
@@ -406,16 +598,51 @@ static int mixel_dphy_power_off(struct phy *phy)
 	phy_write(phy, PWR_OFF, DPHY_PD_PLL);
 	phy_write(phy, PWR_OFF, DPHY_PD_DPHY);
 
+	if (phy->attrs.mode == PHY_MODE_LVDS)
+		regmap_update_bits(priv->lvds_regmap, PHY_CTRL, LVDS_EN, 0);
+
 	clk_disable_unprepare(priv->phy_ref_clk);
 
 	return 0;
 }
 
+static int mixel_dphy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	if (priv->devdata->is_combo && mode != PHY_MODE_LVDS) {
+		dev_err(&phy->dev, "Failed to set PHY mode for combo PHY\n");
+		return -EINVAL;
+	}
+
+	if (!priv->devdata->is_combo && mode != PHY_MODE_MIPI_DPHY) {
+		dev_err(&phy->dev, "Failed to set PHY mode to MIPI DPHY\n");
+		return -EINVAL;
+	}
+
+	if (priv->devdata->is_combo) {
+		u32 rsc = priv->id ? IMX_SC_R_MIPI_1 : IMX_SC_R_MIPI_0;
+
+		ret = imx_sc_misc_set_control(priv->ipc_handle,
+					      rsc, IMX_SC_C_MODE,
+					      mode == PHY_MODE_LVDS);
+		if (ret) {
+			dev_err(&phy->dev,
+				"Failed to set PHY mode via SCU ipc: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static const struct phy_ops mixel_dphy_phy_ops = {
 	.init = mixel_dphy_init,
 	.exit = mixel_dphy_exit,
 	.power_on = mixel_dphy_power_on,
 	.power_off = mixel_dphy_power_off,
+	.set_mode = mixel_dphy_set_mode,
 	.configure = mixel_dphy_configure,
 	.validate = mixel_dphy_validate,
 	.owner = THIS_MODULE,
@@ -424,6 +651,8 @@ static const struct phy_ops mixel_dphy_phy_ops = {
 static const struct of_device_id mixel_dphy_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-dphy",
 	  .data = &mixel_dphy_devdata[MIXEL_IMX8MQ] },
+	{ .compatible = "fsl,imx8qxp-mipi-dphy",
+	  .data = &mixel_dphy_devdata[MIXEL_IMX8QXP] },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mixel_dphy_of_match);
@@ -436,6 +665,7 @@ static int mixel_dphy_probe(struct platform_device *pdev)
 	struct mixel_dphy_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
+	int ret;
 
 	if (!np)
 		return -ENODEV;
@@ -467,6 +697,30 @@ static int mixel_dphy_probe(struct platform_device *pdev)
 	dev_dbg(dev, "phy_ref clock rate: %lu\n",
 		clk_get_rate(priv->phy_ref_clk));
 
+	if (priv->devdata->is_combo) {
+		priv->lvds_regmap =
+			syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
+		if (IS_ERR(priv->lvds_regmap)) {
+			ret = PTR_ERR(priv->lvds_regmap);
+			dev_err_probe(dev, ret, "Failed to get LVDS regmap\n");
+			return ret;
+		}
+
+		priv->id = of_alias_get_id(np, "mipi_dphy");
+		if (priv->id < 0) {
+			dev_err(dev, "Failed to get phy node alias id: %d\n",
+				priv->id);
+			return priv->id;
+		}
+
+		ret = imx_scu_get_handle(&priv->ipc_handle);
+		if (ret) {
+			dev_err_probe(dev, ret,
+				      "Failed to get SCU ipc handle\n");
+			return ret;
+		}
+	}
+
 	dev_set_drvdata(dev, priv);
 
 	phy = devm_phy_create(dev, np, &mixel_dphy_phy_ops);
-- 
2.25.1

