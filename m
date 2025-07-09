Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B0AFE8CF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AC810E7C5;
	Wed,  9 Jul 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z3R0cLwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8B810E7C7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBQP6UUFyyICNUbpOBAsxcyDTxcPc5xiHVB3bE6uXgjIH210HpTWmR/jLEg8txvI0xfgox5Ht/tBpXrVBTriOKzlmjDJV8U/HzBfXMqxJ63/ZgBASPTXOYdtlhueTNGQh2NnChYlb/pKcSXMIaBmALPP3KTanPAfrUjfamsU/1/f34izg6boiU8CSkIVaSdb4AVxiQl25SnHqEvzerLtFccqTipKForYUjAJ5Qrz1QJAzFzb3yTqBmNCuG2/F7XSSW28BLeh/qJ3GUY1qWEcURiZ6ZPogkkZ0iTPt8YMOxcswOh9rRnxWRYrtavZk9pQf6h/zN/yAsV/w3FFlqwxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqFtt2sAjBAFa9kW2EMGf9ZJXy14NDs8YwAuBE25Ouw=;
 b=wW5NufLMgTzSfTwe8+keqD3RohbNVZqPcL605+YBufaPNaMVLYRkQAUniz5QX4B/TNmO/ZbETihw2SZcRgf3XfwmxO2G0ChSqm7cJbP0pARkRm6KVWnbqKBzvA6Q1QJUb17BTz/7939V3GVTBZUkYTeBe76EyrCQ3kSOgBS1zyc9FQHBEGDRKN8veRBlBUV5asmpuogVz5pZ7Syx1p4mugwNoks+QtP8/CxxfPcjdspDLWXxzHfEHxRapZ6lXL+FexAv7lqTR8l5/k7aNFrGkkf3K4LhBNh6eVpcHIceJOufGteSixD/noHPFOOv6t64kKyJHD0GrX1E/lps5Ii7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqFtt2sAjBAFa9kW2EMGf9ZJXy14NDs8YwAuBE25Ouw=;
 b=Z3R0cLwY3WxDAqNYLc+V7x1BY8kLwH2nlt3PYwQI1l8KD99lpMFPLjMuKCnMmFyOtowGMHTsMfHsET6/qiDYRMKK0pqCd2LemtmaZ72qk/1GGFYAKNEuXjy9Jjup7DG6iufY9pynoxYSVjU4P8oRy2zYNeM7dVTN6FH3HPnmKxjJknlOTpWQ4LO0cZut/rHamF3VBtGQLQL2EhvHyBJEleBvRh8SkL6osgqIxMHXDn69zC/tTYI3BEQkFziOmRj7AR+0LhsTztNrS5LeJm70CaWcLYULQeQGjwYQwC4ZLsuaanGiOA828wwoPeQ9WCJRrsI6ZUuAn+lRjkO7mnFczQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:35 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:34 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Wed,  9 Jul 2025 15:23:23 +0300
