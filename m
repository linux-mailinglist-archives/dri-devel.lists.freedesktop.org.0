Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7944394C94D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A2410E856;
	Fri,  9 Aug 2024 04:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="OcESi0Wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E11B10E85A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isiONdOzon1+uqxZZUQnpOa5AsRfG99MFjlfFMStHCxNnuyLEMNEd4BsfGoy0r10ZrDgnC3nrmFYUQFkbblAoap3ORzL+XkzAwXK+oUiSAFCWBiyqCha7NMheN35AXcmjdX+d6DqvYsrVt0r/AFanIJOUQMNUbYg3WuB6+0XExpYjc0RdjaNwp4TaRjOjShasRQQcJB72lKwGL/5/SXEd6cVEwwIyIleQlhmlC1mAKBzSVKIFIpeHbn8bFk2WA03bzGWO89RYcc8wNaRSIyD7/sx3LstV663SxjmnOMKP8EJKtCavCWYzExzOsCyK91XPr+rmm+PDHkyP0kKg34kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMa4X8LLtupPXMyZE5+0ksQmm2ZitVH6UX9JA+8F9BE=;
 b=fXTAMLxfr2Cz2oWMQAgZfr0AnyC4wWU/N9yiBOH15qAo4mTwS6NXNHOnrTSW/x/+1XxuAAkBoApZPOJIL418nwLphcA4DVqr2ziC3eCj9h53v0Lxf1mQsXIszOaJ+3Wyq3NW4q0GJK3qcX0gSBAMD+XY/EXQK8xXstyTyZju6pfma8V2zZUXPRL1EzZKzYJXJiY+TJ/+gAuqcvEAUHiJclbR5dF0L8x1nOi90GyGx25qiPgw9Bqj5WH5HwZR7YoEr6vcCSTE5G/5gsLWKgD3YbaMkBrvaIpkHPmal/xx50dJsVZi8zvoxKhP/BKXS4Qalw4OoePSmyPIrLI6MNeRkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMa4X8LLtupPXMyZE5+0ksQmm2ZitVH6UX9JA+8F9BE=;
 b=OcESi0Wx87FFQNOXmkFJWRJPPN5Bh11tI/MuoAENnPJO/SAnA/TD0Rbg/3MUJYWSCy1sH7PFmWUAADBwBbdDXRWwD5qjcng/bHz8TGnukVj1kdr7stcXsXeAc1NOSKvlDRFH6OUKNtX0j5GQOeSX0EgqFzjtDilhnekjZc5E0dY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9639.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:23:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:23:30 +0000
