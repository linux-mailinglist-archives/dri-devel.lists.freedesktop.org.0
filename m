Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F68438C8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD62113A75;
	Wed, 31 Jan 2024 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DC010E4B2;
 Wed, 31 Jan 2024 05:07:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUhJjdOnwk3unYVdPHwcBajpCNyaJ/0V5IuHb6EmQ0JUrvAFXnzBl6z2zJVTZtsUx02mmQTWk1cB2ZUy9woDskkQi9zo+kSN3Czs50rnr0wTyr3mxwtpm5kAf9kjLOHYqSbSdfC5ZCh9fJQ5aeeIMTptdla8NDOPQ14kBURmbY6TZqCj6erWJpjJ40xoiNxMzKjW4CzjRSGLReBwsweoe70or/d0+RknNgZTMk2BxM7SeY0/zLZmiC74o2g5bIH8QNc5jLeRTigcSRU/BHCP6rvFf1QbLpP5FIJlPoWYAHLn/vLN6WyDwyeVRpUMxTTMCNYnh+35ceQ3g1O2p36WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNEaIoQLpGIfnMzNLqcLx8ijdirPxa0MJWKKLJuDDxk=;
 b=RMwUhaelB6jJcntZ8d5qFvJF4A9K0UMWLc1eJAblNSyjvrX2mbwri875bflTee5ixVSEk/ms3Tr2pXxOSCxiTU/9IT5Vg4g6TcWCEBvu8Znt01oUeQsq4QAwZgXHE1cHBJn4X5p1n9rLxKyrH+EAU7Cb5x1k1jZGECyNAcm3FolIwXWyNylY9AP/yyU/HMqhBdj30hCHkY22FcGn3hqWcRtdtdY4/vQ5g3Cuvg/w10oGl7jBiu4YowWqome2zz1sO9FnzjU7LfzZYc1wp8W9tURL23Xs8PoMh/W0P2zC6FCV3AcWD9UW/tJLWgjuxaCyyqJrxOyHGHfgPg04tN+IZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNEaIoQLpGIfnMzNLqcLx8ijdirPxa0MJWKKLJuDDxk=;
 b=fnnQNUqq2RvgOyNPJ+d8MGaFsvQI8KQPaoXzf++pIPqOVUsbSGYzvO481hcTNXeVFBHw7hJVZXIxBd5pOzeDEoVBqIncDwy6eYNGthaGJZDgze0LOnbC6NHkMKROgVRGwsnV1uqPuEFCWdXZGFX5zICVjlOlZ+h4/gwpu4SUQHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9898.jpnprd01.prod.outlook.com
 (2603:1096:604:1ee::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:07:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:07:23 +0000
Message-ID: <87v87a5bw6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 20/24] ASoC: test-component: use for_each_port_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:07:21 +0000
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 001eaa4d-3e97-4e8a-84b4-08dc221a81c1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 783mspbfgVm2Y9hEyoL+FI/OACX6TaHVxhysjBixhA8fZKW46132Bws9jWqHIRxwVFIrUarhwkNZm8Kbg4so9mQHy5t3D07GsQ1IdlMu1H/1QXfcwlaQzFdROwqMeFpO3VlEdHaG0c4DQ1vZlMR5XC/sFtf2g8ZkdXsGurCEVa5GUAZML7NjgddJpcMzWClGbCZ7hqQ1wqWaVaBkZ5YuKSjSgKivICRSYsp8/phsTVjRqxRMpGK6sTWd7rW/QaBdxXIcNkFg7Po7I4uwJwkSKVwKkChDCvAfKd2u+wU7M3em1Cr+s+JytGUsPe6sJ13qvf8vjEj1WfkYUxGKtw8DD7QK0GVaBJVbv5EQ3l2+0zezKaYcFOsXAb/F71BVnSYUDMPb0uYdY7LxgNZ3Ys9ZqDzrZvQUtjPhyhXA1+qCGpT78xAhdc0wC0+5x+M0bMZwG9bGSxbFSVkWHhirCHxYegjKH5CXhPpTi8Hq1KAZ4as2OOp5JgC32Psegtap+3Tay1oyyDd2iC5gv8xa16iZIh8Whs15ZPbx+9Bdqm8mavMhJWOwyhbLO6o/7hpmAsD6tTgKaglxqVdlmEJhMgD14+hki3vLSkwsstzQv4UXvWAvyCGFgdbxeQa9JipcfmUNw3xXwyhq0eCreq42I1cfGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(1191002)(6486002)(38100700002)(4744005)(2906002)(86362001)(41300700001)(36756003)(7276002)(7336002)(7366002)(7406005)(316002)(66946007)(6506007)(6512007)(66556008)(66476007)(54906003)(52116002)(110136005)(478600001)(7416002)(83380400001)(5660300002)(8936002)(26005)(8676002)(4326008)(2616005)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eIeDIa+clWRezAJF4qMqXosH7cgrDOz1qDIQ6bC+/JKZInKnRfSHtoHQfeEa?=
 =?us-ascii?Q?hXeFqnyzZryZoypa1dpULuc6yyuAowLOc2jCy56cWXCJZ3s+eM2qv1I7jO03?=
 =?us-ascii?Q?DK9vOP8ovvFB2Q6XXc9imwKaIYhBrL3HugtveXsUb8yETO8+uugHJCNNF/IT?=
 =?us-ascii?Q?IDMsYyK1uosxBdp/TLBHg2sLi5K9PEZdiOv8WI77zZncjPBfzKm7ZnoBfFNT?=
 =?us-ascii?Q?bf9ftlu+fOSXaGVlwf+0NTutm4DPZ8RWD+O4Uf769bs4qWIkLKJQ8LTrIbW6?=
 =?us-ascii?Q?M6UdBd4Cof2owDLdwewY/jb8HtXXmaPrVd63JIMh+9t7TkVpFxzZgG9iS4RB?=
 =?us-ascii?Q?iPt+WBPhPk2LEmjmti0MAnvDyarFk7hMP9zWv72EHnNGT4DtztCfIxDCXsvb?=
 =?us-ascii?Q?NoQiR/p6AXzXWgNxd/dxBXYlfHYMWBW2tYQz+ce+84Wkoa9TWI6xnRQ9krOQ?=
 =?us-ascii?Q?9L9a2JwWOEDugOSAsy5EqYCuIPNCL+tO6WWIgFyABzfKOScvKvb3X3+jfG9x?=
 =?us-ascii?Q?MUd7bqxwgDo9pOysaEORASDZ8VeRqfvdcyXSYeq/IKp+NbPMR0yWrkuZxhTn?=
 =?us-ascii?Q?5vU3aF7l8iAcKrLZv5ozlwjw66m1Lt6XunaOEa0QPx9sOXCVfvHiYUQkfBtO?=
 =?us-ascii?Q?jF5HgwB/6tl6HgJ78uNOuu991k22OPmouw7rqKpw4xwGhHmawUtOcXb8O3/j?=
 =?us-ascii?Q?dykKGU0Xh2iKLTD34DsgGHQCClyBEo69qGyuEuIfbloPwe3mJWkqGz3SHfkZ?=
 =?us-ascii?Q?JXM+m8PdXI4axCCBeKlsyTTnozpXhYvVSHHDT79qiJoHq2HwO6pIE+9aQKk7?=
 =?us-ascii?Q?Ja0W0V1HC0AIQ/r3+dGBqP1Jy3rAhHFy6iC2ok49ASnRIf2CBxfhm9fMa0EJ?=
 =?us-ascii?Q?uCT0fOdv79qZD3usXvd8u7u2pd3Mx4n4mW50dV2fDAzjnfL5sQfam3bdtbof?=
 =?us-ascii?Q?LMsBFY7Hl0+xPWXC4GhmnTH01oXHsJXDptdNAj+MUe2lAdE8IN00HyoyxxuF?=
 =?us-ascii?Q?5ZcYZXd2qvGVnYfYyRl4aisYuRNPywQghrbGg5xQ0rhAD8BD6hMd86SPOsvM?=
 =?us-ascii?Q?z9ZxMdaTUCM68ugpr4jp0XHixqTT7EfvQSP0a/cT1v5FLMit4hNB1r7cw5r0?=
 =?us-ascii?Q?1nA0feIEsp3EU7CggeytF0QmIAW2QpOQuPy29x++A4ReuFc0XJS6JQeg74dO?=
 =?us-ascii?Q?1W1p8SdkiRZZMrFXqATEJTgPT6N6NEnaP9QaMhXU9NkMtpKETgj8VBy3coSe?=
 =?us-ascii?Q?2LPm5/2bQ5rNowVWG9gY3ijJ/uErgRPqvtRpozax9zKlZBuVZmEaOZ/4SJY9?=
 =?us-ascii?Q?7hKm3YnBr+RKF2qqSAvqAKj5qKhH9ls8KEr/s7HhMfFKtlTRJusskG0/NiA5?=
 =?us-ascii?Q?m0lFeLsbSRv3miKG5XhhSMnmq6n8MWhk95QeNirQGuvoJ0jd/YWNOHFVG1ze?=
 =?us-ascii?Q?zKk7t1/BiKkWUs/yuqCfM/k12Kw0t8Ghgbq9PBauHBsMYXKBm+tqLMxbkss5?=
 =?us-ascii?Q?l4AcoND+s327n0vS9OKgNKzYXVBgz9iBTRlmbSFW3FlkmLwvsbWcja3MhdjQ?=
 =?us-ascii?Q?nSXGJkASFHaWS+FjbBRvQeCDveO9T/JJGBsaALftsFtk8ml0FGmFO7MMfaiQ?=
 =?us-ascii?Q?yGvJ3nRiHLl14AQU+BZYPeg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001eaa4d-3e97-4e8a-84b4-08dc221a81c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:07:22.2703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgeZsKOGotuy0qw6rFLTxsCHluJ7qqpp3TmTYO+f+s27204ALE7x/5qFCDYQY83zEmXJatFIP2Y6VH0S2h4/iAYvlAUl0H4O6V8oP8IkbHxTfCao9Mk1WujUr9QgXLNZ
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

Current test-component.c is using for_each_endpoint_of_node() for parsing,
but it should use "port" base loop instead of "endpoint", because
properties are "port" base instead of "endpoint".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/test-component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 0ebacbcddee3..a7bcd668e1f7 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -600,7 +600,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_device_endpoint_of_node(node, ep) {
+	for_each_port_of_node(node, ep) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.25.1

