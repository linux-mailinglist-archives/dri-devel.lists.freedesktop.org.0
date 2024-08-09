Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD094C93E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D64C10E858;
	Fri,  9 Aug 2024 04:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ZQht448R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3493A10E857
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErToRkis1yq0Ulk1F50yFrTMQAKUtESmZmLyXV/0YzEIAyQfhkqnTCnKP8II8a8wTT6fL59XqJjJITmTpY+KG1jDDmLcvaFqWP2lGoJwAYR3mdEJ6kk2zKth2/j+hq72kcxa5iKD+b/52VW57PdQxzfAzPtreTKYsK3C6yFgS4HfGOHT/IKnZJNk1afCkmOzSDMNOseZiutLifAEQ3hihnQFSMW4Mkm2DjdvYEgM8PO/HnbBaK/iQd9nxg5Zuga+94gCaKTlB1+fb1RnPFyfYQ3BTpZpsBodqfm0/4eB9ji9EQVYfa0Puc9kCGlShD7Hb6swbUZNnrbwtWM4fPLsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJTI3fVU7PXFX1tjVUU8Ye9r4QnjQGrtjmmqI2Oz+XU=;
 b=nvRiSeyuE7KMP5NQx5Uil1pMPHsuT/kOpKAwVkug7sZbRRp6ARnrbnvk0KpmcQgu6TmmHaqZ4H28cmh+U5Fq7bLlOIMCx7xrUgP6Xy7trpR6Uf6ZVZ7nl1GTSxGnQo3tedljQQlF2un/KAhUPkwiwDmylVdPVIq6GLNhxHKCRaTpPgJ/A5k+8C5MKlJ/tDux7WKocT12sy+WNbnvKPw6TzybPMuLKBM355hg260ZQqtrFQCiOeL9gW+4KStQ0jfvD3r4Uga8VIRhLeuHyQEg0cY2WwXjbPXRlFrjN8NfeuIVRdl2ESQ7F62WruoJQhETKDKUv6EVnxa8vg0JQWdD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJTI3fVU7PXFX1tjVUU8Ye9r4QnjQGrtjmmqI2Oz+XU=;
 b=ZQht448RcfE8uFrQ41XWg4nb5X60h1DgUMdTH2jXFqPBjPsTwfS4YwLhz/mCTmfPOXMpvpdH0ubxbI27Rw8ULw5ENlI0j1JQJYThSR6z/BJ5zoWgzim/BaxdhHkVYYltkkFStafd8tKV73wCMmKKpZ45zRaKX444haUQtJy+Z8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6400.jpnprd01.prod.outlook.com
 (2603:1096:400:98::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:23:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:23:18 +0000
Message-ID: <87v80a72a1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 7/9] gpu: drm: omapdrm: use new of_graph functions
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
Date: Fri, 9 Aug 2024 04:23:18 +0000
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cce64f-0d1a-4ba7-e9b2-08dcb82afeea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iZ1V49iah9omc0dKrPofuDkjuWB8Pm5ZhLTX03qnwFmwST8sxSeBwuJhUB1/?=
 =?us-ascii?Q?akaZ2ZtgZ0iriBRqmdCWGZbc25VKZWQi+miKGbwG4rcMR6cV5JHhbmlKoiq/?=
 =?us-ascii?Q?UAK0RWxUvEFtLOMk5PJv/CH4PHnwrKWHJPp8BvICI4/X9GBzT2CSDESLABi4?=
 =?us-ascii?Q?MTZtXq15SoVbUHKGTcMexlR7NBCq3VYkWfPsZsZDItwwXU6D07/oPimaxUnA?=
 =?us-ascii?Q?SHgS8Em10r2xTsuf8nO/eb2w73IX0Ro90w+HTiPyH8PRC7f5g4vSXG1qC2mk?=
 =?us-ascii?Q?wUh/pA5i33JiRFy8cMYKeHRf8Cxp3O801BlB9EfyVyVqA4sIVQTSh45glyFi?=
 =?us-ascii?Q?iHKr2fao+/pQYcgJXXqlEI6aSVduC66coNGR+VkfYlL4a2kAHIxs1ZcxX2J2?=
 =?us-ascii?Q?dqMruucggnA5LyrM1Dw+0zdh/2MffSIRQ2CmupIlgBFQJ0rZbifuZbCXTHxv?=
 =?us-ascii?Q?f24+tN6dNJHBH6eP2cAC12mE3Lvn/mBmz1RgyEQjT2ipi3hgrCtmpQPSk50P?=
 =?us-ascii?Q?3720A/Xh+OpgFetvhxRc/6qI/Z/17kYaHyhHQa1NEFqgkNJrd4RytBzPtJGF?=
 =?us-ascii?Q?0jN0BFUng3IuTaYywKhlBlBVSRDn2xre/+vwsVvdJ6+o0vYHZnqVQh6NvEKA?=
 =?us-ascii?Q?9h4Fy3N93H14HXLfyluc+y+Vg6lovi2QIooiYpQwdvBFlflcLagIvw9hA0Ml?=
 =?us-ascii?Q?FXfbwn9IOk3qiOAeLq4t9mR1I0S9nVohEo/mFnkdrkjw8uzU1vEMxUeUcqNs?=
 =?us-ascii?Q?DzCAGtJSYXGInLEBh3BsxwceWBqeyP6ZsK3QlrgPbQFolOqmiwS4BMtbwKyG?=
 =?us-ascii?Q?fstQ2sSxTb/nyc5oSmgDBwovC89mf0j/e0vD7HNeCIehTPdAHyuKr9TeAV+I?=
 =?us-ascii?Q?r9pUlQ6IKF4+xAgFGpe9Kha2GtXbROeEztES3AvAS+neT7TlQHvHypGah3BC?=
 =?us-ascii?Q?Fzp/2TQBMU2XleK377P1Att3K8pfngdqnNY3Kz3x8euXFZ/lGeIwM4kapT7q?=
 =?us-ascii?Q?I720C3PCWgQ5DOCN/+V+Y4PqTLEhFTqjVYearhop0yw2seZY0baNvHqjn9Eb?=
 =?us-ascii?Q?UohgseJ8katZFmG7P0XzFMp/k0pmw9AS0bs75OTEJZEFaXoCbiccQHh4E0+X?=
 =?us-ascii?Q?k2JPrV8jMosOELaQVWcQLnRU7trb1KOrBKNmV/s8Okl7AMRFqJyQwUpoaCkN?=
 =?us-ascii?Q?53rta20N3p4gYak/RpUkKn5EXaIBQNIKGPvK08Odk32DwKx4YGSO84SKc1Er?=
 =?us-ascii?Q?3PtBy89g417uQ3PS9NaK9GEnWWmQsdVPgfzvsDGKCU+0NgfHCRaW1owYM/46?=
 =?us-ascii?Q?JF/Fk8z7/9FqDRZYqHhbDqiFdUFFjNiQV0PbbkxBLTQZY1/h623uTRd78Erv?=
 =?us-ascii?Q?3vk//KlUvi9xyBYxAA8TPJ/3z0hL/eMB+Sw71gmV+IzqhmJg6uqf5rBobpUA?=
 =?us-ascii?Q?QuX+3Acsesk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fnJpPTPUAvoGA9zXKD88pfQpNjN6ZrCgl2mTeBXoTUbFIgm6tbwKezYJeuhZ?=
 =?us-ascii?Q?V5lOYTVv/2H30vVBp1lyDaC/bZCmaqvjcxh6Z14sLGYJhcgWkPA1SS/KCQOO?=
 =?us-ascii?Q?Yj8/UXKCiN4h+Li0hZZRMZYwkQ8zkqxDAJB49sVNwFbyxeghviXAGzuo/WEq?=
 =?us-ascii?Q?F6aa0sPeIoeSZgOQMUBVlx6wuy2eer9OiSMHoQ1KWcNyL110ZaQHTx31KrsP?=
 =?us-ascii?Q?4E1IBEmwJ7D21l+auP9SnogY5ypMCwdQ/c573KGkrGfRkZieU7zBUwkDLGnh?=
 =?us-ascii?Q?EVsoyjArIW4iGqLJXdP2W1nFCDKI+ZYhPEFlXE2GAEvaiDGJLSa9EYHD+VO2?=
 =?us-ascii?Q?JFhAE2pWGswfBzxd//5FSqfN7fYUZQ1AgKXSWpflr31AhZLGv0zhXuECF4qt?=
 =?us-ascii?Q?6EHQrdsOAb7mGg8f4r01qozpUD0DoWxpyz6Uyu9NBUuBfJea91MjvkzmAWU0?=
 =?us-ascii?Q?KZWeVvJ1uAi0xHznkbAqZXKlnH9B3PzvNOJtF7U2VXnVQWM985OgOKaa3dkP?=
 =?us-ascii?Q?9MCUGQ9ywwk7fgdVPMZUqUckyK/Ph13qHh81V5JDgtGqCzoXimcaH58heHDC?=
 =?us-ascii?Q?OJgGiaG4OZOhwlZ3HIVMEkbvEhn0QGOJgBFhMAVVPngb+nc2vj+GZVKkBbgM?=
 =?us-ascii?Q?zs1pQ9+so7/GVoj3psf+vgQ7ZGL7ZmTdkQzJbnXuNXUFWkolRt8ACkG4TvLI?=
 =?us-ascii?Q?DF/eu01og6nhy9pNdiwrFu279ve9I8FAitbbagUWgPAQN0KCCH/KPNhx33eL?=
 =?us-ascii?Q?KahcJU1kWCWkE2XxQR13auTGOZlerzG0EddOM+ncvNlDtzW5mGy3oS4yb8Ar?=
 =?us-ascii?Q?o0DTbJsG01bDHTem+q0RjyDi/zjFBC5MyMIjAGLyYaorchQpYWKlVg4MLbEG?=
 =?us-ascii?Q?XroiLLjygBh/sqxiMTEY/G7YTv+JNdd/d6w3fDFQEpjMyqj71beOVA6rhyVa?=
 =?us-ascii?Q?LEb2AR8IIwgMkzoe1lH0sVdngFOZ3qiRFy51/JJ7YSe0iu2WkDmC7m6eKznP?=
 =?us-ascii?Q?9RU6UYpqTs/bE2ijZrKEv4TU7rEV0+g07CE0pj7EP7swGJ9YhZYaxltUCgbN?=
 =?us-ascii?Q?JUjeZyVp6qFo6+sfB4VRK3qqCX2Oed6WpyTXZboYo5h94aiuhFmh0n3OdsDI?=
 =?us-ascii?Q?V/26URV01AJDCfa+SIXB4DXLUqGo/3Tnmh2BMCJtMX4rx2Ld/r+A6Gd6LOq2?=
 =?us-ascii?Q?Oyq9E2GL8BmICRkKWhV00Gvdao1ojt4BOTIAWTMs6qXtg0nnhWaavLwrFC/8?=
 =?us-ascii?Q?ojzHKITh9bPGS6u6pZqQoOhfFV7o9OyVpdeZK/CClzf0BVTYNx5xYMvX3y1R?=
 =?us-ascii?Q?Irk+AX2mqEIe3iIfqE/5k6DlNEvbpI7vt7k6ImhIDec2mpyGc8KTS0orwlT6?=
 =?us-ascii?Q?HyXhhOs8wOenC65OswzkdIU5PwdszF45Rzb1eTJkGYtVIN9HCjotxH/whr51?=
 =?us-ascii?Q?axwoLqJPQfJDa6SMLUmVBF2FrFRnl+sEDwBPrVm/+j8lDTPZR4wSv5EZMQw7?=
 =?us-ascii?Q?mtFkyhN7OCGKXJ0jBoOPt38KYlSBLMnMEpZ2d593JlEGB0PubIk3O5zUzD/f?=
 =?us-ascii?Q?VhCnb3eQAHl1VRNowGOm/iREDrR62B8lL15tKe+oJUcKoL7/PzR2MyEhN58i?=
 =?us-ascii?Q?28aiFRkTPHAgmFwK/AxXi8c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cce64f-0d1a-4ba7-e9b2-08dcb82afeea
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:23:18.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUSA/4hJ2Z9MjjR7zxlReDh5lgad/opFMP4s6kmTH0w+V9vsmM8NOmKhWzGXm8LqCkMNeeskKvP2RyvzWiMQnoEDnpTByN67ltm40Ka41ryK2oXYzvs5oNwp5AjvCgpZ
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 3 ++-
 drivers/gpu/drm/omapdrm/dss/sdi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd0..b17e77f700dd 100644
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
index 91eaae3b9481..f9ae358e8e52 100644
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

