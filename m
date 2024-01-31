Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF78438C3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C73113A7F;
	Wed, 31 Jan 2024 08:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF12B10E523;
 Wed, 31 Jan 2024 05:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWxxzNMhhbTDq2BYg0a2BHT7yAsF91uBwDM6tGawW3hzjfIyyeeE+Qk+JM8zdM4WiAk5W8qI5VJ8Toysi8x3IAUJm6tPF2ah1KUL6F9rrBncVYVcWqMVkmP8STtnmYTQZvkb073O4NhhM0Mg0TL4gxlkMYNzfrSoFvgxNkonbRNDTmwf8TnVPJJf+Ku7t+hRjiSxIc86Fb33ZoQYxHjfp8fCUFSeoz0falXtDd1ZX3UnQlie039fmG9UUOzGLhEN4CFxWH6MC+BVIQO+QlwKPVMIHIUs2gH1ZfnJTmL6+JEKg8OnldptpKyeTX1zFwGJD+9V1ibz25MOkxpSndg1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ7EP/h1pnMoq198Tp9urDTmBKcxftVo/c3f+vS7ZHo=;
 b=MvjfUCNzZ/paJFs152wRN/vlxwL8OVnP2GXexFzA8EaVePDv/SSuKX3pX+1fLD5i/A5kzAhuTZJ8qRT2Zp9C9Z78zUa9yvq73wugAI0lZbW7Bt6xGrJ2hHHVWo4norgsN6ki8GjM5GU/FBvluyN8TBQypeXjQ6Dr3Xh1sXfbT2kJeWvn5SChRDpKkVvYusmrDo/gRkJ/DTnpoWp/gHgtxvdxqL8ng0DVZxG7L9qYh31HUBc/Jg+K72SrFS83RgQFSxQ0Biyc0CMFdPohlxd8oj7hfEK6GDwWJjG1/0jt0DuhIb6I9y97hYNVINBDWFf61Urz5wFKpYQmSd60b0WPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ7EP/h1pnMoq198Tp9urDTmBKcxftVo/c3f+vS7ZHo=;
 b=Qf4OCi9/W4aKqnYJm3w3bzBWVv5Th23iR4w/v0NIi2HWXMlNZCo2ZUkWJj5bnWwXI8JV5wxE6hRcY1FBR4i1Cvv/jI+4bqyZjD/kJ6VH4bW4Nzsa59PSThSpzP78Tsn4OfFZMXZnecGeWl6rxREaLck1uGytD3dhf1qd+0+xCS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:06:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:06:08 +0000
