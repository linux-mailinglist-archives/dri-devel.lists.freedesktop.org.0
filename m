Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FEE8438CC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C39D113A92;
	Wed, 31 Jan 2024 08:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94C710E523;
 Wed, 31 Jan 2024 05:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIUQxooz/0phICHf/CAgbX2IdEZs6wuahoLZ41iS6hmwRSLb4+I9LQNuTx1btX4Y8U57t+3YvQXPGOGZxCFrkHrK4TySHRsAfVzWblPIh1bWh43cYPyeOqb4inQ5eIb8QqvHZmufaInpV1y5g57KnxsjO/aiLOF21Lqkn1XsxI8BPjn/yQpspKFMx2VUj5KzJ4Som35aPeBae1WcCM7Sl89f+AWZF/yYMl0YBnF/i7PYTTl/caU5Oi4yVhIqBhqFzBr31jtKn7iHcah7cjQXFWP1SAfTLpEuYcc/rWBKBqkDb5GzWej0dLj4qnXX/oBik5VDTaQy7Zns7kum6emZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyAWeDQtzFwmopVZQNQsQtx3+kvKybMD30VLEmXTtZc=;
 b=ggh95ulVgMK3NEiM5IxaBaxTWp0sAWHt1Z9AC1i4tebwlA2xZIXai3pSAbc9p5w8iTYJmITvuOI81kU0IsyQps96hlOdnBJqoJGPQd+H2Yr3PSD0Q6HRd75V4xX8ff94cyIi6rC1kro4hvfX5zinG7lN/ZPjIrX8yKxOchrVgwvKPaRiHsOr89v25vETZ4j+8O8Ga2YRDCy9N8/uXKNp8W6eEYo2sGnzjRFLHzH11yL1M5qUBT56aXKevSbbKikk2vT59GHYYqGaknk6V+iG8Skk/6JQtnA0qZBxrzrfsKBHAhkDASmDfDmzsOpgvk/BrST3J2kyYM/IyqNbPbNwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyAWeDQtzFwmopVZQNQsQtx3+kvKybMD30VLEmXTtZc=;
 b=erSIDpDh2nK3gD1WZltk0TvCOOvKYCwVSANi1MxKqUTVK8jKVpkQ4Y51+bXu/Px3y9ocuR/A6n+o4zR1TMPS30+jYvawIaDT4hd1uCF1es4aY+b+GMsHVrYI7LO2v+Af28iMl5ubB29WtWwC95qt3wVbjmYRW83e8t/6lTCpDu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9898.jpnprd01.prod.outlook.com
 (2603:1096:604:1ee::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:59 +0000
Message-ID: <87plxi5bv5.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 24/24] fbdev: omapfb: use
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:07:58 +0000
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: f15ae8b8-e42e-40b1-c384-08dc221a97ef
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0giXZWzRFJLq+uyPUeyKckz7wym2Ah95d74QE2lMbvj0og8O3SumsBQsjBvyGu00G0pmc+NrEHf8sTet5IfLvD6pzFLMxRbV8NUqli80H2g8FCcFzNBT+1bngsAtDiEqGGsGADBekPMcDptY8mgnYFRdFPCc73xfelbniqDCIQyFZlGgKV0/8QgIEes26Evel9mhftUmZaQhTzTl4JiB/sD38iy7/j4g8RSEjWx4JR5bMzD+3JcLfGKUJw8dJTvLYiisQmKKlxuRyane1GKLyVyOEf9FvQLsQstHvP1vZeeOWhjYY5scEf44UiSFsbIG3vPgcd9lvrvyczssfVjj9qK4m/VMmyrO/g89QoGvwMNUUlyYqnho/g0yyBsTM3OjTff/LMY6G+ZYBuWnIIAhk2NjmitJSPuJVbQNfJhCzr+Zwi2pPj4ywcp6RV4PyvYy1LC+hcjJHIYITFRwjr3Jj8eh206j6EGyVep3wxVVrZzPPQt8RAjVhMLS1ZmGacwq0UQ+Y46eEbjOXiJQn7JjxEc1aWhliSLEU5WXzbV4hNK92JjLUBv8pDCsjNECBgzZDrf2kov/mVqr6VL0wfhd7ba8xDBpF9MmnF4VLn8owlM9sNNu9Ozqz3CmzKKhJf/TP2HRhuiyZA8yKaaAlr930/rmQ8krQhi/EPYv0+HQTU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(1191002)(6486002)(38100700002)(2906002)(86362001)(41300700001)(36756003)(7276002)(7336002)(7366002)(7406005)(316002)(66946007)(6506007)(6512007)(66556008)(66476007)(54906003)(52116002)(110136005)(478600001)(7416002)(83380400001)(5660300002)(8936002)(26005)(8676002)(4326008)(2616005)(38350700005)(921011)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GPCz3s2RqpvhCRf59GReNT+2Fc0mi86ShKZRPVe8DY3gahiPN0sLxpaGKVtT?=
 =?us-ascii?Q?pUQTUxnTIvQNJCCMLeCcgpb3jI6zwXjKHte8QEZOPLjTqhzxoxB0xIFAS/qc?=
 =?us-ascii?Q?onUCzv0nZdZGJB7YabKmVHFTq+y9g4H1WMfQMuFE/GK/Ji4EUapptOUt/XvI?=
 =?us-ascii?Q?Ja3j22gwYaYUnS9h51i9NPjkRJ8dmvi2s6WeSTCZBUmJjcLOdLvX4Le5ra1m?=
 =?us-ascii?Q?Ym8lu1QKM+5onPul01OlTaKtW50qUj17rSvLGsmECNKXptdaKOlqipbm8Rul?=
 =?us-ascii?Q?/7YyxSkfzmr5iB1i5fuheKJzDlauWkYB/+7EwRNhjcj3NvLmt5TCKrxwW8mb?=
 =?us-ascii?Q?WKdnkEh0X3133q0p/xwESSNprw9m8vSPEjYPz2A7jYfu6/s5vo81o6ZJwZRu?=
 =?us-ascii?Q?qwUjhA1cT+nn3jzZ1iE/K6dWYQd1RhlJ6X20SUy1oQtOgpwJeTE+mjrwLAR0?=
 =?us-ascii?Q?ZJj44g9/i5PGCNIL9Ys9oAq8UaFNItnh2edHcb8SQRTyGGxkYIOE45xflusA?=
 =?us-ascii?Q?znmXYoh0zVwldM5NfvgCKjReCIJF2YarLdu19kePIg7/4K+by4zEHBrHmzV3?=
 =?us-ascii?Q?GuBlKMt4jLGgMx0HVpO1TKetIGwzn+a31N4pBhBv+MXeyO70XT4atX71MJC1?=
 =?us-ascii?Q?54vK4YvngQNyOMcR1mHhwNKyf4F4os+wrRT6EDiQDbeC5p+NcQhg4xTMIiin?=
 =?us-ascii?Q?bAUTmL59iSNAKhYFcGLMftgIgG4d57QHpMvj+/16/HsqYMqocHnUzWZcqkIR?=
 =?us-ascii?Q?VeYoTfqsXtpIK5t6aX2yQOyfDtt4wyFkx8oISLz/wniJnBFQy+X5+Y9eaTLy?=
 =?us-ascii?Q?7Urp8WIpXhMJ15EJ0EKimunbJHxUmfLEF9opiEKrJarH2d3J/GgQy2VcuvGj?=
 =?us-ascii?Q?DL/V5N5BsGCku1U8H0gY3b2qfGqBHzHoPqiit8SdJdD83eyarlHCfaAxoNTc?=
 =?us-ascii?Q?3tiIo4+rj4dvm3gxRhq6rot3w6xIpugLsoq+GciK2Cr+Qi1HyJvhd5nSaC7+?=
 =?us-ascii?Q?V37SwuN4DMpNMNSnQls3FjRuvYg2rHawY9W58X/dYFZND6KDHE4Odm4jRBFk?=
 =?us-ascii?Q?PXQMIiZ3RAVFTZQEfYSckm7oAAssp/IMGNBnJrznyGEDhIbl25h28nyswLHA?=
 =?us-ascii?Q?BPcKXNVm3wLbIWcxbcUsse8HJAxPCF55vGDZhsGs400Lq6iqtwZhXt+m9AmA?=
 =?us-ascii?Q?2XnDYotqx/KZtg+WRzNtJfnJnp3PRcqs/9XEDuBP/Wvw/zndC/V5T6OTkUar?=
 =?us-ascii?Q?rQD8lHs5Cd7BQD1z3dyy7u3It8I68JsPAKLF6qMM2u54YPXg8DUYqdPrMBdx?=
 =?us-ascii?Q?d6AfoLCP0Iu8A7Tkm5zS+SNQElvyyB17jYkMOeCeicJL/RztIMnY92EOvlJW?=
 =?us-ascii?Q?ny6dhZ9RY6in23DFbs/tMLHJfT1036J3fE9a4uEg3f5qsaN2S/h1n59ZR9zo?=
 =?us-ascii?Q?NeCvEpF8hWxCUoVKvgNRLFddpHdwEAd0wxlzGFNAL/299mH9Cl0vBvJWrDhW?=
 =?us-ascii?Q?mZgHuWKLZsI7YCH3wdUIxxyLph71OmpJkYD2OVD7fT5cAcym35FG6axHWCIg?=
 =?us-ascii?Q?EHOQoAUV4prIso3QWLW9xaReeL2qOUSCpunTz0IHndLgPL/X/zUQLuEdPdEf?=
 =?us-ascii?Q?DZOg58qTnKE15boGOQW4J9U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15ae8b8-e42e-40b1-c384-08dc221a97ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:59.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNhtL0A1owiOuZG6CVniNsAHP06lnAgzqqyxhI8jCRUV6IWvhRSGO36+VstHI/Y78k/KxBCjJ76umLy9QmXp09dXnVHPoK8F5t8bgQar6iWSh7cVQw6mcBIen+PpUfzw
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

omapdss_of_get_first_endpoint() is same as
of_graph_get_next_device_endpoint(xxx, NULL). Replcase it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 include/video/omapfb_dss.h                    |  3 ---
 6 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index b7eb17a16ec4..4d503aa824d3 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -28,6 +28,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>
 
@@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	struct omap_dsi_pin_config pin_cfg;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 2ba2554055fc..130bbe4813be 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -51,24 +51,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent)
-{
-	struct device_node *port, *ep;
-
-	port = of_graph_get_next_port(parent, NULL);
-
-	if (!port)
-		return NULL;
-
-	ep = of_graph_get_next_endpoint(port, NULL);
-
-	of_node_put(port);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -76,7 +58,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	struct device_node *src_port;
 	struct omap_dss_device *src;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index f05b4e35a842..3a7d612c8feb 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index 03292945b1d4..db01ac3ea387 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index c9d40e28a06f..4dcc3f2a2aec 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
 	u32 channels;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index fc106aaa75bf..d133190e3143 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,9 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
-- 
2.25.1

