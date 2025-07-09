Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FFAFE8D0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D875C10E7C8;
	Wed,  9 Jul 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZvcDv5yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4B110E7C1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu54zxyflhtHFcj8tScUq2mP7c2DdkbnsFhTKeg5aH8e6RzVx39u7ypmZncT5N4P4yZXYl7hTXUxInG0o2b3BagJoh3SzjDMaCtz95bFbuwZOo991ciSZC9j73cyJlE4Rhyk56LOXopxsG0/2g1s3Uxz56o4FJ+jw1WOMsElfYdFyfYzCAbGPuwtruZmOHubQD7af/wvb0mRVQKx1Ajm23euMEWrAxM07Bs3eau7B58mzZ6NWrn+6Pgqa4Sg5f+F6CZhRTQDnfl100rcscwUIeawa9w5+djfS74xBqCLy0pC1yIS5dCoEs80A3kqUk2mFRNlAYNlc/mq4ft43VUVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OanrEZe6aYo3JNCxE5dMSo+fT/ANhpzYKdPSSrX5QbQ=;
 b=wHDiM0sH1TouhevJHhyl5T/kp9d1vZBlrxajw0HbLH6GvtqSj29tsASRdiW2VwrNGhN1wIp1ET3pdvQyvVETQYoMrWdVf7Ef+PMksGc5llmNGuorB7Aq7NSvCaC9vxxGeS1ppsM60foBtzrzkBRwhjP4yLqAZ/nQSM+/DVihWeHpo/xZsRPM869fiiuErOSuZwfCuq4tr7N0O2YFKl6D6rgxsVuFG/1qQVOnzJQB2unklE5IrJ68bv//xtY4nuI8N+816Pebg/pPfZj4L4pwIrAAUZ0xvRWL1kwiQ85DxtbSafE5kIDFVKPOsdbekilhBXvGvg9bI9LeTCML7YITsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OanrEZe6aYo3JNCxE5dMSo+fT/ANhpzYKdPSSrX5QbQ=;
 b=ZvcDv5yuMX+NooZ462idnRnY2Lk3gAJMrPsUtLRKRWs/yFzHmVRoCKxqtMZrtWXfdWT+9LJmEPPcoPfbHdzU9gq0U8m85Q65qbw7dZBF2wIrElnX6pmcfL+9oYqfSHst0bjelqVqkWFZC3YHZy2esqbzcphafnsiohpGXg8iN6ji60YC5x2a1DU561Co/gLijntzGBgpSTiUMikRJf1jFfILTtTiEy12AtZDQlu2TxnVM46l07ND56eVAjvi2sgszq9AWMYMB+YnOXxK4oc9fML3bXozGsQYsQDCxxOkOCztZUNvpFee5C9hHE+WcuVDFbEo6CxnOy21ctabmfdGuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:32 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:32 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Wed,  9 Jul 2025 15:23:22 +0300
