Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0B8438B0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F082F113A65;
	Wed, 31 Jan 2024 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E287610F1AE;
 Wed, 31 Jan 2024 05:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is0xHAGwSZ6KIz6h8FXpc0u7vAWtTGB7ibUpZPE65UrufcSxsuafOfjRvt/V81BHGfjNgCEFquwBRZM3QwqIWUisbuwLdznXLbEbs/Yxm6hIoe1LMyNN+QjC2e5MwGlFQUY7u1gpbZvciLKxXHdWFRxRSTezm340VzPd/I7cz3P2rYyMBZESo8SC5iEpt3+XCUjTxfD23AQJFn7Ygvnn+bwGCc09R+mpi2fcEQ55EmDc0ZzHniYvO7JdpqraBeZQainYcYrzKFa93alJfNfSfsJpmtOEGDNy0Kstg+AlZomYGB4178maS3iNcJI9GfK/szs1YNxcEhqh/P7uYELuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqoUBy9SJV6SjnA0EDgwQert/GxGcY1xfZ/fOVKQMBU=;
 b=Aj710iZw2fO06HrGlVfGPcExBbrJp2H9PGy9lypnYO+5fp2qtFLS1rZAlJ/1YtMMeTJCeivV/HmCinv0CiQ5ZEu+9lMwPOblc4vG/DiNLPgreLRI1jDMkdau0C/cfItt2Qkwq6WUGXg32tyP1dnmeXfSn1/IuwVqJpNzXZbIyInFyvKSLsQyyCdW2fgmXB27oNWbhqlI7SoxutEpVnDhLRz3wkDHrXv/89mmkbhr7F6H429a4mYqQtxyj7efhflyszhK8GPRfoFWXu/Nrau5HX7hw/BGGvN8zHNllFpOPwHWC9Y1Vssu7NVsToxoSl2RxASHjEfYZiFSNReV/hEgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqoUBy9SJV6SjnA0EDgwQert/GxGcY1xfZ/fOVKQMBU=;
 b=pWIp0PLg2mmZQKhVfxuPWoREN3kd8YzS/s0wyOIDdwzf8qsmF2eoO2ThUyriJnD6fWHx9eSIMspwDElVitqeZLB/R6aA/q43Ls50Vw/yzK3IZRdwKMqAOw2/7s6RKxo1suMxjavatlchN2RnmyNLhF2aFzUCTAi8+b46qMmKBPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:28 +0000
