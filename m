Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B688438B4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386EA113A60;
	Wed, 31 Jan 2024 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436E10E523;
 Wed, 31 Jan 2024 05:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdYOO1d+3C/EmVc3gF1O0/qzdQTRWp+MrzJI0gh46Rt/1fuGYZN2HIjtUs8feva4tDz/ZbiPF2pgzw5TildwQNo202/8zGbWMIxlwY5zhr8cNlWnyogCFezxS6xTvPwn4ELCn/WLi63OffX1vu5Sh/VZVcP8vLl3I8F3Q/ys8diglYw6FNVzNCRDtBvPGB2mB+gY+eQwxRZpr6m4BEGKXJytd7wZfezEvzx9NkXBiV8UlnfBG1Ber/9GpCblSCJ0EeQbrMwdVbYQscG2Y1bpFC27S5kL93QvFhDcRpzTEnAN50od79qH32bkCGqJReRkIkBeoSK0EIVKfXijl1x3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ta0A2ntUQAuHR9QKhOHXG9r8oJe01sAuOLLlkFhhVs=;
 b=VVku5e/W94/PBSq4/5RxZGsp7nPLKt5dRzN+TjuN5dnxssywvsx2NpEJ1YYpSzpORdkuwn+UJ2/iGIsdpmhRljY6VsAe5o5mWRdOkesz7QI3iDKtvFoo72SLpim3nkB/3RDH4eiD3ADJclU1tqfEgoH0Oc1T92MMZ9SSd3LBuUBPpkPSOkGrtkZy1K4uS5Vu39XvEYJdh4LLiTf7GSvOb/dpuTpTRA9VBcUp+D9/o4nFkA/JY/rYyelbwwXi81pMexifVGADxyuCKkgt9JIx2UGDbukVZAYbrLVaRy+E9jKGumXUQ8HJ8BNsDeVILTQlQqojiUlNRAPOkRfUc4N03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ta0A2ntUQAuHR9QKhOHXG9r8oJe01sAuOLLlkFhhVs=;
 b=o3RexiFHrD407F8W0bEKjytvl5sdxZuZqb4+4mrtvbaCzXOxT1twRVb4if0wAP8gC5NtnfD4Ry0BPN/s7H42L3IwM38u4iNRMnSH5uPxp364mX7IAfKLQ4t43X/xktlNODu8B8ms9pRuqLzELtQdAampmgsgk+cuZGxvOL8JYVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:06:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:06:52 +0000
