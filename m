Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91C995D4B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7098C10E62D;
	Wed,  9 Oct 2024 01:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LzVW7tCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B9710E62D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTLXkZdjdYvvEyt06KSvtTHAmXY/j6V2PAnAEfQyZKtalM3+/lznVMLP5sILtJUOGxCvRBkPQLCRAWN/xcIKioY7tNfP5ljEgq5LNVJFYiYKxQUdyB0B6M/wSithsXbsyfnkqm71dPWGy+B5tvK9pF4iL9x8yiOHZKW/nFoXPl6NP1XUdaRKslzgQal/E0gnuR0r1PaOoC0QVbJJ2/7RaqsF1LbfedoD3h5DA3K3CE/9URAXBRt3BcM1GP1hHDpzMJ57cOuysiUQNvyn8DRv7kK7dRsGA6V5EgRqPpaX7Z9UjCw9tg9FBiYkNUouwCaQ+y+KAMEvPoD+TZLnsCV7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXWBJqDryy5jJ+dyPpSIAG7B59YzHlinFtD0x32QSEU=;
 b=A4SZkSmMFKp9jsiNmQW8MKcOGcUmTXOphrAIVhgWQAERQ8uOsNL7VJfFAK0AP44uEiqrGG2/Wy8ji9ALJlZ7MKdYTuEr6GekgIUcifXTubL6B+WiMyRAGdvCXFnqIE1r7hBrOrDwtdpAISyfCxsp7+IsYkXCE0/wGyB5PDSWTePhz973NudG8za9Z/wk72RSm6n2ZkIaLNKVjLp8Bk9gL4PAlXxnBmoNJcQxtksUsIeRNkBottyy66GVdaUYtdW1h8xOt7TS31JgF6aS6r9oQDtvxy5VvZb07iMPOyTsU1y77+GJxYUqyzAWkr54XU4cNhpTvcqMOWjWYK1/QSf0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXWBJqDryy5jJ+dyPpSIAG7B59YzHlinFtD0x32QSEU=;
 b=LzVW7tCv52gxebTGpQ6Whfyya8oQcDevccPWsJY/WCmH2JsLUPCqFqiboqZkiDGDBOm5lvAUVg58hg9Ppxo+8rzsphHOWGx/UovMcj1pxavxtYOughbCfmzULM/wrEfePGH0z4hhDxY/RpgqalWCvp1VpBqzmk8J+bO2jgOf7Sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8318.jpnprd01.prod.outlook.com
 (2603:1096:604:1a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 01:45:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:45:32 +0000
Message-ID: <87ldyyrqv7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 8/9] fbdev: omapfb: use new of_graph functions
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
Date: Wed, 9 Oct 2024 01:45:32 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 86eafc32-62cd-4019-fb37-08dce8040ff3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dX6EDVRJsPTAb8hJmeiiAgOQY5iUI+AhzvpQBvn1y5ZdTvMVpklW7WkJ70Xg?=
 =?us-ascii?Q?B5CPegE+Oau/xz/RV5ElFQcoaRzmCBV4kTvKTEXeF3Z9fEez7MnwHh0CjXe2?=
 =?us-ascii?Q?wfi4paAOrfXhsxohZtLgnFw+I0Fc3x1HMLHR+B+vYmYt8OWIImWY6pH6Oq/I?=
 =?us-ascii?Q?e/l/XWszhxlHO+7M4KiL8VHkrmPky4EzfeLiBkhEK7qR6xvuo7R4leVoxRNG?=
 =?us-ascii?Q?hClGduxyD8NiWMH1fB92zaFKBC2Fzu6QSzE5asonwkf/YeloqA8JFMEpoCQK?=
 =?us-ascii?Q?afhJnBuIm+GXSSup3Sk9SDGKzcULLW9TsivMcEO3AL22m0s32lReV2rfadq8?=
 =?us-ascii?Q?UTNBOXi7fsWYJ2ExyA/3qwAPUvu57yREJD3+iH9pAaLZ8X+zDQRQRKQR5MPV?=
 =?us-ascii?Q?8qkgq2/F9LH4Fp1g3cdcIE+JoQPAy5HHp4FQdCz6uSyAg9hOKVm/qmuZMDEm?=
 =?us-ascii?Q?kzyQr8RXhLcEjQlPTeMnGt39ReEB2Gj495HrvXZF8CiMF0qRPWlV2sFE/fiK?=
 =?us-ascii?Q?nNPJGNI8SlIR2IHnpzslasLr8nNT3GsprUu34n11glBWsxnAcsgja4yI7Amf?=
 =?us-ascii?Q?4Zo9TKPDun8bxQeb5Q+A/56F39njG7BJ0CPsBbtelo5qg5hV8dyJev5FD5ak?=
 =?us-ascii?Q?1Uuptyz1Ms3AQI3DJxvsYf3GKVHdVM43noT5qJlzomgLxWpuqX/Fp3putADI?=
 =?us-ascii?Q?2yIOE5o6ING/of4t4D4T0CaENE3qiZvAiTM3bjC6497Jm0rlgzOg8PKOYlr3?=
 =?us-ascii?Q?AGJZAMlb7mCw9obqHOnO4BadFkF44/NXMY3iijYhJUa1CkuYgEcQZi4PXuIe?=
 =?us-ascii?Q?tmzqxkZ8tBFlfCtXqHNlbUctDD1GwCeKCTvYDIwV1HhpByFyBmA8aNuyCSJy?=
 =?us-ascii?Q?i9z8gTlKrxIg3a4Cpg70dVEmCsya9E4T82PNAiWNfFbGcCJHt/Kp/Lpiv4Ho?=
 =?us-ascii?Q?fJ5+h5U+kvkwWkxI2Z6HknSp7P9AGGpFLT0L/Ji/MRCWYWSNESaIOrMvIh2d?=
 =?us-ascii?Q?96cypptp+Zj3z00SPyJuNjV8v4WnSftT5Vh9FGxKNk4Sq0JWWz0sAT992gtS?=
 =?us-ascii?Q?fGBOQQU/PIoas7x1tDM680D3NCNV4YWjit2Eqsy/Wn5iDdgT6VgD3OpLZ5n/?=
 =?us-ascii?Q?+QNNkPrjLsBen3ZN5aN8oajAinpPvrMEa3j3Y0HGdN+Rpmjvvj4CD2Ic2zR3?=
 =?us-ascii?Q?43U8YZLe0fpe/9S8dLGWS8uQkEhrozns5OfXmWg1HYml1es/KkvfI+vGeAaq?=
 =?us-ascii?Q?HCyfCmcvueb5glJ+k1Q+N/DmlmnSRfacO3j8j7douzhO4REvzTA19gfvFReb?=
 =?us-ascii?Q?jxaoIL43gUDC+FR0McQStKKrzu3tSenn09IOBd0KBataAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?354X6dHTsppytV0Z3g9EzUigu+za+UU8Jry2sld+8CEzkg2I6oKN6rFIG+gP?=
 =?us-ascii?Q?sC9hdqgpOUb49QlW1axIrDJiUebwuJqoeTicL6/lUrw9SmRTNjzS3CPotjED?=
 =?us-ascii?Q?2h3Lw30bZOuBwVTvXyggkAODraU9eLYr9BtCTK7w0FRA+CkyZ3cAASmvRiEn?=
 =?us-ascii?Q?Wyj9obcVGzvvpF6NMZgapSxUzc2K3lxevMjfcmaFpzGg+L7RxuXOeEtOMXUS?=
 =?us-ascii?Q?UX+aiG9rsxwFBCFkqMsGeGwdvJ1Fbj1EVhi+duBe2ccSIHi75IergE5QZbuf?=
 =?us-ascii?Q?10opWiJAd7Wd6VF6+bQPZAtwdt4KS9lVj7wqaW+kuvnLyjHyDCeDF5OEguxa?=
 =?us-ascii?Q?KWpI9PQ8LUO2NzdM0aOlv7c4xL7MCtaanXaa0F+AMvANFAZ++givIP5UNAfH?=
 =?us-ascii?Q?/wmth2BUOGjeDSekdDmLVkAghppCW2xHU8PFhNPxY8XDGJTC6gQYAjz6Go/E?=
 =?us-ascii?Q?1BGARxFAjUM5AZPu1twy6ZA2XXAQLXmLYPPDpEjjriR03nkaFqsJSmInyeZ5?=
 =?us-ascii?Q?dNr49nlrlVuU8r6/hDXmHNie69VLkfhKNiWsgs28ld3fDF8ApSGxncTtF7yB?=
 =?us-ascii?Q?qFvCGUnVVotL6dAOZv3bVfWC/UqA7SpxKSF3LA5Y7IErOOuSTMHTqwIkRoYT?=
 =?us-ascii?Q?QbWJxpcdomMvMeRceKUS//5h5vIf+eaDAwAblSfYROZvVdkNTy/np7O6FOb+?=
 =?us-ascii?Q?bLb+tF3vZXdaMtzcfzZeNDNLocfsTknqHWmXRB/pevVbo+dVkCNi+aXNi52v?=
 =?us-ascii?Q?BBqqE0i7HnQFiyTVNd14spDa48urvi+44IMDbW6As1Jz1fO/OO1jN3M5hARG?=
 =?us-ascii?Q?+KyheoFm6NKKMnXTleGaJIMVwXqVrlDVg2Ksi5qlV9En3+kF0dQ/7c7n317O?=
 =?us-ascii?Q?Mye0GuW6AxyMbmlHa55H8X79pSpOnZZeoTkIY+FdNpea3in6s6w2aO9YMFKF?=
 =?us-ascii?Q?H/Pd22RASuw4zs7B8/xx1IWts4xy9fk92+5fSwWnXG3awwzNCDUxUxciSBMl?=
 =?us-ascii?Q?B6l6fNC10UFJR3G0TEPYFM3rvVLpsNpbiw94zwBjdR9AG1R4DVKteYNeDI9d?=
 =?us-ascii?Q?kWDF/QPudsSQAxbGnwf8Bz6z39n24UFdnEyh4XtCDW7/ruiW0WQfC2l9tIEZ?=
 =?us-ascii?Q?OjIpG3w/d6+MKs5zGivpoTY/fqBSLCcU+W3Jj7WH5IaMGiqT5bklFdcvMn84?=
 =?us-ascii?Q?YsM0zNLHFLEvkEFVmqS0E5gflSt9qnwiPycLf8aaZCGwQfqndksQfTBKdtm/?=
 =?us-ascii?Q?uOzmDqwdnTwsC892MLna3KODsvpZnOnhK39H0Z+UijPLzg29BrFXP13jTvWL?=
 =?us-ascii?Q?CdFy5Mh2bFeXCuLiVT7h1FFA7TToLw1FMPyaH6Tp8Zi91IdYBWZ88ByK7h3J?=
 =?us-ascii?Q?dsjuJkP+of/tjO1wbvqmsLLZvhwmhln8E4GGwBr0PBqe2chNpVUlQYd27AZJ?=
 =?us-ascii?Q?v+8uu3Wo4NTmCkCvx9Xt2ZG+OCMe7CRwOVWBhXHnHslOfiFwdYPqamofvPAp?=
 =?us-ascii?Q?ATgyvF6kqdAoRdaPdB1hB+VzfmPuizbbO5LZeNtIlWjggorOPcCZKYkxviWw?=
 =?us-ascii?Q?dnWsNMBz6bfSjQG4lAKgNBgO6SIRUa4SGtae7xatnxm+tyK4SmqVoiyi7GKq?=
 =?us-ascii?Q?0Fz1lypk45AjQvr2YD/0TO0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86eafc32-62cd-4019-fb37-08dce8040ff3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:45:32.5775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZtLOi07fjPrpd0Bk/nbmOVx2ciuBpWTSd4qkf2pJUxAl6x+/dd0E4a83RN1zqaMvKIoXnzcXPb1Xl+ooBfJhkCkv9A0h2pImHlbJb7TAPQtokrJMDlRPtfCcDQieXAm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8318
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
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    | 20 +++---
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
 include/video/omapfb_dss.h                    |  8 ---
 5 files changed, 13 insertions(+), 87 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389a..395b1139a5ae 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -20,6 +20,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 
