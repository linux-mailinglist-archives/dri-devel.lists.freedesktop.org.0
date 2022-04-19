Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89FC506181
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 03:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D120410E211;
	Tue, 19 Apr 2022 01:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EBD10E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:07:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlpaOwF5UM0UmcEdDf8E5f/q/Rj9jNKwseuEbfxfCuVbSV/ckd7EMF9m9bgCW556s64e9K1gdvDrNoHbQlY7meIyofyLTV+u3IvbGXBWWIROs3Kms3DdUC4PMvIs2gR83zF8ZcFD+9nGYqsMKAh599owEu7Kk6dTWI3VJguJhVQD409E84xDmt4Ko9zikCwo6rMekdZN8drznxoKWUGayysugiU2ZFVpniCc8TG2vr1RpZ76LhQ/ADH1HK40hZ+Xn+uP9jTmqdkuhjfW8EoIUGB1Ma8o+fdKuj4wXhS4tugeG52/StWr/8rsNp6ol3NgGaRbg5n+q93M+BwzBx5xVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L4vMIUf1mDanswpJo8fhPsQYyiOeSJQ+w6SBa7SJpo=;
 b=lF4H4NwcMeI4u1gdcgXrSLf5jlaJ9qAzfPDDpUP6SOuV7+xoCeZAkCHWfLjU8yEVqnjuZJeuyTYO68AWs1r6U4RPYW1pQAnov+LtYEdKFXP/8MD/g0EejGppWN7RJLIV4RAVR+3CnHQqSBLVtoIJc/uydIOL1gVUZ4jsfncT99X6KPDXOt8vgw0FNUTl1dYUaZm7yFYbk5zwqwt3sec4xovc7s4wGPIz9wDPSvTywWAJf/jn2lR08MwpsrsWLOXteBeswwZ5D24xfxVPASd69ZGh7vTKBljHKMPRmMPy5rpp4Qz3J26pedkkCgtwUV3IBiuYQpdktHtbGkJ7sNlvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L4vMIUf1mDanswpJo8fhPsQYyiOeSJQ+w6SBa7SJpo=;
 b=AKLGjBRCSQ8cykmCCNyuQcOferAfDVjXwowzeFXGtD8b3p4qYFXMvz9ClwV88+3C5qTHh+e3bS12ulMY8JPFZQcztt0VWMPLfPQGengW7J8aJcedGw9Rg30sRsNOu0N66p5VoJT2wY4J9pj9UHHWSj6c3UN/5qKp0HZqkiV8zhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3291.eurprd04.prod.outlook.com (2603:10a6:7:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 01:07:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 01:07:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH resend v8 5/5] phy: freescale: phy-fsl-imx8-mipi-dphy: Add
 i.MX8qxp LVDS PHY mode support
