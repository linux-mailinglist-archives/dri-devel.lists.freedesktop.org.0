Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBBF9AD9B2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073E210E88B;
	Thu, 24 Oct 2024 02:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="CBQrQ2lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1CD10E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RA0sgQcIzkpBLE6v+nV1OyriqjDIDaIYaRMxYUOeMyNn0HSzN/ShgKwe2dbVGkiHgbxmLpMUPHAQvyP3ewjZlazwzHwOLOzF6hoZj532rCVW3BpgxcNYIJrBCDIR3GpxnFspZzEw1CzFgXXoNR6R940r9UOkAqskKiAHvyPxz4m/GG6DQCl4Vae7lOP8IVZBbgvlaFzQ6X9spxCRQpZqEiOxYlEIKUlAz9ntS5DYdrRGSm6klD0y8k9ZcnTbV4Y+FVmqWJ6xUsh9Y31EdqBN6nWUMPMu2bB5juypxptAXFZ6W5oZb3M61IWcq+ZkIsvZgZgjKAOubQFRqXg2To6VSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6t/TBu062eNpxMUIBtKZ/65+OqkqZOYyF97oP1iAYR4=;
 b=sDh0gTzZGswcSkGUkkH0j8e30+AOfZfsXWDXkdJPzZ0wH2dFwU/taIkGnrjMEK4DFfj9FNy+SDFCiEhu8Sc0MGpbkMnOQVXlla6ThSdT6bXJCLOoLCncT6UBpnyVJdYBhCupK/PFAwAYG7oF3N28NjjcjmRI4JHnmQbm2r0KO6KcfkvnY1oNBnITKg3pHZe2l48AEReOBcKmxnrrSB/bbyDwWWApFjEFT0mLa18on8rjCW6eoCeGogk5ljyaIaLlghf/LoB6SVpAz7bdlmgHjQD5JuIfP9XHzcjsuz5pVEoIWZFqz1gzvnxAINJqL1i4itMLrWCyuaLlNUv3wTNe1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t/TBu062eNpxMUIBtKZ/65+OqkqZOYyF97oP1iAYR4=;
 b=CBQrQ2lr8DsTiWvsP7lInhzq8n8Q3+cOByNxFpvCsVkR1/DrJCDzLUbivQe0d2HzAZB49SPn40ZeJbPszoejBzmr6lkoHtiwgv8jU2H/lrv/gDmoNgvrJNGBydnnqjMCzd6Way42sqWhsbKctPRfI32wnt+2zmNcZwkdiW3cfLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:31 +0000
