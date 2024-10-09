Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF89995D3F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D769910E628;
	Wed,  9 Oct 2024 01:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="gyZRSx/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223610E628
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:45:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKIN1x8OysUQ+q3k+AXWnGQGqXzlB0CMGR8gO/j7jcX263PZwOr7O9oYDPgi8B0NYHtwAIQtrPhqtgoB8PNTVSz+lZNDowiUL9LCFYW15SJwJqB4VwOjOgVedopVQ8sPVtyeRvuvhoNLsLWHAysbvJQ+07QxpijXedpGnDOf0fyiH2r3U+PfbOnPApeh+3mt/aLgHIe8HRplwyNE6h7pj0kWnc3sLQJNzRzOeWK6myMrQRs2vf4/mjhjWInQcmGFS0XwkfmdLmoSwH4GzhhE+1Riji4w7puCGoIN2mnvCKJ1TKhgOJISQ40xJZroYxBitgGiXtoQ6HmQIuiZaq0nBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrlHo+pXgScml1gY+f5UpIPiHilFUDJNwvULtMoUnYc=;
 b=q48JLJzqwcFfUssTI5w/sT3xn1E6SDXM9MhmYhEEjg1mdGlKJG/HQKP7i2NGGFq4Cy0Me1AfIs7Ep4pDRFHoOCfVnZQayAmQncSOCyZUK5PpmE+W9agwcemkOrUW47kKxb4LiuqfD0wCs4eRGQo2/VHhBqCLY9GglOa0L0TcmHBO89vOu2pIB76GfI3gzKqrLjCK4HtzHTG5vCV02xQMFKOUyn5CDvjUzDyFB5p9rK8uu17fJh/B87b+LzLz0D10Hdmp5nJfzuPG63gFw9EYxPpceiPEJQcK0FX9BIQlABJ2AoDgmgETOfMjUSy8EUrETxbmxlX/3bitATj/uU694Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrlHo+pXgScml1gY+f5UpIPiHilFUDJNwvULtMoUnYc=;
 b=gyZRSx/VR53Qe77EOjZZk4N+7bb+Cj+Dcqit91+3jhkQltwicaFyJkZ09Xn29agIB2HSE06re5ImKrUvggc9b172WiQc9ePigsZoHr/yow/LeROE1/8oxX1dLS1hGlHHVWg9855kGryaztYvhH8chRau8LLt+hU3VVbHDbi6GY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8765.jpnprd01.prod.outlook.com
 (2603:1096:604:15e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 01:45:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:45:18 +0000
Message-ID: <87ploarqvm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 5/9] ASoC: audio-graph-card: use new of_graph functions
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
Date: Wed, 9 Oct 2024 01:45:18 +0000
X-ClientProxiedBy: TYCP301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: ac26946a-b06c-42e1-682b-08dce804077e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d21757KqftFdzYyA9aqKijFr4zihwFHz8Hq8vBnIc17VMrh7G1ZWUYYrIQln?=
 =?us-ascii?Q?Z/qT5x1cdyUKW4Bs0E/qGEirOtmugK+eGRH1y2CKTbz2kGegXVFcnK9elCPG?=
 =?us-ascii?Q?HI0iTVOuFvNzJwAirUelTzTPlDkwfh4tJgd71SCd1MGu0oZMi2BwOBJIqXEt?=
 =?us-ascii?Q?r5nuUj2FiMYe8k0Ol/MOuQhULv2EfhyisCehR4FiWQmpDm0FTg7jrD5vdGnY?=
 =?us-ascii?Q?PsGP7MWRUsa36iY81bm8b4gEiVGPIMfuADA1wyVBIZm1QJg/Svh0E4AmNCQL?=
 =?us-ascii?Q?r4XfjmcmQsJbx51GCSNVOBgVQHXXfGB6uQ2CAdxFJdPO+1xD6Zg/55il3Rsd?=
 =?us-ascii?Q?UeRv+imrgtgWnIuBMXf56aNjOJJnWc+3eQw9xLuP493PecuqPrpuQTxm1TlO?=
 =?us-ascii?Q?WyorCSF9saRnlN1JvkwOWVw9A8L9DMa8N5GJfDChI8Gj2oNgiGGsZ+bAayIm?=
 =?us-ascii?Q?RVEyuNrMbWa0RE119dPAW59vDJQMnlpP9fcLfdKCqy5a5gL95TMdK2vBJ2FK?=
 =?us-ascii?Q?JQAHfrRpmJ8nwyBikRa0KgWFSQJTQlpkxwmbkwJBNJPPlJ5kLymavv7044E7?=
 =?us-ascii?Q?BAk/x3Eh96SKrqS44sPjYu3J7DFCpR+iY9cLQicCjuwV8VWF8EUQ06VNGG33?=
 =?us-ascii?Q?1qhNc6Ppz1/wOHVCTxp0Qa+w2UfmXH+F191dUpMQ1EfmmrAY7gaH0BJ4deS3?=
 =?us-ascii?Q?Ir4NoO1T2uAqgtoU4R/L6z9DTSsjGg3P7mm9rJBrd2Yn4+WkUuSlhMkdmuso?=
 =?us-ascii?Q?spYZRkaKY2IJlwq/wRgQyiwXTcFj90W1v8qpp2OteBjmHEPPG94hNcWbS+y7?=
 =?us-ascii?Q?DxAg+zrjKFtir0vku6/StETJwYByKU9Qr1AbwKXf40WzYh4fItkC7+gag3dW?=
 =?us-ascii?Q?qZfatfCEMN8ra9zb+NzR1/l93HS3+nzQzTEnjFrJ3YrxoJdVdkOdRNRd0O1f?=
 =?us-ascii?Q?OqmE/uCvpv7xpiG5eGm/XFa51I0473fCSQ10UQcP9fGBnE3wnuHMLHudpLj2?=
 =?us-ascii?Q?LHRF2JSk8vlkJ4DltFeyMVAk1lXzAvIYZo/hl8QbJmO7nomGDo+Pm8GGTRKv?=
 =?us-ascii?Q?QVuL/ttGaSGeX2fCgkYH0FVe+0cHuaxLMS7bXq9Au9gSGUz3e64RS4R1+qIq?=
 =?us-ascii?Q?0YARTH1ZNdGLLYhWHy5epdbIXsNMuO3XVT4CdQsIGEQeRa/bWF8rjFmPFrI7?=
 =?us-ascii?Q?nMNlbj2sum4awXn+zxVkNVuJ2mtAI3yRkrZwglmFifyigFPCGQuAeSd71MI2?=
 =?us-ascii?Q?96HB4BuidaAf032JpV3i+T2HwOlfi725ADhWBAmEkzKf4/YVX1WNNth32IOF?=
 =?us-ascii?Q?GhnYKDDhllM0tV/RKwHzP63Mu7/75DwvGsyxg3mQqtgsCWVJR0J0e4bssLu6?=
 =?us-ascii?Q?JYpswZs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AdoGEEN0CcQ2PQhRmajscPYUOn0oqkBp7dsw7ajmRZyoYugj1JU31BWlLTQ+?=
 =?us-ascii?Q?SSt44WW/iGQQj7HPaWOQaL+IZlv/9gZCKwZW26REfTNoQZ4rmyPsWvVOKUH8?=
 =?us-ascii?Q?8OmHQ3Sym74BtJgl9WeSP3rQswuzv6Zbo/H0WURpQl3RLu5Kc6DqpinO1qR3?=
 =?us-ascii?Q?nwXtDQDhX5SDTthu+Ww5j1hnXeWcaJVzt1OC+J3ODCW8tmZm6lvC/sJc16Wv?=
 =?us-ascii?Q?9Sz3rQIY7FzXYFJdECzZLMEiQoOC/cj7VS5CLNOADr1mM7qFesQJ1QVnP2fP?=
 =?us-ascii?Q?iUyjUeZ0mL70xeCeSsnapO/R8+9ZL5pHwYmNPbXe6KNR+VHG/lmS1AHr0rBn?=
 =?us-ascii?Q?t7BoBEuN11hvWgAKRRbW9YuL6KfO5dRm43GZTxQe+fXCxzK1yizphuJh5FeH?=
 =?us-ascii?Q?P8LTg0w7Q3LOgVCcL8Pz6lDW2sJio8FgCZ5eODogbIgl/YvP9mtY3W/Ddbmu?=
 =?us-ascii?Q?f44B/Fcb0P58VlYjOPXyyIG3nJa/KhdK9UOKR/xL9ce5JAnBJAmphiD7YckP?=
 =?us-ascii?Q?a3g46nVOwhcqoqa0a0lqVkDMcs9ixHS/fVKX33eGNgmZ5Y6QLcMd1OoA2xwP?=
 =?us-ascii?Q?gy+JrhOX/gZMB17fAIIDD6ObtPpYbXfpPQ/ve8J/9H5Cb9+2L0074d+4wSlo?=
 =?us-ascii?Q?HRM4/3qYgD8oDJ9aojk1GIj8CfS8OmH0oSa+vueSrSp0ej1Acgze9r/j/Gwz?=
 =?us-ascii?Q?HQ2eiLMgO0qIq16qRjFNP3B6M6gMb+QeIxOMyMbmDew/99xnk8z0eWDNiLFc?=
 =?us-ascii?Q?WOkHyFgykJdcu2CH7fvPPgGYBblYf0ee8OAl0+O4oIzi6ZGvSv53ZT3pJ7L0?=
 =?us-ascii?Q?V/hWJchOwYA27fCuxgTnR8Ddh5Q2X0F6qMAHQ8a2DLKBNDEEiBQz5pi8U6G0?=
 =?us-ascii?Q?oSxtS5cGvqh44GrNZhh5Z3HtDvTh8ze8t5YX1sS3sw2lbPXKALtq0Xc+KQJ+?=
 =?us-ascii?Q?KVlv4BQB47kJZuniRyNKvbparV0sN8FHqAEQnN0SgPZmmrDVmXUjhRamQ2ww?=
 =?us-ascii?Q?u3s2kE7zPL2Dzr9k+rCbsN7XDebCp9of9g5GTh1KPlRZimnAJL0AYWh5P6L1?=
 =?us-ascii?Q?dS4SoG5Dv3oedv2f21+sF7yXeLm/LMX/GaGfhhLoBAI4hktwA11MOTadV+Ki?=
 =?us-ascii?Q?3skrIVwQgXWbhLgPo4laXmKw1nw3SsPYQyszyfzU/eX9ZnU5N0d5Q2OogFtZ?=
 =?us-ascii?Q?wVAjJsAhNLxkyFh58L8jUuDnoIbqS3zZcIHp52fuSrakQVvaUkIVc77Aodt8?=
 =?us-ascii?Q?snBVpdezpTBboYyBXmFzEplVcudL0meA2nh3VeFtzzuYCkxQGbHuJVm3snzz?=
 =?us-ascii?Q?kTBFGSY8fXPxJHgUXbPgzzpOehgyPHu0riVSfKDszjTEcWwv5cFQI9Qu3aDW?=
 =?us-ascii?Q?oHjETgCQTiphMkmayZG5ed5Mg94IWFEqdqAdDaHRjT0sMudkXNsyxOeeqgK0?=
 =?us-ascii?Q?KAYjTsnrm3EmU/fKSQtwI+h/qh0/ENY1+3HZcuLDL7AephJeXzLiMPJDVCEA?=
 =?us-ascii?Q?JyLLutQIYwnPw7iqo7ygUyvJGb8DakmQxf0EkDu9K3hdSUzgRHTC9gOie+iZ?=
 =?us-ascii?Q?077V6NYNR/JQPgqJZm5RicfpNgRkdZku692ivCSkD2UhB6ztkYVKBz82dDQK?=
 =?us-ascii?Q?pwrsNKjUrG+MHavhORKtoWY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac26946a-b06c-42e1-682b-08dce804077e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:45:18.3893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0hUgRB8pXLcEp6XeoN0CHaxBWpDYJcptnH65sJFmWqDZDCumNXs1evcGCxbd8McJVZ5IE9XTN48KlesoxMX2D+UjOza+XcejfNKfdGWm9eO6npbNPX3/MHygdWGJ5pC
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
 sound/soc/generic/audio-graph-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 4b384475b972..7655425a3deb 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -372,7 +372,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 		cpu_port = it.node;
 
 		/* loop for all CPU endpoint */
-		for_each_child_of_node_scoped(cpu_port, cpu_ep) {
+		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 			/* get codec */
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
 			codec_port = ep_to_port(codec_ep);
-- 
2.43.0

