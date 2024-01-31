Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82D8438AE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F52113A5E;
	Wed, 31 Jan 2024 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700D10F1AE;
 Wed, 31 Jan 2024 05:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwLQpFvyOGBhMsDt+8WvpqOCEikc4QVO8BLiQh/iyQG9Ub5E2+vDLFHK+90VmOvCIHGEhZDFriiR8jo22BEchRcrE1GVnVKd5rWG9EnH4ipUBnOeRU6aoDB/3cT8FPOXk9JBXAZ2dWT4mRhsgRQLa4fPVwfJsb8cCalyKuiSfDgzHEkMSxX/L1BFByQdaOpxZ2Qd49R14vJayvyoXFPu/3oHWtTVdZhOE+atrMRYtBfxTyQJK0mxaiBhZ63YF1GK/O59Gs/+igeNBVVheoJgqVqEW1b1RIVJWW2B5lZ1JZPP0xMjlwh9gk7t13WUYK5aGY1Ks1Ch1Q9hGfDsKMT6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=runNTlZK0Jm8MaZbDR6/Vs69agLsK4pUhsW2Mcm/nG8=;
 b=jbRgu5kDeM3vLL+r4tG9QVNbO2+FK0AGhvGtr1aATzILijzGI5ycncc4dl936+C33sXnfwBEL3mL65KLklVJLry7x2yF+vRlAaSZLMkOanrspQFJVTTvt1KK2O/sD2GCGXioLy2u0HMNg243NKIKb8RoNF/cwhpBnsqrMli33b6rtDNtP2VpB2CRk6ak8LuOlQ4qhPAFAL0Cz4W/dxx5zBG1PjdF/qD5sTd23+4aWe9IW4j/fEVU0VSx/9W2urLWZUahRZBZqnGrPZGyUVTz8THj8tpkPbykAWvwGMp1pL3Q+XWH7nyWCy0RWGE+Q5VKpEibS8Y/j8MgvzHRwvLC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=runNTlZK0Jm8MaZbDR6/Vs69agLsK4pUhsW2Mcm/nG8=;
 b=O0/VanzLjiaEw6F3BH2uJ9QVT3ogWmpRv8sc20VSW+tK4pstP+/XvquNViqluTIs84c3fvjAnNTxxpqpX+VDoR0Rrp4/3hBjABmnwqPKo2aPSqRmxpTN1x1NKqQO5HFpmiDhAZyDgLF4q2CrSyFTIF5D/08cWXcPyAsDZWSoGNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:48 +0000
