Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5849AD9AE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E2910E88E;
	Thu, 24 Oct 2024 02:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Ph0tH64X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3DA10E88E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9io8eVfK6HIEcBAgyqrmOsOr2gBYWaQThUs4bB9Jl0fzL3yQ627SpD+yhx6H/Ra2Dp3MtgIgpaKddhdyJEUcDPJU3U3EJxcknOere4ILri70/Lns/1VAClsgIE9OWC8kdIid2aBRV2x7CeqYAtfnW4KMoRVyGtF7+oa6WltkeOsx4+04+WFWnoIq41LUM7K1qLiajeiKUvW96gE8813xKimPN0juw6yqnodyPJtXarlcV7OuJaZoFxA1UO801vD1OF7PpVq6s5qVk/iozwtbXrMe+h/8KBm2qfhqQwFj0/M6FpB8eAw8peUgQV+yV/kUcQr9kao8C6pLJlq8HvK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrWMpjt2fcUpvD0bCD5iddrf019/xghmFRiFAtCDjEM=;
 b=dwCAX3QOdNpUXYTPitUmRNsZhsUFoRV55BN4J/D4BHdwcKimMaVZF0ij1VPUXyZFLnisQTcRzPvusK4IddRA7PCjOKp6exU+A6qcYjMNkyCA68JfCEnUqTfUhKPvrBD20lewLpjquEGFnY6Q51T9h5aQEFE6BAyYnrMoIvZMe7KrshplTGIpzHIsDqIuRpzL7Fbc27pgnNPQyUv9iCt30Ja2QFcytA5XD914b8K9PihFFdxJ/EfBSJUJKifOnVp6qN36EVrDKurcaGuIwDmFdbwxS0tr/+JLv0og8eKSBKPiEe8mT4Kg0K6AeAGqD/iVdfn3hi0pVZFlHQhF+d0isw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrWMpjt2fcUpvD0bCD5iddrf019/xghmFRiFAtCDjEM=;
 b=Ph0tH64X+1kuCN3QdqAS5m9kI0/tPFGkxBl8pyb4pDRHSSXdcZldchRkZwgBcAjbivTVOnKS2x4S2MxaUEHLRNwlCWvir17jtlxgRAcIOIFEh0K8IZiatGS8xb7cDO90UEVxw0Esx7YM7SvNvcdyDzT7NtOnaX5v9n61Q9TERb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:26 +0000
