Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CE8438C1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F098113A6B;
	Wed, 31 Jan 2024 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCC410E523;
 Wed, 31 Jan 2024 05:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHvuYQ6BO92GSWJ2R8IhLxSfDuAHoFdE876CFvHiaBJCFKuiYz97vgJtDRtT1jornV2bT/FhAjG142Ij4qGIp/eii72z0PNpXEULTH4H2LWiH/K0CSL4016VChGBRBIJ2MERku6JSkPawl52KSdfpvn4THGSE+k2h0kojRVXXp1VYyJkVX0y7GU2GO5JwLKHSFiVh/fiidZmbJlBeSzjezxBWULVoBvTavwcSiqDXIS1jT3EK1JhBEp7ttwGB08oUbWdhfrPG8E9ofAc8UjvI2GOHFBoTsW4sN6FfYr9tBlWns2OFz6ZYA0oOlXPxdYzqKX4y9zir6oGFBhX5CM5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgYbbocFkaAShrcL0owjbp83TvFp0fVYCSDBvhuuSW0=;
 b=mvQ+3U0POpnHOPKYXgXhmMjGjt5S7RvVlOfjD4POK/7SX4IjlIIdsDE4te1EVSfLva6O+waaxX7aMhQ2hsVQxyocPcnX1NK6FxiWC+jWpRH9BYa5jOjxCrSDzonBDHRh4LPcdRN8KG+jh1h0OvIUlStgEKXPkSiqyrV6O8D7iouG6dQ32TedrVXDI0JQ2bBrKySxoaQ7MbxJIRb9ek8FGvQgISfDHv40OzXGtUYOFyoG+6/k+Jygge1dq9w/9dsDkjPt6pfYCc7d1LUgZ6JZJlJC3cISaF39gAzgMsLQP0QUcso/V9+qhODACo5dMlOL46Ypn0OpOKgzeH33NOY8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgYbbocFkaAShrcL0owjbp83TvFp0fVYCSDBvhuuSW0=;
 b=HfvF3xrlEY4NdJlQ9jQW29Jt3eWcQktIttNfhHAoAIpxUe3/vIFC+KOQ2SCrmTP14BWIsLieSuqXSw5zDTApXdaeh9/xC09eCTnPSa2cW29Q8hmBDekM2b2voEVtUeEiD0KF3GYGWe1yVN5hc/H5bY4izBEhug+zG8N/KfOTygM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:06:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:06:44 +0000
