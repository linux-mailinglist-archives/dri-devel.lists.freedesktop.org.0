Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271C9AD9B7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0012D10E891;
	Thu, 24 Oct 2024 02:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="P8QmYbBh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763B510E891
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 02:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9sa5cp0bwfaAfvxolP4gnKMiy+LDdyH7vMzXelJIAmPn88iIQz+JV4BQ21mhTotH5Vtyf4L5vAjKK+eQ06Pmq5vycswIcxKX8Cl70Q6xXMnKyePAuVhaqowyLltsvNViVrA5AMoBseNpJMC7mkGscRyZx1kryFZfC+JIUNAQCPJ5lKtaT4b5RxpRMXGSka3dvTTucEzBPGtsD9QwqIAtWoeKqIxcK/MmqWL+/D6qiiXxF1dBS3ofPkCD/jMzPEX7wHzkAcRlw0m32NSL0FhvQCn/M2LfEWcPZS4BNely/QfTQLbTSPllRWmJ0lBPkXFCUgrDrGINW9sADXNgGBuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ix/Ro7yTftdZQYwbQYMchwMoBW7NvuI0ER9wRiSIbMU=;
 b=hBgH8y53YHoTdZkzfaWC6WojnDj4rWI5N0ibJlerMLZpnhzdSgnUmuTX/0I2/LXcVpSRX0QGQJPixWiYKE/vcz7HWNtKVD7LYhZ3wxLVV9WaK9BFS0Fau6zCKlNANBLa/OUakNLQ5h3Hhtth14PXsSBKTvw7JW+uTFtVVEwnNz0C5OTdnl8rm9++0e2xLhHkMADRsS2TkLJwMRL2UHeZnlve38XOOCg5fg0Ee8Hxdx/w4wH+8pMj2cWcbc5YCCpc1pz74GGoZr32fxsKzqNxARetKWNnQ5owyd3DNV3y/AHZsEE/eq6hdvbdppU6DujGLDqWXBAaHk6pYQyQSoXGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix/Ro7yTftdZQYwbQYMchwMoBW7NvuI0ER9wRiSIbMU=;
 b=P8QmYbBhNgieexoJAInY9jXbd03WywGtCzYftZ9L+3mZKJayaiJFTZ6ukIh5AhoqMGqcLUnQK8tsp7pkGyMQZkRi7/hW/pHceZMC0Fj/KQzj2HheZc2spWp7YgbMX+Lq3vrQk8tNtySKQUMz7YAhpE2Q1MqBCeVvfh82yLpjHK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8629.jpnprd01.prod.outlook.com
 (2603:1096:604:187::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 02:20:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:20:40 +0000
Message-ID: <87a5eub5s8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 9/9] media: xilinx-tpg: use new of_graph functions
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
Date: Thu, 24 Oct 2024 02:20:39 +0000
X-ClientProxiedBy: TYCP286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: a9231d26-303c-47ef-ef37-08dcf3d27440
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wvrs2Sn9nhkM6joYAPxQUi2yVUmrXnkksOcXfhhm5TdJegNB+xqR9eozQY9c?=
 =?us-ascii?Q?LPpGGMQcvSnGasRqqdFOUtbqnhwHK1K1esmQ6UxTFdMeoRRNYdS6MhF3NvtO?=
 =?us-ascii?Q?7iFV8ZuJGo5qQ8oAxJz98VjQQAQG9wVR5EwaoUWEmgMtYBPyT2+WHm65aEIF?=
 =?us-ascii?Q?lmP8ZVAeIA17JgQnlvUkc9ZeRbetA1H362DcXXR94Gu4Ts0j8XT5gwgXdOkb?=
 =?us-ascii?Q?TDva9x+S3+HBEj00x5gfvlUV3bb8VelNiDdi0HlGz1uUQ6aQqMRPGhmNGzuX?=
 =?us-ascii?Q?eVaNjwJcdxoU94agigzflblnqw0IW9qfUaihRSJ+H//+w3l4kIXEJIN1GpIZ?=
 =?us-ascii?Q?rgmRxiG4ptSPsZHyJAAgB9E+h2dtf0oVZTQeeTbxGABwtLqUE1UZKO0lsrWy?=
 =?us-ascii?Q?AHl4LznsxMJuMjwN90mqh5pm7BI1Mkvc885ur11m5yjYU2V5d87Ay8XQJGlR?=
 =?us-ascii?Q?D0sktX83eQmQI7Z/3ra1Mb59oXGrLM8d+C5CgMdnDoX2eS2+qGauW+yMmRZO?=
 =?us-ascii?Q?zAVJl5UWTgyZBLGniD8XpP++EhEUJaafJntUxX4yZ1joVnUyhlG1PrVoWj1q?=
 =?us-ascii?Q?NPysph9hMW+IVfg6Q+IBv1KJsUe394sC36RQbY3/aOfsgESMeMVS8tMF5o0U?=
 =?us-ascii?Q?QIl95h2HpeDidCtQbfjc5SPJhOSjs4hIaorpvuIFWOXPDYYiAkL7peVEU13j?=
 =?us-ascii?Q?Xe1QYTXcmhSjM7AxG7naoOD3u42Z/VweT5c3AiFF8FXsoJd/QDuy//brfpm6?=
 =?us-ascii?Q?CFrH3qz0Xu1XM7mLOvjYC3myiAoQRnFOHvCAWjBbKKe90h3fuj6bXARnPWIC?=
 =?us-ascii?Q?M7nWuleCP6ZLvDpzvkt5KiN60QbYfS9fAqHr/jQHckEibM3wQ8i35YpSU6MM?=
 =?us-ascii?Q?N14I9iP7UsUI286BwKTeXNj6Xf/yyUcdqyoY+smyaasJa1/H4P4lNl0NCb2Z?=
 =?us-ascii?Q?XBN58gxc3+4F2nHHVlafGruedfygPN9QdaexXASoBdM1BKghoBJO/clbAMB2?=
 =?us-ascii?Q?3ZQSbs0SbkSQCuqF/BXhTgkfrwD7N2VNvA5IFPiHZ2k02GnGYKE7QPxHKZE3?=
 =?us-ascii?Q?KOD9V8zgqI12z8cMkwZm1MW4z1qGbkVI9UXC6VJtIzadyo7nYbYmPw0M68KR?=
 =?us-ascii?Q?jyvUUwrusmYN3Q/RKzCK4qBrRgmFL1KfFOKcA0gS+HiyJDV8griCUSfAyJGV?=
 =?us-ascii?Q?0d/2WGP2s39em16FZ8rbdP9tG9As0APBJSqyMiM0Gu0OcHPZsboZku4l/vg1?=
 =?us-ascii?Q?uhB1C8SYeuYUoqQ40P1JfXVvpLEhfsHqMS4XFwbQSbJ5046YrsoqlyfQynXi?=
 =?us-ascii?Q?Bi8IEWYhwKJZUg2eSwJq6TqJFElVUiNN2tuY/3jHI5ibhBBr4LEBiVpx3DB2?=
 =?us-ascii?Q?IYJI2PMcHyeap1DZ8C4VqM7DMnnl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A6odIuqUGTjhbUP5/bHkIO6w1l9AWhUzll7rdwpZuyNYF7jSKTzS0qyOk9E2?=
 =?us-ascii?Q?uH6AzdxexAesBcMkbEl3m+FpTgrdZvnkq4IDTqtbTUH1wKPun9h1HwQOjywe?=
 =?us-ascii?Q?FYzerae8O30T2ZvZrI4a0LdhVVSxMvEshs8L0efDQK0zOY7Pm8amxTnVuks2?=
 =?us-ascii?Q?Xko4eocpwte3JZexaCme36BNh35Qlgq5y3B0s3Bfscsrp9+6pWC8PtNWj5TT?=
 =?us-ascii?Q?Mq5rrxj6IfIxS+TifFlhDWgU61RidWjFr1RMLlXJrIqR7Ys6log4cAmvbYyr?=
 =?us-ascii?Q?eIIeupUJ3YBUyXVesPBq2YBL4FigPbWErMtzajs1jwJwg6fzoMbSsxaaTnUJ?=
 =?us-ascii?Q?mjtrdyiM/ixtWn6dRU4YRZzzLOfHjigAsXvMTmH9YAkH4cgXn4cQkQp+4R+H?=
 =?us-ascii?Q?fS3J0/i/gPa2MOcZzYG0qbveakrNNt7/ElxXezIxUKD0uhzLhAzU8MKiwtnL?=
 =?us-ascii?Q?WUyIwkIQQ93TDWWmqcoTXMietkX9nRcFaIyYg8O26mfvSA0NePzk6jQWy9Bb?=
 =?us-ascii?Q?OKXz+KDowQJZF/1v6A0ZV2aYepGiQn5M/JvwXEkuLGGaF5NQNymLbc5uwbaV?=
 =?us-ascii?Q?EY+ugQTE3IPCArIxiCu2oyA5qdWZHQb5/e5Uyn5WtoJy2O01JVICyRjQVS7G?=
 =?us-ascii?Q?Vzn4NK67CdHm73IK7QmoQhrMZPBXJlu+4TcuXlhPSxH4pLnZpk1EmBnXTrjD?=
 =?us-ascii?Q?7mzsZC4Ks3GjP0qr5wfbggegRLSe5opinrHuuGLjz9TRcmqylGo5e59jZ7Cl?=
 =?us-ascii?Q?iHXDE6gBYzaTOnYNFcy12n6/hLczVFb3O8IfOyqW2CPPVW9WiIU8pw5DOqGi?=
 =?us-ascii?Q?jtM6tzgCoBCrlgUanAv1bdhyvCnxU1ZRCmjSUpirI2QxJMTXHFkoJ6hl+u5Y?=
 =?us-ascii?Q?TZZeFpntG/fZseEzaxK8m1atzbtT3yaFEO4zcu+JTXZquJuGPuYTIx1Pd5gi?=
 =?us-ascii?Q?MO0xTKJUBJ0Y7h3e1TbHeiuwNCICSzvcI9Nog+QueVt4SBg8U4/Y3r4bfpvS?=
 =?us-ascii?Q?sP8RuPnNkA2GH4qiGZKobUnpB4rp/n8jaTd2GBuCNnYQIGhlPtkGbngEWr43?=
 =?us-ascii?Q?0yZqVtkJufmuT3W/l0o/1ThKy9dHkhuOdFGuqibB27ZzKAe2wLil9oomvXEy?=
 =?us-ascii?Q?O6sFbQH7/Kr0LRbnQopFLWr0HrAAqcX36lBnibSeL1aPIiGnruhdN8canP8B?=
 =?us-ascii?Q?idUFjpybxfG/rC5XSnkEl7+SXTdTAyUHyQ2bCSCcNwj9dp4aOMW4uuJLliVd?=
 =?us-ascii?Q?Tyf/6DKRnRbjRVIQdV7C5mk4eVMTYz6G7jUBFw2vrGLCIhbHe1rR7EPub8Hv?=
 =?us-ascii?Q?Sk4puNWrpUA9bf0u1bIfjVhriLZ+fJCoqCnU43oOPWNBKmsOZFk6/RW0dDCp?=
 =?us-ascii?Q?eBbW+ukABi2NknBQU8O37q8zPU2171RfOsSzlcZIWW8I1/FXIiRro8xpLnA6?=
 =?us-ascii?Q?6CwQ8+snEetczQAL0df5YhSc/BG7h02QYjDU3cVTaE1ZEEZeQ3vpvWuGO4yM?=
 =?us-ascii?Q?orcHwIMubdwMaDE/3PJXiqyJZktmrwBvOg1Yjgt+3ERBlHqqEJhmcnO176DF?=
 =?us-ascii?Q?bJWSslaoahO3nGYc55eZe2c9tSH7RF/NrOyia4pjLpkN9XKGGdTdB2iR2xRY?=
 =?us-ascii?Q?86UdyI20gjhH7XOygLnj6PI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9231d26-303c-47ef-ef37-08dcf3d27440
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:20:40.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maPpq1MdI7EQoNERAFm+iSK64pIZuFiqTS0j3Xe3xo7VDkZUZIoAi7++gtaYwMY2Yyv2qGDMdCWDJsieu5uWN3lX/X82EmtHAuMls9uvxS02ek6mvFnnQrC0L7gNv+i/
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f7..1d67f576a44ff 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/xilinx-v4l2-controls.h>
 
@@ -711,22 +712,13 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 {
 	struct device *dev = xtpg->xvip.dev;
 	struct device_node *node = xtpg->xvip.dev->of_node;
-	struct device_node *ports;
-	struct device_node *port;
 	unsigned int nports = 0;
 	bool has_endpoint = false;
 
-	ports = of_get_child_by_name(node, "ports");
-	if (ports == NULL)
-		ports = node;
-
-	for_each_child_of_node(ports, port) {
+	for_each_of_graph_port(node, port) {
 		const struct xvip_video_format *format;
 		struct device_node *endpoint;
 
-		if (!of_node_name_eq(port, "port"))
-			continue;
-
 		format = xvip_of_get_format(port);
 		if (IS_ERR(format)) {
 			dev_err(dev, "invalid format in DT");
@@ -744,7 +736,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_port_endpoint(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.43.0

