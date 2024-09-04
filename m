Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84396B117
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF3F10E617;
	Wed,  4 Sep 2024 06:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ikdMW80P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E4D10E617
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLVkT9KSaaE63nTlVLqEAoA7FMvf5DSZOR+uTRBjX+QV6CyeTFtXPUu0WY4Ju9eUWZsyrIgFzjR1kIwDjHyw+bihzFj/zCkWeaRPfE1EupZz8g51UZUKGZ/qKB8WgK6l47afvOr1uSeH1WwleYCglD0qYZjpy108tXSq+BH02lwZHnNo7z2cbosvJfUSo7RW3lnHfr1/eOaOa1/gAc9uXtG1O/1wJFNj6W0gpdC9l/4AQEjfuXTzlfTvBL7pjVS2plfy9jtXzkVbfP0x7iE19FhC5CGg/D1gDBRvwXEkgQR85a0K4xLVgwC2PBGKhQIhcGL2y+Qt15+rk8WUCqifhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSTy3OP81bOUWiIaiLJlHM2sjNqpFXTV3MWJ/ljI3OM=;
 b=L4+bWvArbX1XSx1oBp+OEijQbEfk2yT06Iy+bfbMUq9nr9VlLV2VwYuOuN80UzY4iSjp/VGx3ZOM8a5ZkJ4HTI/THZ4DJ1ZdsZxdsv6yujSKdFoGRQ85PCdxsqJkoUd+GrcixTx5PTSPUpwbZ7aIRM3MK4bz14imWVd6VaV5QmX8iy05S7qnKV1uWUbyNygy1Emmr7KHC6BVOmJgqWEUWfwSHWFq/zmWPJH/iRrIjObxAeJUTGRijL0ODE1F90j10/vuRnLneBjPDF/FlILuJiEGuGizQJSr6o3acXy7oT84NYXUqVFZRtaXHuprRfFnzY4QLVjTOMZ0MADb0GRZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSTy3OP81bOUWiIaiLJlHM2sjNqpFXTV3MWJ/ljI3OM=;
 b=ikdMW80PXzqZKHNSunUbDoTI+l597U34//NP1f4fNqdUn1aJshRSwIPuJuETwON2DlF4l8oz4QoCFDH/G7P/5zVqoJzZUpEmqOH3yHq0+TkblifP4jcsfzHZUW2uDbe8fJGwSJDbZp7hntU1iJmA4SOHWO2be977/S340JlN+Vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:22 +0000
