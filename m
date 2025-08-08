Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7560B1E41E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E110E8DB;
	Fri,  8 Aug 2025 08:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CGgMa1rC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013034.outbound.protection.outlook.com
 [52.101.83.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AC610E8DB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6RIuHRSM60pkAmQ4eSbT5VRW3PE9da2KXeSyaCnsq/5X9l6luRCpqF0DxcEvOG0nqUT1ueN5Jb39nAL5cH8ib4dndymlAczkQnkjyQw4LQjmTbsWc5kSOe5mTpFprCx3ItbTZXoTQ745GlYzzWZunzL+EYkbnvE2A+TnK5dmI1JuWuf1Ji+oK0AMwVRXjqj11fj3i5ENkEBZpxz2eMwQnJSuDsfbKCocX/Vhn6f/zV4VvjbutCfkFcv02q8c9p7wn92cb6O2VCGCM7QlVciwrRpDCLwW/ORF4cE78M5nYBlusWm8kaxC4jVb4fnFS4qcnaB8SAXmBlMSW0Ai+B+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFEvVX00iv0CDdBaMOFaKmPZmTQc9e2o/DJw1fvJopw=;
 b=oLX0TBaJ6OB3hZNPps6syhCVPwwijrgPjY23quqz701zi7wHeM+WSA1/UlE1gNQy+7OpzZV9Yku+Gj2PwitA1JEcsad6XCSjuGN4Q3REkd15hILVCDh5VZzx1nle8pncpnL8LSUuEMw6P0jw766em//kQsV/88Ch9WwP7i3KkTmbqUTvM9UrDkyGsZHkVlTbIBMlHZPlf/YCXIzbQQgVgkS5nSC5hn0SS3gFmQ8ET42CJxaG1rC7iTln6e4NOjjNhftpHguqbBgNWmyVKqlvvbAsNkkctxU49S5RSaTE6x3OBA4/BrcPJ86VUhamuTXf3m6uAxurTxNpP9OuQXB5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFEvVX00iv0CDdBaMOFaKmPZmTQc9e2o/DJw1fvJopw=;
 b=CGgMa1rCSbqikS0fZWNbI0pXwj0E5kTWqOfATAEBSxCT5L7uI1vVcG6O2OtvPRznIUE1SkWX66iR2otrqRACaqJOgENvePv0WWnA8ZQm10PLayjny38JvYCKpgZg8GUWuiIl6bVevbXVxYbpSmH1rS3YuYDo3fGlz1LuXEoe+JMzUu6muUz9NGnqelA7tDgB1KOJkqG3nMAthh5wcVIV6rXi67PDhqDq4yYsZVkuceNJMf8hVSRMttD5G4n4XhYpYpfX1XgP5JjbFbGRXwolNZkXB/ySXONZGckW7Da59rOxuWnU8E+LZ3H7z6mb3Nc2r7lYSA/BfaViC0XE75VUug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 08:07:36 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:07:36 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v4 5/7] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Fri,  8 Aug 2025 16:06:15 +0800