Message-ID: <87cyti6qj8.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 08/24] hwtracing: switch to use
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:47 +0000
X-ClientProxiedBy: TYCP301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6c36b8-2837-46f5-c6ca-08dc221a498d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWGcaeQfGgdF6hiBrJakfXooDUQkjpvRKoF5y9CLEDbGvHfcWL9QZvLGEuf8mLAvO3pnjpjx087nTDBaK3w7bVXm9HBPdxYOZbdaxSQA/xGuxmrfUFnT282AFqXu5JxVBRlkfLTCY6EvZaXzzOCG4jodHYwNsqusYlXINxUbaIZceZOuzjSfdHpKb1c5oQXP2yQzOykrCpegVmeP0P87NWwvrsKJ0HVQac45CVEXJed7KwgaSOvEgnDO3MMJknlutRjYTrwT3mk+2h53nUjQ0F6y95dU3FttHav6D57X0AHyOEQRBO2t9l89M5RmjRZ18gQJ+aVU3tN+ix75/R4jagXPJeGMNNjt/vJA8qKOW+wmjESM/3e61gtiWjJjWKB0QUVpfqjXtZY4mzlBD5GdW5qm4/znmPtNeMy8Y5vLQJPecCyNc/7fVTHxcn95oM2R8G8qu+3I3dfbSxmQjA/95f4Zhl0fbpMWyOBBhHEs1xtsI1NsE7velFyhJ9AUqOz6gziytpPcYmVsdJvgiu3H1Tq6W9p3ZUIjNiemAIzGCOwlUlMF0lLr4+kuUTJGvEdkq7p8jBlm1BltLl97MhdfELhBpOUquQjjq4Y/b8HVIpROyFbVwjuOCbHojp6iNYD9yQ9x40/JBFKUsl4z97adMDyr1/1NL8pfkS/vsQUbh0FcvLS7u6Fw6m9qinGox/es
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(66899024)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/JWDzIIC1E7AyvCeKDdv7yj32OfXPi+VvMTgAIzkBVrUvTijL7fU3/n841sZ?=
 =?us-ascii?Q?lkFGgdq8dMW0DVcOlGJdoEpCFO74fcMTEX1zwt33fB+spC6F9RP9xpY8So+x?=
 =?us-ascii?Q?8VcLRap2QpUOGRmPIKNqRQNDf+D8UeH/1GXhxc2qSd/8rq+ty+hP57+4Gquj?=
 =?us-ascii?Q?S0YD/l6gMUwOLc1U1AmjO1XunIoI8G1lHDhV2t7ixNc0gXbp1tugS8H/5HkY?=
 =?us-ascii?Q?pEKtDJimhOPdksXG2OSnBnelYdtRfjRhlLepy9cIZINvFLTiCSdlHu9mzVoc?=
 =?us-ascii?Q?mZCXuH/s8O27q3n9GAigDVlMY6oZ4T5MT3lVVElpgfDmG7AViPQUwL8cpaAw?=
 =?us-ascii?Q?kr2oInN+AQWS+3u8L0H5OkprXXyRexx4zpTEg8w02TzS2OyZxRD3dmEbus6j?=
 =?us-ascii?Q?IHSUG718eWdUySBM6nxHSaPWYxyiTfRmpX6gFIXNhGuyD8jNrpNyzSeeEhYo?=
 =?us-ascii?Q?VAisezF9EUUoks6XvS7v0dtkS9GzmOL6nod/Yuixbul9fp7ipSITVrnldzQl?=
 =?us-ascii?Q?Bx/4gzA/Ws7nbKuhV0sb5tqC/qlBe4whncTu6Qd4tkKC3WIG8hQG9ZSD7vK2?=
 =?us-ascii?Q?+uXfMe3hCraoH+JVOggK6wDhMePHjEpqWci5nN2u3P1bQFwTuRbdkxUE+Nzz?=
 =?us-ascii?Q?/58udr3tMLVGDZZKBLWJSL2SvI++B4q2rtCoRhdLAhuKg5NAh6uDCCdtEheJ?=
 =?us-ascii?Q?NZXPm28hlFBOAusFrKRLRIHq6G+gTJ+HLH8U6j8XCV2wHLhOIMUqXiimF99n?=
 =?us-ascii?Q?VF2Id5yBAM3gAuCL6JC1SaNygdP6fkbHNDNsc/3Gh7s4aGeAWysJZ/Qg7jRa?=
 =?us-ascii?Q?uY23CfT90jSS6w5WEvMvJ+RxPhTrb+iruRW3wnH6gg+E9MjL9Hw8b1on+FDm?=
 =?us-ascii?Q?AZhojTZnUgot4tJqfw4oibZRPYR7uQHDsBKijFSrocHEE+zdpXTBKx8lkOXm?=
 =?us-ascii?Q?88d+NSxh+oh6RY/lA4JXA5AaLTfWETczgurLHejBHTZUKTLKIZLye9BJBNlD?=
 =?us-ascii?Q?AdJZAvP+L+CwucHLOVjN+FMqXz6C2a7RzJ7dnjCNYENeO7414XpKELnJlv03?=
 =?us-ascii?Q?bUN1AQufGu+W2V8pl2HoirI9CwXF4JOusonu1I9/qj9tN8zhm9XDrnnUutK2?=
 =?us-ascii?Q?1eCPr18ee6aBBLYMZmbrFQ6G0q78BeyllLvtFZ8j8ZW2n9VDxiFi2CFuZ+Dl?=
 =?us-ascii?Q?myJrDoNeFnU/gz6vPRprB0vB4/wwAAL7X9EN8XkxeyN2cq9dq+MjpHznRzF2?=
 =?us-ascii?Q?7Sq6VwmreyoU1f8i083dj8PSwyGH6fd/6SPNRIKasmCBco+9iohqEPSbf3Gk?=
 =?us-ascii?Q?JituH3N3gyXJDtGNipCMoyshZ2sAD/905JwnpTX0GSwVXkofnTFVfDH/B6dH?=
 =?us-ascii?Q?mZV0PrkoRq2YW1MF//jO1oj7GBr3LvVHcj1WUOSqy8N//u17D9rgaGeFNUQy?=
 =?us-ascii?Q?2gvFbA5lkxPNg+OgGOiWhuZhKgpTgUWdDoYmn3zX7mp5TbnrvPXiox36iLE7?=
 =?us-ascii?Q?vIxv05PrZzoDvujaiAaPFaaJJ+N4jxwipezFbn4D/JwU+euwLISDkuSITdEo?=
 =?us-ascii?Q?/n0k5riKikzDIZOUmSt7FOwwKkiamD3dXw5yTN/jPbaorTfCBNpHXgjJT3+c?=
 =?us-ascii?Q?5fPHK6ul6YMxGEZyvUt5xc0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6c36b8-2837-46f5-c6ca-08dc221a498d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:47.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BXCKXlXqJH3TCdHEnGbWNdOWRCCnKEqwb4kOJkjbihz6XMtF8ISCOP7J+3yNL9FzXG1u7yBS6ZQDbwJ86ek4Bqotndw/v76hGftCXOJ7+UU+pRrOEofBQ+PwqmcLT7g
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
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa..944b2e66c04e 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	 */
 	if (!parent) {
 		/*
-		 * Avoid warnings in of_graph_get_next_endpoint()
+		 * Avoid warnings in of_graph_get_next_device_endpoint()
 		 * if the device doesn't have any graph connections
 		 */
 		if (!of_graph_is_present(node))
@@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	}
 
 	/* Iterate through each output port to discover topology */
-	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
+	while ((ep = of_graph_get_next_device_endpoint(parent, ep))) {
 		/*
 		 * Legacy binding mixes input/output ports under the
 		 * same parent. So, skip the input ports if we are dealing
-- 
2.25.1

