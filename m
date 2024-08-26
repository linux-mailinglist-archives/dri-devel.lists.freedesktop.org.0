Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E995E6DC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B1F10E0B1;
	Mon, 26 Aug 2024 02:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="W9yrvr4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8010E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:43:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXgZPYUCL+I9hv6lgz6utNGtySCcgvsoM6FtZjSKTJlLrZk9Eeg9EXEwUh+MwjYBAq+HDOqOXygAnrTeXKaQqGHDi96UFyz36D8esy/SxjhDkBg00kLuvbES2Zmam44GARo2iSLTGeYg5XKg0BRIH6Ajq0EARX++YWx0+O4fHlZxqZ4QDDXP/t42d3pxLqCp+yQo611kVkMF53JFoU+Oglh+qCCRsZS7MqSwCr3kl+NcJ3jsJnaUNGdos1CNZLcvmIlmZYvhntGt9pGPvkOqpGJEFVs/LzZGIGB3qmvZrZ4mkd4t03wQBG6KDoQasxI3pq7Nc7Kp2WazQJBo26JX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kVrCtqsPUn5FLvrXhReSszV+bKldOLlcpr/zHNtazY=;
 b=GATpbwYYvLFc9JrsxglKWZlOv3c0NpE6CJiifNNtYfHcr+Z0M/+yV5wf/T/qVWZflBQxy+2P0ixYIt2vYKxBC7Gp0/nq2qgXU1JgPSzoQyV9ybRspUUN8M8i7jCqfN4x2JecIbfhnKw7hgbD9r+z0th9hfU6ea/kzr2jkiZ+aK0sRKlJoZIxrqCOE92nctd/rIJlOtdAMRUolE0Puy3PW8FQsRQKATPUyXtBPTjYhF7M3r4x/zTV87pYylm2Onv2vBRqWT0LDZmOajrDbVp7SYu55XwvvTJqoQAAgpiGGR7CoL2Q/4CO6L/XADREN6vD+fQ+oZJFB8OG7xZSJ2fYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kVrCtqsPUn5FLvrXhReSszV+bKldOLlcpr/zHNtazY=;
 b=W9yrvr4h8Z6F4MciTHEyg9yUSofvJPg7Fk89iHH4b/nNbZAYunWzDSbwh67tQNx6jyJMg4ozAF3kCY/M3eAZLcYtxAlLvJH0q64Ag9Y/C2mDErUpbrRcUkz5XxALx5ekIHbyfaYT7kJNC+geQ5QLAW4rKVEN2VsrbNWd6JABvkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:53 +0000
