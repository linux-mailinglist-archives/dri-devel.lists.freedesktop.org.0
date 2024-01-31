Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363F08438B6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B973E113A62;
	Wed, 31 Jan 2024 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A89D10E523;
 Wed, 31 Jan 2024 05:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVPZRKUYO99AKmtmZIANdYYT8ltWAnAah/BTC/FEIXpNeo+wM5+kxbfJl0G1IIbIIxAEtKiLZnOOu5moLpGkbd1wB6rZKu36nG9IhH36+nBTjFvfl85kLyg9N7ap4mvBCRGs/ggdds+kygnAcXelrtp/viI719T8+Jc/zs9omQ187YkuyV6LU0YxNZeCmZ2jTmV517cfTfr3+n8rz2pEB3Wcwlau4I3Fj1upthh2O7lgiJodDv/opystE43HwbNp0QL0QsA0PiTYFT3LY4UC3AFWbdKpeSziTB+z5fphCp1tiPESnpzaPBoGQ1SioYCYKC4uxt+eCGv18yqORsxKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6ZlktUf1jDk5RZKbRdLLZaC+trhnnw0tE4uuwMD11Q=;
 b=mZ4CRupanCIjfGpzpiI3eIKzejmlErapcCttA+NTckWXm38uUKRG83Ng5v1c1IHAeULSvijUdmbIackZ/fWtz/y52UOokDINJkjeRmITIz3heutiX8GPPeHFsGrTxLQit5nKdLpCbzb9jZGszUSIALl8Q7U+dpo/JX5tDsmMEa6Lzu2OZHSModSN+lWfBmc5rNkx2rHIXm6Gjoa5glV4d0U56b0BacuA4mIYnalTHi15FybvwIA4fyDFqkj9VP49fwT9khuFy7Yo4c+q0lffwUYle62ILWvQsIoQiR/bc7LbtIj6R6lHGy0k/wCVNWOIjzqjSk5fohWqGgWS78shsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6ZlktUf1jDk5RZKbRdLLZaC+trhnnw0tE4uuwMD11Q=;
 b=n2K2AHMf11JTWdwOp+L8dYAIIdNJACKGtiv19U6ZoOmf0TEUv0muh07JOvSm4QdRbAKXOm/f8o91s6bqck1KeHoI/R1YHTTIa+S0EAHkngxwbnNgekT4OxKcuS/p2QQk+ciRCe60Bm79iomwi9TNOKHplatU93cBA8PHt6iLxgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9898.jpnprd01.prod.outlook.com
 (2603:1096:604:1ee::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:46 +0000
Message-ID: <87r0hy5bvi.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 23/24] fbdev: omapfb: use of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:07:45 +0000
X-ClientProxiedBy: TYAPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 1609f5e0-ef84-41eb-7a55-08dc221a8ff6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEBropksgC+ToszikgowGNYh8MKcu+RszgOm0rTn0Bb/ElC0vVIKiDuZySbQN6/Znm3lW+x8barQ5lVdCLsEFhHv85XSiXKRSMMgyivkLf7vFHayIuwKir1yttzFbydr/y3xIUNTrYwAdY8bO2uKVUJMwHoyyp8BhrU/3yEvTs+odP+b5aWjWnbP/rpfjtoUvK7BaP+Doq7Yelchlg6O5KOMv5t9m2SnR1I8DMRr1oaCEhmFqZyW0PR5xnr5WmUw9ieiFH0XpLX9LuparWyNArJlBZo2CWQxOqLGkMmYUXJzImB6pywom/rx6SU8K8P+6SOQ75axWijYUxVsyhbXVvcw+z/HNkW5q1etsqD42LIX9kFyvxjNx62yreeN/83mLMpi9lSbHpTuhOuwLhVM0cnltXeImw7XdwOtAg0Jz/5nuIN3QQ0pA9P1dbluYWhWMB107vupctzI9FlO2EHrFfADXs7EYHkg20ax6vChmOs0hvnmnt1UhejBpOqMUHAhrOsnfReGt6uS9NPnkoCIpSFROtNNKB3eHIr07CILTv4Q0nQPwMjCzXvTN/AvlYapBncInNyUduhw7T/zaF4vyY1ppOqb+soSlYSQ7j3sgCx5a0PdcUVzar9vxpW4Mg4Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(1191002)(6486002)(38100700002)(2906002)(86362001)(41300700001)(36756003)(7276002)(7336002)(7366002)(7406005)(316002)(66946007)(6506007)(6512007)(66556008)(66476007)(54906003)(52116002)(110136005)(478600001)(7416002)(83380400001)(5660300002)(8936002)(26005)(8676002)(4326008)(2616005)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BUSZpvfCNfHW4ny2/osA+aiwnLA4qxIqD+1Zx9Fc4ogyf0/Skoi0MsR7T0NW?=
 =?us-ascii?Q?FPS8eszjMZy5LXcGT/+sv1dAZ9oCJklGM1f5mUTsOTbEiwfde6OkfV+C/bGV?=
 =?us-ascii?Q?tqJj8JD2N3XcFfpbkF2/HFGCX4WRFOSLsMw2w90Y9NQS7fSi0ISBUk3Gfc5g?=
 =?us-ascii?Q?iWOPaC0fTSBW76xqnWUMVhkjeJ54O34sCAMM4gbBRGoT/CwoQcjs7HGxvmpc?=
 =?us-ascii?Q?f+ZFkx0r96kx7BrvAViLTdJROfFnRsZU0uY7QJv+r1XrugEDaOy78PbTqJf5?=
 =?us-ascii?Q?TY7NRWLVN/mnZFHZWZ1yDR5KmnPjTP6cMqtPt/sjlVewDXDvzEdg1F7SJezQ?=
 =?us-ascii?Q?21RzxQSYThwWT+lutXsbtsv+q2HNc94d6a/nNqydYfjMIB2P4rYFwbJhZXnS?=
 =?us-ascii?Q?MPR3yNRV/Py1e02GvWCL92l7PbQWKvNhpliOaIyV5mG+uUV6tAwGkfG19oYs?=
 =?us-ascii?Q?AV1CUu9R2Pubu32UAfN9ZsIuLJ9xFN/B6W+W+Jtv6MBjLNaKqTobFZIjEEdi?=
 =?us-ascii?Q?wQW6pEQYwCdrOjT/okm7u8+47ZQYTDjp/9d9LcMddPdnARz+K1j+91aMG9V3?=
 =?us-ascii?Q?UJpm8T8M+5C8gPutUFwgSPdV3z/Glf6xPREjOzQanv8WzpFeSNWnqiEpVFs0?=
 =?us-ascii?Q?AQ8/tgyF4uHvshMJ5W893cBXjCD5vVIrgEJfsM9TFvo9OpnF8eqo3oMf2LQq?=
 =?us-ascii?Q?2bRZu9TvFeUQkoqsZlKSrxnD82jZUpNxGNzYMXdiT7F70tIv83T1lS8WXQZv?=
 =?us-ascii?Q?wMqFPQQZWdFqM8O2ItBHyxsNsajfx0TM3MOLfPVXUYRWzEJQYpQK/bq1hwRV?=
 =?us-ascii?Q?R2tofp35mix6Zse+8JhNvJrWBJ0XijFEEkifsqInK0LOtujXyUqivyYGPb6X?=
 =?us-ascii?Q?LGxZk0KYRZkF7rXvR0uDiuGDUpK392RcrqjmUxVZNYl5olB0LEEoieNroHgi?=
 =?us-ascii?Q?NGBAy7aRlTVHsehB8GdhBelRNCSol7VPalMtqepQB90EJ5ombLiEThVB6rVm?=
 =?us-ascii?Q?ClQCw7gKJfxza6Qz5dbhmVtag+g7QvqjAjdi/wSSFczYmbw719FiOcWsFxV6?=
 =?us-ascii?Q?85h1YDEdNEs/GIk3ZKN22qwhUGwI1sL/IPYgR/y7+Je0ihSPREjj7mo1f944?=
 =?us-ascii?Q?QSS0SowLt4aUP0kJ2wmdoeJ32DeBEn2DfuU+3WeryV0NNfLwbKkw0sGcdVNF?=
 =?us-ascii?Q?nkvjgTq9ZFvVpjo8tHLOyWJPRGe8iafaZhK4AnPD5YoyJGZQkCW0GW1QFSHZ?=
 =?us-ascii?Q?VTwyandd2SjRUZGfJgrzoJDj6yKGaEJwZAVvq+yQUWHmyz0A4ciOsfToI8K6?=
 =?us-ascii?Q?XHAfi+aBVGWCYw+zaupoVWonrT5uCK658KyDNdSMS7WX5NR2rUTEwjPNjfHd?=
 =?us-ascii?Q?FuHjn1V776oMj1AUXA4g2NHc8ODYGXtuxOwqf2CTgkyvfsb29D1saiDZ/CTz?=
 =?us-ascii?Q?lzHxHQ0XEOuxPoyVEUNYZnS07CKvRVDEYzTS/EzdGf1ASlBY36SYan2AFJbR?=
 =?us-ascii?Q?xyHfn9fvFtu5glu8w7XVQsyvLrhMWG+rpGQV1m05yDS9HkHqCbQkiUxlJiJU?=
 =?us-ascii?Q?FBxWnTBXxHpb11njT2UC16XaPJ7TrLzVI1A+wPB55qlGkKajFaVbSmtTgjlY?=
 =?us-ascii?Q?mADk6tOd2fw1hyLGW5ozK0M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1609f5e0-ef84-41eb-7a55-08dc221a8ff6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:46.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmOTx73FDNJRbhpZSuNql1dQBcLVBtC2+ukXakR2vdpKa2ufFw2/22XTxddH7uy/8une5NcVH6XoYvnRLVR6UT66r/755tdRWWys0pyRKL1Ghm9i4pWt6V0RjHP6Sqih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9898
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
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 22 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 ++-
 include/video/omapfb_dss.h                    |  4 ----
 4 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389a..d018ee755cf4 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -20,6 +20,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 
@@ -845,7 +846,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 321ae18f2747..2ba2554055fc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,26 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev)
-{
-	struct device_node *ep = NULL;
-
-	if (!parent)
-		return NULL;
-
-	do {
-		ep = of_get_next_child(parent, prev);
-		if (!ep)
-			return NULL;
-		prev = ep;
-	} while (!of_node_name_eq(ep, "endpoint"));
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
-
 struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 {
 	struct device_node *np;
@@ -81,7 +61,7 @@ omapdss_of_get_first_endpoint(const struct device_node *parent)
 	if (!port)
 		return NULL;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint(port, NULL);
 
 	of_node_put(port);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b16..e92d84c9474c 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -405,7 +406,7 @@ int sdi_init_port(struct platform_device *pdev, struct device_node *port)
 	u32 datapairs;
 	int r;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index 426d12881132..fc106aaa75bf 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,10 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev);
-
 struct device_node *
 omapdss_of_get_first_endpoint(const struct device_node *parent);
 
-- 
2.25.1

