Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A4B1C836
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AAC10E79A;
	Wed,  6 Aug 2025 15:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xjia1p8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E34210E79A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Doig2x90dfNXBJPUFS4wsmuxtx86ZTZy0cL8baiYxI307jtOdy3jzcCTE9vr2EXOCb5J3MGTNFJbn9ehqqp7zjSrEQv+LhiafE2cvzi8AiAnkqHyCuYdtefdXrRs3ku9s7s65sEBa8G1eFokNx7f/HDNrR2IOOoiURLUI5THXlNlp/9eAAYg+/1+X0IfN9OfCpWuwlVGCZOAiTmQ6NSz+BcLe5LMO7He/lvEdTLgqbi5Y2gEsQK/+M5lZKhQl793aFlCA5iWdm+P3bXbiDvzgRCFvReOXIB7dHSOOXpTlAUXcW4/cCBACxgpprrk/ngV9o1NK/fydxTjPGIRGnoubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wAqzozR9mQY7UCjYuq7xSSmQQkrUEiQKSdwY9ILyag=;
 b=zAodDHFBxi0haNqTGY/ni/PAU47/srUB0anKAdPPhDoAreV+HIgw2P65Kn7PHF3PTflJVP6pibeR9Ex3C8Bv/wvWUKU1xFLuzdRbqmot4O2hesBIFrdohdJnHHRvaQdoNFjIdx2F9jYERC5yQI/qp+gp27ZTX5A1FvHgZgMpJl70ltC0UFHWr1ZhQJ90erGoL0D/MXrdqMGI5Jm1C4OWhNNJPgIjzImvqKPoZjeAvLFDi2iKOHLq+o9dselV8diEuFzRGGeuVw7+vpVp486tW6PSr1mnT3CXab3hr0sFTdJcDxocK037Iby2SUFQdgg+6/t1Q0hhV5bBi5M85nXOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wAqzozR9mQY7UCjYuq7xSSmQQkrUEiQKSdwY9ILyag=;
 b=xjia1p8mLCvFqW/I0JY/QR4zIK7gpe0gfyMnMA/GBUSjtsMFxdJ9F2SLJKJcrBF61F7vLDifyNuzh8Cyfhj7xl4bzcOPWpSULuvGSOh5MYlnfC1aDGq2sVUblOcUKrgl9WaEN4uuQCRuSR9OrE104wZ3V1j5pZN5gQNnDXqLEcWxoLEc6W1D/0rHkOl5wqMmAclHglAvAPXB8IpbwX3upk9Ykv66+waADiRbgNZv1DbR3Q5hGvGHg0SBg3nSNvtgTwIFY4RjIRh9/iQCXH/zcvdLsalGAQ3c9HijIjgJusTEhswqcazfvb8b5JZMxSPJf4z2RRxsyU8Y6I7EeNlpIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA3PR04MB11203.eurprd04.prod.outlook.com (2603:10a6:102:4ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 15:05:43 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:05:43 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Frank Li <frank.li@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Wed,  6 Aug 2025 18:05:10 +0300
Message-Id: <20250806150521.2174797-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::18) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA3PR04MB11203:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ba08ca-5457-4231-8bfa-08ddd4fab6c9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LSQr8AWrjBfFG+crQlnSjU7cmA/dLB3M9m1d3AJF2pyKdi9/RYit+MiJBvTG?=
 =?us-ascii?Q?eq3igO5vjUjvsz4ELZCr9L0QBg0U4icmlRdfJN/zKlhYHTQ/krdmmD5+KM/q?=
 =?us-ascii?Q?Uf4J+pNXb9O87O1Fi6m/9AW3rzdpeql9WBvkXjF7zJ+GMtLVXCWXnMrtgAHB?=
 =?us-ascii?Q?kOKNEUzN9Z/PKWMv+9RCptx+rhxFiQz414/IGJF5W5pB1RZrPOk+LinqkScB?=
 =?us-ascii?Q?DZjovQgmbzv7GOJBjVft4ufxklvYilnUjhdLbPCgG2EuB9nxDwSZLswBzIa/?=
 =?us-ascii?Q?rSM7nNZFfCUcyWBlb9hS8P8PjiAG2jdiIEBh/FFDg5HnYwMO2gkFFXyg9QsW?=
 =?us-ascii?Q?/QPBSMxEi5jF9d/mf9YfoAv8O9jO7/5/XbdAn0L160TZsIyhhnGIzCb8Z5aP?=
 =?us-ascii?Q?hCRQgfxYNT5OXTy7k9jx90e9Ad35djUpkD6brAjQ6voyasxFzfAN5R5bqcWy?=
 =?us-ascii?Q?dk/dTvUEXpR6QErYKyW0qGZCgE8RTQGt6kITnWOT7KP6hhwj9Ny1FJjCjMCG?=
 =?us-ascii?Q?q+v0ehDwwq6XbeALXN10UWbo+L2Odo+s6Yeu7p5jZ/5JLZQW4kQm8krYFflJ?=
 =?us-ascii?Q?7d94GDO60PrXGoMLMy9TeJ4nEGV9tcrzxBrtRzig2gSlYi/JkpYY37mI3FY0?=
 =?us-ascii?Q?TFoHEm4YjnXz4p/+3wDBqCqtExsr/yPXRpjz6HpmYj0TLxR3HJf7IPY5nJFG?=
 =?us-ascii?Q?FC89bkOCgeCt+kuZSRdJ94KvnyFtun4pIjyVWjJa3kH81BxgvKZqlwbPp/SR?=
 =?us-ascii?Q?aURssUv67C0PXjDxIwkNDO9Bbt3ZSFgqdOFjjCnlEiAZ7hnOKBnKm8EQFVU2?=
 =?us-ascii?Q?g548w8//NTJrkMIED9tOId0pXyepUEOH+Q74bm0ydmgBSStTpMZuFGwBgzEs?=
 =?us-ascii?Q?OPDrH4I1fSVVm4+6CnFh5pe237CKIg6CTG/98fhzJTXQ54qRqZCAOj9pFu/s?=
 =?us-ascii?Q?6Sb5U3kraHMlzfZ6LvhjVE0+gJFBd/fyEv+nV8iB336sfmHJqYIWA50t+z0H?=
 =?us-ascii?Q?KKp3Wc3V4IWibJtr5XRiAZLaCiWul/lr1di6EMisyCrInCau18LMVSj5tQnM?=
 =?us-ascii?Q?KYOVWGfE4Dpp4hAfV46bwpHzFYpNOZN6DBl4GqIgtEccaEvXPRgYoPTOt4ZU?=
 =?us-ascii?Q?U3/j+0bHItux8yX1xRDIXlBJSHqYbO8bX9MPrW9XjW3vCuEnPEk481XLG6PZ?=
 =?us-ascii?Q?9tRTngq5TH0Nk38gR4z4mK+cZT22Wan8uW5UxjcNCwBltBhysOSSW0Z2xCFg?=
 =?us-ascii?Q?elp2nwgi3u3WgOk1Dxeqx1pPVi2G1srLTXDt36uiD3S8aEHwG0ZUboIbG8TE?=
 =?us-ascii?Q?D7rbYCZu/0TQ7KfXTDtAhYzPCnagNiqQayvTh5u1uQ/41X6ySWeOjoE+UbF/?=
 =?us-ascii?Q?XltkO8ZZcMLhwvy289VpsCJAsBu3kRW+dUvY4Ab8cXEU95RWJEEtSLNXe+70?=
 =?us-ascii?Q?jI/v94Z+6egUNq2pKGXSKJWYcXO3FCG4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nm0m2bZoH2YzsfWAhaw5IXciWMth/o20UB7p1BAVOkXRQU1B/xmMnTcyHRI0?=
 =?us-ascii?Q?shJ9ZHj7nwALt0wla5tfhV588xT8H/CBkAibs2WjOLWjppnaZ2M/xRmzNp9q?=
 =?us-ascii?Q?wtDf8nWIsPZhx7Nfb+sL09BAfIJbLUNl9zFGAnlHY8KdtJRjeJFWC+2PrrL5?=
 =?us-ascii?Q?z0WOz5Qg9qwKkSLrVb7+4Nx/zbK5Oi/QsriNDeEsQohOslhAzgocqmxap0ta?=
 =?us-ascii?Q?LtHsKgKH69k11vU6f8SfEbtsgP74ePWWIWM4sGQ5M2xF7ejqorL81eOVWhhc?=
 =?us-ascii?Q?6DzUpGEjgBaNOlG9ZoXV3vbgL+bvC+8sgqzPHCFeP7pSnLwXOAVfLZLfu/ns?=
 =?us-ascii?Q?CddmyYdDB7M4ZvJmHW49HGwXua2uVmJvFKSCfEtgOAWlONwHR7Jh1vYZCoKy?=
 =?us-ascii?Q?9H9n2loVPpHwgbRnTGoceeXAKFZhcv0BtlhS0/TvNSJ+HF15bp/tMo2yN4eU?=
 =?us-ascii?Q?6bTtY8y02ZaBbEh8P3OWvOsnJd4fEFbNlJD9iZ4L44SP+GVVxhPXpYNAPChM?=
 =?us-ascii?Q?eE2huXwR3WaXshkvExeykaDRC7SVEXsyLi7ebs4CazWd15xI1WX+Mcmz7Rd4?=
 =?us-ascii?Q?6mKC+K5bSEYtEauVxP0Hej4zdFWcPi7fxKCCiqobr+NLcb2sOli7QqpMElli?=
 =?us-ascii?Q?eSaudG++YXQEb0oL5VT9N24xCis/fy77LrOl4roXrwY1vGxrcngvKaRElhxu?=
 =?us-ascii?Q?LtqZf4xbB8STejSeq62r2UCEdlvQbEjDj7G7rHxVOqSXl0nYDXyrPNMi6IEk?=
 =?us-ascii?Q?CdKYDaUebYiAYBK52DNWqmJN0qXWh55+RrR4pKD+rLcZsXj4h8Tf/ItgFqHF?=
 =?us-ascii?Q?TqbluJLeuLBzuXOE0mNtpd6nhQPLwXT5GtBSpnFvjfdQAJWR5cgL7zz/X2LW?=
 =?us-ascii?Q?glL7+XrPol116nMrlWNewEZmpXj70F6sievkRNIzSDdg4sS/ya52svzyDNxC?=
 =?us-ascii?Q?PACpIXZXexIUyw9TgLf1Bv7e5q4aZaKmSNb8wBQobbKm7wt9s3+r4Eg2rJqo?=
 =?us-ascii?Q?QsykWo588tWoHdJEJGZZdW3h9U2zlzc/RcUZ5+yAM6vf0MdyfU2pbnM+i4Bp?=
 =?us-ascii?Q?ygLQ+PjHECNuWpYDdGVA86tg2XB8N5NfGifpYykxNGxHR95iEXVRNMSET5+3?=
 =?us-ascii?Q?8WAo54gZ1uR0b6jcBCNO5CgQB5Hl2lA6oJ4hxF9UulQl9ZtIt/4uDwqDzj7c?=
 =?us-ascii?Q?XrKlmYK611ga52uUXC8YtwZzcWhaJBWEIJ8lsx3ZaVN6uoUgZE5zU8kUjr7E?=
 =?us-ascii?Q?U6mpTSP3JxnyWZE5sDPx/q28fRi9qrvMSpCymygwN+eYharSwgN44O3gtLJO?=
 =?us-ascii?Q?DWyfE2OWL2cidfHoNY9cmgfrTSHvPmr6qQ3JraSneQSezVD83bQH94edKvdJ?=
 =?us-ascii?Q?+vid0u8U78ilKrig1DckL9v4MmCPbsoNwvfPTYxMOxeF5E4ZzRynvCxplDA8?=
 =?us-ascii?Q?i5KhnarhM3uJgfgrHSFpim6oJYtoxUB5bN/O3mdT58hyO8p5lPc3EAhawYZq?=
 =?us-ascii?Q?VLrBIECX2sZaRafujRagRVqxd4vXkKtamce5adRIFlDX6TVeW1xsd/cC950v?=
 =?us-ascii?Q?nb51jmpOIQiMbZ9thpkDm18FjNjpiuQfG4ySKy3HWjM0DExw8TN75z9XmUor?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ba08ca-5457-4231-8bfa-08ddd4fab6c9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:05:43.2752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTJd2RAAcruUU1kAh5U4dXB06o10sZFplUUU0iq+hlBOXb7nogesg5GTxUhZU+y1C2650atdVFNar/dqvsz1jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11203
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

