Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4F8438C6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960D2113A78;
	Wed, 31 Jan 2024 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0742810E523;
 Wed, 31 Jan 2024 05:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pdi5a5p15GrAON0rR3kEVdIifpLQlF998eORzr8qU2cvNmhw+UkY5J32FjtM0L2s7hnky85MDp18JAYencPnR+0NeJ1of6tOT0nwcQgy3nzMP03Wi2lF84TTAJCWNo7laj4OfLKSGHnFDH9n1RZhOZ3ploP5cHTxdY0oojE1GVN2oEAzZrfnuN0ZY/NoBjXamRk/8XdmlGXekqVCnvB2Nwh8GN9WDVQBtNMTokiGz9paxsZr7B72NrlRXuDzoZU2I+ohcJkzaBpVj+YD/53SA3mdiwBJPeDl74dKCEYOPbgdvI+5D62EV+QFRwkAD5348Rbhwke8DaYzqyA7tGscrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keKwTFkoFFCwDKS5RleLLCGuiGWf9iU7c4Kky//CX4A=;
 b=KUFOVHGK6MRm2G+OZmxoN86WIfm55spWNmjzOHk3Kt5tkoTnUUykyV+29gRsOnsCWj+uBvqujvH3Pi5korpKqyUbifFiL0bW0AdWtPfqpbc/vOmZVVVNvVVZ+krU3wGnF167v3bHTexFhv+SNBCaeim7wgJMnoA0W0oGoDMgB4Tg7ZG9IY1izn5ZFE64g6+uwjQV3xBdZoyCeD1xQrxvDNrEPr7ZMbiBfmcntvvUVZWwHaIECbwCrMinhuAb2U9plqYLV5icVOpajekLGo/SxSsmiI2ZP5hL7PVVtYDXP6Lxmze2Fwx2lS334Z3N4LO82JDmWhPXL7Nc76IuWQgXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keKwTFkoFFCwDKS5RleLLCGuiGWf9iU7c4Kky//CX4A=;
 b=onzDHZPpDUjs/k8IPUCab9byzI1rf95KOzBK8AeXB/RuurkKE1MdlO+DhiCsawUrKgoAil5BnabYQXhvQ3sOz99JlrCBTqGRAnZt2McqtMOjmkTAKCmXZxpWzCTtTLxnxObz7e/y1/9aUnsXyyto4SEyQMe+nl6Y2NcRGR0Lj9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:07 +0000
Message-ID: <87y1c65bwl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,	"Lad,  Prabhakar"
 <prabhakar.csengg@gmail.com>,	=?ISO-8859-1?Q?=22Niklas_S=C3=B6derlund=22?=
 <niklas.soderlund+renesas@ragnatech.se>,	=?ISO-8859-1?Q?=22Uwe_Kleine-K?=
 =?ISO-8859-1?Q?=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,	Abhinav
 Kumar <quic_abhinavk@quicinc.com>,	Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,	Alexander Stein
 <alexander.stein@ew.tq-group.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,	Alexey Brodkin <abrodkin@synopsys.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,	Andy Gross <agross@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,	Bjorn Andersson
 <andersson@kernel.org>,	Claudiu Beznea <claudiu.beznea@tuxon.dev>,	Daniel
 Vetter <daniel@ffwll.ch>,	Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,	Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emma Anholt <emma@anholt.net>,	Eugen Hristev
 <eugen.hristev@collabora.com>,	Florian Fainelli
 <florian.fainelli@broadcom.com>,	Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,	Helge Deller <deller@gmx.de>,	Hugues Fruchet
 <hugues.fruchet@foss.st.com>,	Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jacopo Mondi <jacopo@jmondi.org>,	James Clark <james.clark@arm.com>,
 Jaroslav Kysela <perex@perex.cz>,	Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Hilman <khilman@baylibre.com>,	Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,	Kieran Bingham
 <kieran.bingham@ideasonboard.com>,	Konrad Dybcio
 <konrad.dybcio@linaro.org>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
 Liu Ying <victor.liu@nxp.com>,	Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Marek Vasut
 <marex@denx.de>,	Mark Brown <broonie@kernel.org>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Maxime
 Ripard <mripard@kernel.org>,	Michael Tretter <m.tretter@pengutronix.de>,
 Michal Simek <michal.simek@amd.com>,	Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,	Philipp Zabel
 <p.zabel@pengutronix.de>,	Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,	Rob Clark
 <robdclark@gmail.com>,	Rob Herring <robh+dt@kernel.org>,	Robert Foss
 <rfoss@kernel.org>,	Russell King <linux@armlinux.org.uk>,	Sakari Ailus
 <sakari.ailus@linux.intel.com>,	Saravana Kannan <saravanak@google.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,	Shawn Guo <shawnguo@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,	Stefan Agner
 <stefan@agner.ch>,	Suzuki K Poulose <suzuki.poulose@arm.com>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Thierry
 Reding <thierry.reding@gmail.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>,	Todor Tomov <todor.too@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,	Yannick Fertre
 <yannick.fertre@foss.st.com>