Message-ID: <874j78q9zr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 6/9] ASoC: audio-graph-card2: use new of_graph functions
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
In-Reply-To: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 02:43:52 +0000
X-ClientProxiedBy: TYCP301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6024d8-407f-451d-510b-08dcc578ec4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eb46CroRymfAY4rw/nscRc/LFi6gRqdRyqb7KDZ1R18sYzB1jyeDy/vn6dVI?=
 =?us-ascii?Q?OI+1aW6y9Pd/X4ei1MwjvQL9YRZQXlvf+zJGYRygu5vPjGlqSPqHtQiuX6U4?=
 =?us-ascii?Q?NofMTQIqhRP0n94N8i7nY5fYSJ2IYRXFRz0hoQ7O8Wz+TyRRSdaDWOQQPbR5?=
 =?us-ascii?Q?WIYvCSc0VP1jdRZit+g9i4915LlP4mb1DTQNZFVut0l3S7WZKa20skyuWNYR?=
 =?us-ascii?Q?CGAiQLfzknijqD0KGy0+Z85vzhqN+9OUEmKKeFa5lWFCJoPrxIt26Lfeqy4v?=
 =?us-ascii?Q?BKnt2IbpgAD4LadYq1QyamlnFDN31EpKdTipNzgj76s8jt2pVH3s55nJ8QnA?=
 =?us-ascii?Q?rDP8Vwd8DILV29hMjB/y97dwsriOAXKmy8h5uOJzARG/NZrCRgd3E/Jf2Mey?=
 =?us-ascii?Q?Z+PzH4N5uSCX2CQNXRIj5wQC1d6DxuaAcZVb7QR5UUk4+nykkn2xsQIGOc6K?=
 =?us-ascii?Q?HLWjv9HEvSUw9CHiatimB6Bf6PHzkX1qJbFa8voxn7ptmmVKSriDjvbVs/gC?=
 =?us-ascii?Q?YjVnNAUDBPpiHs3TF3Iz0SaxHpCXUbvaykhAi6C4Nrswd3x+PhzwoHDP0Z9v?=
 =?us-ascii?Q?WGr5bHKRlKNoqeto8wz3y9RR4t/vlcxwNVfBpgVjy0zR96tuWdwIVacE6RCU?=
 =?us-ascii?Q?AF4WvLv1W3tObvaNQ1TxuFK2emQLPsVJyOc6dEfz5klPIjgd2Rta11RPGZAk?=
 =?us-ascii?Q?Z+5y+sAmYmhPjON0jpIjx21tsaSgGeW+gEI159Bc99X9XoYLhT5sMHxslii8?=
 =?us-ascii?Q?PKaxnR66oWfNXcvDkSdzerV/R4osSxQedecKcNY7jiLyRfpzqmkUz3FkGFl3?=
 =?us-ascii?Q?ND8miEjNikHugNUAFiiysH+oT3olVGxUEG//S4r0l6urchqBxHBWpMlAd4gT?=
 =?us-ascii?Q?QvKWI4E6jmPLk0jyBhpFH5CBAYhIcDgJse9cWOh1XBeJz9s9n/p2qFD0zO/4?=
 =?us-ascii?Q?5jjj9PCbzsnGQ4dMSRO/KDaEiliVDF6dfaiBYA/K5yKcNGf1Vg6XbEPkqWMB?=
 =?us-ascii?Q?MBf51Hq+N4DSQkPY5wqgceH74qgW6jFLjrgYe5yJTh6sHTst8boE24shmQwV?=
 =?us-ascii?Q?M5cfYGQF7tij6LDbfudTwsZmQplpHjZGxG7eIlHNfrYDvjQPy8td5MX/NGnt?=
 =?us-ascii?Q?ged2hqGjGsppuhXMB351YZxpnY1kiU50lsGkCzSrsOZslw1v0M2FpLX75Sz5?=
 =?us-ascii?Q?B9fHzXejhv5csEWDMyiV0Go+WsD+iihsxi1oGnFx1V/OS7jKnuRQRNOrLQ5O?=
 =?us-ascii?Q?V1zJTDRlref3reCi5fwx2wqWI8uQDAJpmOci/506FHVz8gQvdTCEszrZIP3G?=
 =?us-ascii?Q?b8oabJ/xXjEdgpMjecI5qRcpal4Mz+Xz1KhFrlicyTOiVXH45DLrvwx+h2lD?=
 =?us-ascii?Q?2lgJHRlfF4R5BvzXCKRKHI+1yX944l/4R2im5r3Nmk3Eihhk3SaeskHan1YO?=
 =?us-ascii?Q?CMelVYTJzqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzr/+vGB7Pe+B6Orh15s6Azt0ubT5e4aroy77ViMiyaQtGP4sfXtnFvDk6qx?=
 =?us-ascii?Q?Bgh7cKU+/ZKc6ScNh859YRBFDNbL6JFYzU7nkpBy2xnFsF6GbdFTAWB8VgVW?=
 =?us-ascii?Q?SAWVaUNLr6hxZFXQmcCqZmc6LEoKtI+gMknWOxxmvb1mpsuehdBeLy3z3s0J?=
 =?us-ascii?Q?iRPY7U4wg8A/HnytFlCI5INO7mfiJwhQ7MPs2HyZhcuvuWFUqEproNjWrE+l?=
 =?us-ascii?Q?l9bJM/u6QuNRQTh7E2yO2Pq7d2a6bMVstBsbeB5KU4u1SfDusKwpVAKejBoI?=
 =?us-ascii?Q?oCwIkRVSRwt5YRmp4VYDlibO1QnekYz1Ie03vWGyRAvrWtm9Zre5dRwwdp0R?=
 =?us-ascii?Q?Mkbe2Vj1mMdGL/64uwRrhzdewEjwXPUdcEZ3s1SI0pTac/q40vSagjgUtde1?=
 =?us-ascii?Q?hwEGW9AUwPfjnvNIXos4XRnnaLarKl86W3VrOupcASZvOLLdbq9dqLjgWU5t?=
 =?us-ascii?Q?wMdC/lTGIwyBc4PY6qcz24DymtzpWbJSdj9RMFP+lZYspwn39zyx2mgC+eFX?=
 =?us-ascii?Q?bsc1yw8odn6Xu/4NTEe6jdXKQ2dn/Vmwa5SCTSF7xgkoof4ABBeQWNCq8DPC?=
 =?us-ascii?Q?+tL00fdSe946hBfQ842Utu6qr4hLfJcJOdztqrNe65Tj//Snx434FR3B3tPb?=
 =?us-ascii?Q?J0HTmJYkdaUVgHB6/8r88Ozg9aZ4wNnO3DyJadkVgEeIbFRkPBRy9sMxpS6N?=
 =?us-ascii?Q?55kVe7rZqK99l+n6x1fBQ59XVOeYt8QQqzpU80bGmff9OlGCrNYbRWeOx6HU?=
 =?us-ascii?Q?HAqBq9gcaNbjgDgzV4StQKqmJE69C5XXF6h0Ot8xC+8XAJCa0kb90jY//mZN?=
 =?us-ascii?Q?L4fXD3Gqk4L9upZrCTJMaF4HdGk6dnQs+X4fahREV0pPlmapEk9zEmLsuOM0?=
 =?us-ascii?Q?v3o6S9eG7pMMcaq4u1b3Fngbz+hN8TEGRcAqj6GxJXlKNNZzpCerYjx3xqvG?=
 =?us-ascii?Q?mFgLcNTalWwmqOUgIsufbCaalLnWGVf33nBspYXsTgItHObinKAaCYuC97ur?=
 =?us-ascii?Q?IkeUeQ5jehJyoqGdVZGAAhD9vRimqjJxQ0UzexSgEKXvf73LmN3GA0/zt0YF?=
 =?us-ascii?Q?7HMswR0BjRha1FmoppfjFq2QJv8upR6u+/D79pm9tMAYkSYzklCz2ijagNai?=
 =?us-ascii?Q?1bTZ8zicSyK9RbgljFfbpMDIVM+B6KnauWpidOv9pYZIMMlTMqY0YTOfd96a?=
 =?us-ascii?Q?eRYuW944HbvkU0jzbxjNrzh71Vh6PmVXVDeg8RjwN3ONcjOQrey41oK/HdY0?=
 =?us-ascii?Q?IQ0PPBV0Vb69ZmPuJ22EwPGqrb4lDAxGKVEN3x9zrvDQgJdfJG8Fr8yNV6V7?=
 =?us-ascii?Q?eZZnnFp1K9Pldt1DcC9jXS0p8HxgLoUJC5DZ8k90S95Jl6JmI/5W9bKbfN3+?=
 =?us-ascii?Q?WYe2476kjCvzb+VF0z45ikJBZ9qrW96t4SgfAVg9Sct/qsOlAcyLBTUEYygQ?=
 =?us-ascii?Q?Q7+NAb5MHsNRG7zwA72xhQpZkl/IXQ6+0Ny4P0N81q/Nyswt4zEr82sduTNt?=
 =?us-ascii?Q?OWgdLSrswvWhn+d84nP+7E4+P8rbXRgnBsEGPotxG9rNE50CZUF8egxj3OGd?=
 =?us-ascii?Q?K8pUieJ+84aGj4ePeDxAGH/W3+JujBVkMsz/3E44ajU2KBCHbPHN/2sjyfCS?=
 =?us-ascii?Q?InMFIeGSDJnbe5wxJ8F0l4Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6024d8-407f-451d-510b-08dcc578ec4a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:53.1587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9u83NRtkKlSIBJ9lWuPjMu7Sp7LNBzjRI0Ft493PPllm7nWwh9AFvYZX11rYGk8EtZMbWQsp61jPfhlddFLn25DPM6E1EQDFrlJCrfusprZddI40Nmfirhibv3Y9zSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10616
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
 sound/soc/generic/audio-graph-card2.c | 111 ++++++++++++--------------
 1 file changed, 49 insertions(+), 62 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 051adb5673972..e5bcccfb49242 100644
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
 
