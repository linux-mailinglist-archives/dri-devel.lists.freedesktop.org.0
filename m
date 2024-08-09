Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621994C937
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C981910E855;
	Fri,  9 Aug 2024 04:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="aM/i3Fe2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974CB10E855
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNUqjQ9ALjiRpeEmGCrm7djqHfqgkdrMOFB1V/AZk6y/0uE7s9SHw0n7OS7JgfnpfKldMxLzj8A/Lw/uq0IxTpu0/4v6o7ueB+/M7/3afmo2Z+0Qk/vSFPOhLzmQUb0A/6GaCLzhPpy/EVZR50ImKqyQkc4reDviMLExuweLIavTk1auRwdsgE8RQasTEv8jxWXVxrLdEl36ExrHETWmlLgJbDdvh/CPqSnTv8hmVvmweOYgo0EaZcY3DHkpdDk8BhC+Mgvtxk5nQLF6mQHxlIND3siMz0ZyORUVZG3GaERO/aeUFS5jAPiTK4ZXa3TjyrIydXtiQzgN2l1Q0JED5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VN/zDdElcg66hXRY23ZSlUflCqrXtLJl6SysRvMczBA=;
 b=Ojb+v5bAgxTLguVf2MzPskjCoD/f3R/FR8Cxr7Be6gNCIdulMkaK/KNIYYxLdQwwbmndWGkVxz7zfdZpIcusX8ZLz58AXFa8z0JIYRNP0+azr0NMVTfJoNTCmL8d1kxWnBX9Ag2+DMjsfmCYJndaUhWcXwRM22SiNFuR99pzvHbRKBCxmKy/rotyn8MYzizpxbT4o4XQ3+R1mWLGE/3T1iFqMblcMzqR7U13lHnAMyY3EV96jIL/dPriiCs8B2POr91F2Q9hwL4qUFCEnhcVANmnaVqcuvDLIKmp+XDd2BGSITWn3BLz5PxIcGLn/2IwergajT/MzzejpdmvDVX0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN/zDdElcg66hXRY23ZSlUflCqrXtLJl6SysRvMczBA=;
 b=aM/i3Fe2X1Uqmm+gl+z6Dt74FGERh5LX0qA2TjP5RXdcWww3Qqcc5HZxoRUdU6cC111hZGcEdTcjbzEa9kvvFHXg2rhGEvlEteIirjJ8jKzQ4asXJIE2qwWr3pEzmba1grJQKbkOQIaauL3qdKKnR3KBce0uav0tkkGt3aUJWrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6400.jpnprd01.prod.outlook.com
 (2603:1096:400:98::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:23:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:23:08 +0000
Message-ID: <87wmkq72ac.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/9] ASoC: audio-graph-card2: use new of_graph functions
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
 linux-sound@vger.kernel.org
