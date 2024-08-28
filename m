Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B126961E00
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED2B10E4A4;
	Wed, 28 Aug 2024 05:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="FECwB00v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A4D10E4A4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:12:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5WKRhJ6kv7ffbofa/Wjo3hpXl/E8Qwu14DGHGsES2EZ2HHn1CbFkyO4q7FLLjpAWGfkJ6ziK5NFrHFb11EJ/TuF91dvYM8zojxQ3HE6X6PnbTCKP83sPIO+Z7AUAS/3siNK4tnSkOsh8kT7/CskkrISFZeCJVIMNOI5FZw9HwoSM8hBsdR4yrQ1BtbDuJXWpVVs2u4NWyxETYAk+xtky8KGH4o0XR2GnbiGslTb8unC/BQsAQ/CFl1+2LcNcy6Ce9EuOEkSmlYBTlRkMpF2gpZtZ75fySEvy0j0PwtZnRw4y6C3JNKzo9thaBBgZxSiE36M0RKF8/JCpQOE04V4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqSzD+TIEwJcbIxbpPutR6QFJxPtDwZqrLqSIzc8yHw=;
 b=Kxaogy/IdWydZqdoJUit9x+oP2iZNbI/VZHzZbij1NzdshAyAfpGaxu47QK12IK5ndYqHEuBR3brf3PBV9xb9saBxzabSotq6IexoZXVIzX9PDwdWH9b98SYkjnQd/015Iq+yLKUtp3WbpWOU0WQUT4T9tRNUFYxQO5gbTRcxM+nP+JnHzuBpvIqmuHORUIb4UZtZaFbiJKPH2n7bgF6TAb1AjdFN32tO2KcAXqLx2+gbG6VPcDWBc5vZRbFDzJtKzJdW22v27HTYfpAtpnsjyRLdYHjqU0zm9rOyBxZQs2Sw4tSfj0PhA0La1fpj+PNZbmf+8xS88UXWldodF9tTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqSzD+TIEwJcbIxbpPutR6QFJxPtDwZqrLqSIzc8yHw=;
 b=FECwB00vLcjDW/F7GTx8mFOE8CNUI1FC1kO0nqTYoZASQhSywvPWQY3VFWTXoqmVsE87RX5X6TNVlR8RUtt9nyczTUIZsPwc+rL2zzdYxsvyZglOYuaxVFyDHcgHtOwYtqNn6LCLtJdptE4qc02g/JWGtSoqt15PnzMNI6VsIOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 05:12:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 05:12:22 +0000
