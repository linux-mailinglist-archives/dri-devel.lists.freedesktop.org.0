Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE0794C947
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 06:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517FF10E859;
	Fri,  9 Aug 2024 04:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="IZnOBqz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D692210E859
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 04:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL8gjZl+zPsZQ+sUjHufG4dvGKnlzDHjQheyqAYBFZ2sZiqxOsMv/hs7c4F+3leB+uQDGD7q4I9cB72QLjXvI9AayUqfunvgQsBJ7IiACXz1on+ppV4jnnV5j7wp5vO8Zy1/vgAU6Uru2aZ8JKk8FugGlhS9gB1tjlxhu9g+s1tOjf9LRxjq0uVb03y9SjD0ir/DIRPpHko7kupjO0eA9dwOtYWMv5HdsUnG6dnr3+FfT5k8NJ+v+UPJeo4wVRBacOnqwPRTcMEaCCdfbNJgKINQWs0wxnfWtLqt+LdMLh1AYdDoAygshNq4wFMJlgpSWOC+puJwmpwv3bdVzCSpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqpCLsY1CmrUuWtVZbk0ujoYsWif8tltOD/VUVSoA/Y=;
 b=O8ow9SgcKWeykHmjxh2nH8EyCgp+VBRj5c3PWL1/aCiZzDO/SGlhHqSP/oJNkTMsqgfOBeCvLyQaUUwV/tTsKwKpH+x3dJkthzJ15LUramH8L8zgPkURuQVeWxPGDxxB44e+n2LIb80McSnYd0pwREz7oHWbwbIiPQQzlehgezt+TracGIuuZ+srIq4kVqcI+f8Y4hHwkW+oj0yJJhh06csFavgnnJB7tl6+EHYkBVsuolEyiFEM5gNSi2g920vTvpkg4XncFNwrcYeuP5abppRDddhW1kmF08RG3mY6GoOucoLYXoiESYM903NYDRttkWxfHrsOHkafjJxSSk4hLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqpCLsY1CmrUuWtVZbk0ujoYsWif8tltOD/VUVSoA/Y=;
 b=IZnOBqz00GKPu18D1MG8FMHpC3NTysmmE1y2BB4VwiIh+TEtn+iMIuqINcqBDY3vMx/1bdbha8NApJnxwbIt1t8kQ7aFDTTLMqf2oGA9KCTF482HvBZursQE2mav25jQ4drhffrUHRV39U7pr6lOnBKdnScpb2PUPoFP/ZhyDT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9639.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 04:23:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 04:23:25 +0000