In-Reply-To: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Aug 2024 04:23:08 +0000
X-ClientProxiedBy: TYCP286CA0188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 1816faee-edc7-459c-276b-08dcb82af8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2CjRCk2tM5k2aBUNP6TElcHAHAhX4kCjPWfRcvnodtkh5ypoodp2cVUtWTTu?=
 =?us-ascii?Q?xOHDw6Ei/RzXmMdM1/GFFveV5CV6kOqn92vF6yd/2i4M19v6eyBvqFkTfCDc?=
 =?us-ascii?Q?8+5iH8AgkzSQ61z9lqGzBeQfN3PxpaGJiHqGBZUoKYiXVMSyZ7BOvW0bPdhl?=
 =?us-ascii?Q?DUzp1F/+hxHPR3vWJ99DYsTVL1w4pddv6KKLpHwiN3+LAlriDxSubBQxZmEj?=
 =?us-ascii?Q?HB6LKH8SgfVJrYQeg8dpU1sfzXmG1fbx6RGN0gCTzsQ1W2qT4kzgD1/0LNWa?=
 =?us-ascii?Q?ssdMDMsnkKjM/7GjAeb4b3Tq/EQg0yd612mzXxd6QwQGMN+P3gEAr2kdNG/s?=
 =?us-ascii?Q?eH2G3WDqXbdNxNYzqvUjma+wsPFoZk25GZhP2tT6iXB+HLmPY6GzVPxDEoiV?=
 =?us-ascii?Q?CZGBglW26fEXMGHuR+rTngdN4r44iaR42wzO1oz8Nc+aMMSfLWec4wyiFItK?=
 =?us-ascii?Q?92+1v82z4I5XtOltBAQNXtWImoec6sxliJwRFVyp4cmv7VNkRvfihPsck4zc?=
 =?us-ascii?Q?aaVD796Liy+TpF71dlf/fpenHIJE6pVAv52CiGfEmOP7nO8jjPwniwNHMBa1?=
 =?us-ascii?Q?/RBgAPFBKDBdWyK1gEotkz9k3IWBijBjdlFcupDP3XLhnWRTyGq58rA0ugOn?=
 =?us-ascii?Q?KrP1iQhvyzUSH4gZdja6c9KXVHGd8KAPBb9J33IsNwqYG+ypeo8QfCXwNu1T?=
 =?us-ascii?Q?3IUuSkKnzXFekPwjbgIOBMd120mpsby5MC6gvTGbyPB1yB5XuCCdMGajRISJ?=
 =?us-ascii?Q?jfvJOiogF1w5JqCJqgCsloArtRRFL4SyUoTsF9qokE4IhyUEt0wEH8+3/q0Y?=
 =?us-ascii?Q?XpcWuC4s+VYMV0TGDU+WHbwxGxoz867JtfaCIkvu/UtQpJcMCaKOBPzdvjF6?=
 =?us-ascii?Q?HKRjIujXVUDCC8JG8gqDO+s4bfVRJXBmRSHxBtWaqS8hnIGXU40TeDjgEkoL?=
 =?us-ascii?Q?q/Qtl20uFH8/ExKyRb9wqQXWNakiuom2ONrU3rdoX0FYTNCHZqMCXxZT/bjc?=
 =?us-ascii?Q?rk8nlrfZvvsCnvdMP/gM17yBHXbvVQZCp6kisFBv+MKs2r871328lBzt+y9I?=
 =?us-ascii?Q?Xum7Yt9lfTJXiMu4XyodsJHLlpWFXDTEn53ykKHl7602i+4XZ2yO1QXUtQX+?=
 =?us-ascii?Q?vqWWnVWjjKQJxRffeEFKpX30dHfCat8pHrBUAg7lXGLvTeoTIE4l0sjoluOk?=
 =?us-ascii?Q?vaRAc8cpmYCdW6d7qZURIT4VXN8yp1dXxqQkoOJf9XHB8L0iLtc2SoN0Ka9T?=
 =?us-ascii?Q?dwn7ezfjVjkNsPRFAh/WyQpHrQzOPsPD/vAeEf4kphN/FutA2TXsA9aZ7A+C?=
 =?us-ascii?Q?tGkyY61HWvBwmOgNkmh9sm1YOOAFXHKPD+ZDi8joXiwIoZ4fYpvW+keq6UBw?=
 =?us-ascii?Q?VGHPm79Dg1Eo5bvNhayEGJq5In2XlQAXYC3jgGqg8uESlvl/k7TAS+60PJl0?=
 =?us-ascii?Q?OzDQtySu0cc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2eLg1VjNyJVj3oWFLgT4TfVKgsvXXjTOmUPvfGfc6ocZev2TafX8A4Zd2eTo?=
 =?us-ascii?Q?/51+sUGn6wrAcGL0ucL/I/EHrMTA/tyAxsSP1bRbwCAtneWaqD/bInQobDho?=
 =?us-ascii?Q?lXc0GhCprN/BpVhNT1U74MQ7G28gzEtpsX106kdGd+hDYt1jQ2QxMJdMCot0?=
 =?us-ascii?Q?Ulk0aEYaNYMKkyVhDLhRDnRpu7mONZDVJVrDo3TSiREv+QxRQxD2k94JutqU?=
 =?us-ascii?Q?pw4AAOQENa/Tv0NOb8/w2ESBmkJj32KMVakbSOgykvLt/zTjNMwznifwaFQI?=
 =?us-ascii?Q?7HDulLiXK+SLdEnlNaXHoykQiEUDbpIblFz0DP7/VxeiYOxKL5YXROLJj8U9?=
 =?us-ascii?Q?B2EvIvW3mk/9NxKg5ddk9Kbe/1h2nDZWxE3Prab7TMy3juG+6k6CD72YDgqX?=
 =?us-ascii?Q?aEo+WGDAdkpvVdeVCCgz3kL7Ey86135R5mHWWTl37UczsqdXxuUZFfaOUYqK?=
 =?us-ascii?Q?Nsu2VQhyO70TX0/NGiqSzluJytcToDMoKfUMKYEY9ki7Cq+ByzLWhlSY5gDI?=
 =?us-ascii?Q?xhoRUDGSrlgy3ocjX9uuxHBPwLe7uUSfs8yA24l+AmGI1lovkl26eSZyhf8B?=
 =?us-ascii?Q?YiRFwg/mXBcBw74h7ebU67dYRYIOZdByXoqoHt/sot2L0Wt8d2Cs4XJRpHvr?=
 =?us-ascii?Q?bkmI5mDyD2Yvuphm8oGxVKpleEDiV7wYltFcrjj+9wFtXWWSZmZSOb7U0j/A?=
 =?us-ascii?Q?tptYlgUWwIS4mqPZeteYbcE9yeSSLIgc+KOf3myAoAujOkKpMX4SZeEtQf3z?=
 =?us-ascii?Q?4Fz4PRRE5kw2SctrW4BjGdz9woYTBscrKqHflMSqGG8TI6+ZlNTjaLZnMYvb?=
 =?us-ascii?Q?aYpdCEuGyGNGzQKgHANW6r9AgYq6fQiGQhk8/O054NPPiLzOwGKVhLqWLSrD?=
 =?us-ascii?Q?DwPwU2HXGUhg6kJ6NZOUfbcK1xucovPm1qxXzz9zEv9UKHR9suj8NrROtMRB?=
 =?us-ascii?Q?PiG9h/pprJ8ZulYSL6SPUmQnvw+kkNyqjRmGdFaEsMqT5wLMR6jRvAWI94We?=
 =?us-ascii?Q?h5HHPSEGgK4DADHYrUW2YkccCSSx+GB9t0LjfB5gu2Rg6AKw1NAQNnSo5/A3?=
 =?us-ascii?Q?72M/KA1KPf0R5lwcngbAfz4L4SAhIMTe5eUAQ2nluNa9gAEhlXd4mOAx79WH?=
 =?us-ascii?Q?zHAnyurJWbV5m7iudrQpxkKDcOz5bY6JqqLSI4B35gZZo0o3wRHHmTXfo0L3?=
 =?us-ascii?Q?jqZP0g8zZZXjUw8v9MubQdjiQGkloupMyZcF8szRIEDvkVHUsHJu4jmX/PTu?=
 =?us-ascii?Q?WCOY6ga1iO0qPRVuEDiw70bBcnXdme2j5ao/oG3T8TF3ESXJ2n0b71uxF9M4?=
 =?us-ascii?Q?2JIadwXNw06PdztrGYvctdiKxXZpPFmb7j7iW/GvsH/SwvabqtpV7JXY8KG8?=
 =?us-ascii?Q?imfLcPn061K6x9CVWP33zqi6a6n+itqNj52ScNRUuXWEbqFurZ7jrqE/CokX?=
 =?us-ascii?Q?EyAj+teH/OBDEc6Mjz+3eTJmrgmcGRskY1pZFfI60GybHSh1GfM9dME29M5h?=
 =?us-ascii?Q?5M2Jhe/Fnk7TPjFojXCQZzwnC3Z5dEUu3AzuCsKN4ZrFaYlyeXwJdKQIaI0U?=
 =?us-ascii?Q?CXpoy8fXqivwdv3bkOe8VTf8z1jxerXpY9ZjShnb2pH0skBFS/9HAyCEK9cx?=
 =?us-ascii?Q?WFYHFBS1Jukq3eCB+cRmVrU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1816faee-edc7-459c-276b-08dcb82af8d4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:23:08.3334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahY8rT2Kwp9f4aVinm3WE+TXTmWX+l+llBBocY08G3AXA1fHn4EUUvdgNPO1bMibPGhuwc3wq6zLrQxUaF5FIuqEIj9YZk+ICX4HTYasaM1A7w4mlwMkQLG3O0HIJG14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6400
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

