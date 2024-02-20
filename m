Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97A85B061
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 02:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C841110E02E;
	Tue, 20 Feb 2024 01:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="AXDSURw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2053.outbound.protection.outlook.com [40.107.113.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1910E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu76xaqvmn0ODlyWVnxFB98fJANvLgTg4WpTIgDkXaYFQCW+tb2/ZEck4Uwa2CeYIoDBAWMSIbpt5W4uD1N7RRPiLrbYn596sBwLwc9+NWweR1/GS7ECafKpZeCNdhLi9AHDxtM8xUTKNyGUp9IOiF/BObMr8jI3DE7ej67mrIvOH2245ZMTFOGSUbhUJAlc6oZ2hlBC6KYwwPOorDJIcaTx8g/rnb/8XDHIdDqdOOl2kLvajP8DgO12cq1lrLSnl186BIf7MSjFLDvZAMLo22fEt+g5rfFLb+I15+E5L+qguCmtqx3V2TNkFv7NuXEBB3nwhg8y5S7G4QYaaNGlbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXY+gyUBLqHr5OVGylRo6rD1OZwlsUDCqOi/+/20yMc=;
 b=kDddt4IKhhUEHS6Wd5CwlZXbsK+2stZRsm2yROWdfYgGHz35FxV0kMrrzefbU/HaC8Tl7P6v+pJYS0ztGnlQP6K4O40Cdu8Rx+udiNTOgskLNZG8RtFsv7aYPloJDffhGinSeu3yqMXLPy/+JY9fxEQCLOGVrSA/PP5VlOV9XeJBk6CTjaRM+p/ZcZ2BTIV11eQDjBQqyZHnjZ1lGQKnBcNKt4oVEIU16ya+5VO4yOuRepLeTY1xkQmHGFRlOmSRU6e70FG/t+68rZM8tNZXtdcqAQCODJJBUSmDMO/KGxMvPby8ZUlgWvxYX7LzMD+BpJUJpwfJCJLhK1utkmflqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXY+gyUBLqHr5OVGylRo6rD1OZwlsUDCqOi/+/20yMc=;
 b=AXDSURw7BpQWA58c7yijNx1W97UShzmlJ5qiNCUQljEfthcA9X1+a//PIp46jQ2nnDtPbbpD4uMujDrX79dO3+Y+cT0DKx5UCdFDsMyuvZLeApQndKoCduoQueVkQ/tcbTW/UZ2PBJlVVGS+5Cw1JF8BGMyh65D8tFTB6vRZaW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10730.jpnprd01.prod.outlook.com
 (2603:1096:400:296::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 01:16:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 01:16:36 +0000
Message-ID: <87zfvwj5or.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 resend 3/4] media: platform: replace
 of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Feb 2024 01:16:36 +0000
