Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09298438B8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D23113A64;
	Wed, 31 Jan 2024 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418CA10E523;
 Wed, 31 Jan 2024 05:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb6bOI6ux3R3ZN+7y2lNrZbCYzyXe10IONIpXaUFhTdGf8GZA7BRdLYrZt1D5lVReXCiwtYwc0v4YprGat7c/V0igIufnVDycYiqlkZpHkFYdjguLbaRYFwE9DYu8oLSbshe13KS9Rl0VkU9jFefegvd9RmLBxaoAMu8gYIURtCsWc6uCtl0+ebGcwxs3qQ+1j+djy4mcyjXmmFEk7svqQEZha/Jl4KeckPg0yq3lQ4DKemcqXoXAJ84sAdkSkL2fNhJyHhnnV1AnHNHWt89QNA8b6CopVeVWwg/5erIDBN26DQvcMjKF3BTI0nOy2SkIT9p/Cd0sbueaY00hbb1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0Epjsyswotz9m+ehVOpV/lWYylzN1g6y/alE/dldvc=;
 b=IkWfZUct4BqlX9lnX+K7FuMuGSnz2LjVscAXLV1WxD/rRedMusO9nclOGu28IZN5iFiajomtCBWsfLJ2gBb1EFOBaskMkDelcIWz0UYF6hk2y8Crv65rj3NEpCI8GrkV5o2uSm6zl5JX8xnvfqGzFcFJQgTgJau7pCjBZOBTsw2ZHUC2puUeekb+uu1fOHJGkog3+5yb4/TRYBdegRyrM5/E1JHq0XQeRk4El+pB5FMosEg1DNrWl6x6Oksmbeznc9KhprUYAZISkoRoCjN4PIf7/6Vs++hSL/WEzP/AixqUrDwGui5aBBrGoszF5nCrH6cRPyjm+etriInuq+J7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0Epjsyswotz9m+ehVOpV/lWYylzN1g6y/alE/dldvc=;
 b=Nd7zDCHpKAOVVNpO3NMblAJixvEM27DDKeSOTX2i/RQ2sK2RkchwASOvDDpfWz7P1IitoNZ+SjmOMY6JjAY/ywlFE3GplbFW+gYjtOvciUz7CNt1MpOswt8JvnUINp0hVyEcOdeS4sRlpGi7vCT9/rfuLZL1KBeBv2JqJZT69hA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:54 +0000