In-Reply-To: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 18/24] ASoC: audio-graph-card2: use of_graph_get_next_port()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:07:06 +0000
X-ClientProxiedBy: TYAPR01CA0161.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a708cf9-7b5d-4841-5e72-08dc221a7925
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dDfmbD5IWzH6ULqTTmlnRgCNofg/m4m77G/TibYrjfndqOmWylPQ6b8K2Cvn2MQVZNu22waFN80bkMih1BYYNPocVUB2rWgtjmdehOjHI3TPdDIzBP3t79ZSX96PLb/XMRhHcIgqrHTpqAc1bZ++3pSGDqF0AnQaTcy8w8thnFlPhQUGaRI45h11jiY2QP6Csd1Bz9idDj55UUHdKYl/i1vyJtGLAC33JkBLCJvpo5qJdGQhuV9+YS8ZdQ6Z2MP9ar88oVB+3nYAUPJ+Yl0t+PlS2nvYmX+SrEBU8TiRBVIyyDaklZblQ1RMToZX+O6PB77nmNVOLwwHkhZRM/KbkKkAXhRopnseqLF0L2RYJShgf41GnXLLIjuNux5utKinEhEYhm0APTMaPYDs52YekRpyZtWgzRnJXxeVbTj/alUE4QXklzIhxIv7PJ2Zm9/0CGGreHUIalKPNP6nCRbHwkYoxWBofbKtTtByzYrgHqyenIO4fZcNgK8rCaKCkeugz1NqlsmKMPSxHKjzpnxP6W81RJb5rGHEb5QAQabW48KP8KwOhwffaJh04bINpi8eBY+Ec1hUTmfoBR6m4pGk/KL5JqsV2W80rJ98b2Uyxxc8MFIKo5C6Jofqq+83Bv55/g4kzHjqmDEa8vr6vWXQi5CyopTCEUKGaBCpuqT6gjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(2013699003)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkeRLIWNbcxPXoa/1qbknCQ/6BZEVxeWbReU2MQHiFdNNea9SwHJR0cH/JYf?=
 =?us-ascii?Q?uILx2N/QYPwExjR06UrafMBinPtbQ9PHd80XmhquJClm3jhU3eIZQrp2cq/p?=
 =?us-ascii?Q?dxyjnlRnvXyd92zunzYtDwyA8cMdFIeQlGXI4YTmhMEJSvb1/b/lYFkp37XT?=
 =?us-ascii?Q?viAkUbK5bm3UH4saEBUsjuFofNt5ZjKhzcln/GXcMSf62YVhbz6xxHVbCOlh?=
 =?us-ascii?Q?IEcMZ9qx0/c2b9/LG0ZzXNoSxtlSCpFHxzXZ8dtxWYHU5tGowbcrkD6n2hAq?=
 =?us-ascii?Q?yCWj6lRxXRn1arah0KPXf7b6bokHvs6pXA9sGStnq0MeMGSuHyRvTHmR5bkg?=
 =?us-ascii?Q?EMXL/zAgDfbGVJIUVO7hmZ9PVBHGxwmhgcv7fMmUtxDTe0lewtYk9MNBaO+R?=
 =?us-ascii?Q?SIYVnN7OiDTFclZHtU345Bb+HqxttC8gO2LdKpnoyRvnjVwHne6ZByUs9DdV?=
 =?us-ascii?Q?ntBua05P//c2yZ0/fikD2WqRPjbA1k1EmnPEwhomnDKaX3E3g2EzIqlydDZ2?=
 =?us-ascii?Q?m3GpoGMOts0Hzse3I0kyOrxQUpOhjTTo++NnWHz6oKk3d69NuUluba3TnHku?=
 =?us-ascii?Q?pARWmf71PrqhtpJ+WzOr5dG+Pk+9BD+vQMuLWrMRPoSVXowRhBqxPcZbnZP9?=
 =?us-ascii?Q?lFxzsSqzz7sh5zWekuBj9kwUwLPXxrcj4yfVIyw3VV3dRppMmCdqynDmp21Y?=
 =?us-ascii?Q?dWxhOaTmVDJjOi9KdIs+F5ypI41h7f33IHq1HYw3ZKivDjCX13cHImCgj0pG?=
 =?us-ascii?Q?hMRD0izOuV1M1IKieG43FgPXh0wOB2mlKG298KtV7T/3cLypAgRYCs2XaF7Q?=
 =?us-ascii?Q?1wb1eT7y8+YsUfvCCIHK3JbygV3i1njEL5e4LVZ3LuN5YnBtj+/KvLYyBXy0?=
 =?us-ascii?Q?78uQsCGIMuM5xWO1bZAQrXLMBldYfmVIClk3ikZIqHpPBj4jnHNyDqyF235Q?=
 =?us-ascii?Q?TpMH4wwbhjIQjIChSWiwsmGFdRnkOywmybJYQlgJzryfYG3cUOaQpmD68i6Z?=
 =?us-ascii?Q?7m7nw1JOkOPiGDS3w7ipkX1z1ioPW/2mDKOGHdXyK0TexthC3fJeXjd+1eJc?=
 =?us-ascii?Q?CB3TGoja6pMAJsWCj5DjjrhqpzAORp8yPswokwP4uotvtx2Cob6zx7l+gfnn?=
 =?us-ascii?Q?cU4DK+t8bN5k90QbeGJ1baJTBDKnuA9si2GIRoI2yFUgfNmU8L0EZAmCI3rM?=
 =?us-ascii?Q?gVR26dspt3QCEU1JcsVlQ+Doy+41QQoWMChbWs0prMGcvkcoJ0bdLb5Pn0ry?=
 =?us-ascii?Q?ZPLhhtPM1ORUsw7uqMh+XxuGc82X4a4YsrxRcegc0uvbcLUtbvSrVriDjNbw?=
 =?us-ascii?Q?fKku+okh6Acn6kqioek6CM0X/JzkCG4xYL3+3fKiCyxAVH2e3/y7RzIG5c3f?=
 =?us-ascii?Q?FmmSnfBgTsBzy27VpQi8FEpRW+q0f7vwW7ctzfMs3LepBPxSJjextz1n4HWn?=
 =?us-ascii?Q?E7kBPFafFOvS2f3CLoL8bm52fI+b+nwWHvzHE/FBWcigq4Yzdl/ONkLEz8pD?=
 =?us-ascii?Q?cyIfGvuUlYOrL9l5iGdYItvLPTs62J9BQV4WCqdZKJHbKVqt9oVaYWQq7loe?=
 =?us-ascii?Q?SQScRO+ArH2iuAwnUVS4aq2oGQxj+07bpc8inxVT/M+DlvBnCSqSLTc58zCa?=
 =?us-ascii?Q?2wWQ1tGNPGbJPCIl0u2AIpM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a708cf9-7b5d-4841-5e72-08dc221a7925
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:07.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9D7Ey+0fBJPlS0Zfg20QTVQ9EOaFa518Nz9w2j6xO/EK+xkp4Dqj7LUPA3PihG5g0E8xIoGjunMKI4ZYHhsJwjg6hjhqzEX4druSUY233KV8GWg+Fg6QvNdf0S5uPXp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8896
X-Mailman-Approved-At: Wed, 31 Jan 2024 08:20:59 +0000
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
Cc: linux-fbdev@vger.kernel.org, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-sound@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Leo Yan <leo.yan@linaro.org>,
 linux-media@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now we can use of_graph_get_next_port() for port parsing.
