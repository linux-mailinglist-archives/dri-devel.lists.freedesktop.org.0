Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1037496B128
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4D910E641;
	Wed,  4 Sep 2024 06:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="NQmOPv8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound.mail.protection.outlook.com
 (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7FE10E641
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COOvPaZj63/L+oFB9IIm+L0l0uIb2sm9Wwoi96f5d9OTjapnTtZ8Z7zaryPhGUfYgtRuDJ9JIRrLLNwkuM/pXle8wpDBfS8TB3Mfk7gour9c25pPeXttAq8xZ0J+jgbQjdQWVy0rz84rDqi22CpTQzVBKhcRnZ9w0WFsZo5nnZX+OkknBNCM7La79xX1VzkCEACCkj+9SMVbRHyNyKCJR7FKeVQX6Ki0rIRU/Adfvhi5dw1QzgP5b/8vYA82wC03SY2rznkvV/q/z8EzKnI0Quv8X15uew8O5ItwzPHQLV8IhlZNMnk4OPHk3UOEWWabGlZkaVK46MxifqttggrzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=QEy3pLrC5MwzdAgjOG7UKjmDrD4haZtJYEgNl1zvOFDQqQeRjdQWQHyfVNoCDsUDq+ko6X7ZzzR9ToLY30xrcTh0dMLfgx5xTfoH4/Rqagbp9CZsobh/np4NP12iK05YXG1gVXq05GdF4g73mUbcaL5LQrFRUtqSvLWTfoKzfREzFtO27mVjuCQlq3I8cQr/ENb4Jh3AiuWv3J8qFT2nF4hRjkiW+c/H3RlRZii9vjCD3731o+uwnXoojEJ1a3BWyCdEEBd+ckd5gngKNwaEiIAerxM2OFrCU3oKzki4oLFNm18irK/lCgr/eNUCiwXV4+6BbhAvHKXn+IS46rln0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UeslM4FQH6N1O2L6SqbvVyNONUE0o4X2TQYeq8tCfA=;
 b=NQmOPv8s9IRfqgwG99WcgnnEFgsCFBx857iIMUNytImWGxafUaNr9aaWsqS+14gJqfVTPPZjyFxenaAzXFhRskPckKJ+6hiS4RXryiai44Lb9L2RphZP5WAoGUlfbP91xXAwDCqwxqBKJ7KFMrzigTqtrkwKQw4emiKo2/D7raY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:40 +0000
Message-ID: <87h6aw6j8j.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v5 7/9] gpu: drm: omapdrm: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:40 +0000
X-ClientProxiedBy: TYCP286CA0361.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: d253dfe5-7d3d-4296-36bf-08dccca87147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6G7SYOzV1HjALQ3d0vfdcJLhvV8IZyZVAi9kuZaArpDb/RSIAMHG7/A2g5jQ?=
 =?us-ascii?Q?tlzkTmI2Yl5+KjsIN3ltZdy7e/NaNwPt9SSnllcVh4jbTfpqMix6/YPu+S2L?=
 =?us-ascii?Q?3OknzYv1s52K6SWe/aOzDYCJu2QscE8oMMMwYmdAoFv+5/E9OAWtbefzkhDL?=
 =?us-ascii?Q?Wo0W7QOMbSW6CgDveVO5JVAorT4PBIBd/mFohqW9zIqLsG0VFiwaRDUvpNSJ?=
 =?us-ascii?Q?IoGdpFjelGh9bkXZS/8rkxN1WqTfc0krRtTJTcaxqV0bz2kCpkkpkfYk+TYe?=
 =?us-ascii?Q?aI3zQI9tNmq6/9LVR/XGlHTq6c4NkT0Tfs2KdZaNbTwjY2v7uR57eitAHW4P?=
 =?us-ascii?Q?iHO4VzDKua3mn9UVDr8vzJTgphZZWbHRy57s07NKd8EJ8jeGOow2EkuOHUTp?=
 =?us-ascii?Q?nBKnuvtzwBxMrc6cneXoNe7xwLdtQf4J+FisET4dF63+lA5XyaVdzIKKXUkM?=
 =?us-ascii?Q?oMxdFmeSmrVUTUG0dIo1BZR8SXDEtsy4Swd0PWtsD2R8JVSSV/iE633/I0lO?=
 =?us-ascii?Q?lZcSPtqs/s+9QJFX7XLpcU629UqtcoKGqlYYR68MukRM4b6NJ6bU7UCsB7ht?=
 =?us-ascii?Q?qWT6frctSJ6BhAmFjKb+DYf//5cBgPoU11w0YUyHm6uQ025YRVgA/nwCqI1I?=
 =?us-ascii?Q?NkBcqqNv8XWdMd+e/MjP64Hznf5VP1K/+QGVPAKRCp8iGxcyphiofxCl3G0D?=
 =?us-ascii?Q?2gALCwyaDaemRZRBTb9B+Em8JzENUDM93/gQyOzV+7Opf2Gxcswj8Mp3LVWW?=
 =?us-ascii?Q?Zxq0ZRLPvQJL1mCnvb78Ir+QB+75n0E/wxUE+kQtR4ua96RzWIHvjvRd+nLc?=
 =?us-ascii?Q?QkR4RuaGj7FoOW//yFgOeiSuqF6X4g9W+Hqy+ZXX1Yjp9FRN4De0dATWUaUt?=
 =?us-ascii?Q?VNSSWGG5L5uMCOUsYU92X7rxhennCOEsx3zLBCdYmVFBPKngqsWS0bYnvEtu?=
 =?us-ascii?Q?5ig+uImElsECaGF1+NzusJ2QG/9g4fgZziUjdfwRDLGHnPOxIuh5CAnDVB7P?=
 =?us-ascii?Q?XRMTGKtGZlo+DL7qBOKr1srUGj/TvqgRnvSBCUllJVc2LoJzstXoUBIn6xtt?=
 =?us-ascii?Q?ehmlfxWzIerF3oBW+A40rL6ggqujbrUPW+S5jawJJjZUqS2nA5aO79sTtkWS?=
 =?us-ascii?Q?l+Ufnj+b80RepR87pMDztnD+O4kc5KqQZwbJ3TZsA8dbBpMGFmFS9BV7daAK?=
 =?us-ascii?Q?WPDWCgslK8bP7wtgxDIdgK59Dc39hyZSk0HoJpg49ywdlPr4iyvijB9ORapE?=
 =?us-ascii?Q?DTaH7rqwJtNFkgrpRjFrrH7+JZ/yqdAPZGARjzEm9/jtyqF2tIhAR5tu4oX3?=
 =?us-ascii?Q?DTa58GxzIp70Yp2R7xgiX3TYvjXd9FPRIUC7DkB0eikpKK5/pumPhp2/Xb/d?=
 =?us-ascii?Q?Ct372Ky3ZdtSQ3p6rw8Qp6Uc3KwKR7Q0ZMaZS/l0s/uJ79K/wiC9rHchzTO2?=
 =?us-ascii?Q?W9DW8Oil7Dg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S9tdBJEcJvsPXb+NvZwVYH+GCulIUXDKXMJaVDvisEYo6Ow5+jCWfIIq3vrI?=
 =?us-ascii?Q?Y0IMNLa7+zCYw6Gl3PZ3HulUuXxPvW6HjfWjbAuvADoitnLr6tC8hcp1fAvA?=
 =?us-ascii?Q?NNgkM686wAETkMOlEvm4HgZpf4isKi3Sp7Oi2WsGQ4OB9ecZK0mKWlydmvXa?=
 =?us-ascii?Q?bOfDv6B/H1gVoGVuoLA4m331zf2LSIHCgr6InZLwBpxNe0hWfxPwJyNU2M6l?=
 =?us-ascii?Q?LE8YbHyeiozFlsmoJUhCHwP7oKAsSMjTPZWenN5HzEj+b0pwatAxyIEVGUhC?=
 =?us-ascii?Q?aIqUdXD1HEgp68olAoYTsxdNCNoVekWawUhKf1DmmIFvozDoUepjUPMQoQvT?=
 =?us-ascii?Q?nUlVr5S2DfsYHfSp9uftvPGVCdp/nWgxlksFWXoj4/hWrU9DmViY2fDTHZSZ?=
 =?us-ascii?Q?Sa5iab4m8MkXj/jfO4pNVgHD1yudyqog0Ceb2eNIMGQJSNenTysm6obmPRhN?=
 =?us-ascii?Q?ufHpDrUhmshVK53jhVi8Wv3CRdFrWOLTgYzV9XqdDDXH6IENYTnkpmSw2vLM?=
 =?us-ascii?Q?ZPSM3wTKpFHIzQYMot+QVttmpkL9EFMPDHE/Av7xy09qz8zxT6KWvdEBRwXX?=
 =?us-ascii?Q?i9SqBzp3gjKgsxFB8irqi/DL0wOT6l7wzjyFTgsDF+7YTGbWsJHyrqI90w9F?=
 =?us-ascii?Q?1k4S5htlNPAhdc05z/cXv4A+DBWypHy1kufkq5xmZiIZI9Hr06ieeptG1vME?=
 =?us-ascii?Q?o+z9tl9pQrbTD5HMGODOJAyMwckbBovLBcZ27p5Xjp6eiFJv/Hv7K5Wa8aMb?=
 =?us-ascii?Q?ZJGdLatD3XqhcgR2PRHQN9OWY78zGuh1o9f24g4xwSo5kWzcM6erCVxMMu4k?=
 =?us-ascii?Q?0lX9FcGZF81PCjvX9EZ2g3uyGL8ecpbFJzbHnJhAS428Y3ff/isY2UQIMmIi?=
 =?us-ascii?Q?DDaVId/bzSemKc1TIvWtPzZKWD1KpLqHSeqjp5s6AIh5jCoviQeoTjvhsR0j?=
 =?us-ascii?Q?1u49IdSAX0+lsbMZjquoSK+xd6sAidju/tHWwwf8PZ4BxqrrIfdk8jHiRZQz?=
 =?us-ascii?Q?SNqcw0eWTHzsyRuizkpBynIShDJVu2p2C1h7gQ4U7m7x+lvwnSwmIZtx2aqN?=
 =?us-ascii?Q?oHkK0zNu39slH4XApmGWbo0zKKJCg/Gx6DemZ2gbzNvtvVBs/W7vjtVmPChd?=
 =?us-ascii?Q?g+30zzbB4BbzuHMTUYK7ZzkjT0TKdc4ci2LgA/7PXO2gSBOUGVXSHDqfU6ta?=
 =?us-ascii?Q?J06T8IrRNWnkTOI+hVW7N+9QrGm7bcJ2z1AbDmWcNOxFgfEXDM+z9NsA9dA/?=
 =?us-ascii?Q?pBhCBmUmglqAaVCafgt3TlHtH7nN+vXoxe5aTaKKswh39P//RdrH+TBG5xKd?=
 =?us-ascii?Q?/t17DulSKYHzYrZ5Oun5A2F7gPk6lM0pWKLfuoGCr4Vuy+WRUzGlbImZVncy?=
 =?us-ascii?Q?i+BMlcLDCU4EpfOIi8kNsINdyVktZuNEQUu63ufG3szR+JOwvatOCSWmNdtY?=
 =?us-ascii?Q?cbYWvVl+/Yay7r6kBZH0pTfIVkw3vJZ6OpUskfURuycTj49xE6VoMdgJiVK5?=
 =?us-ascii?Q?au1weRsN+zr3lVYebM4ab5Ka9h7NPJD2sL017FwOCsEQVxYube5f2EJ/D820?=
 =?us-ascii?Q?qXkbSZhUGQbzCmANFKA/4cmQ2AMEhMAY+4ecO0Ro2LTyBRhW8F/sWoKYNl3G?=
 =?us-ascii?Q?RLLYyRXS9eLRZH3lgoysEM8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d253dfe5-7d3d-4296-36bf-08dccca87147
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:40.7814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+DqU+/UL3IwtHwREdW0URNBD+/7W8PPXi4lMO/17AddVsUxDXAHrhU8c5rVezmOu4nLaA8cQMh/pJQoGk9i0Ou+0JRRgCvWuv5a6Y7qA7PdgFh9mnVef04UxXTTGO7T
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