Message-ID: <8734ue6qho.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 15/24] drm: omapdrm: use of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:06:44 +0000
X-ClientProxiedBy: TYCP286CA0124.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3981d3-752f-4c5d-dc3c-08dc221a6b62
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pnfbZdptg3pmLFt6rl282xRnJKqP9SMxQcJh2myX5YBk72b+7+Y5DVtLh+ZwDhyb0Z0vJjH3zJANB64DgqRo9qTMVP0GMuZ6LowMGLHH3TZ7886NBtqLHmqot6icZCz8u69Xc9899wyriR7VQJazFjzFfE7OYu+W8l0GQmnxXZ+rkr/zeFVZkGj/l+xgJv017NjK4ul+9veWxeltuJYC5ii33VvjGChWIFIwT4Rr0P7hGRRBdYjJpEXY5mdxFlCKhhxLQEj4A89ptkQ9CEoUzJU1MuU0VYQbeG1uKQkc/e6kydvp9ZC3e/jO5xoRfwEoyAR99tL1dseefNYIACgMjW14eRUPOp7udrp+m918xhyHVRPsKa/VN52mT/fBYNVqE4CxpcMUBOso5ZV7CFPHq8pkhAnGrO4uoemK7+TP6JQYv9qof/bwFZ9WfoofhzF3GCXHdjm1UeQ2ZVZm7zyp+ZR4VZtLt7tkp6Xs4J5cLjFioNv7qpCyvortbXL8BOZRaf/XUVetyJfPp7J/OXwKuFUZDfuY6Y9BSyJ0N0wgevWjATWZq87o1wbjLjHTfMH75n81N0pKm/KsxiXRg5iMb62YIQmF1uaz55JCoAlsEBUmQvCX6XAsSf+0bhaIzv2VaGLce67Ngu3kVOOopTyQeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFcBt/Pgcv7LuaQKjju85tTxT67dsJoHh5ptW/67AIE9N14UgNVfJ+VRTg92?=
 =?us-ascii?Q?Z+DEoLvmLGpK/BhkvLynwq9lPupgQu+IbANUl+8RpvbH9I/SBtUGMloG6ZwB?=
 =?us-ascii?Q?yd0O2ADSqaC0TWKXWgNAX9tscom2H2buSsdxrfaLQecmVONdQaxPwuNngai2?=
 =?us-ascii?Q?q/X7T3ZTiTfKfkxPO/SywArudorsgAHDD3Qik2Q2GtIbecDzMvFaEGTw4AqU?=
 =?us-ascii?Q?mrawmCbGjHx4QuNZJ1Qjho7vB9SXP0IRlhsh8ypT1hznBzdNEgxpImltJ59E?=
 =?us-ascii?Q?47ZUq81xFjoh+HaZy09WUSU3mgi7cOyQBFLov5HYy1IW0iaUL3nR0wIzdjQs?=
 =?us-ascii?Q?KJTHicGhRvMT8pO7mmSefX64Aw8buPjgM6MLHw1vhvmgYlOlcpVCcMibg5Sr?=
 =?us-ascii?Q?0uzC2HBi0XCUVMczWd+wh7T57vg7A+IAvA6+ZiTS1eHAzlu+dECjdNrkUTau?=
 =?us-ascii?Q?ReBSXbV3WknCOe61sKjkPRmHKJ+CIszOZQl2VQZbpbv6AvI9eUnAMvZLhV7X?=
 =?us-ascii?Q?77LDtrTnyFymDwqfLedsG/miLiE5RpHWzyfiZtSVrqa7zvMTwPfAwsu6+nAE?=
 =?us-ascii?Q?JNh0T+8ihwt403WQLMymEQ7IaIwTJ9BE9Wq1p3Qz1Wt2h6a1MWfKZ2HvE3Ac?=
 =?us-ascii?Q?Nj9N5GYu/2dHtOMNQLuFFdo27UbG6OIUAt6R8KDGCqrvRLaaqXF155c3qujC?=
 =?us-ascii?Q?vIBwyBPwBQFOiYZN9JsRPJbHkez4ANAHn4yMSCDFTAQNlkxhoCjOfexE1k28?=
 =?us-ascii?Q?qPGiodSELOevqH1MiNPX4Ei0Au7GIZH0jInK8Y6m9+OeEPRP0bL83OZxE71S?=
 =?us-ascii?Q?iya5uSZqUqWNwA+lGcZ6l5zLlyhJPP1AKAPXEVnCaQBllvAi8zrNQWC+u5+L?=
 =?us-ascii?Q?tfnBgZzaX0GuOmlW1pZvGwhq5w9C6h31UU1P2F4mSxt7IMdhYf+cEf1wWrBO?=
 =?us-ascii?Q?TA1RGh3eT8a1L7Z/PejLFyY2g4gCFsZN2ISpT/o5qzQKma2w9hL1bjS4uneY?=
 =?us-ascii?Q?/LfQwo5qzFdIF5p3Q913dDy+x8jD+j3q1yamqvL/QqkKEzynoMGlVXXA05Vr?=
 =?us-ascii?Q?vQ+13AAL3zhNsL4rG/m74hBUveyTNMQ4wB+dCSEjXbzc1gJr2Xr+vafEJsVy?=
 =?us-ascii?Q?13M/BPuNcxiFMqRI/AdF7r2TV/NeS13aVpHljJ5gp6QN5UgPbTM0FI7HKaIh?=
 =?us-ascii?Q?dstJHp9B69TORO3TOauT/od1+g3ERc4Or6Qgx1/Exac0w7qYS+GwcJPBXI1p?=
 =?us-ascii?Q?g68ROSEm8Yw/SocGBAksWpWcmQPVvQ8XBlI7hFG0cDmGDSgJwBr9neJiHTIb?=
 =?us-ascii?Q?fPtjp7TvOqNRuMB+YHX3Kv662r7/KkVOdVdsApu6diJWBK9BZQfqR9Qg0a6P?=
 =?us-ascii?Q?nfo7ovpE2y0Wx2DAfKF9vDILvQ7t7fUUuVBwQhCzJ8+SsPm6qb76o3o5Fo4P?=
 =?us-ascii?Q?7hx2GVaifACUV+s4cpnC5vYpCEwa1wSoSph/PkyMkLJ061HUKPJ17WfLAwoK?=
 =?us-ascii?Q?/UfBREx1vZFHpMsitSLjNLrI9iSC6vczRaoeKKJRYFrj3A4ccwe86Vkezi9U?=
 =?us-ascii?Q?286OAAHplx4pGqj4J8xeGATje1xnnA0kwZJJPJrYyAa6ZI3oEzdAJESagNZA?=
 =?us-ascii?Q?CFiQV3nQ++1ENl2c8Bb0K8U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3981d3-752f-4c5d-dc3c-08dc221a6b62
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:06:44.6975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB6DGeM6sp9iLOozMTLlMV3HSMCD68gO5N/gaFGGozp5t/U0uYoC2/aXIYUl76AYTG3QB4PM+GrXewigb5SsjSOGEr33v2Yr1Jrsjq9XkkafRWi2d+XYarLpTPZ1AhL2
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

We can now use of_graph_get_next_endpoint(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 2 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd0..74d240aa35a6 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -709,7 +709,7 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b9481..6155e99e64f6 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -346,7 +346,7 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!sdi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_endpoint(port, NULL);
 	if (!ep) {
 		r = 0;
 		goto err_free;
-- 
2.25.1

