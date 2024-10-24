Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605C69AD9B4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955F710E88F;
	Thu, 24 Oct 2024 02:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="cplPOAPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A392210E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOdaBtGNrTg7KZBUQFDYlx2O5X527Ktr2M2qde2qEKOs1mQJcRDSlw1EPuSi6CPCB8rhvqNMUVv47rayYtDeQe1297KeQZytrYHH1lUjaM3TX4IRZTa/sX/gfhTLQ34b0c56D2WrjiXoFuLdCEH8+ROSDVRO0LazJXxiqYle6xIc03D+zntYuVgVnXvajMTKKq89WsCGsLBkok8CHGkHzqtQVsrWcH/8KQkdHAyS36igauMfnUn6B0Xt0KptxcgRK8FY50fBKkACvEWig9uuY+Jh5T6FdlGjhHEO6DqEL4ZKSVrCAAt7ktsFnVNTWY3bInw8E69keGXnTRH/EkqXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9gi2RRiB7Qd16arS49XABzBc2eDOLcw6GcUsaajS5Y=;
 b=RsS75qopR48K2btiiaIobhczliEJLJdGrv04+cT38GGGsG142SRfWDITxKb5kSvnLwT0N+U1PNuDIS4qSo7NBabUNWCxgzGeY5rFuAoikyJIkd+Q2k/p084m7tD2vtIKZwDgey7mrwLQQOl7JfhJVX8jARspe+/vRaeUeks7B5VqdxjywxrjKd+GktvmJeuqyAgmeiabS1d0P/h1OHS1LO39a37MwuGgjIvxtQqNzfKGEXjbZ0F8GRRjWfj7Tl4rKm4Twf4A5pbZx1FwcOeT/3yX8gc7HRCv0TDNn0r51Da9DEvKFYaTr1aTICX6bEo6UXet08LyJL4aSe6kd4pvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9gi2RRiB7Qd16arS49XABzBc2eDOLcw6GcUsaajS5Y=;
 b=cplPOAPUUwWD8XLQU/Z1PATaJdbayNBNchGKCGiVICB0+CNmB5oIZvBd3Lea3cqEiMKbYcIhidlJ+xdUyaX2UsKCBWwuPAdNTPy1wkaongwtp4vGemmBO3wMiP73wcekeNxEN4gsRWTBP6cae8IcBQqaz6x/T/hrPLWzzuH8Mj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:35 +0000
