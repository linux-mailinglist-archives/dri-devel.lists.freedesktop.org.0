Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9B986A0A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA52C10E872;
	Thu, 26 Sep 2024 00:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Ri2NY8r2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7254010E875
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBE0MfhDbQGM6K9rrZL2dUuUzuaa7tIN0A1evLcnSwFKfwNQSGK5vMq5kXlXsyoeEPZte0NS8tqpClJas81DwDcdwkZOKN5EinfBX2d3MLBD9u9FgjvuyEp/ZoONaYSUXTCwTubdq/2Cz8LMMZQcnssSc29jZ6+PL9zEC2LEKvz09JJ0NlJVT+bUgjmQseEfwAqNogoVuzV2JeVUYbjjqgJzdm4j2Un74CCJEWHAxnnQbLXcOuHCcVRfnz1tN/EaITuQ19mommHsoauujK1lUwWvh0pksldMxgbDCeLsHsbvLHlIPTn6mor+3U48XVVzZveDWRxpH3Z6GGMJMU9QQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koVj8ffD+8N6zaVVjRYsPwOdg2G8Pn8Jmxpzw7JecKU=;
 b=zFeUY5lfetFm6E86a4cmcL6QncVWRLr5efRmDKmNbQWP4tCtFRINqpKCGG8/6LF9ZCrhk0s1RlGpVduv/OE2j7SnJeiX0VFVDbEyoPPZClqdC1w11rmGSVik15VhroZuzCdGTUkU3qx0SX7H5t8D20bb6hGymLWTgXfFlf5BXLOkBDoFCCDAS8ueHGsPx5xa6ofPAzV/SFx7/MmXQgwTtBKtErXUlVCc5MYkaMvaWbMXc2viCJLGW1dHpW1QfRsabqxvcS2fcwGReCBJkA0OFM7prsNpUFUrEERs7Ir+Trc0BqjpNm6Yy4EW5QfzYaHpiR52kILlHjemwuIgbY62Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koVj8ffD+8N6zaVVjRYsPwOdg2G8Pn8Jmxpzw7JecKU=;
 b=Ri2NY8r2UqtShR3PWwhF/2TpUgA/qOyDHvJzt/wEpJ8POhHaX62aXtI87E5JU1N2dCslVeYUZf7UFuQ2u41AdWXM+Y1k6tJ8lgFD0xy3Tyg16rTe9IJaVJIxqCnkpgaN+nv/mQeqDr6USJ4g8mZJB43O1TxYB6mn6M6eQmZyclo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB7353.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:00:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:00:31 +0000