Message-ID: <87cyjqb5sh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 7/9] gpu: drm: omapdrm: use new of_graph functions
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
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 02:20:30 +0000
X-ClientProxiedBy: TYAPR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 246100ef-a08c-44da-c3f7-08dcf3d26eed
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qdxvJgmFRloEDc/c32nKpH4vqy2BFa8DrlgDFIHoQqM+oH2hIHUrag7ka6UA?=
 =?us-ascii?Q?6ZjwMZ6gI3wUCAtvldF2NVQLbqMU/tOoHLyAl+22NANrQP/hLyjyukZzFvB9?=
 =?us-ascii?Q?GTgSFIlFt+NW0PsfvqnhasxR7b1t9xIydrXkWTKxMuvP0qPLmFNb56v7+tfZ?=
 =?us-ascii?Q?YMWiE+zk2pLuOgmgR8gm6kAgyf0qkxaheFoXOTBkvnXUaPbHoycNUsHuFIVd?=
 =?us-ascii?Q?rk55T2mD/zCpu66x1Y1ucQh2KM/kdelS2ZJ017r8CzAYTtAjpB1wcVqGCxzw?=
 =?us-ascii?Q?Y6X+SS6krSX+tQingC4SyWQnu6Z8QKY1FM2YVFTFFC9ZLId7zBXH21KkTTFx?=
 =?us-ascii?Q?ur7YH80Dy6VkUnbAi1LQSvcQ95HXBcOfvSydgxpFWrU7XA3D2BZDr9oLAcxq?=
 =?us-ascii?Q?b8xjMUKRKFiCGFxpFmJLz+hO/R0xoyD2hcbQaGEC93P0534c7dWxRnM21hV2?=
 =?us-ascii?Q?IyEKmr496J4Tmsd0URVf1yGLoB1rfIAglZpiJJTjQg0NJWQI0XJ2J0K8f3C4?=
 =?us-ascii?Q?HqTYfa6qcEwLP+j14GOXh+9pq+ZOXayrxmJ1andOu/OWUklBr1bAupmy7uUT?=
 =?us-ascii?Q?9xxkaKwnp9BhqU1yzATH5k3X7iDbWQsBGLz+9MmbcJOjsOLgrl8hnWBMTUAw?=
 =?us-ascii?Q?C+yhhduhjVgKNsK577HNQGS/gyVUoPon8X2TebpwAdbbfVQHR+18/umMgePM?=
 =?us-ascii?Q?tmWMErRlXqLOocHSEF5wDIkI6iZr+vDp0P82pcN0VD+CCiuQ83xIDA1Scipr?=
 =?us-ascii?Q?+Kkbmh4avo81ZKig+ycejf4GUGvbo4k3j2zE2tQLlb++p39nhWXQWkUyBbk9?=
 =?us-ascii?Q?uFjvhcCxded36ghKDpcqQ0Jnj+/HDRbNW4I/UioNeAgQi7McWmG8jHIRFTgf?=
 =?us-ascii?Q?QtavX+2Iw/FENNL6mONVCPrYaSyY6Wv14hWRIri6o9XtlHcoXWzHnjKLF7ce?=
 =?us-ascii?Q?6YErip0Uhi1sloIyAlnu3LhmGOJSqVxHartNgxiDUdm+mwlnT8FAdXE5ocSW?=
 =?us-ascii?Q?QG5qX4Hasz6t9v7ItrRBKBrTk/9jd1maOAHQ3gSXN1OAf3BcUhwKoQROhJpq?=
 =?us-ascii?Q?KOYXECh1FxRmqrHKV4Ph8hTE7BSZ3lafidz+rD8y36RWcQVXv16rig/298gS?=
 =?us-ascii?Q?FIhZYXAXpToIWLP+AKgvswRNaNzH2DMwstJCTIoER7gF/oPWBn8EoAC7enSI?=
 =?us-ascii?Q?aHvj9iH+HVmqB+jKYbwahHZUbhml6tnYiwFe2ztRip7TBvpweRJI5M6VH0pL?=
 =?us-ascii?Q?IUUsKwoPDchQiC5CRqR6a1VTYcxdXy/c5olCTpqbJy7IF0rqs2tGyqkUg4ek?=
 =?us-ascii?Q?NWimM4451L7s8nk1G86+UqlnPlgtvt2kgHUSAx3m8Z/XS38l3A3G/WkBl2p3?=
 =?us-ascii?Q?q0D4XL6FIEUXXXmXuxJ130qWNSgN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H8G1UwQ+e4MOxTut6SaWIKQFE32thUOHF7fLZCo12tbuNLxQRZWzaOMB5R+M?=
 =?us-ascii?Q?3Y9qtUq0MUY9tHWIRGNWSsffo06WJfKVGuaUyIFFw2cXU4aVuii5BVELRoR4?=
 =?us-ascii?Q?7za/GTNeY6mKx07NJEW6lQhYEpKf1MM/jCPfRUYPQP6kMRgg1DqXwe/H5LW8?=
 =?us-ascii?Q?wTrWhNe24yU2b757ExE0ZXiCElsYB39ibBi+H+q4QN8OQEDD2KBT7k8syAkA?=
 =?us-ascii?Q?FhcupuD7nJ9YHxAk4Y01uGwAj8fRiSKBNleXPZLiQE0y1RcKqx9S8ot9lpdM?=
 =?us-ascii?Q?wgdAp7jiw20N3+UWH8urSoidqWq4NGprcJwvrY3m/kGadd7qRQBBvDMnHgyg?=
 =?us-ascii?Q?yViWqZcbaOrF4FE58sjeaJeWGVxdWpJlhAq8QGeNiUkBNkl3Prh+9hDd3F1a?=
 =?us-ascii?Q?xa8hURJx7l5y7auRD2OyInprgMhdlgzPtMAqTz1W59Q/Bine+xmDNEFZc0oI?=
 =?us-ascii?Q?Yolvcl8lokwLeq81HVr9oBxOpAJYKFcvy1l+ZIu2mwPB/Dh6BxxHqDw8SegL?=
 =?us-ascii?Q?DqsFMzNO91gJVmAHTLBFYxcsmxNHjgL9ot1p+og2XpIQA9kqpVYP1d66N/OW?=
 =?us-ascii?Q?ke5KpxhMB13Rb1yPUSk118gw0YPxVKYJKOYxyJD17RCVbNoTq67Xbgah+XER?=
 =?us-ascii?Q?l1A0Qq1o0vXIvSBAUmqhYBCRs4ATr1wJa7rfM9Sn01DIowor/6uX8zSBkAcP?=
 =?us-ascii?Q?tgPVIIQfMehtEFzIS8LwOWlu2HISP/Ylqb/YJ8gcJybEnEjY/FlY1o7WNRgY?=
 =?us-ascii?Q?QvBbPPuJsnErOf9YsUQDotmkhhndeQ566coBZVJCjEinE18aPkNE3OlCHSMH?=
 =?us-ascii?Q?lXnkzZW7UJObS1mcRZwiBeK7PhqjsJ1WCe3jWvBULmZvaPUXR0dhGTI39pgH?=
 =?us-ascii?Q?5r8sAvWyddsnoXjO5upb9J3kB18tUcm8Xy1lWvULmTMaifJz/IuOquFGdEnI?=
 =?us-ascii?Q?kejTieGUwExDh+rUTNQyNZ8bLR/SP4HHl9lOhEPUCiaU1FPUczNhbQy7x3SD?=
 =?us-ascii?Q?kGlCJF+eYNzqWWVguNZYRi2iSJ/F5VZ6bAxf0Lq1xwleIjN9GRz7VPuwKxKo?=
 =?us-ascii?Q?7x4sv/CZ9u1k3rRKfd61uUdmaHaj9fZIXIRHf7uoioKNSV7FFwRbYox2/0SS?=
 =?us-ascii?Q?f/moGvDiE3GGboWmV/T3gng90p0eDYiO8KGtIo0lg4uJvx6djFV77ZX27nNl?=
 =?us-ascii?Q?WMbR5xW0hQ0NFDqFHNBvSb9Kd8uPwyVbjR+iCcJwQGIp0G8cXfY5jOI9uISh?=
 =?us-ascii?Q?YlQ+mfypZzlQHHmPrqsR+8mAD6HJqxwGEHerx+AiGSS4xtnmc57XHRRZJ4jA?=
 =?us-ascii?Q?2YtkHHf7nmh1fg559ZEJb8nQWb7HamSjj33tBrR85MczcDsVJ71Iryb3cv3o?=
 =?us-ascii?Q?BK5NwT50QywFGTGUthjOA42h7l4X8Yb0PZ8Tp5RqqQCh3CUxkQfyhtUCdGlB?=
 =?us-ascii?Q?WuBOVX5nv8dyco1ivR/UaHrJA5ycQ8SAMhJVNWQC+JZFc1+ziEPkWMowLjjv?=
 =?us-ascii?Q?YeOXEI6heJJya6xUYNiU09JH12R9R/r13HVuIrU2dQIGtFEBItq8zkZGoALS?=
 =?us-ascii?Q?PfLrWVri8pGaFqCGDumgXuas1ZUOQW/yJOnzZ+qFP2TM7ViI3MNK5bK1e9wo?=
 =?us-ascii?Q?VQZv76f4S631volD5EXnCnM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246100ef-a08c-44da-c3f7-08dcf3d26eed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:31.0560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhsW60Tsuo48lYxPSbffxLLXg6QfF1RLj2Vrno1G5cEZqtayLw7g6OGDvUbuN2if9tMZckyddjjI3ekjpXOpRW2PeDTeVNzB9wPOWX4SO2hPwPGabO0VXeI77C+ADZIL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8629
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
Acked-by: Helge Deller <deller@gmx.de>
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

