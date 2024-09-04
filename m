Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFC96B12A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FEB10E653;
	Wed,  4 Sep 2024 06:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="O5Ex6H31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC8110E652
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Go0e5Uu++1VIuLPIGHFzAfxZcgr43tqrWdTEitSRBEfvLHc2NzM51WzCimxmen/xQRXUoxepCUAigy2urCvHrK//U4n6fe4j2JXvLMDWnA8OYo1M2v0eei+Q4sh/Tz79WrtD1LuUKzXIAevv48o0/lveIZnort1ZYNwVvfN32lJUzGh7V3dnWt90Pym2ga4A7air4VDhLguegEGJYHlviyFDiRJy/W/WX94dR7NJI+7sXP9T2QiSMvtmY11phy8BHhB1P/Y8Y9jW0i4k/jIb596F/jB2K18dm0aUzkeX9LV26iUSoqYnMuoG+qJkUjkgn/YhUnJsz0zSy2kKjiXafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+8dq8hvf2u19+2peNsA8CdWmlRAVdaYHFoKOHHojqc=;
 b=kI4uPJn7z9MCqiYnDF7bcI56PIVRIBJaNdUz8typCgicsr6Upfl4b68nA0zuN/w3IUG/uSPTqjmLISXhu6T2lV1FTaXUUAsAoVfOGroNfVwo6A/4hZRO6/jiQQFN3IO33nk2et8sNYqoetszoFj31AnB5nKEL7FbBu4fPNExelbTaqgvCP2eFdbYmhtWLsY/Y0lt9ijB+VAizX6buClKNxFiNBBm2Ci5PO6e8uXRX0abJh9dAPQtsGoMm2pT/reAZZGqlAdDoDJfjCzr0bdyuPt+TVH1lgugCsolk8JmUfpTzTmU5bV5TTQj7cfd3BItKsAqLhg5d++lqeeHvP4/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+8dq8hvf2u19+2peNsA8CdWmlRAVdaYHFoKOHHojqc=;
 b=O5Ex6H31yg4Q5yzwOe0IMXIxFjARieRMPifyDTE7aBxQ2sO4QbD8svTipDSl8b1/ecXczazykHsxzG31hpUx4IdJuFek6s+/5A57LIgg7LiRpRLTSs7mRSj/SzkGu3GszMKyWnX2Msp3vwtEWCLgGW1phoTHxijHAYxgzuUr85Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:46 +0000
