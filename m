Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3D85B052
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 02:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522C410E033;
	Tue, 20 Feb 2024 01:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="iRJK4Snc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2050.outbound.protection.outlook.com [40.107.113.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350BF10E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5DmcTJp5NkBv1wohjc+aaWMGCqqZHg7j5gxGc3G8takDrCg4Ybwrop5I7QUXhf3EHd58dC1O7G6YUcvjOQHStQ05ALzo0EgYaas4+8EmGuRNK6dk7QVKpt4ELniMCSN9+oFVqnZ7GCBAcOukKsbL3V+DbHGEtB4mRqxQtdbmu6ZOEHIOOcDzOp56DKSI/ifEEWSi8bHfLdlF4pxtSuWW+Q9ZdWB4X74UbNrcDTo6pCUrFKgLse/U1pkwwFjFTMaYg2ZC50WolRo7CbBr4w56miEMwwVU1PH27QirJN/Av6KrUJ/HEXSuBPsTSwhajEkhN6MsTepO41TibTse0cjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=bOphjlt/HKYZdCXr34UzKPMPPUJcMgh3yZynjECB6L8n43qWbJ/Suh2bgXPCxwqL2D4tsToWCf7YJXO8kNgJuYgGEl+wIIIl4zgTYNqkkY4yMEYAgLSHDrgR55GJKfaqUWnOMwq6MIkFmoJSMPhUwJ6bXTeHWxwyixyxeI6Np6Hr6tBYcI/kT2M3sxWnPsnCQpf0okW2nmD0rZwM6g+6tmE/5PRHKnzOtkF5YwdBuGMXHiyd/q7UiQO07+BL78X1W1Z0QYU6lRz6aAh9R+S9VKbuaJsW2s4qc8gvqJeiAUcnsx3vjcRfGOpIAHt+TQakJw+EKvoEqcJEUEUIkIWAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=iRJK4Snc5SYwo400Zi78xXlBy3VUOtyyVbWJVyyEoOcHOo8CClj7SKrA7RSWpow4vhCNCIrOelVm4qgRLRBY0O+NVjtJ1ujZvYEDpwNF4oSYtaIA2w8ePgn9cA34gE/rlAiy6rdKWJ3bHUCQh+WCevU9FCcGZpzDk2fb/NKM7Eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10730.jpnprd01.prod.outlook.com
 (2603:1096:400:296::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 01:16:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 01:16:02 +0000
Message-ID: <8734tokka5.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,	=?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>,	Alain
 Volmat <alain.volmat@foss.st.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,	Andrzej Hajda
 <andrzej.hajda@intel.com>,	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Daniel Vetter <daniel@ffwll.ch>,	Dave Stevenson
 <dave.stevenson@raspberrypi.com>,	David Airlie <airlied@gmail.com>,	Eugen
 Hristev <eugen.hristev@collabora.com>,	Florian Fainelli
 <florian.fainelli@broadcom.com>,	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>,	Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>,	Jessica Zhang
 <quic_jesszhan@quicinc.com>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Sam Ravnborg <sam@ravnborg.org>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>,	dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,	linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org,	linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,	linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
References: <874je4kkdn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 1/4] gpu: drm: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Feb 2024 01:16:02 +0000
X-ClientProxiedBy: TYCP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10730:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f87b4d-115c-4c58-64ba-08dc31b18132
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67tGbR+XhqbX6F4DY4HIf4xavfmDkCJ3IJIMfod5FpTPyGvScz/SERz6X+xUisA8nKt2LGP9rCHNMUA50YGuyx/dhIw2KK7m1APskpZzJI2M7T5mB6GECaXlg/aNeH3tSJMuY4vqZ9ptiu0bVS8cG3zhxCg8R6jB+Vwqd5kasBqvHVSbvJ2Du8El9HhMRFREI1Wpg8pKBv5nB784KT/9CVA+fEULjq9P6P9vRSUyPKW7zQZSJz0aAuVMSu0bZLXmckD6LqQgAkdP0ETcF6wr096MtPbAFo5jCn/vhGZmFO9Errqwb2VIjMbPcfi3dA/lnoJAqZ0gL7Yp0uawf0BjwS+YLgG8MZMe54V00CyVAPX0OOpl7D4EoFA/o1yBYgIDuLz3TTwsaKB5jbYdN1ZprrVmfOQGLyr29O45abjzVnOhkVizqyB80SLIxth/xnr1BgjmMRZvTT6GJ95yA3SX7CD47+JOWgENjvJZCiPtYImSp4xdMBrEgYTL0s0WdDVyQHBjZi1nZKjX+HFmLmha8Csa514cR/qxEzSEY2FPQlzQDg7twPbISQaU/ZZcJYEx9h1isyUlE1K94u5CPZA+EaGr0DfxxG1f2LClkCV3+FyY5wo8CsCWINaLNEFPUY6Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38350700005)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RAD3oyrXNH535fk665NeZDQ8a7UyfxANp+hKHYPVvYejEE7wQxtbV7UjcPui?=
 =?us-ascii?Q?uN+3Tp3kN5l5IaKuHEtHaTwJ0NI4jG91CSXatBZE/QzIYuQJcKVBwAnbmvGw?=
 =?us-ascii?Q?9qyUvVPIM19cpaItW9ESfpRSKzpBkg9xzOnv1BpQvOlTbm8DyIOrwgpQEKLi?=
 =?us-ascii?Q?W1SXDAqxneCcnqGSM5kCrv5gIun6zZfac/XRE0v6RDPeDd6sYCdBBggaZL3a?=
 =?us-ascii?Q?dO8K4Pr8WQXMDRApNmkvoCTMVFa1V2G9qUNU59gyHhAnuJ1nAK/i4Y7uH9SV?=
 =?us-ascii?Q?CvZQ0/DSVe8dRBTXcW8eg6thFMT9kEoZmTU5UG4XPfgTEQYFF2TPPwXRsSQ5?=
 =?us-ascii?Q?Ds5FD+cKCXVya5zIRSK7gH9brKzLe/TJiux0UQa1rSXkFn9LsCcQxTJEXEiA?=
 =?us-ascii?Q?WqN7RVPyqsB7zIzYY2QHU3womwf6TIpM1TdnrbL+MwW4yDgV07sUjpX3Ij1V?=
 =?us-ascii?Q?U3BrVjRWqi8SmJbil7gQzbYD6mGl3/BCTpMTBgTBarOu3Nw/9aQUSS5U3rTG?=
 =?us-ascii?Q?OcXH1gAbYfTejKXh98DKFRgv/v+qQV9RBINTX3sSQlKbanwlXtGTAtsX2RsJ?=
 =?us-ascii?Q?OqkQggKOP9SDRZL25UGFUSvzxG7CNAeKVTXsOmLVq/q63sZvx+JFaQZVIu8k?=
 =?us-ascii?Q?3A5Y1ei/Esc9g/drFtFZQqXcXghfdcwNnMR8iCecywOwNySUuVhxM0OCtkoE?=
 =?us-ascii?Q?E/jhrUtbhFfoAJ0dWVqGrcbfvocsMasJJO3utSP1eKwGEAhmBwZwlbUR9Jii?=
 =?us-ascii?Q?lobpDqOIlnqc5cnLjXFf4mnyuq1vPdjPUZmpMl0QuVg2apeRJy0MMNmL0Hs7?=
 =?us-ascii?Q?WjZ8YQQawzFzAn0wPhT80u0Oi7GkEYhrBAKO7/L1ZcyUDKk7rcYvdy0qn/Xa?=
 =?us-ascii?Q?dHb5XAoh+IFvQypGfDhfC8z+zKfo0ag1U5iwpRRKFys4QgFYgC0vsIYKGtRt?=
 =?us-ascii?Q?yR5XJJ1li3H1EVsDUDoK0r+rIoaHUVAWc0IJg8gpSMyBVR30ec1KYcFyZe1b?=
 =?us-ascii?Q?aLU0Xcui6RnyfBMvhrIxaRGNtJPoXtuYQ9gvUimk39fKB44U2B5nY39/crnO?=
 =?us-ascii?Q?MJHIAAiMJIdfQ/1lrDUJwjss2leAzTVAYu6/L7A7DR5ciiPFOfckZM35I861?=
 =?us-ascii?Q?8j9SniZ8BNqHf/yO8sTcoE+HuQqjtDvPHxbl6n1bKH3+FBmwzybFxzkdgDXa?=
 =?us-ascii?Q?cuSLgUD3wexQxc4hSrjE6g6zk8H5BEgWsebK309p8TRKpQoJBcm+1QB+GHDd?=
 =?us-ascii?Q?AbwDZLzABVrW3TKG1wWCpUyVaZtWPE6rfgG8Gq2mx7t81nQoMKutb5ya7y5/?=
 =?us-ascii?Q?/P+95OOVuqvOX8yHg/8br6D8kqF+0tg0TFad8AiR29OVrP19YOdoF9BKTxCi?=
 =?us-ascii?Q?ZXT33zQ7pCRAMAaH2A9k8F6u47DT7r6FLBHk2/pTqEJChJxYotmTS4AzwgWQ?=
 =?us-ascii?Q?Lr7zgg0938farZgFePV9pne+J+3VUwNrFX5MI7EY+txGHY3OgZ5r6a3tFoNC?=
 =?us-ascii?Q?yfVMlcwqd2TFXlEsGl4CPzojw1ltm+Yr4xs7xtKAu4F3mglQuO8dHuC0+n/f?=
 =?us-ascii?Q?Pzuj3YlVnGWd2bm7ygDFa1UC1csYfZu04IUfe6d32ZqGmK/y/sbiMklSEYzR?=
 =?us-ascii?Q?FC/QoCoXldEfmQM6F9SciQ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f87b4d-115c-4c58-64ba-08dc31b18132
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 01:16:02.7478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWHHQlxn2px78pSgjaEOKVG27BRHh847O3QuSpJR7wgPwB/k3n3j6cqNeAzNbVmbA24O+e7Tem180MhAt9k7KZqNAT5Iq1KqACdTVrbayHw9d0mDMRG2MuViCpdUBICW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10730
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
index 177b600895d3..b6b2cade69ae 100644
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
index 4618c892cdd6..e10e469aa7a6 100644
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
index 4f8f3172379e..8c29b719ea62 100644
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
2.25.1

