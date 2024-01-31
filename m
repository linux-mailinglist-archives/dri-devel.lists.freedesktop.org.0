Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937B8438BF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978A0113A79;
	Wed, 31 Jan 2024 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E3C10F1AE;
 Wed, 31 Jan 2024 05:05:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwAX+7TUhajhCFvBNHNrmTdxgDAl1HDpigyZlYBTpXdp4TVyq9sgPO6XBs3Knq9G2CzoU6STylHB9IN/+cyw9arhHLzyshdwC+8YcimB8k901FPvLNtl6K9V13KSFnxpUQhnp5moiWeuGeKWwyWgCj7tVVO/NjHYjN2Sa9D6zmMO8ouuyce9IoZ+vTAwRAILHjXOsEN5vMqST6CYe+tYq73pjcW4oiZwpnsYVcOu6nut5AkcePzJSsmPdkKX5CUuHhwKwsODr0+etT+kgGB67iwoDbt+lt2nXAY6F70gjrAcCq0IeJnyhft1uAjEVE3r/TWzoDyn7Ri8Tt4odn2y7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlwwnMRHzL9vLYCx+hlgiaCAxZVCKFXat+PBtUg6Iqg=;
 b=gKWtn2jBvyH5Z7dssWhu6aQBQpjjhdjlvRS3XGfGNkyKLE6pGGLysL6oNe+Wyvfc3l/CyWA451wBliyJAb3MXRtzfchoFz4KeDSlajH1aHzDgWsZBymU2fbq7NvqK6rAgBb6DoT5/lQg3mhmGH16T9Z1pPLW5B1bPqHu0WQ9WzLi+g4ZDtZeoSoVd7VnwhxTpw25TxlG6SjT6sYFan5MBZT2Z238XQ+3/+NVIswdtvgb6lGabAa4LsKEg2cdWo3axzwvMhBjGJWnKV9qpWz8w8zN2UCV+hhkDzsKdf99RqoPET1aKKbvjYuUKZxDMGTelbYgEjkCFfYGZIdIpJ9Syg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlwwnMRHzL9vLYCx+hlgiaCAxZVCKFXat+PBtUg6Iqg=;
 b=cLi/K0DC6YTztEEuuSmDXZJg1akdRXdJM40i18hMlx956Sazi1oLtn83LijwPHhkwPKFLGWLiBjp3Lot+ddicCbP7zmgyjoajOdOZdPxk4Sk2T/Ek8CpjKcmJeUn3j/aUnnrEItyBmDisW+117kvHjNIJhGiePlgQ+umYoidzB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:21 +0000
