Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB6586F970
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 06:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFCB10FC6B;
	Mon,  4 Mar 2024 05:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="PNUZWMvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2065.outbound.protection.outlook.com [40.107.114.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C505010FC6B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 05:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACl25ziSuEH++ip/ASeHAYK5EM+IKTBDJdCGa9f4eaVcjrzl89QJh5gzKDWT8mZXsfIn1fCBAUaccqNbO/ZZSN+mdbS27O8Tao8m8VkaQD5XYSA2crlfMgmwu9DmgmJSSv674Pc2qp4FJyWn5ZBrb8k+ObnakyA8X3hjCSWRNnM++JXY04Y+W5L+5z6OHlZbq2Qt/zzGn7ziNDgWabdP/5FMJ+4U2/6ugolk2hZUVgM18kXUwMFGo+6dVnym+fQC6TJZQAP8CgxNDdKx5XLZ6SOwnu7B8cwJ0KLlgOofSn5g+OxLFujs6dzsf88XT/rZCSfjxazyAvkuwOpN61VjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPWqBcRXwbO+R2g6KVNJFygj60WyLlHpr50NYErWcqQ=;
 b=YJ93jUCHlPBENKG/HIT1tq316ypFB9+1CS3QRV2W6kBtkUFy7eLLSWHtWsfl6lVUKCmLCaSW3DLWaBvjxrvEoHyzqMouthILIwbLALc7vRri3jOrG7ZJKereBRQHsFc2k2NIsz9G7tuJOgjNLUBBmM6sNk2h2TJ8YJLRRhynhp9cNIgxjQy5tnPkgwmJtiC3H0NYH+duSoiU+UqZOVjZf/tD5yF77qSmtd9sz9qEy7WbJTlMMVv81+joJCFXKUEovPn187a3wSvzEuSZ7QvlMFabXQqiQ03T5kTVDRvshnuQ214M+J7YaCDV6CZRP17fWrjcApa64HH7aBGZBk72zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPWqBcRXwbO+R2g6KVNJFygj60WyLlHpr50NYErWcqQ=;
 b=PNUZWMvnOoEGzwqAPyDsFreuYtvn7VQukF4Xfn6qLJL+gZhLDXUBwqwUrCDQCMReqsugJ6TfAlkCxUuGOyWUEsgC6QxGqsXqe+rs/o7DXcSWsnHOX3VRWxNr9Sk5FCKKMW5lpl4KtzW/V5LJdVI/Vd2uyOJjyY5ialHsMSYtwRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6322.jpnprd01.prod.outlook.com
 (2603:1096:604:f4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 05:14:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 05:14:57 +0000
Message-ID: <87plwah92n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 resend 0/4] of: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Mar 2024 05:14:57 +0000
X-ClientProxiedBy: TYAPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b65b10-ba4c-4ba6-470b-08dc3c0a08cf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNFimaYfjhR/GTIBnIlbcpWPpHA5x6Ar0wG6xuCUOcP/S4Y9ZKl6t88vT44WhMPMXuRgdsmXPJLGS3R0W+rRaNti6M1eDqahpMvXSdV9FilD/nbEpUNGbU3l5AhZjkaZooyVe71LYw3bfgWsymE3N+jFkMON1K0djo1aCZIj2N9pFRfEfH2LAGSXSCrWHpBx2AWzMa6Tg2CLg+MvATEqBiX1fs+scXveKsWU9K2aO7hZfSRj0pzmExhH5VsZRfFjd1xgXMFEwC0KntDG/ofbb3UwwNFeNCLcZKYyuMgbr3LVPdkxGiex2U8l8ljn32HGuxCbpgqykwEUVr+F855ZALZ/HLVAOdzkxCTnXOvifZsGKh4aKUkBDtz6bfYWr10QsON8OUIcZh8qRMR+p1y/GE8S2KzUSpmUorGwtOZC6f6UIhPA/7l74BCYJfG0Y5dQufnjt6wL8qYlzF3+vSlb98qLr7Zmqg0c2QXf8BH1xG81ifZvEhJKX8RWKBkpYAz8dHVve3qZCbYpaue5NUkBxvz7hFH/MWvin95A7oyXD9QeSJWMhGPwTMBEgnkOWZMIpWH8boDSuk+sEKZl1DZ/Qjp3lQEHhjVXQFPi1NlUuZlwxspDkI2FBsRHkNbcSmmyT+vEwI1K/TCbmuw3BIByks6bcv2DwsKhMb6hH6fE/DktQqHbiC6b1zPcrcf459n2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4NJEQyIMla2dgd5Q+forIT0Ej/xRKlVE+sVf5LHaJJpHf2tIkD/viwcPY1E3?=
 =?us-ascii?Q?zO2oh5NhQNLIFQ1Rk/hcb69Yw0sRjAmmAIdFEGLAv1lav2P2XjxfnFXOafFI?=
 =?us-ascii?Q?mxX5BemcEdu5w0XJ6WEleyONS82E4ywH2km/0DT3khryaObLlmUS+OCdEnBE?=
 =?us-ascii?Q?L46YovctdMMZIdFC7GSG+a8UWsOjaPCgLSn6NdZOz0eRsbHSjbACK5jMng6V?=
 =?us-ascii?Q?G0az2QWlkt+q0lojTxMT7xpLsKVZnaJfmnD0YeyWwTeggaQStSTb45DoN/AF?=
 =?us-ascii?Q?WEgjxRiw9tdQu+IV+vq2bFAE1lRObZejEwv0r9WsHYHti2NZHaw4+G89Tax5?=
 =?us-ascii?Q?bN/dKhGLDNoni9/WH5cBO8B6SEs8FnafWSuwfJzGw2W9J3e3zbLpPiohSebm?=
 =?us-ascii?Q?uBXXS1LnYxWcZX/yDKhUKtUWdy6YYAO7n1Oik8522LtBgXkq+VXkzQk1JTAl?=
 =?us-ascii?Q?TtI876EOUZeIDbqpQsp3KXsh/Gebk4xzeB50NZ5bLdghIFW2jdiS0bahjrdg?=
 =?us-ascii?Q?HZkvw49h44AwX2ccdmTFB7fQy4k3nlxcJWTWGEs5Vy4kZqVG5fxE/dNs5eil?=
 =?us-ascii?Q?9fjNtP6aRJG8ofcZgH0MiDwQXkre9RKWzEjPki2zwDqBnaSu0fyTyiR5lafR?=
 =?us-ascii?Q?huf2QD7vZqQAgYMQvdDxw82F9tRqrnUwJPSjxxJWwtxx7B5ZWFV9GqDK6o3P?=
 =?us-ascii?Q?t/A9HJMaKejAJWd9l9FButwtqxbuv2iBH+K+sLig/lxn+isxy+FezaMZLEgA?=
 =?us-ascii?Q?OWeTrjuBoJKbke65A2jT2go/WVPBb/BDomCCyDONJuB8nXaTQiezhIvT3onV?=
 =?us-ascii?Q?vMadkvDFrx+4H2Lsx6wnJLbZUsNX4zJESe0H3nKwQ0oFXZCPb4l4AK6U8ryZ?=
 =?us-ascii?Q?hdDXbOtDQJHYD2OyLv6a0TMu3UTi5bNutudRMlf675dfFLYOF7va9vWu2DoF?=
 =?us-ascii?Q?5qASfoXx83M1t1XyT1PdJWB95msl71x2t3bU9OzRw1ANtMJUGw7MCX226Ow3?=
 =?us-ascii?Q?xzILhPiXSDcrloY6rSLWbURrxLS8fWoMDs8VBp4K4AVLdIf5sXp/5C/zNdU2?=
 =?us-ascii?Q?bHvNMp2YZa6FQd100eSkESSTbVBjHD4Yer2Xy9qcogBty3IS9pdbS5/02Qm7?=
 =?us-ascii?Q?+nOJxbij5qWkNFBC3zY629KPZI3AkXymc9wt8CmgdP9Eq5U/9tfp5yq7UD1b?=
 =?us-ascii?Q?8IbI/POU8vHszyFKjFSv2iAku/COchUMS6U0NbkbcYgOsgz3pWKGrgElEwE8?=
 =?us-ascii?Q?lc51r+6cWecqaCr3Tt+zXodK/wh4Ybj9G0lyw9H15XLlI2In5baHXxShd7x7?=
 =?us-ascii?Q?yo90NURAJo4+hozh6UGTMbhpZzcrDDfYVIyl55MRkqJ7KgcDqKsfuO9meFCR?=
 =?us-ascii?Q?qIqeg+qkj8ux56RsBdwCXBWns8iXIK7F/RAC8K1kiRlJnZqIG+PW+RCpvYhU?=
 =?us-ascii?Q?zXZ3zVNYysDm756K1UyB3ITQc5rQZl+4m4WH/rE5uG9Zqi+vrYxq4q2PsKa7?=
 =?us-ascii?Q?xxyGSV1czNKKF7sdyAgEe5umDZI6f1rnAf0xB7qDi5tpsN8DXUJr5d6sG7Op?=
 =?us-ascii?Q?BN/1jEo9AU4Pmfnp01QNngDSIsAeLZ5ypeWtzztns5JgQZEGEjRV+5tgUne9?=
 =?us-ascii?Q?0Y6iCRfno+lQH90cn2IHzYs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b65b10-ba4c-4ba6-470b-08dc3c0a08cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 05:14:57.6044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hU+HpGK4Fx+TSG6Kn/4+qg/sNFGtuJrBGqdJogC5ZcnvGXHNpP35QsoLd4w7BC8fmY4aE5n3ZKGugG/t1N7OqIs5yoy9LKxBgYF2/r4G5vGP1NIOFiCacU1wGIqOa2Sa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6322
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


