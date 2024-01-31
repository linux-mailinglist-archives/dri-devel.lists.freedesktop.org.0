Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60E8438AF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456E0113A61;
	Wed, 31 Jan 2024 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D310E4B2;
 Wed, 31 Jan 2024 05:04:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHZbDMErSOk2YcQrwXPTDThTAzntBG/cCogKqeniJzsaDKOpbExZNDraR1+K/JCacpNlTBiiHbonaCRHYYC9IjoN2O6Ay2x539oKY+ObTYKTnPT/m4zw5rxgKnh74+gEivuPWkrcJEuTlq2SVKz83kfqx7spcLG4czsqwxDhMYNYGopVmh38VJV9C8H/hHrrMb0SJNCbCs4zSbcvr+/PS326uE/fwvxDFzClPU0mHH1tAJ7N6TP0JA+CDcDFrO747bLvmnRJnasQKyCFK1JwfUilFU8n9eY0MVKmQhzQp+4Naq2KieM7Nn8vQzE4iAHUtq0uDRb5k2zD6vsxCPWOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+5CiXTJgPad8zMhSD0w6xKwpy7MFhyDCsVDKxJ+C3o=;
 b=chO2264CTIm6hhSaZOy7DTMgPXmcGHprW9P/KAOS+Sd78SqJlwYUqa+PSHKx4YMYbAn27gCEnjrOulZ8IimrPJMjdH2Zp7+QgYaq+37mrVsAehhKMY9uTgAQ4+jvAbe5dbcwmQVwvFRMnzie/aN8EeRCNPsQXZhGQLj6B3Qb0hNQXDv1zfdHflTmVzewIFlrx8lqrfqoekWBBNOvXTJlpWdZOnlzyRei4keG2MumNGGhNORVND67Nz1f69g/jOxEmglWDTBTVLCHfk1kaX8B/1gpiJYI3ZnDMNL6A3gm2aETf6dtsTzJMPuBy9Km5+zx9ioV7DpP/M/huSpbd0bvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+5CiXTJgPad8zMhSD0w6xKwpy7MFhyDCsVDKxJ+C3o=;
 b=LLBQGMhAV8IvPgm4Lc/NcRBtrQqZzBOsNB9M7RWWS9vNnXXfmQOq9NZnwGsZWlcoD2AbCcc+hmLWKQIktL6rHh37rPf4waakw+5EnlD2fUQ/j2ng+GDyFlHiGmYKW7dOyDVDvDHYrikAb02G5u/rCtDGbqyhUHBUImDT+/FmAwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:04:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:04:34 +0000
Message-ID: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Lad,  Prabhakar"
 <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Niklas_S=C3=B6derlund=22?=
 <niklas.soderlund+renesas@ragnatech.se>, =?ISO-8859-1?Q?=22Uwe_Kleine-K?=
 =?ISO-8859-1?Q?=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson
 <andersson@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel
 Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emma Anholt <emma@anholt.net>, Eugen Hristev
 <eugen.hristev@collabora.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jacopo Mondi <jacopo@jmondi.org>, James Clark <james.clark@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Hilman <khilman@baylibre.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Vasut
 <marex@denx.de>, Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>,
 Michal Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Clark
 <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Robert Foss
 <rfoss@kernel.org>, Russell King <linux@armlinux.org.uk>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@google.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Stefan Agner
 <stefan@agner.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry
 Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, Todor Tomov <todor.too@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>