Message-ID: <87le086j91.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 4/9] ASoC: rcar_snd: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:22 +0000
X-ClientProxiedBy: TY2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:404:42::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 530330e4-4eb4-4219-052f-08dccca86677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pi41HNq0ioHBEUdMYKUQfHHe+nChDg/xdHOFroxDB46Xm6Ar5D0Ff657SL1E?=
 =?us-ascii?Q?82AYumMUjNyeK60ZWvcMH6JT7p5xeGtl/UY2voOg9LzlZJV6w4vfXp4SpPlL?=
 =?us-ascii?Q?I3XJCvh+5g9H0eR9WiDNp2XcYWqrBXe+UzqOw9JByb1xCXZ7l1WJCa96lI0M?=
 =?us-ascii?Q?iiOcJiZhfKI9E1l8CAYxDL1RPl/Di/E4x8eipZkoUUNEFuheuTDkqzs2z9A3?=
 =?us-ascii?Q?9P9eWDL3Z3r1zeyRaEAFymlTC/9huSlXg9w62yraw3CwjFaar7N3XWq3TKSo?=
 =?us-ascii?Q?szpjeq92fJkewaucajNQEZULfecZNgC0U/IGGNhFuAmlY/722zG8GFFzX5PN?=
 =?us-ascii?Q?fsLckBXSgCqD9GoxHiqiLtXx8iZsu52ACc+spiSNnxf11MHHXGKeH4Nb+7Hh?=
 =?us-ascii?Q?atw7775lDR6v8gKL2lG9gPQCMfPM6l7UFU/IX/cTMGsqw//72isHkou5P4m8?=
 =?us-ascii?Q?eQ0YApW0Q5QYgsh5lA+OccrPQ6bp5MjrqaUecGQ14A30hEzhTkfZhAB2KU0a?=
 =?us-ascii?Q?fz8RQN98p1+hFUCy3LygD5cqrFhoETe2L2TccDhIvVOIsPAvQAfpGJmJQFiX?=
 =?us-ascii?Q?qU7v7VuK8c1x2bR20wEeQvb9JDuaa+sE6JkWiZ09OtKGDIP98w1ZLR9iiLvI?=
 =?us-ascii?Q?S1ONgKFnED5U3T3ueIdXvF2B7Fk5IFEZkCq5u4uq8QnZNsvqLl7XUxfFazXh?=
 =?us-ascii?Q?r6mLOmrPvuEnCtTu6f7AIToO0MBN+oj6zHCbHNknL4LApS6B2z+TsWITQvIt?=
 =?us-ascii?Q?r97nivQLkdSvmyQyee9mjSMBkp9lt4aOGk0EqCiZDQfMlOcN79t8ZTx2xuN4?=
 =?us-ascii?Q?eFR9dtSxd//zqH1vZHR/DBalnw5q3WP6lnHy6tGTFgpNNUXkujMLsvhevnp+?=
 =?us-ascii?Q?UtzDQHHywzoxJ2ghp2OSPd1UEgP9g0TFwdtuPfaA67dD0lXSNLj3Lcdop4i5?=
 =?us-ascii?Q?RjH4T4eYoBE7jSwBsgkr/ZjfDQ1cH3dRc4+RGeviwfO2r40IShEq8J88d3rn?=
 =?us-ascii?Q?0krtXDy4T0rk6qRO0+TSHDqGU8OZPDuhF3mkw1AgadQhP2LqgHwZ/Yihxz+W?=
 =?us-ascii?Q?8+o8v1bYrPahna/aXiZeZOA57znDWqaIZIC8M2OSF6MoD0nRwwQZYsrzBKQ+?=
 =?us-ascii?Q?Zw2Esy0X2xPeuXAapOBMY59uWa778g34SLbit10wb9DQNKnGB0F6iZ4UyzOA?=
 =?us-ascii?Q?jSoNomy+4jbbNJ5wfNLMwzlWIIrO85q1JCCCWtalwTSP62CWpGYlzZhZunQG?=
 =?us-ascii?Q?lTjZuq2LLidgsRjiR7pINqEmeIVrUdJyBViVpwUpopM+IJd6oZ17h4C+qFLC?=
 =?us-ascii?Q?rffQDwfNACXh5mxwvYs5Ore8MoUW0DFNcM1AJHhxowKsYF4XXL2miiyzesjv?=
 =?us-ascii?Q?/bWJc/1YndDC39ZHYSHEbW+8s6Kv+QZlm1uywivEXZyvLNq4vRJeEfWfe/wS?=
 =?us-ascii?Q?76WaqHmbG58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UJsnxcIx8eBGeNOtLMfAwo/q6RxMjl37Z/pWWkGfZiwQN725W8h65UwQ+8+7?=
 =?us-ascii?Q?ItGbpdIH3uYHjT+PswLgLjjLS/arSuyc2ENarRnGPl9sk6vnqST2UC4c17Mv?=
 =?us-ascii?Q?NfSiYEyqNdwxEf+lZBusk60JtZjzv141iviEqdg0+lvGKLMnxr+1qkY+sCcf?=
 =?us-ascii?Q?QpQuScsjZQJ4p92f5YGB4lWYt+f5hSqfGN8o4h1ofgZh1AbnxWjlTuTFGECa?=
 =?us-ascii?Q?IPDC/p28lH2zuf4s++GZDp46TXtiqPxS23L1idwfnzLDdwa6Dzrl6SEXceHQ?=
 =?us-ascii?Q?D+TlFMVOc6tNwWTTSHQxqi9cH+V/4nkCTqkSVvFd8Yxi4vO9ZGOcqY0xGUtD?=
 =?us-ascii?Q?o1ZT4tQURtuMMyeIEm07AF0I+OwlCyq0jGWBnc6gpf3z6o1c2dfHRVPbMjWq?=
 =?us-ascii?Q?lJd+ZnPXR/+Ij/aaD3oN6lFZ+PT4yHoPq9ybtAhvxus8k8PmIoAvCRhpC+iX?=
 =?us-ascii?Q?Mt+Tm5U35wHokQADt0gkW5F8BrWbX9eNKgdKjXa1zANE8T7aqoW+YK1jVEew?=
 =?us-ascii?Q?VSKchCAZoja6o2J95G0eX2erYJt5oiOmjeT2vJh22MEeIGZmRDjM8q9jgHPO?=
 =?us-ascii?Q?pjdzMLBRsD2kTHFL+u78h9ieHBDFWuiu294MKKuS1TYQCOam2F+c/56DYo7M?=
 =?us-ascii?Q?53HpEJK3bAtEAFq+qeyRC/t74iskyhOGOT8exTYH3pyUxGIHrAHin0T+SafM?=
 =?us-ascii?Q?3xEPUUkAxfVgHHA2fMKWFq6JkZRE562qpSe9yXffmkCZCvlmd/K+rObiTzf3?=
 =?us-ascii?Q?2o8UJU/U0AxuxOTcrhevSh150XT0bsfLNscBwZtuan9KEKvYKDBMBqroLVyq?=
 =?us-ascii?Q?V+gGuFJTQtOOqqRLqjw0gSTM21ve20ljIYq2hxERg29qgOn6eSB6OVKAdJr5?=
 =?us-ascii?Q?Iw7GAF3p5ww6r4ZWUQUbcvcyxCtczbN2AqJCfSYvIO+FRow2KsT25/Ut9Gp5?=
 =?us-ascii?Q?PIFVvKpJITSrEOJv0NOSQN3Aoe+Otyek+PGEEIiYeOAQPETfifW6PxqWiJUM?=
 =?us-ascii?Q?VcZ44v9H/fNPrLK+REW0z2WzmgMtC6xBCiTTEYWHtCG6ScWHUwYrhsrxzc+F?=
 =?us-ascii?Q?DrNAWPu3ameXrXt3k/0yjMh9T6X8SQ+CWxYDE31WavUKrTHentp4SEQZ+um+?=
 =?us-ascii?Q?pIU3pRvJOLncDeXvjgag1NAvcZRYsh2mjZkKOxN0pe8qSAjtDZTO+hPv21bv?=
 =?us-ascii?Q?Rvw2DAiRRX7Uohdt8IQGwTkc/onnOlGTb9sOrnZZ48b7pB+ewMsPtCQ2VkWl?=
 =?us-ascii?Q?OuSHBnxGtquxjwQG2XG2RS3obaXDK856EZ//yEpyHfa/AKKbqhS/yKS1eUSv?=
 =?us-ascii?Q?orXBDLO1xCvNnj6A9E6NJc5E1D5IBKc6GIXh+ukZMyDWk6nZxC/CLy/ALH5v?=
 =?us-ascii?Q?8xAH7nasLGgIF/2pysamb4W+7iiY0sOl3noZEME4f/Vt/aj9sYcCQad3G693?=
 =?us-ascii?Q?UigKxo8GqNtyN2EDFS8mp0vNpWvESRdMPOfPk0/YEm3lne0Jgm95hamwxPXm?=
 =?us-ascii?Q?CsihDKI9Qlqs88P6lVJ/eo9FhrO6waJo/Q6eToFxDnzl84Hl1UEyL1eUSAv1?=
 =?us-ascii?Q?csy9aLvDHFoX8QZGHTyA3LC+ZNMwgPYHkjY1n/NodH9mVNSASXU3PxHxpNJN?=
 =?us-ascii?Q?jAE056h85zirq1PbZi5O70g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530330e4-4eb4-4219-052f-08dccca86677
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:22.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VljoUuItcn9EV0nVVS884AP9ZhYX1MLu2J+BqI0FwVBgSXjDC9Qpe+i9w3D6HHjeFg4FppdT+hKk+LqhAj5+dFJN0y2aAqryFddVTbQJTLlcxAMDF/BlbnX6IeczyrLJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7309
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 15cb5e7008f9f..281936ece760b 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1237,7 +1237,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np = dev->of_node;
-	struct device_node *ports, *node;
+	struct device_node *node;
 	int nr = 0;
 	int i = 0;
 