Message-ID: <87bjzab5sd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 8/9] fbdev: omapfb: use new of_graph functions
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
Date: Thu, 24 Oct 2024 02:20:35 +0000
X-ClientProxiedBy: TYCP286CA0188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 3380e272-8cdf-44cc-e2ae-08dcf3d271a6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kR/a2AfVU3lkjU6h/4eRwbdKw2xs2AYD/YcUm2IhMBSpI+iTBY90EGw39TiY?=
 =?us-ascii?Q?OgxV8+gCPlHCa1yeApWnk68n3bamybgByA+kep1/y3L8iSVWnumY+z/ey0uW?=
 =?us-ascii?Q?bpGShtkuETeSRfZyyxR8KwiDan0IvaG4jsBAYicvmAO6qe6hXO14Fc6HfrCb?=
 =?us-ascii?Q?UXVDXmd6rSqdfn8pC0VK++EnTXnKWrbiY7d1LZVXAtHl5W+UhCKXJhidL6q5?=
 =?us-ascii?Q?u1tVSNNaJoXuyzK57xDcLSOnOKT6xfM5vL+OoHkYoQtG5Z15jxlRIqleeKEh?=
 =?us-ascii?Q?C0oj0qdU+e6+/Y+52qeXUGCEsz9Rtjp4Zp7msneum3ud1ausmYVnvleYRK5X?=
 =?us-ascii?Q?KGrjdnKGH3WRUCYEj9+Q5+FRyScq6RNa5KtHpwFjPX5wGMJo7uhx22YW8gC3?=
 =?us-ascii?Q?H7xaF9BTI/YJUIFRLZTAZLU6+8AaoiUMSWbMC/Z9wQ7ANx3rkQblTFbTqiU8?=
 =?us-ascii?Q?0cwQj9nskN/2wY3SVTnd14bVTb+RKTWpF1bkH72WD0Ee3/KGNUW1Oa++nkWC?=
 =?us-ascii?Q?Wl9mKIJfhsUwwATm8LK6cvci/fMKiMfmqozJtE6L02LrSuptzniU150GWNoq?=
 =?us-ascii?Q?Wwug4Cutj9LwpVu7nS2NdDGKVtgmxZK7STFFgKydtS+87jq9AZZj3O1HhfTd?=
 =?us-ascii?Q?OCFUVGcYECAM16nbEejLEFA/pfdMYKKNe/FwNY+AAg8p0+fELOx+fKQce0+F?=
 =?us-ascii?Q?nfgCm7aW2c1JOBBQAzDKFRlLAbMdK7Ccr20ssDWXW51KWehaI1BGu3Ak7wX4?=
 =?us-ascii?Q?17AgO4SXBK/a0pIrj0yNkQPiHm1cSUO9nYmi87tnqSWyeN6HEoNu9jvNLMob?=
 =?us-ascii?Q?FhWsaUcm2L4pRP+4fVeg8+V3+pBNIw3mp5XVrSM8GNu037fymM6206d5YCiL?=
 =?us-ascii?Q?Ao8IX/MBd5SOCqfwzRdGiFLNRf7wHRR5QaTOpMBfozdRXqsBiSD6GVdI3Wu1?=
 =?us-ascii?Q?jh2VXALinq3fVbP1uEMZ/8I37axHcCFvXpYqeskG76Rc5k5PRUiF1yjUtzcT?=
 =?us-ascii?Q?D3tjjwLbm5bFtfnTDmHQc3uAd2YmjmPTe525pexSBUanf1I43j+3k7dsZOix?=
 =?us-ascii?Q?VLXedSWP96Lo/PQjT2DObnN2agekrBeMQoNDsoqaOgpdwy9jrP4X/rBc/YIH?=
 =?us-ascii?Q?/sNvSGDZuvh6oDh//29Lz2XUB24KkWGKCAXsNHR8jKs99MIm37jnp9kuSQTi?=
 =?us-ascii?Q?gamJln9sM8kQbHRjsLrujIYZBkcNgfzjGeS+i03PXyRHcuTi1afP7vIRX2xM?=
 =?us-ascii?Q?IkLdSr0bl7cKxvdKiEwnHOTn1VtaC4zwgjhDnt81Wbnt+je1GbX0sJmhOg01?=
 =?us-ascii?Q?lqvxhUKBvQU5xUjAqG/a/EzLayZDK5nnBZF+9YsJ+n+El7q0Jm28JlqPWGFB?=
 =?us-ascii?Q?lrwUmqsKK+Uqf2iL+1/GSsJt64Ed?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CbXaYj3y4eB4pZ/yAlybefLy1HkZx5vexQVhNjwpss/XSzyQ2kMHUSwwCn6H?=
 =?us-ascii?Q?Nl7H9bHcYUH6yR7X6/hq2wvyrLFXclZhrFIroZasU33JCDADv2Z7w+Gb0iB0?=
 =?us-ascii?Q?srm9MHagZyauNxrdkSo1fNR7DTcMuy534KckvPKVCzljPUsB3aHzAnlnP08t?=
 =?us-ascii?Q?IlJsrKT/M7x+5I+SO54TtGItgqMTneCMfrGsx7R62sHlgMORF8DLsOdLnB0e?=
 =?us-ascii?Q?A1nGAL4ibDGMH8t94cWzQPGJoB7qclVhQAGwn5JcwnUUKliYu8wDTNLI4YDD?=
 =?us-ascii?Q?xIKYvTAsfKoSs2CuPXoYWCrPYm8HkYAIxE0WfQNo9CDz5oVijWe4vy+lQ6bw?=
 =?us-ascii?Q?xgppYf581wCkPJZKBrDHWBJ3YFL+4ew5lphkv0lx2q/p/2HeEaka9sw8zq3n?=
 =?us-ascii?Q?mN9pmflCjNHu54fgCv4nesY9TIguX1gC/Uj3TNOAurx9ruOk3vSFATqXt5Iu?=
 =?us-ascii?Q?S9td1ofKe9u+xkS90sbJaRxuFoIoiXVNoyiHWBlH+L5YuqsCbkEqYUG+sE0F?=
 =?us-ascii?Q?N+mf9KKZZhfkipF2l11xsIbhDdOQrSz8q7z5yfsFQvG44IXQl/DYjODJ8gXf?=
 =?us-ascii?Q?HX1SowB1gmcX0CR2fn6oeYenq4axmtyfLfoTS0Xw+YNDqK/ZZt49JpMFJula?=
 =?us-ascii?Q?EZQzGez5spnfuXdlFxkxKtya781XH4e/VLvvpSfFQLQsdiaguGl6BXGr53pt?=
 =?us-ascii?Q?cCDt6z/RGKn99biMzna0IYvmB3IctDGxD/pQ4bqRO9hnPdAEwy9zpm3jO+OD?=
 =?us-ascii?Q?6hQrenO+DkRnYDvrKH/o8fItTVLEDg8XH8WDf1gefK3jO8tEuJboea/lsPMz?=
 =?us-ascii?Q?Y0JNXx0s+FB7RZrj3L09R1BjXRQEh0e44zZleGslr9zrcXRMFxt1RVIUw03G?=
 =?us-ascii?Q?nrKW5I2iSshgke/iUlmtQN+6uvfsdMyh751j/LeBZoYq9yplFOO3J6AO1ymU?=
 =?us-ascii?Q?3C06BCRXi16veRCNVPrdZudOy62GGIyITf+jeBAzxQGFNZWjEXYP68i17KmH?=
 =?us-ascii?Q?W83rJgIY/uA805DRJ3xjVc/kLNuACA6TmVjnBrp7/rhZFYnU2LB3KQzwYNp6?=
 =?us-ascii?Q?Q7JeM+xEa9tpKm0y/kiJx/o/0TxuBsSEoEFzLrYuqqlWUFKWItjK8/Mc42yL?=
 =?us-ascii?Q?nm5q9p6ilbFFZPJq14s9D0eEyPYj7RFfknAb15ADGx7b9oYnKkfR9ZOa5lrk?=
 =?us-ascii?Q?/xx2UC7F1ra1ZDfKnM00KV6dRbvoJk8MDhJveObSNo+RQymKhmGfauVK236F?=
 =?us-ascii?Q?JmJSst1HZXNeoUXKU8jEL0R1bmcH43MdIrw87a+iWm2ZWOZQm26mnkxWznCX?=
 =?us-ascii?Q?rfQw/pvySzlKdbmVwxkw5P1iDQUK7kSBv+qzgFnwndI+i8ypQIa1eZ53qtbm?=
 =?us-ascii?Q?+RtR3qvqi/7Ovweox2GWLuMK0ZKZWK2/dJC7ZTnlZOD80kS5R/E/WWvBOANY?=
 =?us-ascii?Q?vmNlpVmfGWrLiI/Sxdwh/jFjhVJI8I+rOEY6jNxoceEFQpjPOwBf2d7kci4Q?=
 =?us-ascii?Q?aZNxgVPvdzaPcUv8xCGUt9+hV4fndjaM1FxqaSxm3Z8NFsC2foxfddLiPOph?=
 =?us-ascii?Q?3bDCYamnW/wPhnY+YUU2cd5Crl3Hcc/xbPJsH4mYTYp8x31VIfoc60FpurU5?=
 =?us-ascii?Q?aIVV/nRqn4X+pwHXLr3DsrA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3380e272-8cdf-44cc-e2ae-08dcf3d271a6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:35.6249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/aRAhcEt5HSbiJj7V+8mmEmmnM6j75jFpSuAuUQoI2lwYMEqVqwBAOWfrMuBl/pswpH1Jieug84AP+mQLgM7kVioadbF7vpcqA54dtn0GCB3dAFuAuXxHoOTu+Ur2Vn
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
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    | 20 +++---
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
 include/video/omapfb_dss.h                    |  8 ---
 5 files changed, 13 insertions(+), 87 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index c40b87ffe8fcb..86ed4c077c30a 100644
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
index d5a43b3bf45ec..c04cbe0ef173d 100644
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
index f06debee02c5c..3624a7fbdca82 100644
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
index 2a45f019ef457..2d3e5d4467c57 100644
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
index a8c0c3eeeb5ba..d133190e31438 100644
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