Subject: [PATCH v3 00/24] of: property: add port base loop
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:04:33 +0000
X-ClientProxiedBy: TYBP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: d7353850-aaa9-4a00-db7b-08dc221a1dc8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +o5SCnnzAqa/itkzF7hHRtQ8K4K0VupH/sDUcKJoz9H3hW7s6b6WOBZcletczhdoa8QYwy6dWvNjHxXsCpTktYwKAMhCDx8kdNDgeiyunpaTTqwx++WrRh0uul/v8/evCxgbLXd+EPPFmEEmyvxYcQ7h6aMc7/7lahvKXBoISTOaUpi1QM79u8j9K5SUaEpvvmxM3LmPTu4sUipSbDkC9DOWYEU4tKBCh45t9xAM1FZOr6GN2bQ4ldt4N2LXmJHyDQnWWrxazYMUz5pdA3hWDHUgpVJrLQ0Odel8jiWusCNy9rrSVSXRcob4ZfdkLVAc9SED+uuRGU3ONXxlWkMt+YqWLSlUjzYAhC+BwG99PdjaKxTvW1x9svE5Vd/qSBGi4/bceGPiZRqA8kClCXlVc4WXs74wRzhdeS0A5UJGs3MDD+aXPDF3a4YT5EFb17YvjdvZoNgElRoFKqlMlRjZDo+LYTbxsnWtpo+TPSyfwZjhoTJ8frbL0F3CMiJ1HCLPU1ZiyrjJVXKzO6vW+ikeOcLGY5jLVfkYH05h0Rjp5oODLG4Znhfu//xrcSkf6hq6Fag+s3ULtPR9MAsjSTAkyN6MbPOrJahOpK4s0zziITODB2C1drk5eC4IldY42FTfr8b/giGVMFZgQrEc5WaHlcaICeFmiKsjNtP86N/sUuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(966005)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(83380400001)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UkI0QvLhTrO3+QAFKz9ZqWXBw7JDRz/B9b0EyooERuIiBBsldfm0cuSSnAuJ?=
 =?us-ascii?Q?CQBDvyrI8woF4RKs7KUHsPodoYyr0S3pVspLUzcUvDv/PcCglkDv33Fb4tmc?=
 =?us-ascii?Q?FsXXJE6U1Vm7XUVfpgW045JJldJ/tNJGzoTGpMV9M6M+uNqSsjAHalYG8R9+?=
 =?us-ascii?Q?779cmdNDuJ9TQkZWpfkJ5TrdQcGf08OolocuFY6MybCR6Hi/CudoM78wiNw1?=
 =?us-ascii?Q?HnaO+2lBCn/VcDfF9z7S+Fx/C0qXeTAOwE+L2zg9GzoMZ6hU898M/qOCJWrU?=
 =?us-ascii?Q?ZJdudNlGqdnPZYfwuP/byXyiOY0eS68MUtU8fxJkoHyMdKshYpH8vyFY8Iuk?=
 =?us-ascii?Q?l857c+QJjnQJaxGUCBPM9kLWHk4CWSDS7tw9zZ/fiDwN1FOJIqKNqKxK0FGH?=
 =?us-ascii?Q?gEVUAND67DP6fi6FoMAJxb7t4XLlBooSCY0R9VHrC34whFmddztjVMgpnZNB?=
 =?us-ascii?Q?0cky42vrBq2aQXdG72+U8tLDeVddLfyRlAJH0IGQDBrai3RVQZEM/deWk4+l?=
 =?us-ascii?Q?kfUPbQ5p7i6MhLSMKjSe0wTqhjuoZ00d49WGqYrZmGBrFgqULs1l8bI6DnZZ?=
 =?us-ascii?Q?PjtvnzeVRw9nbaBuzzWc0Tdh2t73R6RvV9MUlsPoWmtk9sndJM8jm3iGeNSv?=
 =?us-ascii?Q?JwYIRcfYe2QGNSiVfDpBJV+X7o2iTUJ28WCePWCPw1XnrCNBa+3zmlWRRy3o?=
 =?us-ascii?Q?DjU2K66qJspu/U+mbfaokPCekPzsU1Q98oZjmH66/GKOL2bPd6Clyc0eNLlL?=
 =?us-ascii?Q?WLZQWWK/5Dm3TC4pfnXrjVGPzYEZ/zPsnkEZqR3irAFfGAQnGX019y8mXtWx?=
 =?us-ascii?Q?WDLFfcWjQNlhx/YsLgUmJtrGPmJTLUHB8s5bIm0fXycXprpOJrVU7EHF6zct?=
 =?us-ascii?Q?o/RC4G2qjjGT7a8En9NMjwc5tGQz9hjaEUB3xIMOhx4AW0BvMODsGG6opNvK?=
 =?us-ascii?Q?vGSY9OqW4pi810DdFda8gHT1abfHua21ioEeUCDJahedPSKfpvewXkBd7xDk?=
 =?us-ascii?Q?CuKVnzwLbaiCOyCKsX97d+JkkIA9djRHmGw+xptmSrv9J7vVGbP6bhgdV8/u?=
 =?us-ascii?Q?lJr13lGGUnvL4z6NISKi4Yhh6/ncE/qIxMwQreGe4ZqE5opatG4e+nXBicms?=
 =?us-ascii?Q?/PWXfxJce1lF//vlUjX5EBr4uGucCUyxvCSI168BbynNxoA9ESQ9O+m7RUMl?=
 =?us-ascii?Q?y3vPs5mBT7+DwThoj/vs9d4Q9GJzsTeKu4elVVpaGCwfMxMYxJzx69RFnyaM?=
 =?us-ascii?Q?lI8VZ4c/HsuFhfvMieOgY9zIL7fPPEmiAgIp5koLl6gI1fwRK5ORuR9u5zx7?=
 =?us-ascii?Q?u2s4FmZ0tTfnQ7W0bKTI+v/Ecu7y6yxkQjOGRooLRIuiBQjOlxMMvOzNm+Y9?=
 =?us-ascii?Q?Ro+eFxfkkO79exWczk7htwUTWqmxEBdaV/4i8Ohxqnwa2lPahRT3vhDWsUnC?=
 =?us-ascii?Q?7qEjqvm6lMlL9qAUIgBCRuoB5Yj1q63RtHfBBE1VM6d+gA+oSoTfxYE8KNJD?=
 =?us-ascii?Q?uzqMUqr8nKG1U0/AGFD51QpU7fE8xfJaxSZVXAzGfMuI75zvvoPZMHrCQfBb?=
 =?us-ascii?Q?wMD5BPZJivLnj06Al1Kx7yp2KlXFq1fVEDhg3P7IzeGwrNlkfIqvO8YnLL2p?=
 =?us-ascii?Q?WlxdKTW7prWX8jf07BjuquU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7353850-aaa9-4a00-db7b-08dc221a1dc8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:04:34.5309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrRAyWfOuFjf1U6EUwqr8R6qXebuvscdI2jMBjzl/7rMZeAfAPh/2jAdN0HijPwH68PBWDebnZtIKEEZNRf6lwLsjQporjR/kw4xGbU/1Y8xbVJMNoSWHVCTUZlxY/ml
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
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