X-ClientProxiedBy: TYAPR01CA0219.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10730:EE_
X-MS-Office365-Filtering-Correlation-Id: 09785c7e-d90e-4eab-da73-08dc31b1956e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XyX8Vj39WSBrWDekv1iBDVn2O4QmYeaoGKhmmWGLA9XUepJKe3/zNcYHowc+SNohdxoGuD8XrKCAqAZLRDNIQSsfHGLoAZ8WWG5hii45gKFu5QrYUZNYiFOh0c+9gp8eahaWcVeOu/CptK+P/BYKIgTNzftGWFqavIomYHzsRD8rL7TsuO2f7q2wkbOrbZ9HxbGjvLEPyXhiDCCeRnB0ymKp18+5cuomrrfKuGFHhFphyCb64d0PnpnYvhQ/2Fb+CAnduURB8/h3JaG1JAZNd5BpVJnJZJfXP+H4fcR8dFy3uOTTrvQRWAPzPVzW6pVQiCsRgc6lwuHEZ17FeFhE7hCZl3xVpNLuu8m+RgK7bs1HFvAWrjTmAFLUK7IstxmCrpMlNXNvLgS1C6A7Vl6dwW9LcU1NGbj6B/9ExFzItmsqalWfn/IuAL2DQ6p0wQTXzuGKKCinOfMIthZAvNv67x4yVEgDX+hVjL1tIZulpYXpSRJCm5LuILTQEHG+ZswVm42iTxjQl3rsQhHuPfxrUaFMS+32Gvy/XkJgYWOucM+qzZ6HBGcsGcAKGNqGS519rgq89+SXcHQbv3QO8JpUqfVfQf88bSWkWBdoWZBrMAX0mXbeqKAEUdEEgK7D1d8Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38350700005)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQen0pXYuKbw8ar2F1vxih6oNJYqi0Bt+TKEHYISzT28twme0i4d9xs+JMnk?=
 =?us-ascii?Q?PRuWnO/Ql/Y+xEI0hy3xk+ratPAY1CLsNTxSHunEJq8QtruQjYH5xCm8ks+1?=
 =?us-ascii?Q?NONf1o5EeMpIbBmaF2OHwtJ2iwjTLo9mkuCa86CqTXJjgbBieogUQs9aY26E?=
 =?us-ascii?Q?FzDlWQgX7qzKJWdXyXO3sIdZeai+0WFgcKeUV5YvuBJGPLJdGaGAwAZSELZX?=
 =?us-ascii?Q?JW2T2/Zi+hsRotu3jZzWGeRmMjxv85hwlsOmHR1Q6a7nopDMHzDzpQ4f/qhT?=
 =?us-ascii?Q?EN5GCkPbEJ3JPTMLv/pnfinB8Y+4Qo1FlnGNUzxG88V/glIuf8yBJ7xOmKz9?=
 =?us-ascii?Q?WMmaNw8+MBqYbCyK8EP1B3An+oFBau4BIIa137aBashYUaQ0jp/IJLV/dqa9?=
 =?us-ascii?Q?oK3SEJuf/p1ko160GUJryK05DJ2sIrD6vXkOH9C3KhNiA3pYgKAkaWIQJR50?=
 =?us-ascii?Q?9A9Dl2W39HUyoKLmXOx8Rvbbo1QmJmjx8FE3lxotIAiUHEV5BcPA5lgYoEqi?=
 =?us-ascii?Q?40FQ6+nzlZcMlm/+xA6y9zYiJgWsJmu8GRY0NEt2aOKk1ZsToj4+3QL9b6T1?=
 =?us-ascii?Q?EqJvhqrNN+6R+pX9I/iUM10eZupeFD8tr5W1gxcXDPra/9J3vRnUmMrlDJzW?=
 =?us-ascii?Q?HWrXuNWBs2LPQTXdWchNNqkumQtglPSezFoQGzLkS4dUapjZvKnnvtP/VCvV?=
 =?us-ascii?Q?pHTkJuGo+sfS/gIoGe3aLUpPxvK6wqNbWy/FE1o8e3OL3xswyQO/E2bB1mkB?=
 =?us-ascii?Q?JPevIgTTia6VvHC4AfXsaIN29mPmZVRyeHMq8H28yS2dy1e5rJB2QRqWSBSq?=
 =?us-ascii?Q?K22DCm5zKeYK4etBHW78Orn1U60slmD/F+s2e+HqBPRNrQg2kx2H/VZOf7b2?=
 =?us-ascii?Q?DJgKYuFpceVA1FKmUhIF1KlLAYWyFth83bxzi5EePX3vqmYLDUJAqjBg3cNj?=
 =?us-ascii?Q?fauPBWpRR5hJaqQeKACRQ9iWIRVFjvV3p5Mf+erWh92klKOaW7P3+8fu0FUG?=
 =?us-ascii?Q?ZFJL7NOnH5iCNnI2mzwwNInhraQ3FVx81gM1POoRBoWLMviHLrwdI+zIJoaS?=
 =?us-ascii?Q?+dzzy0556XO0d3NQn2eLXf8Fpf4Bk3zu8yO2QCKhyWW7Lko5uqGSBVHC2QBn?=
 =?us-ascii?Q?oiinh4OfmQ5ZP8tw+Bxkw+nks58sRf5mE5Zx5a9teT7Y0fXSDWtcMI5dVMoK?=
 =?us-ascii?Q?nxpoRf+2ypast+srYcEDS0CLrXOgnzQpVpXRxmJ5kneeBzyQz/OCIIlBxmnW?=
 =?us-ascii?Q?cBHE/dHxTpyf6+R4zzVm2g//Utl65NmkfYU/BQi51/dLa4rKG7THsDWqaTLv?=
 =?us-ascii?Q?HU+25A58hiTb4/PvzB0ZBDfdXyzNddkaQ+DBP/6fc4hXj65ro8g5u0x3UjCl?=
 =?us-ascii?Q?OfwQO7V8IWj+ux72JkEMjrvn+Xk1w857MzbWhuTIihd5r9e3Saf54mswRyV2?=
 =?us-ascii?Q?ngtS6OpHwLcZ+Tbb/KtJfaX1VBddtzRvwMBNi2KWWpsYN88aK+pgw5HADyML?=
 =?us-ascii?Q?3DzRWpRc48+TDDs1cEbe9I8XEJ7+wcxdUtATcZBp/39t2y4keP5uXMyJALf4?=
 =?us-ascii?Q?mXGU04hXhdjeTUfWh+PVM9fNbZfH2Oh6VdmLj+55f/L/8ENoHopggA+WzN/G?=
 =?us-ascii?Q?LsRDtE9+o75wpamvG3/sW4E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09785c7e-d90e-4eab-da73-08dc31b1956e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 01:16:36.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ihPOVs/53s6b4jSW+/8BQGj4Av4JB7BnD0SXAYYMBDTiwaV1OzfRyEfpdcq3/p8Ro7fLY4RvonscC0tW0F+UPimvEBnjwco+eMbAgwVD9ywtkhdIYa7ocGeSDRlzcun
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
---
 drivers/media/platform/atmel/atmel-isi.c              | 4 ++--
 drivers/media/platform/intel/pxa_camera.c             | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c   | 2 +-
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 3 ++-
 drivers/media/platform/st/stm32/stm32-dcmi.c          | 4 ++--
 drivers/media/platform/ti/davinci/vpif.c              | 3 +--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platf=
