Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3098438BB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157CE113A66;
	Wed, 31 Jan 2024 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293EB10F1AE;
 Wed, 31 Jan 2024 05:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhbRoG2EIAuoo8EDHGRj0h/V/luQ3DAl1tDiIXUZ5huc2ODIp8o6JLD2gppHv/FthrzkC8vs3YOl8CjivXp6LTpBhHvmkt+9DN3L4wBndtFwMsDb7/IRumZXwg+UI0ODITSsEmWb2d0dMl/Raj0VsQBkcpYphfn4dVvLvNfIIWadDqf7MCPH/RkdvEnYZnnGWUtDLNFQxG9Za7T+L/m4oXkHEoQtlowf5Uotr/IjFXooYKjCQWWfHx20N6V/g3Z+8HW9dNKxEEyhjvste4+J+gfUVNcI1yEDo/kgAkriFUeRJvFtT6HdP4UEuQFpf6hipUiGtHssiydXT+Cp10UyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7oHLf0DNBLwA2J1zULhb6wxjoFrm9jcNMe4OozLtBU=;
 b=Mt70HiQZ8/8YZEclm+CCHzlW5e4eiZbYH2o7oedDSfzUx8aALbyGqN2kNOZEN2kPUSZl9WHXqWZldwX5HHpCyNdNks4LKWnXqyKqb/1WZnWMCO3cLxa9YxUPoGv5qeH/e09Krt8mEWlQ+0IXNQOu0y201lr/dNrerT6oAzZFol1zocegyigzgfungQQHQV9Uu/vn6WssveAARGDDGArzpBnn4EI4+iWimeDPIO+ARyUs2+Z7AO3vMof87+vUd8RhdSmUqiVhq3pQymkMcmyYYarFWE1emB1SMkaPYCYjX5IQsqGecBICDYHLX+8q0rG8VHtxU7fUXgNmY5iMMmnXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7oHLf0DNBLwA2J1zULhb6wxjoFrm9jcNMe4OozLtBU=;
 b=AxZSzXlGXUp4+NO6f190DJ7zmsRV1HlUi+XG7zV/O410cHh4Lj0H4R6TXK8rTKbJUY9urAUhnTs1RMXl+4PrPJ3dr8P0SdbjtltieCQWAeREWIpX6i4Pe3SoyVHdJhiY5kusSXU6MLM+Y1Pfu3oF7ocdjhDBk6FxREeBtZev3P4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:41 +0000