Message-ID: <871q179tcx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 4/9] ASoC: rcar_snd: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
References: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Sep 2024 00:00:30 +0000
X-ClientProxiedBy: TYCP301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b3d3d0-0c40-46fe-9e32-08dcddbe3c9b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZSJ3lUff9gN7uceio5zBIjRtqFdJUw6RKv7qkv7Wi7HoKEN26O0khECLAZcA?=
 =?us-ascii?Q?GDSA/rUFCGwkjkUGjU1W+d1hQEJhu0sHNiYSW1a+3UNUfPgiXuIbQrF/jrvE?=
 =?us-ascii?Q?TXs031FkIqSJ9G5ydmJNAk5BZQheVsaaFJXps6z2CC+xnTi9CympRjZQQa1D?=
 =?us-ascii?Q?hK4ur0Ptcz/rQNXenyXZhVFwyruZIeESAYOqvSzuaJ/rVMkJ6GGjuoK+hxVs?=
 =?us-ascii?Q?YRb3HeT2mZGNSo+a5/vxGF2YrsxkjjgItVvka3PHGZuunNfYeHjo5oWRc5zW?=
 =?us-ascii?Q?JjqF13FrAjGq2XrXOLJBTawxzaAY4ECySylHs+lOSM30oVrkDl+e3gzYcBI3?=
 =?us-ascii?Q?Nm9ECewZr+TUnP7qbzTJAEEtFq+iiq6qoBP8T33qe/pT9qz0zPx8guiU0odT?=
 =?us-ascii?Q?wHBlhNBmL+++bdM5WT4uYaRqnuAFJZsiBGNrSbGBjeelRpjcxakSyEnobF1N?=
 =?us-ascii?Q?QDt7Ng0syQVfVJH5uqmFm0sRZ2DN5cDxY+DR64cwf73cGsiLG/XZ5lCCat+A?=
 =?us-ascii?Q?Dw7i+zy40tv4y7u6qIrQjHNByZPEbsFvnzXkkB3xLVjzcbR7AJePYBeM3RjT?=
 =?us-ascii?Q?1bmLvTieua6Lks+C7xyOZFPOW5PwwN9A2jmfgV9Dak7cZhSIUrIoqrGd5qr0?=
 =?us-ascii?Q?7D5iJipO3dVfTV45+6VPy6Uy6dv2JOLsWB/PmBQ1T17E2DXy9K0h9lNJz/k8?=
 =?us-ascii?Q?GLRzkzZyF3BJ92jrdxAIL7nJyGq3oEYYEzwz4zukOJlQR4KkWvscKwORv/Dm?=
 =?us-ascii?Q?WNIUyCfW4XiDHq1p5KuZpYpLND77Pq6TAt7f4JhZKCvHrB2EZhgC+6kUSjWl?=
 =?us-ascii?Q?3M2xX4Ctey+0C7OL61ndtQOE+Os17RnRQIv/WohecUWrEcQXAMBj5ar7iUuz?=
 =?us-ascii?Q?21wrZqcb+ZQ04/yvHOZo7KtZRSZ96PHWPvmra6RZNb5bwWWn7RYHeyckqkDC?=
 =?us-ascii?Q?buhwIKTVGQ3y8DJVx9oa//HMVrpKbkKasFE4AKkVe+g7cLHc+Nt6vFoFwnfa?=
 =?us-ascii?Q?fI2RoIVfDLMpWSeWyVqWjaEqU5dWoz39CPfkWfnls9p2OHmbRhyc4n43eTbj?=
 =?us-ascii?Q?kJPyqlI448uDToUxvkMGMpbVIx5sGc6OxzgK8TxfYsNfJG63JJGI7oYBR9Va?=
 =?us-ascii?Q?VyPvGGxydJ6v6g+TdQDS0BmiqvGpZcTOpgal/KcWXOdymrVC8rDvfX4dZ+3e?=
 =?us-ascii?Q?8izq5MlWq9yUV5v9051HyYbpSHnDHlF6p58703A0FXGxv9jqOLNZmMd33J6I?=
 =?us-ascii?Q?a1zjkTQTzI9j9VEF96VQsKgo70E3DAFiyMJHcBDrXHAnClnbImCtJ/IZuLjQ?=
 =?us-ascii?Q?bkNfQfTpQflf9+i3h3cwCZOa8ZwfeKFKxSISyc+TtpMWoJEpTTnhKEO13+fC?=
 =?us-ascii?Q?bNoKgtxgoMIXjueSM6xKXTZ3Az7bkyaaKg/zmSaWLw9LcUQu8E/vj82WIMe0?=
 =?us-ascii?Q?J9k33lOPmSs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+6+1ulBT/dI8Lm/6ZAkxYSRvfk74xQWPdmFVh8Peoblz7APHmtsRUXsgISrC?=
 =?us-ascii?Q?G7vZ++yTFWbfU7VJRDqsyOgSBas8Nn0gd8QHWeDjZePkamko3jzD/MHFmKC1?=
 =?us-ascii?Q?89KmpeX1JKXz21ZR71XkdDXM02L/7y0Uuv3XxYhRy/OcScNok8ZHOwtqtAX3?=
 =?us-ascii?Q?zKkv1I3BI17cKfkpmUNfv7O1CgItZ1kMaCN7/+WnqfzGBg6Y+qU26jX/je2a?=
 =?us-ascii?Q?9jGED4zcc/n3oTvqJEff9/qKmH+88xNk8FSwm0pslilZVG8q3N0kvW2W71f2?=
 =?us-ascii?Q?BNLJ6pl6lFWLHbybo3LqpaDZl95P4pNyojugJYJKchl7BWeg19VW7LXSHXfj?=
 =?us-ascii?Q?cz/SB0esMyPkF2VRQ86xeAnchDN9s4hf1W0kQ6xTkN1F+8TbCqA3DSSVOAoZ?=
 =?us-ascii?Q?shOPlQM9w/XIwGb6GEBvfKs+9mn9UgLxY4Z6Ffr8QzPGUZLXlME8+yLQfT2w?=
 =?us-ascii?Q?8LJ0gciZkFF6eTMTQ7iFSOjoCU/SFO2SwC/1Poz1v9dTg/TF2SEEdLeZBHhW?=
 =?us-ascii?Q?eA9HFKLosXO+wtFAKt8HngjO75UGkBvQ1IcYPrHBlu3JvbIfC/tF51XAuAFf?=
 =?us-ascii?Q?gUwqyRpLwLMygRi3Nnu0T6iP02P5e6jZ4FGq+9KIytS0FAyYGC2YLG7Zc8+s?=
 =?us-ascii?Q?bT0giXRkHke3mbVRd8YvvNZPbeHeAW0rlHs0HwbDNoep/7idq/kPNI1CBszV?=
 =?us-ascii?Q?tLSL792B47iTWC+SDIgfYrUKyHXrtyIq8zLNv9f4Rh9cVYjARM4DKKVIy795?=
 =?us-ascii?Q?J4J+70J7HQc1epHvZTW3slDFsWDxWKe50OlR34CWhIpcx8iNoRjl5HaMnzZQ?=
 =?us-ascii?Q?ISPLvvaP7o0CUzRQI4N+E6CNnddL4IaE89Nh/v3Z716AzjrLniYFCEMspaI4?=
 =?us-ascii?Q?YiNhIq1iPEXcorUT/6m6gkCF7izzp1PnR2WwjhDrtrLVhEvd5TLnYYSx9Wgl?=
 =?us-ascii?Q?GttVz+TncbH/4fDTSYnTr3oAUt+16XhxxprXImA9zAWEIk7gxrYUR4oMcqdO?=
 =?us-ascii?Q?dgVAMUfZ1ALGVjt3pPV8loGY/2oBX3E4DdDt+/iEWRKgYgKLHirUxCguhpPy?=
 =?us-ascii?Q?II6e/MXzJhyI7zgsf3sfYzhHzj5GTbnyWeGR3pJR18+g1eMqca141HyvnObu?=
 =?us-ascii?Q?2XpD7g1/Xopokuh8OH+08swecAj1hDN09LZEtO/rClqEHR34Uv72FOy8tBRV?=
 =?us-ascii?Q?Fk3Oo+RtpcHksgXkelrR2Vyqp1epf71AoEyw5r0+TZSuW5LG23AKCM09+TXE?=
 =?us-ascii?Q?Frn28coeaAC9PsBW7yZwsX9f7wjAUba4diKnifOa/k5lzohKRlbWIh3Owpmi?=
 =?us-ascii?Q?kHfnj/0cCnFs6TkTYX8llr3/EBy9uKzEhTUp0wxqXNEVedqAEhc8qhvQZGcX?=
 =?us-ascii?Q?zTletkKCbaTpbBLYeALPHzM1dUKmvfl9PRv8Ay89OmBvOv9ny+sY9uJxb2y5?=
 =?us-ascii?Q?Nwdu9nfRG8iVAA/wSNXcEIHQ9jWTFXpRfTvgU1kMXspEHRpU4rLRkQboHkhX?=
 =?us-ascii?Q?CSe3KPiXYtM4mNnwWqYWCx6HerLEOiE5e/GKYfg98N1g+yZ1YLzHtWrIcfBx?=
 =?us-ascii?Q?UUTaEFCT+pXINpM0FK2mufB+B/GO7nmuGyBRIKwfesbAG5AMC+QOH9lHdsSd?=
 =?us-ascii?Q?0DKQBEU40gjtjRDE/J/RMwc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b3d3d0-0c40-46fe-9e32-08dcddbe3c9b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:00:31.2250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ig8VZ/yeawlEm9DAmhkisyHvTyf85/O+JLb2hKdUnHI7Mm8PI2JWZ5uBl9ZMtQwgfcLEF9D2xsbA0QAT21UPX/QzUGkdW+1IaiqstcBbA/ONnx7xlvoozbUSb3MuUuMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7353
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
index 9784718a2b6f5..a263e50cccd4d 100644
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