orm/atmel/atmel-isi.c
index f8450a8ccda6..c1108df72dd5 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -834,7 +834,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
 	isi->pdata.full_mode =3D 1;
 	isi->pdata.frate =3D ISI_CFG1_FRATE_CAPTURE_ALL;
=20
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -EINVAL;
@@ -1158,7 +1158,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 	struct device_node *ep;
 	int ret;
=20
-	ep =3D of_graph_get_next_endpoint(isi->dev->of_node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(isi->dev->of_node, 0, -1);
 	if (!ep)
 		return -EINVAL;
=20
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/plat=
form/intel/pxa_camera.c
index 59b89e421dc2..d904952bf00e 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2207,7 +2207,7 @@ static int pxa_camera_pdata_from_dt(struct device *de=
v,
 		pcdev->mclk =3D mclk_rate;
 	}
=20
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/=
media/platform/samsung/exynos4-is/fimc-is.c
index a08c87ef6e2d..39aab667910d 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -175,7 +175,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *=
is, unsigned int index,
 		return -EINVAL;
 	}
=20
-	ep =3D of_graph_get_next_endpoint(node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return -ENXIO;
=20
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/driver=
s/media/platform/samsung/exynos4-is/mipi-csis.c
index aae8a8b2c0f4..4b9b20ba3504 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -727,7 +727,8 @@ static int s5pcsis_parse_dt(struct platform_device *pde=
v,
 				 &state->max_num_lanes))
 		return -EINVAL;
=20
-	node =3D of_graph_get_next_endpoint(node, NULL);
+	/* from port@3 or port@4 */
+	node =3D of_graph_get_endpoint_by_regs(node, -1, -1);
 	if (!node) {
 		dev_err(&pdev->dev, "No port node at %pOF\n",
 				pdev->dev.of_node);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/p=
latform/st/stm32/stm32-dcmi.c
index c4610e305546..ff3331af9406 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1855,7 +1855,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 	struct device_node *ep;
 	int ret;
=20
-	ep =3D of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(dcmi->dev->of_node, 0, -1);
 	if (!ep) {
 		dev_err(dcmi->dev, "Failed to get next endpoint\n");
 		return -EINVAL;
@@ -1907,7 +1907,7 @@ static int dcmi_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
=20
 	/* Get bus characteristics from devicetree */
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -ENODEV;
diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platf=
orm/ti/davinci/vpif.c
index 63cdfed37bc9..f4e1fa76bf37 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -465,8 +465,7 @@ static int vpif_probe(struct platform_device *pdev)
 	 * so their devices need to be registered manually here
 	 * for their legacy platform_drivers to work.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(pdev->dev.of_node,
-					      endpoint);
+	endpoint =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
 	if (!endpoint)
 		return 0;
 	of_node_put(endpoint);
--=20
2.25.1