Message-ID: <87ed46b5sm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 6/9] ASoC: audio-graph-card2: use new of_graph functions
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
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 02:20:25 +0000
X-ClientProxiedBy: TYAPR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 627aa038-750a-40a8-2892-08dcf3d26c17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K5l4SzePha3SXfM2Ps/EbTazLRmXigdd9tgTi34gPQVOS+S6RSHQpEUct1pB?=
 =?us-ascii?Q?yHV52dCyR3NbKB4L3Wwa4DJ10PPDPRvb1QS1DiGTrbU5fv85yoqvjxYADikV?=
 =?us-ascii?Q?oLAyAy4M2uCnVkwPXSfCKxt2L1bvhgrap5VYFRMdIwTZCNL759kS35Gjy1mR?=
 =?us-ascii?Q?94hIkuaX9QoqQXk7x1agYusneanbpKkkL3mZT8d+kM7APZMm1inBZ69Pzk67?=
 =?us-ascii?Q?uVc418vQ8ht0tyzTIIxG3I4rOUY/XbN0sUXVP8hivJxmi1F7m1uVOZ5yK1Vz?=
 =?us-ascii?Q?v8jOwwtDHjiNFnWXbFO8hb8Pq/qIfTdtMO/uJZXzIb4FN8yJTebSWyBf+z0g?=
 =?us-ascii?Q?tyYE6UvAOxJx7ZzydA1DH66qCMu6v3OtIkNfNf3EMnZonWgCxL1WSc+g3eMN?=
 =?us-ascii?Q?RgdEL4ex9ngSx9i0MQRuIlIPmuseWTdPByUvqhmW69/o+glxxOcnT8KUazZj?=
 =?us-ascii?Q?P3U4doPA1a2z2jvoAYoJChB+Rj4K9ZlVlgJEulv6cEEbj8JO/LVtJK1SwQP2?=
 =?us-ascii?Q?khve/lGJM9EXKSgLJgE3OK7yFP5iJJ7XlsL9mO8fStMgV35fub/4rliCDKJO?=
 =?us-ascii?Q?N2O8wGexh/J8tFParDaoiqE2pTqCoaAnUf2l5tTCxcupQWy+CbZfIGmoKcXW?=
 =?us-ascii?Q?nvhoRrFuGxEWs9kXl5T1G0UAFcUKRH1waz9rC0OsI8kZ5EZgomvawouL2YbH?=
 =?us-ascii?Q?cHxrVThgjlfAMvahQVuqoSLgdZrUjvWk3qIUwDPx+ymnt9EBi59AfAbP9EI3?=
 =?us-ascii?Q?Y41ZDmvSyhnCcnEIC/PQVqlNUmdSs1Xirie/T29Wc5HXeYv39aRdjklkjlgV?=
 =?us-ascii?Q?CcNqzV+X9DJKfKWuBJUwIiA621Uuc0j20somJjIGePSXec6rAU/sEV2Nm9PY?=
 =?us-ascii?Q?JVDRkznr3opWLlIcy81QT++HWJ/0hDXn58Rwbl24WDgyYAb7ADvcGrNdAiZB?=
 =?us-ascii?Q?sWriJiidC8ciKZH8Hhf96D1YSJRurmaSNeVhwovS0hDTirzQzy3EnZNSp7P0?=
 =?us-ascii?Q?HUXDSz997T0ImfX6fIe8ToL0u97eO5NdKJCfqvNsaO+8AiJbalgz7LTuAHSy?=
 =?us-ascii?Q?vY/e3ZcVh9VO07tfBp8WQqDXvfr5JEBpZ43JDR1BsQDzkLi9I8xBi99uFmPl?=
 =?us-ascii?Q?npY4OvGqv8oVcdO1FYdSYnnd2dd84tDsVd2PYDnjTlTgAfIlLzZiccvwTjZC?=
 =?us-ascii?Q?LIM49r9gV3N2DjsbdNVOa12mdTCIhFaNjAaJ++5B+mmMiv2Wdg5lzP87Z2+D?=
 =?us-ascii?Q?SzTCdVpjlq7wzKjak+7gk7XDTbJe6y0sfJoDySuy7F3FNbq34sBYn831lYP1?=
 =?us-ascii?Q?zGlXsvTwNT1wsCKSj32wJUpuN93/9K11z17Mm+vbhnruHP6wEv3HmDdX19jc?=
 =?us-ascii?Q?hbKhmB91Y+3ABjdo2PY/USdG1zUe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HfWQQ66daHTzZnDDN62ptN/jbixJnT5+Q4X0irw0tuv+D0r3RM5henG7chP2?=
 =?us-ascii?Q?NJDJJ8r1on2iBLXhyE6dsx7VrUIlDgxAWuBZ6e0VPWnaJNVoYtLfm34JZ53S?=
 =?us-ascii?Q?2TWBsJamGPdslNWNemKtt87NcTtBKlVoFSTdGNdRuvwk6jFZfxqqfx0Gw6S7?=
 =?us-ascii?Q?B58dBmXKXyqnhqHMVITPMY4PXqsOoidpxxAdMQyjD1ospQhHnWf7BZf0Dnql?=
 =?us-ascii?Q?PRKuiKGDbwbErrsltWRFQFQTIEcslzY3PYSeb+xti0ARP6u8kNBCfE9cIJDy?=
 =?us-ascii?Q?Wh+jqg1DHNDfASNk39w2tUwwxL+xg/k53GNYXt7VGAsswOL/ffDK4jr3m8H7?=
 =?us-ascii?Q?0KrrR8LhkL6uKmWpaD+lWeh3Z+uOMGskad4gns4jPjmCzM8SXV6tsTtVsl8j?=
 =?us-ascii?Q?xGfA09LPIX092MG5lCRx+CiGpVZh//Bgssv4E5+lztKh0IIwXxqjcZT37CvT?=
 =?us-ascii?Q?ITeh+B87NxzTdnEWDxxbJp11xyPy9O9flM3VuuC4EraZ6oivTkH9YJoDqr2a?=
 =?us-ascii?Q?SXf1qbEmJDIf6sGg+vrNVWhbqESu4LOcHKHrSpCRpYxP2/BpZ5egJFVug2K2?=
 =?us-ascii?Q?TFHh9fPpLU/IYnIwLHOBxNAF0Vya+LU7Se8/mY6Lilzh1FB23gcQdjqe6lMe?=
 =?us-ascii?Q?mFzsfXRkDzDONmpwiDzStjbKF7nS1Ppu9ALipNibJ5lnVEV/zopTqYdH9sP+?=
 =?us-ascii?Q?G3Hgn6tJ1trMQ8EMoO3RpWIxiMHvh0Y9bvaJ3rF4Hf98T+B4u8F0KgBuP5Py?=
 =?us-ascii?Q?Bb5LgqeNRcZ0q0HrKqxtW1bZ3SN5iSlT4nKMceu6qsGQOFUPRSz73ABs9wRF?=
 =?us-ascii?Q?9fbDjrssJfeoSkul610KOIX83OPyOoJvuGPOceAavYaNa7vRuUFIT+UfDui/?=
 =?us-ascii?Q?vY/uPwqidxz9xpX+5F730UasA3oM0mR4xF9yt/0Sh3n77l9r4+wybtkJms4b?=
 =?us-ascii?Q?ph12VkES4GMTPgctlLXrqL/9BeXXAt3d/i4VkzY5Ssrz4clHXu0K06e7rCNi?=
 =?us-ascii?Q?a4dSsZOLdffG7zfs3i0rxHtfpNKK7zwLJEM7pSdsJT0/FZP2UhsG0vR1iktv?=
 =?us-ascii?Q?nKvZIABmNgujgFpiM4zvVKzmzrwLUCQL7TJP8b3RqBd2j+0qIJj6UhJpQlZX?=
 =?us-ascii?Q?H8IAvurc64rUWlx9pXnL3Y0Y/SXn4JpWP0PZZ0Tz2nILCVrPnO/FlRrUfGv3?=
 =?us-ascii?Q?HV5nZ4I8OVu+UBpshPy68yqjE+7s5PLQNw0hColgW6BerP0D1jMy5MnMOdPe?=
 =?us-ascii?Q?tEwM4PHvdegHxxYvXNvN5N2C5fqVqxBqTSocRKQPZ//d4caez8+cibUbX6++?=
 =?us-ascii?Q?03boQWLCyYIjav972X7H/7oiKGLSVQwOt64Um7iQ9D1l4usCJmoyLX6Iz9br?=
 =?us-ascii?Q?sBwK+pFhE1/3OFWHr45+Ntv+l1dG/C9HTUL+RwGJrXSYN5tNwhah2EAC5k4V?=
 =?us-ascii?Q?GdEJBsHlpOEYNEUdSqKsdLUUTJgPo2s/Py/PsTt7iEd4kdsELdNM26KqOcUs?=
 =?us-ascii?Q?nc5exA0T6H2RmvK6qBYQFqGQnIutqdAIoikJzuDHAISHroOYLGfBzqHN7U86?=
 =?us-ascii?Q?9S57cSW28E1FDvgVSUOqB7aKzGU7A7SReCcg6annE6WRGTVIbeib18E0eB3B?=
 =?us-ascii?Q?IweJPElYPC7LSW4aQPGbbwM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627aa038-750a-40a8-2892-08dcf3d26c17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:26.3323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bPTPqoVjDOeZPZ1elVDcfBFX9+HnSdpFmC8fYbQtUE+pwZi4Ey3gNu0uMu++639itziDF0Ef8ctxfR9L/8bXR3norhZh06uL4k6qDGnXR3zCRLqPRj9pOq9NR+yjhSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629
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
 sound/soc/generic/audio-graph-card2.c | 104 ++++++++++++--------------
 1 file changed, 48 insertions(+), 56 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 4ad3d1b0714f6..3605a6b2c7820 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -234,8 +234,6 @@ enum graph_type {
 #define GRAPH_NODENAME_DPCM	"dpcm"
 #define GRAPH_NODENAME_C2C	"codec2codec"
 
-#define port_to_endpoint(port) of_get_child_by_name(port, "endpoint")
-
 #define ep_to_port(ep)	of_get_parent(ep)
 static struct device_node *port_to_ports(struct device_node *port)
 {
@@ -351,14 +349,9 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	 *	port@1 { rep1 };
 	 * };
 	 */
-	do {
-		*port = of_get_next_child(ports, *port);
-		if (!*port)
-			break;
-	} while (!of_node_name_eq(*port, "port"));
-
+	*port = of_graph_get_next_port(ports, *port);
 	if (*port) {
-		ep  = port_to_endpoint(*port);
+		ep  = of_graph_get_next_port_endpoint(*port, NULL);
 		rep = of_graph_get_remote_endpoint(ep);
 	}
 
@@ -530,67 +523,66 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	 *	};
 	 * };
 	 */
