Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8600596B11C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF6010E631;
	Wed,  4 Sep 2024 06:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="UfL1yunI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2C810E631
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqmj5F2F02DH4KB3rYFUgGv4LQiKnB5VNbSSrHLKK6ep8NzEFGhlKX6zcQ36YCDCtBI3ECfNR9vComL4AVrMpILkDQpU9jL03SPRHKNynjjNpv+qVb5v45C5b+qc5ZkDVFKEBWyHeOg0RkxfksPiR7GdmUBeFIXd7kndrimTpGTO46dWnuG26dt6R+uWL0KgwmT+ndFiwd5VHYDef3QOj+ywNx1eIWsNTEtnTJESkqBS2p0lDJMi62NyWWBnoLyD4py1hGyL8/vOGkss3mch3HHeJ5fB3DUneg87G3iQOcGa4h0nFzQ25dZK5Ehaw2RRxdyKhuIOa/tCZ/K667sljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkJ0ltVTSz196uhSee9Ig9BdLX9O4PwwW/k2og7b4lU=;
 b=qLbho+J/8b5DUWla+TzbNzesOYdFQ7Ksnw71DBDDqUGDkHY3HZJrRpa009CAbmzfMzWrCMajG606Bw36AfqkuBQWASE917/R9gwUirYb8pO9nsKtd2RLYlcAmSdXkhzMub/zqPvUzIjlSZ0ZDT6ilOcqN8Y6VoDl2AlEoF6GTkbJjzsfuE8+WdFleWY6One/IDmd6xYgfl+wE7x7/5NOFhOo2aRzg0tdnZ5Ncih06S32hcW1iG5qb46TjQ5b2cLJMbMIKtjRpXVvyXar4959GJ3bVr6l5nqlNfdhRqOBjHC+WI63NBoV5OBddhC8QpNMmoakw6AcPxP3A2pheVPmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkJ0ltVTSz196uhSee9Ig9BdLX9O4PwwW/k2og7b4lU=;
 b=UfL1yunIWjvGDBYuz8YJSRcyGd8dBYGUuNoG35qC4xVo12v2OCWPRX4BHdZoX1Dlb1w1IFCpZ9SRxXqAoEoYw3MwtnYcPFBRtlY5B1TcccIHPfJw/WrHPCMe+UJmpcCCxoBc1MmQ5GU/hHhqrtMW48mGgpX2z6YjCM0BNzNDfik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:29 +0000