Use it on audio-graph-card2 driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 29 ++++++++-------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index c3763719a69f..b2bd5b70a712 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -339,12 +339,7 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	 *	port@1 { rep1 };
 	 * };
 	 */
-	do {
-		*port = of_get_next_child(ports, *port);
-		if (!*port)
-			break;
-	} while (!of_node_name_eq(*port, "port"));
-
+	*port = of_graph_get_next_port(ports, *port);
 	if (*port) {
 		ep  = port_to_endpoint(*port);
 		rep = of_graph_get_remote_endpoint(ep);
@@ -539,7 +534,8 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	 */
 	struct device_node *mcpu_ep		= port_to_endpoint(mcpu_port);
 	struct device_node *mcpu_ep_n		= mcpu_ep;
-	struct device_node *mcpu_port_top	= of_get_next_child(of_get_parent(mcpu_port), NULL);
+	struct device_node *mcpu_ports		= of_get_parent(mcpu_port);
+	struct device_node *mcpu_port_top	= of_graph_get_next_port(mcpu_ports, NULL);
 	struct device_node *mcpu_ep_top		= port_to_endpoint(mcpu_port_top);
 	struct device_node *mcodec_ep_top	= of_graph_get_remote_endpoint(mcpu_ep_top);
 	struct device_node *mcodec_port_top	= of_get_parent(mcodec_ep_top);
@@ -572,12 +568,12 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 			goto mcpu_err;
 
 		codec_idx = 0;
-		mcodec_port_i = of_get_next_child(mcodec_ports, NULL);
+		mcodec_port_i = of_graph_get_next_port(mcodec_ports, NULL);
 		while (1) {
 			if (codec_idx > dai_link->num_codecs)
 				goto mcodec_err;
 
-			mcodec_port_i = of_get_next_child(mcodec_ports, mcodec_port_i);
+			mcodec_port_i = of_graph_get_next_port(mcodec_ports, mcodec_port_i);
 
 			if (!mcodec_port_i)
 				goto mcodec_err;
@@ -967,7 +963,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	of_node_get(lnk);
 	port0 = lnk;
 	ports = of_get_parent(port0);
-	port1 = of_get_next_child(ports, lnk);
+	port1 = of_graph_get_next_port(ports, port0);
 
 	/*
 	 * Card2 can use original Codec2Codec settings if DT has.
@@ -1099,21 +1095,12 @@ static int graph_counter(struct device_node *lnk)
 	 */
 	if (graph_lnk_is_multi(lnk)) {
 		struct device_node *ports = of_get_parent(lnk);
-		struct device_node *port = NULL;
-		int cnt = 0;
 
 		/*
 		 * CPU/Codec = N:M case has many endpoints.
 		 * We can't use of_graph_get_device_endpoint_count() here
 		 */
-		while(1) {
-			port = of_get_next_child(ports, port);
-			if (!port)
-				break;
-			cnt++;
-		}
-
-		return cnt - 1;
+		return of_graph_get_port_count(ports) - 1;
 	}
 	/*
 	 * Single CPU / Codec
@@ -1197,7 +1184,7 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 {
 	struct device_node *ports = of_get_parent(lnk);
 	struct device_node *port0 = lnk;
-	struct device_node *port1 = of_get_next_child(ports, lnk);
+	struct device_node *port1 = of_graph_get_next_port(ports, port0);
 	struct device_node *ep0 = port_to_endpoint(port0);
 	struct device_node *ep1 = port_to_endpoint(port1);
 	struct device_node *codec0 = of_graph_get_remote_port(ep0);
-- 
2.25.1