Message-ID: <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 05/24] media: i2c: switch to use
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:27 +0000
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: e824e6b5-c019-4fe3-9b7c-08dc221a3dce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFK6rDOer+W8FW7nSFJRyL3EnX08Lk9eLA1XCbT02Ky2CAor+EjCg3UZC/l/YCY81MXM8oQNQK3dlP42zGhGS4m2oXPYpMzT5PI+F0luHVs83UM2PF9R+lLz6LZPySPfPzRhoC1wEYN6VK8pi+LtsFTwztYT6RhVaTQa0XuMNY7mWh3zAMsD6LtQY/MlcEpLPrIo2aW4Bp3th/fdCOKVI2pzqVNzDl52TlUkx0fwHuAMEbgwW9s8XH0oFblJyZSGkczKA6GRXKTKVGr5VlUZRS/Zy6y8OSZ56A+UF7bG37oaxJzoWL5o2NeBmphSN48NyeI/R+TVfLgPh8rbmgFXS+4Bdvlu1pG9UwNKobetQt2MlrxfQVTPiVlJlOjqWZTe3LwLIKRUiZ6V7OIVkUnJnzFR0AqN5vxkIR2VQ3U1nLnK3m1Qo+roEIbNViB0psJ7aKQB3NZYI2PSpNkcsDTa8aKQBXaHP4qJbsG44WStwHIfnbuafaMsmWzRjmUfe3ZvkEAjX+32xqfcTnKpuH31/hguID1rwG73t+JhXkzJ7PrAWyoMlcw1m06zQWimAnoEzaJ9utC+TrV6KznUiW7UGw/JlsiFAq+cvL8eJgKR4mSGHnquDW3j5pPGEXFGdA8g0e5moMw7rvOBeHLQmAkPAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(83380400001)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PyqwP7SV/G0xH8OkXqtm6SSyy7u40BGaDRcY78VWipFNe5hNvgd2L65fIdI/?=
 =?us-ascii?Q?Ylj+d5L2ei4IMz05qnfwWDCc8MicL0E99T28h8bFe88hVODYzDdyZoRqoI0s?=
 =?us-ascii?Q?kREaeXxyAAQXp9uoDg2rfysLbJc+Ex4Ze7iqX4mWHQ3ypJOG15Yhk+DjlOlW?=
 =?us-ascii?Q?OaW/nCjGpZZZILR5o1TdfuHnNkuRVZLiObSzM8akINXkguLRTFlvhGsMzz7n?=
 =?us-ascii?Q?XoW3RT6oum7geOR1t6dCco/ZdBROUqpw/MPMBP2emgjIgxAylphLHEJ2IA0C?=
 =?us-ascii?Q?+Gz0sbV6p20MCUFHx+M+AzrIBxDYQ9wc9UEcLWtcqycEk4AqWi258ntihl39?=
 =?us-ascii?Q?U7REAjP4RnLbe1wTkXPAfBGUIwomomniLTtShFSCLcderfouBh/VuMo8wetp?=
 =?us-ascii?Q?sSaK0D7xQfOB9YiN6i8xy46dAT5Gjc7cA0UTguF7lPDrbMLY/BnBIUZGt+V6?=
 =?us-ascii?Q?PiBWK9+6FIpn9PtEoYR6BvKIrhk0OFi4gtTh/bOF5qudCB0jtWcOGi5PDJXd?=
 =?us-ascii?Q?6axo4z96CQcIXsgujBzjx4FOmmye3o/nPPU5V2iJh8X4nHlCWOV45zkUkL/Z?=
 =?us-ascii?Q?q3VF6qUpOZOqDfA5XM7TCiNzWoIHlHCklbNn927cacyZR46Y57V2m76lHZ46?=
 =?us-ascii?Q?B2xhlY9N8dsNns7VrdGDP+EYIX+iv2eVwS47pocG51JnEqR/lueL36AYcRDi?=
 =?us-ascii?Q?SMkoPezx/RyCVfmFC9QTv1rsYGn+PpdJA8jk+WDO6JMWdV4FMjGQeCjB/cNd?=
 =?us-ascii?Q?D9+cJLHi5LUJve1W685lS7/5mwJkWLuVhvK3wqH1ZHPhMzRGgb3J4+Ihktak?=
 =?us-ascii?Q?r0HROMLU9nnAzS1XsB8/oQl+KAd8EM+rr2md79wkewMfVrLniMUct9YCEJxF?=
 =?us-ascii?Q?aSl/i7IhOlGDM2pI1nOIBI6c6UhFd2vqetlcMhjsw1Ox+s2zRa3onODcVzlG?=
 =?us-ascii?Q?17g7RDrsCK37F2/gIK7zj3FdBZtRFde4+9S2tObDKiBFeD3OutAwH6im3TN4?=
 =?us-ascii?Q?XjM45Ad8Y7WUgFr90b8hFQVx9pCZq9prnKEyyTg24T37phUiaWIU2SqvODWV?=
 =?us-ascii?Q?A0FhI/2fVJ7syeLTJRApGnyHafaqXMv/SKeUF8mvaZ+WaBLzWemWsmaJCWCb?=
 =?us-ascii?Q?Vvdldi5bjjxghOP8npP1/REYsP32NWaxI2ytCrHq9QXxBWhVW5QmOH4GFym4?=
 =?us-ascii?Q?H9SMamKmWL0PBKfpzaJPE1ujFd28cNMfYt9XWTfLPKRBtU3fbBrIERJeaW3v?=
 =?us-ascii?Q?ZAFOphWqLUEQJnIxh1iRAAAejiEWW2EiHnp7rcuXUrdNCkXmYJp5Gr1HnBLd?=
 =?us-ascii?Q?9MB8z1b1PChUD44uQoM5HR76m2711f0Rx47vZyVv3aazxCHD0UjNwMoQPDJ5?=
 =?us-ascii?Q?vNQcR6PIxYeJi+E6xwT6s8nqSzaKxo8pJWCV0BQdx8toWJje4EybTXoyx5DM?=
 =?us-ascii?Q?jYkWO31g6aeJ/0DUZXLW9JGFipRwnoukQBFpkdhJuDQL3a3UVt6kl1OyZkXM?=
 =?us-ascii?Q?Z6X1vg7IcOiHZGy3BBwZP1ad37CZ0dDcfYeD1WbshcID2MWmnSRor8RtMl3+?=
 =?us-ascii?Q?opW6xCZ8lgOZoctHbBIMVkuPsABODzdvsxMcMWPyWdF5SXuKhQJzQSDa1/Rt?=
 =?us-ascii?Q?DzCguiZBmOQ+5wF1hspo4Xc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e824e6b5-c019-4fe3-9b7c-08dc221a3dce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:28.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81XU3LqC6tyIA36Dh7QxiFQo6mSuxa1feT8tp6Zhy57JwOkDC89bkgUOtASxWe6OnDqGS0VBKMxdwEu6X8V7RWb5RE39Qc8MeSOFEirMHfDitswWRe24WZsstIalaDTr
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
 drivers/media/i2c/adv7343.c              | 2 +-
 drivers/media/i2c/adv748x/adv748x-core.c | 2 +-
 drivers/media/i2c/adv7604.c              | 2 +-
 drivers/media/i2c/isl7998x.c             | 2 +-
 drivers/media/i2c/max9286.c              | 2 +-
 drivers/media/i2c/mt9p031.c              | 2 +-
 drivers/media/i2c/mt9v032.c              | 2 +-
 drivers/media/i2c/ov2659.c               | 2 +-
 drivers/media/i2c/ov5645.c               | 2 +-
 drivers/media/i2c/ov5647.c               | 2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 2 +-
 drivers/media/i2c/s5k5baf.c              | 2 +-
 drivers/media/i2c/tc358743.c             | 2 +-
 drivers/media/i2c/tda1997x.c             | 2 +-
 drivers/media/i2c/tvp514x.c              | 2 +-
 drivers/media/i2c/tvp5150.c              | 4 ++--
 drivers/media/i2c/tvp7002.c              | 2 +-
 17 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
