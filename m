Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701CD9B22D0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D1110E30F;
	Mon, 28 Oct 2024 02:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Z4DZHDbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5560110E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:38:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkmmNqnrMJsAmsyUMtHRfkk1DZLFediNdpGiI2NmgMWedsRA6MuVxEFGGYh/ygFznG7/hRMBfWPVH9Ft4Xtfhp7hinMBBYuaStrYsS0HF8/q3P/KYR/K18Iy1eFDnTmySE+WzyJz1er/M/uPhPEKVCI/hCD3B3r2g1cnfyzrDYNbA2djQff2qXj+8WEpRg1xuqFYQCKMY0Td1ckkA2KFIx2843n1wnSXJQN9KKU8ZuDC1nSp1hTIttSWdKpYMnQsDoQ/v+XbPoCSru3xLCPzPcW1Xnc+oAuJEuP0aFQ1X41Rbm4d28sg8r8qdxy5v8o9vI7cSrbDte6w/2i2QO+PYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80GGRNXShcCvSh4DnyJ6W7Q1AJkg3b1u5qHMDQvouXg=;
 b=PpvwNjQvkrjjR0tL9b65ps9YZ/9jv91U+2A3wpsfAiwxc7dSvRhhGhj1tDV2hOKocr4TKyP2EdVQTXtumzQUQTfSfQ7EXxRaHWEmy0JN6fPPyfEbMxu+R4Q3k3OTJtoVfOsToHEjVSvkImAqKnBILlSUW9u/sGL5Zzqtn7OYNmR5aDDUeDt/4Ba70fVIOT7bje1znLGp7fMnywZLiDW7IcStOnoLKQJbxBD2mDUge5+QpLnQ5wl450KuX/SGPVUCmC5yHQxut6v+EhXsdFITh+di380sfimrdibawczbXfl0hvpKfBqN8ihWTg71ee6R4Sdgr/Hh9NfDDfmW3UMcFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80GGRNXShcCvSh4DnyJ6W7Q1AJkg3b1u5qHMDQvouXg=;
 b=Z4DZHDbmef7TRl85488kGhcZSMau3WHdv1MGvdZy/9cqrU/LP1Rg4RgtvrJLPhuupKkssLaEdWVWLW8xLpT6eXWK04XPh3WewJ4tMbcNjajEBK3Q8WQSKPppS3fsQ+Tu1BAzvcge397fVLWqppR0wc4D/Nf/tYkAAMrV+J6RGixxuCtwubbVZ79BvYBCw0okDeEInHSRifHA5hOk9hUr/SCNP00K/GUGi6rVAeYfy1CjJ8yl6Az6J2lMDVObpORaDkPhsSgfXOSUOWokb2Mys7lEtuHKrGD4s+1POlr7iIl4GncE1d1tjQYCCndU3XsI0cfK5yQjpVbO16dYMS5BCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:38:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:38:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 02/13] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Mon, 28 Oct 2024 10:37:29 +0800
