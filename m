Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E895E6DE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABF710E0B5;
	Mon, 26 Aug 2024 02:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="aGhecmSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B3A10E0B5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJcgiq72BhUFzgfdGKrBKPnHsjinxKZGJxDEFODmdFnbElCZqnue0ZDVlGaM4nzGbAdDTLKkYocxSFeENWeekeExtONIostLH4OVRuo6gdZQLVakfQj7Heay6AgCHaq5uqnrVL/LXH8RHACYHX3QN6OZrlsGGukESjY2wKwq/GW/P589wRPLDpnG5sBealp3AQZ4frFT/LL1uMVvNgvTNBH4tsf3+Sy9Kjmqaif/2fH+bPQW89bfjoTXSLo+1JTmiys9PBcLiUDqw/cOQYMduTlqbhDlAjzMPdye5C9M0tsTUh6MZeioiz6Q19eWpRd26HEFxUXcdPNdIHFluzJEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=etNEO2CKjDxuflhg76PqWMtN6xtK0VP7+RbZ8FtxomyE1vNLZredwJqBWF5fcPQbGeqEqYaymCYR6XHR/wkvytFh0xLrvf7n9aSJ7kexS0lqzyS4k86Pd+3q94kBrcnYjTQOfgFkb9p9kahPoIUCNUu/nqTqmm/wlFco7d7NPfTXqjq+oBOaQ8ddxRnkhbc10lGvtFfn0oHdpymM2jFEPZjx6xpMPr+ovXaZcz9Bd2Xk/Tue3DJUlFB5E5ipYj9NtRxhgYxSa4pnS4VW3fCBPie8uH3F4fiu37amjLh5Ey4pB2+MTW5sBPsDiW4XsYOCLx3KBg4ruGFcPP6tL9JDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=aGhecmSoQ2FOiW+YssCOZwtPFmdmHsQ3fUZgZokVlSC2CU0pCcPersOKPYi9CgpMuKEXCxBexV+uLID7d/WhoPbLHhXisQpgwa4baUhTwe3b5brKCSHaJ32N+tEE8s2L6HsNAPE8j2eUtxSQGl8MiQz8KJYazGrQwrUZbbFfeGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10616.jpnprd01.prod.outlook.com
 (2603:1096:400:290::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:43:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:43:57 +0000
Message-ID: <8734msq9zn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 7/9] gpu: drm: omapdrm: use new of_graph functions
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
Date: Mon, 26 Aug 2024 02:43:56 +0000
X-ClientProxiedBy: TYCP286CA0313.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: b8158057-2205-4db9-edef-08dcc578eeb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hawxA+hCtCvpQftLfjwhcI1rq99QqqxYRQg7umDObC1aJivsHkNqiv/ZIeKM?=
 =?us-ascii?Q?q5suhF52np4EB+YyClaHm94vqGke0itQn0DJwHxBOwZtxNZpdRyV/8JX3nuc?=
 =?us-ascii?Q?YS9ffeEwERgFLBJUSCCsJcgv6jPK50k9+DoJqz1e780evFuJT4nD8xFn20i3?=
 =?us-ascii?Q?KPb7E22jJmqzy13fjEcGW6z3UXMNNyLVZoB6nDuZvTTvcQsfhIjje65HLuY5?=
 =?us-ascii?Q?Flr9tsr/xE9MEIR7aMVGYPG6zH4ue/VMIWVLAZ+Sklq3wPOx715VLzTW49Q/?=
 =?us-ascii?Q?C57aPUMA8OA/uar7WjXZMT2zwerGLqoLKZ/iRQqmz8Nza1jJVCVjZhEJ24hb?=
 =?us-ascii?Q?/4KfcYM8eR87xgC6U3JttRXzrVB9kHAXsHgyTskyjjMZJM2M8Tm40Uvm2x3R?=
 =?us-ascii?Q?h1rzaJqNHk0Jn3BnmLHOVV1M7BnitlFNnYqsa+qqYkbHgKBkcCq/EwRCfZBZ?=
 =?us-ascii?Q?KBt1TS67RTK8ti4i+l1IKM5h529PejqsxdeFNayv0XIdPH3H/EnQgZQ75Tso?=
 =?us-ascii?Q?nQ6WGY2lDOrTGS+P+bF1Frkx0HTxmoCMxAMCnPJKl3Ah7l3XLBKzjVgxxVt6?=
 =?us-ascii?Q?sAUfwHmOfWgcxRt2kk8iX3WpASh5kk+j6bw/erAdKUxEMFw1jV8TIerWosRH?=
 =?us-ascii?Q?8gxxyXIKE2xwcQUlVuROrqOxg9X2RHBSiXI9dPXZtvUoz+wIfp6tQUdKKkIp?=
 =?us-ascii?Q?K90p/8RLglt7LO8bIRiqJzdAHa/v/AfGsrnQa/e3PC82vBciSdkEb7MUKmCh?=
 =?us-ascii?Q?k7WQoKRSyZTKkTjBPGRI8LDcXPFj3Aw+jdCHaoIkxwY6xMX0kWW7Q+QdPyc0?=
 =?us-ascii?Q?ze6k8SljMSeoo2QJKt9Nqsmb5/aGdvI3BuwpuZ9Udbd9/TvJN7RPLq/NlLkR?=
 =?us-ascii?Q?xNFlUAlemEfSWr+dPEGZdNFNfM11tZ1Kk+gU7JLn7R/H+FWtToKfbbbc3VXb?=
 =?us-ascii?Q?pBNqsWlwrcJZY047VabBZH7JKpbgik5yUB5uYU4m6jmVdJS4BGwjPYNkqBLT?=
 =?us-ascii?Q?c4NFuSAaxYrqBEc4m6+wdbqtiPn1+qI2wJR+oR2Nxtlrta+QQO9AP/YaNsM3?=
 =?us-ascii?Q?pENmhZDnY5qjfsasRvOuu+QYBeugjlm2X1KuiwoLi508kMleAsNcVdH2jJSo?=
 =?us-ascii?Q?8S9D0hctwry8TbMt4QaIVrI3MAlw1NUjp3M+KlfMLK/XM3nLGUpYis/YlNE+?=
 =?us-ascii?Q?X9i94BShn0kSm/4mAciL9RJX/s1vlVOZrZyM0BrJvOOBwI590kXM5fkmPuo7?=
 =?us-ascii?Q?RqHx/s2jeYUTRjLigK4zysotPQh96rJoRxkcgR4yTPTe1g5PdXj78PTvljtI?=
 =?us-ascii?Q?UXha1fDVExbBOPS7nmhnaZhYkMG8D8ibiJHo9VUb9QHoyn0DHu2zVT3jtiC6?=
 =?us-ascii?Q?a6yEbKs6L3s38IHM+Mw6rfQXpZ14gd9Zz2FQAlh8jcAOAECHyIuPrY/AhO5x?=
 =?us-ascii?Q?fYubR38W90s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f8IHcNs0s/Ic9rsHJIE+6GrQMJac/zc6xD1+V6f718/9TCgxvJejeo6rpvco?=
 =?us-ascii?Q?oC3uUqjbF4vcn2QMaZ4htbRfs1sbBFbPj4044vuzeeLG+aHTnqSc6S7gDKtH?=
 =?us-ascii?Q?Kh/i5w/bDIFvfUSdi+l2kDm3iVkkTWNS/+VetJP6CSGPsfh2gBsrRmK5ZOut?=
 =?us-ascii?Q?0siOrj4+CBiahReBV34bBxijIMWpvRREvFEilsn5zJhIOpYSOP+13beLyxGm?=
 =?us-ascii?Q?ROFPoQojchiC5AQL4qObq2UOx5Z/RZ4Eg05KAF0xAjElKWIA0CMQ63FTZ2R/?=
 =?us-ascii?Q?d2i/uQVQ8bvDUnvhb6Qni6/58dgiOZo77GJTvP2aBSgQkAZDxtFVLhi9F4wD?=
 =?us-ascii?Q?6eZo+Go+SSgen+AFK6EUBbX6uM6oFk9Uf3B3Ykgxm1o2VuRJiwGsqF0ofm2R?=
 =?us-ascii?Q?iaRpK3XbTtG7+WfDphAIQ1ZIANUtEWz3j1vcfc+1o475aqJa8u5UFHXt0D2u?=
 =?us-ascii?Q?TLT0MXsMcqTONJUyxvEk82J1znHFr/IwflyQZCH1H+FoZksCQ71sPn4ceHLC?=
 =?us-ascii?Q?9buiaXhhwddRPzFQmW0jKm1uX+Bfy2CQKFbbZwQeqygG7Z/J14MtUYylze9T?=
 =?us-ascii?Q?UIh5SsWsEeQE60Q97c+yVZusmMvHWY1YBcHKU+ET1phutq9gcu+/SFR1R6xL?=
 =?us-ascii?Q?bD9LbL09PpJJCGMyO9ZXgcdHGLkVN+NuZuZF0VU/nGwMUF0pCoXUgJqlPJGv?=
 =?us-ascii?Q?9HhAcaiWwIlZhLonBgywxPM1Gn7/yQQi1naS1IsIE3TG7Bbk5bUZYARXkeiA?=
 =?us-ascii?Q?ASgMKvhJaFa5EH63mDbZB7yqtOgscW+uw33YSFGnxN4CuSuw0NI+tMZb2Fme?=
 =?us-ascii?Q?xtO3KQCI3tb/lWWG1S7F5oCsbX8EAXRIceD8SxxuVAXjX2XGjZyIhboqkCRY?=
 =?us-ascii?Q?O/oSMLJRJxdsReb3K4+hs6S3vp2QtsE82EGWr+75D4o9h/o5e3Os+SrAIKY8?=
 =?us-ascii?Q?rsbuPd2+716g+ZGH+afawSdUOqo6D3o/Y4zpeOPHFirxG4SCeDrfzanNMedh?=
 =?us-ascii?Q?I/1xaEscyqiQ60El5H0Ar03SFbp+vC2flfmgOJC+LaLwqiU8Jh7yZMKg7j6r?=
 =?us-ascii?Q?1d30x1/LZL3TZ/uL6j++N+FtB/U12FYjm0V8l20F2gBiw6NwLEUoaleTfGdk?=
 =?us-ascii?Q?GZT+7k+6tKy1vbilFdIRHOjxHmQrUS+YQytTnkLfCYu3gzqDaovfNgHBl/yP?=
 =?us-ascii?Q?PW/hc++XNPqo3+PEyyWS2efkEt+nHHBIHZbmtp3Gdw3iKvkLD8hFg2cTA78s?=
 =?us-ascii?Q?vv3LppU6mz9iMObOaQHY/Xg635PHGjnicV7TZGfYoZTqgGdNcPp1zjCw4NDh?=
 =?us-ascii?Q?OfcbJ745GROauBY6NcQ4/l/Ui4dYXnfVhjbsnv/Q6MwwtULTQUeAqegi32y6?=
 =?us-ascii?Q?miBSHWFwUX3hNeZ6eQkgG2siS0RR/Aah2bV+NSMBA3ttutozQUBXsCYj/IPD?=
 =?us-ascii?Q?vSD0GtfaYsKM225gXLscDte0d4QR7Uv/xEojU3HYHu70pCuAJeQqEdwBSaYN?=
 =?us-ascii?Q?UWN0teS6mZvLFygFjMIcduidEh6gaOerg1k0obhfeDsbofCdoBitW7Ka5m+5?=
 =?us-ascii?Q?+JZ2mCqvwMqCWEnl+Rvy0RVlsIUbYeScEzAb70I3GP1fuZFgK7dzAawNeMC+?=
 =?us-ascii?Q?M1VDQ7W+FuVMOk30/IpyODQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8158057-2205-4db9-edef-08dcc578eeb6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:43:57.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxh6BDi6WsxfKEmuwV7komwL/inq2rAJ0+8qoKcxFpsqe4UGTrElunzpvMVkiaAKUVgAc3/JvmfJsX9uJnuYcI+I9mn5p6LlIvV0KQ6Qy8dwSbHhwcPeEv5qx0hhY1jG
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 3 ++-
 drivers/gpu/drm/omapdrm/dss/sdi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd00..b17e77f700ddd 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
@@ -709,7 +710,7 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b94812..f9ae358e8e521 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
@@ -346,7 +347,7 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!sdi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep) {
 		r = 0;
 		goto err_free;
-- 
2.43.0