i.MX94 series LDB controller shares the same LDB and LVDS control
registers as i.MX8MP and i.MX93 but supports a higher maximum clock
frequency.

Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
be able to set different max frequencies for other platforms.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 665053d0cb79d..4052e1ea9201f 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
 	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
+	IMX94_LDB,
 };
 
 struct fsl_ldb_devdata {
@@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	u32 max_clk_khz;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
 		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
+		.max_clk_khz = 80000,
 	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.max_clk_khz = 80000,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.max_clk_khz = 80000,
+	},
+	[IMX94_LDB] = {
+		.ldb_ctrl = 0x04,
+		.lvds_ctrl = 0x08,
+		.lvds_en_bit = true,
+		.max_clk_khz = 165000,
 	},
 };
 
@@ -270,8 +281,9 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 		   const struct drm_display_mode *mode)
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
+	u32 ch_max_clk_khz = fsl_ldb->devdata->max_clk_khz;
 
-	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
+	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 * ch_max_clk_khz : ch_max_clk_khz))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -377,6 +389,8 @@ static const struct of_device_id fsl_ldb_match[] = {
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
 	  .data = &fsl_ldb_devdata[IMX93_LDB], },
+	{ .compatible = "fsl,imx94-ldb",
+	  .data = &fsl_ldb_devdata[IMX94_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);
-- 
2.49.0

