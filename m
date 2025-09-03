Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755EBB41F0B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922DF10E7EA;
	Wed,  3 Sep 2025 12:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bjLJlfk6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E77710E7EA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBbBrbNCjrxvuEiQohSEgovsD6sq+rQRyJOKM8MGJYhq10Hijl6RJBbd/MT5j28rVyn1zNf3Z11Y2bPq1vMVdg2DDvpL9AJ/8c0yut/b3muLSrU0Qe7s83L0pMl94vOyNmYjwflbXgOWEq2AlHwOW6KzVhH5ZC47jou1BcU2RwhXsbC/Q/l3kr/HhhCgM4K8lb/YqEB1swxneAqvw13I7jtNcePrJ0snVKHj53FtEMYacBdvYDb4O4qPSVnmqjvadTzarzfdCPg6ucR6BgqRB50a68mzjNl+K3rPLcIVWtNKHlw1QUX1pNZyx6ElsrznZvsO2skegkwQZzS0xY49tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsDPSogKdraXlHGr1e7onfM1VjHceIUnll/74HIenSY=;
 b=tzwJcCIh0j5cFugmHqklgQSqlDQ+Pr2kVu0xXQlaElnxgnsQkjA4Bjq49nhz+QrjViUDsHr8wqfvhRGa6TSb9ylWomB314aSp8ZImWSDb/R5NBBLKsjOCD3KTcjLhH2IDwcnoNMcyc5ojMTZhsMmYJGjObP713kSBwYyu5c0Xg7lRdDZS+Y9ow0ONWjcwKmq7066XKh1MQvsImUpkmsRhDE9e04cCWp5nYRuSW2q/BSBXpyKHnx60TlNHmgyRnKir8ue/Iixn7ynJtcQvAjor2fgZdZ/7Wpr7iNAz73daSa1xKd49kY5sv/2V7l9WiyoPAdnG5UiYQBWRCcbTOf1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsDPSogKdraXlHGr1e7onfM1VjHceIUnll/74HIenSY=;
 b=bjLJlfk60Prgkxoo85KDoKS3bOmMmhrUDUFY8gbT7ulShf9qLxRhOlHmVjIKO9Z0JT0kVp0mWE9wv6BjbIumK4pYuDxYaobXk9le46fIieh6sWrD6NXj3FlweBrqUD5o9rfLbUc34Lm4DqkJUNErDrw7uvp7zqVkUXmBRJ7Au0Y56GPnbPrGkIvctLVB/GQnJs19gzaGvl6n729KYetHRkDiYIAr76qO+bFi8eiq8qVC02tBbQAKv0Wcb+c4FqvsxNoUxVaIkGa2U3hz3HrAYDPG0jj3IAR2MroXgE/y7VgpTSgkBlR89l0PKwDsBwq2CpwnPidAV3Umcns6kWz4Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:33:58 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 12:33:58 +0000
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
Subject: [PATCH v4 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Wed,  3 Sep 2025 15:33:20 +0300
Message-Id: <20250903123332.2569241-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0380.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::8) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b2128b-44e0-4f69-8659-08ddeae6271d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|19092799006|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6n0hdF+yXQtgg4G0HwncccuYqDc/H39AFdWNt+B4+Kt1q33j/9mNFSZU35PO?=
 =?us-ascii?Q?BpwqwrWPKAT2zqPnrB/ZmNtDCY5njBMqSneHRuc62kr1XP8kU5p6clcnl+jS?=
 =?us-ascii?Q?S0u8waUwxP/b0jduCm21/D8w8n0TKs7qulPWB3E/I7uz7ifBF938jYsK/HRk?=
 =?us-ascii?Q?M7NBukj1AEJGZf98a7GoaEFAyQmZvXDH4sJT3pmgMBXMn4Ma/KVk1LYglLKS?=
 =?us-ascii?Q?hh3GY2zBWI4uLZiOPgodQMW4A8x4HaUMvMj6sEJi5BGPD89MC0o360NozuCv?=
 =?us-ascii?Q?4LyFFMDgtpUhmsMnni2BmRADMuorJ2dfy58qZWFw/EGF2a+rKUDTaZq2iosq?=
 =?us-ascii?Q?geUNNi8OEtvJWksDlbDG0hE+TkDygupOy+KFOVA+HulKQc79l7K7Mf0OAsZS?=
 =?us-ascii?Q?VWKPgDDZrVd2eYMWSeXibLhX5vs5/SZ9qXjwnVIWMuFrqXaCt1TdfODY7jxB?=
 =?us-ascii?Q?dckhW1XuTYxU6V5dYakiBUH0vDxkDyoTkdm2AZOidicXCmLD98mO8pH9ARG4?=
 =?us-ascii?Q?EPlLx9GWOElknDQ5NyjNzK/vZj5nHr+++zS00+DbH5x7n98hmwxcN6oezbaf?=
 =?us-ascii?Q?vCvb2/VZFpY0Xz9lx9FPCt7fabz1HchBVkUUc6Pvx5yaYb5kpg00RSrvyURK?=
 =?us-ascii?Q?5ftWFA2TSPjLuRbWBHWVj4zNPI6mMvQ63iWl3RtgXWGd1BCYgZrOvAaRx+K5?=
 =?us-ascii?Q?8k4qsgjESIkkyKKVTSCKQU5E84PPGSMJgjVAoEGfl65+tar9lhySvCNPF+GY?=
 =?us-ascii?Q?8ViU/rsqm4Hna3fF36lNQXbr39w5NehxgHOJM5FxlkLN+bGray1XFhs9XYbk?=
 =?us-ascii?Q?oC9Sw0zh/aUpsSeJTn6aW+Vsj9r25UI6AaGPfTt4bPsx9SNGCQznPmijqLf9?=
 =?us-ascii?Q?VPlQ8YuNGJClDVdUefQ88DmWLOaNzywriyWD15JOropa3Gx7cW/RiMgrhSLr?=
 =?us-ascii?Q?g/CumQEX4qrUwd/LUvwocv6lFg4PzDXu56XURWgAp+2+O/lHnKAu9CtsNlXR?=
 =?us-ascii?Q?FboFO7ktjtZrm6uj1aXWm2Qj36kMvmd29AT4P9S/YZoQr2EwsQub3sZTahED?=
 =?us-ascii?Q?2CX/CNUAUL5hqmv+k8kuhFQX+65bjTmsWl3K0g58tOs5DsRNs67/CS1PykJe?=
 =?us-ascii?Q?ViNK88l0debADvXgoZTpfIWjbTxwXEhkXiPRZ5S8SWouplS07+TbSqq2eMYN?=
 =?us-ascii?Q?WneiZPw8i2hjJT+fTfqbYXMpaWX4GzLH0JQiRkQSjxUck3MM+NHGjk4EfpI3?=
 =?us-ascii?Q?34H4Tiyvti3I1sr9o+pRfvtWE9KhBdxpJAM108uYmQkIm9pPwPDY0uzBr4zy?=
 =?us-ascii?Q?WW8mb7SIifpF6t5oK/dAQE0cNGTSTbXZLnyhiFy+8cgVSI3J3TfC2uMKrme1?=
 =?us-ascii?Q?jg/D6uwRQSA4kor73EU6OZEGnE9DOtoGFXPYD5zoucw5q1jBZ9HkGEsnRja7?=
 =?us-ascii?Q?GPAv73llJ/7bRNDatXk4BHEVLbW+/inzLobtE35ABoE8GV0J5Wghvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(19092799006)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cKQZSQTu/4yH4g08XwkZkFUU48NWfY2t9YXTDU4EtDOaDubncvQSVeNkM4wn?=
 =?us-ascii?Q?ANQc1sfgt2SUNB9VvOv99+3ZDioMUemPdEuEz5G91dIqELnAakqg4AjV4MTA?=
 =?us-ascii?Q?ui7xLz8R8KEpoF2p1nzTOiD/gt1EQqJ6Aahd/auHCHscfeKtk2fZU7+AxVWR?=
 =?us-ascii?Q?UHlWiEQJBo76LMXdO1hxnMY//JLL8orj+OYdjVl2/hPS91G0R16CB0wPJlTs?=
 =?us-ascii?Q?Oc1XPkXwGZubB1ZsvR5LGmTUEOOmgTXgMIZnfvJoFWG7EMhUU0LigEnNSKCj?=
 =?us-ascii?Q?crB9z6buNJYDHBcAoYdj5HrpOAvZBUQuWMczqICe0SbIUsw87ZCwVhbPsvmY?=
 =?us-ascii?Q?3CNIQU88FIr1m6/2NDdOLqEwqMGtDmqmggxBBaQ2kcgYF4dwIGrz4BQiTS64?=
 =?us-ascii?Q?ii+7LyOkVvQl6Ay8U+icMn0RBNrS+3uvA1nnh/Aau2li0mIP9HkUvl2IftfJ?=
 =?us-ascii?Q?HCl9yb1V8CWGDjRvLHgkhHR581OPfEF4TwTMmKGZMNr6vPfivtdjSH4aqdca?=
 =?us-ascii?Q?VF8Dfje0ZJEv/rsqDpadNbcWDJ79zprI8gLxS0rTmGqPx8bvATn5BSv6kykb?=
 =?us-ascii?Q?6lNilQPlmquItCWu6cO6WE65iOrGshsEViInyqpe0rveU0DGlDvpX6TY9VTG?=
 =?us-ascii?Q?63iFQoNBWWMoet+NeXI6NdBucgS/cKIWIvPFiaO4tqC6YqzCjfkRuqM10bEQ?=
 =?us-ascii?Q?rfbiGuoVNR8oHciypzvkj5LmdsWQntCs/bwGpW6wCwmE6HaQunKpVKUCH9IO?=
 =?us-ascii?Q?PiYf2WxUxJlnYBxFrZDXQCXhc7y0h06/u0RRy5ymOSnsECDlZOzz51WrqplK?=
 =?us-ascii?Q?hP9RhT/05rwb98xrrNCb/gDXpoJ4A0nE0rp1k+wlgBp1EbkfBkOijF6M2H02?=
 =?us-ascii?Q?q3A8UtkRn8qLDRfoB0N+JIVkWSlQAM7QaKrojPBPwZWV2BLxAO3IaNGNxHQE?=
 =?us-ascii?Q?uhQE0xuxe0selDPxIKq46ExcCB917oZp4FFfkSguwDZQkYAC0EeiL/JCKjUG?=
 =?us-ascii?Q?hbF5PlTcroz3vdLoebBNbZ0jZKWXuPdfrEvEu3o0FA2F2bCzsx5v/Bhopc24?=
 =?us-ascii?Q?92p/1ioEtXf9eb4SYk8YJWZdbUM0v1Oop8aC4HV4hhMyreI9x5R/vV2nZRzf?=
 =?us-ascii?Q?cpD9wGVU4zLBeENi9sk7jG0of3ZAAJBtho/bvByxOxIDwh3Qi1153Or2jBIr?=
 =?us-ascii?Q?X8gCiER3EgyyIytJid8LkG2THLnHnf6QhluoF6pVSU5YjAksGwC2rXdxOuf8?=
 =?us-ascii?Q?+JnYM+OF7+cS1MtjIqToGoQyCkVsB04CNypMiQbhghX+LpQQ5CDdfZ4H0TEw?=
 =?us-ascii?Q?/P3m8EYRBki9U3O96vUDgU4lF+/Ok9UjLkOyf0HOeIT75I050sGZRqLuGEdh?=
 =?us-ascii?Q?iP/b4gU60DmeLliX8CLGP7h6pU4jI1LossjVhg42hZJu2EBGoRLLWfwXF6Gg?=
 =?us-ascii?Q?Apj320O3X9UC0ezOUZNzzuLfM4JyLLXWtntDjkqcQuYvZm+H2qEOipwnOMUk?=
 =?us-ascii?Q?tK4vuB4QSsT3Ce7A5AvKpEpZ+9Iv48lSNS4D9bxqQqj8ZPv2FL8EYpRR+Ulw?=
 =?us-ascii?Q?5BCk+M6gfgUpZf+uCi0WUdZDSoPVdYrHwgVHCsD6fn0HLWqf9mOxyh0epKiP?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b2128b-44e0-4f69-8659-08ddeae6271d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:33:57.8427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLOo+iruJrli8OYYNCtEt9HHPsxClG0CLBL80gYTUjEzu3u6d9Isq+1G+/QKhAygFhzrH2gjajW8QrCGN34+2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233
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

