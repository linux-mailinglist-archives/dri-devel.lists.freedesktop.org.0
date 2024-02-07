Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DE84C3AC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 05:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5221130F3;
	Wed,  7 Feb 2024 04:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="kyVKQIts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2051.outbound.protection.outlook.com [40.107.114.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5036D1130F3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 04:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwHZiluTKPlR30ufTxZ3y4ZlZT+bJNaLneIzlnZfmbVX96M34KJ1V9bx50nTEgokgi1OUGfbwfopQWGX4ojpOs8BSG6xG5Nca1fWH1Zv7wbakPFzTFAsiXqUPhabSjI1g5zU5tSQa+1B0I3XTK1Xqj7DsVmST/sPWKYSanyrigCfm+ujgSEWyz1VGEAa766zByluQC7RpzPFEa9GIOEwgvp2wASXGcqxbiH8Yq+FBD2pqOaK0nfdwQN33czj/69AQuNuWpbdQUGYjIcXt3C/kw9ByVhdKD9Q6KxmYrlm9BbekTqLfYa/8F0ebqB9b/brh1uvR/93vodbA4iufH0Axg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=WtbYeSlYl593obudeAV+mY3Qsfuj5mxjtWnQxiYl6jdNsNgUcJ8IRdAZ2cKGtpCb2pTjdBzho6wjqKWGIG7Ex5tyzN3vZlT4S8ho3Th2v5vI1kxMtgB8gxFysb92/RsVltVMi7wIWOm1FZEqrvbP91FVH1Ytg3y7ZVN/xw6C6627DOQJOuboczqagsT+zFN2K9XuBnoP68UWeEcmV3xZH8+sinAMeoskoBXDMFGj0rpOUsM5zuecWfmgozExqmb3bRYNLwhmuOvnsvvezSTK8fshazgpXhfuvC7pwsTmlKg4SbaJ9Bilhj61LWyxccmcn2eDoNyuwfDEo3797gDufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+nNdu9cruwklfWfBXe1iTRh4EtTiIw5DoO94oGqHpw=;
 b=kyVKQIts+pS3q6faHWO/OSuFFhdCFoHbfAP2bfZpYhOS2lTPnTfmYKSn9ELOCchJo375+EWAE5lUYPu0GZt0QvV/huBPO9uYlXY61/SuM9kD/fqu+sWe+QLbv6CoVdTeot6NzboduLf58p6YRJRfqsz9/7+64uZN9SaDh1R9x6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB8022.jpnprd01.prod.outlook.com
 (2603:1096:400:f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 04:38:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 04:38:50 +0000
Message-ID: <87plx8sxb9.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
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
In-Reply-To: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Feb 2024 04:38:50 +0000
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 460a88e7-694d-4820-8bc2-08dc2796ae82
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LQLe1uNFLStLnUzu4CqOCrlC9cVaHW4535Y9a2Gm9D8ME/FxuxMzopSh+25NQD5nnjIgwHh/X+Ek1P40GNMiLPuHbrjE2daBqHpYb+8Q+MAmUsuQK9SJVffdeSBE9B3WERXRHfSklXYnjOJxzxz2iRsxGswJpiWkT5R7Xd4ftxv9x092rUwt9e0Y63D1019D07Ox5ZUof9SDfw1PfJ3ntG83jLpoxGAdlKFInMsxS4maXaOkr26nAi8zuySoSLD9boq88WCfPZqjdHGbkZC3g9IStSt90EU3Uw20eJvFWU0WoQCeWHhoQXCPAv5b3FPsnrQA1ntByu/jRAE2iJXrEcxhvNFYk5kfZ21KT6WYK3CtfU0GWsVoXBQRjG7f+lIaFnzecsrHJ33yUYyy6GGY8Q/qNfx1pViznVcJFzwWV5zJLAFeK3GiYoO6WD1VxVd7NjNq6vxsDpnd0itPYiaCkbFrOqed/pkYlqq4HvkxieJLMU6BOc0UfQjCND0RpLihmI/QO0PE0ZeWscDjkKf9pdP+5m2XDeljY51uT5VM1ypy1MzsOngl0ajfTRGv6m6xHoLa/c5TYtmi0upF26LtWbqy4oeB4h0dwz6JSRZBbc9UsYrmZ4iFEHG63dt2UjB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6512007)(6486002)(41300700001)(66946007)(66556008)(66476007)(38350700005)(316002)(26005)(8676002)(8936002)(86362001)(6506007)(83380400001)(2616005)(52116002)(110136005)(36756003)(478600001)(966005)(7416002)(2906002)(5660300002)(921011)(7406005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7msiqIiTbc1qN9Y6cUIOz1hK8UzTUdPLCMTusGC5shIQtFisZwuE6uX3G9d?=
 =?us-ascii?Q?f/iY6QgZFk8O0og56yNwfVmbe+DjOzcotY0BV7W3BeTdyJWRDRLgd9DAD4+p?=
 =?us-ascii?Q?IYpqwqxlwPgI0PggWZIHDM7mB9Fb1WylQMtzkN4tp6pZ8Nl2TPQCQAs62yMz?=
 =?us-ascii?Q?MzaPJxOVW25RzQElkY+8x2nPf89Un1COcWRIfpyAsx6wg5FK3g0Rxzliewqb?=
 =?us-ascii?Q?zMTpBnSXvhe6vf1+M5w6PyOfAKko29Q7x5NLbVF1x3D92bCsmKaIGdS8Gbf3?=
 =?us-ascii?Q?KPDCHWSJnkcwLO2RU8+t/snc8oBBYBCx5+PUzMkz8TZlyd4tFjIwnUkYYHkE?=
 =?us-ascii?Q?2pKD5bXxiVR15kCZDKlvr9xKuHeLtAGtN59ecawhyK5Iw4Ho7q0e8Tirlwxv?=
 =?us-ascii?Q?MiOZOD1dK2DYhRG+5qNyCB4sk8H89yDzjMex0hYW4eGtGP1kNB6MsPw9VeEO?=
 =?us-ascii?Q?jivOiQwNCEi1IM+hMdcNFi66zG1CyejdcOKur3gmHXkJmn2ERchky8AtgUHw?=
 =?us-ascii?Q?R4SZK8/RP0NJWcPnSNP3MC0UGqFRwJCtsL5cvard0wHsYf5wRhGv4BsrCr0o?=
 =?us-ascii?Q?V+cKmIkImgiTeZmdGDLDF6aiMxIPXUmYccv0CeJqTC/bQeqEIbbKwkgX7Rsw?=
 =?us-ascii?Q?fYN7nlP3HsUGcEOT+eKaXSSkbWnFIA5lTIcscnHenwBJWArcBb/wiBmGkUk9?=
 =?us-ascii?Q?sxVgAAdEFdbwbsQm/yoNUMaeFRtYCO36G5WpXak2f28ML3CIV03SNheFFhEq?=
 =?us-ascii?Q?vcfwxBosFWhWtjkN2+55XQ8WqsbEdfPTF02MRCg7r9P0bTAPEs5Hgj8p7osV?=
 =?us-ascii?Q?TGU0X5rs0bMonCiOMil7i4mQuMDmJowXP/0PnXmQFlR4sadmG0p7tYVBiL0i?=
 =?us-ascii?Q?5B9072xZCwYeF3Cun7Xw3Kj1PlZ1IwuWkqxNvu4chJblBKlm+7NslDWoixQh?=
 =?us-ascii?Q?0r/hA1dmRNGBKOjqMFb86cB9K0K7sCMvbjRhxP92OQ+YSCwmfcOiSnJGtfxK?=
 =?us-ascii?Q?lHq5NwjnS9gOJLyfrLLfd35Kc0K4lVj8/z9MzVwkQU1KIc95bKwNF7wKhrjW?=
 =?us-ascii?Q?hl9X0FgQwR8/yed+iJnnnCLx2Bpd0Ehi2z17gbCOQwosUYsYDVJ6krEZmpx9?=
 =?us-ascii?Q?9H2kG+q2iF5iSDZiVlFnLO/I1ocenyv55jB81e8owRt5tjfe83XSxRZgtK54?=
 =?us-ascii?Q?5x1gzbu0JRkmFI38SdlqVbpeGUR2ltvR2PibfhqVWYKb6w7e+jWKUbGbcTCv?=
 =?us-ascii?Q?jjiRvh29ZRy5+GHUButxVoUjj7bLV2AZ6Z/IUyjeqezPhiyFabVry3gQaL6p?=
 =?us-ascii?Q?Mu96Fj5SyS+k5lEiEgVP5nztyF5kV7ufAXzVWS2ZiSKWE1iQttTsvPpkTpXP?=
 =?us-ascii?Q?wgH5HBEKYEjVCKlzHC2DJ+Za/rzrVApKny1GDc8R0+Sfzn2lkoYAo092Kk1p?=
 =?us-ascii?Q?exkjZPTSPiF3+keN/5z9VdYFv9YADnTOgm2dhCPHgu8uzOTTQ27cEt+i1LXV?=
 =?us-ascii?Q?GOyzVLTqTDZ6i/e5BsinoZsxYJbJ7hb6frsBjbyy/L7hyHQn3/vwds87HIsK?=
 =?us-ascii?Q?o+g4tylsLwijJt/Ie9juWYglmy4625hawvd7nPny0EQgjZMAsxX2fRjSuuPQ?=
 =?us-ascii?Q?XSBAXn+t5I5l9dHWvl0DJg4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460a88e7-694d-4820-8bc2-08dc2796ae82
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 04:38:50.7095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhiM0MAkb/HHuZdYv/FpPKuJYtvrm4Eozv3hRGtIVsk8P2O4HxJTYUI0KVS3mJzuylay9t0qdG2cWsgvaxA0M6IYi3CPiGulYpW5i7BJCzqvRq3EELACMIReg/o5/FF/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8022
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