Message-ID: <87bk926qj2.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 09/24] staging: switch to use
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:53 +0000
X-ClientProxiedBy: TY2PR0101CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 6397c347-a869-48f8-5488-08dc221a4d8c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieIceO+/YTN8khKJbn9eDVrxXPewKYiqt1rsJoB9SxJWpDKyrb/+sjw8X34gI219OYODYcLEwcA8z9lTW/7AU8upxUBCwla9R17ezT1USjzC+1/vRw+qL4xpB1WRSVk3mVw9GfWGW23KG6m6fVCG8ZqEz0DTyxyJWVrsg+vOnAkNvM8fJf14OkLy8oniWz7OcRaf6klX6UIFo50nf/DdHSupuK+1vJL+YKsFX0zjJg32t3ySNysVXWX3uR6NdTeQ96WqBVt8mRQzM4DYKxn68kPtHb/kezNgWmUyex1U7VRiwgyCTInBnJdSPxuRGTCxg54a4ZUsFoiWCkcgOXr0kfLd4NY98gEoL790pxnE8O3GBKQCwpoO/uY3qFeecVC3ssM5GkD4wQZwAdHUaJF7++QtBgNs/EcyrGWBxA1f58N560FmK4M0DWeeJFH2jM66NuHo+m4RUqDo1D7f823JcAAP/js0uXYoIQMrpzeBWPGUPY56mem0kGyynbFJjSJIO8RTQnoR1P8uKeDbTWdsLjcmLeCd9uoMr+kzpOYlMhLbAQsoXPZT1Sv+Caor0jMeg64nK7PHZDvV5GJGBHxujpbE1/SyIGh5QFHxbX1GDeo5BxH49HaJNi4IoCsfI6einylmArHEEFIh5HvhDsSDuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IIR+kJby61AjRVgaRLyo7HldqKFrccmEJMPTrjIUIeKN6UhDZK/YCSF2av63?=
 =?us-ascii?Q?FIrLiNdfUWaD+1/Q8TOwRsr2f8hVa0+sXKu2mTCAIOhBzp654ZG8pQGzDBiF?=
 =?us-ascii?Q?YmHpZQXfpwjMZGF1MqiAqt4jwdIBWBU9pK6EsizEdfmPhqUbln4t2M78eWs6?=
 =?us-ascii?Q?qfaK76B5BmaBibzz5Y35q/gbI0nbOdPcEYYlT6tT4lLKPZ3zHehp9lhMdqCR?=
 =?us-ascii?Q?5T2XES2xUlZ6Hldq8Grp6EcfwvUhgGWYREE36yPULteuiuyDN6WCh7syW+mb?=
 =?us-ascii?Q?QoTt4USddt7ayhSL/efqLFG54viENLCYWqoqjZ2vGWzdCpvZ0PsyX9doktaH?=
 =?us-ascii?Q?UMFSJP8RnUWvttIlRhqPHx3b80f57sVS+LRii8xdgNNkKXa+Od/6xXkhgJIn?=
 =?us-ascii?Q?L4Vnx4Ls0fkCCwG9gSRDk+6h7iecuTdEcz9qF02aUobZITDWqkXbtE+UnIMN?=
 =?us-ascii?Q?zp4lBzx9+FNoM80QwaE4MN3bkvcKgdjWIVxl+me5PJeT3z2C5kROf1Uy/LA4?=
 =?us-ascii?Q?i1DswI5BSi/ylm+fNAjFrNCifX6+XvudyvgirqTIJWE+cMJ181TlMusR04VB?=
 =?us-ascii?Q?DBm1WQ/zbh2iiju8FWNEdUrmgjZ4moF62BDNePkltxJ/XrsJdDxxwvx/0lJ+?=
 =?us-ascii?Q?6IMAWY98WuUuyOIy8/JHZvnyOVyXg2HBDupY3nq6Ww/bX29sa3NRDUiCijKk?=
 =?us-ascii?Q?M13gpB1UIncfaJPTSB2dlbuW5foxBPT2raUAab1LlG+Ch+pk9k0QB0Nlnwzq?=
 =?us-ascii?Q?FATu5755S9G8r9p8YDuIyA6g5W1Yvm69WmCTWgCR30gOE6HuBmbWWp4pGCUJ?=
 =?us-ascii?Q?8F+TviCVJcca/Bs9Wzz2BhRY1SnjkVQuoVYuhRQsLcSwsCs5Hyda/xT0LIq3?=
 =?us-ascii?Q?p10fjdmdFZWB64KPFlQkdNDMRAcvSK96B/eNh377qV03/Q+VOj1dqNlbDtoU?=
 =?us-ascii?Q?2TJK7M/b2AkNFeofaaoYJiyra9gGi99M6XlSGMPlwfejpddRq9qTTvQ67rxC?=
 =?us-ascii?Q?Z8uDVYSQSQLjpGYKkUh7GXL6FykdwdD0+7/doQLrxZBD1imF910MScYusj6Y?=
 =?us-ascii?Q?pCDsp1dtGYYnZGbau6RLNqWtPyVXSQutozGWT4XWjOct8yEZevFrv+t2uH93?=
 =?us-ascii?Q?8N1WKJPe05TmbL6Jlw5KIJstZjo7MIHeng614vBznB2Z7HQE+DYH3UB6QGB4?=
 =?us-ascii?Q?bVMiNmtITfN2ozveEtkgrBn2qoh8xfhcTMxT9PSbn/o9Sc9Fv4sL4jY1PotF?=
 =?us-ascii?Q?Am9gDU1KyDIoV7HnC9upT2Q/mSmjEYHHfLWb14kXrGi8SHqizXoc1ohnbF1W?=
 =?us-ascii?Q?uhC0LV14pbFVZvO6co1UbkQTyFz7cTMO9YD9nq4aL6w4+hqykhwiOQpRRyPT?=
 =?us-ascii?Q?JkVXnrrKiS8St8w73Lq3TPvqg+uQZ/EASUllK3ka+xeo0WZlXD8VZGb6wAdK?=
 =?us-ascii?Q?FHoVpSvsYf65jmiu8M1MAFCtSjRvTNEDXE085DD9Bup2W0tV5acGq10NXXll?=
 =?us-ascii?Q?vqoO+NQWvHJkqGif6xORdW9oElMPl7KCK2+y5r3E5MZ5ANgRI9ssaZF/sKtV?=
 =?us-ascii?Q?ggabjNoXjPEDOHupH8f+eo1HLFwSrfkvWaT2FJdejeWnkmXPBRAbOyuC/1KD?=
 =?us-ascii?Q?dbWali6vLHlP+7gIzJ7lpUk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6397c347-a869-48f8-5488-08dc221a4d8c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:54.6322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: widI3GpgQi+ok65q0RZkevumvd++7JyzNRGVAH9CsxxT/GLMe8AQDClKK08OWlru4fIqEq7Of3NJ6nsSj8oZed4VHDEbmFVM3PcKABVH2xjweyasSX420PVEVM7+erz8
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

