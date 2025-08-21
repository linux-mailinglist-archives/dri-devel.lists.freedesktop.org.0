Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81392B2EFB4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA39610E88B;
	Thu, 21 Aug 2025 07:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OheSYrQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8786310E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=own7rPNiIdGmqfc1fTCqN8+NApUFO/yvhFw0ln8+Me8ZkgxoIBtMtlWKHeYu+tVvL/dNQDZSeVItwrZO/hAHT1UFsQa3I0s/B+/7jsoKTxdFy2ixDQ2fTUVJCTFCwDL8qvrKdqFKv1GKtuzyIa+dMHdjxLqgsyGnDdraoVOigDuMj3ab4lzYz0NzBgHzXK3aT3zpIqPa1wZT87cZm2sRCULSa64lB2ppp4RpTYF+zz+E8pQNQS2MEacoA+mL3ZNcsnB6k/aS9y2CEr0wV0sh71krKULTWcDwmJrcUrPlJ76X7nv8aKBzzmBsMdGhfyjyiperTlhx0whC9jGUsrIPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJJk8waZAGUmtpJCix864mNIrqWzOzu0644eEgIapGU=;
 b=GVQ3Ru6xmSBX9k68RMUougT2e/+i6LNLr8x7RXFspf9uPg12T1DKGQn2S6YIrQ/NRKFzVFPy+YbAvineYO182lNg+TeJvT1FSNyvFCvgGpqhMoA5iPg/0nus/RBEbXpMVd94nNDxLRhwnEf/rxHnftU0YyZ+lXyclG7fLSwNFhQARBUCYFjj0uUvHrqB34nLU5eMWaPH37om0hznDhpbcyrou5e6h5R5M1OJqHTdoAvvQoCc0o1sn/q0yOOmV2gsOIjnKLAcUypn2c3F7ppF48YGlCsUZcIDhSI0SdcNbYTMpyAcOPspyZusIq6I0nuijfCD80k3/YUtK5eehsccAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJJk8waZAGUmtpJCix864mNIrqWzOzu0644eEgIapGU=;
 b=OheSYrQ5gdxQPK1smiD4hGTh0oF1J0GNbC5z+26oM3qA3Vd4ilMPUIp1jVwJlvZhAbut+loVKO9uq0oRKbteRRobg2sjnls6QGk81qqWECEPo2xqHwb51XKdsFzjFaaI/7do+eHv2dFTCbZMbVv4SEhR/ILHIkkG6BCdlOTiCj2oUcLgq6tm6tPuqz0UWQ3HdQIWD8lfvMbAAczqGz0A46qdYuPe/RPxmzyajsXGzxk7Uc0uJAUqyq0b8IfIhYcDIz1YHsX7Q5cQnsxF6T4boB7K58Q8cZAlBtBoqv6ItUounEejUy1G9YdbJlTrneMO39ndijH/kX01v9xqxhB3fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB9377.eurprd04.prod.outlook.com (2603:10a6:10:36b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 07:32:51 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:32:51 +0000
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
Subject: [PATCH v5 2/7] ALSA: Add definitions for the bits in IEC958 subframe
Date: Thu, 21 Aug 2025 15:31:26 +0800
Message-Id: <20250821073131.2550798-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: adceb287-a68e-4c21-b42f-08dde084ef42
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9NPSvSLZvjnzvQbw8b/QxFtsKgU2zICi30mmRkKy5LMP1w6UES9zRZtIg7vP?=
 =?us-ascii?Q?Vac4k1nqkKaAcXA88jQtHR82qZq3QAORmCWUoJyi7Q9GNMk5c5aDYfZbj57t?=
 =?us-ascii?Q?cJgzeI89JdQAvztZ3TWzVUOb2jiAaDdOiR/7v7nEVjv0YsVZoQL2d0275Qje?=
 =?us-ascii?Q?MENdP9tqYUaQTX9mkDH/Kwyf83rI0+OPSWcX1Eu1jJ/hqOki8s/b14VN/OJW?=
 =?us-ascii?Q?wNkK4WoLuW9k89iWHihDBo//qixsBSn8maqDtW3yMHn0N686SLECUbq4o2Mm?=
 =?us-ascii?Q?hZ+C84wUCE2lrjP+kzSPkVu7chY2seOvNlmNaEcv5pm/f/yYEYRXtVCE3sNA?=
 =?us-ascii?Q?tJlM/r93Y37hxFDpxpv83ZZNE6Iot8obMnDMOeeMzZmAeFzUiV5a7u/+LglJ?=
 =?us-ascii?Q?0kyfspm3AC0JHRaL+qySVRipZezDTt/FH39JnaDYKhddsK7IqdoPKZA2Y/De?=
 =?us-ascii?Q?ajDOKIgJF1ll+g9cYRdKFOIZ/nSFiV1gUUe9xEzWCu/8OFHJjjT0bfycmT28?=
 =?us-ascii?Q?O4lQF9tQxU3Hul6ZH9amtlZEmzzxWLyGjZa9ilP2eGWMSba2lhvznWi14NEA?=
 =?us-ascii?Q?ZeKgAVwpbyJmLO4gcR0gO3g4H53a2JhrzAa8I2OlEJ2RMFR0iauuND0pNc3M?=
 =?us-ascii?Q?2jRbooIk8iB/03bvoEcDONj1UJ5s63Q6CrVDYQFojD2Pjo0FmD17iZEQMreh?=
 =?us-ascii?Q?AMNGA7R7BG9Zd8dAx51lXa1L76e5RcKfy9EQ022A85bpJ4oWI2a6loGOuU/V?=
 =?us-ascii?Q?GMOMqsIG80d/pmtYKotLeHESS8XAxGgoQ6lK36tIbYwi4LdtV/abZxFhzsC/?=
 =?us-ascii?Q?uw3FLjL2fmv8LoX0VQ/7mMxlgK58TUBrNGY7u1K89e2J6PLSjMHVHVDSuuvI?=
 =?us-ascii?Q?DMQ7vw7Hubci/gm/0x+UFjh4lGycUrI9n6ig2v5q3wTtJjP31gNvRvZxveaY?=
 =?us-ascii?Q?N5SriRUcrEqeCsl1OIY0mRTurT7wOfUivJxl0ujc4NgCbYf4lgi8VpkthJXA?=
 =?us-ascii?Q?TwFCWgDvUh3/o24f7cMQl/2RFSwG4u4xnIzXjMTdRUWf7uR7RV6p37jxu36x?=
 =?us-ascii?Q?vc96+rdZfWc/owWTt2Rkzm5BykMBXkQtrGnL7hbCR0EjnZi92u4uDVbeAt6d?=
 =?us-ascii?Q?inWM+Sj3jsFRqzEv4aWpm0DyCb80KRMaNtPPRpK9lzVJ2gfUcifgdZK+SJos?=
 =?us-ascii?Q?lqYH3OA42BP5JO2fR1MAOYND5j9KbYekIE9ajWODI6ovR4KSCevyhi9lNSrw?=
 =?us-ascii?Q?7ghdho6VivxWsnRyMnXbVyTx7q4D/Fg9tsWh4O93cZGeCJAoauCgGka6nHtI?=
 =?us-ascii?Q?e44ISNXs+9DYhxccWXHJhAO8W5Lcj72l2dvUJ/2XR7THGGnnYGcQjcOpwPie?=
 =?us-ascii?Q?pb6HTwhrr3P0+eooV10/nsZ+5hdKzODmznNaX0HhlSOqa26yagoI2iuPFZww?=
 =?us-ascii?Q?TlLkIrztAPn+93vFdkOvU/AAxzxZ7LesrvEaFKEBs/xw7+FmTYtGD3UshD/D?=
 =?us-ascii?Q?MJfhoO+dgRHFPmw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(52116014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?awZrtEhKMG2n4yOd4YNaJ6UyGnD573MBCJXrEYdcT89v4sKWMi6neCdVHp75?=
 =?us-ascii?Q?hvAU9lJch0kkYTqdYJNrVtnylOQW/9Vyn9/ToCvuNK1yq1Xx4F6beGQPj7xs?=
 =?us-ascii?Q?1n/3wAPY6/3BG4OHd7vFav+BZiOahnWgOLH2/cz0WcWwz28hkmTg0LUots7g?=
 =?us-ascii?Q?zrbcRkJGoP6QcTT66ekSw4zkbqCi738ARsR3ptyMVBeiYmO14XFW8V/c3LGO?=
 =?us-ascii?Q?HdV10nTPSmnWi8qRGYIXMB4lU1KLGTFy8Z2F0nFnqH/EvSqtmoCXmX9J1TDh?=
 =?us-ascii?Q?1S+NuPkAwrTtNruBKIor4PSldnhBmVceK9LIMKSqE1wkVCW3lefzxrRcWtlt?=
 =?us-ascii?Q?xB0GwLoCf0py6get7rCR10czuI6l4YBvtA25RUmhC6c5ImwXk8JtKlQiscnf?=
 =?us-ascii?Q?y6YO8IrLTeSkbaOrW9B4pUCvbRWhOutPi08u8IxhSMo6fHKdPKdBZUgQzo+P?=
 =?us-ascii?Q?FNXy3NsfuFx/3CdrESw3xDqIMc/SYL9r2Z3m+TUm+TtMpFkLA4UqKLQgehHP?=
 =?us-ascii?Q?wCSrvD9LgT0Ugd4W1UhV5h0t8bFUs15zU5vZa/Dxz7LA2MOHRfehVn8i9jiX?=
 =?us-ascii?Q?LJlc3fIcmDfByD303r0PREsom7CNQTvixlvYOOdGn7Q9hofafhcXihUlKNk+?=
 =?us-ascii?Q?CbrUvStngsegGC/H8mjvgNoE2nk7mvNBs6UzGKzEft3QkKLvK9p1Z9Jx5xrv?=
 =?us-ascii?Q?eiY3Rjod685tZx0tUeuvQbcGn9+n43fWtNwDXnMe0NGeTOd+BIH83umlIUfT?=
 =?us-ascii?Q?7wmKmI80+Sg8OhzsF+h1MkEAmBAHCsi8EJrqJGn/LTZc6/CE45ehzMBurDYz?=
 =?us-ascii?Q?OCVEX/naqMtd2mw3klcQxGuUohmctlQmvVHvJaR6tANYyu+k8XYqgfzGjq5R?=
 =?us-ascii?Q?kcMNKuwSQ9d7ROcflbzkk0+Q1yKOqquAVeE9s4ExjXt4MlfCqWrJIQ6tF+mQ?=
 =?us-ascii?Q?y0YqeAn+yu7B8QMctvQnLaZ09istSjK+HpMlhZmOp8HR2M54P7C1DAeituGu?=
 =?us-ascii?Q?V22HjgnxHVL6lgUmAt0DZta+LTZZP8yb0X2U7FM49m5yxX5R+PSguFsS+ca3?=
 =?us-ascii?Q?Me3cbaom8xsT1AXlCFeLMeAMR0CU4s6iKkrQg5AGCyyXqzSGqUkN1zbjNMk8?=
 =?us-ascii?Q?QB8xo6w1McRLKC1TuWrF3ntt1IY62RXKo90zitoaq+l8j/K14xh7/3sSSevI?=
 =?us-ascii?Q?2BUkYU7BtUTdA+5gLZBlWM5J1qjPNlkqNcqnJNExroO1ztQJwVPuBcrrqLfA?=
 =?us-ascii?Q?JaJuHWalvS0NbOtgYvcSmKP+bZ+bGcWmZBFUqYlcNgnkaWxPaL7c+DgorUxu?=
 =?us-ascii?Q?eYkNw8ye3AFQ5nefeZfTYrXeptYrEH+Im0gzJGX1OcidHMxFESIpxA7GjMa7?=
 =?us-ascii?Q?htKSoTywI1OSvk8PXrIkqRXMjzxKqB7WFMfLZREEGgONECKwqbHcth62BGRn?=
 =?us-ascii?Q?mWKweBimVNGxvc2ryAH/JMr06+bGXqrpk998X6yMQX11CDqy3Wcwl/Q869s/?=
 =?us-ascii?Q?zmkGjalZdjpnByPDUwdvcuxUK/w5m+MgRY1m37POvgIL/RQS3vlOlChwhXsD?=
 =?us-ascii?Q?YQfJLG3xLthWgT4xzeabcWappvwrVFCbm8qUdZaB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adceb287-a68e-4c21-b42f-08dde084ef42
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:32:51.3202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHsHcpD5H8ZUKBHWDTp5vkILog1Y8U8SBO4DlmyFLw8d8kljrOg5fvpi48Po9BfC/55BvHETm7mzfE8LuVdKMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9377
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

The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
in HDMI and DisplayPort to describe the audio stream, but hardware device
may need to reorder the IEC958 bits for internal transmission, so need
these standard bits definitions for IEC958 subframe format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/asoundef.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
index 09b2c3dffb30..c4a929d4fd51 100644
--- a/include/sound/asoundef.h
+++ b/include/sound/asoundef.h
@@ -12,6 +12,15 @@
  *        Digital audio interface					    *
  *                                                                          *
  ****************************************************************************/
+/* IEC958 subframe format */
+#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
+#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
+#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
+#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
+#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
+#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
+#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
+#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
 
 /* AES/IEC958 channel status bits */
 #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
-- 
2.34.1

