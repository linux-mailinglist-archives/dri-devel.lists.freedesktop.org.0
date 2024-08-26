Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C4195E6E3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031BF10E0C8;
	Mon, 26 Aug 2024 02:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="GkKsSZ82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8A010E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 02:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SND8JAg7ED/7ukJCIkuaOleAhYgD/G+vIOoURMU5RaGoOb7QSf1rJRbwiHKSzxWElWAQRjWo+lxQw4HiCMIKvcOagYvE9O6U651vs3Aw2TQeyDQmYoVCagozLK8bCcodJdM3qSidCjCLnc0ToMsgdrJtdbwfH3nlQAtK7pqs30vvBHzFZXHFcblx7bpg26+33sf0Cu3Sb+UCLGFERD/kgHAv95q5WZzhIoAdsAiqnhqFF2pd2OBDuXPTdK7DX1tKMpECZAKwtdOFamdOH4F7YOzchjSqJZPAXxaYMKJU+xTz7jLkLKa8AYqK+ceWJ27pd7CUdYGoSupDsq2Pb2XhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqSzD+TIEwJcbIxbpPutR6QFJxPtDwZqrLqSIzc8yHw=;
 b=SyUcYnQMgv8YSpr93SO3Wy+B/ujWuah+uaTZu27tEitBFbrEovSZ5D9dq2qzNP0VodhVuf+FF6jtCzqS9wcyg6Knev+f99/+j2A8PhL78mvh7iApasC5e51AevT2akQG1E4mPxGppevm7wHhlkAUwf5clcmYW+H5rHsetRAhXskHelQJYuUwwlFsX5uauWLkviaa3OK4905OmIYiCHNvLJKF4CK66rH4SIGsFvr0MufPEQmCOE5EXyRiFeCowKPOh+zci8f4hvcfrE1VSgox472Q2IyZwYlY1DKtvZrG/07ys7VwZcwx7uWr7BpDmCHcQI6W14Kt/sbwnIZ8vZIotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqSzD+TIEwJcbIxbpPutR6QFJxPtDwZqrLqSIzc8yHw=;
 b=GkKsSZ82VT15gPSob8vDZyZY4IKSTtkLxS0qZtoDJgHX9r8+ZVdswPHj/qTGMGikfijio2sR0wiv1gqgc4s5hBYIVKYMYKiQx48XMAu+NGWN1vgotpPF2wpLKP8SxGRzMU1Y1qcTTWtbwoctPsFuw7lLIROJaYeE1dBZ5gvT2Xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11547.jpnprd01.prod.outlook.com
 (2603:1096:400:389::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 02:44:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 02:44:01 +0000
Message-ID: <871q2cq9zj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 8/9] fbdev: omapfb: use new of_graph functions
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
Date: Mon, 26 Aug 2024 02:44:01 +0000
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11547:EE_
X-MS-Office365-Filtering-Correlation-Id: b8372222-0182-4479-3209-08dcc578f136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ki2zNC9xe1z3o+UockJmAMZ0Hdn1rnFW2luojXSC4O221+cdN2LQzviQ6307?=
 =?us-ascii?Q?XO/HYI1SOck62Bnr9unVMyDiOrYTXm2Il6PqxiB/9vpY76S53HlcAP40vGnz?=
 =?us-ascii?Q?VDFZoOXRdKBf6/XGsnoSdoSmJgIguG5elO9ImddRHQWRnzGjL1XGkQZjJqOA?=
 =?us-ascii?Q?P6n6EXNgON3hwADAcDUfuD2eDgtIXSXkuSyf6jNPc9tU058thm0NFfMRb+26?=
 =?us-ascii?Q?08sSeXlJ35HUMFtH6DC8AlJ5rXpUWA0jHC75cXi8jzv/WqLytHtP0NWW1iiW?=
 =?us-ascii?Q?1YRfbiC0V+8oh2asfExU3ix62GO5fRFhrIhHoDSDZhPoI0u4EQ0kRGZEIwl1?=
 =?us-ascii?Q?P/Wuu2lOQQ8g5qkZpHwn978RTIpC2SZdz3xL3L0DhtWVRmdM0padMcwbuPkQ?=
 =?us-ascii?Q?73+jNryPumTPT643GF4Y10lA7YlC00/ZyOK/F0hvC66zdIyLhIXKzHYs1BY3?=
 =?us-ascii?Q?5VF3yLHPb7u7T+PkRV8ZeC5swDfPiELWxQJnPZxBIprPD9Yacx/Fmm5gBbGH?=
 =?us-ascii?Q?wB36dmnnzU9SjPaSTCLW5UPzqyIiQTtOQnfvJCWSWg2nZAGj48+dhjulSLsb?=
 =?us-ascii?Q?8bmF3kZtpxoX7fKEzTubJMqJ3ruIKKra58f2cYQ9dIbDc3pP5sG0QfkqtIYS?=
 =?us-ascii?Q?XcMmCXyhUM2BtPZc24TRlQ4e8lXzpDzb93JQNbSDJWAquH3eAeBsI5hH1kxq?=
 =?us-ascii?Q?0EONKvMErUhZkw074Gc/+Zl3PYdyfpumcICAm8/xWebFCkpVcmTJFiOcS/a9?=
 =?us-ascii?Q?r6ejnIWjQNPh4ETGjoQUDCNAtWP8AypBXkTeyV+wZee27vB8+nNHqR+6QuX3?=
 =?us-ascii?Q?28y4rSM2lRG/XpI4/cNTaVx4fL9IudPIemP6hdsAOvCCNuw5iJktpRyQns22?=
 =?us-ascii?Q?wNZ1P9EGrVrwDu6q3BKddz8J2Lc49bmhRtynHgTMJjKjm3JSWrXa/cp5wOOz?=
 =?us-ascii?Q?pThXGoigTGEVsTA7DLlE5Yr1yYfkYxBqq6asfqKOPoeyqhwVBoX5AGnXeDJF?=
 =?us-ascii?Q?SBY5Nmgr50JD4i7JPkdsM265hNsLH+sZq7wbWnlw0aeK91Q24mr78fsAhPRA?=
 =?us-ascii?Q?2mZIObejhx1Pw5+GBOugPXF0obi6NU0a7IeJOrfJckKn5sBxYN5j6SUHc8jQ?=
 =?us-ascii?Q?e/lh/EXptoJE50eZS1FD1JqAdKhIkkRIcLw84jQ2T9GvjQ5hcALnThdUdnhN?=
 =?us-ascii?Q?T5fHkH4jTxTQUzFkLncs2BJ654Mm7gsdpks/bYNXAZZ9ZTuBqBf+hFSGHWzo?=
 =?us-ascii?Q?imO2dShhF2h3cC/AqQNH7sejUHpUzkCYlsLnSW0iJ1lIf8ots97OzB+2SFUe?=
 =?us-ascii?Q?7+rJEqGvdFFCLJHkrNyD/IV+3uxHucF4h/eabw/+kndbahWEyioSG0Zrgt+e?=
 =?us-ascii?Q?szXgI6RDic5ZGaRLwQ3SJmJilyIzce+KNiofyrGds4YJJFZsdwlwOJv9ihzK?=
 =?us-ascii?Q?pPqwKwdbXxk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?apQxerIzDBN+xcNmxBoVaHWIfAuIIGbhD9Jo6aTc3NcGDLDAUtKwpJJLzVo+?=
 =?us-ascii?Q?DC3f7j0GgdWpdbcl+EisQiG7TJElVmT2RbSSmsS32ax4b1R2nhGbKrR6Kbgq?=
 =?us-ascii?Q?pupbdmDqLQscs0XLqB716EgJAUaNTpaBK1+TC2UpMO2vfRfaXdrq8BEtRSXe?=
 =?us-ascii?Q?2ecwJRafBX55jse8lud8INvnNSnx97x7ruUjAUhh9Qy6adC2JS2zecuEPo/5?=
 =?us-ascii?Q?bM/s993Pz/4mmVGSAwrjAj8jsG0z4N5eyYezl74HSMkPUXDCQyIKCB9eAHl1?=
 =?us-ascii?Q?sS2cp2+RnI1L9MlJF+e8UwrIsskAUXRSIMj79QRPe11HkNpRC8OnKuSPrfBj?=
 =?us-ascii?Q?4uMhBcwtwogcPDVcNOnNCL7NpQfwbTdEnwlzrBxyt9/XPSiUTbggqGqwSsOJ?=
 =?us-ascii?Q?n1BANhwGkvBoAbdKvq/s1nRynnWYvwlHMKrhd3lzU0jNjV8fF9IAhDMsP+3P?=
 =?us-ascii?Q?FYu8hVEwYEwRlnY/WIa3WpS/TWzhtUU0PpZHZzeS0WEriAc5Eruu499XpFGh?=
 =?us-ascii?Q?ZCMnnnq+f14zLVzi0tPCcl7iWtE8yQW8r26kscxp9XzaEKz2FMuNeKzf7XZs?=
 =?us-ascii?Q?neZmXtXDo2krAh/DVsfYgXJ3H6FR0M5IWQOX05ik68lqVrHBxWwzwX7G4HBU?=
 =?us-ascii?Q?FJzcn5KnWwAGbq7BM8XbGXYCAsd9mLwaH1P0wecgW9gUw4qD6zRt74IMJmIr?=
 =?us-ascii?Q?RY4GRAZkRUkgeBbRQhnayp5TFDoK0zXj/EHo8X4PB1K3Jjws3+81Bm9DU8MJ?=
 =?us-ascii?Q?e0x+xruzRHN+5HBfkbRwlRJ7KUqKprKpop1miWldERuZb+F5+I3zKRmogcgP?=
 =?us-ascii?Q?lNJrIa6DUixuHVtxT40t0mPzsDVQr7kl2SxgjArhUyNPYbTa2YiMw++wRBMY?=
 =?us-ascii?Q?BLkNgwcR1EK5xr/e6xEdi9qF59uAuAYYZP2pyhktShi1d/XmoDaqJY0IqU27?=
 =?us-ascii?Q?HXLryvyqJHgCBKZyBdVkFr3hiVQBm+ZkIFK9VAQP3xTcT+2ySBF1zvOFvvU3?=
 =?us-ascii?Q?EdZeBoBJu8DYXy+U3+jcT5mIJmn5ylXELuo6Wy63smwnfeQk6V49uFiOqc3q?=
 =?us-ascii?Q?vhrLs26KDGboIjjHdCtuJ6YNKFp/xlYN7Tqc2lVj3ldCu4bVzEh3xDaYCrwI?=
 =?us-ascii?Q?Q9uddmbVvaK8r7FiD6YxGmxPguixpeRA4wv/HPyEY4sV1pQavL7TqaaVOSp6?=
 =?us-ascii?Q?SkWxBx1c5MwLW7CUFgUosCIoe482pvs5n3stWu98MiicfONHgp4eCfcsQrwP?=
 =?us-ascii?Q?FlCzo0SyGsQcpZCiFern/LZeK+qaDFGpMDoNlZwFRBrAjRkCqet9OG0Yfp/o?=
 =?us-ascii?Q?h/t3+qUrfmpLsfSEEzAJ4kJc2pA8vrYQSKN6FhQgQOazE444uCKiLD6ijxMd?=
 =?us-ascii?Q?Ko5q56Fux+MMpdmkA/81OTea+ztzIkssuuDbvLwDTXb4zmak2AN1Odinz+Qa?=
 =?us-ascii?Q?YTqhZZdf/FysDm9U5bgCvfFFhFercefJQCw/+G75rkpxHjgXRJYViS50YxeX?=
 =?us-ascii?Q?QaMwo/giWI5wncJDBNJAZLUo5SOS+lLaoSveQ+ikaeFvk4J6nLlWbKlSJGsw?=
 =?us-ascii?Q?crmcLNM0yR0cVUaLDJFXlBVwi7B4wVuLnaDd6sZkAp0JAc/kYsa2qQj1dTy6?=
 =?us-ascii?Q?uEijQz2u55kMbffkFJG2WZ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8372222-0182-4479-3209-08dcc578f136
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:44:01.4266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqpvqowL5cMtPEkBiCoLsc128ViUTClvKIu3F36XyaRp9E1/bxhuAEGt1A95pos9JRXqfBHrzqLrre+2mtN2Z4UHGTViceAJVKxZJuwKTvlsgOn/xiE1oyBVtP0x5Gae
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11547
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