Message-Id: <20250709122332.2874632-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d236c89-49ba-4d9d-16a9-08ddbee38edd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aSg/Lh71Q3Pg7kI2I6ibPTJhX/+OausYVTyZK96GG2NkT2APIsWj/Trag/ZG?=
 =?us-ascii?Q?WKMeMxqHB9h6OZqtQt0GPU0yjEo9meERxzebmF61UE8OYaaOrKHgy5c9rzWW?=
 =?us-ascii?Q?mt0e2dpvyovW5sUbCA0o5spwCwIOjSCau0tq7U9+LmDIyGunkIIeGG31AhmM?=
 =?us-ascii?Q?ZOwgNPmQ60YccCedXw3ZWlNDW2HsKlpLB+2YqQxVLHMVDbiHspVk3DheEakT?=
 =?us-ascii?Q?kYDaElF5ZALMIr8ewI/JKRdajwZLd21RLSzbV36Viu4uf5zg1EQZjToKPr47?=
 =?us-ascii?Q?VdTGhd7v/gOCnofFVSDc2AGcAb9HCvX9oSJlH9H9xiNJXBqkErgBgV4I0GRi?=
 =?us-ascii?Q?c5DvpGtUXW/wSqS7el/rhlSWbY4x4omo+I2YVIHj17zc3E16FWGGogdX0lGB?=
 =?us-ascii?Q?0FnAAWWVer9oiMGnTK3xUqtmkOnrEsxfEuTNyJQZa4iXU30RItzQVUofz9eH?=
 =?us-ascii?Q?il0h97skd9tPeKak1KUCPH5Zu0WjwdjQJQMmt4rNC+yY9Ly3RYVlXrdbkdkj?=
 =?us-ascii?Q?kMqwPifkfMz3blf8HLXsOIoCNvdty3w2aoQoLjrxGGu++PzieeIqYLbJKpnw?=
 =?us-ascii?Q?HiMDNj7wx5e1AtdUTUcVEYDEiYhXZA/1Ksja9O1z4RK3zp98fqH91ZHJfZCL?=
 =?us-ascii?Q?X9nfddj4udWJM9/zZB0yfi6VPYIi4K/7vCc1Niqi3R3jTC8djpjmrKQhtzD6?=
 =?us-ascii?Q?6XHpat1jFtyho34BcjX8PLKctNON14TUffrlh2Kvp81GTVKUJ+FQhHFDM5BA?=
 =?us-ascii?Q?yZxDQ13TtgXnVxunx1SbcJUNbPTtJVqPfuo/+DegSEELjZr4hf2v56zD2sX2?=
 =?us-ascii?Q?3KeujffgPKfM7JjwPGqfohWdvZs3aWchRTrhNmsiYqHTkaFhEJF20DWPn9Wo?=
 =?us-ascii?Q?ohvqNFSjfb3GCcUuM1N3b7w1YhUKveoIRywf6qS4CfAvP8czfh1mbd/b/d3p?=
 =?us-ascii?Q?uPc+KCfr5cH9hKu0+laf0Lj4c7dkkn+ZL/jMnMPonHaXBSwGNoR404fL7YPK?=
 =?us-ascii?Q?/5FOjVs8d9Nh/KESgtrJGar/1m7TlMow2KJWANTLaoBlTsI27Rc7otWrW/Qx?=
 =?us-ascii?Q?43JO9fnz4r+yW4tU+OUlKxT+0XY9eEq5vTu8fyS+HjEIAl2rCsC94s2Z0RJH?=
 =?us-ascii?Q?BsZBlSsrx/nx7TXQ819EtX2ZYaEZoxinlr97lxP1FmRZv3NPv+85l3rUk0R+?=
 =?us-ascii?Q?S1mNBnCEhfSuO+manvkAJE166ACjbLap2zfGuRdWxrZyM9kGMuYDfYyFT7q9?=
 =?us-ascii?Q?ayYE7BKfpDy1lgftj9N6E+9vgdhhzmHZYP5nu8B72Gg96PPsov42yE1pUEov?=
 =?us-ascii?Q?gDvt++JblGrCe6TY1yTZLkqxfehsP0b3zj4h5LKUkK49/1iFnV0DIM90Drtg?=
 =?us-ascii?Q?GoQ4fQOyKz5gs0eVOCzxeZsb3mKQqcKR73/tGLibRB3B+sAkrd+rV5Dv7T+a?=
 =?us-ascii?Q?0z8GhJkIKq5lxuusfNhiUXFE6wCV/LLnoX6Dd2zq4aVhfoitqdfKgQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WRjxs2erqV84OeCwKuECfeVFLT9go0u5G8O3mK4DsJz2TdWkKSx+keEIvyXg?=
 =?us-ascii?Q?it2zjBcRYX6ntj0lzEBO1KXxvQId5SaCly30rlo8JKdpWsVsBSYVTtzH4yBM?=
 =?us-ascii?Q?RxIns87NjQTh6NzIj0FufDn7hWawtoJJMCHg2tVP0//OCYO3eg8GIWWkTR9k?=
 =?us-ascii?Q?ZlMABSjF+EuJ7iO7dMUpCIs2wUZjYKwa8xKv71Mh2LvpbEM4fF2m2ze9KyCe?=
 =?us-ascii?Q?l3+L7/4DDvlRfp4R8lNHDBqFMvoMMloUSfTZGKIH02jxJ/2wddzN5EgdeXIR?=
 =?us-ascii?Q?uaSUtaz7Xmw9V6dCaqB519IOkT9w9LHYPjh9JWwx/kcM1YIHcRZI4OtJYnAo?=
 =?us-ascii?Q?aYAqJCN/2dDkwXtWh0xAuAIVQdM3MtwpXGC9JR5pLL+NM4hsieyLBoPXlJa6?=
 =?us-ascii?Q?SeJWcCq3lLV0BeZPyCEJL/niOlGxVWvNjX3qq+FA2drUIyfahFtQEZQl2v3S?=
 =?us-ascii?Q?2QrzJaNB7BONJSMRPrNsy87Arg/oG5twHYSmiLNjT7xCzy7Ugr+EfGFgwFB+?=
 =?us-ascii?Q?y4fTeDq+U0HlJuMr/FX1d15tiW6UF9vKgq4KDrjfJCI7CBBrk+mnueYSnRLP?=
 =?us-ascii?Q?zWxPDS5+e0gFs1AxM5LeNoeOAUT5uKr0+sSHBCVA7gA6iWdwJHW+yc8gbLWH?=
 =?us-ascii?Q?OH2FW8e3+EJy4FwGGSpt0q7e4zzM1sIu6o3Uwe6rmTOQukIeUqOL5CqyPxy6?=
 =?us-ascii?Q?Zume84FxSyS8mj/01gFWDM625rGMTkxWzfOeG/Q6ao/UO2PSe3qlpP6Z+oLI?=
 =?us-ascii?Q?QyxulsP069I4ABdVr8OjkwYRzwRHofTO/Cb3DUYowMcXa4HEC+DKm18VI7sh?=
 =?us-ascii?Q?r/HBlwu/pnNmKeSceOWaZgTk/+2MkZFhzkW0Nx3gq997okFMANR9EoNT/vWc?=
 =?us-ascii?Q?4T4W7C7I/f5b5Cwte1kYwvJIebC9zGCKPaqvq/P+IrUFLHq2uKBgVxZBromR?=
 =?us-ascii?Q?JKw1CExQegnXjVId/Du9Df/U5csIWwFngNTeBeUdgTNfhNvNNRCL7wryxJfw?=
 =?us-ascii?Q?PlRnVBB2DzTSvUHkFRTl4zlNsro+93Vr3RGnOJg/jLZdDj9A73ZmTDnohYQO?=
 =?us-ascii?Q?WdtqO5m6nx0UIf2bxujpUM97PVtqHPWTG/C1DwXJrq1Vm8fCCUV34cIe8XVk?=
 =?us-ascii?Q?0ENZNgKTx5ZdIUauh+orcv2WqGDJDqKwIVeN37nbczD3MUezhA18Id5QZayY?=
 =?us-ascii?Q?K1lh3yoZqlgcWpyxVF9C376TRXxUXwJAtNthcJ0zGa7lKw1KpcwtNc5o2dne?=
 =?us-ascii?Q?oGi3P1kI1nKRb6FXfCpwxk9blvL04Yz9aiBZlMzVawenQ/XU08czpdlOEuYL?=
 =?us-ascii?Q?cQunXlYhycH09Xp0AK5B3fdE0QYQif07txTtCYmHRK3IhJA/lNaq3XEa0srW?=
 =?us-ascii?Q?TSRHi9Nqr/rWBz1eDxc8bZDZRZg3HeVOhcSkXRBsCHKfqm5S4lnbvEKFt8um?=
 =?us-ascii?Q?SxV7J+unPSbytO6xov4yY29uEfIslqS3cHnrDRH4JPI9ypWr8/CD4zlQsL2w?=
 =?us-ascii?Q?0c/Ka97IxbXxIXDFBeH79Ra8oJTfhbZ3o6+3tzvdJfz3Ev72Gi96zmiDpqbB?=
 =?us-ascii?Q?sdg0AmVRFU45guKA+ot1qMtfit6wwIFreYAGG+jFFRFEfH86l70vN9yDhli7?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d236c89-49ba-4d9d-16a9-08ddbee38edd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:32.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHV+xaNJteqnmlkNsg5BAlpU9S+QZNU9sQpqZ/cPURlEYKitxYdiJtCcAbJKiDpA8Nc1oQ2Fl4hgYkI3cTgmfQ==
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

From: Liu Ying <victor.liu@nxp.com>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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
2.46.1