Message-ID: <878r466qio.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 11/24] of: remove of_graph_get_next_endpoint() define
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:06:07 +0000
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 1706b900-1757-4738-7c09-08dc221a55ce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFFIrICwXOOWlyTs7wMEK75qGcXaE/MjZqKNR8rXv9G5fTpqIuhmtOuOSdPh7AfPA+dsQ+nLatuEOXAB9+lGqkKmVPKMdEX3nfwi15Ct15MBQmGK0KhC4EpUsujCd5oG97JaVindKmxmaGuBhK7DEroETOcYSXLxDEW06L12fCNxLttT1+aYLQ9EynX49x3nLrV2OcQGdtVQce8yE8I2IGomV6JlfSVC85PLWiqRSJIWJuIVbjIEPUJv/dTQJqHH7y6379E7Izhs47TQOV6tQYPwbl7SBLXaRkb2PGdRbT8qnt11Cb+al3ntAnXXFT9pQbxMdUUH/qYqzKjbKXUpqay5OBPjqbD0sIJnjcp5oZbPbHKgoFy6SKVZjOIlImWFQR6S6/EZOcC/qSByO49NlpGynzxD0rSdIJ2+8mkKi8kZBhEPw/nWxLh1w/Wy3tgOi+DYxR8or1l1bMAgDWn/llMyY+so2FlkPWtDimZYbGzVUUcDhWRmFVnyrUNrY7lfel+jXw51oVdbDtVZtGFdzhyQpPBx8sSVuGP6Kz1INthzyPT2jP3KhwLRosgOiLWAaLlbtXIkll7yjewE3BMNlIl341GawrtudLRzbf8edGMWdyTxDd+cR0UD4DEjaViKro1O6zpLJ/s/5UPIb/+/ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(4744005)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8BPEJ52NELKLm0xRfBqzFnBsdbWkivNMLepIMWLOqbxo1vSoG8G5+BheKb4O?=
 =?us-ascii?Q?VXC/3f/37qRF4GspVsF66sGKmkArJSfMFhPshGSgNN8nrmVBZ1dc7bbWuD1s?=
 =?us-ascii?Q?ki0walqmM1sHt/OavEcgGKmbi6f5tPxkBzWSnncz5C3wvOprq2IZ8V7RxsgY?=
 =?us-ascii?Q?b6aMUS6LGKPQL6jjBKHaWq2VIGDOXEztj5qaPSIC+JMHsV1Y8TkH2H8IHwYl?=
 =?us-ascii?Q?7lFHbavk9nbMBD5YlxFOKWFhlKlUwC0gMoHEYvuVlzNmk29Q6UJL2JiS+AZd?=
 =?us-ascii?Q?DGRp+vAe+dvDaOJR8jxbb+e+S1gKcLqs/Jp4ZMHwH5oc5hc7hn45mjFZlx/6?=
 =?us-ascii?Q?sjVP7PJRFdOOKpwHmQ0mXeKZH7mTX0kPgwWjVMeE1CvHZpNAM//zsoWsGXgo?=
 =?us-ascii?Q?745RSchsnMBwkhcGWzYYoc8KnagEfuzUdFyL3KQ9xqF/SMSJKHqeVfH2LKac?=
 =?us-ascii?Q?2pRP+BJr4JMN4ibhBf+cPRJW3UKtegPTvjfYQJxijcT0UIWDdhP1szDVvbsc?=
 =?us-ascii?Q?Lu04lKgOKsTHEMSZ+j99fsCoyjS+0DF7ZLDsHeEibiOkWl7dzjVMPhPPSivI?=
 =?us-ascii?Q?tZaxsFMIggMpzbO8zsMPCOGbyRJfjZvpoR6NKXcnqG+ktFV12ddgXWc9KePh?=
 =?us-ascii?Q?iCp7MObtMazZG2i3UzSD9Sc+kM51p2HztflFkpC9pNvS8stgXFXCMoqsGJTR?=
 =?us-ascii?Q?DvwKm1QCFFCkskMyPGO0N3zYzm7TP2o6fOSaebKlUvkRYrGKuaWlK9B0uSGL?=
 =?us-ascii?Q?D7d4nGlNNHCyuV32GLP9+X5AwJh1qYWsnelEcfGKyLR/6YvJW1XubNELthMp?=
 =?us-ascii?Q?xYV9SoDTWqIdEsFNZ9Mf9IUz1aH0+syLS53knTRDjhqGL6GXxQiXQGifisQm?=
 =?us-ascii?Q?B57m2ISGft0MiSJ2IdVUXeyaNwh/MROHEX2LL4kFpCv/CNLqWBhRNCECiDk8?=
 =?us-ascii?Q?e/Lc1oDORg+JmWT59gG3Ojvqd+X0phsSTOyZHJ9UM5qmVSAQtEiPcvzD9u1e?=
 =?us-ascii?Q?HUZ/k1G7EdWS4WAHRJPi2umD2Zc6KXpHyC8tIPifjwg7C/CfqpfEajaheGJc?=
 =?us-ascii?Q?q4cv3sxEPevbKpQE1xI7ddJap0LdSkHJ70q6Us1ileW/WLlSijO9xcLfcePM?=
 =?us-ascii?Q?f/Ib8uhwyKEcun8vzaW+x3qHu2utSiakZqKtVgai5BV4RIaISWEodAUr3clO?=
 =?us-ascii?Q?yOkF319bdAMIHa6XkazFJBU31YW1rTxBF/h4Z5uLwK3Yx6YlvVDKoIwUhavE?=
 =?us-ascii?Q?t/UL1NuNAOtnrCkem3VuwmAh6qOh3xyg0iNitgWVqaY166Q1atjZlCyVsu0y?=
 =?us-ascii?Q?kTyfY1BqW+OqvLR2S8Kd4Go0r2kArD1qIC25p+60dwI0sZa9fHZGFVI1+7fQ?=
 =?us-ascii?Q?ZW7GkzUDKqMEiELHiPbLaCKc1uiTYXqQYIWTDteGInDCczd9BHb9HfHlJ20k?=
 =?us-ascii?Q?EYDQkR2hKAXbopVOIy7VXG6nnxW1JLnoBGXiVqPD+w9duIa1D7NO5Ij7sh5v?=
 =?us-ascii?Q?/1tMzokaBcgH8eJdUgCYoijuWkankKK8FZKZwXom2DIysNXf76vNTkQZN1Zt?=
 =?us-ascii?Q?YLishv/lTm44YN6TE10QwtA8IMLqSMQJjq9a/oeMvNz2zay5tv8ZSBmAEhrE?=
 =?us-ascii?Q?d5wcH50N0m/HnaDgVaxyfZ8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1706b900-1757-4738-7c09-08dc221a55ce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:06:08.4694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gktr7sDU3Kpokgk9Z+CSc09kSoX1iiZvYge3R2Cv/xbNZiZo+/hzgHFRmcXOKVS6nBsgpfj73G66A+r1E7rQUsaaQXjVQrVuMBJFZYsprbqoHplE1Jt9PFbvlTwJYzRM
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

All driver are using new of_graph_get_next_device_endpoint(),
remove of_graph_get_next_endpoint() macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/linux/of_graph.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 80b7a579e96a..f59ce2ea55eb 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -26,11 +26,6 @@ struct of_endpoint {
 	const struct device_node *local_node;
 };
 
-/* REMOVE ME */
-#define of_graph_get_next_endpoint(parent, previous) of_graph_get_next_device_endpoint(parent, previous)
-#define for_each_endpoint_of_node(parent, child) for_each_device_endpoint_of_node(parent, child)
-#define of_graph_get_endpoint_count(np) of_graph_get_device_endpoint_count(np)
-
 /**
  * for_each_device_endpoint_of_node - iterate over every endpoint in a device node
  * @parent: parent device node containing ports and endpoints
-- 
2.25.1