Hi Rob

This is resend v2 of replace of_graph_get_next_endpoint()

We should get rid of or minimize of_graph_get_next_endpoint() in
its current form. In general, drivers should be asking for a specific 
port number because their function is fixed in the binding.

	https://lore.kernel.org/r/20240131184347.GA1906672-robh@kernel.org

This patch-set replace of_graph_get_next_endpoint() by
of_graph_get_endpoint_by_regs(). There are still next_endpoint()
after this patch-set, but it will be replaced by
for_each_endpoint_of_node() in next patch-set (A)

[*] this patch-set
[o] done

	[o] tidyup of_graph_get_endpoint_count()
	[*] replace endpoint func - use endpoint_by_regs()
(A)	[ ] replace endpoint func - use for_each()
	[ ] rename endpoint func to device_endpoint
	[ ] add new port function
	[ ] add new endpont function
	[ ] remove of_graph_get_next_device_endpoint()

v1 -> v2
	- add Reviewed-by from Launrent
	- use by_regs(xx, -1, -1) for some devices
	- add extra explain for drm_of_get_dsi_bus()
	- add FIXME and Link on adv7604.c
	- based on latest of branch

Kuninori Morimoto (4):
  gpu: drm: replace of_graph_get_next_endpoint()
  media: i2c: replace of_graph_get_next_endpoint()
  media: platform: replace of_graph_get_next_endpoint()
  video: fbdev: replace of_graph_get_next_endpoint()

 drivers/gpu/drm/drm_of.c                      |  4 +++-
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/media/i2c/adv7343.c                   |  2 +-
 drivers/media/i2c/adv7604.c                   |  4 ++--
 drivers/media/i2c/mt9p031.c                   |  2 +-
 drivers/media/i2c/mt9v032.c                   |  2 +-
 drivers/media/i2c/ov2659.c                    |  2 +-
 drivers/media/i2c/ov5645.c                    |  2 +-
 drivers/media/i2c/ov5647.c                    |  2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  2 +-
 drivers/media/i2c/s5k5baf.c                   |  2 +-
 drivers/media/i2c/tc358743.c                  |  2 +-
 drivers/media/i2c/tda1997x.c                  |  2 +-
 drivers/media/i2c/tvp514x.c                   |  2 +-
 drivers/media/i2c/tvp7002.c                   |  2 +-
 drivers/media/platform/atmel/atmel-isi.c      |  4 ++--
 drivers/media/platform/intel/pxa_camera.c     |  2 +-
 .../platform/samsung/exynos4-is/fimc-is.c     |  2 +-
 .../platform/samsung/exynos4-is/mipi-csis.c   |  3 ++-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  4 ++--
 drivers/media/platform/ti/davinci/vpif.c      |  3 +--
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 29 files changed, 38 insertions(+), 53 deletions(-)
