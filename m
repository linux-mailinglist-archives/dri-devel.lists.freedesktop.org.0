Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737F986A06
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 02:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E094B10E86E;
	Thu, 26 Sep 2024 00:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="hsghpLOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D894B10E874
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:00:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0GHFku29GKZEt70Fd0UeytMSaI5sqyevtVFLOGRfCdlYbIWdcBpflvXLuUVGfbliG5jDal7+sJbxLX/i53j0O59IE/oueBq+e6og7LKfxCyZ6coym3xth/w0vqsdS54TntxRDvIUWpoC8xm6OLQY3MWE47W2JtYNX92UW2n88nPYFxYEWURDsKV1iPKxaIzymY8gZXwqxQD5BQ/21CwNLz1NkMLx03ulIlQRwvGAhOxGqCHirDpI+UAFrRcGqxaADwRTRmHt3fGph5sGoUM8xSujiHjB4AfoaACMwDLmMVb7WxYiOR5xNnSE220emApPyJdQeygQ+UG+GKudEiTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpSOSQwE6xBjXGtk1rjvHMS/ZUIDZaLCckkMWn2G0zs=;
 b=FLb99AeBraDOXyyTde5WsdArDKYGSa4FTYxJzkzDM7EjFUHitFioPpDKKdVo1nduPao+jk5vnh5U10kR03YozMrO0h/BBjJAMGiJ2KRAphX4PJ9BIsnL5r51D2XmMB8yfXBSwzslTyY8ORAgIlUhv5UueEnjxofcKnSIClZpRF5GMjVGFpkX9uW2CfcKwnIpVbzemY0QF8/Ovgz+aNLYQ4qQlqhhUxU1AZl2t94xVz+/xcjArGyv04MDVb3xLZ3rsm+yiLq3DfKrtjfD8z0udW5Wn7WiP+E3BcHZC54MREJ6sF26Q8kSglojuNJxkyry7jBqVm0DoetC7gsUa8wRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpSOSQwE6xBjXGtk1rjvHMS/ZUIDZaLCckkMWn2G0zs=;
 b=hsghpLOksoFDm53Mnr4ovN0J8cvQYAYnTM5ztQ6zhf9p52NRRrlDzcQT6Ow8T7C/oEzntigNfuMJkR5M7tn0BxPqHv6so+29o5gstWRjK7kJOySvuBau+aL83fXbG3cqtEK1G39cEP2WMuJlgb5zHgVU+KOy+Slr/564CG/fONw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB7353.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:00:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:00:25 +0000