-	struct device_node *mcpu_ep		= port_to_endpoint(mcpu_port);
-	struct device_node *mcpu_ep_n		= mcpu_ep;
-	struct device_node *mcpu_port_top	= of_get_next_child(port_to_ports(mcpu_port), NULL);
-	struct device_node *mcpu_ep_top		= port_to_endpoint(mcpu_port_top);
+	struct device_node *mcpu_ep		= of_graph_get_next_port_endpoint(mcpu_port, NULL);
+	struct device_node *mcpu_ports		= port_to_ports(mcpu_port);
+	struct device_node *mcpu_port_top	= of_graph_get_next_port(mcpu_ports, NULL);
+	struct device_node *mcpu_ep_top		= of_graph_get_next_port_endpoint(mcpu_port_top, NULL);
 	struct device_node *mcodec_ep_top	= of_graph_get_remote_endpoint(mcpu_ep_top);
 	struct device_node *mcodec_port_top	= ep_to_port(mcodec_ep_top);
 	struct device_node *mcodec_ports	= port_to_ports(mcodec_port_top);
 	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
-	int ret = -EINVAL;
+	int ret = 0;
 
-	if (cpu_idx > dai_link->num_cpus)
+	if (cpu_idx > dai_link->num_cpus) {
+		ret = -EINVAL;
 		goto mcpu_err;
+	}
 
