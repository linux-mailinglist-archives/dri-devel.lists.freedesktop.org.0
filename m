Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE9C75A75F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADF810E56A;
	Thu, 20 Jul 2023 07:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2051.outbound.protection.outlook.com [40.107.247.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DDD10E56A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iebD1sNFUvHM9FzvDiYtru0o+DNKMjVxovMXzr/OZVn9mmk0XZYu5R7q26CetNwIJGOBbtw5EnqlVk6/K42IDlQBVBKj0rPEfXXqBL2s6oZOzgo8EyDJFZucBLGzuI4qc+ZC4z4Fi3bMNuk1p+CwZ9DpbnwHwAkGkbzPeihFosbe05gE5tf72+YcdjS7av0opu+oVqUQROHHey7ZnyZgSBV6MrgRfzN4u+rLHQyO2PqJBtHPkouBlZwfo4U4CK9YEk/hhq/Jrid+CaRrRalUaqHxrBEma73bWy2BaLX/0WG5qnKGfBUViOsuPlYzz4PzDA0nynNGK4zDz3j5EtY+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcM4UwOad8aiPGN1wd4BrcxlMjn1XZT0hNlv74Fm71U=;
 b=W2T0BZ+vVunXRzf1yEJ60gYPy5JFLRkwaAtUlHJnJYwMx77ULtDj9FgOeHd2FR4h3HVhSqQL/XYR6fmZxoU2e5KtYndPhUWwaQSNNuCDD7Hn+DNopOHdQqixdj0Ce+yFy+5xMfHnsZkzwejws8khi4MXrzOJ56wDdUrNBFerqHZA2DaGmcgJUyRdoZQ01i7ZtScp4gnHXJrabUTybzlBBJNEioNo2XX+1BBTMhmPPV+erMZIe7mUn08G3bdZxrbqzV+i5jlIno/dFFYJXZ1N7PZuyObTFFm5/1ktUnhjLTqaHXDfY73crG3to138tszLorEDyUD7wwFqUxpkZFkvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcM4UwOad8aiPGN1wd4BrcxlMjn1XZT0hNlv74Fm71U=;
 b=p63uVE1ONxlpX2cNAKmATkJxkyFiArmHHr4db7MBOhHwr5+31wnIw3L17XKkZ6tIT9/grP7Gc4dBt6f8/qnzmNiWCbk9gHynj4NkiUuV9W8XMD4OLe/uQ4yAV/qY6OMc3xhmGw0Dtsqy3Ra9BB+vnNVkWqecteB2nvHIDJvYYMQ=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 07:10:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 07:10:19 +0000
From: Ying Liu <victor.liu@nxp.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
 rate to calculate lbcc
Thread-Topic: [PATCH v2 5/9] drm/bridge: synopsys: dw-mipi-dsi: Use pixel
 clock rate to calculate lbcc
Thread-Index: Adm62T4XsRXruAuytUCRfthfHJ0PDA==
Date: Thu, 20 Jul 2023 07:10:19 +0000
Message-ID: <20230720071430.259892-6-victor.liu@nxp.com>
References: <20230720071430.259892-1-victor.liu@nxp.com>
In-Reply-To: <20230720071430.259892-1-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
x-mailer: git-send-email 2.37.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM9PR04MB8415:EE_
x-ms-office365-filtering-correlation-id: 5f39451c-bd98-470c-49b1-08db88f06092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 927SuwfviYwscyZCa5dO7tqXKFvioMorJOXtth6I0zsODsAVtNszmHr0I7EffDf1uz9vUvrs+eM3jjWkcWM1hxtq9E3t0jNeSpSPuvD1dCCMXNqJSApd6kRaF+8vmZVpvoyokQ4XGDC0g+Jh573NC9YBU49Co4wepeUm21843J055OzfI1pvzOsd/wFDVnkF9T+HYToWlHNNHh0S+T+C/k7jvnGJ4FEs+/ScJ78kqxxGkT3KlLVblePQS4kNeMkqjZHaQut964Tc+w7EiMYmb2PlA/0HJiyiKAGzeoA6g1h25P9jQYbIe6ccd58eYXPNot27RK29hYq91Hqu/QZeZUvVDt9a/l/uQ1QJcGcKtqbqS/27Lm/0IoGbhGLejxRkZUa9i6HRfNPSCkj/E2o7eZE9NhWmt4U84YP1YLapI1CMl/veWsX6eurMFp80TcjXb4M+5xyHbLAz6+19Z1DPoTm7lqmBULjOM45FS3uIXNaKawb4LpZmQRHlJKAOS8eULhd5sGDDKAlnOb8HwCkl80M/BLVvsaqdWkBUViuSuaqkkDi9jSs+QoVfp2tFbus/Lb9HSRH7v5KHuSC0JXP6XEDFom+LCJ7wLw9IHeGUcrg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(6506007)(478600001)(1076003)(26005)(6486002)(52116002)(2906002)(6512007)(71200400001)(4326008)(5660300002)(66556008)(316002)(66946007)(66476007)(83380400001)(66446008)(54906003)(110136005)(64756008)(38350700002)(36756003)(38100700002)(7416002)(8936002)(8676002)(86362001)(186003)(2616005)(41300700001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pFIuyYGjs++tFrtAbBWKG2BVQ9ZJ4tW0TOo+Dw92NSGdm/cBJFNLYSM29+?=
 =?iso-8859-1?Q?v3qops7gFmWy7DyrIyCdSL/pJk6St2buNdUFMzF7ddi0qGjnQKkwGhRyDt?=
 =?iso-8859-1?Q?Tbrr0MP1RsBqwrkskatOeiYty/FHdeXTc62ZXk/T3ydYN9BN3dM7FdZPiM?=
 =?iso-8859-1?Q?QR+mxD+zmMJqo9fuv75471brwkBTgAGEG8bgtT9zack9dDWMw8g4wT1/pl?=
 =?iso-8859-1?Q?Bq81nMTUJNuSB35XHt8tLArtN8cFjIx2P5RLrqnIcP6ukyY/zx8WmUrryT?=
 =?iso-8859-1?Q?WHjq5MuRFRAsq8DUUw0VecKW21cZdNGuES/lohap/Ej27vdSk+9TDjxklT?=
 =?iso-8859-1?Q?zNPQJ0xhoniAClo+tCTyKmo4uJvu145dJ9LS0Ewq/qXdL2FWhNqJROv7GQ?=
 =?iso-8859-1?Q?FIwdpsRb1m3I+sVfK64ydMfF6LxeviH5yJscciWZMkCTB9TniuToXO3ZI9?=
 =?iso-8859-1?Q?oiIlrP1Q2vaZ+jLOLmc+JcPgPhl8Pa7LEZJNK1+GyrcdA9ceZwm+M5dNwY?=
 =?iso-8859-1?Q?yklHyDrXPYlCrYtN0xebwFj5Boy6/F6Xod6EHrWK5IWrtLyowe3BheP2w6?=
 =?iso-8859-1?Q?NrvfkO90vzmcPUxRMmH/H7J1EPmgN6jYv75Dts/mq+Gpv8LvLXztQBnTo/?=
 =?iso-8859-1?Q?PRdvjK3a1mN1Q8voyS8Hgy21LEtywAE98S9GedpJ7INYqdK6lDQEr5vFnh?=
 =?iso-8859-1?Q?Df/0kE6tVSCIreAgAT1Ig3ZTBf3ZXc+ER4lwTmSwLLZJCkWx/7lVHpVZg1?=
 =?iso-8859-1?Q?Q3wbD2pKYw5pEXrYvmOfZT+KqEqNg8bxhETaNovz0z+REVaSLUI0qU8wSa?=
 =?iso-8859-1?Q?f/f2q8RWlQ7ZjFzeBwIlmejtSm40LwQHvrTS27hfM0ixZcmQ9aR0Sz4mIy?=
 =?iso-8859-1?Q?5H5b++eb58B2Ie/PFQW6JoQGpu2VqaiX+r5BluZk9xcxBTNden3M5js7So?=
 =?iso-8859-1?Q?m7yheYFmnELINnKO3c5/SZuERb8tMtQMBlsAeTYLuI43UBF7QILI6FK1b8?=
 =?iso-8859-1?Q?rnGXRRF8GKsCPR7b56up8o8/ddelizeGG73iGp8kV+DAGYsMycqydyoHb7?=
 =?iso-8859-1?Q?EF8ibe185jOc0+rzO3sjCahRcSHio7SUkZopQXq+13OIjJDPZsCXphgXAS?=
 =?iso-8859-1?Q?soknL6fUsxDTIN9tnXqynbS/9haNMMsgIKCIgjiL3hmaxxZljod9Cal215?=
 =?iso-8859-1?Q?5bzdBKzEj1pFzIkfEne4MzNc2fQJFUfk8q2gxqpNIxBP48xnV7Qkx7iEVD?=
 =?iso-8859-1?Q?3D+dxa6MDgfbZQ+JEI2OVUpSjYiRz66fF7aGdbn8zb8yNjVaLzmhDjFgLm?=
 =?iso-8859-1?Q?mZJj5GZQxfHEyf596T3rN7kD+NxdwPKVplyEaUzTanYzGie1DRDkXsLOcn?=
 =?iso-8859-1?Q?GdW1PuZ3HRs8OUJlI//nCvOW79F+JXuKektKqG67jLUI0AwyR03V0VT/yW?=
 =?iso-8859-1?Q?NomwFbmlk7vQ4kJUN5vddfDOUjqqhuJdT3uvfPln3UM9eRcIC8gxoJNNLy?=
 =?iso-8859-1?Q?/zguWVUmggwKJIEY9nyUc927WFz76oujuUeZ5+kQIfnp93CGMJA5BRipnY?=
 =?iso-8859-1?Q?pXc1hKEKdaDE9wRhvtm24DWU+85sw2Wh7tXud+IE4OPlodxyqgon1oBRf0?=
 =?iso-8859-1?Q?DFX2tlon3kxYmko7ixLktmPyKtqbgRpNiG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f39451c-bd98-470c-49b1-08db88f06092
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 07:10:19.6718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aiazLIxuDq3z9yQZVss5F3pct/K9HTwicUSVVnoXI3zyBSmlLKlwHyxOMshlPBBY2yglbFwGBmL1C2ANlF3hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To get better accuration, use pixel clock rate to calculate lbcc instead of
lane_mbps since the pixel clock rate is in KHz while lane_mbps is in MHz.
Without this, distorted image can be seen on a HDMI monitor connected with
i.MX93 11x11 EVK through ADV7535 DSI to HDMI bridge in 1920x1080p@60 video
mode.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index c754d55f71d1..332388fd86da 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -12,6 +12,7 @@
 #include <linux/component.h>
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -762,8 +763,15 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_m=
ipi_dsi *dsi,
 					   u32 hcomponent)
 {
 	u32 frac, lbcc;
+	int bpp;
=20
-	lbcc =3D hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
+	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0) {
+		dev_err(dsi->dev, "failed to get bpp\n");
+		return 0;
+	}
+
+	lbcc =3D div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
=20
 	frac =3D lbcc % mode->clock;
 	lbcc =3D lbcc / mode->clock;
--=20
2.37.1

