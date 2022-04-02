Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3F74EFE5E
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 06:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED19E10E13C;
	Sat,  2 Apr 2022 04:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44F910E12A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 04:02:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/DUT6UUTTkU+tQ52iFehpiptNKbzDZjqogouG2l56kpv2RmxuFFrSPhQ8IP7BQiHvnaD33aPcF1iMU9ngeYaEMT29+Td6sxphqK6WE4qJ5X8wuK0/J2Y8e20noI3kGHyk3PAELtf6OOTKsEJ6i5B+sfh9NivNleZHLiMig4imYM8Wc6k30RTxC0q3KOoAIhlJarCV2A9ux+zlIJyI7EtFSrVbUh63HHZiyk7SGa/a1Twu9gyyNOWzfeFBAhcp9CD0ZFglOrHQle379M974HNqRb4YwI56B5VKOoPja+TMbEgyQVJpji2SpdSNdZsAqeoGinAFgZeGX6grOvehxzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z23oGthQQVatgNiHhq/oRsg65W52HNMSx8ap0xPZR4U=;
 b=OL1+QIOsE8F9k2uNMWlJIr4ZG9GNIwVii9LMX9RTiIblnjdOZTjIskQtxDnvGlo4lI0MnweHJ3plgDU2b0S0fKvjwYyqE8tTZNSHZ62ahBXAdw5oxTFFn1ehLDT8PeuUPWaQuJkoaITlOiHTZKpWB+UFa0S6WwPKoCgJPUXipsq7qC8fyIHh2rEUlrZJN1fYAhmwNuY2QU0UmNkJKphQJ70VLUMPMx7ryvigySwGvifo9cMzih+nFlNDFBG6SoD/3lcECQ0y9cffRaEJcbd+1TNRf8y1OJGE0swX5JSsZlARwxxgKO/4H7OeVLuwQpUSOJYptX3M8ZlUuWVjdYpeUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z23oGthQQVatgNiHhq/oRsg65W52HNMSx8ap0xPZR4U=;
 b=kzJM90MLXmJjZKLWaxy9VBVszbaIN3dwYL3h7j9/EFlq5NO34YihnHHL/yzIrq9gm3YS3S9oeG1WJuleQy7QYaZudm3YofOnikoes64Af8OXbDiFuP+wtVOm+rXTt4bIeT8hK6kMiVkd0QG0Uz27BJifAF/K79veZt+AtnntfHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3210.eurprd04.prod.outlook.com (2603:10a6:7:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 04:02:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 04:02:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/5] phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp
 LVDS PHY mode support