Hi Rob

This is v3 of port base loop patch-set

We have "endpoint" base functions
	- of_graph_get_next_endpoint()
	- of_graph_get_endpoint_count()
	- for_each_endpoint_of_node()

But to handling "port" base things, it is not useful. We want to have
"port" base functions, too. This patch-set adds it.

Because current existing drivers couldn't use "port" base functions,
it were implemented in a different way. This patch-set doesn't try
to full-replace to avoid unknown bug, try easy / quick replace only
for now, but easy to know how "port" base functions are needed.

Because I can't test the driver which I can't use, non-ASoC drivers
needs Tested-by, Acked-by.

This patch-set renames existing "endpoint" to *_device_*
because it is rather than focusing to device's endpoint instead of
port's endpoint.

	- of_graph_get_next_endpoint()
	+ of_graph_get_next_device_endpoint()

	- of_graph_get_endpoint_count()
	+ of_graph_get_device_endpoint_count()

	- for_each_endpoint_of_node()
	+ for_each_device_endpoint_of_node()


[PATCH 01/24] - [PATCH 02/24] : tidyup existing endpoint function kerneldoc
[PATCH 03/24] - [PATCH 11/24] : replace existing function to *_device_*
[PATCH 12/24] - [PATCH 24/24] : add new function and use it

v2 -> v3
	- tidyup existing endpoint function kerneldoc
	- replace exising function to *_device_*

v1 -> v2
	- tidyup function explain
	- add missing header on each files

https://lore.kernel.org/r/87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com
https://lore.kernel.org/r/87fryhklhb.wl-kuninori.morimoto.gx@renesas.com


