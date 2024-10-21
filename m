Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB69A5AA4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A445E10E404;
	Mon, 21 Oct 2024 06:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Dd1ucfXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2084.outbound.protection.outlook.com [40.107.249.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B39810E404
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOZtqR2Rl0sFQvjVoujSBRWJfbpU2j/w1rZBp6tId1gh1yw7K8dzhTwvtq2dIyRIgpBWxhhg3s6+RshJEzfckY/+U31Jfzm/UmyzJA4HO5QRdbGw5aZEJhyYMOWNUOnfFtldwRV2DkNTV+kKugPZU5ItxhO7Mxl/lARK3MBAmqdaVJItesGlqymes4t0OXeb/k++QnOOyxg7I8wzmiKQwZskS79Vj1K8SgDAsh1surdby/hpEBVUi4zOpTBFJwBoFkVILy81PWsCxECIFOslvnzZRyc7mnfaSsr2rY3KY2zbj1nNX0+adQs9A0+LMh1j4f1b/m0MXMgB/KDoFawK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CmPpsfCkh6wybwvHtXbbWkKQwnl/OWMG4oEyl7Rc3g=;
 b=MSlRjW9edVo68mPXq9/VKWBhquSuk4pZyZwdizL9tg4wlxAF+XGgpe271fMcGXrEs1BkDmIcIMBDkuIgI7TBvtMscnkCPl58/CyKx6MpajkitQoR6CXkbUOBrTq7GYty1IUUDKcTr16tiupecLGX2Z5pfDmWtW8Dj8aqgw52CCTrUcVKWuD3BKw1bmHq78cO4UgcuznRBT+soV/k+619IN9mXLCcu/ztFw/jfV95QXZDs/Ol65WBFxQ/RE509TeefPzAusJZd6djHeSjIRCo1WkHbs2FUqR7G/fXKo+zdDHPvMibgMpU1f7KlVJmABaHVlgsO1+jmJ75C9RmqS3sbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CmPpsfCkh6wybwvHtXbbWkKQwnl/OWMG4oEyl7Rc3g=;
 b=Dd1ucfXg6UrH+t2zQbXqt/KcO/mgZQ5tzZ0Sd1uu6CDoX370ycGxcsidJ5pFzy/eMoABnL4Bu0helpvGn9ufZMp7VOs4Iq4kWXKtTOxRzJlPk46v/lT0UGDUOvqb3Y8qyd+R/pvX48QaJIRx9X4jWFiApmEEQx+KfQ18sn8cHhlqV40969qzr7lO2KWfcqSUZm27XmHQhLqxMSGxFt6VMBxb5LdkvnAr/LwkUgYgpdiytdj1tvpCpOaaK+yfq/GsRK9rWsK50HshFl7y47scBVJ9AMv/TUOuHrDOXc+OcoqXA86noWJ5RLqTI0o9hwCWzF+RVGq0FeVypEMqOGP7RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:45:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:45:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 02/15] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Mon, 21 Oct 2024 14:44:33 +0800
