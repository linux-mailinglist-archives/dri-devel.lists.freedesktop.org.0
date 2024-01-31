Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E868438C4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E4D113A76;
	Wed, 31 Jan 2024 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669A810F1AE;
 Wed, 31 Jan 2024 05:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNXnCWw/KZeh4FMlDiTN7n99JsJS462NOEaPcwEcHkkBwWJoXZ67z3FL/GFDh93xwJkOedh8R/QrvTRDsSx4I/WK+ZKlJzMmV94ESQeXHSa6bu216T0LuO2fz1FD0Ic1uBpqMDzXJnvUwoZ7dLvXxWfgWsOmB2urxzsNTZnkKYtgbKbdA5sfQ8idhussYzYW+aApLvKG/4qa1wiBWbEFSBPDOoBCwQ0qKAqPSGPnFakEq6j3WPCnBb3iPV83ku+5afrsRtqBlqQVoJhZJvLLLbSlSe3OSRNt3l8U2kB0J6u0ZGL4Z4Ku1/Fa5+3xTJY41AmYcJJ2aK+TATyh69xRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WAnJ24PsVvP6yDM9wwJuQSBy/v2vUcMycCKnAJTUDU=;
 b=KEYS1CcqYEPknt+6/LfwvEg+upyvUELO6nNjb2ejlYEK7KsZj++H0GlvqqgNY88i14m2M9Sn2oeHpjeBHq4MRA4u/I5vRIgviC5+XUTMNIfuD4a2M7UDeLSZsLfEaLZ+XOerGJfHrWvA/c7N3Xgs2mOI88fe4D7KqUgpOf9GK53iGkKMohnjcnIybVBPjV+YK4lkQ8K/hbEGPqAmludXuJvBcamfQnv3RNUR+0GY4jj7FFa09DLNph0xx5n0F0HEVR5guH2MZeEFDefkWKlCB7S0r0t6NPsZRcp/cljT8r8p3i4nJtkXpB6boPtwRh2+AXChb1cgp3ufPzTfxdFW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WAnJ24PsVvP6yDM9wwJuQSBy/v2vUcMycCKnAJTUDU=;
 b=LM7kGOIQg/KjRGEJ1Agr+G+RuzypxM5KeNZmBDUXXiUjnY6Ej3N8pZYpjMjxnbhlRpvp/9MJWZVOizdmK7Nu6y9Y2psQcwMP6C6H/plDQ8hz9vE8shZZY2oW4NgOPn6hK86QUlQDDCOkwxHUDnkPbQsYZYjZ/quH/bwsWFjKehQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:34 +0000