-	while (1) {
+	for_each_of_graph_port_endpoint(mcpu_port, mcpu_ep_n) {
 		struct device_node *mcodec_ep_n;
-		struct device_node *mcodec_port_i;
 		struct device_node *mcodec_port;
 		int codec_idx;
 
+		/* ignore 1st ep which is for element */
+		if (mcpu_ep_n == mcpu_ep)
+			continue;
+
 		if (*nm_idx > nm_max)
 			break;
 
-		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
-		if (!mcpu_ep_n) {
-			ret = 0;
-			break;
-		}
-
 		mcodec_ep_n	= of_graph_get_remote_endpoint(mcpu_ep_n);
 		mcodec_port	= ep_to_port(mcodec_ep_n);
 
-		if (mcodec_ports != port_to_ports(mcodec_port))
+		if (mcodec_ports != port_to_ports(mcodec_port)) {
+			ret = -EINVAL;
 			goto mcpu_err;
+		}
 
 		codec_idx = 0;
-		mcodec_port_i = of_get_next_child(mcodec_ports, NULL);
-		while (1) {
-			if (codec_idx > dai_link->num_codecs)
-				goto mcodec_err;
-
-			mcodec_port_i = of_get_next_child(mcodec_ports, mcodec_port_i);
+		ret = -EINVAL;
+		for_each_of_graph_port(mcodec_ports, mcodec_port_i) {
 
-			if (!mcodec_port_i)
-				goto mcodec_err;
+			/* ignore 1st port which is for pair connection */
+			if (mcodec_port_top == mcodec_port_i)
+				continue;
 
-			if (mcodec_port_i == mcodec_port)
+			if (codec_idx > dai_link->num_codecs)
 				break;
 
+			if (mcodec_port_i == mcodec_port) {
+				dai_link->ch_maps[*nm_idx].cpu	 = cpu_idx;
+				dai_link->ch_maps[*nm_idx].codec = codec_idx;
+
+				(*nm_idx)++;
+				ret = 0;
+				break;
+			}
 			codec_idx++;
 		}
-
-		dai_link->ch_maps[*nm_idx].cpu		= cpu_idx;
-		dai_link->ch_maps[*nm_idx].codec	= codec_idx;
-
-		(*nm_idx)++;
-
-		of_node_put(mcodec_port_i);
-mcodec_err:
 		of_node_put(mcodec_port);
-		of_node_put(mcpu_ep_n);
 		of_node_put(mcodec_ep_n);
+		if (ret < 0)
+			break;
 	}
 mcpu_err:
 	of_node_put(mcpu_ep);
@@ -674,7 +666,7 @@ static int graph_parse_node_single(struct simple_util_priv *priv,
 				   struct device_node *port,
 				   struct link_info *li, int is_cpu)
 {
-	struct device_node *ep = port_to_endpoint(port);
+	struct device_node *ep = of_graph_get_next_port_endpoint(port, NULL);
 	int ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
 
 	of_node_put(ep);
@@ -769,7 +761,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
-		ep_cpu = port_to_endpoint(port_cpu);
+		ep_cpu = of_graph_get_next_port_endpoint(port_cpu, NULL);
 	}
 	ports_cpu = port_to_ports(port_cpu);
 
@@ -779,7 +771,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 		of_node_put(port_cpu);
 		port_codec = ep_to_port(ep_codec);
 	} else {
-		ep_codec = port_to_endpoint(port_codec);
+		ep_codec = of_graph_get_next_port_endpoint(port_codec, NULL);
 	}
 	ports_codec = port_to_ports(port_codec);
 
@@ -850,7 +842,7 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 			     struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 	int ret;
 
@@ -883,7 +875,7 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rep = of_graph_get_remote_endpoint(ep);
 	struct device_node *cpu_port = NULL;
 	struct device_node *codec_port = NULL;
@@ -1007,7 +999,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	of_node_get(lnk);
 	port0 = lnk;
 	ports = port_to_ports(port0);
-	port1 = of_get_next_child(ports, lnk);
+	port1 = of_graph_get_next_port(ports, port0);
 
 	/*
 	 * Card2 can use original Codec2Codec settings if DT has.
@@ -1037,8 +1029,8 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 		dai_link->num_c2c_params	= 1;
 	}
 
-	ep0 = port_to_endpoint(port0);
-	ep1 = port_to_endpoint(port1);
+	ep0 = of_graph_get_next_port_endpoint(port0, NULL);
+	ep1 = of_graph_get_next_port_endpoint(port1, NULL);
 
 	codec0_port = of_graph_get_remote_port(ep0);
 	codec1_port = of_graph_get_remote_port(ep1);
@@ -1144,7 +1136,7 @@ static int graph_counter(struct device_node *lnk)
 		 * CPU/Codec = N:M case has many endpoints.
 		 * We can't use of_graph_get_endpoint_count() here
 		 */
-		return of_get_child_count(ports) - 1;
+		return of_graph_get_port_count(ports) - 1;
 	}
 	/*
 	 * Single CPU / Codec
@@ -1158,7 +1150,7 @@ static int graph_count_normal(struct simple_util_priv *priv,
 			      struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 
 	/*
@@ -1186,7 +1178,7 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rport = of_graph_get_remote_port(ep);
 
 	/*
@@ -1228,9 +1220,9 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 {
 	struct device_node *ports = port_to_ports(lnk);
 	struct device_node *port0 = lnk;
-	struct device_node *port1 = of_get_next_child(ports, of_node_get(lnk));
-	struct device_node *ep0 = port_to_endpoint(port0);
-	struct device_node *ep1 = port_to_endpoint(port1);
+	struct device_node *port1 = of_graph_get_next_port(ports, of_node_get(port0));
+	struct device_node *ep0 = of_graph_get_next_port_endpoint(port0, NULL);
+	struct device_node *ep1 = of_graph_get_next_port_endpoint(port1, NULL);
 	struct device_node *codec0 = of_graph_get_remote_port(ep0);
 	struct device_node *codec1 = of_graph_get_remote_port(ep1);
 
-- 
2.43.0