@@ -530,67 +523,70 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	 *	};
 	 * };
 	 */
-	struct device_node *mcpu_ep		= port_to_endpoint(mcpu_port);
-	struct device_node *mcpu_ep_n		= mcpu_ep;
-	struct device_node *mcpu_port_top	= of_get_next_child(port_to_ports(mcpu_port), NULL);
-	struct device_node *mcpu_ep_top		= port_to_endpoint(mcpu_port_top);
+	struct device_node *mcpu_ep_n;
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
 		struct device_node *mcodec_port_i;
 		struct device_node *mcodec_port;
 		int codec_idx;
 
-		if (*nm_idx > nm_max)
-			break;
+		/* ignore 1st ep which is for element */
+		if (mcpu_ep_n == mcpu_ep)
+			continue;
 
-		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
-		if (!mcpu_ep_n) {
-			ret = 0;
+		if (*nm_idx > nm_max)
 			break;
-		}
 
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
 		of_node_put(mcodec_port_i);
-mcodec_err:
 		of_node_put(mcodec_port);
 		of_node_put(mcpu_ep_n);
 		of_node_put(mcodec_ep_n);
+		if (ret < 0)
+			break;
 	}
 mcpu_err:
 	of_node_put(mcpu_ep);
@@ -674,7 +670,7 @@ static int graph_parse_node_single(struct simple_util_priv *priv,
 				   struct device_node *port,
 				   struct link_info *li, int is_cpu)
 {
-	struct device_node *ep = port_to_endpoint(port);
+	struct device_node *ep = of_graph_get_next_port_endpoint(port, NULL);
 	int ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
 
 	of_node_put(ep);
@@ -769,7 +765,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
-		ep_cpu = port_to_endpoint(port_cpu);
+		ep_cpu = of_graph_get_next_port_endpoint(port_cpu, NULL);
 	}
 	ports_cpu = port_to_ports(port_cpu);
 