Message-ID: <87frye6qjl.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 06/24] media: platform: switch to use
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:34 +0000
X-ClientProxiedBy: TYCPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:1::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dec2bca-e365-454d-9b6e-08dc221a41c2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QUvn6SPWD0U6jmZLRflWWbzGS3WYzMEscgSk/prUiIl+/3BK6vAwXYjtZsLeS/La1H2mIjdTqUptJlP6tPPnFB2axdcUI/xEV1v5hnCIhjgDbbx/8yqEwbInbB6rF0T0kzE0ZvUP884Wrj4N83R52e9nWN5owslEagdQU7kz+7kTgz+QMK3eZvdaFIzEr/HLJb9kSdm1K1XkaUsu1KRIjKBqAMoxxAObkZxS21Ia9Ouh9+/8IqRFb+NF5bbSaiMfprfaQHcVA1YNjqfgUiHZEWIF7Taf4LEg6VfabPYEOeLwZjKvd/xIXLmoaJG3iFHZUvbaP17G76YWdYN2nitNj2kaFQ3Ftx/nhBpZBKWk7ppRX7Yypd3T8/ny4xxhy0OiBZzRhv3b29lSDK8oMbWRHotBXsF2ogaTSbR/kNTnSC1FIpjVf7jLhXxrc2tBkhkjX1p7J3iS1Rva4LrOU8VfNj5hdLSj8Y28Ty4ONigM8h9tPvif0i+9GakiCDRBAjT9oftYb5486zGYNhKAA3KGrmu6maag4ZY6Hgxl1stB5YVRz3WH5xg4NaXhtxVmk5ntpeYojx+UY7hUba/vajxlgbh125ZpAbUqcg5Am93S6QbNtqVkAJpdEiXmkWixufveSQCgVIJBZolAJWcmFZW+bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(83380400001)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9GQln4JK00UCbrA9Me1cgMnw6SwZZQM8fbz+B8ASMf03RSztnF0jmLjhF1O?=
 =?us-ascii?Q?YpiAVAhxZ24MPQYOGldIP5fWN/+cAGk2QwgrkyVtB44uNCo5Otwxhe3gSkpO?=
 =?us-ascii?Q?4c1rTIUh+gxyT1WZ1okqxMXdJQKiH6W642IPa5umyPvPmxyvp3clvnemErJu?=
 =?us-ascii?Q?Irzf517WATX5a80gnYiZA70RUNps3fPX0KojZFXWuUdVXX2R+dR3i8u47bkP?=
 =?us-ascii?Q?O7pjWGLfaqVydFqxl2+vSsZhPnXNEJpbeihxLUHeUdFylVnMkOhHZ15+Qf4e?=
 =?us-ascii?Q?97MUOLFke1TWpXyNGqptnbuTxYCI4muolrGv7eirtNVMngM+Z3DiZwVRNAYx?=
 =?us-ascii?Q?0wx/Ram3ojKMPHo2WX+TXbCsBLS/oPCWq3vRH0N1Iq2Bp2jrVN+OpbM1EEF7?=
 =?us-ascii?Q?+50Fao8gNtovU04qURqjdhmDsN9SK9sojiLn9bOUEtjV6S+6bXndFkELUdz4?=
 =?us-ascii?Q?AceZ8S2TD6U0K80NFWPFsyuHIEpccxZnUqn/kyVeIpgZXW0YWj4pRYRZmT9b?=
 =?us-ascii?Q?GZSxB7qIExnXvvwqnxi+F1QTlXSaNQOcQ8N5rhWF9TiWHap7AwtKlDRGRYs2?=
 =?us-ascii?Q?N1aZmEHR1BuAnVxtQhmdtbKGDm1DX8cSon6ZaPpTWOMGeyq339m+HAUbx76D?=
 =?us-ascii?Q?RgH1CPwol7xXD+VLXabFMtCFz/CPHHvCGCEY0pK8EFve52LOpesX6/GgwDi2?=
 =?us-ascii?Q?tgebPSOso2jBHodgoTbPnMjqt0l3foxChhBphxggzoE2LMg5cqmGqcO4U396?=
 =?us-ascii?Q?7J/Lax/SGdgMofqclBCLHq//xX9MOJPsULX6qsye5mGQK9uzyPyYkSL9p24+?=
 =?us-ascii?Q?J3ga5KCmDRCwj9kcBQgQcKRUfwNb9MLSqRPhTvO2almiuVtZ6/hW7Netn06T?=
 =?us-ascii?Q?mM+NddtiAZiqy0k+2rysHGnqjplGICHUaEaCsw8t+C5O5+yCOy1+fnV61w/r?=
 =?us-ascii?Q?3APgXfM80gACEEzaPNmOibVCaD143dPXfA1vdH3I5y7jhDlTbY5KJQPtAhne?=
 =?us-ascii?Q?d5JHt9K/85BY8bJRNTzWTespQ/GwCqpupU6k2MNJeqa9OV6qXseoyCPfXcEv?=
 =?us-ascii?Q?vWgvJasjzihwL47a3QLQ4Jz93MdHs54BfcIjFu7jYjV+oMxHkQCR48+fWs79?=
 =?us-ascii?Q?w6Hdw6C769UXgXiZVAhgDOa9GXhGLU4y3TTyk8D97YrRRvREaBZ021K/u1No?=
 =?us-ascii?Q?ljjQYE678VhKGuFfwXv2A+uwMaeBFsIm4snuZSHtwT2RVnLq1MaH7kCLHJnd?=
 =?us-ascii?Q?oAqjHp1GKTHcxwwg+DvMqBTwYcT2qqHOXy7Jo6zP4FmaVgRuSHS3+dfhz/0j?=
 =?us-ascii?Q?qH33YrF5BqIlcu656Xax4Co6lIEfb6uPvJQwFM589a7J6jxj9BVBJdjHPo5I?=
 =?us-ascii?Q?pPSHxUlRgP+Fj7cX0zKdQDYIz5hV4f14aDj+F7dj2dLzp67RaGBrAzOCUlQC?=
 =?us-ascii?Q?hvozo4++w3qKwqn6nCKW08HuFyrWzE855O/LrhlM7hQ7PktR/zVRLDSX6xsv?=
 =?us-ascii?Q?3dqBxz5cpOLLxIswO3ewPKtgs6keyq2l2diQZ8VkMPRefxWAtYNsoZ1cN3oo?=
 =?us-ascii?Q?Je22ARgWwIXZCbOuJR4jtqmxOPnfvM2E91BKWQnT1rQ0NHQg0nOqrjOkt3zF?=
 =?us-ascii?Q?0hqX/mx2bf/xWZvC5BmIyoo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dec2bca-e365-454d-9b6e-08dc221a41c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:34.8891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6n3qgKx3gUYcXtjdsEX3+D7Sv16vC6scHfUd7hh1xpwZcdmxpoLUwmVZZUuRzytBAEpEAdp+9BYhDbGyv7/LqAzfQEpKB/exv5pksbqOdhwt+u29gOuDVNz2vUgA04d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
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