Message-Id: <20250808080617.2924184-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dae994-fb22-4fcb-4d1e-08ddd652a27d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ziWFzY/8u8YqcgOTNyA6qpDlIUiNC45PORzuvbQ2Ul41fzinfqzc4CPCZXHW?=
 =?us-ascii?Q?0g9XkqysvyZRN/7k0iYmcbHxidoiO6EQOGF6U5P5h7idqFkQ9XqqPRRVNIRo?=
 =?us-ascii?Q?cKxDNAY4lPMDEBP7Ejhpv0ooq2B4WRGDl8tm3tUVtiuNjZqxvr7ZKXOL2FMq?=
 =?us-ascii?Q?jhzCqJt8WlbiHP6GceAdggKe8euF+9QQayrjtw0uq3vfbx6UtT6t+FA2YDfU?=
 =?us-ascii?Q?VMZt5IVNf7R4chlLymY87o+DgW2gKTwFqySaXnQLPFjemuW2xUj2owOopHkY?=
 =?us-ascii?Q?fDTRzSlkWlb19a6Y0ZImBQSwxm2YRsaccvEwQTgB19PH0JVZiUOxUqilB976?=
 =?us-ascii?Q?nA0KtJ5mBqxuyFswYr5LMQtFOrcZmUjH0KECFapBHVRYmtNuB19JG61OFNIe?=
 =?us-ascii?Q?fD/4W1eJxBZx8r1EobOY+rHaWmR4/wGgMZhqGD3UdSirSz8su9w3I/0+RPhi?=
 =?us-ascii?Q?Tr0DeSYnkgjjQj+ySGqO+tW121hTJTTevHyGr89SXP6XxSEEUNEjNZ6kbMx5?=
 =?us-ascii?Q?D+QhVpeCo5cVy7IWP8kNy9XT47xcoWFTAobK/D2RLeCmiKqVsceZmovVJYAK?=
 =?us-ascii?Q?8FUpVhtNdS6r+7MfzjCuH7HxH3QlLjFB0dh0JCbktzDQzSIU/2YN3nOD7ESa?=
 =?us-ascii?Q?fFKvZO9YOiGJbKqWBGpMEDYHkqdbL64RoPZhCZnWDVFf8/ndMw93wDREOA+g?=
 =?us-ascii?Q?+RWZZcjzeZyoaUYkH8EDpDtWmnx4C2y1VK4GDWBSucVgY1SsLlMKgNSDLZ+j?=
 =?us-ascii?Q?HXw7UjAM4PgxTd7HLCwu8muTcfmU8ptqM5cqDM+EcIkGL7YCNTXaDbXuahjY?=
 =?us-ascii?Q?qaRb0DVo4ch/Qx9ABPNiD0UeMi93Oa49cpQiNwA7vldBdvattFZL/vKDEOdC?=
 =?us-ascii?Q?nEH0W09wSrU8EWPi4q9JFeaXir4MFxkva8ujLS8v935gz3wupmBVZXtgMuEG?=
 =?us-ascii?Q?aWqBzdccTcs5oiPnh1xTQGTtITpmXS2hZEGE9Nycd5ncGbaSDfgr47boYSj8?=
 =?us-ascii?Q?4oBoQpUhwy921UxRIGzoHJBHzZu0NSFqN6NgQ8ZTAS+Ba8mhVKT1sTdDNUXM?=
 =?us-ascii?Q?E1iQRygAepmuAQkNmynOvb0WghK6TmS44Jfxb6aUNO8vNT0JAPqM33RKqxd9?=
 =?us-ascii?Q?V8c6EZGdjT/axeCUpktcyIh/N05o8FRUs3BlO9mBvJPin1/HhdO3zzp1WHHX?=
 =?us-ascii?Q?y5iCO03RaLTUrWhcJQyRsf3ziynr6VGrPmZCyoRrSRuvp3+4cGrKe7xHN2XQ?=
 =?us-ascii?Q?eeMVGVGKJDcFR31NUU8G5+LgGSzxi6WJZsuwrYfijmuMXMXwhCHBbPYL1Fcx?=
 =?us-ascii?Q?U6R33c7nKSS9/5qPgRo1tvk3O+Y796/uy1uysvi1QOY95YyWCFwWYUTxQvyD?=
 =?us-ascii?Q?FIupG8+eJZWw9dhET7jxuqroDn9Q8xRUzE6BlBQ2q6Jt4e0gWE2nLltAiIGJ?=
 =?us-ascii?Q?MYTMENhQyN2fAYwCMVxaWUM6FeKJBJEvtdP3KJXlMMH7S/2OOZUAJVSFSILD?=
 =?us-ascii?Q?nU86HWCeWy1+RtA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YafR50L60XU5JCsxVrdfa65UQlZ0G3xUuoBH3Z3lr7jpdWRTYIl+BhUZTi5u?=
 =?us-ascii?Q?BdtNN3SDiO5OALbkHke7cUTgDo74b2eFGetWAs8O+PB1WTdxXXqIIm9aTAlo?=
 =?us-ascii?Q?teStUa/eNhMQg16NaLg8xG5lIIrimT/jJTk1nGUYxjTLsBpjysMY5O7qbMCk?=
 =?us-ascii?Q?HV/GuWjXDC5nphVomRtodmG2mHy9yyEf3OQqJ5+ld6GN9zlHLKhwJyBGL+J3?=
 =?us-ascii?Q?U35yBdFtAE9IqxYPgb+gM5Q9uIHUMAkxyKrNkA6xzf3ToBn2rKhlcabFwAO7?=
 =?us-ascii?Q?LjMPdeJNYc2jxRzC6dzL2kHz0ME5q2Pf7Rz75ugNHrsGykVrsOAP6NG4D6Wk?=
 =?us-ascii?Q?QUOIN5Bxpgaw3mpHjjbjExnSUrIHiughL8RUG0qS4JdoqMWyxfKkRaiiQTVR?=
 =?us-ascii?Q?FP4upsC6nfbTaNlw36iOYS93X9wUjXVd0upH7CCD+ZK/sq/kpV69ySUl2B6o?=
 =?us-ascii?Q?AHvs5O0JqQFaqyG0NZNdoO9hvB3dSTML7cVlhkt7vRe4/sNBG/F3ZD/WA7q3?=
 =?us-ascii?Q?kYtfop7NQ7BG9SlqAsKEmmilsY0Qk9qFGjHtSPPdZFcg/wAvFequgqgi/+JD?=
 =?us-ascii?Q?9QD8VAygKQt4QK61yYg5aQ+rN6scEdPwEGbQgHJQXqyksg48fVPpk1M3K4Fj?=
 =?us-ascii?Q?6bpK3n67DpowFN3JiFcybuRUKYDVaJGAiqLYu2p0RMecIzcByHO3mfy6jZf5?=
 =?us-ascii?Q?raUWhSdX0e1KdIaq81sLNxVAMGQNZh3NYH3ZKYNnJNQq/tc5rzxPF6RO6b1J?=
 =?us-ascii?Q?ZJVWOoGixaJSfKO12PjdxFHpYbuAiTQlMS9jW74R10n4XDxiijLa/2zKuSCu?=
 =?us-ascii?Q?7Z0zHZFubjSBEhTeb9TWYF0jhYKsGrsE9sxh/cp1hsaWTOd02oaHGsfn4IEi?=
 =?us-ascii?Q?UMVI28YHKiYsj9UEd8POVImgjJHY4Neva/VbYdmAHsNJiaZXBiUALedLHfSC?=
 =?us-ascii?Q?OAdVS24IlB9+S0E+CaAYcLZMV2tNNqTFfLkJQYxtGvQVNBnwa+VNF9fagPHr?=
 =?us-ascii?Q?PviMv+4qj+tidUYT++1yYqdSCb3bKqBplJDQUjU1JVVxW+mSaFC07LVkSwQl?=
 =?us-ascii?Q?MKJGu/5OIiT7AJbeaNZQ+/ZmLROCXdc/yvRfMStW0B+E5avo+v70QEQAzjVq?=
 =?us-ascii?Q?IVrOj73tSJYuZHtQ6pclUiS/nhBT3HCMHsjwHa2iGGvNz/JkQTrIq2RNw70V?=
 =?us-ascii?Q?HTGQJtZh1Oyjk3amWj4Sqh4Y7xFIZoESNMa8sTTYpXRIkCkSG8H0OFlnV5qg?=
 =?us-ascii?Q?7Uxbgk1RiS5EcHRq4MUlJYAoJCDoNP30VE7YvrvFoAWN/Z1oathn0sKJVA0G?=
 =?us-ascii?Q?wltnNAg2aGtdw5fTmnN0AcUJV2Tq8/FZzsfrr0XWAja4KXrP63ZIjBCTfZDs?=
 =?us-ascii?Q?o8T4Jr7aCgqFFTQAsq/dz+rujY63UrLofbSnbcl9O7gMhziIEP1PDYR9G8BV?=
 =?us-ascii?Q?ZlGi+Qb6tDDiOmRld3OQF2lGxJoPojZb+sLToQEEZ1BCJUfO2al/AFwPc7LS?=
 =?us-ascii?Q?fdrRUQkPm8eyAW2I2qpIOWCxxGgGild8Q4q5udNvk14vpSX7V8BOx1p3k6sa?=
 =?us-ascii?Q?ETRVHMGzyhc/lFl78Uo/5FJGannvEUL4QrkNqqDY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dae994-fb22-4fcb-4d1e-08ddd652a27d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:07:36.1765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oj3tEp1YGAeYGEj96nkSeOe9mT2MD4Y5rO/fTZRkaTg2seh8mreriex3ivyYL6Ls8HmvfbAGXHqryA/aKz4IwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