index ff21cd4744d3..7e4eb2f8bf0d 100644
--- a/drivers/media/i2c/adv7343.c
+++ b/drivers/media/i2c/adv7343.c
@@ -403,7 +403,7 @@ adv7343_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
 
-	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np = of_graph_get_next_device_endpoint(client->dev.of_node, NULL);
 	if (!np)
 		return NULL;
 
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 3eb6d5e8f082..4e9e4cef8954 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -657,7 +657,7 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 	bool in_found = false;
 	int ret;
 
-	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
+	for_each_device_endpoint_of_node(state->dev->of_node, ep_np) {
 		of_graph_parse_endpoint(ep_np, &ep);
 		adv_info(state, "Endpoint %pOF on port %d", ep.local_node,
 			 ep.port);
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index b202a85fbeaa..5b98a688b5de 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3205,7 +3205,7 @@ static int adv76xx_parse_dt(struct adv76xx_state *state)
 	np = state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
 
 	/* Parse the endpoint. */
-	endpoint = of_graph_get_next_endpoint(np, NULL);
+	endpoint = of_graph_get_next_device_endpoint(np, NULL);
 	if (!endpoint)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 73460688c356..1ef26dd8290c 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -580,7 +580,7 @@ static int isl7998x_get_nr_inputs(struct device_node *of_node)
 	unsigned int inputs = 0;
 	unsigned int i;
 
-	if (of_graph_get_endpoint_count(of_node) > ISL7998X_NUM_PADS)
+	if (of_graph_get_device_endpoint_count(of_node) > ISL7998X_NUM_PADS)
 		return -EINVAL;
 
 	/*
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index fc1cf196ef01..7d0725285a24 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1452,7 +1452,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	of_node_put(i2c_mux);
 
 	/* Parse the endpoints */
-	for_each_endpoint_of_node(dev->of_node, node) {
+	for_each_device_endpoint_of_node(dev->of_node, node) {
 		struct max9286_source *source;
 		struct of_endpoint ep;
 
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 348f1e1098fb..4832968ca50b 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1080,7 +1080,7 @@ mt9p031_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
 
-	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np = of_graph_get_next_device_endpoint(client->dev.of_node, NULL);
 	if (!np)
 		return NULL;
 
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 1c6f6cea1204..236a671857a1 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1008,7 +1008,7 @@ mt9v032_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
 
-	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	np = of_graph_get_next_device_endpoint(client->dev.of_node, NULL);
 	if (!np)
 		return NULL;
 
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 2c3dbe164eb6..a909edadc8d5 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1388,7 +1388,7 @@ ov2659_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
 
-	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	endpoint = of_graph_get_next_device_endpoint(client->dev.of_node, NULL);
 	if (!endpoint)
 		return NULL;
 
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a70db7e601a4..cb04b2a71492 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1053,7 +1053,7 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->i2c_client = client;
 	ov5645->dev = dev;
 
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint = of_graph_get_next_device_endpoint(dev->of_node, NULL);
 	if (!endpoint) {
 		dev_err(dev, "endpoint node not found\n");
 		return -EINVAL;
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index dcfe3129c63a..2772195f15e0 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1363,7 +1363,7 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 	struct device_node *ep;
 	int ret;
 
-	ep = of_graph_get_next_endpoint(np, NULL);
+	ep = of_graph_get_next_device_endpoint(np, NULL);
 	if (!ep)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index ed5b10731a14..a43f5c8bf770 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1555,7 +1555,7 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
 				     "failed to request gpio S5C73M3_RST\n");
 	gpiod_set_consumer_name(state->reset, "S5C73M3_RST");
 
-	node_ep = of_graph_get_next_endpoint(node, NULL);
+	node_ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!node_ep) {
 		dev_warn(dev, "no endpoint defined for node: %pOF\n", node);
 		return 0;
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 67da2045f543..063b8ede4ffb 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1836,7 +1836,7 @@ static int s5k5baf_parse_device_node(struct s5k5baf *state, struct device *dev)
 			 state->mclk_frequency);
 	}
 
-	node_ep = of_graph_get_next_endpoint(node, NULL);
+	node_ep = of_graph_get_next_device_endpoint(node, NULL);
 	if (!node_ep) {
 		dev_err(dev, "no endpoint defined at node %pOF\n", node);
 		return -EINVAL;
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 2785935da497..9664fe1526e2 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1895,7 +1895,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
 		return dev_err_probe(dev, PTR_ERR(refclk),
 				     "failed to get refclk\n");
 
-	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
+	ep = of_graph_get_next_device_endpoint(dev->of_node, NULL);
 	if (!ep) {
 		dev_err(dev, "missing endpoint node\n");
 		return -EINVAL;
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 325e99125941..5b5379c7e56c 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2307,7 +2307,7 @@ static int tda1997x_parse_dt(struct tda1997x_state *state)
 	pdata->vidout_sel_de = DE_FREF_SEL_DE_VHREF;
 
 	np = state->client->dev.of_node;
-	ep = of_graph_get_next_endpoint(np, NULL);
+	ep = of_graph_get_next_device_endpoint(np, NULL);
 	if (!ep)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index c37f605cb75f..f979d95b3b21 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -988,7 +988,7 @@ tvp514x_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
 
-	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	endpoint = of_graph_get_next_device_endpoint(client->dev.of_node, NULL);
 	if (!endpoint)
 		return NULL;
 
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index e543b3f7a4d8..e8ad131fcd6b 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2000,7 +2000,7 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 	int ret;
 
 	/* At least 1 output and 1 input */
-	ep_num = of_graph_get_endpoint_count(np);
+	ep_num = of_graph_get_device_endpoint_count(np);
 	if (ep_num < 2 || ep_num > 5) {
 		dev_err(dev, "At least 1 input and 1 output must be connected to the device.\n");
 		return -EINVAL;
@@ -2017,7 +2017,7 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 	 * tvp-5150 port@2
 	 *	endpoint (video bitstream output at YOUT[0-7] parallel bus)
 	 */
-	for_each_endpoint_of_node(np, ep_np) {
+	for_each_device_endpoint_of_node(np, ep_np) {
 		struct fwnode_handle *ep_fwnode = of_fwnode_handle(ep_np);
 		unsigned int next_connector = decoder->connectors_num;
 		struct of_endpoint ep;
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index a2d7bc799849..27f2a138bd09 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -893,7 +893,7 @@ tvp7002_get_pdata(struct i2c_client *client)
 	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
 		return client->dev.platform_data;
 
-	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
+	endpoint = of_graph_get_next_device_endpoint(client->dev.of_node, NULL);
 	if (!endpoint)
 		return NULL;
 
-- 
2.25.1

