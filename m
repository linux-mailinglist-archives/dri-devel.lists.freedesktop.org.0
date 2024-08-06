Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0949488A2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 06:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719AC10E2F3;
	Tue,  6 Aug 2024 04:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="pIuzppeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E520610E2F6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 04:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKYwB64VlEtCa66veKklIGoZITxsJBvQP6CwwG2tlzkplqSu6xsDkXL6VzQ9qhX+x7iDWsQ2tDd/QMsNfBcySMioL88vid9THt9l1CwUxXW+AUbF5ihtKIOlQzAneuQuORe7BFtsDhcThHVjoKG3svnjlZzhCT36jkOM73Es6ZCJrtyaLAv3Hio1ui+EDcYvdQehwfnkKpLAPxTGO1MmgDYRi5ZIiRiiggyJdZG/0A32Du2Mdpz/2OTPebFiYdc5FkO3bLqnxCPvLhih4fL2vTQFPnptvf13epjG//IqDI6V6Vrk3lX/YgF1AIYFiMYyjLJqcAgATYLbAu62bjmUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6vhNpqKxKB/lCSNHdn73b8TlT9nVKAcgSe0Mpx3IFw=;
 b=C21NtZHjK2gVq4qt1Uk+qM5VXcKGRgkxdwWjfBdz9xnH/IynE4unZa9dNyuBrgPTTq8zslxGYEQd25gTUH+tCxdXg+8o7M4onHtMVpiKNQopMmA57Msc5abkWkFkEXftP4NfyxslYxMRZGCe8DKtIXl/y1Mg1w1ZyYj2sOHQn8L9FsK7pNN3OrmVbUC6SY0gqEQN2231sJr00ytbeM2RK/VD6UE+OI58Bo7hJn9NgWD9u+enSio4Al6PT/TEMpa6bD/ZlNCW6immDrke7Id770Yc7RMnQ0Pnzy33MW3ofAn/EenmJni0UWFmF7VpcEMauMKSvDfUi1Urv9cQ0v9MLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6vhNpqKxKB/lCSNHdn73b8TlT9nVKAcgSe0Mpx3IFw=;
 b=pIuzppeRDh+rVhiHkd0tJxEuTGLvhxm2EnPFVXxajjEnEqwLuSdM3kufZgPVNS65PGe+shJ+9Pn3b5lCreGcQtVEJX0vFk1qXx+RjHtFz+sAaq7PX9SDmtFcOph+gBLsld6YZ9/OguAPxLwc33CXO5X46Epp5HE4RY5Kp0GpMuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10409.jpnprd01.prod.outlook.com
 (2603:1096:400:24d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 04:58:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 04:58:46 +0000
Message-ID: <87ed72w8l5.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge
 Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Takashi Iwai
 <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-sound@vger.kernel.org>
In-Reply-To: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/9] ASoC: audio-graph-card2: use new of_graph functions
Date: Tue, 6 Aug 2024 04:58:46 +0000
X-ClientProxiedBy: TYCPR01CA0210.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fdc0338-5770-406c-144e-08dcb5d47436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Zhg3s3yekk6KWB9tcNoOuPuZ08ig9TUnzxwKkgr9mRAdHV0d3xpT7VWuACY?=
 =?us-ascii?Q?+rQVG0hg9u4Okwx68/9DR/nMo/ZLajH9e7Db4I/jTPFOZFfL76KSteD4O7yY?=
 =?us-ascii?Q?03cS/ghrqOZI90Jyx8LIhpEVuMoyeH/Gbj/P7P6J0XtMhK1iWYvmEugWRFb8?=
 =?us-ascii?Q?rpW8jSZXsR6jOIIBKDSwc15yACRGJoeLaAQgoz2In8JIRW9YTUAOEbHaQS9Y?=
 =?us-ascii?Q?nRWoTc+HHB+B3I0TVQYIwT1eSlHkDzi7c3mrrenoK3IV8owXwhViyn/bJe7M?=
 =?us-ascii?Q?IFRahzN799LD/k8krX/MS/qRgSM0ZoVhfK6ZEVx+rXQCkTJsts67ERYacrpk?=
 =?us-ascii?Q?/Ofh7UY+sWAifg/IudRPSwG6a2iFjVwdHixPJfDNe2PbhCOrUm7GAXQRDeRH?=
 =?us-ascii?Q?5TgCec6rJvmGPzHRMvSiOQJ/LS6hoaf6a7CvGJ9UTqRF3k9v5I86F8ehnxDa?=
 =?us-ascii?Q?Bqe/ijc2blDBPJBNqXqmH6CY+33EeO0KIDMFAqx1eL5sOTeTglUC+HITZG82?=
 =?us-ascii?Q?hrGYkrs08y2HCCu8LIwYNCwbjVgQysoJvQAdd+tgPEclqgf5HLmKX1xND/0V?=
 =?us-ascii?Q?QFlr0U3aLccdqOxYKWpUDG0rbLhzFIMoa26puRMtw+y03WyaWA9ReZHb6hcJ?=
 =?us-ascii?Q?WX+KDAzdGRili6lYjYrtq5S1LPHnHS/9BCSrZsuH7EnIi0fGwkozjZenGl/2?=
 =?us-ascii?Q?gb3Jh94cOsq4nB9INl8IO3WBmysJVk5NrVDOmFog/vlB3XZWCIikuuwCo3uS?=
 =?us-ascii?Q?D9ohUNV2D3yu4lyhkDfenmDRfxajI/zyAH6iMBSVxVeLqvMNVDdAfMpVS/pa?=
 =?us-ascii?Q?Rjll94Aef0uic/i2sFWXU/LJsDZUwlgSmJYvIgDNY7ovjahPtLrgIXNqJAgy?=
 =?us-ascii?Q?Zz8uu25CJyQ/ih0A3KFp8lUpIlYL6TL87pP6LhBCxljQn5ubus9eW+EFv7+H?=
 =?us-ascii?Q?ZpE9CsLcLgTfREuAW3Pj5g27WqVV/yj4jQPk7CfTbV9VPQEXE7aJYsWfB7Ir?=
 =?us-ascii?Q?e25mzMONWGJDN0blBT5jvAcFP3pTtvr3W7rW3H4f4PgnVMQE4HgWZ53Zdp90?=
 =?us-ascii?Q?8iKjPDGAvcFTFCKsIH2uOIgbsge4mxyEO5sKQ4gbLL+Fcencv7c3rhPwHyaa?=
 =?us-ascii?Q?Dyh9m1Ngk6w2u5VEqlmuhjhCDAh3oPxvPpLU8Nnt8QQmNLAZwltm90bi4cRQ?=
 =?us-ascii?Q?jiNH+tL8c2f2i2cooWjceRoTeQYW4+iz3sehvM1x7lopzPGB4NQVUxzGBePY?=
 =?us-ascii?Q?FAMjnj7PPsW0A4ckiIxHDWDUUNIzTzwUR92tj7R8qpoPrh1al3/Ls1b+FcM/?=
 =?us-ascii?Q?XYKoHfEeGzdCtK2T5pMkKRGd90G6N5w/cUR4cvi0sp6Y8q5aXRPBgx6WjpGy?=
 =?us-ascii?Q?btIxN0B7xxMqmUGEZqe+0xqOVfYCDF4ki1FCzwrnHhSijr7R9OTMZzTB5MpJ?=
 =?us-ascii?Q?cZuBvQHz6LU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ANPHsE3E+im0BEnvDYp/LTM/lnBxVMPLxbZI6yrhgrYNBdPaHmwAvVUX1ya?=
 =?us-ascii?Q?6Yeq5cETWOuXfoFmr3x94KcLMVdk3r8LUyOGzy1AFDu/BuzVxMFB9JtZwskZ?=
 =?us-ascii?Q?Q5nNdHjz02x63AVJxkNDYH8YMa6r3hLOQPCRXPzPDkAMyzhCIndCVYLiDWjA?=
 =?us-ascii?Q?NHbP8ZKMmukh3rEkYl9f+BOD0qGgMSCUCll3vbe6GxR90LI5R6VplgslYSXx?=
 =?us-ascii?Q?c4DIQ1xZwaA3cB2PAwly6duOjp6bktx8xSK3EDCz5LSarf0SSxkviPNTRO/d?=
 =?us-ascii?Q?mISdbxujk3nPWME3vwZsYsOtTrifqTbKPo5Yq6jBRkVdy5qnr9rDAsCqp8F1?=
 =?us-ascii?Q?86iuxwCkHd7mnaVzuoEWDoLWCFzFo0N8LYknyBEwFoa7kwBJdz3GOOtgw6Xc?=
 =?us-ascii?Q?iqFQje3v1IQTjgBzn2MpJ40kE61z53Dd5VidMcYHSlgXgedZ2XmktlYc25d4?=
 =?us-ascii?Q?SO/aFvI4dRrJbiYCqid1NoC4hoNN9O//DTKvhQ5If5SPNRDxySxEYsPxyDqb?=
 =?us-ascii?Q?2vuCciuhfrWa24SshN1iigcuApgZs6cbaDc2S/nOSw16ClzUbfXwzJhrNaWr?=
 =?us-ascii?Q?1UD3qVu1XTpjnv6rQQ+y5sgyar+VTcvsKcydHT/fDaLMA/xcoS0xdbyZVEeB?=
 =?us-ascii?Q?kDDoeJpIpteLoaajEJHYEqeEUyHMue7xAIDU0hrCtiFV83IxCakxTvOyl8eQ?=
 =?us-ascii?Q?opFnQWGXzC/sKdZyEsCDQpaoOg74h148fxC3CLcwZcEmXtg3fdSktTMkPftz?=
 =?us-ascii?Q?BOpt5jXYF7ATngci9RuJFy3TnE0DNvQLrcsrLqK01irJDSnswQMuIEMwhoSa?=
 =?us-ascii?Q?YdBaF0+DR0Os3z58rWyPiYqObGVsA0Y2xUh6eQltGVs5q/2/gtX5Ni953xbX?=
 =?us-ascii?Q?LLAt5RW8MQzRpROmTAioYVV+6f19ARkbfd8ubWskHq0TcHBnc59yC9eWB9OJ?=
 =?us-ascii?Q?HTDLD4UkEWb1G5fzYooxUTZYZsGnBg1+ovFqoImW85SEJg2+1odIaFQuOKvs?=
 =?us-ascii?Q?Os35F5r3HoNKNFyt2fayMBRDuiIRS5l982JVqxCaEH2ondR2xJ5e6vXjYBz7?=
 =?us-ascii?Q?eEItCPe7smttz6nHynghuhg/PlGcRMDgQQiDIWEQtO6XdnXEB+A/jRGJ49GF?=
 =?us-ascii?Q?jvA6sjqTezAE1lHsfdEJZflcTLm4Q9HatBdk3imFio4p+fR/Hd8VvoEFUD5v?=
 =?us-ascii?Q?OI5E8iH5tsIkw9QA0x7WsxD6R9I+C/zXCczV37hqnWuOnRZFfNAGFAN7cflS?=
 =?us-ascii?Q?LkDUYOIQ6xmN/52SvowNCEBnJkaDh0ssICTKdoFbKJtpKUwchyjPLAuh59i/?=
 =?us-ascii?Q?Otd2w6nYKrIktV8CRtdzFxdyBD8BcNuqAMsPIdHSJOAAJwg2YkfSr01Dqtx5?=
 =?us-ascii?Q?akVXq8BBQmEb4iecwH3YhCQ3UDIgF7+b6ZhuI9DBiWV3VpfZfL9xDOm8OR/4?=
 =?us-ascii?Q?HmLxunEuxBp0LrEb14oFAGPJmoFpWdjXjRyOxvC4aQLry7pSidyYSIJWpBMc?=
 =?us-ascii?Q?GwSaV6NBKhJ3B1BzTcx9UYJP0Cn4k8XCMC4nx23a+k7eHWF9+vK9+/7o66RH?=
 =?us-ascii?Q?9PsCmQavpEDWvg9lyvqn+1enRpJCQKzI8LinmEsEqkQwDof+/wpcFi8HKe5k?=
 =?us-ascii?Q?VZipQF5KdlRuc03ZQFDC9QU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdc0338-5770-406c-144e-08dcb5d47436
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 04:58:46.8013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bjDyqxpZeETSzPKBPCuIh6My0BwovrHAgmiWGWVDWO6gdkU69nzpYxNQSgjJJtACJ6er0LGxwUG7IXio0WndbTcfUa9x17xYJu+wck1mo4i+qTNu+j/navJ6wzxRC0o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10409
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
---
 sound/soc/generic/audio-graph-card2.c | 111 ++++++++++++--------------
 1 file changed, 49 insertions(+), 62 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 56f7f946882e..e8ea201dbca3 100644
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
@@ -1009,7 +1005,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	of_node_get(lnk);
 	port0 = lnk;
 	ports = port_to_ports(port0);
-	port1 = of_get_next_child(ports, lnk);
+	port1 = of_graph_get_next_port(ports, port0);
 
 	/*
 	 * Card2 can use original Codec2Codec settings if DT has.
@@ -1039,8 +1035,8 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 		dai_link->num_c2c_params	= 1;
 	}
 
-	ep0 = port_to_endpoint(port0);
-	ep1 = port_to_endpoint(port1);
+	ep0 = of_graph_get_next_port_endpoint(port0, NULL);
+	ep1 = of_graph_get_next_port_endpoint(port1, NULL);
 
 	codec0_port = of_graph_get_remote_port(ep0);
 	codec1_port = of_graph_get_remote_port(ep1);
@@ -1141,21 +1137,12 @@ static int graph_counter(struct device_node *lnk)
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
@@ -1169,7 +1156,7 @@ static int graph_count_normal(struct simple_util_priv *priv,
 			      struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 
 	/*
@@ -1197,7 +1184,7 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rport = of_graph_get_remote_port(ep);
 
 	/*
@@ -1239,9 +1226,9 @@ static int graph_count_c2c(struct simple_util_priv *priv,
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