of_graph_get_next_endpoint() is now renamed to
of_graph_get_next_device_endpoint(). Switch to it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 2 +-
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 2 +-
 drivers/staging/media/tegra-video/csi.c                    | 2 +-
 drivers/staging/media/tegra-video/vi.c                     | 2 +-
 drivers/staging/media/tegra-video/vip.c                    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 31b2b48085c5..bed11223e4be 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -343,7 +343,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 	while (1) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
+		epn = of_graph_get_next_device_endpoint(np, epn);
 		if (!epn)
 			return 0;
 
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 020034f631f5..e0dcec334ae2 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -329,7 +329,7 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 	while (1) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
+		epn = of_graph_get_next_device_endpoint(np, epn);
 		if (!epn)
 			return 0;
 
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9aa72863c213..2135dca9725e 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -571,7 +571,7 @@ static int tegra_csi_channels_alloc(struct tegra_csi *csi)
 			goto err_node_put;
 		}
 
-		num_pads = of_graph_get_endpoint_count(channel);
+		num_pads = of_graph_get_device_endpoint_count(channel);
 		if (num_pads == TEGRA_CSI_PADS_NUM) {
 			ret = tegra_csi_channel_alloc(csi, channel, portno,
 						      lanes, num_pads);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 94171e62dee9..de63721495ef 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1704,7 +1704,7 @@ static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
 	dev_dbg(vi->dev, "parsing node %pOF\n", to_of_node(fwnode));
 
 	/* parse all the remote entities and put them into the list */
-	for_each_endpoint_of_node(to_of_node(fwnode), node) {
+	for_each_device_endpoint_of_node(to_of_node(fwnode), node) {
 		ep = of_fwnode_handle(node);
 		remote = fwnode_graph_get_remote_port_parent(ep);
 		if (!remote) {
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index e95cc7bb190e..78b3cdf7ee29 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -137,7 +137,7 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 		goto err_node_put;
 	}
 
-	num_pads = of_graph_get_endpoint_count(np);
+	num_pads = of_graph_get_device_endpoint_count(np);
 	if (num_pads != TEGRA_VIP_PADS_NUM) {
 		err = -EINVAL;
 		dev_err_probe(dev, err, "%pOF: need 2 pads, got %d\n", np, num_pads);
-- 
2.25.1