of_graph_get_next_endpoint() is now renamed to
of_graph_get_next_device_endpoint(). Switch to it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/platform/atmel/atmel-isi.c                 | 4 ++--
 drivers/media/platform/intel/pxa_camera.c                | 2 +-
 drivers/media/platform/microchip/microchip-sama5d2-isc.c | 2 +-
 drivers/media/platform/microchip/microchip-sama7g5-isc.c | 2 +-
 drivers/media/platform/qcom/camss/camss.c                | 2 +-
 drivers/media/platform/renesas/renesas-ceu.c             | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c      | 2 +-
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c    | 2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c             | 4 ++--
 drivers/media/platform/ti/am437x/am437x-vpfe.c           | 2 +-
 drivers/media/platform/ti/davinci/vpif.c                 | 3 +--
 drivers/media/platform/ti/davinci/vpif_capture.c         | 3 +--
 drivers/media/platform/video-mux.c                       | 2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c              | 2 +-
 14 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 4046212d48b4..4317750d05ad 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -831,7 +831,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
 	isi->pdata.full_mode = 1;
 	isi->pdata.frate = ISI_CFG1_FRATE_CAPTURE_ALL;
 
-	np = of_graph_get_next_endpoint(np, NULL);
+	np = of_graph_get_next_device_endpoint(np, NULL);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -EINVAL;
@@ -1155,7 +1155,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 	struct device_node *ep;
 	int ret;
 
-	ep = of_graph_get_next_endpoint(isi->dev->of_node, NULL);
+	ep = of_graph_get_next_device_endpoint(isi->dev->of_node, NULL);
 	if (!ep)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 59b89e421dc2..f2175c03502b 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2207,7 +2207,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
 		pcdev->mclk = mclk_rate;
 	}
 
-	np = of_graph_get_next_endpoint(np, NULL);
+	np = of_graph_get_next_device_endpoint(np, NULL);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5ac149cf3647..201049c047b0 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -363,7 +363,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 	while (1) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
+		epn = of_graph_get_next_device_endpoint(np, epn);
 		if (!epn)
 			return 0;
 
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 73445f33d26b..b617a9bcd398 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -349,7 +349,7 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 	while (1) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
+		epn = of_graph_get_next_device_endpoint(np, epn);
 		if (!epn)
 			return 0;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8e78dd8d5961..cbb6f88cfe4a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1136,7 +1136,7 @@ static int camss_of_parse_ports(struct camss *camss)
 	struct device_node *remote = NULL;
 	int ret, num_subdevs = 0;
 
