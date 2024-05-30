Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B98D4353
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538F310E2EC;
	Thu, 30 May 2024 02:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="NjzeO+tA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2053.outbound.protection.outlook.com [40.107.113.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25910E536
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJBO49e7IlkBWL9n4UX7VYDqaKUSXFnZ0ErHdSKR9dad6HRqkUdV505r4NaZcbAbvci5YvNLaTBL83XYc1rCvY3UUWDRqJ9PD8I2xnUW4eTymJTH5H1VOnAaL14YVxTeuk6GForeV7yblT2GTs5+XpRQ9upK3sa8BSI2CIJyqwOIuoV8NpFbLL66VxwJEtBmiLlxKKV2+gGmbRp4wH9nOQ9xnQn3vi0Yo9PkM5wKTdkzkxTd5F8JTwT47+lqI6UUGruydkpoYFh/OeQYI4z/DCxFNOlEtGwTnR8C6ov0IrRwgTH9lFxW4wBvSeCOoshvLwCfylROajuSW5SJsy0SVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=afdA4gJO/3Vw4z2aPBR6NBUBB9WkgNTYd/T3EbjF+ctF0U6objA+agfi3ujlCClxWfd7Yvrj+PANa4ZSNrkeSp4ED1Y5rM5W9oLhK6xZNlK04Ak1vjOfrkdF7GGFkmjM2q8lthud56N+n7RZSFPowUSFhMLYe80hs6/M0DE+joTzR648FrIKEPsLDL6DSds6qgMFRIF9l1/HM7nnXS6zo3CPyt5vx/OZwJlTdPaIBzI6uH6DVLcXJe/7FivTSnhyEVKuPz1fVqHxGgYUDwsI5KgT9vT8FKa5vojo2jw1rSkwpnJzhaheh9gCn1cIGCCjth4mxBQGsWaS89DqC3inog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=NjzeO+tAY/ObVZZ4vP6VjJ9l+uI+XSrYI5MPKaL5Hxw9J6ynsHNkv9xnnQW0ERdhfcyJBNXg8dskO5ION0x1C/xz2b3Ui53CjI++qX1bugxX3G79TnUCyRhvFBNH+vsISdr+TmhqW+RQQS0mpt7LrjfWbLBrhXMdO9nblLZt2cE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9900.jpnprd01.prod.outlook.com
 (2603:1096:400:223::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:05:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:05:33 +0000
Message-ID: <87jzjcoxzn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/9] gpu: drm: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 May 2024 02:05:33 +0000
X-ClientProxiedBy: TYCPR01CA0016.jpnprd01.prod.outlook.com (2603:1096:405::28)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c268af2-f4a3-4dc4-21bb-08dc804cfd46
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|52116005|1800799015|376005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/jwFiSwBXFKM6YrAscq4bRMKd0j+KLgZvyrAKn1su1Q4Nzc2amVmtZlx3DC+?=
 =?us-ascii?Q?LFXlBTrXZgDyHzv2jUlDB9rzYzlJtvwAXsZ/itqKaoriGzthFQymLCKedcd8?=
 =?us-ascii?Q?QSc2AzRzd59lGBhDX0J3NBYDTf6a841wuLYM+AIIFrhfvVNgaApvEjZxOM54?=
 =?us-ascii?Q?GOYEYRhUgeMU+KRuywutiNJzZazK6ZMv7UCPwU2TaeRmzn/XK4NXYxPlRQ+c?=
 =?us-ascii?Q?G7Caipaa4jkAs0FcxFO6vwlkux4LWNBNtemIwXrR4Ty/w+ILmLO0xj0AU7ve?=
 =?us-ascii?Q?GQJpPO/MfCP8fu/mHX4QLmlC95tlK91lEDFGy81xdKuTSQEdlsxvBGFhT2oH?=
 =?us-ascii?Q?xZdO1bAx3y3IS4B3o34KQjkzfRKWmLH80iv8aimmnwxSWWaPTuiRVhNtYn8T?=
 =?us-ascii?Q?/LjvX5K5xkqliCQ+W8dA6G3DheODDFxvHLWYrZANc4T8Y+MCqRroY96+Z6c8?=
 =?us-ascii?Q?HodMT4bOiRNIkedmm3TiyTTd5EBqNw9guWEAPM+uaBrps+aU6QQPspzX5Lgj?=
 =?us-ascii?Q?29HewB/CKUs45mp8jaG/X0yLwPRDI3onGR52UvpQyvsgXZRcpEKbsiXYn2ht?=
 =?us-ascii?Q?s5dfWQhlKB+jjevBPCDHTcnnf6gS3WUI/5axcmmCXaQUrRs+jR2YmDn8CA2Z?=
 =?us-ascii?Q?SPP/XNtXOtGT9v7eNjIz3eW0DQXdaF5gmv6ip0QDAaqx5y5TA7Ss6h5fvs0T?=
 =?us-ascii?Q?UJFUjgYL+5JvA3s8Bar6m6GRWhw1TRvmrRgUiOj5lWZunHmIq0vEiawL3If5?=
 =?us-ascii?Q?DuCXx2RhVyk/yINtqtATLZwUXCaBnL6jdHRf1oQGdFODPQx4ZUr52q97q9Hs?=
 =?us-ascii?Q?GTA5mKj5Cf9ZdEbShullYZZj4CZMBbHT10Ndc2gVlvWwTzHcNuwVGrNA4B4v?=
 =?us-ascii?Q?tsQoeHE85YYxWQOgiqfQVOHbTB6HeXVeOL7c8G5W0oGSiu4VSSoKB7fR/tuM?=
 =?us-ascii?Q?pMzbtcHBJThih2nJB40bD9+QHjtSYWlq95TFgY+VsDm+g1fQEYt6SkrZbE/K?=
 =?us-ascii?Q?pyCWucq8qHbl5k9ZwvBJKySxzwpLwWK1CSq1Gmy82+MSgweqjgZd/bJedBpA?=
 =?us-ascii?Q?zGfWo7UBgBmRIFKACMk7p+mPvDomeXzKiky2UQL/dOLNXVgrs6PfTZWagTsq?=
 =?us-ascii?Q?hENdR+WZx97XqyyHZpQgSLZvTFAV7G7OeaKqlLuphquB1wnhsblug6F0RNnk?=
 =?us-ascii?Q?0Cmsf6k4LdrnWsvniERoWMirTArSpeGwCpA08HjDNDGLZ4es31fwT3nkUhHT?=
 =?us-ascii?Q?MdWzA32KJGiFEvpk82sNc/BX6XG3oxLBXElzLn/hSJgvSKBzcVvS6gsR2srz?=
 =?us-ascii?Q?HkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2MdVKXqJ4/9DVGGuwCKdDYUDhxoJVaEEBy50o0Z2bRNbgUDrHLCpAfeFuss3?=
 =?us-ascii?Q?D/Z/nniFyAWym0d7+CfktN9l5zrmkzAVaCAKKNMxJbYe5pVPxx4dXY+AlHz/?=
 =?us-ascii?Q?cUKfr5lXj59aTekpJIvSee7b0vgevaNnxSXnU5KqlHMG4v1PQRtvTfPuJqH+?=
 =?us-ascii?Q?99z/yUG7GMMWGMOpgIzzr4cwDAPjKL2m+22u06zJq9kPXffnUnjXQtDhNrn1?=
 =?us-ascii?Q?c7hbO3F7DJkJWImXxgHY9nJyPe1xZkEYVjG1QvSXHi5vqXMJDE9zL7Y9cE1l?=
 =?us-ascii?Q?0NOYt+fl+/opIod0RhXA8dxHYJo+KdNW6vMEE9GVhtSyXS+0v9po8b8RaHY4?=
 =?us-ascii?Q?ca9CIfEr6p7lJ7OSNLEubVSo4CecD8Zsxf7DhVyCsGsiiE6cWmlQtZZVPPHl?=
 =?us-ascii?Q?BCMaayzUy4Zrc5myXXrDihASSEPM43MatpnDqpxfRQawdUFv+m3TAzQh8KhT?=
 =?us-ascii?Q?Nw3JHrRTpdXagzmZRMJSFKvD5VP/NxHGx3H75UY173/UfCoeGCfJ8YJYCRVX?=
 =?us-ascii?Q?0P3XWZ6+jA9+aw2tqOWKvv5boNSH4ga6FnRCr8ElMCQ1hxbgPZDM0VGwrqpD?=
 =?us-ascii?Q?wehhuKMD2qgdnRyeyVUSMHTYfMhbwWzaG6gZxKsKoWQAAgkr6vwEJi+xDUH6?=
 =?us-ascii?Q?euNJvva0Cl5VXgmzf2Lh0eh5jEmXKACGybg4rXtVaq9Aar4e6Mi0+oboWAyZ?=
 =?us-ascii?Q?TGRbvURKQqdmhIMlaDe15CwgYKmxkHkEyLcTomvGd7Al+Gj2NWLajcMC2hwz?=
 =?us-ascii?Q?eptmsHCG6F92Du8G+Zyxkypfg20d2mFup81UxEPlw67BCeomqbny2BMewxGr?=
 =?us-ascii?Q?lFXSvdLgkrKg/q1l88vTUBhzNgcUivLndVeby9iR2V9D7AjEMBE5vh9THcmw?=
 =?us-ascii?Q?gvXr16+mQyGN3PYXVEUw76PXRFIgkUBQx1Fqq54vNT7wmve6WZ/fdZE/yf9g?=
 =?us-ascii?Q?xZBAg7FZz7K+coR4INdAPj92Mv2jx8/nm1ly7hgGtK2tVjVNyWATQ0QcQ6LO?=
 =?us-ascii?Q?QEj3SQR1IsEIalDbGhtrIeI/E/fu925qTTQiUd7DegQX0pR7vmhUiURiuR6a?=
 =?us-ascii?Q?ojckrqdZl+i1oV36TCKT7JtW0RcwMohqqxsoy6re06ULZhQeIyjI36bomXDb?=
 =?us-ascii?Q?i+yGjE11yv5yDFvbRa/cPSJGIUDgCt1fFqQ84a6d74dOzWiGd9e5A61p5qyG?=
 =?us-ascii?Q?GPaWBKzzJ9RlmTcrXGWElcB+ZXRzqA3jlD5l2xCu9L8AFbp/7a0HThF/sicS?=
 =?us-ascii?Q?p1abVpkm2tmyG6anlTxffd+d+rk2WVdq23IUk5Xo+LQZXS941raK/z6RVqGR?=
 =?us-ascii?Q?l99g8Ww1ICzXD4gu6EyMk2RP7LHXj9keKe57jWavMxn6gS50IiV9e390GGqu?=
 =?us-ascii?Q?azDh7MyngGRZAlc/pdmtYqj1+7+cd8WthXHcjBK7209c+ny2o1YJvB1TGpsb?=
 =?us-ascii?Q?Hlzz0C9umOUVyQmkad9F1DrBs4wrOIUDjByzyShmJeXhNsAvTJozo/XLi/Ke?=
 =?us-ascii?Q?O8ga+LyVElg2Qg3k53vXwHlNxXkYESS21v8hX4KwBQ7XV5EJCKZBfN8SREUM?=
 =?us-ascii?Q?/8/AA1zFMCZYKjRNlH/aFTm22mfPWaN8Wx3LHFVutQHvXGZleMTeGDAhW7fT?=
 =?us-ascii?Q?UfckDnnuF/Y+Deb6iKH0zpg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c268af2-f4a3-4dc4-21bb-08dc804cfd46
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:05:33.6044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyrpirYUjuCAIwySfnRCdgbi6N1ptRGNHABvldiUvulFl2ebYLoypSxZBTf4ZwoQe2453Brg0WEXkcspWSbc4YXBumBtivWlJGN5ieCLDxAhbgGGtonFezSjFFF7Haxn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9900
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

