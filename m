Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3626B1C837
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2514F10E795;
	Wed,  6 Aug 2025 15:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rzVFwPCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013017.outbound.protection.outlook.com
 [52.101.83.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7873510E795
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCV426OhGx89i6u1BpQJyA9YXo0DuEH3mDfDLsBOhcdmn9foyRMEOarRIFwqhGJmVWddtuFYao6QdYs1JSCw/7AmBg8Io0NHXFl7OJKZxUn8y3IqJh00tr1AIxvyEQXaBfFxW9YFhPCEErlK1yI8/5aQ996rUxJPbIkBC2xxEvR68EYIRF9PwKGeU2sGHw8PjyCnFKo8d1vzYaC131hGN8SmqkwYX480I9yJCA4LV8SNXtskZlAys6CQ3PRgpEQ98yDUIkpPqL+hwcZ6PRgyiwJuXaH7QqSexInXu5EMQlRdbjcfxMg5GqmYWHyLeN6dOtr4mRGjfx8Kl0vomTKAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsDPSogKdraXlHGr1e7onfM1VjHceIUnll/74HIenSY=;
 b=Wd/0xQLz9RxjjCR3XYtYHfGsnsYg8ZXJWUSf7rFjGXzhoFNiPoOsPk4SD1eyyA/XjH02Kf8nAe+XQaC7C3nYvgK3QvhfmdMPU0E70CsQNaMLHzVYyP66P0amRmpYE5Iipt4pMqdQKwz1DNzQgCScoDVgx4KywhXEH4zbD1LzEgtIonyoh5rv0HbU72TRtihbZUi5guCmZClQ1R7fDqCEmEo0cCnZI0xa2GzRnCHqUCovZQ8Sa5K9NpVj5msgHMRUZCNMNHTYnS5iwrdYFJqqhU/wyItBSgSgWGYok9GOFiODpJnhUqmFfqivh4hInY9ytirypxS+T4TfJymDV67Azw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsDPSogKdraXlHGr1e7onfM1VjHceIUnll/74HIenSY=;
 b=rzVFwPCQo53cdwZkiUDFQSyIo8nfWR65ABdeS/Kgd6pjbr04o8ejZhasBVmH9LEJ6mf3VphacwrQ7mJR4s1S+Ac37VIq1gRCPI0pjUT5p0qQ1qcRDWQBOjOZX5S1+7tDQXAMQGM2VwT6IFlDb13hXm6Y0uqdJPCKIi8YVkY5l5pt4G6/1LEXNQeINQt4jrgojbokLc2dsb4oYHoHbSW5HjUwAoG4usFQYqXQp08aX2wl5NCwFIrL3cA2Px67b6FLJgPYWLZBXP2Le1mbrSHr9wu+aO4ai3KQRaqqHjw+10uXMqpyR128/977mNm9jF2Lu1EdkO0t2jHVQd5Vis2F7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA3PR04MB11203.eurprd04.prod.outlook.com (2603:10a6:102:4ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 15:05:40 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:05:40 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Frank Li <frank.li@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Wed,  6 Aug 2025 18:05:09 +0300
Message-Id: <20250806150521.2174797-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0027.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::37) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA3PR04MB11203:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb0ea53-276c-4a98-952f-08ddd4fab529
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NOq2Z+l8NnX8zuMjP4/ik3qmOo8i/6pq25Zc1QnLJcWkGsFfYW3TFZaH99ij?=
 =?us-ascii?Q?BeaxWyleKEv3AJJ+2qmA88YVm0Xl8dPr3p+v6eVa+SXqqI8Xz5DO13IkFXcV?=
 =?us-ascii?Q?ZZsaEqZ6cyPjdFesGhahux8BK8rouhs3MYBHUyPRz0XhJ2Sypt5fGmtq9l1C?=
 =?us-ascii?Q?xOgk3Y/Wc47qpdrOxVdbPo20m8AmjxQ2LwqxPWkQqLB3AAqosoisPeXWGiQ7?=
 =?us-ascii?Q?u6zL9rfSkKqg7JBjSf8rruudqI4YUEUuryedpeRYhqGJ8dIQuUxLGsOPdwGN?=
 =?us-ascii?Q?Rb1URtbB0JFIh8YEgSejc57DDjE52E9eMR1g5WpCe798R68dotPIck+MCZzd?=
 =?us-ascii?Q?om2I/E20fHd7H9dFwDAYDxfIbX2tC3C7tfamZmHV+4rFbUuALo9Wc1kWkp94?=
 =?us-ascii?Q?VgJHPNOVfr9tAv/nt7s7592NNgDHK/nCnJ+nUyWeaZKCKsh+x55abAjYbzWD?=
 =?us-ascii?Q?k/tUDfvn1O2muUAJRGtUGoeXa8YYTAAhCG2T0vdEbddd9AB22LLVGld4OFji?=
 =?us-ascii?Q?CDWdUR0dWsGnQGZYfJy3DO/Omzx1xpnKj8ll2JgFJbExutr+aw6icySpCQv4?=
 =?us-ascii?Q?ggS90Oi9IQKQtC76ypsTe1LPPWRZVye1YDYACSWQRWraf1ILuTV9+ies80Hq?=
 =?us-ascii?Q?qcxwi/pMJCiOm3NmYawfkmmkRpvWpbYJHfjxij/pjWLQXjOOh6HWIyA1BKUf?=
 =?us-ascii?Q?9/87iYknvzzB09ATZUnFFxBwWHVMnCMNUMxO662urENYWNSe5gDZA9/+DqGr?=
 =?us-ascii?Q?adeuI0ir1r5pgeUFK/E440ydvTgTx3bTvyihJnnF4+JfQCT5XzP0QJz18VxR?=
 =?us-ascii?Q?HRQIR8claEbeiwmGxfZJ7/1Mrj5/YL64RWs7LHl4kgpK9Unt/17xbj7bPv44?=
 =?us-ascii?Q?za3BIDG6w9VHEN4jrwABhJBX4emoxzIvERCsgm9H7m4kEI399CfwF0AOjrPg?=
 =?us-ascii?Q?UEjhuqt1TB6eB2gVQ+UDebqBm8jf1qwA9DpfMI56uydvqRMNucNDcT7/ApG6?=
 =?us-ascii?Q?dfpNaJuC5tV9eZMbqikbXcvvPu/L6pfyG0Q35ku4GeVAllolrXCE3HOw72Ee?=
 =?us-ascii?Q?+IyY9432NvzDoHDlDLJbtsqTXYWuxV9LTbF7fCJI51ucyAF4OmJPw3C131WN?=
 =?us-ascii?Q?UsZDe6UK6tt9eW9BK4lTVwx9NH3mJ0DGv4PSfX8S5stWOMEsKBChDJi8754j?=
 =?us-ascii?Q?TsR16uMKJjBsy9mbBwPpHrqNBmGLfCO6h9udtb1TWRspwJN3zwNMo1BFVa83?=
 =?us-ascii?Q?p/aPJZ69lBfPr/s6V6dCzUumk7yETLcMmA3CzwMehVDxIe5N0+mIP8PMycF5?=
 =?us-ascii?Q?ENkwCXvJeeEtOuebcaMA+S2+foI1Ojji9+IUiTbLMBxcFEVWIrE8fxI4RMqQ?=
 =?us-ascii?Q?Ce2J0qsqEJQ2Z7n6ahXEmBgZ/fic6melCtOaWbdsWCcM2rJXQNZ7tCTDSpAk?=
 =?us-ascii?Q?qNLVIQmVlMXMraa2ltF2hTvxINnwXIx1yiOM3w5Zg/eCC2ER7cvkxQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sV5cnmqKFNJapVEw3EY2jPCRn6K/IxAyeUNQ15nEua8oerle1DMMzhR1v17T?=
 =?us-ascii?Q?U+bLgwl8daCCZaeNI0L4YlSjAqSaYeW8Slano0TE99uA6U+zYrDEkibbeoTR?=
 =?us-ascii?Q?uvR+KLtp7bdaV1fjI1jPkpDsgG4WjFGATlYwwduacDwqaBUaItem2bV+wFHz?=
 =?us-ascii?Q?TI9TJ7n6RZx7zxfUk8qZJft1uAZ7j2pNjqLVSksFyk625WKqghx2+RWPY+Kl?=
 =?us-ascii?Q?DMa21L81RiyaGf+Kc1ENMRuSGNmvH+WLpSS4NpOC8Tjsk4/kgzj8frjN1KcH?=
 =?us-ascii?Q?xQYtjWFdWi0HRqLnDVDbhxyvPDgAJFL2Qh0ub6VlV2ywiEb4idtD86IQ62pX?=
 =?us-ascii?Q?l3OkDCasQX/HzqZ6kybArnHrTMLADaaY90aLtuvRbzKg7zsacXBgY0kVvIgt?=
 =?us-ascii?Q?MGkCFqTvmVo0UVCqtPHeCBc83xH1nBi3MrTPlZ9oM9w602cQBbl3mI7Kct3M?=
 =?us-ascii?Q?p1iomOFeA2Xe4LIsmkUTuGdxeWtvhuxKpdWdPjPJTdHfgniSL2gP9yeZc4sR?=
 =?us-ascii?Q?+HEmpYvb2HaNYiuZmA08dojGNlxDCJLQ93UZmzb8oWjaBe5TDEddgQEtDrFy?=
 =?us-ascii?Q?KzltKjJyCD/Iv2oSH/eUWFA2/2DU3V1N3dosMsjDZDui9u1AA6s3vC+ISSey?=
 =?us-ascii?Q?BCyVdzJJmbvo2bFib0VavYWHVfV0Q3yxZoQ2ntTyBGI5f1/daQFc8LS6SKAZ?=
 =?us-ascii?Q?LPjfeecngAWE/sHdCLRlD9hSWbuT7LMwTyUy/XMKSULn+JcB/x3ug6CpURQx?=
 =?us-ascii?Q?WeMPCqrOFnBU0ausJI0JULnT1YTW5kw6xy/nrfJX2EemnEIgw78p4zAefYsf?=
 =?us-ascii?Q?9NBgC5AXLK36zDPZ7KGhMvcSfby3sgnKh8fA26CW4va8H2I2dV8hb7ttD1Sc?=
 =?us-ascii?Q?uqpuGkrFZMQoCJNfILF7edaVXv0p3gCWsQTzoVokfNHWo2aVpXZGcNqEGRM+?=
 =?us-ascii?Q?9eFPElIaUJNvAnXomxgLOgOsuxFyKDC62K5qXDbWNwsKAslItCpwsvuSHFeV?=
 =?us-ascii?Q?t3xg6zEBv024GywbvhDl4wLInw3AcUS5JyqQu/VCvljRr8enXOyVzxIVdZw+?=
 =?us-ascii?Q?oN04HsCW4t0uWMeV5f/Nd5+EQ8SiNkhZccEGJQSMhox9sVMGxc0waiWr1sx7?=
 =?us-ascii?Q?MRzTbN3OdJeBeLhAgyDr8uE+RelsAGTI6CFd2X4e8C02XSwXOVyMKaituSzL?=
 =?us-ascii?Q?/wZt10sp2xGv/+hbwY+UK4ybq5AJHoWzEkDAg/1qU5Wx6EI/kr0uZ4KrP8xe?=
 =?us-ascii?Q?7Q0t5nawBZw2SumORme1yAEOLDCHFn3JlkHRmWKcJXVxeW8WIvLw4XAhezZo?=
 =?us-ascii?Q?bdffUUUthOsXWSz+Om1+XoT/CUZA+c8oA3WNiWa0WHXNndFvn88X5ehUC4wt?=
 =?us-ascii?Q?HYx9JxHqcq4sJru08ReriqGa4pJWSf9d9iNbpdXpnMyH/O+gMd9wh7SpUFN9?=
 =?us-ascii?Q?ruUhyyATNbUJXJ+V0Zx9XpVz6dyMbB8aH2Oa2S8GbHh6cIYM4vSKO6ATYh7l?=
 =?us-ascii?Q?6XxqQBaPJK6o0nov5sGIrtf1DAZvUWA31fbvEG7xh4L9aRteX6kC5k8YZgRM?=
 =?us-ascii?Q?ESYmt67wwUJQmbrMCXLoF92XzOisLLikf5BCPkTLLLv+Awukd14HoT/EQx24?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb0ea53-276c-4a98-952f-08ddd4fab529
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:05:40.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imkxBSNr+ksZAPcPKp3PaVtMrIiN3EtZqscNpsNPKf4JGUttNZ3XfatiQwTVNslavACg1n9J5Jn5ID9Hr1ZQrA==
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

From: Liu Ying <victor.liu@nxp.com>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bce..665053d0cb79d 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;
-- 
2.49.0