Message-ID: <87seve729q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 9/9] media: xilinx-tpg: use new of_graph functions
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
Date: Fri, 9 Aug 2024 04:23:30 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 635ddbc5-d810-4299-c446-08dcb82b05f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ihpowYTgzKx1LLjr7b0punFRynYA6RbEgEg02adb5TSN7o+exg20g5Q3hJo?=
 =?us-ascii?Q?FU9cxsyhcP5Pn0Dt7vI+DHxRGJky6k9A8k+R60aBNvnlGiYurIUVw2IKLJzD?=
 =?us-ascii?Q?/gUub00Gpv8Wex8MVcss50hXJGhwpndElLGt5M4R2Ek1c9uj8hF8GEwujKfc?=
 =?us-ascii?Q?Z/QWTj7kll/7bL+BYKdguSuXQvTwqjvSuER0E3bKRTpIKif5aT3rV2nZc4cZ?=
 =?us-ascii?Q?nKnm6GXi/jVMtPZVwYeg+BJa4G1eEvj0ZalMDy72nI3PzIl5fFo0FQAEj6by?=
 =?us-ascii?Q?a4PyV1rt4K5vIElBKR57CxEeH9AQaf8HItCBDA+Z9dw5bLtCxiiDCr/hQJhj?=
 =?us-ascii?Q?9mtPfviJHx72fsXunAJx3/je2LQwf6rKyHUi4J/EtOUdlJQAP25bVCG55IM/?=
 =?us-ascii?Q?vB3NuTGvlbOYK/zm01zdiXRWK8Hw0Xqn9EcMPQBqL4Nm11W0sPa/S1BSkji0?=
 =?us-ascii?Q?vy0p5Y8wJWduhFHw4kArlzJhTTECWtIr7MWXGFb2gzWenCBmiFDkDBXPL4bH?=
 =?us-ascii?Q?pG5p3TX534wFMuDRPkHZUppZRBqh6DzjW6KPsRAFGVZYR3daiSq+ejNjyXcR?=
 =?us-ascii?Q?OxIsKfC8AooYrOrsea3r2NUZiuveXo3Bgw/FtwY5oFtRyEKDRAqjkL/UZCkq?=
 =?us-ascii?Q?B0LNZcpLs/ZbonZWIrspm+3FKwn3DVbqqofUWVUwyKlu6jxVaXOBRfGW3h6g?=
 =?us-ascii?Q?gKL1PBQZYTMc4VGFwuI8HZ5V1/KSEzMyZyPkQA9lD2AVw+GK1DHa+x9u6XQk?=
 =?us-ascii?Q?5FDvL3XSjsVdgo3wyMTtcBSlxARq5eNXNfDaKTOoxt8Q6Cj5OtM/RmueogG+?=
 =?us-ascii?Q?v+L/1DTzRWU06MgDbiZ5UxEyPRbtFt6zz6HTD3VdR3VfN5y3JyRi0FKUBBi4?=
 =?us-ascii?Q?yHasi3hFOhbp67+7Ic3Rv7Kk9oDGq1quDR0mXQGwWOPxV6ouYmUXiuAfAImX?=
 =?us-ascii?Q?OUqOait3RYTiUMmaSJb5ZvXfsXC0vFN2yoMONFC2hUQXR21KUbemfOQAqwkO?=
 =?us-ascii?Q?r6U8HagliVkB0kfNJervIBQWEr/mxFQ1PQ/R2dzoFvHSHedvYEDavb61RNKp?=
 =?us-ascii?Q?HGrn7Ekn8gRoyPgnfGrNc9u2SZYCKDRHXiAMrTqTKJnMpIuJvQNKhg6d13sE?=
 =?us-ascii?Q?OpK08sHovxKrIbB5lkKQiWWCKt/114Jktgal7Ix/cILrN7sXeIaRHtlgM9vv?=
 =?us-ascii?Q?Vk4VRQcVMXIx+CULwn7ZE3jKqMFCbV+qPDPEYUng/GNb9Po/sRuX1OzMPh/u?=
 =?us-ascii?Q?vN97J3TdaLhltKS5KtIXXxzFwg/cVnQZ9q6DgwSVPAt5tvRepqMfEEB8Dagw?=
 =?us-ascii?Q?czKYu8kbj3rbO63vcUs7yZfCySCWLmfBE8Inh9dNvaT/epk7l9LIsoewq8rb?=
 =?us-ascii?Q?EWebIZtPtiN56+TGv1KbU2WDiSIfjveB/beDI+PWygh6pUyy9UfWu3RUpc9y?=
 =?us-ascii?Q?71YhpqanQZA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cQ1HX9PVBr9Egez1yZ0DRdRvmmwyFmn62DyWdSjHnpSI+P/eN+5T9hc8uUHN?=
 =?us-ascii?Q?rtY54rybZd7Le3hkwAcBBCGkPqoU2HC1mdUG/Zrv4j6leWCO22W4Zsk+h49L?=
 =?us-ascii?Q?nyFEyqiZJyENZUEm0lX7lPDkY6qWyPp0nYgkWnDywPvSnPxB8E0BY9gTMT+g?=
 =?us-ascii?Q?VObQWrqJj4in+rUoqq5lC7oWseTnLQ0XZbJ9x9Ewxz1YE8hSE/wNULNPpFgr?=
 =?us-ascii?Q?raCxknTJyCVC2Oxwq2wmS8Tz2FviHBcBwtDvuNBEnRgUG6uB9lsyKpEprTWD?=
 =?us-ascii?Q?KdItBEw3I9SQo8XYnkTJwkQA7RvuAIfWIVgWbQwCw3LCqdJUOmcW8RcN+PNs?=
 =?us-ascii?Q?AnFSNdvqdT5+zr10hTE35e496fWY7UHWURa00ZFm5uVaIYUnFRlZ/cGNFzLt?=
 =?us-ascii?Q?LAmsu1wfq0C5nKennNpPjG+E0z17GAwZiDa1HUZAmYuvtts+4qwPKUregZas?=
 =?us-ascii?Q?A8LhtTQ7YBqsnvgOecWdDBtQuUViaOvn40mGm1cKus3UeJzrAPYC+/z3I5A1?=
 =?us-ascii?Q?PReWACQWtAYIo/r3D27gYyuEZ94taK1QeOeSkTk2kyzZLRTdirOtD7x/GI0h?=
 =?us-ascii?Q?sj/b8YnBQivnd7xN6wSH4NboBgLo9pR9fR+wBeSf5UnlZw+77XS1eEhRxNNo?=
 =?us-ascii?Q?Q6kn44rJtPr9gTOXj/x7wDs7oC0JkZRXgcTOUVpgeP8PHt+mLv5iM548DfCv?=
 =?us-ascii?Q?h+KetAp8sdbfI/n8yeWoLH8Tjwu6/prMvhCFuZtg/SNXskDZ+uN2hTjtXYEX?=
 =?us-ascii?Q?lIaJJCvnDoD04RVTzPh7zZybEZpE57TCMkPDRPhNImwXVFmhhcolZbjna3qk?=
 =?us-ascii?Q?JqatybjVCeC0UXjB4IBi4tyA3XjRfYhYTBoIUOlZxTmXrfNYSlP5wAh3AiWn?=
 =?us-ascii?Q?sUZHdn9azqvZA/10QLfWZNJwhn0dZbMPHSC3d8Nfl3YsGytx9g1P9QVNlnn5?=
 =?us-ascii?Q?VAGyik83mtPk7twBFqEJ+1xeTaYpvLy6f1EWhuY7e4MbAErIEz73Jgj2TrS/?=
 =?us-ascii?Q?pLwRVa71xsBUT9g5xZ8H1Z2RPAIvlHRpq3vtZXwYgkWOZ4N6lix1xjRDGGaC?=
 =?us-ascii?Q?pCjxmJq6uhIrc7OFctmMtc/i/KQZ93WMQpiJ9H6MmlQK75o1jCYwK0D67FLI?=
 =?us-ascii?Q?bLNfVhIg0ZEeAlZmn3FJRUNVaohlrb9BuAy/keBCXqBIYI2GTMjiuwIgxrDp?=
 =?us-ascii?Q?W9bCheNgNlaORZlXDT4IdgznYEfywssJuOTkfYJy2ArTnsY5uLS4ubzIGt2j?=
 =?us-ascii?Q?EQfru17CnEWnFTDlfMLqjm6HErbuQ8A4/99jpzzvmbzCCXL8gg9ezr1qs02p?=
 =?us-ascii?Q?qgkPe54iKvItgA7kaUASN816MTr/ONm3FaUDI+jPwboMmEaT653FMFfuVR3h?=
 =?us-ascii?Q?IxXrMVzDCbetIr6D65IXsEvBj7QUamk+LRDWJxxL2abG9wdUWi8z7Qw5fDgQ?=
 =?us-ascii?Q?+Y4ZcIKMHUUwvSGYKBgVlyBmcfGsy11Jh6nELVu62aoTK1q8DNWlO5vA2A+R?=
 =?us-ascii?Q?J41C9ttgBej7XY7HLTcEj2LhH4wScY6b1Vq6wpqsUASkSDLLntWvjrD7WGfT?=
 =?us-ascii?Q?QQadl5t8r480D5atWP2lALZxALQkDdLD/C6WfQu0apgaEJNbClNpAtNl+ESr?=
 =?us-ascii?Q?xs5UkzpcAJUNyJSH/6Xmz0Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635ddbc5-d810-4299-c446-08dcb82b05f5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:23:30.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gscUlf3+vFCqKyzNeQBuvMi3bXKDHwXTJG1hd6vV7LdW7cfFgjYsBI4kNiCippFf35L5rMrgaKDp/fo6gEbtJUCMYP9cUduGoaCiOh0FmkAYWPco6xBXqUqRpbPO3+Jv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9639
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
 drivers/media/platform/xilinx/xilinx-tpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f..a25f216b2513 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/xilinx-v4l2-controls.h>
 
@@ -744,7 +745,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_port_endpoint(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.43.0