Message-ID: <87frqg6j8e.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v5 8/9] fbdev: omapfb: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:45 +0000
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffa656d-ae0a-4eea-e868-08dccca87475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iApVnFvV5uBQoqm3AISGLi+FQlfV6IcAeSfcGRe79uAxxN5sScvqLJ7q2D3q?=
 =?us-ascii?Q?UJc3WHiknqRPstpnBfxvIMDy1HT53xh7pQ6qGr9nC7zE2bY3egCvjRGlM4ej?=
 =?us-ascii?Q?rpMQR8VPgR0/f757NBYwtlfEdypZypj25PdEFVHm4kNHnM2safvbIwSrNkIP?=
 =?us-ascii?Q?pAYIZF4sz+nfR/j7tNu2DdTvPVlMVmSxWxt6HXgdjydnmk/4KRlz0EX4zt0l?=
 =?us-ascii?Q?7PubvRs/4EOapfTL2E8GFmRAN1KHvMXWF/Zjo4YYw/9az9+A2n5sXbI0QDMA?=
 =?us-ascii?Q?PAIIgunkowoDdG/Oce75XQ3w234EI6IzIOkeRpT1FoJ/GtSiZmBhGJpIYUFQ?=
 =?us-ascii?Q?bgsVJ4e1V4VY5OKxLMRe+hOvdWe73FC6bk0ihKoPfHEXs/0CiLCRx943s1w8?=
 =?us-ascii?Q?eBGZUZDLrac+dA/T7gnmkulBWXxxlDNgUtcyagKNilXmJji3ipu4foNojksx?=
 =?us-ascii?Q?DSzg65BCe5N8YJnt2dCN25hh6sczlCv1Hunt06rqgZcOMAnEPYtsse6TUlOv?=
 =?us-ascii?Q?gJTyWDBaR3yMI65xewYPnIPvbP04niptUjMU5Fjxm5X1EyqGNp5vh8Ry4uEV?=
 =?us-ascii?Q?+VloEIYa6mE0Wyt3wcBLB9lxvsgb/NZ/YiP/2T5yyTCfpXLGFcENkClkgvIS?=
 =?us-ascii?Q?LEb/G7MFR+ickaa9gV1lKh1iyhYCgpl7tYCCJoJXi8TvVF4x4B5lOwa674Wp?=
 =?us-ascii?Q?uMXsv3cWTKj7K15jDfh2hj3BY2a72fcbYtzkpaNmTLj71VvQWvHgtNQDz9+l?=
 =?us-ascii?Q?E4cz7DwS/hxQyd9Zi7Mf8U2dQJgH0qqPI1FpcsT5XZ4aqvjUYG92vEx4Xihr?=
 =?us-ascii?Q?caUAeS5ySocAZhgx2HunbROgxpcheEn+kVMbe4LeJf0AxwjIIL+FPNz+c4JY?=
 =?us-ascii?Q?tIL3WM1mcPhjPDLsh/s0qbKhV22dXRcddGBsOT3xDrzzIAwaE6wda+Z24IQE?=
 =?us-ascii?Q?kM08KNzz91my4a0yotcyS15irrJuFF+n4iGNbM0FshuvubxwMSCoRlMcqRgB?=
 =?us-ascii?Q?wwkMVSCF1r5P8lBGtw3TteH2/NOss2ZKEF46vJbdcQ2biyXZebnYtUfm5CFI?=
 =?us-ascii?Q?T6bdCcAEU403/WzS22KpqUafdvTrTUA+7rVLCo85Zqb32nkPI/QRWSDGDVyN?=
 =?us-ascii?Q?dj4Bzq8mvjvTJpbFjBOOgHZ2tnrIXzfn0b1FIu2FdfHtWaZPgE6bwsvxEt6f?=
 =?us-ascii?Q?tKzW4oyTzvg2P51p9iFCbgcP8w1Lnky21BN4+vYxe8ldWiSQZHAY5kaE6a3w?=
 =?us-ascii?Q?2XWA3yxIbH5zflGHuLFaT0GRx2NWdgRJs9d/m7gWsYOg+LTxSFr8rinAH2VL?=
 =?us-ascii?Q?P1YHpaon+Nr/FnFbyiMr4bgN+6IeWLpAeryd6GKkSC1ZWmmVkYrjnv7YfXA3?=
 =?us-ascii?Q?/YIdQ6GW6OblsH+fQdXPw2q6c9sxuFsMP3CpaEXphVI3CEoFrSvrFNWQImL8?=
 =?us-ascii?Q?Oojyyn8JjRM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oaikkWgyjGUwcmeqqzPUzrqdPbssWR98M0o4HqhuzPopEwLU7PAYU5POInlV?=
 =?us-ascii?Q?MFX4TMqkJOHmu9EZOERS2FWYbUSE3Efz2MNXBmrMaC54nMcFswNOsCrb2wrL?=
 =?us-ascii?Q?RdPIEZruWMd71vlcC36DhfgwOLvqlSAaspsJV/sh450MXBK1+dimMTix1zuJ?=
 =?us-ascii?Q?wImCFyNTFfrFFZeDR6LDa8P+6oO50LxcDBFwSeJamq4qWYFtgvpvU+14t5oS?=
 =?us-ascii?Q?dyl3+h5HjuvJVA/Mknb3wvOagGnkQRwNX1dQDnnmre015M7SWhikTgMns0JX?=
 =?us-ascii?Q?QlZoIVuFwBorc+NmFlunKPXLtHZUw9g4IHI61aeRvP2e5PPW7pLgAYzVQaOl?=
 =?us-ascii?Q?U43+oZ8vwmKu67XSRX+odkbA1fOdwAfMwAPkV/GTjRY5r57OvQrv6Z7ccSrL?=
 =?us-ascii?Q?yoCWg6ZFL72xII3kUUmV8XjKfUBzaIsgfKQ0QN9AfNuwG5FhQZwRwZP3Mbzb?=
 =?us-ascii?Q?AJaPwwNdIsi5VDolzs/NxRwHi3tZ1KHMwPbovxQEFRe7OYw+8bv1xG3h5mGS?=
 =?us-ascii?Q?3nh4c4GbDell9GuvxIY27L2lJR30KPWGe+oq9DdBOqmTZt2uvJk1qDuQCLfB?=
 =?us-ascii?Q?pcHGpZUsKeV9zNwgH8Dx0p6kuT/pJ4KT6Jy6UBKgoc74gbwB9Kp+dnJX+LIu?=
 =?us-ascii?Q?mcl0+NiFu0rGvl5o3m1A/6ad2YHFfB5ZZV4UD+MLDdM9HEIw+NXQXbALSC3a?=
 =?us-ascii?Q?lhmZRfetYKsRV4cV43+OWkmp2xfLp8/v9Rs2DdYroOAvIkHsV8lDpIKa4A9M?=
 =?us-ascii?Q?O/qAHc0l0FSvuz3i3xjn3C+hVnkYeDRujyytaFuQc7OQtbG6KRQVCNqP5iWJ?=
 =?us-ascii?Q?XCvq4QeZYkWdORbCMCNQ/JlPWA5iz7891Vy75CheUlOSH8qI6pnWi4JaQhM8?=
 =?us-ascii?Q?mPaukWPVgMqtOlnFljQTK1gf7esZ2JIhIVUwn+j7UJYAxu9Wk7oFUw/UBAnP?=
 =?us-ascii?Q?eSmHh0QFWSqhTZ4EjGtJEKrO74BqBzpZ21jLz7hL+xCZLvOk2XLupAz5nZnm?=
 =?us-ascii?Q?Szfh3jBjax1nGnxQpWGdVZfoMOha0uU1bwr2EQvzDy0+NVwW+ZyBBfnU4Jno?=
 =?us-ascii?Q?mOrj9GOahgTyfhERIhQMGqnSsIo8m2R+HYZbkogLb1ncRESYL91BeBv4KOWI?=
 =?us-ascii?Q?4syOPaZwiBNrPxhREwaUAKJ09HfH/KcHxLzOrnQjhrQbwVyrMrwc+6wXTpSR?=
 =?us-ascii?Q?14hxz60XI+BLOjApdMnlIm9XfUwsShYfvVYY6BAkuMYulrU3RWqodj84JE+6?=
 =?us-ascii?Q?+Fl9CTodn9gHRrJY1JYdf65qPPD14zJr+teiMXEDWXPkgVFAcC2vNw8adt/e?=
 =?us-ascii?Q?XE4+vygUDPwv2tE7lY6QwtEvA6Fsh+tvYbQJY2CJzjuOb0uxzqjRTsyZ+STg?=
 =?us-ascii?Q?kHToCEferw/b6sUPMnBus7B/kOVp5QtjeBs20eUgb0SZzG1SwdmlJndAluY6?=
 =?us-ascii?Q?JGX5KdiRSRLQJ/W6wljHk9WStxLTzA/ILUeczG0XO7HMoGmplOB310Wm8HBk?=
 =?us-ascii?Q?fR+F6iw97+0zGZ7o/9msDCa4KhV4poQe64fmNtAgVUcjuaeBM9ApBouGh1Xq?=
 =?us-ascii?Q?AywapxwQSq7PrMfsmgNdbsb/YqojA+I4yvryG4xVF17bNZAcZl+xjlnMdBtJ?=
 =?us-ascii?Q?e20KLWg3s4VT9sjxcyehicQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffa656d-ae0a-4eea-e868-08dccca87475
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:46.1282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxA24bmvrGnxdzWQYnB5NTCLlO1IFxhXImIxN3bUyZsClHGa2XQkHq23PesTPCncEieKG+/N2myXDg0Xwkpk72f135rn6MmdQlUfnDXpgF+QOTfp4hujUaIzIb32hrjM
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
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    | 15 ++---
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
 include/video/omapfb_dss.h                    |  8 ---
 5 files changed, 9 insertions(+), 86 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389aa..395b1139a5ae7 100644
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
index 4040e247e026e..efb7d2e4ce85d 100644
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
index d814e4baa4b33..4b1c1cbb4a04c 100644
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
 
@@ -953,7 +951,7 @@ static int dss_init_ports(struct platform_device *pdev)
 			break;
 		}
 	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+		 port = of_graph_get_next_port(parent, port));
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -966,10 +964,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	struct device_node *parent = pdev->dev.of_node;
 	struct device_node *port;
 
-	if (parent == NULL)
-		return;
-
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +995,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+	} while (port = of_graph_get_next_port(parent, port));
 }
 
 static int dss_video_pll_probe(struct platform_device *pdev)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b165..22a6243d7abfb 100644
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