-	for_each_endpoint_of_node(dev->of_node, node) {
+	for_each_device_endpoint_of_node(dev->of_node, node) {
 		struct camss_async_subdev *csd;
 
 		if (!of_device_is_available(node))
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 2562b30acfb9..929d17de4ac9 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1526,7 +1526,7 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
 	int num_ep;
 	int ret;
 
-	num_ep = of_graph_get_endpoint_count(of);
+	num_ep = of_graph_get_device_endpoint_count(of);
 	if (!num_ep)
 		return -ENODEV;
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index a08c87ef6e2d..5ab0399b7718 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -175,7 +175,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 		return -EINVAL;
 	}
 
-	ep = of_graph_get_next_endpoint(node, NULL);
+	ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!ep)
 		return -ENXIO;
 
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 686ca8753ba2..a332b4bd76f2 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -728,7 +728,7 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
 				 &state->max_num_lanes))
 		return -EINVAL;
 
-	node = of_graph_get_next_endpoint(node, NULL);
+	node = of_graph_get_next_device_endpoint(node, NULL);
 	if (!node) {
 		dev_err(&pdev->dev, "No port node at %pOF\n",
 				pdev->dev.of_node);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 8cb4fdcae137..320101f4ad40 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1856,7 +1856,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 	struct device_node *ep;
 	int ret;
 
-	ep = of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
+	ep = of_graph_get_next_device_endpoint(dcmi->dev->of_node, NULL);
 	if (!ep) {
 		dev_err(dcmi->dev, "Failed to get next endpoint\n");
 		return -EINVAL;
@@ -1915,7 +1915,7 @@ static int dcmi_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
 
 	/* Get bus characteristics from devicetree */
-	np = of_graph_get_next_endpoint(np, NULL);
+	np = of_graph_get_next_device_endpoint(np, NULL);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -ENODEV;
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 5fa2ea9025d9..46876865ec6a 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2309,7 +2309,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		struct device_node *rem;
 
-		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
+		endpoint = of_graph_get_next_device_endpoint(dev->of_node, endpoint);
 		if (!endpoint)
 			break;
 
diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index 63cdfed37bc9..021ca79e832b 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -465,8 +465,7 @@ static int vpif_probe(struct platform_device *pdev)
 	 * so their devices need to be registered manually here
 	 * for their legacy platform_drivers to work.
 	 */
-	endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
-					      endpoint);
+	endpoint = of_graph_get_next_device_endpoint(pdev->dev.of_node, endpoint);
 	if (!endpoint)
 		return 0;
 	of_node_put(endpoint);
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 99fae8830c41..805c313b41dc 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1521,8 +1521,7 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 		unsigned int flags;
 		int err;
 
-		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
-						      endpoint);
+		endpoint = of_graph_get_next_device_endpoint(pdev->dev.of_node, endpoint);
 		if (!endpoint)
 			break;
 
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 5de6b6694f53..61d84ade7155 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -408,7 +408,7 @@ static int video_mux_probe(struct platform_device *pdev)
 	 * The largest numbered port is the output port. It determines
 	 * total number of pads.
 	 */
-	for_each_endpoint_of_node(np, ep) {
+	for_each_device_endpoint_of_node(np, ep) {
 		struct of_endpoint endpoint;
 
 		of_graph_parse_endpoint(ep, &endpoint);
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a73038..9230931d6d7a 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -207,7 +207,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 
 	while (1) {
 		/* Get the next endpoint and parse its link. */
-		ep = of_graph_get_next_endpoint(node, ep);
+		ep = of_graph_get_next_device_endpoint(node, ep);
 		if (ep == NULL)
 			break;
 
-- 
2.25.1