Message-ID: <87il3a6qjz.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 04/24] video: fbdev: switch to use
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:20 +0000
X-ClientProxiedBy: TYWP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d3aea8-4748-4d37-318c-08dc221a39ce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trPaAcDCMrBk4QT9YWU3njD4I/iZ8kKEJ7m7ZJaGnm/INCdoFcW54hO2ygwku01+U1JuXotqrWgh1qdbq0KQ3gdE4/S3AfuqptMyzIYZVvqB3agJhU7JTpdwcHNirqPNfqkWtkp8eUBzgh0z/KWCfWg9SHNBWENNW5JfAanAlp4q5RoSmThWTpKcBb1FISdUoz0FqKpMBeRZy6LYm6Wzz6UE9Un80wyv1x5mBzrCjfMu/5Ckp4qlE/StaeSn4VzwRMRXCy+jarSVoSd4Eh0Rh7m6Yn6FUe3q8Ne9Qmpbz+JSIOmvhne0jsvOPw8qsawJ1g6MLBXsl8w5kEdqihvLPMxb7pOn6JiM3AqHHOj8Om/13YRAKfnpllvNiveDYcnIrITnRboICoyd1S28+SLPPFjPHJPA46gdftUnW2/yvCX2tJol36kT25U0TzcHtzB5xev6qn1agXbxjOAEdhW9JlDi3Fn+sG6c5vhUI5AM4Jinrf218vUAzzaR5YK/fn4KSPQeClurtLF9kw5UXVX9YXPNpAHIWSmMgnAdXDAOWw5z6iWlk+m2j8WsEQiPjSPOk9R8RyiDNno5+6MOjoxZyURNN39eiVUAgb4cAzMKbWPS0NDeBJl1Vrj+A5zh5biwYxFvKqyQkCAUaiUyYwxg8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(83380400001)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cs0VDo6yQS0piQwIJTjU/814M8oKjZE0OZoglOW8w7So7P2fuzMzTRcYApQ/?=
 =?us-ascii?Q?xJEvxYXySIoq3E2EXr0lRdHWFsC9+yzIJGmNgZzkephGkcGCLDzzYwC7a0cq?=
 =?us-ascii?Q?3OVqskIXtx5AJ6wxjX8BPEvw+j/Vv+sRdcr8cM4gO11a13LS/rZNKCxapMUT?=
 =?us-ascii?Q?vmdpk+fwdWbLf/qySyMxIiieNzJG95SPB3Del9WFlFSTGwuX1f1DR2Sglfrf?=
 =?us-ascii?Q?+9D/wk0nmktchYI/r9HFPZzgd5b8X88b6dMOrhggDQQKmm0qsFRcwQBqBRpQ?=
 =?us-ascii?Q?TpQ+2VRQeXxh6vp244crE5uOvg+NAntnE81qjOPshxqN2aUrvZlvKmVmGXV8?=
 =?us-ascii?Q?JvEvDTq+CITnIuYVa+V/xAxbfEPnvLW2UgNLB2fmp/v6+du3qjX1O4kJs/mt?=
 =?us-ascii?Q?K9+xUZ3g6HEoZlJT94x20ujhhZEiggnaouFylB32MJv/RgJJ57z71Rjaasw+?=
 =?us-ascii?Q?5/JpMAEFyNwBFV6fd3icV72rP3Asx6oe0jSuEg19RWiaoH6qGru2VL8vJFJa?=
 =?us-ascii?Q?McYwTFPSUs+xHMsH9DrAy69ZB4prm4g4SNzsuqLD9sLmP21/Zau6YC8rwIuP?=
 =?us-ascii?Q?EgpjxGNjlaCtCt9jDxJtthtmTfJXIUMdkmuSyv+01A8aMG9btvhv3G+6MOOd?=
 =?us-ascii?Q?RTSKhDqe2crpjYVYScrV5LMMwStYxQaT5LK1Hsg27T7lHDATJqJ+o8cr7oMH?=
 =?us-ascii?Q?Z9tQrYNPj7Mg/KmehGXSCGOIshtYnD9iNU3hNrNeXMACHjNup2wXR0iAgQKd?=
 =?us-ascii?Q?NcwoCmeBp0tVMfX4DqgMDym5uoYRmlHnA9/73WdZ4z9Ag53o9COYTm4aUvFC?=
 =?us-ascii?Q?by1wserX2hlPYQX+/o5rtLXhSxp3NFLLaODhx1V9DrPN1dWW5wPBDHbKrH8y?=
 =?us-ascii?Q?xOM1Q+MCAZIhgBN60Z4hHH+cjKKUWanIKLOf3zfHLEMB4TR16SR9/jlZ/cbH?=
 =?us-ascii?Q?khvF1uKuY5KbDxSGbu9aD5kOqQ3HZcvkuLzsiiU3UaMJ5HDVvpAKL48XJoJM?=
 =?us-ascii?Q?ooo1BWZWUYH5vBgcpsMixRu2Gp+K8OqKwt3RzooE3paaM1ZGj0FZK6IuUMnf?=
 =?us-ascii?Q?6RvqaguZflc+lXOHLb22fwYt22DkbeUGP71ecBeqE0R03wFpMj1VnHOgnMhG?=
 =?us-ascii?Q?q9JrqOLh9v+AG+fU+dcrky7Qn+3rcGEduMP1DCNqNDPdPhTXwsjGXyNxpBo4?=
 =?us-ascii?Q?8SuescN60bfcl6OO2EWM8XPRwD09/1CQNlSyTdrOxDdimvPhMyoo21ZL8+R3?=
 =?us-ascii?Q?QknGYb8aQkwMoVh+suXSVZp/0kHzIwEm1pBuI1IGfFwpvSsX7MaHLO7SYR1Q?=
 =?us-ascii?Q?mG1XtoCxkBAljKEBTIZ9GMARkHkMoT1Z4yOGPqYx5cp0YJ7uT0rrm8jxddZt?=
 =?us-ascii?Q?K86VVzLhSLe61EwiTOEaKbeE/Rm7b8bmlXLLo8w6qcNN4nsEv6NQir/9qDqc?=
 =?us-ascii?Q?n1tz8QUf7xaWWoOpjbys282ezUELMztubKl0qidEkaBhmxnM/mXag74WI5lQ?=
 =?us-ascii?Q?ImMA+BXyCaX8aCdadclDRRi49qZ7vXSrbxgnOVvh8uIsn0+DOTVYLYbAn2tY?=
 =?us-ascii?Q?YxApZz5I1UuL8EfnW/kshfsFPyMs9zV2l1Pjv/m1AQxBemy9BpMe28tGm6Wi?=
 =?us-ascii?Q?Lo8c7V8J0kqEhgi5Fav0H+Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d3aea8-4748-4d37-318c-08dc221a39ce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:21.5355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLhHr11Uuvt31WNE5O6dTsPxxGK51NTWR97pxiWy8TOaCjZFWKNHlfHy/LxId3onF7gec+pR4fWC5Z9+RPFuRU/xnblE7oVrUIXmqQSTQOsS49hvpaBottpNAaK/PKVI
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
 drivers/video/fbdev/amba-clcd.c                          | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 2 +-
 drivers/video/fbdev/pxafb.c                              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 0399db369e70..7778c4a6b294 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -691,7 +691,7 @@ static int clcdfb_of_init_display(struct clcd_fb *fb)
 	/*
 	 * Fetch the panel endpoint.
 	 */
-	endpoint = of_graph_get_next_endpoint(fb->dev->dev.of_node, NULL);
+	endpoint = of_graph_get_next_device_endpoint(fb->dev->dev.of_node, NULL);
 	if (!endpoint)
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 09f719af0d0c..a5da79214061 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
@@ -150,7 +150,7 @@ static void __init omapdss_walk_device(struct device_node *node, bool root)
 	of_node_put(n);
 
 	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	while ((n = of_graph_get_next_device_endpoint(node, n)) != NULL) {
 		struct device_node *pn;
 
 		pn = of_graph_get_remote_port_parent(n);
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index fa943612c4e2..0acdde8b2f45 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *dev,
 	u32 bus_width;
 	int ret, i;
 
-	np = of_graph_get_next_endpoint(dev->of_node, NULL);
+	np = of_graph_get_next_device_endpoint(dev->of_node, NULL);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
-- 
2.25.1

