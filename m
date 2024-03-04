Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F036B86F976
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 06:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5B610FC6F;
	Mon,  4 Mar 2024 05:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="GpgFSVBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072.outbound.protection.outlook.com [40.107.113.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2F210FC6E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 05:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUuQFx+d9dsn1xbMfkGPeP3zqDXn6+gJF5MNdanwjp43BtBRebtTJrR3T3m4SdRttZna9TqocCcIxe4eKghJPduwzYzhD4JYekPeRVr3BY1Kn5wP2GprHw0UyrNLIHMujl2zHkNqZG6WIqnM4B75EezzP8rbw/NcBGQ/wJyuwrZZF7w+vwkuqhVRdIl199Wdg4ayKTAvaqRbLeL17MEISpOrUVI1TPC+d3ubx9ffQ3Ojy+u+Inoxp5GIPPl9InBFvHwBAgNc/D4Ub3ypn7axRL1+Xff3Nrt6DVpweiAukv1pPT6agSfPe/knDyW8WZ+41DTTwjZllq9zMP620mGLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=Az2wD6v576Ct5UYpDvDQMaW7Z2X9kaUZhppFYrgk5TUHRUDPme5ozMbeBMcHEC0fgepdKWy7bxyQN4LoyeVokTZeV3Sau78fBVBLw9jSRIyGypLPDjxQx4ntnNH/ZZhwxqjPF5vbLP6+vH0SnTrJcYfXWxBvayPiB17w8G76Katd0Bx7ONQ8KoYX/SeT7vA+0lqCEDtdUa1knwbsa8LWmpAQanCvs6dZQsL0CdsD7lIA7cYsBmdsw8gAzyhj1+2MxYJ6rXLM46ASIFRApJlsXLJy5Dew7Or0auyaaAHUc1nYBhof3tr8yKxknrAuHTBgMmCxVABd6DgBG6i0kEv2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=GpgFSVBAPRajKFu9zDNUK/5G+4GqfBUuIgwYWMfSO7I8GiJnQoabbXhC103EBZMtuXrJNLTF0TwQsEAdE+IlYOFc/aedkIN3/4s9/kIpI8AhgoJHTju8sp2vEXBZwEfGF44TqJHZdsa2Fnl87+GM9bGlFVcvppCEExhQ/qWjrE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6616.jpnprd01.prod.outlook.com
 (2603:1096:604:fe::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 05:15:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 05:15:47 +0000
Message-ID: <87o7buh919.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87plwah92n.wl-kuninori.morimoto.gx@renesas.com>
References: <87plwah92n.wl-kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, "Lad Prabhakar"
 <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Eugen
 Hristev <eugen.hristev@collabora.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] gpu: drm: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Mar 2024 05:15:46 +0000
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: a0306d5b-1051-422c-a1a3-08dc3c0a2660
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gelbs0U0e8n5M7glvrCs7WP8seUmE2yyuSeXKy4fzdnsOsMrvLOaLEWar/RpRSkAE879y9VpvK3J3mdgb2h41tljsdaC0tSq5xHq8u/ZsJQIILaJoIsqAoq86Jyn2AUyFJ3gQLeQ2PB30iuwbbSceUkwc5b7mD6X+8SwnNXklX+bAng62m5dk7aA649+6JveMh/5qDtTrrTgWpXwpHvAG9PL30kUM7y99QYEuflBDqySAu1kQSbsPBBJgJydLtX3KxCrfMSCQqy+71d/MA/H51/xqfGYJm4rKqX1HX/p+nYsZE5HhtF3YFSzsxhEhLA4I12tt8eIuJl0Dg5KxFfDuQ3g2uav2ud8bZogsYiELxW+dA7lwwNLV/83z4pO8YR9qDOELA9yw+472Vjg1n1Ms6m2J4vfuVaukZDmV35Bk0lU1VaBMqhUXpzHqf9SalaY4hBOfoZOGO00w+AoCx78PIjDEEb+O5tV/V9Tus2nkaO2aOH+UUOu62rFa6DYPYlW81CHoq4wdpOfwUmVR+VsaCuTrxOHFIhFpW7W/AXUQ176fB+JIeDMHW5wgVlnzCdJ0fsIZiGuLuFfKbgdxmrac107T0puigid/GLlN5nvT5dQDogF0E3oPU5Pf1eOY5+RCloW7FkjxVcP9U6ZK29midoHcYupkELKe4/skJLYvLzEGXsMEtgaq74JOSy5JKNa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WonskMxYEqfGDHPcO/oyG4jSCVcAtaLFl5gull6P6urDc/vI/U3xNqWtiCJH?=
 =?us-ascii?Q?Z1Nj+dMnvhK3r4OSABRx9YFswp+4dbFFobgeCTFHgOEFq5igxW64aj1pQYRl?=
 =?us-ascii?Q?qkLtQIaQBje8s8dVzIX2ymrTjKAFrhTla9jTAlPoNwc2MtG+e8MMMyfgXNzt?=
 =?us-ascii?Q?BPYjKr7fyeFLvLwH62CmfBlk6wahdFwaPCIh8Y4OeXLBfDwe1rDN3SgIlicm?=
 =?us-ascii?Q?+xpHu0OsdeL+++qvQ23LsL2/OtOnbhKpD+M5ZwYzKphMwIU0KdhXbUbwMZSn?=
 =?us-ascii?Q?B3rdh5eyUsx2m2VKCVyV2DeliT6DBKeDEBQCAAKUGIcq447usT+wjLM5cL3+?=
 =?us-ascii?Q?FmrFMIe2o4WfL4tTOEQ3gMsV8hjjkZQly/nrCwF8g7r5Rj90PH6OnT364EfI?=
 =?us-ascii?Q?v4HTz+PAT282m5l4QS/E6Dm8uGylMvhG0AkjT9p5qBq+iTOsAOoNnZ8uK1wm?=
 =?us-ascii?Q?sDKHfygVcxJi/JyPXvgvxqvgZEVfxraZoUwbD3d9G/8ATfze2Kyo0pFgmh3U?=
 =?us-ascii?Q?7kitMWcy1+jn13bu7AXWgnBvxd3myA94tDRrFGcNDb1xwoySdBUnc3cjycpE?=
 =?us-ascii?Q?DgjMMnL3/jPTHoj7zY5+jFFL4r+T5Bgo0CpDIeZC2T5tvBxIqo+8aZbl4vWd?=
 =?us-ascii?Q?RRO0Qk/tglixtZz4O6rK58u/DGZbsjoV27f+J3ZEjfvqpVNpXDJmZq0Vk9kK?=
 =?us-ascii?Q?DpYs/A6plZoBxZQaFiFWkSRG54t/rwF4i7RdAhtGo21A0hXxsN59X6xP6LxB?=
 =?us-ascii?Q?nIMNTH+nuAIO62z3uM1MESkm4ErYZARMuvJzp3AzBwfSV5P4UcT/R3XBJTLk?=
 =?us-ascii?Q?Bgd5JVfhJWg8WuuFd6DEAAJ/O92BHBvr9D7oCVkf0CYI9ywwFLVTUs8uKHEK?=
 =?us-ascii?Q?kbxM0Tm3Kz1Xv1AGKWGV6ZCcQxEE7/KKtO/fkr98bprjNHtz+YNMNq3cYwoD?=
 =?us-ascii?Q?aMGSec+VlXD1v63KT7IA53AMkPfwIGMItrjJILucTq3HV6eEI9eCIGoVXlXw?=
 =?us-ascii?Q?rOoA4BaIZZdTL+v/RhKTo5n1wA8WDdRyA9H61nWIB2vsWDAGjLDdv3MtkFBF?=
 =?us-ascii?Q?choUE/WoDwSl2rhhCyokLr0SNMBGYzwtZp9uXrPyOOcgNRhBx+EW8BpdJy9C?=
 =?us-ascii?Q?HcUkwgUwEYXgpVsxCcoTTQ4A09qg9ZM2gNs3Q+a5jPgWXHoSE4cpcf2Z9Gbc?=
 =?us-ascii?Q?qgCJ45ESUzmc5SJC7APB6ZLjN637aqofjNk21M3lhkzcpQ/gXSA+sLHR2ueo?=
 =?us-ascii?Q?lJUENHRzHO6zYlW84YXbD/Vti9LCLgCL9gXzABaP6GPb10GY6W+qE85LY/Rg?=
 =?us-ascii?Q?mKH8cxUcsnIwg6W85mHlcLvtq3aOTSeagdInhRMPHMxqXVZzTT+P63rXbXLE?=
 =?us-ascii?Q?UD6OXVFn9f3Zc5MOzIIOuVwLurTk9PAWmbfydRsXYfLYFQYMqepI+PY0yZxj?=
 =?us-ascii?Q?uT3U5qChpPd2Mp9opd/0Y+e+41PNDJ+V65lA3SU3ZEm1wyl6F7WojoVKCzoJ?=
 =?us-ascii?Q?A2LKigPykaJk09eSXRba7RkFXvkyj+mMLjXye4AxgrP4tQEegeolbCSoUV5x?=
 =?us-ascii?Q?nfLiX9B+EG4QN6BlXglY8WI6wVrIgqoO2SRAiWA4GkcQQhH4+qByIbUM7eyk?=
 =?us-ascii?Q?QyRDqslF2qBZIaFAFxeZUYo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0306d5b-1051-422c-a1a3-08dc3c0a2660
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 05:15:47.2389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xr/UyTOcksQEwMT+pvwMtyOLy9rbICTLFfNj5KW7fdqoJI2T/W2bxTD6V1aWLECOBSB2kyNwQucPVgmjrUbmgVaUSnIBN5jqlx1/K353r7btrIHoTf/Yl7SIaS70vgIL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6616
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

