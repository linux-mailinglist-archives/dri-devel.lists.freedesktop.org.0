Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D68D798C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D45610E0F1;
	Mon,  3 Jun 2024 01:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="EAW+MQlu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C5A10E0F1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:17:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtISULIaVVgNEGhyngCyvwirk8+vRcKvcold51WoZcDylRoMvgp61PvK8aoujThWgK+V8YH3TDwWwKwg2P2fw/FBLi/+cWQyNqTsD9mNEmAxZPiif89FonzIvWoL4r4eFS/vQJ7O94WevNit+Ip/S9w2TwbU2qx3+DeFXJEKRfQvG0kBe0+sxKFZDGWR8dbv1kMgg7+wgn9Se56RARsLwGmbFgnc7X11Fv6JxzQg93yYv/vcs3un29qMdGrh4bm/IYMB6tlYlZ4wmIhV5btVqPZkzSMtGNO9aJ9oekHGA91egLr/o4GyroYLB8PBcugilrS+TKG+hFFOThtoo8e0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=A/FtDKW85nzf/eICMqhAJgVtGeEW9Hdk37kEaJo11AdAqXyiXv78/pGMcGBCd1c1uMq2K9ttmce9Jmq5Onyt/cwOjMZpspGjnOOYjQ222WaqTHBIYW8ykrVWNzpdY9pzpTdj7+prDcPytoa94DhRqV7kZ3Loi65zwr22LN7BaPB3RtLJwhg67ghR4PvuMKqy1vup6xBb5CLmoQWTOgbsASi9DGT7WYzrjinoz0sE8ZwpCQU4FzcyihCuLg1nAOQQdrcbl/y6oEjmEkzksHoOp73Riq7dsWfPT885kI85W9ZyuCITL0hM25ak7jBIOvlqYybFS01een/dEvSjeZqLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=EAW+MQluu0EGbcTRBU2yuNwFcD7e/h0Cjn40PStKVTzcBRfrOJhLjdA4nV7AuFBYVfDZGPqJ7J6u4Db8hwvY3i1NrxL8rA2S+01ft5nEugQqkZdD3Z1akgR37ip7BPWUuYlEOF+z6TsrKtnYxO1aUMv9swg+n9cOrXUNn1xm86Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9479.jpnprd01.prod.outlook.com
 (2603:1096:400:1a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Mon, 3 Jun
 2024 01:17:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:17:50 +0000
Message-ID: <87ttia4yf6.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/9] gpu: drm: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 3 Jun 2024 01:17:49 +0000
X-ClientProxiedBy: TYBP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 950035ae-a759-4f7a-87b9-08dc836afc5b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|366007|52116005|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WE5FxTYP7NdKHaIYi0hA7gBxikA+nS0m1+8xY3togSW0yrvI4qTV3Oc9gF52?=
 =?us-ascii?Q?ZripW214+ByqHrhk02FVT8qU6e4H5vbEakAiUHM90c7Z+xHoNuw7RHrOyLG9?=
 =?us-ascii?Q?OypbIFyOlPiV9jLc2xPWo8+1Dfs5gOjc1LGTzkRUIxVyoULwCvdIBe78kNRh?=
 =?us-ascii?Q?o5FVJD9VPMf2wVY64wi72xTE2fpRPZTyY9kA97qZ/89Wdf3GbeL9KOwHj0nC?=
 =?us-ascii?Q?3t98tZGrSamg+OIciaDtbfj7ymwpZw2FAdL4PzeuoR756wN/gUb/9ws0TVS9?=
 =?us-ascii?Q?ooBJJNyd7vsl5P+ouMAqX5FmGmBeG9t7jQ2XGesrkva23j0QglgZPzWHYR9M?=
 =?us-ascii?Q?ylYDOIqtxjxqsW2WocA6q3q/ZgGe5fJjNix9KopGbVZHmCIrbVi+/7GpGRSX?=
 =?us-ascii?Q?/3WWzP20fQH52ZmNrSgVqEzdixyGCg8yasCrxfPP4jYgvPzcVTWCdte3/MUw?=
 =?us-ascii?Q?i0km3d+kMMMB6/RZxdoZ2wMYHvPq4u487ZR2zhDoacFWDa/cvW9l8N+i6f5i?=
 =?us-ascii?Q?Q2tOxxvvlL1cByzWNfpmfQpXznnmTLaektIaESWN+9dVAFJsxWFbp83IhIp/?=
 =?us-ascii?Q?CHM/optemvdgWyGzdcr9JpZg1pQKjprzIbsgomv32bzkNiDUQO+QDKRCr0ov?=
 =?us-ascii?Q?BJUK4Cx1C2IYJK1Er7bqHOXthIkO67GXn01GIJe/LU3+q/HDqxubIbXT+Apx?=
 =?us-ascii?Q?4Gq4ozJMFz38Duc1DlBGB3mflUoSm0Mjj804Jn/htBlqrca24dD4WWB/4Tk7?=
 =?us-ascii?Q?laRnQBK59wXjqqLUliGln4WATVm+ak/bslZuL63CVXk72inszjTSTM4awzIe?=
 =?us-ascii?Q?EKlHo8OZK0XRElefaQgxqBSf0WisENa/yCkwWo1bjKgGkSJzcy1owD7E6nnn?=
 =?us-ascii?Q?6LMDLbbzjfyvoQqp73OSUH6WiQkBw/fzydUWiiwWFUnj7BKuXvx/+Q+dZW5N?=
 =?us-ascii?Q?KFn8I4ON54MvgdIPmcQf//hLTOVq90NO1ahZka+y5AXoUAHTQljgVefYW38k?=
 =?us-ascii?Q?8gxyGBfo7+VjctESr6z1LvCXv/U6a2MqnzSEZ29y+Inj7Y3i8GhofPDF9qW0?=
 =?us-ascii?Q?WCfUYIUCmjTsigFaaJZM+i0zDtjzvhxh9IIlxJqYKQdtx54geUlh4GAlLeoR?=
 =?us-ascii?Q?NmSauqTurvNFXao3VwzX5htbZrjqwuZeobHuO9kVeah7u/xQCbRA0JqWM5+k?=
 =?us-ascii?Q?PeiJzRsa35ioqVriOVuBIhyy3M928pQykgVEqLOrb9dKS9tlCt6PgZUf/Lqr?=
 =?us-ascii?Q?2q2wOogMPBAxPC8e6Ye6lbrKhFi2e1UyBjhemIRwFO8ziaYNY2lkJztXLHcR?=
 =?us-ascii?Q?PJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8dk8MWfxOgQdTRxfitijeB/XoswINEav/2TnTvryVaDTQVdCSZGrEkpnMcJe?=
 =?us-ascii?Q?spNbXJagImEpd+jEymLe63JshW1uk8eAYGFwLHZP4HB/UA4CpYWFpA7FLzKB?=
 =?us-ascii?Q?q/RvDyb4oIGXdJrA+6Ie9XdAgASaQ76Pz8TzxDPK1TMHPsm7OCRUu4ftpp2x?=
 =?us-ascii?Q?7oXMOh3a6WFDDPETpM36R/nae0n2e7r6FPBx/cYIcOBCdmNSn47InNakI3JT?=
 =?us-ascii?Q?d4IE6ZF40whC+t1x70CY+We1TNsNJZbunYdde3xac5vBCF7ulPgiDa3MGQ7E?=
 =?us-ascii?Q?vlJscLn59jT2lzn+T/Z17PjMr5CMKqMykkApAde9G/uJnpi8qhRHQoUnVdpU?=
 =?us-ascii?Q?9+/3wGv7O3AzsyGvc3m7R1QMnmQdLKbL2mnRFTmtk+vnyhPjXakiAl+VCX+0?=
 =?us-ascii?Q?/6z2ViP10eoQQ6aomzOw3AnYfynZye7ZS9bTOZeg+Tsy5eLUMqVRnXJsdHb/?=
 =?us-ascii?Q?Ww/YC111086X2kW+kAhDt3C+TquciBmBKmXjJn291hvSIynOEudPb+zoYnDG?=
 =?us-ascii?Q?lH87maVLbokj/oTzul31ugGIm2Rm67HTfHXaJBPRFkpkvGUjYChAcLT0nxE3?=
 =?us-ascii?Q?7ib79EBWc2ZNrdU8qV27zg6PxWRreqq528UDt0SJ33gE1Np/9DlNYGlY7a3G?=
 =?us-ascii?Q?s9iZ4/1WbKX9+yTyxFb+2vzxun8CLgOhczs2keDm73WFK0dmlC/BjYlfXZLw?=
 =?us-ascii?Q?waswUl1kRilC0yDWL5nStY9aW1rgQbGgY9zcM11GoAzXhzCIBQv4aLWaaf4d?=
 =?us-ascii?Q?o+5CwuLkZuQmcOEBIJMu/AFDajQ4LIeAZqkurkpXZPyO67sFHQ9M+HS1BLYI?=
 =?us-ascii?Q?neE6RkOgUk4OIclZ0EhL9o/aHKM1sHRN+36ifCMMNrTgo4F1DPNjhs8pG2TJ?=
 =?us-ascii?Q?qa0f1oTepFqwXqd77XdWeB1+X2jtFmp6ySC0K/ottfm0iWO3hMpxv9OXqt4G?=
 =?us-ascii?Q?/xnUoT/ZAdbboKJipjIIwT8sUefgbKypP1nl1nDaEXkJzS9iSd/2/tgfyXk0?=
 =?us-ascii?Q?12dSHdN0d1Zo2z7rf2eAmbiQ94vI9P3ETmVuIj8XgcSb0pFcfDhwCQTGPRmE?=
 =?us-ascii?Q?k3uQ1P+b12bZdMbmy2iKLDF6Qi7WCpupKhz7ydnkBHWlbMZxfgvkR6jIlQQy?=
 =?us-ascii?Q?0K6JLrn28IF6jGKFvM0Py4KfE3ph7DvZmBrkxHYDurZ7AtkWYbPVrbEtAgty?=
 =?us-ascii?Q?9YloimpvnoXUk1g+A8FD00WQ/Y3FJFg6klg0pL/+G2xlXkS9t4BdAQiBOQW4?=
 =?us-ascii?Q?3tBoCjK71mWbOkXo5WtkoWOmGTc3naiNdDmfn8cWd+1VqQQ32/upte+x7J51?=
 =?us-ascii?Q?uvecWy6HzNyH+RixUNh5lbAKGTitYZaKy9+706LJNAFQFgwf5bluHypHgXWT?=
 =?us-ascii?Q?ctRvSzp16nhXGdNIyLbV3cuXUSj/G+ZD4lke7gUClKZuXMpuW7I2dDbSpw0o?=
 =?us-ascii?Q?PPekT7vCCkKwi5oi+EsKBW25ImUlSRNQW++HANqWx9B7wlf2BwDc9VAbQF+L?=
 =?us-ascii?Q?6KCSkrfb9as3OC1OAG31CBy//fii7zYOg1TGoVPX/RPv9/kEZ8m+3/ZBcb9e?=
 =?us-ascii?Q?X5T6VvZlCWKqziC2otEpiMI820XxDvr/9Yv45LmmvUKC6w9vYcqHyL1hIIhI?=
 =?us-ascii?Q?PjmbDtoj9xnsY8TBUetuX6I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950035ae-a759-4f7a-87b9-08dc836afc5b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:17:50.4575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n50NAU+zvHo2DUgpbihxT+3R23+JOPQ7jJg/lVZNsqwsEcr86b35ixOZ2q0NSTcz01gAwySmjJvSgne/40iieOgND+iV2etsI5wIzbA3XZ9+8kQxfniEuVxiUzdnW3oO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9479
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3c..b6b2cade69aeb 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -504,6 +504,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.
@@ -516,7 +518,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device =
*dev)
 	/*
 	 * Get first endpoint child from device.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return ERR_PTR(-ENODEV);
=20
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driver=
s/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd65..e10e469aa7a6c 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c=
)
 	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
=20
 	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return -ENODEV;
=20
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e3..8c29b719ea626 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpg=
u)
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
 	 */
-	endpoint_node =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	endpoint_node =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1)=
;
 	if (endpoint_node) {
 		encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
--=20
2.43.0

