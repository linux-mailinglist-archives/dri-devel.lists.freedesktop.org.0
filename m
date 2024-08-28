Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2A961DF9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAC210E4A0;
	Wed, 28 Aug 2024 05:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="MzD9U29b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD1110E4A3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7qlpa7t8wdTpS7rEDBCB2JlGFYPIUsZylGCLVqq4ZOUmOHQdrB0tTUNJ3r5ky9YArW/OQRUGZ+eMT+pvwem4jExohq6pW2CUW2Kba6oiVA26QEm6y8QZ4CDoYnqb4XvLgLCN7I7mpqAEFWy9YrhVdnW8ZULcL70fk5neUdudma53Wz3R0dfPovWLP8/Sf8IgSwQUv37BZceZGGdwqecbomwGmvpKkh/mCVbTblc/37asTpDADqJ7qfWMr369jtNTUloYeA9WhzqYOBOBZ2nL4cdvrlHYDB76312ovaCKeEel0xY+9Ld0BmB6bZ5KUO3eAQB38MDaMElWvJ8ud7SBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hp4n9zD26Pjr3suPV3xZ/lwMpWsgUaeqizfk9RGR8Ns=;
 b=hYWpbQcFN6p30vQPEToko8WsrI/rnQAeuRyPiASTmErTy0GUG6I6mLR8mOue6egA5+bNn1h9qto/wZVBGKz4akS+krrUCZVixwLKYZMbdO4Fk/KeCYvNWVoFBKNSHm3a6/xiD7l8sLH2iwFPoMqVmE8+xDIodBW6rH7KpVE0AIVOl7VWa9cAdug2aadhbhihAVaFc06aXxKVwBG4SeWlX/4hUsy6nR9npyQg4TY1jDG1z2ytb5w5tLmrLdfKf0IoBgKkMHb0/zaQ+CHio6Pg855RiW+gTQiPSO7fcbfyYBEN740P61tObvT7yF2g7LOJE0bnvDgqQkse6ZVPKRd8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hp4n9zD26Pjr3suPV3xZ/lwMpWsgUaeqizfk9RGR8Ns=;
 b=MzD9U29bG1/CkipUzEvD25mIcS7NGhhPK7YqEwyg+W1/ewtTwrvmlNsodi5leUs8JiUgH0JeNZmU6jkNNMJm5nLr61gCVktVHDV4hzl+xnDGYuze2GwN5d5BN88HkxKoa30FRwczK6IP2h2h95JVQRJPIBHlCpew63mU4s5H8Fo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:12:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:12:11 +0000
