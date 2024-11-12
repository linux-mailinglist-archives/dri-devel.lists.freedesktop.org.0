Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41D9C52AC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B9010E5A8;
	Tue, 12 Nov 2024 10:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MYPZtOro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2082.outbound.protection.outlook.com [40.107.104.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C4710E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqoMg0ExOMF9zewLGu2DycLfOI0yvARjx48raaZnQ+CBbr18RCDMKge25ptGjTZBHdkNnZtN8ZRJjIE1Eu60mavk+g+UYX0WYKvzqQOO/b4tEX0of6swzVr7m9Iw/tXqNhvpYdZZwhlvacNgyYDUUTReIuU+ggNXuhWPSMsDmHd2yUE7tVYk9N267qmqk19O2xbdxTpwj8+IeMuvWsIzIu4ZE9zZ5Um7aNoL6pLApbl2WXi+dmFEEj7I4hkjNT9Gknljrw2WLsYwW03wFsKJDYQ6zFdUpNu3gONl4bLAZ1TKPicaCN/imnnnpCHQk16MwJjjgXT0MJpsJq6rt0rfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cp8Cblo+6YwXQz3tVzJgq0Ki6AfMLZd/vEcpZZbQNLM=;
 b=c1E2iFX8ROr6WaACBZ2LvKt5j/A20haWROGoTFA7n+XQS3N45NFBDexKWq8yEthjKAXaRW0WYiDPaBuz7Gj2Pd0JbHcLqJLEVbV44b/eL+WVm4TwQrskWLyxOyd2/76gDArCjr0l0Lhzad321/3CGP3TToVoyGvILURo11l1/PLHMpDNDVeoi565bruqG/0gNvpwTnEMJboyOmr5BoAbIu3W1tJE06Wf3OGMehds74aM5uNc6vjHutf8rEbtxEUJGHmjd1/FFFJNwIq+kj2Kea0s8eDBFjt8C878KYfyiQM1h38bw+n2xdh8HiKCAkRUnijEcj4QupotltiBSVNP0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cp8Cblo+6YwXQz3tVzJgq0Ki6AfMLZd/vEcpZZbQNLM=;
 b=MYPZtOrozI/PYl83raowS994RANvJwTsu8ot6dExDGQbEK1bXPXGrrOpB4L7EY/vqu0bA+ITConx0pMTsXgPiW41Nm78uj7A9ZBOBkPXUsCs1jMvOzcCiw0AzDgDwiwf+1JLPt9A3NbL05+0SXPpEYG1fgvnGrGwRpKRJ3h/NCkvxMRldlueEwevX58v8PK0FTkn9PIej12NAXY16hxbeOKdwA1WjZv05AKYe66OYgBBqwHkvEnmYS9aW/sp9WiunAEw8JLOrYY/c/PpX7pCeLyLVgLY+pMX227ITQgJoM1TTjJfe9lHZQ608tkPxxLHQ50Wtmvup6uy9pspVAMNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:06:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:06:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v6 3/7] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Tue, 12 Nov 2024 18:05:43 +0800