Message-ID: <87ttfu729u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 8/9] fbdev: omapfb: use new of_graph functions
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
Date: Fri, 9 Aug 2024 04:23:25 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d344b1-1e6e-4100-12a4-08dcb82b0349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hO3TwniK2jtjd4K1zlz2D0jq88l+/Qnuo9M+mJDWf9k1klKJr5f0lAn36r1Y?=
 =?us-ascii?Q?zMAQMD8EYeUaB6TT97ZhxWBQIYfpQGiQuItoMEKEoG3eK99R+kBY1Rj39Uh8?=
 =?us-ascii?Q?QRJNZ3Aszm6xymSwurRf7ByJJ/vYbgWvB0W1WgVuojwH1e3nbnY9rIWZBELT?=
 =?us-ascii?Q?aKVyFUs7YXSGq62fFGdC1aYyXOp8V7nQgniL8rnveYz+Nfx1zf9f9IzoHBnf?=
 =?us-ascii?Q?yK5PNZoSi51n/UUoDsW3yrg/Cg7y76WDozG+lAcY8lsZqpD5mg6hw+oer5Qm?=
 =?us-ascii?Q?4c4K80L6g+WYelk+5ZVitgShMklQCAVNUKFkCO6GSTMgGlOKU0Me+ryDXy/F?=
 =?us-ascii?Q?xbdlboFpJVXQVx1jAC6lSaeUjUyMReVbGmfPpZnA/9J5Sl2GFkHna7lvMdYi?=
 =?us-ascii?Q?uGjlP2Hf0zXmQrNOQ7Nw4wucENXANr7uynDFxwCp9S2APfbibyJDu2j9L2Vl?=
 =?us-ascii?Q?biJyVPTddRR+ACXSj+oRIDHudv/AXO1x3l5roEzlxeI1T9vYYfg4lghUjC95?=
 =?us-ascii?Q?msYGpFnsnKcPgP7mWAlTDlgBq1Acf0WerAKFZxhdOQW1X7yyACKY2tKrAcSM?=
 =?us-ascii?Q?FJ/tTDX4XrYB67Kmc3fKY+urlBsmT/LdzO9rJqikUJFJifAby2W1mvFCkfnl?=
 =?us-ascii?Q?zeSr4najPMgQAJ32mphGfwXxGAARZR0n+OSVaoJZTjzlOdhqOpfDfUbaG7jR?=
 =?us-ascii?Q?FD0DfjXnQA4maGNxZ0wl6+y7DXC0tMhfGlPGzF40jJhUQJacMiHv7MxMYkC2?=
 =?us-ascii?Q?hll1aDgbvEkYFpe4GUJzceZFM6834BlWBHxlCDiz1MUJCQs6X5x6495rZRq9?=
 =?us-ascii?Q?Jhv2EYe3QCnKITb5O+HFriNnR+rD0dnrhZzMqHK5wM5dbnU+MAeBEE8AY8RN?=
 =?us-ascii?Q?lg0YhTfOql2HhYwKQBQTh4A12iDKeRvRG57XWt1aJ8JV9UsgrsuTrhD9ZYjS?=
 =?us-ascii?Q?IhwHHsjH3MPgByPka5tdaXGn5Cw1nCJ3QjekhGaLU8Bp7heq0pv2eCLaRVqr?=
 =?us-ascii?Q?GuIQkL5BnP1zemPc7qpj7ZEiWXhBv+MyOj2XSdUAi8COcY9T4udqpde/Zc6e?=
 =?us-ascii?Q?/Ergu7t1yu9lboPIkpCnt0/sVIRnxFaxGeaDv34jXgLbkchV0+wh5YxJ6cgT?=
 =?us-ascii?Q?vUIaPV5T0FCjhPlwd3vSTc5VzNV0pLE31iyPI9L2av+RZe2ilBZpmBGSg7lW?=
 =?us-ascii?Q?od1TC/1tQZi0hQGK96otU/9MWLApWs5Z+z4aKwgID2/idsrltyxz8lP+gIEg?=
 =?us-ascii?Q?Jd4JHx4pvaYFEIE0WfTq60nuytLuq6D+8A7qr4/kOWv6W1S6Pf5pkxJeljqv?=
 =?us-ascii?Q?AnBcFmtYZy9XSe9eGgFzaAVTlgXjwVoreaRANdRsn2scNx+PzbJIqOMAnQV0?=
 =?us-ascii?Q?PBsJ/tyHXfN7ey925Zi8Pb1X4L7x95BUPjoi+UHuo1u5cZ/HdUhErj+bTA9F?=
 =?us-ascii?Q?yJOQDCCsa/k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1nDOUIozb4HP8H4qpodupMG8Cz81wXtg61yXq4ti5ZZjgdzF278aWw0aLkB?=
 =?us-ascii?Q?xNSpVxLgbRE4wE430VKgg7cuQgfhMsHl1Hkk+gxvzjmRd+OU4kAwzdzlp2JG?=
 =?us-ascii?Q?UJFfqjoHWOQcg/rYKdIH8afNjSV6yhKD0c5nXxmhblFyed2KXZrxnL4FQpCb?=
 =?us-ascii?Q?jQpz4WwynUWWfLnBmqPgLF/qHK1OjUyaknbq6LvxKamVkR79+lN0MkQ1cqiy?=
 =?us-ascii?Q?GpsSUc8esKS25H06rz3HBbfpaOBzrbMIrNrf/jg7fFDuEWN+P4c7hwzr/CCa?=
 =?us-ascii?Q?HHWqITTi6u8t0vsAdAHC7ADXEEHBZ8WQA21en+tweJJGpNxJIsutRVBhmtG2?=
 =?us-ascii?Q?fgSG4HBRE4dKl/1FVQP60fLYXw+qAOPZ1zJigVrIMl64x36G1AnuXr6IEsPU?=
 =?us-ascii?Q?4+8TewCQI01Ko9Zk07eXpavWb05H/Lhq0V1J3nHtU1oJWAO3L3n3BwoeUoX4?=
 =?us-ascii?Q?yaqkWUZnsWPBEPO9J5Q5M1K4MNTisKDXoWj0JqzfDaxeUZ8SMRuqmenQIRPp?=
 =?us-ascii?Q?8wnlE6kCUaAxLPewfCtOj8nCAn6PdXOgKSg/T47DKZ21q6Nn30aWwttzuiTN?=
 =?us-ascii?Q?D+3+boS8S7nD6gRdS9GTOOFiOxOS2FxSZoQtIWHG8WRMisjUkcFwWT5zF/iE?=
 =?us-ascii?Q?OSOz3GrCynTfggzAfRFSZou+GlyeqwONiyS9KYxHd9g23wTaMTenF96FDaKW?=
 =?us-ascii?Q?jDcgafp9hfoAgwlhZcKM26iOWDEMXNR/Mh/uhsWNZVNz1v2j/M89FQQpW2R3?=
 =?us-ascii?Q?N7e2qbrppPHx5XPvVkWRzIZs/nx/wVpJ3yCd8V3jXE5da2r3BA8AiDCOrj+T?=
 =?us-ascii?Q?wANUuSKM/uzp78hTVQ84ryenpRwUNCj1y/je6dAAFFEMTMWMm+8Vp/Vo6YxD?=
 =?us-ascii?Q?FAS6ADQHCo4qhu2sV6Gm1qKMOBpTaOdmVzlN/FqHPeS2jOLlL2RLLV4OVude?=
 =?us-ascii?Q?28DHBMkcubntk3oLp9tqzyAZxQxCtyvMnWOVqN3C2PjVqqtION3nuckVVqaF?=
 =?us-ascii?Q?8VBn9YHLMafAgWhj5Rqhqa+5tGeMAV77NY0OT9kLnY/92gJ2D9HiwM0JCa0x?=
 =?us-ascii?Q?/14z0xdMGrDFswlTuRjIMrhKjnLc0uuK7DUvE1vbh0uvpEJ2wGItaf5CoLM5?=
 =?us-ascii?Q?XMguX5YyB1q8IXXjg2uiHzGiu1Vd87wjMR3UgMnuTk86KgicyZ3nG+tPpBnY?=
 =?us-ascii?Q?CEnQemwR8gmZF981Zrnx3mqieOD71ZOaanIdFtN5jW+AmULjZdY+Zucvxv/r?=
 =?us-ascii?Q?pKKCJSggRvxIOGZuaSJm10k3pc0AJtJlvjCOPgWIPHF2jJsY9NLaL0Pv7yN+?=
 =?us-ascii?Q?FW2bpOvr6nRYtvFBTYQfbumyUI80fsFnWa+oJ9SASAEuG3aG+NvsT3lrtBF1?=
 =?us-ascii?Q?FxP3I8EPpnb30J4G5tvpAOJY7NqEDw439pHQ4zqw4wlQwhShmSfREx/1HqDT?=
 =?us-ascii?Q?E+/Rg8fZw19nj5pS+YMawFwn8AI6kmtlP5enzdhhSxpNuFHpqfVP1zMre8uQ?=
 =?us-ascii?Q?8afxRCIT3Va49vEHGgPfXMp0VndoAStvpTjNIbE7xMvZDNsNdEwDW5fAZmff?=
 =?us-ascii?Q?ggTxRH72ZDGvZTzBROJgA+BG9gwrDphU/t6d5gNVlAEg0dSYYaUuJVSZsoXU?=
 =?us-ascii?Q?ASldDKTIIyNKOOl7+mn4QRk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d344b1-1e6e-4100-12a4-08dcb82b0349
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:23:25.9005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPxlLvGOmbq9AhV4dbWxotOYBoaeQSdkVc6WxERNvqzY6M3lBnP8ch3Zj+TQGgRDgYR4KI0RadKeX8IvvAieOFrWbxQK33qKLrTtc1VjaJDJHG/cHwyRERobtOibDoSE
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
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  9 +--
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
 include/video/omapfb_dss.h                    |  8 ---
 5 files changed, 9 insertions(+), 80 deletions(-)

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
index 4040e247e026..efb7d2e4ce85 100644
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
index d814e4baa4b3..5cab317011ee 100644
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
@@ -922,7 +923,7 @@ static int dss_init_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return 0;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return 0;
 
@@ -953,7 +954,7 @@ static int dss_init_ports(struct platform_device *pdev)
 			break;
 		}
 	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+		 (port = of_graph_get_next_port(parent, port)) != NULL);
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -969,7 +970,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +1001,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+	} while ((port = of_graph_get_next_port(parent, port)) != NULL);
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