@@ -1277,16 +1277,12 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	/*
 	 * Audio-Graph-Card
 	 */
-	for_each_child_of_node(np, ports) {
-		if (!of_node_name_eq(ports, "ports") &&
-		    !of_node_name_eq(ports, "port"))
-			continue;
-		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+	for_each_of_graph_ports(np, ports) {
+		priv->component_dais[i] = of_graph_get_port_count(ports);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
-			of_node_put(ports);
 			break;
 		}
 	}
@@ -1486,14 +1482,10 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	 */
 	dai_i = 0;
 	if (is_graph) {
-		struct device_node *ports;
-		struct device_node *dai_np;
+		for_each_of_graph_ports(np, ports) {
+			for_each_of_graph_port(ports, port) {
+				struct device_node *dai_np = of_graph_get_next_port_endpoint(port, NULL);
 
-		for_each_child_of_node(np, ports) {
-			if (!of_node_name_eq(ports, "ports") &&
-			    !of_node_name_eq(ports, "port"))
-				continue;
-			for_each_endpoint_of_node(ports, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
@@ -1502,6 +1494,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 					rsnd_parse_connect_graph(priv, &rdai->capture,  dai_np);
 				}
 				dai_i++;
+				of_node_put(dai_np);
 			}
 		}
 	} else {
-- 
2.43.0