Kuninori Morimoto (24):
   1) of: property: add missing kerneldoc for of_graph_get_endpoint_count()
   2) of: property: use unsigned int return on of_graph_get_endpoint_count()
   3) of: property: rename of_graph_get_next_endpoint() to of_graph_get_next_device_endpoint()
   4) video: fbdev: switch to use of_graph_get_next_device_endpoint()
   5) media: i2c: switch to use of_graph_get_next_device_endpoint()
   6) media: platform: switch to use of_graph_get_next_device_endpoint()
   7) gpu: drm: switch to use of_graph_get_next_device_endpoint()
   8) hwtracing: switch to use of_graph_get_next_device_endpoint()
   9) staging: switch to use of_graph_get_next_device_endpoint()
  10) ASoC: switch to use of_graph_get_next_device_endpoint()
  11) of: remove of_graph_get_next_endpoint() define
  12) of: property: add port base loop
  13) of: property: use of_graph_get_next_port() on of_graph_get_next_endpoint()
  14) of: property: add of_graph_get_next_endpoint()
  15) drm: omapdrm: use of_graph_get_next_endpoint()
  16) media: xilinx-tpg: use of_graph_get_next_endpoint()
  17) ASoC: audio-graph-card: use of_graph_get_next_endpoint()
  18) ASoC: audio-graph-card2: use of_graph_get_next_port()
  19) ASoC: audio-graph-card2: use of_graph_get_next_endpoint()
  20) ASoC: test-component: use for_each_port_of_node()
  21) fbdev: omapfb: use of_graph_get_remote_port()
  22) fbdev: omapfb: use of_graph_get_next_port()
  23) fbdev: omapfb: use of_graph_get_next_endpoint()
  24) fbdev: omapfb: use of_graph_get_next_device_endpoint()

 .clang-format                                 |   2 +-
 drivers/gpu/drm/armada/armada_drv.c           |   2 +-
 drivers/gpu/drm/bridge/tc358767.c             |   2 +-
 drivers/gpu/drm/drm_of.c                      |   6 +-
 drivers/gpu/drm/meson/meson_drv.c             |   4 +-
 drivers/gpu/drm/msm/msm_drv.c                 |   2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |   2 +-
 drivers/gpu/drm/omapdrm/dss/base.c            |   2 +-
 drivers/gpu/drm/omapdrm/dss/dpi.c             |   2 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   2 +-
 .../drm/panel/panel-raspberrypi-touchscreen.c |   2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |   2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |   2 +-
 drivers/gpu/drm/stm/ltdc.c                    |   4 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |   2 +-
 .../hwtracing/coresight/coresight-platform.c  |   4 +-
 drivers/media/i2c/adv7343.c                   |   2 +-
 drivers/media/i2c/adv748x/adv748x-core.c      |   2 +-
 drivers/media/i2c/adv7604.c                   |   2 +-
 drivers/media/i2c/isl7998x.c                  |   2 +-
 drivers/media/i2c/max9286.c                   |   2 +-
 drivers/media/i2c/mt9p031.c                   |   2 +-
 drivers/media/i2c/mt9v032.c                   |   2 +-
 drivers/media/i2c/ov2659.c                    |   2 +-
 drivers/media/i2c/ov5645.c                    |   2 +-
 drivers/media/i2c/ov5647.c                    |   2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |   2 +-
 drivers/media/i2c/s5k5baf.c                   |   2 +-
 drivers/media/i2c/tc358743.c                  |   2 +-
 drivers/media/i2c/tda1997x.c                  |   2 +-
 drivers/media/i2c/tvp514x.c                   |   2 +-
 drivers/media/i2c/tvp5150.c                   |   4 +-
 drivers/media/i2c/tvp7002.c                   |   2 +-
 drivers/media/platform/atmel/atmel-isi.c      |   4 +-
 drivers/media/platform/intel/pxa_camera.c     |   2 +-
 .../microchip/microchip-sama5d2-isc.c         |   2 +-
 .../microchip/microchip-sama7g5-isc.c         |   2 +-
 drivers/media/platform/qcom/camss/camss.c     |   2 +-
 drivers/media/platform/renesas/renesas-ceu.c  |   2 +-
 .../platform/samsung/exynos4-is/fimc-is.c     |   2 +-
 .../platform/samsung/exynos4-is/mipi-csis.c   |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |   4 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |   2 +-
 drivers/media/platform/ti/davinci/vpif.c      |   3 +-
 .../media/platform/ti/davinci/vpif_capture.c  |   3 +-
 drivers/media/platform/video-mux.c            |   2 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   3 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |   2 +-
 drivers/of/property.c                         | 126 ++++++++++++++----
 .../deprecated/atmel/atmel-sama5d2-isc.c      |   2 +-
 .../deprecated/atmel/atmel-sama7g5-isc.c      |   2 +-
 drivers/staging/media/tegra-video/csi.c       |   2 +-
 drivers/staging/media/tegra-video/vi.c        |   2 +-
 drivers/staging/media/tegra-video/vip.c       |   2 +-
 drivers/video/fbdev/amba-clcd.c               |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 101 +-------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |   3 +-
 .../omap2/omapfb/dss/omapdss-boot-init.c      |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |   3 +-
 drivers/video/fbdev/pxafb.c                   |   2 +-
 include/linux/of_graph.h                      |  51 +++++--
 include/video/omapfb_dss.h                    |  11 --
 sound/soc/codecs/ak4613.c                     |   2 +-
 sound/soc/generic/audio-graph-card.c          |   2 +-
 sound/soc/generic/audio-graph-card2.c         |  33 ++---
 sound/soc/generic/simple-card-utils.c         |   6 +-
 sound/soc/generic/test-component.c            |   4 +-
 sound/soc/sh/rcar/core.c                      |   4 +-
 73 files changed, 247 insertions(+), 251 deletions(-)

-- 
2.25.1