Date: Sat,  2 Apr 2022 12:03:25 +0800
Message-Id: <20220402040325.2465222-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402040325.2465222-1-victor.liu@nxp.com>
References: <20220402040325.2465222-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c092a1-6c70-4934-5f33-08da145d9a38
X-MS-TrafficTypeDiagnostic: HE1PR04MB3210:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB321005406DC84B798A4F109D98E39@HE1PR04MB3210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: POPCa5D+2AcPW+7wLiGchEmht5aQzLIObjG4hLYgLd6fqHfVUFdspen/9Nm5oS1eEYCmycAKXz6DuixC1Ml0Cbffn5I8b7pjqpKVEQS3ogOsNo4+ji8FZL2mdxeDs1X7t4AQ7To/YL1fGPRGxuMlmqMtlvLuZpbZgDGEzbds+TDXTSo9DlUOZnokT59xpyv7/q9zxQjS1LmZN0QF1C0MWsd1LA+T8xNW94DuMjFN4oRUvebcVAh+c7VM4ItAPuVOd40vybt4EKIBvHmNBqySoCHKRVWbHzeK9JpZwFdhOrK/rxn6WVRordBWfPpcp5VfjHCc6GGaFbVMuCFdnCtbuBmtcCREsOj7I8o076OvPR7dDCm6yJn22eObs1xpnFa2ChMu+/Tv3fa/2ASSM2qooNh2Rq6i+TqcpXPBo0qg4Rr13wFo2wy6SXtXQCtiBAu+vGSjSVUK07e83ZJxPl/GUWGekH+2X7EweK3WvH6+OZwAeO/JhrtHmByFjo2EZdmNWMVSQFSepRENDFBDFizllJHIWk6YzvZxL3udDeccSVxBYRP41hN2xZPyelSxH6Q5tKOSbUa0pAjFt/p1saZUvYGpJ0GV8p5qUiT+QhulZZjFCIO/lbdsnC27BXKcbuZjngvCnge94pfNu+hTus4ZQQ0NjBed7T9DkpRBsGuTIxl1ypaJ1PLnqtd8oAEAw6jOeT3AhjGSH+YtnlrTupWR8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(86362001)(6512007)(186003)(26005)(2616005)(1076003)(83380400001)(4326008)(8676002)(66946007)(38350700002)(66556008)(66476007)(30864003)(38100700002)(2906002)(36756003)(7416002)(5660300002)(8936002)(508600001)(52116002)(6486002)(6666004)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZidzJncHk3dWZoU2Z5L3RTQmFDUlcxVFpEL3IyV095MW12eDJLTFBYd3V3?=
 =?utf-8?B?cXZSTFBUSTVwaFdaSmdyZm9JeExDdFpOMmpEQ2Rnd25RR281czdUdXdhZjR1?=
 =?utf-8?B?SFkrenhObXJqdlhibDlpK2U1c0JIdDhDTWU3TFVnMXJvdFI4QzltdjJ3aC9L?=
 =?utf-8?B?MUIzaSsrT2w1QXdzdFlzbHhuQXo3VTNsWjlGcnY5OUhWb3haWFZ3VkxEU1h5?=
 =?utf-8?B?d0pHcFFCWG9URzhOTGI0dEtKT205QkVCeXA0aGU2M011Sms4d0RoL0duUFU4?=
 =?utf-8?B?aWd4bnUrNXhOUzRpSWdtaXY2MEhJOEV3eCthdXI2VzI3TXBYcU8wekZQLy9k?=
 =?utf-8?B?aTVzbGZlekprM3IweHF1VE8yeGxpTzhncnZTcWhpY0NqZS85NHNoZlVMWlBZ?=
 =?utf-8?B?Y0VmVDhzbFN3aW93em9XZ0RqdzlSREI5TmQ1R0pCY3Z0WEF4WTZlaHB5WGIz?=
 =?utf-8?B?N2RNdG1pU05hb0V2bnprd3dLQTRSOFlDVUtpRjFOem1UWFA2TmNacm1wT0Rp?=
 =?utf-8?B?TUQ0S3JwTkhpZlcyOEF1aU9LNndHTjNCb2lxdDhMTTFyVld3TUhGSjEvQXlj?=
 =?utf-8?B?akU5eDFldTNoNnR4cTVKaEFHbWNkbXp4MUFNZDVGQWhwZTRZZDNob3RSRDZB?=
 =?utf-8?B?ZU1FcTdVRWQ2cmFRK2gyUmY0TDQvNDRQV2FoR0xUckRkeS8wclAwSXgwNlFF?=
 =?utf-8?B?YkIxejJBTWNhYW85OEwrNHZUVnpSZzNmbExURGw0TTRsZTM5VFdlODdnUmV6?=
 =?utf-8?B?SmNFUVNlaENhdmF0OHpyVE1PTUdKbHR5TDNMeExBcytHSXJ3OUR3d0M4Q1ly?=
 =?utf-8?B?TGJmUG5rZ0l4S2ViMTNiQ28zTnRtc0p0b01OUnQ3T3hFMEErZzU1ZHdYUDBG?=
 =?utf-8?B?d0VsQnpMZVFtUFZSdVgxYWtmY29Vck5ndndCQXZHbXpPUldqNFpuck1UT3g1?=
 =?utf-8?B?T0ZQVmNjK25LMTlxSm95RU5QUjZUWjBSdTRrYjhjTGRqZGI3aldKVmM4eUJ0?=
 =?utf-8?B?eW5ZemEvSWdqWElHVFU4OS9LRXRWTkpPS1hDaTZ1aWFlU2dPb3JCSG9PbS8y?=
 =?utf-8?B?Y3VMSWE4M0gwQWpsd0J5a3F6OXdibmVvZlV5b3NWYWdqS01RTFZFRmplNWJh?=
 =?utf-8?B?MVlrcE1CR1c2Uzdoemg1NUFEcEU5Z3ZVQk9IYkhPRU1WMTNCL1NBN01WRk5u?=
 =?utf-8?B?OGM2Z1I0dTYvQ2NXQlVBVVl4RDhTdC9BakRQbkZmYlNheGYwc2FnZ2ZhdWln?=
 =?utf-8?B?Q3RJc0hRVUY1MVpPcDh4STMxNUo2UlZRbXBwK3R3KzVyTEM1Mk8wTWpzTjJX?=
 =?utf-8?B?V1dmL3E4R2w5K0JFUHNkWkFLUTY0aTJVRlRzUnFpdFVSWlBHL1lpRXE1dkZD?=
 =?utf-8?B?am5TZ2E0ZkFNMkJ5VUsxTWI2OU1LOTBOT0hMRVBLV3VIWWF5QStNdmlrOWVZ?=
 =?utf-8?B?bnpRbkc3QVFCbUUxa3d3Qzlkczl3a1p3L1hPVVhtN1dhT21ERUU3Mm9MTEVZ?=
 =?utf-8?B?OTQ1dnMwNThQZVAzbTBCNERnT0ZjaUd3QU1CeWErNVAzTnJTZE5VQm1iNnhs?=
 =?utf-8?B?QXpPUGFXd1RBN2tmeVRUQlVtNEtNRm5rSTdJd0NZNnNnK2lvUnRtWk5neGov?=
 =?utf-8?B?Mk5tOGNYZFlTSEhmdkphbkc1NXE5L0E0V1FScGtkdjJnU0FuKzNVcUtvWG12?=
 =?utf-8?B?Y1NtOTZKdnNlUXFGVEcra2doQWE5TkNmN1EzS3huczRjUEN4VFhOQ0o0Qk81?=
 =?utf-8?B?SFMwUm5ZdE1CUUN3YkdQRjdzRU1IRFBFUDk3aEJVeStOdlEzQjNYdWtVai9t?=
 =?utf-8?B?RTAwWHhFaXR4NU8vaUlsMTY3Skx4ditCWnBVa3lGNjAxTWx1ZHFTcEdFZkVa?=
 =?utf-8?B?WTVvRkVmUzdGbU5SUkdFMVB3RlhKRG5Cb0NrWW1kRnlXVXlWR3dYMXJjcnJt?=
 =?utf-8?B?SHk2MTkrYjl4VTBMQ3F6dEp6aDFQcUxzZUxIV21EeGFTZGtsNkFrZElOVjlC?=
 =?utf-8?B?UWZzdHFlT3dGZ2hrNmgzUjVhL28wY0RaNjVERDdvemQ1MlVIekZNWEhKbFU0?=
 =?utf-8?B?V0dKSWlIcVgvay9sSXlJZm5HS0dSb1NMYnM1UlNRLzVSZFlvVXZzVnM1dU1u?=
 =?utf-8?B?VzFBM2ZEOHVmekJhd0dqbzhlR1oxSmNuRW53M2Z2b1Q3QkZJV0lMSnl2bklI?=
 =?utf-8?B?WTl2N1RzdjdnMHVSUU5oVTlyRWNOd2VwaklyYVhxU0JoYVVtQmRCQ3lsMk11?=
 =?utf-8?B?N21adVRKTitIMkNZVXg5bCsxMjd0VWlWVE1GME52RERzaDV0VEhiNFI1OFNQ?=
 =?utf-8?B?Vkdrb203S2ovRlJXY1JMVERLeTAvWlVseWRHV2hqT2JGb3FaWDFUdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c092a1-6c70-4934-5f33-08da145d9a38
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 04:02:28.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYo9V5vwiVl61T/5nJfwAXM7JSM24I6940W6loTXhryhmmL+7Vr3cT1198dLbFEWjepDcLHV/3RtRP7LTonzmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3210
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
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

 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 269 +++++++++++++++++-
 1 file changed, 258 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