Message-ID: <87eddy6qjf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 07/24] gpu: drm: switch to use
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:40 +0000
X-ClientProxiedBy: TY1PR01CA0199.jpnprd01.prod.outlook.com (2603:1096:403::29)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3fa429-cc30-4827-4ecf-08dc221a4596
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oq561+f94A1wjHI8LW8LzqXzN8v85WiFFOGpHEKvVe6Xs7bJJUwgDJKajr7dPLHRBpYi80Gq+9Vab9N0lhc/fjHxx27lagWdRwXmZscV0ufDgKfemaX1BXSIJRzSYjJPCPEb3Kd/s9AU4Ne+CxGBajKLTvJLSQNVBN2/uYlao/iwqt5dPAJ1zkj8VLqnsy22Wd6gfdQcRs7tcIfYMp4tUe2DmQTapNCIjowp4j6KJX9vsMnvPqAuMMI6qjj4pS+uCiHm8Qtf+7KBKjaBV5cN298/Fc1fCXAxh/MAls+fu+NZ+rWmAwf94gMq1BD5jhJfBoHeT2a5QSULhWHf1mk8wCLWLjCh3iHH310f2Rlaiao+fe7yiC7WqXRs8Mg24xAV4r681VgZEg5taR949cNv0+RTEJkyk/4j0zBWcL+UO+bdjjFHA8A+RzKRnWhPN676mM+izguyyyWFjyoZX8KP9l3g/CtvTAMGBMElSttPKY2BOpfkoEbLWHKXs7nbabHk23ERLWMjD7EWuJMlW+hX/gZImWhOEZ88LNvT8narAjthCyXPtouyRcecchZ80sBbGcloya6z1n0NYtJiK5u28cEshpXyDHh1LHD7b+38OpB/rvh07QZ9tqQK2cKO1PmbCTp4iIXw38P6chc55BDTGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(83380400001)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a4l85gc8fe1QjlK1MxcKfTfkLZpxqQ+TQuSXZj2eKc91Gre92aXD5x/IwQx5?=
 =?us-ascii?Q?lX8q2qEw8iNoCW1dy+KxNnR2F2xmq2DmWncdLk0veAFn5qIYqm9zMHCj6JaN?=
 =?us-ascii?Q?8J+cL7Wxmu5ztp2GEz2jzQ94bWYTv22OIH9WKKbcx2S+s9PAvRmcSmhX2uDC?=
 =?us-ascii?Q?O7yXcQ1NWnlV2lJqio3bmjUfzlVXLFtkkjnMzQEqc0dmOFYEwvGMxNFa8knz?=
 =?us-ascii?Q?MQcwaITvui2aGaO6NbQ1NPorcwNsp3g1hWDUxZADMdQlkjucxHZun6mEhJoK?=
 =?us-ascii?Q?RqsuK0dXDPqwhM/JeGPvnpfaUg7c1U9SftU88bS/HBiaIwxIDO7hYgpI3GiA?=
 =?us-ascii?Q?5Ut0v5Ut5++raUd5HkT2+1heIoo/++xqT38vrbguFndmWDI9uyo6GtTR/AMd?=
 =?us-ascii?Q?IXXhrS2smsny0+n680PEWvjkgO0oEG0AHJ3++Jn/tR17Cj7HYn0P88plpGKN?=
 =?us-ascii?Q?7DMKeKxN6RYpFptuRbDYoPBjsu+zvgeNKUtCqMZ3zxrTvCpHmf7Q/lRUaY9y?=
 =?us-ascii?Q?2ITa4o5a2g+aWjgmolLHKCvpqV0da/5P40IFLW7IHOLzLdBVkZYfxvBDRAgu?=
 =?us-ascii?Q?1ZfALfVO2hnek9/IHtWEJVelu/mCS7SErRQeO1mn657NoIzgevzjmWLd4MuV?=
 =?us-ascii?Q?DviiHjB6kGBc7n4giqyov43FTx5rykjAtEP/SxHHotIwEWx+nhS5bc8KSVbX?=
 =?us-ascii?Q?JNgbMus6ehf2sGICVtFea48Y+am4fi2CtNYXxf7VSYWDsOFEUDPoaHodYdO0?=
 =?us-ascii?Q?MmBf2OPAecqBmkTz66tpmmLCmvVDxYArNwAmOty2lyUYlFNyp4CAR5iwLlIc?=
 =?us-ascii?Q?uwUsqCTN/D4E1Vn7IwZc4BKKAOamtEnPVL1H+5mja+7td9dfUrthcXb9JgF4?=
 =?us-ascii?Q?8o/4fWph+abycaFUyqpjQ6HJWJLgNm5FFsRlddsO3UEwHLejVPaALrPlc6+6?=
 =?us-ascii?Q?FX/S7mTpO1QvwDEOMb2QQXgjmkiZhwRTseIfcxKNRgvp06wTf+6ir+Tztbmj?=
 =?us-ascii?Q?aljCGT2eRQXC8V6yuk2BO7Tom0K/nIRPCFi7awee5NlDsaaEpAI22GyvdEUX?=
 =?us-ascii?Q?iklHBwVEJcRk01C8qTtkXffoMxyVWA7pr2lqiXuBIxL8l/Cl15coOWMNrNOR?=
 =?us-ascii?Q?h7R9N7NCD2EBUprNrNLhyc/wDFq4msGhhgeKuszvR85AYOf/mO6el1Rfv+Jr?=
 =?us-ascii?Q?1DP10HU9cjDYeZEp3iKcCzBH0UoBbHaEOdvjKpVr29nEQq53lKuANUTmDCYp?=
 =?us-ascii?Q?LnQsWmQBoKlPA2exJQyB6deI+P/yPcKbWQnk00s7K4lULpBAGP7vJ3r21Czh?=
 =?us-ascii?Q?U5apoeIKNmBU6qIo00X0R61kdFdO9TkN/fWOi3P1InGSlfrtSKZ1mcQP/pwb?=
 =?us-ascii?Q?F6ycKRNIAkUB/0qG72CWG+ucAJIVC7+dh3Q05m95my7BNtXZaL4qywvdp0a8?=
 =?us-ascii?Q?idq7khVneJ5rlfo271IQIHIJuMI7/n6Ec2Xg6wOO9IGdK2eh7fRO9lqUwxjt?=
 =?us-ascii?Q?GnPPqI6DRDLh4KMX9G5iwKCTXTKyX3Uivr7oUgBenalKzLxas+Airh4yn4Av?=
 =?us-ascii?Q?YFqHp7buuK/1ueinPXRsT5bao/8IJm8JtErYGx3H2h21B8CMZQi+Cj0OKj3X?=
 =?us-ascii?Q?0kmp1Raw8v7m0/+YJpazwEU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3fa429-cc30-4827-4ecf-08dc221a4596
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:41.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQvYOW51x5+o3Xr25n4DSm8+Z/Qedq8yZQ0ssDER5FxLPSctI739TCn/MRCntKjxf0pCJ+FyNnPEM6coDJmOJl/9bt95RRET5G9zGOWEchJHMk9r3UOPQ0bm4h1ns0dz
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
 drivers/gpu/drm/armada/armada_drv.c                   | 2 +-
 drivers/gpu/drm/bridge/tc358767.c                     | 2 +-
 drivers/gpu/drm/drm_of.c                              | 6 +++---
 drivers/gpu/drm/meson/meson_drv.c                     | 4 ++--
 drivers/gpu/drm/msm/msm_drv.c                         | 2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                     | 2 +-
 drivers/gpu/drm/omapdrm/dss/base.c                    | 2 +-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/pl111/pl111_drv.c                     | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c         | 2 +-
 drivers/gpu/drm/stm/ltdc.c                            | 4 ++--
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index fa1c67598706..575c61c6711f 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -175,7 +175,7 @@ static void armada_add_endpoints(struct device *dev,
 {
 	struct device_node *ep, *remote;
 
-	for_each_endpoint_of_node(dev_node, ep) {
+	for_each_device_endpoint_of_node(dev_node, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
 		if (remote && of_device_is_available(remote))
 			drm_of_component_match_add(dev, match, component_compare_of,
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ef2e373606ba..845d60943c52 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2190,7 +2190,7 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 	 * DSI -> port@0 -> port@1 -> DPI :: [port@2 is not connected]
 	 */
 
-	for_each_endpoint_of_node(dev->of_node, node) {
+	for_each_device_endpoint_of_node(dev->of_node, node) {
 		of_graph_parse_endpoint(node, &endpoint);
 		if (endpoint.port > 2) {
 			of_node_put(node);
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..b322cc922aa1 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -63,7 +63,7 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 	struct device_node *remote_port, *ep;
 	uint32_t possible_crtcs = 0;
 
-	for_each_endpoint_of_node(port, ep) {
+	for_each_device_endpoint_of_node(port, ep) {
 		remote_port = of_graph_get_remote_port(ep);
 		if (!remote_port) {
 			of_node_put(ep);
@@ -203,7 +203,7 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 	if (!node || !crtc)
 		return -EINVAL;
 
-	for_each_endpoint_of_node(node, ep) {
+	for_each_device_endpoint_of_node(node, ep) {
 		port = of_graph_get_remote_port(ep);
 		of_node_put(port);
 		if (port == crtc->port) {
@@ -516,7 +516,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev)
 	/*
 	 * Get first endpoint child from device.
 	 */
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint = of_graph_get_next_device_endpoint(dev->of_node, NULL);
 	if (!endpoint)
 		return ERR_PTR(-ENODEV);
 
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index cb674966e9ac..338a7b90d1c3 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -113,7 +113,7 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
 	struct device_node *ep, *remote;
 
 	/* Parses each endpoint and check if remote exists */
-	for_each_endpoint_of_node(dev->of_node, ep) {
+	for_each_device_endpoint_of_node(dev->of_node, ep) {
 		/* If the endpoint node exists, consider it enabled */
 		remote = of_graph_get_remote_port(ep);
 		if (remote) {
@@ -481,7 +481,7 @@ static int meson_drv_probe(struct platform_device *pdev)
 	struct device_node *ep, *remote;
 	int count = 0;
 
-	for_each_endpoint_of_node(np, ep) {
+	for_each_device_endpoint_of_node(np, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
 		if (!remote || !of_device_is_available(remote)) {
 			of_node_put(remote);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3f217b578293..43e3f22c5520 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -840,7 +840,7 @@ static int add_components_mdp(struct device *master_dev,
 	struct device_node *np = master_dev->of_node;
 	struct device_node *ep_node;
 
-	for_each_endpoint_of_node(np, ep_node) {
+	for_each_device_endpoint_of_node(np, ep_node) {
 		struct device_node *intf;
 		struct of_endpoint ep;
 		int ret;
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 18de2f17e249..e46ae576ca92 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -51,7 +51,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 	struct drm_bridge *bridge;
 	int ret;
 
-	for_each_endpoint_of_node(dev->of_node, ep) {
+	for_each_device_endpoint_of_node(dev->of_node, ep) {
 		struct device_node *remote;
 		struct of_endpoint of_ep;
 		struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac5..085bde7b2dee 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -243,7 +243,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
 	of_node_put(n);
 
 	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	while ((n = of_graph_get_next_device_endpoint(node, n)) != NULL) {
 		struct device_node *pn = of_graph_get_remote_port_parent(n);
 
 		if (!pn)
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd6..d479ea7a0183 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
 	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
 
 	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint = of_graph_get_next_device_endpoint(dev->of_node, NULL);
 	if (!endpoint)
 		return -ENODEV;
 
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 02e6b74d5016..a5e8d79baf4d 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -93,7 +93,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	mode_config->max_height = 768;
 
 	i = 0;
-	for_each_endpoint_of_node(np, remote) {
+	for_each_device_endpoint_of_node(np, remote) {
 		struct drm_panel *tmp_panel;
 		struct drm_bridge *tmp_bridge;
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 70d8ad065bfa..97c642edf408 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -609,7 +609,7 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 	 * Iterate over the endpoints and create one encoder for each output
 	 * pipeline.
 	 */
-	for_each_endpoint_of_node(np, ep_node) {
+	for_each_device_endpoint_of_node(np, ep_node) {
 		enum rcar_du_output output;
 		struct of_endpoint ep;
 		unsigned int i;
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5576fdae4962..6af275a157b3 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1931,7 +1931,7 @@ int ltdc_load(struct drm_device *ddev)
 	DRM_DEBUG_DRIVER("\n");
 
 	/* Get number of endpoints */
-	nb_endpoints = of_graph_get_endpoint_count(np);
+	nb_endpoints = of_graph_get_device_endpoint_count(np);
 	if (!nb_endpoints)
 		return -ENODEV;
 
@@ -2087,7 +2087,7 @@ void ltdc_unload(struct drm_device *ddev)
 
 	DRM_DEBUG_DRIVER("\n");
 
-	nb_endpoints = of_graph_get_endpoint_count(dev->of_node);
+	nb_endpoints = of_graph_get_device_endpoint_count(dev->of_node);
 
 	for (i = 0; i < nb_endpoints; i++)
 		drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..1cf3a7bda035 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
 	 */
-	endpoint_node = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	endpoint_node = of_graph_get_next_device_endpoint(pdev->dev.of_node, NULL);
 	if (endpoint_node) {
 		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
-- 
2.25.1