Message-Id: <20241112100547.2908497-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112100547.2908497-1-victor.liu@nxp.com>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: dc766a2b-227a-4861-154f-08dd0301a338
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l4ryqmJ1oe0PL+EzqxntOYStiX/LNm9hja6R0k4QTKP9wWqyajWPz94LApP2?=
 =?us-ascii?Q?lAiq0tmjiGlf+t7T4bFyQ3IW04xeKGGhB5XuzvJ0nzvFZM1YNO43OrU22dSs?=
 =?us-ascii?Q?yjRrcNiwalZkvt2wcGQAkmeQzeVcTZVhKiip4eLh6vhkBPQYJQJ9rTQVJ45Y?=
 =?us-ascii?Q?luIgVMWNXRyNoe993Gm8/O/XzKU+su0j2mX0bb7KV/uvtdzikMMfUdxl4JIm?=
 =?us-ascii?Q?0+AfA4+ohCJmOoMO2MI43np/rZ2jganBxgMDKMQ3EIsDL9tx7VXL4w/etFT5?=
 =?us-ascii?Q?XhUxQdvxe386f/BkD4GsxHqUZ8DTVNrulLotMhGYreZgIloO9oGiVZg8jubZ?=
 =?us-ascii?Q?62q5kaUFVtXwim8EqgN9GDd62t7o7vQ0AY3SnWGbvstDY24gcjcW0RGrrehV?=
 =?us-ascii?Q?s+KziwbF5yy4fJVTGHjj3xXK2Ztm8jPMomL5YQ0ymL4zOgocfDRXHbsjyYUU?=
 =?us-ascii?Q?W6qDeU2gc4Qcgwmmqzcxrnh2lNZ5SxIj6cjH1b0HOhX+6hbg8WVYURtehkmc?=
 =?us-ascii?Q?cqP5dKySksMVNK7MlDV3+Mj+pc/JrR8Jq+rGsGWqqzKjT+KPU9ahbJQTI4Kt?=
 =?us-ascii?Q?8NWSBVZnElNI2niXbOgNaMcZKaKdKrnTUQFEuTxPTBsQMfQJvkcycdvYCdqi?=
 =?us-ascii?Q?QGOZx/eBw1WrUfqHIAl+UA08w2KUw9CjnUsKtRiPkV8tXOkfg3abbRui6oYY?=
 =?us-ascii?Q?oxGmftOxxgs/8OwCEUZFr+iKOQu5GqVM/tiFiujxXHzrOHEoyPCUMgi+WkIh?=
 =?us-ascii?Q?h4Z9x2C8Og9bBnlbEJWuIADzZ648LJF3ZRo9plvtI7G6Ia21xj4Ts8PDp8t1?=
 =?us-ascii?Q?so5kTMeHekd9HQMU9HImq9MpHRfODZ17pSljcu1PcNazLxTM7t7L5p3p8BT8?=
 =?us-ascii?Q?AwZ1Ste2H+1UP9uF7rrcP5gEYAFcwofiUyrbbyX5Shajpyu9xV4w/FDnRd+l?=
 =?us-ascii?Q?wyT+eUjQRX5QnBt3OmFwTI+UWMwUwVwfv3q8jYpTVK/xEDL+GlzVupA+f3/m?=
 =?us-ascii?Q?nyN2/Mb4GwRGp5w3xfa+gkw+14HMVQefaAVGiFCtjO9NaabLQfzof5zQRDyq?=
 =?us-ascii?Q?oV8ZlmzFpho+jVRm3wQGxmc+d+6OOPayZFo85nkeoINePXZ96WVokiSvUSbU?=
 =?us-ascii?Q?iavdnfEL+oZMT0wKzjan9LL5NFO+yn786YN5SBrZcSithhKSRObgVxHQwzeU?=
 =?us-ascii?Q?S1vMcsQpHNxG+cDQ3Y4jspYygPoNoMJFLtsKJVAN7lufgb2L0hGXHy93KvHT?=
 =?us-ascii?Q?8QrJqnkk+wTt6/zFcFuILIvuT99fLEup5y3tCOKXfYBSpaYKRwmYomhM0Jox?=
 =?us-ascii?Q?pmfghbpbDg0sLean+I39gHg8BbiDygu03jPSN/8ZW0Kt39RIJHc6WFEXQZxy?=
 =?us-ascii?Q?ionqmd4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hF95+CphTpx192y0/HhrIa8mEOIbUX3fCGnKJ73QNA5lFWKaf/UNqINIwwAO?=
 =?us-ascii?Q?l6+YsV1j3b0GnikawGVBr7EKKCi4SZGXaeASovIV94cEOBLuWQUjxcU+PGQr?=
 =?us-ascii?Q?/GZgqfqpY/tqdFRopwLTVilJ3O/lctEKVLTWFUvZ+4vwW8RQtVZbeZEhZWUx?=
 =?us-ascii?Q?FW44ioJx8mHqZpf/WbWKRp2Q/Aoz7nwsvGoQU8WaxzvRGm7cZQwozm9lBuTd?=
 =?us-ascii?Q?CBSXLlFfAw/ssAaAk1/J7NB3XwBATarlAtf5dPzgBVLz2qkreVrR00nlo0sT?=
 =?us-ascii?Q?HPi+A3nRB/NK0e5s8929bjrUPPxUNGGXtGsd8CXgUeph3CNDgybwJjb15c0i?=
 =?us-ascii?Q?mH6ji9kKZBTWN9TIxVbc9ERiW/oKXVa6RI/zhICn68SLoQ2loRtV4QSk92O4?=
 =?us-ascii?Q?3mLZWvkLLTDmxhkALTRx06GAm0SwPkxeiVVF/yko/o3kj+fvUxjiHy9yuP4i?=
 =?us-ascii?Q?PiIwVqMWJ9UeQXNgg4qbCg62b1jdmUCh27fKUBJz2qWK9rL3DmQ6pTnOcret?=
 =?us-ascii?Q?pVE1sM2NwJeXUgAfpI8kBj+NEYmOschBolnzvtjQWhXCP1dFSvmyUgbJm+af?=
 =?us-ascii?Q?iEudkgG/ZT+DUp8LsydKfjgqaZ2oVpqlgUu8vGKumJr6VPC/Z6Wmubdt/wIn?=
 =?us-ascii?Q?G3gnNPLdWbOBfRPTVY6dG4BnN40AUa90iX87xgBWeY1udmCcO3xDxIxq/xPV?=
 =?us-ascii?Q?tD2e213pk/sbs4GtS5RGqi2vpFDflDW6Y6r2A/4XHMN7vHzkMakJLhOaRKMx?=
 =?us-ascii?Q?vDDnJtICMWB/EcRTC/yZRTuWU4sW/NVXfBWCv5dQ/YCBFTIx6WuK2o6crIQI?=
 =?us-ascii?Q?KYCv3WQLg5yLpjpl0Bht0rlw9Zb7VBhzqnB2kmt7cDf3FTiOyveYs8IWD7Q6?=
 =?us-ascii?Q?0zSYO7ARh+irVe/97ebd/u9IPkx6TYPU3bcf7S5C9IOCMtBwMfHNUvBvqR5E?=
 =?us-ascii?Q?RXE5cZh2qkuo1nruiviP9MXHesP7LAbu5/1FT2OL7njbG/Na7ZRQmvKhiGUf?=
 =?us-ascii?Q?xPN6tOlf3WBqrFWr6J8SsqrSU4y9sJM5F+JSs1RUYImcvOWgZSy6PBiWheDi?=
 =?us-ascii?Q?zDdjyuCv7lpOvxP314GfeY/Pylf5ll0w+hTdyrrM+32FU5hDMSlstBo68GX6?=
 =?us-ascii?Q?jkKX9Dms8HyDhl+2nVOHN9EAq0HX1t3bYUpcTe9p7CGBHKmY/QzK4UB580Qn?=
 =?us-ascii?Q?yRndiAV62FLf1PleOLLCBUK+LmSCVgIH7kDpFKDvBVXi2Va3L/BY1dHMxqZ8?=
 =?us-ascii?Q?8E/LTf66SpXVHVYegeN2W/mCFm358d9n9etbk/hXdU5mxFALDGfx24XaG3Iw?=
 =?us-ascii?Q?Ml8EmLoDIxK7znTIwu9mANPI+YVmZNAR3ca92InlLYLuMyNLbOWocNHk8fJC?=
 =?us-ascii?Q?GDHbMG/1y8PcI1u/mKzk/pOAfg1ZLogWRzAAhQObyD51wnahQ6CFMiVQ6qOw?=
 =?us-ascii?Q?95pJ+w7xfKmw3oRqKGvW5Xh6VEj+Cx5/93vpg/0As8SI+LxofKYK2kjLI/nX?=
 =?us-ascii?Q?jxtxTOn81Zx/QWLUEvc8Ay9ZrbrAGR0U5ckLmHvQpzNIz16kurhDS6z4ZsfI?=
 =?us-ascii?Q?OUa2F5WzBO7C3w5BKeUCw6SMq471b1H9QXKECpRq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc766a2b-227a-4861-154f-08dd0301a338
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:06:12.6804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBDzhMjPuThNpM+MEh7gsJfSdFISZ7BbvWSQ1noADui5xBIehY2FnmCCx6hdETXyKS71pOq0SwBdMrfgP/0T/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
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
v6:
* No change.

v5:
* No change.

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