index a95572b397ca..af1ecda091c7 100644
--- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
@@ -4,17 +4,31 @@
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
+#define  CA_MASK			GENMASK(4, 2)
+#define  CA(n)				FIELD_PREP(CA_MASK, (n))
+#define  RFB				BIT(1)
+#define  LVDS_EN			BIT(0)
 
 /* DPHY registers */
 #define DPHY_PD_DPHY			0x00
@@ -55,8 +69,15 @@
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
@@ -65,6 +86,7 @@ struct mixel_dphy_devdata {
 	u8 reg_rxlprp;
 	u8 reg_rxcdrp;
 	u8 reg_rxhs_settle;
+	bool is_combo;	/* MIPI DPHY and LVDS PHY combo */
 };
 
 static const struct mixel_dphy_devdata mixel_dphy_devdata[] = {
@@ -74,6 +96,10 @@ static const struct mixel_dphy_devdata mixel_dphy_devdata[] = {
 		.reg_rxlprp = 0x40,
 		.reg_rxcdrp = 0x44,
 		.reg_rxhs_settle = 0x48,
+		.is_combo = false,
+	},
+	[MIXEL_IMX8QXP] = {
+		.is_combo = true,
 	},
 };
 
@@ -95,8 +121,12 @@ struct mixel_dphy_cfg {
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
@@ -317,7 +347,8 @@ static int mixel_dphy_set_pll_params(struct phy *phy)
 	return 0;
 }
 