Message-ID: <8734ln9td3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 3/9] ASoC: test-component: use new of_graph functions
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
Date: Thu, 26 Sep 2024 00:00:24 +0000
X-ClientProxiedBy: TYCP286CA0204.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: fe479a25-c96a-484b-0f52-08dcddbe3901
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sc9rrNI2TQLjJbNHYZ4+edDaDX4BFkUIzWDAWXxTc4nGbo7NE8MHVv6jskeo?=
 =?us-ascii?Q?by08lxsUwcvEyVZXXW+ZaAD10v2x7YaYjQ+UKybz5J2nmGOtE4KLP9Jn7nj/?=
 =?us-ascii?Q?e7M724y4UgTlqUqQc3xnSBPbF3MTMq0H8ikh5x+8oWGdnhXxOr5VWWUIN2ng?=
 =?us-ascii?Q?t0Okfe55IP1kNosaaiqskeFpbuBXF8oXcqDUuZXZDJaD61VaEjy5BLocwbtX?=
 =?us-ascii?Q?aLGyRtVptBw/7IB2ar2FHhyiNNfIFh6vxCRluI4yDZWxP8ifGYLj6JJNveCM?=
 =?us-ascii?Q?gV+1r03of4/LKRi7bng4DFVf559QWqj0yovrUk8xdR/IUsDSpZIR6g+Qo8SR?=
 =?us-ascii?Q?jD3owekEh62JJ/SqitGs0KVK4nABHy6BfYFs4lotsl5UwvnON9Btx/u2q99i?=
 =?us-ascii?Q?5qEJtwHxOjw5N4XW1RovrJljcMPwaLpYmDR4uYskE12/KXcFhDtPg7IDaT9W?=
 =?us-ascii?Q?3lKlX5+jDF2VQDkvsOubgRDO/BnJtWtn9nKC4DKOXCDZsHCtJuY5uDsRT+HI?=
 =?us-ascii?Q?6+3WTNhh0lPfqu5JdPsfCny8U1oAKzfYkrStyJdSCA/l+3VMN1V+RGFqCX53?=
 =?us-ascii?Q?+0lu5zj8aNejOmNR1OlZG3UeW//ao6c3BCARVaVtNUsQTxr3uOKJXDMyJDad?=
 =?us-ascii?Q?G3CwePiGpkGylqUmtlD9m9wnyqbxuhA8MLeO1Yaly78eseug+j82o23ia8by?=
 =?us-ascii?Q?ygxv3RiS3SRWu5W/qliAtV55hf0wpjtzvXQytLb0iRtoXA3IWvbfXhBSoje6?=
 =?us-ascii?Q?/b3WGQ7lMsj9Hly7kay0JkS7NlX74it0jpX7QgaG7c78aBpyCO50FBrmDof6?=
 =?us-ascii?Q?jujApXoXx2+xjOIuN5ogyQ4fUoCzA/CK7QDS5NfvkJOYiQn39mikQaREcTQC?=
 =?us-ascii?Q?Cr9ZUM/+0wmOaIR3kfQ4OEBr2lr0KIwjlV3Bfy7a287DwYgEM3qkxyhyBmHD?=
 =?us-ascii?Q?WWQqVnP2K93yGvORgLJ2BmvI2kAZRntW7U18Yvrz13h5ZLNQBopp7ts/C0sL?=
 =?us-ascii?Q?k26frtRzzAFiuYj9y0uOa4LBeT1Is7ZgQoLjSaRyoF1uOZ+6RELMNj/9DdLk?=
 =?us-ascii?Q?gAFdpZfSAbDu7PAU2p8MyV4RpMqku7yI4LYuv3+uwIe5U9/GRWRfBAIxKufl?=
 =?us-ascii?Q?+noH9OL37fCIwT/9QVGFLI+SH4iWjxUCR47NAobiSKnFtSReAOO8Xx3/Fgb1?=
 =?us-ascii?Q?hjjAzuVnl7f2WHZKMgEfS5Rc1n05Fqy8cKuY9bK7Xltj09EDepwMSpGKxR0b?=
 =?us-ascii?Q?iI8RLrNFnfO7XqJf6bmWNQJP0mLr6Ypuespt9qSAi4fBkbJiuqN0KyqUlP1s?=
 =?us-ascii?Q?7KDGgbDe18j0J/C1qB9OwI/wqNDM5RlL6hkVEB1P5axhOS4MNM7olsn1iw/0?=
 =?us-ascii?Q?sHmOYdOfbv7xFc27LCl20qF0C4AwMxO4OfUup/AQjCiSRnSDskWz63/Lwa1X?=
 =?us-ascii?Q?ccZ52L6wbHE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HclE7BtUnNoOLqZCQRFTRn0nN7/UUE9sUPEVJM/k41KPPdkZyXsNV85ii9rx?=
 =?us-ascii?Q?Dbk+gH5MOXG8Me4fDojlWy7aJQV+P47JOW4ElthSmgZIKI5j31YFqbxT8qjt?=
 =?us-ascii?Q?gpWIbuRJXnJLMOI8FOx3oJJEUQuyvHiQV01jtDRTnOyJq61I3NxHpi2qraEu?=
 =?us-ascii?Q?wkubEDXyFIVeZfIyLac6F9nY72sHHg5wpWbK2TqVC04HaG6sx4lxM/c46mTZ?=
 =?us-ascii?Q?2Rdw+goyVtVhTa4Fo9tlCQ546mmNTvEcA5Vmnz05R6okFecg+NNtrl+b4Igx?=
 =?us-ascii?Q?snfSNDalTHllMi3ezZ9QVdru97eh0Uzkh7wFQgarfoy5VB+GTqfxBvxmEM7X?=
 =?us-ascii?Q?OuK0Osqm4IMGK46gGOh0Onw2EGIso/0+8x6+A6yPjZG4CwLRUEGVnj5oiyvE?=
 =?us-ascii?Q?co+AhSM25SVoBKxbMXF1XtGbihZksZtTk2KMcNQQSVIGrn+TkFJv1MfmnphJ?=
 =?us-ascii?Q?VW9HfTRHth9sUv6cUWARKRMc1Wxwa9kKpxdd9vLaeNEE5xlBhIQIaIhunJom?=
 =?us-ascii?Q?gbRarNaMsNnvO/79NcVQaNbA1U42+yQhNsBAozVPu+y6XTsmYTr+AuUnr77s?=
 =?us-ascii?Q?So1J3JWpqJZBA0inKhCvBfKsA1q93FJSHgL1TFQ92/UJuiUBizamQmERQN2X?=
 =?us-ascii?Q?YelNNBAmyQWxmY80yDapttqY8LYH7JgrovzXXmXcwQvXQDCWcgagkxYdUfOg?=
 =?us-ascii?Q?xnUnDai4TBxGDRAQZQ6ZdJeeOnSZofSI+oq91Oq7OObPEUSFtEE+qoEl/6Fy?=
 =?us-ascii?Q?t5iYz69HvIa3uBfGvpzFjcTQUjq9HAGnP4AdTfWCIuwYpe2YRDcgMN4sn0Is?=
 =?us-ascii?Q?d3SIXSyZt5n7V3cngfE1xXgBTHyyhjw8WBxMbnHjVQo2hmEIcjdPmRZw4JHu?=
 =?us-ascii?Q?o+PZnEayFUWxhVNcpt4hiF/6Uw/fyGtdSOHJw4L5hZx4oTtTcgR4VbIXTM1q?=
 =?us-ascii?Q?a006+68OyR4ZrT0Chv2gb4Qq+5o2J7VJcQNgla8u7ZGmMcyAYUMu0opqFgth?=
 =?us-ascii?Q?Y82zL1H7CzWHnvLkRMTjUvoxDHFq02xEbVkfrk16f6AuW3e/h0BMk0BxYAsk?=
 =?us-ascii?Q?LCU5E4h+zLPJ8mz3aKr2hSwSVEhlNfWEZ5YF/ZRch8dMU/9bSaCKfk9UZnVU?=
 =?us-ascii?Q?wWsRlEsIAXUCPaNjMDglJQLMNVfvYZr1jk1WliOoxDktEcqi7D1HiN+scQnW?=
 =?us-ascii?Q?G9aLMw61kdM9sK4JcKsp6LPN1tVN2rxZZ54sxCnOkmJpAs2GGGmyyF6R9PiH?=
 =?us-ascii?Q?5XmT18FTDjfFUWmX5tLK0s/MhR0hZRslGPxGjvLmeoNJMMd6vZ4grqLsW5pV?=
 =?us-ascii?Q?XkNIp4Li3chnO7NaHwYxzBx3TyDw7DSnsfZJRpXF4zSdiBT8ph/xSzYrlbYy?=
 =?us-ascii?Q?vNCUWx6q0nW8u/8zlH0OzJBB3sIEj1rQ7K3E7HDEv+dE3TmXxyInnUMmieYA?=
 =?us-ascii?Q?hEp3YlXHs2DlTdfu1/zrPlvgN98cZCSafGNKSSfAWMptYKAK/ag/VsfLeXHO?=
 =?us-ascii?Q?lDv/i2DddbjLsKNQwIx0/oFIsb2bCI3nyPbchMKgoZi0yP0ZqLL3AKTJFGOi?=
 =?us-ascii?Q?Ceuw6VvSzoVDzKffgso/I87Z6mTwbKwaA00WwY5yCTGoMOdxQDU+7JLEiaMM?=
 =?us-ascii?Q?SbTDEBpNkIXqT0shYuee7c0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe479a25-c96a-484b-0f52-08dcddbe3901
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:00:25.1359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tz9ofmXQwx6xp88qB9aAXF4FyHnf5xv2kZrKA7dTmofILElZWjWrM8ukNSFn8srPwbiwrQsdmGIVhYoEKNDPaF+xOKTcUYcR//SBeJMGVv97RwOyOmDYsl2cGmivVJZV
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

Current test-component.c is using for_each_endpoint_of_node()
for parsing "port", because there was no "port" base loop before.
It has been assuming 1 port has 1 endpoint here.

But now we can use "port" base loop (= for_each_of_graph_port()).
Let's replace for_each function from "endpoint" base to "port" base.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/test-component.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 407288055741a..85ce3ebeec056 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -521,7 +521,6 @@ static int test_driver_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	struct device_node *ep;
 	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
@@ -591,7 +590,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_of_graph_port(node, port) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.43.0