Message-Id: <20241021064446.263619-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab3b379-8b6e-4d8e-b69a-08dcf19bf9e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tlQj8DfRsfs2wIOzk8hkCNSrybJgZmWlHdmaScEzTW5ajvhTbUFJtnlPx1w6?=
 =?us-ascii?Q?IEnQG4XSDRVU0E5CGmOnqZExJ2jw+YkUoyFtC4ydSdnsVf7yUXJmqRpmKEEe?=
 =?us-ascii?Q?8BBvQPPtyPoJVYd/8AQO0SotDWaLMUaGX3yxOrSsDIXk32+LfhteJIWWwgM8?=
 =?us-ascii?Q?ivXR1NpXVXE7xFXVrvSmAKotbVZyt23H7xQTIYxkXZXC9H6qPPKnOTDSmXmO?=
 =?us-ascii?Q?sB+GM1s8LiPnEOMVJNXEUd6M2TEpCPJKht7vW3pbEvHRXU6HRWCupG7v4D/E?=
 =?us-ascii?Q?AfFbsXhYx0CNv3v/Nli36+CRwX+hUQBL1sZLOijDDrMBc1QLKlQaKIVkBI5P?=
 =?us-ascii?Q?oSoo1uiLAbNqOD6quo+EHLeSwko3IvIcLoZdiPIKuptjdYVsS7jEfO3Zep0K?=
 =?us-ascii?Q?W/x7K59VvoodqfiYShJI9JFoPKqb9x0BhPTCItfGuVP7QeirLxmEJAcD+zUt?=
 =?us-ascii?Q?RIwyI71jaa+EcgGs77Y9hXeuTYZL2LMG59nl0era9A7UwZwckRA4P3FNpMzB?=
 =?us-ascii?Q?wGdkw3j1MmnjcbcHPOfeDC1nuDE2Hvef4Sju1ocr+0zvkdLEOolYzu7SygWz?=
 =?us-ascii?Q?QXGzsXL9XHELPOkb3H8knmEx2QhoGn4haOYGiwPBUMBcHp9ppzjspe/Ct+Vr?=
 =?us-ascii?Q?q1jx9YSGfaa6w9JltkJCk6d64t3ZUs+8py1CctwiwzgLSLFMUJws9KTHxw+X?=
 =?us-ascii?Q?U58+oICVEWXC7/rj+YSOKaI6ysy3s7VwC8tBnPcaAXaXNOALbrCBl6d8Fcfi?=
 =?us-ascii?Q?Vkt+G3hTyDkG1Hax413/IY9pHWT4sGyxz3o9qh2zYu3KvmILzjCLbwCKt1+q?=
 =?us-ascii?Q?yQXI0AkJFok+0bMtqy5MetGa2CqjMDxLP110xsj3Efw4cR8mJxs8mwI96397?=
 =?us-ascii?Q?/mJLevH1EYdMtDlKW3w4oll3CUTPdwS1bIeABliM1F0fJeP8PpoI+bwlvH18?=
 =?us-ascii?Q?o2X8kKjoocMjC1KwUs9raE9wiW/DIJr8r6VO7XqAPn4OFypczLKUhCLVeUFz?=
 =?us-ascii?Q?irdmuCMCn4VNEeupJFc8r0TVmuMu7moxpxe/xyrSCYOyos+1r8nxzP0iwn+Z?=
 =?us-ascii?Q?JlmDcSiIL7UQa8ztdBuA4TInoShYfXLMox4XcYwIUDj01b5P65rlZoL9J+dZ?=
 =?us-ascii?Q?IoKKBbCG7+kyuNjHYzFLNU6J/oGLd3NQpAeDTIxyyokHYLGUTPBGz1Ygx6TH?=
 =?us-ascii?Q?xsnqeRZDd0Yy8q1/msJYi20r0huksYnATFvUYv3b+7O124fwe53V11xKQ8ow?=
 =?us-ascii?Q?4vPr/be8Kd3TftzUy8ku7XFHZICH894A/x2cj9Pv5bYpYUKMEtD5/Eh+o2yZ?=
 =?us-ascii?Q?L8bjYBxNVOP4boZ4Bd9O7N35FHKIeP1+pGLQnHFHYkUn2GLVFoDcmhXCR3IO?=
 =?us-ascii?Q?p/46nDI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZGKM5r0xw+4/0ACkobUWp0U+/MmtwDG3pJIVKuqcjBnRAcT7ZCnDb106Ydu?=
 =?us-ascii?Q?p5UKSwXGnP1GbrGNhguxIJYnvVLpZs1J9u+zsNFy9IVEIims7TDlN/D0b54u?=
 =?us-ascii?Q?kcqaNf1v14qvzJGzXgIWg/B+RLFzuYJ/NFjQQBtgH9Rm/4RVVoixlIE+cLqU?=
 =?us-ascii?Q?d6SEvWUYYIUKvlUkswuNQmAGJNDFxXyD+iQ22rh7uLxt9surnUIyqRoBEnMl?=
 =?us-ascii?Q?aOCcs5DdRGTjwXrhkbvE2sMTIS99kQlUfPHvWnrrBG/oR7NBE9rpjYYHH1Jv?=
 =?us-ascii?Q?7wf8ctkScT487ZNc78kog3r0KXPiLxl8b01N55Q8tGUOHPNN+NFUmcGcSj3e?=
 =?us-ascii?Q?KeuUHBaIi8VbgjUk0EkN5INHbuKb7lcjcWc97Y6UMBN6IgFFr13VoJo2w9A/?=
 =?us-ascii?Q?aTZBs4EXPsdZypUx4xN8Oz3SkTQ9cefyOJEwIJSmPXrV7SIqhWvaYbt1HyeC?=
 =?us-ascii?Q?JpVv45gj9/0N1PisXGQKmwG2cCxLBflI5lNW0quTdDP6+OhHz7WZooJRpiMM?=
 =?us-ascii?Q?sk0zHYyjtozoZds9PwEgxMWn/v91+eA4w9c4LdeL5WLpYtyg+CVF/m7Z2F1H?=
 =?us-ascii?Q?MLx6o43Bx1uHW3EGDI1lYlb2xYgMaZailocdQpTIuXkPTSVIr1BX26PIWUEF?=
 =?us-ascii?Q?Jm6FoQjKdZ3qJrE+/EY8OcVSBCMwzLt1xRya/M4zX1xOR6f0HW/6xPUXGG/u?=
 =?us-ascii?Q?cQb1NSYFrpKO2mX72L4z4cVb92tZ/I5IpNf33+wV6GS6iajTBCLc56qBdS8a?=
 =?us-ascii?Q?SOqfWHzICBd78/2BJITD0G9pBIwGERU4CRLcmXPChhug1Fh7bFb1F4z1KFvs?=
 =?us-ascii?Q?UMKcWVxnjZu3ANgoj7A2uazGqYh1AA4sVQZRZYPQufDJdB08t+WQVIntKNHQ?=
 =?us-ascii?Q?HoKfRwFsB2lBYNl0VPBH9haNmJSzzGukwSshb/qttfb8P8XyPa5zoS7a09Qb?=
 =?us-ascii?Q?XIwulPtv4YNPb/sVReIwveyhTSlwytnURi17J6rJ+B+nZQpapvQkuzicolHo?=
 =?us-ascii?Q?XOXBpmj3vpJcpG+ht7hhasu7csHKg8AlwRBneL7Jg5iOifbYD+vXL/T1gOG8?=
 =?us-ascii?Q?jTDu/tLla/n5XsPHQT/0ZqcCLU4jGAw/B7dGrgihgFJCJAwofyRl7jmn3HrQ?=
 =?us-ascii?Q?WrO2sNdVTigtzHD9S8PCZSmlLDlPi0L5qJRsO+RVnTeC7A3bBYCN6bOCIcAs?=
 =?us-ascii?Q?YHAu8DQqhrue/hkInRwtfxGXt+ZCwkYw5FVl2nGO2V4oCPj376wwHZmqYfeD?=
 =?us-ascii?Q?49Ad3MqbvCoBa4IqCtsoC3ZVCJdFkiFytuh/YUAkxKQmCy21RqjUnioE7YDE?=
 =?us-ascii?Q?Pjx/9c+iQ91/Z9Z/eExTtVUAyJ72Pk/ZCY1YLAUHiCN8K2G6EOlFtDcVzG3v?=
 =?us-ascii?Q?xN+GI0Xy9HrdKt2c0HBHDhbMP6LXwB88JDQ7mZfgm8ntH1vbQJWJMapY1KLS?=
 =?us-ascii?Q?VVNbsG4tqhOPkuWeiCXW6wWY5A+cbFH6wPiMoazzI47Pd3LtHfWWq3UszBLd?=
 =?us-ascii?Q?PiUZmH48XHnPcYQY0tstjII0Z7cu0DCG4Lkc29IUJzRD3RBNfDIPmimpXVJP?=
 =?us-ascii?Q?SBRZO8V7msCMuJqbmR30KGpaPlz7B/1NtmWi/3F7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab3b379-8b6e-4d8e-b69a-08dcf19bf9e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:45:39.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhJSwcdH1sJ0WeDbFtWcipXaRNIM3XMc8lX7tAxl/5p7LupEg8QuEQ1gq1a+ysF9C0t3pBRfzqwyupKwkSEJug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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