Message-Id: <20241028023740.19732-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cf510f-e7ff-4e98-f15c-08dcf6f98dbc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U+Ct5ZiZjE0Dt8Xh+dLJcxAMGENglNZ7B71NKuAyL6ERUjP4/25EsGbGh4wb?=
 =?us-ascii?Q?0erdxPEZa4K55ROmzMtwjsoRi8gzIFajVIug2qleop9Nnnv6EifkygANkqoK?=
 =?us-ascii?Q?6s/WrujEBoHMRDnrrKqkxYa58r+WrAQdHyMOcYguwIKo/rKZu4W+2paD0AbF?=
 =?us-ascii?Q?FIGBqlMLyfRb5lzevrcPlATyUsBHTrC26E0SY7+yLRXUQUEW8gR9iLrHh3SU?=
 =?us-ascii?Q?/SzccNC5Lc1HlL5FwlSRR7qLEoXgqmtyesKVrQnMujpCmyGaUaQjEuLUgwHr?=
 =?us-ascii?Q?VVGHv5NDDS2Jl5zYRlbcqFOylqFKzftnQxHqgOa/i9xrnnq4zLAiHw6GpVr5?=
 =?us-ascii?Q?HAQoTGA8DdZuNhDL9xHPfXqoAdD8SC1XwbjLie+VySNsOS/HTVOSNGUNYnqe?=
 =?us-ascii?Q?ejUX4aJjF25d4Axzv61pniHIzQTG2SRdmlN/tGF7C5TdPfhwpEBqOQsnDzQJ?=
 =?us-ascii?Q?qQBoPmv/lrqp0RvTNepnmRXUNHuq63aG3ifLr3hFkG9iUhW6pBcvf91larb9?=
 =?us-ascii?Q?gxGBfQAYZIT1Zc5o+yIitAJroitB/WsCfb++MQyHCL7D8f1ATTq+jwBTIaY3?=
 =?us-ascii?Q?qSNACY91ovpAKsdz/OCsk12pS2qdb/mx08mggYPI+KJmGVYX5SVryQVrqzWO?=
 =?us-ascii?Q?fOiLN0kfxdcpz60pA3hcOzqFE8gVt/axxFSNxOMrVg9Pq64vb2i8BLRhNR2I?=
 =?us-ascii?Q?06SsnlSQMQWG/KJ/DnnfDDGphw5ChfuCq3kGOnSGV28iTFhUUmc7XhdTdk9N?=
 =?us-ascii?Q?pJAkOe2/1wqngMDlV+V+HLokn/esZFQS7eS5YkXIYgImNAfn+29Ua68Q/gZg?=
 =?us-ascii?Q?isG8qpug16SDB/66+KHcmWuG/mv4IS47tB+hbJ+FKuiMWjNAnRKew3htoCmc?=
 =?us-ascii?Q?+zoAadnZz1lnCCRa0VVWfoZZ6Nhx996l7SeMPBz1s4ftzfu/4VF8+eNgvJGR?=
 =?us-ascii?Q?mCwbeH91ZLHjft+bp2FvqX9kw75XEv4cUre5VXvdEs+AjU8ekDM8QPSzxLO+?=
 =?us-ascii?Q?SSpBx5tt1R74y7gXPi2XlpSBEEnrbE4RnclFIY7cVnElYFnkwgbyRuE0H2vf?=
 =?us-ascii?Q?n6hnHVGst/rYTF6ICyzW2huRrIVvEWG6RpZLQFDkxfeYTLzDvG7p5tS1x6dS?=
 =?us-ascii?Q?k7sWMsiptPSSqssyVhchQ3NHXop5Ys7SnwQezvMK2sfpFUo297THm06SiH9e?=
 =?us-ascii?Q?iKyek9ktHbRjQZajQpJeE/guRHhaydKKUxreVH6G3NWCfoXjySfyGVgoMC3E?=
 =?us-ascii?Q?TSO9niH6zDZMdg+/lTpRZBqaiirmlYM06TqNbbtDtBG5mkY610WyUvdlt3s9?=
 =?us-ascii?Q?ckAfS5oI8WRlqpguoK03xmlFkVnvOc+vLbRm7AxRoV7CjYiLEf3DvGwQQzPA?=
 =?us-ascii?Q?Hoq4AoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gJJeV/BbOpCEL8/bSgdjSlz8ESE84Mqhg4ayhwdv++MHxW7nM7N1ha2dt21?=
 =?us-ascii?Q?igG3n8fY0KnJ6AnAoCcF1GUju4II5DuWOmP4KuN3N5skBM82uqMXg4CdGmnI?=
 =?us-ascii?Q?AlXBn2VObNuNZOEBr9SggQhhjav5No751UE0jb1WalM1PR2NBeA8EqIW9ghu?=
 =?us-ascii?Q?9ZxyHapu0P1CQ7vm6X5PLicWNCZ6DkePpI74l69Dg3oco7hFdVolcvggcR75?=
 =?us-ascii?Q?0tRqSiTBhP0yA1QWQ36+7YjPVg341SD7MDqRXRCU5gTq2G3BcwZT7aIbNWV+?=
 =?us-ascii?Q?1oq6HyHZTxv+kT/ffuCYAA5Yt3Kan7DhwdbeYWhAJHmuqgVIxgmpYBuZSDWC?=
 =?us-ascii?Q?upPTq/rgMJIhnQ8p3QfCQjYdugiXRdn2mmpgAtlXAh7vHkxhda2QcTdMdCGi?=
 =?us-ascii?Q?3dKK4FQsWpYu6Dc7td84ZO8Vl7yDQRAfuzkXKBy3gvZjRWz5w6k1mfIu0CZN?=
 =?us-ascii?Q?BHZE4ZDR9ySsIJW/B0cYdm46WHUkDktIbZcploVuSk+y2IhJFk8d3ZZY8gth?=
 =?us-ascii?Q?qp3j4eTYQxdbPvvg7mVCCFbUY1siov/UVKaFQZ6dwhuSrihYpFTLphs6/gQ4?=
 =?us-ascii?Q?Plr0nHojpMXuEHrfoAo3myesXPL4htQqG+8BiOOVVzI9AMgLt2H2aYdHLaDz?=
 =?us-ascii?Q?F74w3rotWzB/c2y7vP6sJvg4xeY+6xk2N1wigE7CLGOqC9XmlNshKCG5VylB?=
 =?us-ascii?Q?nxf7/+CEmZisDTwW/Ikl9TLT9zWODucovY9HfWoybAvYiYpCAs3Rt3QjLP1q?=
 =?us-ascii?Q?mse9KYujDu6p7H9rXN906WzqN2hZzFI/NtGjYXW42muvtlNFbiFc17S57z+/?=
 =?us-ascii?Q?kjry7Lt3xXtpf6spHgIdKF/oRLTzV98LZV/NZ861L1wJMrPkqcuxJQPfihGK?=
 =?us-ascii?Q?b6ekpaRPiHjFmKScXE8UUBqIr3igHAJQGfndLtcvQHPnJA/mU9hNFVKPjOSV?=
 =?us-ascii?Q?5pQUEbh+20QdC4jIxN/amlpv6Qbdr9wDzv90uJuRwtYWoKAQaNPxudNfSIHU?=
 =?us-ascii?Q?H5f15yHQ9Fof3/aK+Q7IaKWOi7xZjRYP2AlmmkNU9TN5GppffCzZtguGniWg?=
 =?us-ascii?Q?BKO9/ycghcSnGX5YlM1v9NzuE9ZTAQ+/OEabUJwEvLc764zPvKPtQ7OZqbUX?=
 =?us-ascii?Q?PMS5m5j6mRY8+oxFGRkp2SEZ8aOJ4pvE1jmDMjw0+o4ftC91DEGEgTN2F5bc?=
 =?us-ascii?Q?0eWqZbLhxbnHNG48ohewy90bteIW6hHdc449ASTAeMCa2F0eSq+dmPfzcYUq?=
 =?us-ascii?Q?OgCC/MbLYEgRqcuANrrgsrOR3V+1Fgnqu69cnbHLW2g3XvJqImx57ONJlZrI?=
 =?us-ascii?Q?37j2RW77eNehepwJaHLg7godA2FweKV47jBcCjUTyDOY85S76f1YzBLhWBrN?=
 =?us-ascii?Q?ZVNaXAqOutAjqRjD8iLmXzdtORrWIXZKyDQEJO5H7eFLni8SNTBPdBjwhvSK?=
 =?us-ascii?Q?+9uIBAnODCzLEpfxr81ehG2QAnx1aIl/u7bK8EcS/h89GXSqo7e5mjtC81eR?=
 =?us-ascii?Q?Clgg22apKiNEUo1BsR40Suyq2SiEbAubZFg952UV7VwDCU8SIKb114IW3gFx?=
 =?us-ascii?Q?aZMSoiXM17W2pudXBtU/yUAVsFYUHk1KB3iv96wq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cf510f-e7ff-4e98-f15c-08dcf6f98dbc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:38:06.9190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KotahZB0yN28abIh1eX+bmjqQuA0pM4tCBz8mdxWL2aPSbhCZYa1d4ASvQ9g7hk8/L7ZlLw5ATNpQio2vjEIqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v4:
* No change.

v3:
* Collect Dmitry' R-b tag.

v2:
* No change.

 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04f..b559f3e0bef6 100644
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
@@ -117,7 +116,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(bridge->encoder, fsl_ldb->next_bridge,
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
 
@@ -318,33 +315,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
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
2.34.1