-static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
+static int
+mixel_dphy_configure_mipi_dphy(struct phy *phy, union phy_configure_opts *opts)
 {
 	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
 	struct mixel_dphy_cfg cfg = { 0 };
@@ -345,15 +376,121 @@ static int mixel_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
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
+	regmap_write(priv->lvds_regmap, PHY_CTRL, CCM(0x5) | CA(0x4) | RFB);
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
+	if (phy->attrs.mode == PHY_MODE_MIPI_DPHY)
+		return mixel_dphy_configure_mipi_dphy(phy, opts);
+	else if (phy->attrs.mode == PHY_MODE_LVDS)
+		return mixel_dphy_configure_lvds_phy(phy, opts);
+
+	dev_err(&phy->dev,
+		"Failed to configure PHY with invalid PHY mode: %d\n",
+							phy->attrs.mode);
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
+					lvds_cfg->bits_per_lane_and_dclk_cycle);
+		return -EINVAL;
+	}
+
+	if (lvds_cfg->lanes != 4) {
+		dev_err(&phy->dev, "Invalid LVDS data lanes: %u\n",
+						lvds_cfg->lanes);
+		return -EINVAL;
+	}
+
+	if (lvds_cfg->differential_clk_rate < MIN_LVDS_REFCLK_FREQ ||
+	    lvds_cfg->differential_clk_rate > MAX_LVDS_REFCLK_FREQ) {
+		dev_err(&phy->dev,
+			"Invalid LVDS differential clock rate: %lu\n",
+					lvds_cfg->differential_clk_rate);
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
+							&mipi_dphy_cfg);
+	} else if (mode == PHY_MODE_LVDS) {
+		return mixel_dphy_validate_lvds_phy(phy, opts);
+	}
 
-	return mixel_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
+	dev_err(&phy->dev,
+		"Failed to validate PHY with invalid PHY mode: %d\n", mode);
+	return -EINVAL;
 }
 
 static int mixel_dphy_init(struct phy *phy)
@@ -373,26 +510,74 @@ static int mixel_dphy_exit(struct phy *phy)
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
@@ -406,16 +591,51 @@ static int mixel_dphy_power_off(struct phy *phy)
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
@@ -424,6 +644,8 @@ static const struct phy_ops mixel_dphy_phy_ops = {
 static const struct of_device_id mixel_dphy_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-dphy",
 	  .data = &mixel_dphy_devdata[MIXEL_IMX8MQ] },
+	{ .compatible = "fsl,imx8qxp-mipi-dphy",
+	  .data = &mixel_dphy_devdata[MIXEL_IMX8QXP] },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mixel_dphy_of_match);
@@ -436,6 +658,7 @@ static int mixel_dphy_probe(struct platform_device *pdev)
 	struct mixel_dphy_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
+	int ret;
 
 	if (!np)
 		return -ENODEV;
@@ -467,6 +690,30 @@ static int mixel_dphy_probe(struct platform_device *pdev)
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
+								 priv->id);
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