Message-ID: <87zfox1b9m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 8/9] fbdev: omapfb: use new of_graph functions
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
In-Reply-To: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 05:12:22 +0000
X-ClientProxiedBy: TY1PR01CA0187.jpnprd01.prod.outlook.com (2603:1096:403::17)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe114d1-2c7b-4600-7780-08dcc71fff6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j3uEaqMK75JckLEgTvaygCdYMdVvyh1HXOxu/bM2STSqaNQkaHXWds8B+MAr?=
 =?us-ascii?Q?HDq1vflAtveRAGHPCW3BnHzDTdLND4WOgRCjQ1zl10D6qvHCWI8E8LXnBz7A?=
 =?us-ascii?Q?VdxVEmL12hjfU92rjzNyX7id7BGp86CIHxFx/AJ4ePAIvwVLJzWXbIcLXJ0V?=
 =?us-ascii?Q?3dKg0lZxrPy2RHsfrpTbJyPwLIC501orwbw5vE/GZswD7PrWIRtVgBnSMnF7?=
 =?us-ascii?Q?IVo8BFy5rpatGHYvTomalRNKiJvCg1YyLGda63GFYY2o1ytAnS14+N+xPi1D?=
 =?us-ascii?Q?HqG7kzA8E7ppAipLQ8aH3jdA4sgGtRcurMuH7yxuYYRZwDo+v6yx0HKkE+mr?=
 =?us-ascii?Q?pDJEqB4tsbX3/WYw9VHC3V9sJKGfHvms31Zv87AONyJRBJACGW0Ig5ZR6WL6?=
 =?us-ascii?Q?m+0FMT88MYtUjuWdNwLUXYjRTHUHcrQZS4PxO0uT5PcqG0uvIYL1in/AdmBy?=
 =?us-ascii?Q?TR4qL1DLVoklWN69Gqh9yQy+OP69MHOIl8ElA02vDX3bL8TK8EtxU6vu6re/?=
 =?us-ascii?Q?4erjPFT06WK97agEAWjldoFHSb3KdyKvbG/ji1VmJB4Qtp1UdkF/JyG8dAn1?=
 =?us-ascii?Q?8b5eaCnRp7Gvk4H+NrFq6dAGRJ+OBtUeCT3SLwRCIWt7cnznacDTlHvlzci5?=
 =?us-ascii?Q?4lij0p4JEqhN0pMfemThNNfryTe4icS7NAd7OVOG0Do/d70C4IyiDiRYpZjs?=
 =?us-ascii?Q?6rF8W7zl+UVuFrSTBz+zcjMh2M0mT3G8pXHNvk2MHmAaJl1G+A1yXDoI6OFn?=
 =?us-ascii?Q?pVze3tY4K53VCLSYInnKrdOsfrgBv40oLNOV86xpcnuBXsKR35zOYdZXzMux?=
 =?us-ascii?Q?vRVBnZB20ozuDqcPwzwNSyvB3KpBPdKYdMLqB3gLEaSu0Xm1OVPKTUQDmba0?=
 =?us-ascii?Q?Bn0NGwy33v2tzfIMXfxVsUcjU/DrH+u1GhTusBDGLAbJ+ihsVpWvKaT+io0g?=
 =?us-ascii?Q?maASl4qZB2qeZlDf2FBvSBIEjNXjyILbEI7ChNqG9Neq90uIF9KWbH/ZBtpS?=
 =?us-ascii?Q?icnn5WywZQC2vup+YGwgwieit+LnAOcjwBvyN9dqCZenmUDLzuvhWPlmGDS6?=
 =?us-ascii?Q?MPFjpuBTdrRjUHySI8ULrL+ZJqAutzsyjsWNeqMIMD0+TlKl1uiW8NPrQaIC?=
 =?us-ascii?Q?yG5E64YigA/Y0nLPr4CKkiVyMHiSEq/u0DZbj3q31EgVt8qkInGN+ZdhFKiN?=
 =?us-ascii?Q?4SxA1FOpeggP7Crs5qS0MxhXrNeNJ232y5pcL6lRTLjTM2jFqDjWLp/S9e2X?=
 =?us-ascii?Q?/nZ1Db90YwaP+VmOIrulo+yLQyOX1dCtcf8VXLM6RcwqfVzKNK7pEN5+1EM+?=
 =?us-ascii?Q?QwnHFBFXNdBgvuooYGcv59N/94eGszp6rO8jIkI8pXjz+3p25qMmCw/c69pI?=
 =?us-ascii?Q?VkdDGlbN5zQijfyBARYLqs/WHW5sXWq2dM2+1egb/fdT9qJdL9thfEKHBfz2?=
 =?us-ascii?Q?6aVo0AINqbg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?itg9mOQ0nUzUJCXtSIWTb+6TsEBvma7EWGKUTH7TbrzSVpftmjR7V0d0qQz4?=
 =?us-ascii?Q?6EC8UeZycC8YEYBtGq/5Rpat7yN/a/OJxiqdxOOujc28g1REF4+HVvri3Ir1?=
 =?us-ascii?Q?uDLNhcIUh0TTP5O0/pj2n7hceDLAlhPcDxX16IjljhPUKtLs7FyC1k9kXHqU?=
 =?us-ascii?Q?zcHfaPKbzI2KzAKAB+GHquMlJ4y11262ryjdbSF18kvvqNgW+kHl6zX7i8/R?=
 =?us-ascii?Q?7Kiweyi3cK7ECYP8N3A3BuqLnk7of6KgPw+pt8FkBp7LTv3PvpVuodis7Cmf?=
 =?us-ascii?Q?9pGTW7/0au4eYBwDGq1PnJwkQ8CNgcN1mEl9aomZfBmSQiaOGZEjPahOVlUB?=
 =?us-ascii?Q?hF4VqZm81rVh8ySo2zgrhFpSBcPB5bXZF9mMKG/CEUnGPtptFtjj59L6VXjc?=
 =?us-ascii?Q?uLX0Ej5iL727GaKe8Qy2KykZ/VTMZlFGUsEMJG2YLl/RG+Pv0gizCkdAfLrH?=
 =?us-ascii?Q?UXqXzQ1jUUP1NcjeNaiXnbdW/Bfd1BdzryDKNv7OaEw0PUHzZ+RXkD8OKPrP?=
 =?us-ascii?Q?7fIRW36+RI76GehmSRrT396ShUYb3voLb3/onQ2rdVHwnbMmQ/lG3c0t5Dl/?=
 =?us-ascii?Q?rTNMjun9imX3FOGt/GLL+dwJr9Ae482+QQ9JwY+RHPmjAKfAVXEFLAWyij2L?=
 =?us-ascii?Q?G79RBBREQrVbWihBgLNedFwkKLiuQMOWv8Xd+IdiiUoxP4u9IAmH4+COS5TR?=
 =?us-ascii?Q?uUvrPj6ZnprJZpjhWnBR6Tr+fMlu2RcyS9wou3gmNG58xZ4K+rFd7LjMILVM?=
 =?us-ascii?Q?V9tL1VQeUZ6PLSpLDmKlwnF7f+CkN+FEN7duaksFRN4KppDGJ6jhe/NRea0A?=
 =?us-ascii?Q?sO8use6ZR10OAbwC0UHJua1lvpSJX4DzTkhsV4iiNB+P2HfVUWT7PM/NEQtq?=
 =?us-ascii?Q?OjtaUTaID10JHkaf3wHBc7M0/leimx0PmhxylxWYs+fnJrjoKwTD0FiaP2mS?=
 =?us-ascii?Q?hc0rBOSVE/qwk9wwImq0Liyt1OzI7R9O3iJFYee//i/6iBVUUU3P8ISXJN7U?=
 =?us-ascii?Q?DDhChtcQT9ZYNkLQHmasdFi5U8K2xd0dU9jQYta4rPIOpYRbBEZrYE6khghX?=
 =?us-ascii?Q?c4LN7LzjawVRoNjNG9Fw75QWcE1QUWGmWPN0BUiH/goSDhkV8+ZFptlsqOTU?=
 =?us-ascii?Q?5I+t8Yb6sBwKbHDpNxE+xeHaMOi9fqlY5SbNaAuYqLdfS17aVsmBhO5gyA8N?=
 =?us-ascii?Q?1B+QZBf+yJdH/X2Pe3guCHLUIPXSVklL8Vr+EIwJg9d9S5dxfDBAp2ChgXW9?=
 =?us-ascii?Q?mv8D1hhPugF7Hggg0tnD9P0wLa60JoX7+ggIuYBjIVzMERCUzniFmFi4fglq?=
 =?us-ascii?Q?y6N2/bMwcUaRQeh3ih4XQydx3ZLRmh7jGpIxvw5pZjyqQocvik7o1Mhc2ueX?=
 =?us-ascii?Q?wZCX2pzUiuqegkIR2gDhLNl74qX0Euo9XjDj12bo3uBgyO920VOpJ7qoAwMd?=
 =?us-ascii?Q?SxQ+Lvm1WdRNM4zqwzFOoW//xYbTAGB94NGafmQIZYJYt6AEJ8rvrIXI8k8e?=
 =?us-ascii?Q?KxwAJUF3otwgau0rTOrYDccFUK5njQaOvTV0LjlnVw5SjQA/IN297sDz7PfQ?=
 =?us-ascii?Q?uSvWec32Ec9XZd5L+/FXpOsU99atEw4STidBwnf+4nyyq+/RjKLnZ3DLQJlA?=
 =?us-ascii?Q?1vpGybQJkuYcUE4pJTV/6vw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe114d1-2c7b-4600-7780-08dcc71fff6e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 05:12:22.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhgGgzz9Zqz6nP4DKabh3NUin8vyDxSmDrpZYViC1w8Qhx6xFHZAyG5vJ475ejhz41awfB2Pm4ncwsal3ke0uIGWEiP80PmlpPLC5Mwldf60he6FfdVL2P7V9FD4U2hb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11955
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
index d814e4baa4b33..5cab317011eeb 100644
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