Date: Tue, 19 Apr 2022 09:08:52 +0800
Message-Id: <20220419010852.452169-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419010852.452169-1-victor.liu@nxp.com>
References: <20220419010852.452169-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67e2d418-20ee-44ec-7d9d-08da21a1029d
X-MS-TrafficTypeDiagnostic: HE1PR04MB3291:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB32911BCE4B2EAACEE41C796398F29@HE1PR04MB3291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ciWidfrM60jLugOepyDo50oKsRxPwV03piEsDtIKK/I7pF7FtOwUSqJHJh/J1pqDDvgy7VWUCAUdpVRiJZW+aCQaqzwrZw4qvkDVkrj/5Sn4yt0v2IxE9nFqvXuXaVFgGxiHszI5kLOhLOsTbtZU6qXZwUlPZ3L9goIyDcSGiW3sCo8e/SnjFQq40U1PIhuGBfDof1yRtAu/X3+p6XBB0lzuwCJTgE6g7bA6QKVs8frcH1VE11iEgAFYbkcZg1g+nnkv9snilYlAshFc/9BCHlxZgE/truh+oncZFkCNXFatnqs7GXWeVRjbLpZQHVtE+pK22FybvjueoiSpjzMxAeorqLHHGBUtkCjNn6zT395gJlDejx91EUReS8uLiK5KXlfnITL4tIKEzmfAxs+nJIboQdWTOZ6Bo3/Epq1ASYUE7222rdfFkCS4ogPwVROnjaCHSyf5WibK2etZG2N0kZ21UDTeBOMYJaUa7h0wkHBGdE3zxJ8//Zi0REDisPBvFmCnYD1JKai7c5DRGIElYiEBcRKYeuN1/3sXI86C10vGypTfMGUasHLIlhrsoqbzv1ciFPn706IPtwYuBDdxtxwHVaU+ftOwXNdLvSDdYfJSQi1MHoFr1SXib6VO4wigwUJlPIWhk1fxzc4e9uF6LRm0FNAoeBHjEwIDezcz8+oxmPcUPtY5JM8Q7O+i4yXiqh5iNCdGu8+3TC/mNCrwgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(8676002)(4326008)(66574015)(86362001)(6486002)(36756003)(52116002)(6512007)(6506007)(6666004)(316002)(66556008)(66476007)(2906002)(26005)(186003)(83380400001)(2616005)(1076003)(5660300002)(30864003)(7416002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZpdFVZQVpVRm9yN1VXYmxpSkJkWXBDMWZHbFJyTzg4ZTFnL01IQTFBYklz?=
 =?utf-8?B?UExsblF5UXJZUGhOV2xQZ1VSTko3T1p4azdLRUxhSHhCc3cxbERDSktmcDJh?=
 =?utf-8?B?Tk1RVTNDUGJRMFhoa0Z2RXdyU2tJTkpDdjZWQ0tqbXc1VGhHbUxKY0tQMldW?=
 =?utf-8?B?dmdiQnJTMVlabzl0OUxyVnprZmJvUW1vbmtCSFFQdnJXMnhxTExCclpBMEZp?=
 =?utf-8?B?U0JPMGUxVGlaMGU4NG5NNWFubzZqWTdnMEJzMmJPWmQrVkZ0ZVNLREZ3K1NM?=
 =?utf-8?B?ekVJcTk5czVWZ0FYaGhxMitFVmpPUXNhejJEU1hGc0NlSmxMVldzQzdNUFNN?=
 =?utf-8?B?eE91alVIY0RHVjZrTnNucTNRY3NoOWlueWVBV09iR1phMy9xQ2hNdlNlalhG?=
 =?utf-8?B?dUFPYlgyQldFSEJFNmZoMTBJK2R5VTI1aW9RelNtL01qWWtZcWFqc2lLbERL?=
 =?utf-8?B?ZWRKV0ladEFacCtReFBhZjNDYmVCNTZkTHFSbHU3M2l6SDFqWnNhT0ZNNzVG?=
 =?utf-8?B?V1FmdHdKVlloUWt3YXFDL3FxSzF0S0ZtakIzbmh1Rk9pdnNqY0tlQmVIUmsy?=
 =?utf-8?B?RGRVY3E1YTlOQlg4V0djVWlOMWU5aVVDdGoxTGhHZC93eDVoWVQ1UmtSN0NX?=
 =?utf-8?B?UkhIL1lGVVpvTEdzKzdYR3lmZC96U1l6YmRpdVVNelFHOUFyNTZVYXBzNnhT?=
 =?utf-8?B?TVQ1Zk44eld3dmNaS201TGZaTmowVWYyS0M0UWtOU3VlcmN4UG5kOGkzTTE5?=
 =?utf-8?B?MHRES1lTT01LWWxIU0Y5T0ZZYlR5cmZtN1p2TU9SUHNNQWsybzA5dnZzWHVB?=
 =?utf-8?B?OG41SXBTZ0cvZ3E4ZTdvUWNBOFlONXJXZTdBLzRuWjZnU1NXdVhHSUtmdVF6?=
 =?utf-8?B?eWVoRkJvT2Jrd0dOQllNTmRaNnNLV1pia0xMa3dlaHNGekhIS1gxOGZRZDNx?=
 =?utf-8?B?UHFoUXIxM0RHRVlWYkk5TEdlMVcyYjk4L2dCSVdrVEFuTExTa29nVHpXT0pW?=
 =?utf-8?B?MmJud1YreWFnb2pYYzJVRmZ5TitBUk5vNUhZVFBRSTUwTG9jRnJPOFVoeDJl?=
 =?utf-8?B?MC84RXRSYms1OGttdUhzRFpDdTBGZHpNV1krMi95V0VxRHI2Qy9lQ0REQkZD?=
 =?utf-8?B?cjVpV25jRVV3YkZlaUJnd3pTcWFtVXkzamhucTVIakxkbXFndWlXOWNab1hM?=
 =?utf-8?B?ZlNRNnJycjA5UC85YllTM2ZYcHJ5QjNuS1ZIOWlIM092VERLOFBzK3JJNFZY?=
 =?utf-8?B?SlFNV3FGbDlIT1B5N1B3K3k3ZEg1THZyWTVvQ2FvYTFvM2xtd2YydHROVkVP?=
 =?utf-8?B?ZzRYMVE0SWtlMGNFUHlQaHB0ZFNrQmpYU3FOR1d0dkdDdG1nMXk2dmZlbnF1?=
 =?utf-8?B?RFlYUHVwRmVib1U2aC9reVo0UTJGcWo3OThiZjc2bkJsVFNvNlV0MGRCNGRk?=
 =?utf-8?B?U0lwZXdTZTl4dUl1ampubGpxeGlUNGpvaERmVi9rRWNmay9va2RpVkx2V2VB?=
 =?utf-8?B?Y3dJUXhWWEtmOVZZMU5HdmtKSEhNSklSNVhCS2dlUGZXejNmaHNBcGVuS3Bq?=
 =?utf-8?B?ZkowY1dhQUVSVW90MTBDQi9EUDFLcWJRMXAzY2xMbGVWSVhtZ2hUeUtHYWNW?=
 =?utf-8?B?Y2drL091U01taE12WkpkbDV0b0RIRm5Iay82V21hdUJ4cWFMaWVzMzNITzlW?=
 =?utf-8?B?VCt3VDllQmNNVGtyZS90YkZ0cjBTSUNvdDJxUE9SZG1tcFBsSW51MnVVV1I0?=
 =?utf-8?B?OWUxK1dEc2RiMzUxRTVrdHhCM1Z4SFI3MlJkVWdJQ3I4STdvU0ZsczMxWXdX?=
 =?utf-8?B?eVp3bmtrSHBXRk9FbG1EbnpPeC8rNXM1RzF3dmNwYlk3c1pGeWpGSzFVOHlU?=
 =?utf-8?B?RTlvc0E2RzJJVXZVQTVMcktVUzdKUnh6Njk2QUlTZnBKOEhSMlBBZmwra01w?=
 =?utf-8?B?czNrdHdaZDM1SENmT2RKS2Y0SEhKcTByM1MxK3JPamV2RldESWZBTEhFWHRj?=
 =?utf-8?B?SW50NHlSeVhZcTZyQ3JOemxhOStFOUIyT3hLa1dsVGdwVGxudUNXdThaSDhO?=
 =?utf-8?B?SFFYeVF1cEQ3YWdNZlZYTVh3SUk5VVJac1FnckREdTJYVUxnOCtNQjhPRVcy?=
 =?utf-8?B?ckJiQXVUUHlJd1Fibkd2b3Q4TlhObVBTdzlyenJ6T3k2WUdTSTUrOXlEVzQv?=
 =?utf-8?B?MmlxZ043Nm84Y2I4NFhnSkh0SWNudzRsQ2ZqVDdvU3RSNjZicm41TXc0Skp1?=
 =?utf-8?B?R3FubHJGM2QrK3RHQUo1Z2dNRkRKakFrOFMzY25Ea2J1bm9mRDJIWlNQejY5?=
 =?utf-8?B?UzJVZElTclMrZk11VjU5RTgwMjFNY3RRR0hCRFdrakpaWnBrQVExZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e2d418-20ee-44ec-7d9d-08da21a1029d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 01:07:44.6028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6ftR+U61Br4/ygrcJ3uvkVZoeGHy5BDRhtV4RJKZn1uROFdy8nAwikEFMjvRH/JKkT15b1o292NPZZABoxc5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3291
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