Message-ID: <8734mp2pud.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 6/9] ASoC: audio-graph-card2: use new of_graph functions
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
In-Reply-To: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 05:12:10 +0000
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a29ad9e-5b4d-407c-4120-08dcc71ff8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eAxwP2JwezQEcelM4qYopxTB/LRV2pJq0LZ9u6q6Ka2CgT6b5V+MjVhuIi0W?=
 =?us-ascii?Q?ZDHojaE/9aA6xHvVap9+5PaqJ/RBhUgQTsHmYmQfEqB5QuLozj5jhr4wkyja?=
 =?us-ascii?Q?B+P0SX3fPOrpLe08QhnWghSBjHZUH06ftdDOuI3ISuvvX80umniMgSecCBx3?=
 =?us-ascii?Q?do/qdDrlCWUGMOxCdrEe3pnbiLGTsILWy/dOWwKNZf+vgohFnovQsd9sp3vI?=
 =?us-ascii?Q?MTsW5AVk4fWezHo4YUg2SrOADuDpiMAq2apUYt8qUprKrF077LCNxz95+MSa?=
 =?us-ascii?Q?Na6+zh/cQDinHNg+c4NkANDlj1VZE9EixcVYZYEOPF1FD84BlfOoKkkpxWXp?=
 =?us-ascii?Q?pD7p9qpn5GKwrIHkvGAEbz40+jnf3IUSi7t9M1V5gbu6Q3UWFEB9xJ6TUZnm?=
 =?us-ascii?Q?WpFsM08FmA7QctogM8dA+bZQ+ViiCxduYz+KPgXv3GXRyEUFBjH0HuZWKZ7+?=
 =?us-ascii?Q?1qAK0sSUFPOc2Q7VvYA8Q5+TDFcVcpwmpCqUiQS43nvHv7h/THOSemZuoC6l?=
 =?us-ascii?Q?dNR/pgOYRabKU42c/B3XGv/5iO6IeKivojZNwtZOOGhQY+Bb+SNL0CuAwSnf?=
 =?us-ascii?Q?U0RUYRJv30aAjM6ZNUGw40DktVQUYRnGa41MmfcrBAo/JwdXz9IZInUusSNu?=
 =?us-ascii?Q?hz4/9myScymblJLpu/6dS7lTwb+xlmXmBKwtAdC8LiIp48cKpAQbqdpbhuDd?=
 =?us-ascii?Q?ZAZnEUWrMQXEM1s+DbfgbvHi/WO8BZmSFJqkJT84lm7+RnDFgfpK94lftU8X?=
 =?us-ascii?Q?+w9Pd9l5y25yvSR9vbOaLVAvAGEYWYQDBLvAi8Ri+ATMUbwqX1ENprmhxfE+?=
 =?us-ascii?Q?ZHCNcOe+0nOZ/5A+fCE4Ah2af17uZ7m0eN54+urtWTc5mxIMq+dGHzMB/hII?=
 =?us-ascii?Q?FCFEMYXmrbrA+DzrZjHfTvQBPSvks59gqV0sCu3RPQrE4Nz2kECjsrU2nlsC?=
 =?us-ascii?Q?K55GhrNmg1ovGxNFjmADEbgA+Ot3aJR/vTc2WJNAwbDKm0WlACa7W2bc+UBd?=
 =?us-ascii?Q?wT893COGU485q3CqgOrFExLgdGZHzcqyWCiaHgy3KbmwFLtMDgbHvRrv4GRo?=
 =?us-ascii?Q?LnPeVzkrgZ3rKScr6GCylRdQkAQccX7iAiED3UmuqzNUG8phPTxZSYdRLRYZ?=
 =?us-ascii?Q?8ee9X1ii1GWfJzEfSnU98dZx/nq89dWdeMXaMhwwm7MM9CE1HuVV9duyTpSc?=
 =?us-ascii?Q?HMgzbTJDEU2L7E08p/Na7DUq7lCUgcPK/JC9bxnZ5YfdzRXT5B7R1FTdH0AG?=
 =?us-ascii?Q?ACcpi9mrmZs/6hjjZHeFZEEq0midWtWA+TqIryAFnINjdrnOUqcpaBiX63I1?=
 =?us-ascii?Q?xUL3l0YuxRRBZ7W0pHRRJ6b4dN8dAZAF8MbrOi/7eVK+xFP4ou1hw/hL8NH5?=
 =?us-ascii?Q?6J0Ht/EJ3w/YfaCW2/9xgfSAWfcY815PGRAWSOQHI/woiDHYKph6eGnZfpYT?=
 =?us-ascii?Q?5Bf6cnk0vIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iufs4FQfU9jP87aKJ2/krwKHn/q5rgIbLOUrBfIzPjH01C2qsyV77WJbMnxz?=
 =?us-ascii?Q?xrmxQ6pj2MVovLwxa7215cjP/C4b4Wf+vFRXZS7h5A1gjA+ac9BxHL6/0vMH?=
 =?us-ascii?Q?H4svyYLAlSA+jCC/mtNPTVIhiH2sHxNV9+WSF++IFH/CBqp87YQO4dqH59A9?=
 =?us-ascii?Q?L1GFCJUYk325BnvRFvn2lKaiaPa0orPMIqRJdCPZjH4mFDNrIQl8rKRwgddo?=
 =?us-ascii?Q?EJEuWNyRBV4jMbwURp9KlmiyjpRxP+tGFkQyta3vs6BsTJghLrEhPyL3Tszi?=
 =?us-ascii?Q?rWQi9DPnswl1gvfCL9YXjDwPl9VMI9mTzRuVGwdpRH4l27sH7npYFKm5QrWY?=
 =?us-ascii?Q?KFZ+X3ICIuCqzc8+4kI09x7KN+kxYeBXvYu9VldsqfY1RyOH3G6/gLGRVmjL?=
 =?us-ascii?Q?s6A0RqJqcLMPPorIt48SRUro/1jVV9Ozcy+1ZZGY4glPG/LAILIrZynlNxgu?=
 =?us-ascii?Q?NnRtjWlRNDqAvSF2cB8WKo7HUboIgClbjmTjCB4BL8yV95nLf7Ozor6U31HT?=
 =?us-ascii?Q?PtEtwCCN+5zdZFuEVdMt3iYsn0GS8qxgR0Q+jyM2zBR8oZSZfLQqkt46wlRs?=
 =?us-ascii?Q?4MO6QGMIU9aDtgWVqAd9ZX0+t8qhbHNm3e7mTvb/DIMRW4bNDRv11hkD7GQ0?=
 =?us-ascii?Q?CQxSPIQKzQ3ReGpVxGGFlkMJ8WzKnnzVgl57JxQgC7cXZqUiR9Nj1HvvCmxx?=
 =?us-ascii?Q?dzRBo2xBQy7uOkcMxwtZaO8LVhBHX9VKqLZrubW8wVARnMmsZW7wgn0MQ+q+?=
 =?us-ascii?Q?kZ/oLziG5Cl3c9IWS3IevX3RumtAaU4gUQsgOrG24FzdaBkFTzspQeCu+9uu?=
 =?us-ascii?Q?Y5Uklg7LJtm0tLzQ5uEweYacwd4FSlIpKvkk5yIjrky8JuuHncMSuQhNcld/?=
 =?us-ascii?Q?Od/XydQ6Ca/fd/s0ZQpPAnYcFtdpRyIUbj/x/waoWw9fG/hnFahhvDnDBDdQ?=
 =?us-ascii?Q?DOpQ0DxXAZFhI4FM/NHnMblvRUOpmcykvzaMP35xImFaFFj9AH18osa6k8tz?=
 =?us-ascii?Q?a95bHfUGyE1r5Psl2B2w3/LmBaK5AeAM5PlEupMgR3ucplPVTSVb2403l4aX?=
 =?us-ascii?Q?cXz1yqG94Uc3D8k0UiHyXjqwxVpmvgmfvjiWqsbs/eOeL8V9Yipc5EPoHAzg?=
 =?us-ascii?Q?xJsYUTweOXyDoOSJLnVF83fi0KbWw5V8FJQsmbSMU4c7A1ETyJ7NR5XyT0YU?=
 =?us-ascii?Q?8jbT6HlBjPqzoj5vYbGAlYBQnodf3qa5u8GJLSkg4SauAOqJA/o++R3EK3ib?=
 =?us-ascii?Q?11NuSeObeAGZ4CBfJpfcf2KgS52+KtETt0iq/zP1knZc5NR+23GzpKJF6E7i?=
 =?us-ascii?Q?YYUzYJ45zd8u9mZv7Hz7g8/rGO63rwiR0c2WNZuAzt49LaG72mE38HFdNvel?=
 =?us-ascii?Q?ep5PJsT+LIIpAzP1wVrKWAZtI0JJs7Lmf/XZeB2yMCPy6cOJOBnY52hw06X/?=
 =?us-ascii?Q?GEKdZccDKHsh8Tzni55bhRcOY3BsrSf11SZGAYmIj0zgCs8SYlatAp10V6Fc?=
 =?us-ascii?Q?yJ86/uFNW2+EQYmhhrbY1ce6H1t3mz8VCTk8B3mD+2qEfBSj7V0wlWA8u1W/?=
 =?us-ascii?Q?mSz/HuUbb99cJSi/tNfnVQd0m/apRur9Es1P8q7STLQ5HsDTm90ZoIKEX3Fe?=
 =?us-ascii?Q?I3ftqpckoxQIow644N1r//Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a29ad9e-5b4d-407c-4120-08dcc71ff8a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:12:10.9590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sr+yIjYXCEbkWtCRsMhTZDubj2sjiNno5Z/JJ/+ZNTcyuzT2ORqHSEfKRBAaSmGPGurkS0mwwXeJEKmkUohNLdgdmStw28fcrULqxc2oUf8uzfJ3nRsFuVWIR4rcay4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11955
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
 sound/soc/generic/audio-graph-card2.c | 113 +++++++++++---------------
 1 file changed, 48 insertions(+), 65 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 051adb5673972..90babed0f02e4 100644
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
@@ -1139,21 +1131,12 @@ static int graph_counter(struct device_node *lnk)
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
@@ -1167,7 +1150,7 @@ static int graph_count_normal(struct simple_util_priv *priv,
 			      struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 
 	/*
@@ -1195,7 +1178,7 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rport = of_graph_get_remote_port(ep);
 
 	/*
@@ -1237,9 +1220,9 @@ static int graph_count_c2c(struct simple_util_priv *priv,
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