Message-Id: <20250709122332.2874632-5-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::6) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ece2cc-4062-4c99-bb11-08ddbee39071
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w9fjY0OOJ8svdKohkaZ3BMgG9Tx9vgeDDUPIQGCIsi65LeFayu6EPNmMtf7P?=
 =?us-ascii?Q?WRIYDqJ0UeuP6GwFLMWe32290mtP62Ux2WtbheIreDkCUm4OEn0USL6Vf0GW?=
 =?us-ascii?Q?IwtsuxKyodWIkxDOlnRb3PYCe+SSjRTiiKqauYKGYxUiFhialBgkyrSa27Ek?=
 =?us-ascii?Q?ihgn9b38AAbrE1qSfRKg0/03WIAvsRAFUxoYS4m5WjYfp9DdOBd61VuOcdg1?=
 =?us-ascii?Q?Vo0Vq960tgOljlnL5r/aM1uuW9Kvc4MfngHrouIOORRTlTeak4EpN5soutk4?=
 =?us-ascii?Q?k1QR8uZHkuq6uq8vL6lLv33z2A5lBYMePc/FltI2S3L6iH9BzAjrgDrKAR03?=
 =?us-ascii?Q?0/hC9+ihYZ9zwo0EAsWl5O1gNVwWJas+KfvXXp8X0z9Ps8S68N2oNz+98TYr?=
 =?us-ascii?Q?Whyh7cq1mdJgKvIICp7CY0AYJ52DRluXUaLyDacfftQoGVuGlC99grYrCDvQ?=
 =?us-ascii?Q?XoenO+MkaGspjHNhl3EM4+2CacVOmfQb1lpueIPxZWgraOqrOqL7OCIa3fzy?=
 =?us-ascii?Q?sQVyCgvmV85M+9askdu5aH4VsOePQSmCrnzJvodBCOp24i3IACoeV+VdtkLN?=
 =?us-ascii?Q?wmZ5lkGYqXGtxxKOdaANRp9N3xjvUCpD4qYPc57VczjDAvKzw+tHdqKPFKP6?=
 =?us-ascii?Q?s0Mym4ZT1k55iXu6mmcjXkAf470JJDfvkpp+coxjeiyytIElPsGhYjZWnjXY?=
 =?us-ascii?Q?cpB/5caAHjpbI4f4fVl3UdII978fokKTIZbToW4NSeGKjqYOKomKTYhsPgQm?=
 =?us-ascii?Q?FmXNI+eND9+MNimtuzYV6d4Zymc5Np093zGr/eYcxUa9sa/eOlUvs8duq0zX?=
 =?us-ascii?Q?lApIi24dl+ovNf93S3bIuZiKLUeOJZu2gjePX2rpvBa1BcF9uqTqqruP8aYg?=
 =?us-ascii?Q?l4Y18BBq1AxUqhztrKTD5WZguMOMYP65n0tHNpsHYfMGWAK7eQdAcNw//Ipl?=
 =?us-ascii?Q?7npcogWH0Kt7eHrn9K1DOCJXmiAp0K01Ff1MsehW+Rkg1iJ8aKeueYdslvBL?=
 =?us-ascii?Q?d3R34+MdETvCmC2Pgh2JUfhrEE15dNp3SGScH1Oqoc3VDM37k+tAyvAr1RpG?=
 =?us-ascii?Q?2EHwlCIyUXrjFkJfyrz/JAX5E0LxV48Wzn8GDsEV6+ORpDIUUux0hA2+2NY+?=
 =?us-ascii?Q?Z+rmCOyXljVvf11+vYZ5K9FN866i0QJR/wpQH/GzP8Vri/wEamqr3r+PyT1n?=
 =?us-ascii?Q?3OVNjIx+zW6A29GZE+3jMKc4n+IDpR/p0kfUJhyHVIq8eQTNl8Cf8fqyeOF7?=
 =?us-ascii?Q?dGROXRJfLwKQ+GHe+hCmsajFcxQPvS1II0qto5NX0xV2cC4SbWHGpHOKwupx?=
 =?us-ascii?Q?6Cn87xOe39dDn6t06+eIIwx7rDSu+D2Cy8FOe9e/ND1vCsesgNzAUrPSLkHQ?=
 =?us-ascii?Q?HetJji/DLOk/6L7/UPvD8+Ah+zVbj/EhVdE97nwUYtcb2gUAgoIo1zac6vUR?=
 =?us-ascii?Q?Sb6AmY8LiyJ5EdiI4nL8CcB0EItwKsKDcxoiQgRcmlGgZw2PO/zl0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gSXPf85AUUEm+0I6Yu+m8EYi8rGxsRT/S2BH8D/GYTuHzYVSwUAKQfMuHm4v?=
 =?us-ascii?Q?dmrlwbUGsNAOCkF3GNOW/e77LU0hWd/t6CmwqPthSa0475DKKb+JXjdTF2uZ?=
 =?us-ascii?Q?jkXtenYstynmWYyJyK34kOr20L1OUNiDQFbWliYxMfcps/dWAUhEpE+rqvjn?=
 =?us-ascii?Q?NUU+1uU1NcvgQEt5wtXm/EngZ8YAnjix0XnxcWUtHaB2PTQ1esdQOtgjKyUG?=
 =?us-ascii?Q?00YLEHg3LoxmYceR8yGnkqdO01E56KnuDPss5Y+IuAgP8tboR9ty6SboxF14?=
 =?us-ascii?Q?LXhpXBeC+ogAIbtC1ConQp5ZFdx4dRvmFi2FKsMskoDBaw7sznAvMUeDvstx?=
 =?us-ascii?Q?nMczJWeiFkuMidXck5kFc/7cdXlFCBpB0IV8zaKDHLotPmYug01TjsG5+G3Z?=
 =?us-ascii?Q?Fnrqr+wO7jky0iPEbnUbX+AMCHnMj+3ZsqoejonXDnN+xZ4w1ux1XCLSJlOI?=
 =?us-ascii?Q?acdZ+2gTDDgOqwPolwsjdDjEu0Shw0VdhgMqA2tL23PJrAv+vFuLYWGxC3/n?=
 =?us-ascii?Q?AqSiMMTXTpuMxCeY9nbInQ5F95CSVAAgSpioaW2Kf/do9MmLuvh15jf42wGr?=
 =?us-ascii?Q?MAxyb7N+E+oBvXs8CZ4yY1fZ6iwa4qFL3MJHM3kHuRPYoTiA351UCI5roYuq?=
 =?us-ascii?Q?0fRzoN511qU5tXESbBt5t7DhmbeZqxNyvS5K3mnK8GvwPsdYBYBrXfCONiyo?=
 =?us-ascii?Q?VuFTRcLOJVThbXXg7HfqJiWYWz2hawN6j4kMoLSpxNrHUMW4HCII01GiytWV?=
 =?us-ascii?Q?4uUN5RAgUoPrGzbhDP5/vNPWMWTw1GKpseqU2tnN7wntHmhJe+lqjppGmTqx?=
 =?us-ascii?Q?hfNxWFpVO/E/HBqoe6yIByYfbvjxzYpsHg9EgthWyD3Tkv3SCDiz7pO1m+l/?=
 =?us-ascii?Q?NVOIA+JfwAxM28eqIb4oTjwuxIIA0obIrilmhcx0cgziG2lCrjEg6/h5cgd8?=
 =?us-ascii?Q?z7cKkuQFbdyPtKa3ysp/Zi1DFvt53woOEsBZviHoOBfS9rikTA7O5V7QoLs1?=
 =?us-ascii?Q?icenhQ+/GAIE2gsUr4JNMwpeM24rE9n1YJj6ZKnZJdL73WB4F15Eja3zYtGO?=
 =?us-ascii?Q?ZEsl79eNIuxXd0MxYrMOZ3G2Ahbez+s2JaJe6K0a99oDNmY5sGjx8aH9bwEK?=
 =?us-ascii?Q?cqQxHDBE6ekBlHdKHQe7vCDyJ0k9w+HnQOmxE5LCu7PmFNGIT9FyLdkJEEf1?=
 =?us-ascii?Q?j3/ohoVMMnO++H9ct/1VV1db8qYEsHNn+dUMMVc6TAhJzRwwv+89b9eFbRmG?=
 =?us-ascii?Q?WOp8fjNoxZ79dGrEC+sSg/QCZOOOqW7gCejIbAoOdkH4FqNDZKQ+SMuNvZJJ?=
 =?us-ascii?Q?Dt3lfo8bx4AkTbdJ+G/dnyc6N2LOeaX9N6Pmlnx3EDiMW3gQHq9ga1fEKt5C?=
 =?us-ascii?Q?CNaX9sj2y9hEbDagVI9CoEdTpe03US0CRKyZuBy5H8SUxBA9Tt4h6+e3oyD1?=
 =?us-ascii?Q?qsldbFKSeTNDA/avThVY81NYIfCwFwp5+XVGqpsY3rjkweUNbO8RJXkyYE9r?=
 =?us-ascii?Q?dcweyH8UMGSILgyp1He9IVICjC210PAWIZPkhVLlrEH1wGLf9g7VPsMqoK+r?=
 =?us-ascii?Q?GTjOcl5ZDvZ6JH5c0X+v/E3jcQ+Ciy3Cn5SygISpOEJABABcTd5RBQ4PwPYK?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ece2cc-4062-4c99-bb11-08ddbee39071
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:34.8895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCk8tTQU8wxgG5p6G/Yd7gF0b6HmiuCV46wO/N797dZbxZ+tvLQZr3DhMbpU72bgp0d1mQHpg3BjCryorkTvkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10712
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

Since i.MX94 series LDB controller is compatible, add support for it.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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
2.46.1