@@ -845,7 +846,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index d5a43b3bf45e..c04cbe0ef173 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,72 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev)
-{
-	struct device_node *port = NULL;
-
-	if (!parent)
-		return NULL;
-
-	if (!prev) {
-		struct device_node *ports;
-		/*
-		 * It's the first call, we have to find a port subnode
-		 * within this node or within an optional 'ports' node.
-		 */
-		ports = of_get_child_by_name(parent, "ports");
-		if (ports)
-			parent = ports;
-
-		port = of_get_child_by_name(parent, "port");
-
-		/* release the 'ports' node */
-		of_node_put(ports);
-	} else {
-		struct device_node *ports;
-
-		ports = of_get_parent(prev);
-		if (!ports)
-			return NULL;
-
-		do {
-			port = of_get_next_child(ports, prev);
-			if (!port) {
-				of_node_put(ports);
-				return NULL;
-			}
-			prev = port;
-		} while (!of_node_name_eq(port, "port"));
-
-		of_node_put(ports);
-	}
-
-	return port;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev)
-{
-	struct device_node *ep = NULL;
-
-	if (!parent)
-		return NULL;
-
-	do {
-		ep = of_get_next_child(parent, prev);
-		if (!ep)
-			return NULL;
-		prev = ep;
-	} while (!of_node_name_eq(ep, "endpoint"));
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
-
 struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 {
 	struct device_node *np;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index d814e4baa4b3..70bb35ef48b5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 #include <linux/component.h>
@@ -919,10 +920,7 @@ static int dss_init_ports(struct platform_device *pdev)
 	struct device_node *port;
 	int r, ret = 0;
 
-	if (parent == NULL)
-		return 0;
-
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return 0;
 
@@ -952,8 +950,9 @@ static int dss_init_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+
+		port = of_graph_get_next_port(parent, port);
+	} while (!ret && port);
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -966,10 +965,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
 
-	if (parent == NULL)
-		return;
-
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +996,9 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+
+		port = of_graph_get_next_port(parent, port);
+	} while (port);
 }
 
 static int dss_video_pll_probe(struct platform_device *pdev)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b16..22a6243d7abf 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -405,7 +406,7 @@ int sdi_init_port(struct platform_device *pdev, struct device_node *port)
 	u32 datapairs;
 	int r;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_port_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index a8c0c3eeeb5b..d133190e3143 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,14 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev);
-
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
-- 
2.43.0