@@ -779,7 +775,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 		of_node_put(port_cpu);
 		port_codec = ep_to_port(ep_codec);
 	} else {
-		ep_codec = port_to_endpoint(port_codec);
+		ep_codec = of_graph_get_next_port_endpoint(port_codec, NULL);
 	}
 	ports_codec = port_to_ports(port_codec);
 
@@ -850,7 +846,7 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 			     struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 	int ret;
 
@@ -883,7 +879,7 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rep = of_graph_get_remote_endpoint(ep);
 	struct device_node *cpu_port = NULL;
 	struct device_node *codec_port = NULL;
@@ -1007,7 +1003,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	of_node_get(lnk);
 	port0 = lnk;
 	ports = port_to_ports(port0);
-	port1 = of_get_next_child(ports, lnk);
+	port1 = of_graph_get_next_port(ports, port0);
 
 	/*
 	 * Card2 can use original Codec2Codec settings if DT has.
@@ -1037,8 +1033,8 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 		dai_link->num_c2c_params	= 1;
 	}
 
-	ep0 = port_to_endpoint(port0);
-	ep1 = port_to_endpoint(port1);
+	ep0 = of_graph_get_next_port_endpoint(port0, NULL);
+	ep1 = of_graph_get_next_port_endpoint(port1, NULL);
 
 	codec0_port = of_graph_get_remote_port(ep0);
 	codec1_port = of_graph_get_remote_port(ep1);
@@ -1139,21 +1135,12 @@ static int graph_counter(struct device_node *lnk)
 	 */
 	if (graph_lnk_is_multi(lnk)) {
 		struct device_node *ports = port_to_ports(lnk);
-		struct device_node *port = NULL;
-		int cnt = 0;
 
 		/*
 		 * CPU/Codec = N:M case has many endpoints.
 		 * We can't use of_graph_get_endpoint_count() here
 		 */
-		while(1) {
-			port = of_get_next_child(ports, port);
-			if (!port)
-				break;
-			cnt++;
-		}
-
-		return cnt - 1;
+		return of_graph_get_port_count(ports) - 1;
 	}
 	/*
 	 * Single CPU / Codec
@@ -1167,7 +1154,7 @@ static int graph_count_normal(struct simple_util_priv *priv,
 			      struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 
 	/*
@@ -1195,7 +1182,7 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rport = of_graph_get_remote_port(ep);
 
 	/*
@@ -1237,9 +1224,9 @@ static int graph_count_c2c(struct simple_util_priv *priv,
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

