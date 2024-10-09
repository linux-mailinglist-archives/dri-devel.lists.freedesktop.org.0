Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611AD995D44
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696210E62C;
	Wed,  9 Oct 2024 01:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="MEIKUg4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2B910E62C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G528DAy89jWuHrrAvinlE9r/9E6bbwKW7KtJYEenxCRTsNxMBkbZOyv8Zq+HyslIwtPVsPi3cZq9d+4XB+LNSgUSu4LqeVm5yrQqqNUw9UVVDnSz95Oi+Teaf5YtYo2Pg142f5nxWM79SDlZP4GNwlShh3k84K5tbSVnyNhDhvFq4igDj2vEmr7iLTNC46snVjCYst1CBlhdlL/7DIm/pawfpBzKHefJlC4AkgJQwdn7vIuvT0JMD8VTiCq9t0ur72/xF1tqRxuQ73uTsJtzL9Zs3ioL3gpHM/tfgxgIKgtiVNGalF+3dcPDFKgGG0SyJoP2jIdIx5CDJ4Ay3vTSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbRbwom/HMdXU1UXcO/UYglLI/31EpApEkTdO2F4YXA=;
 b=Y/R0SFFWx3KzJqR7Nqwg6vjgu5+lX269AYT+VtHFWXzfWEPWgp2PRoFew28ryCSFk2LaFQTEvfP0xtb00gS1OdV7gtXnBypKtZb1+yueUS1KlQ6qEYuzLI0bbMgz/qsDACGIyDvNqe+iFtBvSA/+p8d2XbBVYwtquHw57ERGea1shtKBNa0AWmZXvJHEINMC7pagU4uTzdCphJ7c2c8zkkqlmA4RQPaUt3rILbzqCNrfIXuJ4650Var5uQwCfhuE6eoZBAHBfCWfT/ld+IHpZFDIHU3VXyFpopEAVuVTOi9hfyjgNUs9f4rII6lC2kc7Eh5zBWAY4vs/C3qx3vxOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbRbwom/HMdXU1UXcO/UYglLI/31EpApEkTdO2F4YXA=;
 b=MEIKUg4/wpLFj+3zWfGKiipqy4mvguCwViN1CqHrW12ioTISZ0Yo+wfYkNrGKva+Lf0nPU5OEBTC1sdovQbXbmFmvIj3onLeWxl//Ll5Lju6e3Aj6yu6S87AvGgk8litY4TIKu2e2roXOhH/zd8ME6xhXVlW8hbWZn61qexVnQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8765.jpnprd01.prod.outlook.com
 (2603:1096:604:15e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 01:45:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:45:23 +0000
Message-ID: <87o73urqvh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 6/9] ASoC: audio-graph-card2: use new of_graph functions
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
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:45:23 +0000
X-ClientProxiedBy: TYCP301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6c2a58-aa64-430b-1fec-08dce8040a82
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rLPknhRBkf1jsaosoMM2f95g0U3eAKKcIsn8SRQ5XlvjR/fZJEHFFAw0HW1/?=
 =?us-ascii?Q?Ka+t+XGUy1tbVHWlfE6XGuhGBCxQ+GD9+SltvVkUVJGWN/Gi0rh/M9E5B2/s?=
 =?us-ascii?Q?wVSMDAX7biNsCI3NlXTyMLjKCmVtW6A1udKMzucGt+glaeEh0Ks+/9J4qVqU?=
 =?us-ascii?Q?BL+M6UKB+4UkIQ6ScBLAcOZskNZl6fRpfcdcTi1kPIpP312E/7oeqC2Fgl3/?=
 =?us-ascii?Q?Xx6gFLvd/QRz5yJ9UIq+rIMnidGU/nZ7L3cq2VTT+on26pCzaboM3cLKDSca?=
 =?us-ascii?Q?idMsEjVdQk8FNxf9mK0YCZRlkdL3E3YfJFP81YKla+usTRtHDvA9wFe08axV?=
 =?us-ascii?Q?XY2REHPZgHugtdeoCBiaF3GSHJ9ihbg7EsIdAymSuDipXnl1R1WL1bQdJlUj?=
 =?us-ascii?Q?tMXL4b50d4ysYTc2IJVaHE8wK7j4oFd/MJ6jzvi3F+Cgqt5+SxjQ8eQUR4Np?=
 =?us-ascii?Q?fN9h9JIzRaKN+nWTZNSbBx0u8G1VyyBW9uwFr51Yo9Kk8XNkBoisiBPWMris?=
 =?us-ascii?Q?/W3++bhBU7cru+iO971lLf/oXjRcbrlSME9jSjAMBnfvhxxOo6wDMfB2TAKQ?=
 =?us-ascii?Q?SslYPQLHPk6kvdKk1SUgcQIRA1+lX3ZP4vfZ3i3mp89zeXrGSVoOADPmilxV?=
 =?us-ascii?Q?2LQogOXmNiMhpOGRtKbol2Wm4SoJso6rIwqPzF1/fxUSkc7iiSRCxSqNFFtw?=
 =?us-ascii?Q?r6IYNOi8VIXRg61r4HBrxcEqxRprfyyDCZXErrAJsLko6pHbQp8xX0C/VAb2?=
 =?us-ascii?Q?mAJtlVazGkz7tTFW77jdKWP5T131EdB1q46EqnaDWt0kcTNL3dkis5Thahzb?=
 =?us-ascii?Q?biR8lOhGWkOpPZS1DzrVeUkgQfZHBvEt/61p+ZtUAy8YhKqgGzNdPlTzeJul?=
 =?us-ascii?Q?VJo5AVhdojNVVN4HG2xkRGIxAf90XR4RFEOx52+t6FXG82FVV3L4vAmqVFAK?=
 =?us-ascii?Q?+qSp6/xcnnEBGqHFvSWl/cnhb858nar6dEKKmHWvdfFUGxKKiJKhBHLJ+Rsn?=
 =?us-ascii?Q?MH0Ws7KAsTn3j9Y4qdKLPs1uwSIQgVVI3EsdX1UIxLCYAuCc99C9ZHA6mR21?=
 =?us-ascii?Q?5C5/y99/GodWoOeP9fM0H1ze+DZA97XnYLvDnRiLtcUqnbcsDHxSJpyArT3t?=
 =?us-ascii?Q?2aSYysXFtVC/maRzRSIYzbtr7nyLVNvrWrEefuOoPrU3A4j4nm0OZ7ReKhY0?=
 =?us-ascii?Q?0FZ+kFJ0GxquQ7PGPxyqrk7B+NDKePpJ0/qi9tX0bfr5rQXWS8NvON79D5Ff?=
 =?us-ascii?Q?j2JeEyYHBlWogsZnJ0ke9N8Z5r8pONATi5kvgpUkkT/UAgWXt1Uw8b+nxXbW?=
 =?us-ascii?Q?Ta/XdxoYy+t/jllW0JsksolO0IEA+YzQV2SghZG4pNY/XoDsQVwaGdyR5PzN?=
 =?us-ascii?Q?7ZgYKAg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+No7Tu7qgoKR3pwRKF7xgzum/u3CBpDITRN0aQPfM2VxWm7PI/zuC98mlGaj?=
 =?us-ascii?Q?m9OX9/yTHONzJ7lOldtFOvZ8sYsMRHAsN6glMu2MQ1E4vAeWYAd89kcJgi5t?=
 =?us-ascii?Q?/vdTstG+n5XOFD4xNiLuEPn6MVVYLKwCXHLC4XaEVwKeKXT9/ylmXGD76LgN?=
 =?us-ascii?Q?0aDcrMx1R/Kzu+pTotEef3Eap0o2MBeB2sye/KkgRg/kY9CFGbCwNEsCdFd5?=
 =?us-ascii?Q?gaMoSof/l0Ot1bmbP+6Qk7gZboYM3tt+sm95DFF3daM1fN7Z0gB3axqaNMnR?=
 =?us-ascii?Q?uSxXGLe6cDd8CI9GIqy6Yy6TCThFjIWNCKh2jK2OtwKcc54JbnYiqlQdqaRH?=
 =?us-ascii?Q?C8f7fFvN/PpbT/jSH9hrn0Uw4lV64hCjoCMmKapyNRgS6vT2auRHYcuTR2nw?=
 =?us-ascii?Q?JvDjrysgVDIyoEVi9SpqMNRnc1elVT/soY2DXpf+Ft1jg9MEbfo4c/Dip5gR?=
 =?us-ascii?Q?xhp1JWdX1n9/KHpAum/hGSYm61IhrU1lSpr2PVXc1d0AcxgpWjp8rVPlca0+?=
 =?us-ascii?Q?BGiqBb/R5eqhTqT4dVbKz6dG9LMj1XocIDpGGimDMwUwtmw2ZHyBVtoBadOq?=
 =?us-ascii?Q?ICy+bFp/Fj04806KaYCTzf4i+rMBsnlz+Raq3KMseoKn9M+sfBzv2F6tnj/0?=
 =?us-ascii?Q?k54S8Xoljj76YT/Nmeo2qoZJnybwPzJdvgJKErDCMH5sdwBJiJ4X0mDR2Q9d?=
 =?us-ascii?Q?fWcm1af15JgB4DIW3B/X6JOr2PWSHec3WGURr+ogTFm58kRJgXxUhpdUtb0S?=
 =?us-ascii?Q?/GvcrebSFeG72GvYIvJsAOKvVK7AaX/jegYvOo1LEYeI8tcu9eFmcMqbilyi?=
 =?us-ascii?Q?BrHtIomgagxDPIIxgnFdugeIFUlyqyS4MQicOJILLA1WudVhn8OsWcSd0gPn?=
 =?us-ascii?Q?wu18lpv0Pzn+5kjbFFEyOebdOdPUbNGr3jYNVoEdswg5kPgRlZdHirKM7NBA?=
 =?us-ascii?Q?jDLrsb6rhunOsWpUAOXMuGFxsnE9TWfTR5OyzGJuoHpnXl6g1M+ofg2Q2uBt?=
 =?us-ascii?Q?6R/aQMbDb/9KT5KO155hzOQy8mPBlP4V7CV0+hC/CiAxuANDi+XdpRH7Ow6m?=
 =?us-ascii?Q?ZfMnYMfPwTqHe3ZH5edaOM6GPTqj692oMwkK1jxtpTfh2uvYtZNxFK/+9u0O?=
 =?us-ascii?Q?Tx6/u2xVggNtmQvfWBsYbKAiJxWPEvyNMnVxbhIYIcB//YN1qiOuNBQiZjhi?=
 =?us-ascii?Q?L+LdL3mL8dCEY0mU7e2FXt5E9oLROQVhbNIv2Jo7TTzjhey8VyDHl1ZPR55J?=
 =?us-ascii?Q?99ZynB1mxXQW2uxXFk+bqhVvIi0V4BpTZc2IXYu6L17Lu4DXC3F2nbHa4U6N?=
 =?us-ascii?Q?FWJJ4CLSjGf0iKg5OtH+ZiKWX1BX75bEWe54cGURK2nT+9dHJmN7XyO7GJQq?=
 =?us-ascii?Q?2ozpqanzCwCkBE4U9V9nArfJP09BI1+Tpam7gmA0fJMoHiWj9lEJIq+iwWE3?=
 =?us-ascii?Q?5F7zSd6uocN3M2z5hzqJA6/5C83skcby8gXxk3zYicMfqgXHJYHl82NtUhMh?=
 =?us-ascii?Q?dN4ZEztfs0YVM8fIbko0bHIlmkrvpiXL8jDogypn4Hlc31ZluJDMu697k+d+?=
 =?us-ascii?Q?ST2n1+P1JtY5C6vQRUHP3WFAdgjBiTIXbaUujkFYNSOSEE8tndSSjnuNw87F?=
 =?us-ascii?Q?oUgFWbFYii9+3962reDhRyg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6c2a58-aa64-430b-1fec-08dce8040a82
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:45:23.4621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLBvKi7aRgw03w3ouQYNKeoiTL297j3fM7CLv5wWa4JY7FzPgrPuTlk8jxFdSBU+wCBYHikICN/wCaQoOXh02UJu1pjWK/23X6BHVf8UujP/FtUTqc4DqvloVqgW8+eY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8765
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
index 4ad3d1b0714f..3605a6b2c782 100644
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