Message-ID: <871q9y6qhg.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 16/24] media: xilinx-tpg: use of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:06:52 +0000
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: a045fda1-913b-4c29-8fa4-08dc221a702e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sc7A7rpLdIo9whqJZthZfxYfYVYcaunPpgJasbVCaKYE0algjBXiAf2UrKH2uNIke7lhVTew38VBTQ/+/cJ1Z9QoHaQDrGdR+IvkLmN0WRF3xUZ5Oy4bxalZz5rv47Fo76Osw2N1/7TqosEmF0scCN6MJ3qufOhIf47ZZ8hs0XGW5sQVVerw8PvMnjqkaiQ3aN9hCS7wyjSegrNZ4QU+gkAS+AKRryyN561v9mEk1V6QT6tlR4i+XhXFnIDQfIoY7Eoecrq23P4Yt+9vMhaVJIPrkoq0abnlfTaA0wlQU3wsEVwY3GKla43yg3rSsXpZP1FxAU4PUFrxZeFO9mpmn65S1LlahB3sJPUiyccFccaQ7ifb+1RVpkxZwr0DwYKawtBT6mP1cp7H6mMkziSZY+fz5ji0n3TBpZuFhkkE6CXBrVfRRAP6KxK8aFBEB3604PSNqkGZ1TwEjDKTOSL+1ncTWQbuRseqCdgYomeYzdH0mRWByTxr/uai0nHxBcft2Q+DinTbVCSnfw7e9d3ZYMOhybi2A3weAV3YYYdW+VNtdvlPOKWlX3ijR/qkxYP5rklATn02GuiUvMqYMB+MoRsH8+9Wie73AIq4GL+naghozT1n7MpaH8aQ3HpB0Iny
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(4744005)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3RInqMXpJSQMm3SaBmrrHpxbRQhQPU0I4x5Gz6RNMjaLqPQxQOH1QPkxCxNU?=
 =?us-ascii?Q?q4MQLeZhkM4bKrcUmgqCBoV7TjLWBsscTEI/aT9etuY6hXFPOFC1Q5enGS5s?=
 =?us-ascii?Q?ydfd+VVtvclqMgGVSLwmhqVwqk0RSZGzrugfEiqkixk5yhYO2EHgiEUYCIVK?=
 =?us-ascii?Q?IEIzq3UZkfXI9EoOJ8w2YpwJzKNyfac5jQ/i3wk1GCiGE1DesplTVbX/2f95?=
 =?us-ascii?Q?ely8Up8rF/plZDdafOOQPRXJ0hcYOtxfbKTOEJmCU6UgNiDATM69hR1SOq7a?=
 =?us-ascii?Q?PQEavAjPvKnkB4DnLfCT7jOu1YsxnTFECHSjY73Dh+1EsTwbT9c7KGb5RosF?=
 =?us-ascii?Q?0sgA32hT68Gm4HOEDft8zg8r50vFOiJeqEoan0ed+U56dT8Dro3xUJLBEWm6?=
 =?us-ascii?Q?JBkbevm9rtff/b+ZuRjukZZUsKBJE/wPmcmK6u1ddWlbMDG61XCQrv348D7L?=
 =?us-ascii?Q?UTtKmgqqqvIS9x7Hzj939CJfZj1V2SPujKjHPjKM2w+C0BjtqkIHnU/yHl9w?=
 =?us-ascii?Q?vfmqrzuHDznH9HxltkMQEh6K5k7ptirfwT3VCbZ5qeoXn8C50qFc30d16eSW?=
 =?us-ascii?Q?rGu4c1d4TJxjIVpCcro/KoJre90TQiXBgqxjBhJCiOIoahfBw4xUyQuvSaCj?=
 =?us-ascii?Q?vo+6AqbUAqy4u2d7eZrazADxsqO3Aq4a67EcUF2d/it9jA45WWbqjIc58Emp?=
 =?us-ascii?Q?fa/YTJLr8jc1J609IS9tS/POAK8F6KOQI8G48Vp968a24+HIaM7aagA/OBF0?=
 =?us-ascii?Q?YWGTjWKJ9HFMNaLISuTDHEJxRWKWyVV1S11GXVOxkidSVGSkKJ0GAmB4LIdU?=
 =?us-ascii?Q?mpt6W6GWFyKFAC3evr1kWtINn7u1E/19Hqps2h8Tsk2h2u6hWxGerCJwMzEj?=
 =?us-ascii?Q?rei38pbS+X1rGzO9T+eolOgmFMHzPTRnCl39PjLRCHpiiQ7MgArE+N/9ratj?=
 =?us-ascii?Q?ofamfE8eg+s2cjuUaoEWK78YVVgb8XLpNBwc8zjt3Wq8NtP+iySdA4K7vSqq?=
 =?us-ascii?Q?lAbneJyvYBM20hIuhss8n2LbEPMk7SD7MDcJlq3lD5TO8OCv7sxT8kDSVx0L?=
 =?us-ascii?Q?yNjndtjkREhFAzj+bOhS0pQM3xTl2DX8q2JVwCvqu0nMDHUoyS27/cncGFuH?=
 =?us-ascii?Q?GfTi4R/eHNJpCNGnomosQv1sSdgDv2/3YVY+yedC23V7NwEBBxLokoIn5sBX?=
 =?us-ascii?Q?hx2vgJm5w/R5yDjQf3O+82eZleLq/Ppay7j8Efg8WF0rGc5aMxAUGfbwubgQ?=
 =?us-ascii?Q?OoZCv0WKaF0S6FupvG6l2mUaxwSUyjeGk+wo7SnyA+0yumfsCSkgUEYhp5ze?=
 =?us-ascii?Q?W/WobS0vrpXOjGLI6Gd6QyHmi7QzQ1W6Yq+4Xgoh5VUdT/gx1Sbc9cE520ir?=
 =?us-ascii?Q?W2mDxvLhtCWoTN/GSXu4kn2iHbUrLk19qLCUt31RHkFcdsk+NEKPl3KF2lhg?=
 =?us-ascii?Q?17hy3W54sLSBY9dkAqAUSit6dm/LI5s+za+UbOu4y0xg6K6PH4cjkD2FYO3q?=
 =?us-ascii?Q?WlMW7C7XXYcrGliQArktYlCGFTEXQZY4+dPE7WasCQaWVS0RI+XSaawOx7TH?=
 =?us-ascii?Q?Mpaheb2feIi4XPEqTvIXOELz1C0szEGqefReFUZ9tXez+H/sh3jGeKoYfmkM?=
 =?us-ascii?Q?8Yz2HuAOvp8GF4pHVKI8c9E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a045fda1-913b-4c29-8fa4-08dc221a702e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:06:52.7338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnFk5UgbCxn6ZpxPseSE3ZzIFnqRJ+C3kKppzkclecSDJzVi5z6dIEO8nGPDP0Jw6R722r2UHRmQhwsVPsIoNZzBK1/jcy5lievViuCh7/o8eQ7O47D30i23NKQoWKoK
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
 drivers/media/platform/xilinx/xilinx-tpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 80353ca44402..53c4e1ddf867 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/xilinx-v4l2-controls.h>
 
@@ -745,7 +746,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_endpoint(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.25.1