Message-ID: <87jzfs6j8v.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v5 5/9] ASoC: audio-graph-card: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:28 +0000
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 625349f4-7eb5-40e2-c536-08dccca86a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i1+rq76tDMQT2IbP7XKNuxWAufYjWNQ56RLcz7b+YA9/Two2H05wBEXb0KIS?=
 =?us-ascii?Q?6PXWS0iSJwdcYvA8GG5eVgyAbkki8coZ5HGM1bmwPLcQdYeIgC7PPUrDPqhq?=
 =?us-ascii?Q?mQSXLlgUqs/Ni5wo7CxMOgFBYKNDypnXRfY8MXa2Y+r2tyQwHkFS2gwd00Bb?=
 =?us-ascii?Q?DTtHY3u86SFmMCBJe5ko4cGwbjwg7CGBvhBELJi9gBCewjGSmhP+3d8jpY6j?=
 =?us-ascii?Q?RURt1ynpvNLDkC1y0GEOaHp/N5yuAoyyaD1P82oTWASKXanhu3R6DWF6dmhA?=
 =?us-ascii?Q?hqC5DA36rWffeuREk+ZYsfAYBCVCkvw+Jd9pCZaD1jjWbwZH9XYBSxlkjmKs?=
 =?us-ascii?Q?Ezwh6XR5T6lTROGiKy426M0hRWHszRO8LySLFXtRfaTq0n0lSElr+gNNktBl?=
 =?us-ascii?Q?WL5mFNLdtQLGe81B+0CwDRgWNCFbrdMskroD6EH7GRjN+beiKPxXOiHMmtKP?=
 =?us-ascii?Q?anlWuR0sb8y+6YZm6x9HB3zHXjE57jP2e1fSqjpHHJhsisRaUW8jakejFTVj?=
 =?us-ascii?Q?PzEnpj0zHW6Qmx5hoE+3c3jM5rFObySg5x8kUyOah7FSDncdWbNQHFnftRhd?=
 =?us-ascii?Q?nao/g7r/Y/rWYZrswLgc28JFOP4cqbH95GOh06Ms6ls4CmDzjAX34JEZV1WR?=
 =?us-ascii?Q?vmDs4tJW3EPpaDKRJAxt6nKLTeAFtEqWvy+AUFSr7KjmaMxxHwJyWkCtYF5x?=
 =?us-ascii?Q?pXiXK0CeAPlQxat0k7Skbu50thgkc3GAej1bc+PNsHF8RWlvCD1LWA4kq9FK?=
 =?us-ascii?Q?Ab/DyVJZIZ3EXdgXblE1YfeKBD32EV/+YtdeII8OLUlI6rLiQ7rXa/5lSn1P?=
 =?us-ascii?Q?HiKbVeRVC2l27FkM3dgQ1q/xX3T2XEwkwZbzU5FEnxfW1K4puqH2ywEyA52O?=
 =?us-ascii?Q?6pLBhc10Ub0zKKmzwDjCfeqvgirSEzLrwnIcCIWBjmGMmj7uaANj7jf9ilbt?=
 =?us-ascii?Q?cIDpaDSFxXEy3TIRzRdysh4r3/AiZo4wB2sdSO+kQX6rwZ9BX+55igTJbAjO?=
 =?us-ascii?Q?8BKAl8SrJO3G2n9niQpyz8mfkU8MlPTZcUuP1KZnShYhZaCnazTEjZW++vAY?=
 =?us-ascii?Q?c71IKQQPoMVTb8Mo0xtpzhFpa80+IjczSPypieO2Dgifm5EZiTndsqC2OgGq?=
 =?us-ascii?Q?K8iX7wIsr0nlAt3tfMh4JINvgRfyjspoDE9uXPgYvMMf1LFabFSwVH8umc60?=
 =?us-ascii?Q?KwOUmHlmaGmsxAm9UD+G0Jiyj11dAcxvsqCVGKDj+IufCryvStduU6MpNZr9?=
 =?us-ascii?Q?Qh6NHkehBLC7w+j3HFERooId3zL0KcfEbsMa8btQ/GRfTz6kJHkvnySH4bEF?=
 =?us-ascii?Q?j7s7jAFgFpowQ70EocmjNnyO6cA3zcL4qV0wvPeVA9Zhv5+4um0OHn3oIeSx?=
 =?us-ascii?Q?fJue+uiO16ZLtOXe7Po0LD7kCPuZLYVLtmY2AI8QVsezQ6GyDokXcE8qEd9p?=
 =?us-ascii?Q?yems7SpnY4c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RumwmWphBVA3nd04yJabYWeQTq5ehcVlEfZBB2+iuPYAiX9iuLdNA5TlfMM1?=
 =?us-ascii?Q?1t1X1B5iPVv03j5fGLtlhd2DonU05BhztOcQaT/joR40AYFlZNDyhiORkM33?=
 =?us-ascii?Q?uYlVV5ZN2x/+vqY4tmaK7Fz7wN64bXY/U3mnxO2VMM6UaOBZxkiEhSplzgrU?=
 =?us-ascii?Q?m0FLIQJdQVzpePUh1yQ6ouJZlsM9hLGlR6rz3z3wEuk43Ckl32ciRymEOy15?=
 =?us-ascii?Q?GeICjeKarNjz0jTSJ0CICxyO0HgLvcA5xWPi2V90S0RHTgSEhrhqzWs1u0ua?=
 =?us-ascii?Q?lMkpJFgljMKViljqGer+nWFWz9cE8JXE5G4KqY+OH3V3DrCkGRQ81ociqg39?=
 =?us-ascii?Q?kj9GmOFMgQQpIW9piXaNgW/V3EXsdVtz7oc4UhKDLnD3YgZS0xwHech/bL1/?=
 =?us-ascii?Q?zQo4lm4fhjvW6mLhA+BTp4uOO/Lbh1viHYEffLF4xQy3+q7V1t+CA57Iv1zi?=
 =?us-ascii?Q?i8eNZoOQT1aFvcrdYNohyPsc+G0KqIxkVXuZfU+A3Y4kZhJhn+orY+H+h80N?=
 =?us-ascii?Q?gy+TNHHnKPIGlYrE2UPPQMVZyANoa4oca5KlzgAqXXM8waB6LAmOvBFrxHfi?=
 =?us-ascii?Q?q+pxIV+chNLLPDrqYCbFJKdlTfjDL5BwNTy08wFtmj14SvRk3WmwQSdhwYbI?=
 =?us-ascii?Q?YEhjagqVYC+zpkv4BKgqB9PksisbVo+zTECd0WopTXoZdqdoibq8QTSdSRWr?=
 =?us-ascii?Q?bIDs1sEL24UTzgtJUMI0r8fgK1FPOha3JSqvBr65ADYAWdNnqPvbBJq/MG3k?=
 =?us-ascii?Q?0HBveAdo9Qixx/W9tmr9LHtYMx3Wbnzrw8E+UDDMGi4Y84qD+3gCe+WTpS4f?=
 =?us-ascii?Q?Jrwco2+o4sGayvuW+DEHk1EexY462/UP4XaIRWPQkvYtBPuf/Wz2IU3iCIGD?=
 =?us-ascii?Q?T5gsEwmV9WC88NmnWZyoPZ5RExjkFV8PioGvi+neRSRRqEnGtuOqovXEqguq?=
 =?us-ascii?Q?TUubAKr1LkpSj4JTD0WQ65RMcI/9lDREVViBedDnnfh3MCvi2mNvFlwmivgn?=
 =?us-ascii?Q?L5GbLjfU+bhjptN4JaUNHGFnT88MeAkGH6i1z9qkG/pgJ5Pt0icAAbRvcOZ1?=
 =?us-ascii?Q?vcNWikAGeTIPf0/mg1C/WkuKjzyobC07TqJjrJlADeuQ/z4qO/9uyq42wr6B?=
 =?us-ascii?Q?tfDH7c7wx318iU23WOe1H0+WTxSm0p7NWJa6ptgGPTudMqrL01PRu1wLw/S1?=
 =?us-ascii?Q?JQ86rEuevOg+WJovGEUod6wrkgRReL5S0B4r6401COE4/PKN/X/uHKV38zy0?=
 =?us-ascii?Q?VWScAhMZexg6TZAJFw56uRSXu7fc5y+iihId1yTTeRGHV+KUb6EK+lSHNQ6L?=
 =?us-ascii?Q?mo8Sm8GwnhUGFc5vacO3ZtT5O/OIU0t5bbOlWFikgi7jm6zhM6Rsf5t+KOhO?=
 =?us-ascii?Q?jpXzXknlUfGXcMejmau2Rs2UcVi9Ov7juB+W3wZYp4QouiF03jvwggreoRQp?=
 =?us-ascii?Q?BKt0bccuNOSnDXjJNkXOH16yvuSAjBQrDEzSQND6bCDxbUQI0JVfyKcG5ixG?=
 =?us-ascii?Q?JsBnh13djbZjyvDNRFgiYG3n/MVx0U2qqHIDM27aEYkIFJZvhFRjUQl+kFfm?=
 =?us-ascii?Q?KUkq67xypIRVjz6FVLqEKfLo9/iE5uM1GFCCEoYfSSyYgwJ1gvuWIUYECbT6?=
 =?us-ascii?Q?yljCF+mT9nbVWLhkNa4QKvA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625349f4-7eb5-40e2-c536-08dccca86a5f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:29.2297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlqHHXx3lXzIUJ9N6reTFt9tjeTV2aae23StDOX4cQ6WU77N3McY59yTRA2eisp+gP4t6QmhizsgbZT2qUxyc2Mi0sspkL7/wY5imkGPn3ljr4EAFoYv8jxYB5iob3MK
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
 sound/soc/generic/audio-graph-card.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 1bdcfc4d4222e..e7fd3d70ce091 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -361,7 +361,6 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *node = dev->of_node;
 	struct device_node *cpu_port;
-	struct device_node *cpu_ep;
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
@@ -371,13 +370,9 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	/* loop for all listed CPU port */
 	of_for_each_phandle(&it, rc, node, "dais", NULL, 0) {
 		cpu_port = it.node;
-		cpu_ep	 = NULL;
 
 		/* loop for all CPU endpoint */
-		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
-			if (!cpu_ep)
-				break;
+		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
@@ -408,10 +403,8 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 			of_node_put(codec_ep);
 			of_node_put(codec_port);
 
-			if (ret < 0) {
-				of_node_put(cpu_ep);
+			if (ret < 0)
 				return ret;
-			}
 
 			codec_port_old = codec_port;
 		}
-- 
2.43.0