This IP block is found in the HDMI subsystem of the i.MX8MP SoC.

Data received from the audio subsystem can have an arbitrary component
ordering. The HTX_PAI block has integrated muxing options to select which
sections of the 32-bit input data word will be mapped to each IEC60958
field. The HTX_PAI_FIELD_CTRL register contains mux selects to
individually select P,C,U,V,Data, and Preamble.

Use component helper so that imx8mp-hdmi-tx will be aggregate driver,
imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
bind() ops to get the plat_data from imx8mp-hdmi-tx device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig           |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 158 +++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  63 +++++++-
 include/drm/bridge/dw_hdmi.h                 |   6 +
 5 files changed, 234 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..b9028a5e5a06 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -18,12 +18,23 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on OF
 	depends on COMMON_CLK
 	select DRM_DW_HDMI
+	imply DRM_IMX8MP_HDMI_PAI
 	imply DRM_IMX8MP_HDMI_PVI
 	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
 
+config DRM_IMX8MP_HDMI_PAI
+	tristate "Freescale i.MX8MP HDMI PAI bridge support"
+	depends on OF
+	select DRM_DW_HDMI
+	select REGMAP
+	select REGMAP_MMIO
+	help
+	  Choose this to enable support for the internal HDMI TX Parallel
+	  Audio Interface found on the Freescale i.MX8MP SoC.
+
 config DRM_IMX8MP_HDMI_PVI
 	tristate "Freescale i.MX8MP HDMI PVI bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d48584806..8d01fda25451 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
 obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
+obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
new file mode 100644
index 000000000000..8d13a35b206a
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <drm/bridge/dw_hdmi.h>
+#include <sound/asoundef.h>
+
+#define HTX_PAI_CTRL			0x00
+#define   ENABLE			BIT(0)
+
+#define HTX_PAI_CTRL_EXT		0x04
+#define   WTMK_HIGH_MASK		GENMASK(31, 24)
+#define   WTMK_LOW_MASK			GENMASK(23, 16)
+#define   NUM_CH_MASK			GENMASK(10, 8)
+#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
+#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
+#define   NUM_CH(n)			FIELD_PREP(NUM_CH_MASK, (n) - 1)
+
+#define HTX_PAI_FIELD_CTRL		0x08
+#define   PRE_SEL			GENMASK(28, 24)
+#define   D_SEL				GENMASK(23, 20)
+#define   V_SEL				GENMASK(19, 15)
+#define   U_SEL				GENMASK(14, 10)
+#define   C_SEL				GENMASK(9, 5)
+#define   P_SEL				GENMASK(4, 0)
+
+struct imx8mp_hdmi_pai {
+	struct regmap	*regmap;
+};
+
+static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
+				   int width, int rate, int non_pcm,
+				   int iec958)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
+	int val;
+
+	/* PAI set control extended */
+	val =  WTMK_HIGH(3) | WTMK_LOW(3);
+	val |= NUM_CH(channel);
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
+
+	/* IEC60958 format */
+	if (iec958) {
+		val = FIELD_PREP_CONST(P_SEL,
+				       __bf_shf(IEC958_SUBFRAME_PARITY));
+		val |= FIELD_PREP_CONST(C_SEL,
+					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
+		val |= FIELD_PREP_CONST(U_SEL,
+					__bf_shf(IEC958_SUBFRAME_USER_DATA));
+		val |= FIELD_PREP_CONST(V_SEL,
+					__bf_shf(IEC958_SUBFRAME_VALIDITY));
+		val |= FIELD_PREP_CONST(D_SEL,
+					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
+		val |= FIELD_PREP_CONST(PRE_SEL,
+					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
+	} else {
+		/*
+		 * The allowed PCM widths are 24bit and 32bit, as they are supported
+		 * by aud2htx module.
+		 * for 24bit, D_SEL = 0, select all the bits.
+		 * for 32bit, D_SEL = 8, select 24bit in MSB.
+		 */
+		val = FIELD_PREP(D_SEL, width - 24);
+	}
+
+	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
+
+	/* PAI start running */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
+}
+
+static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
+
+	/* Stop PAI */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+}
+
+static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = HTX_PAI_FIELD_CTRL,
+};
+
+static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dw_hdmi_plat_data *plat_data = data;
+	struct imx8mp_hdmi_pai *hdmi_pai;
+	struct resource *res;
+	void __iomem *base;
+
+	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
+	if (!hdmi_pai)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	hdmi_pai->regmap = devm_regmap_init_mmio_clk(dev, "apb", base,
+						     &imx8mp_hdmi_pai_regmap_config);
+	if (IS_ERR(hdmi_pai->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(hdmi_pai->regmap);
+	}
+
+	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
+	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
+	plat_data->priv_audio = hdmi_pai;
+
+	return 0;
+}
+
+static const struct component_ops imx8mp_hdmi_pai_ops = {
+	.bind   = imx8mp_hdmi_pai_bind,
+};
+
+static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
+}
+
+static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
+}
+
+static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
+	{ .compatible = "fsl,imx8mp-hdmi-pai" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
+
+static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
+	.probe		= imx8mp_hdmi_pai_probe,
+	.remove		= imx8mp_hdmi_pai_remove,
+	.driver		= {
+		.name	= "imx8mp-hdmi-pai",
+		.of_match_table = imx8mp_hdmi_pai_of_table,
+	},
+};
+module_platform_driver(imx8mp_hdmi_pai_platform_driver);
+
+MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec289..c68896392a2d 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -5,11 +5,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 
 struct imx8mp_hdmi {
 	struct dw_hdmi_plat_data plat_data;
@@ -79,10 +81,43 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
+static int imx8mp_dw_hdmi_bind(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = component_bind_all(dev, &hdmi->plat_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
+
+	hdmi->dw_hdmi = dw_hdmi_probe(pdev, &hdmi->plat_data);
+	if (IS_ERR(hdmi->dw_hdmi))
+		return PTR_ERR(hdmi->dw_hdmi);
+
+	return 0;
+}
+
+static void imx8mp_dw_hdmi_unbind(struct device *dev)
+{
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_remove(hdmi->dw_hdmi);
+
+	component_unbind_all(dev, &hdmi->plat_data);
+}
+
+static const struct component_master_ops imx8mp_dw_hdmi_ops = {
+	.bind   = imx8mp_dw_hdmi_bind,
+	.unbind = imx8mp_dw_hdmi_unbind,
+};
+
 static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_hdmi_plat_data *plat_data;
+	struct component_match *match = NULL;
+	struct device_node *remote;
 	struct imx8mp_hdmi *hdmi;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
@@ -102,20 +137,38 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->priv_data = hdmi;
 	plat_data->phy_force_vendor = true;
 
-	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
-	if (IS_ERR(hdmi->dw_hdmi))
-		return PTR_ERR(hdmi->dw_hdmi);
-
 	platform_set_drvdata(pdev, hdmi);
 
+	/* port@2 is for hdmi_pai device */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (!remote) {
+		hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
+		if (IS_ERR(hdmi->dw_hdmi))
+			return PTR_ERR(hdmi->dw_hdmi);
+	} else {
+		drm_of_component_match_add(dev, &match, component_compare_of, remote);
+
+		of_node_put(remote);
+
+		return component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
+	}
+
 	return 0;
 }
 
 static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
+	struct device_node *remote;
 
-	dw_hdmi_remove(hdmi->dw_hdmi);
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (remote) {
+		of_node_put(remote);
+
+		component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
+	} else {
+		dw_hdmi_remove(hdmi->dw_hdmi);
+	}
 }
 
 static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 095cdd9b7424..336f062e1f9d 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 
+	/*
+	 * priv_audio is specially used for additional audio device to get
+	 * driver data through this dw_hdmi_plat_data.
+	 */
+	void *priv_audio;
+
 	/* Platform-specific audio enable/disable (optional) */
 	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
 			     int width, int rate, int non_pcm, int iec958);
-- 
2.34.1

