Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45E8438BD
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25CD113A7A;
	Wed, 31 Jan 2024 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ED010E523;
 Wed, 31 Jan 2024 05:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMLwB5UTxv3JG/2nybpZv/Mt7Gg33F4sMTwl2twP4B2ItmbhJICmqVdnOSzyaTwQuGKl8098TWnYtCt2+EppNKyfuZUsNlAMB6I6V3VyTFZ4c4Ymvsg1wPS88kn9KiWGyZbGxaf9vNkdtTSpBnyP4KOldwKDRkeIY0SLisv7f6EyJhC7qA28OMjAf935AzvvW+y0LEIfVLD0Csc93dp3CtjMqw6EYjBLV1Q3lce5A0kgbJdhf51BA+eJb5qrFoQ+VUPVpU8tyvhcPcy1Geb4UQTdUKEYN1jnJt1X8XysJUtc94jgqN8HYgLCtErCbVKxd99XfvEhfql+TeLOunN1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lhu29/2H+3rhc4xo+KZigQT3G3CvKsffKBWZag3xfU=;
 b=WHb4YxZHVnMfLArhPA4C47H7h1OBXy9hzT4RCeAg6SwpJY218B2qB5r+EiljwkSejxqqjpJqOTEBDThkJSIPZHzijbHBuwkKhE+x6huemXeJDCxxrsdHyJHSjrX6OiCjqkzzAe+HlhbDrhhV/0sPg2bbjHF19Wt6CSHVFei3/WvhKHfZF33+KOfhead/EDaKwrHEWwpUA2hUkVUTrzBERddvMAtxJOyuGAQKD1Ktz3V86u6E71ZqOlk9BtrsnXt/9MvEHNz4O1YILTiaGWPX9mz0CjswM4WfvP/3J8IL5iHI1/1t68KXa8ky2e624sUdE/obXhamALoj/ulRH8y4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lhu29/2H+3rhc4xo+KZigQT3G3CvKsffKBWZag3xfU=;
 b=YFD75/CGokUYv6H6oAc/0HAIVg7PsK9Pip+OGgXHFzFfvAeHo98BboAxnGvOWNLzFN+TH/6lJd/zhmMp0azmqZmYcklPJtrEsHnX3fm3Ys+52+CKLgauEE5Zp/Nllw4yYVNcRlaYiN4rHrjgf7Zi3J1QCimOPmSXOJdKGhs7t68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:06:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:06:15 +0000
Message-ID: <877cjq6qig.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 12/24] of: property: add port base loop
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:06:15 +0000
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: f333e95f-4e17-415c-f914-08dc221a5a25
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKfbS+LzAgXhKRqTmkb/mkhoI2TmGookJsEQ/o0mMN1KB6njm7CtxEQ61UOJ60ifDaPpIhmbe0lCR139fWwABf2xMaBj4waEdpw9Ct3LjdWr1esJSCZsavSaPpucZ50RMuSQ2rE7z5feZQ1pWVi8+YduIKir21VJCW/zLhcVhLj9MvPi12pux3js01joUi5P+lpFnJwzcBVgkhLyhmI7pfgUwAAZMtX4m5dqpOVc1NLS9D6iP+LPJ0McNyvHOr+RCPLYxuioSFjd1Hg3/q6FsQ+o/T//RL3QQ5KIAqdALs1cB8bF6/rVd4IFS8cwWUlpChHVPUgACOywXwyb6MY9dTCtotcB1A1DT/T2ROiJzpLRP+OC9KiyA2S5DmxqJXgK8iX/DFPUr8KOlj+Bc3zxZz3Vu4qkKzq2eIh3QkpSeGG0xQk5KttFCg7h57cFNyBycjPw4aumhl5OvG+rHhBY6+1VvsLHALBxiAKFeyMsXM0Wm0OM2w3lmV0/3rt4ft8eSJ9h2NPq1lcyvtSvmSnW78ZnpKyqajQhd3Xt6L9Hj0zK4KCEA9w4XaYXcry7Ndo/1cPA6aSW3XA72AZ2soGt2/dyZVwfGNRwxOm2IfaRLWxfMHhyj0dxTIaQzXWNbxdse1jNpmq1ch/u8jbwjuicQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSWH/BjpYQqAlznVH+ULeNSyJ/d6ovU/qV1rXmZ2bP7/XknBsiUm1kKH2aik?=
 =?us-ascii?Q?xc2I543XWvaWkjMhuLjhT/E8ScQrFcftoN5jpCfBsiGlxqtBqBX+yW6gRITt?=
 =?us-ascii?Q?z+PlMWWVQNIS6eOF9od0FXXpcCzEyGRE78bhY6SaT4g3Qt0NuPIyjFxQqQIZ?=
 =?us-ascii?Q?WKi1pIzZ00rL886HVzM4UqVxiOiZWGxl/+jbPAtxxzfLU7lDJXqA9BJx5CjL?=
 =?us-ascii?Q?TgO3F/VWICgUKqqS1eF1EFtdFhvzFWRAr5TSqaMIjeUmjJQPI8AeraBrqpC3?=
 =?us-ascii?Q?YgSo5p0pcjh9cECI33SZSzST6AbTFXHZWdvdzOlNUWfwEq80S+Q03CfFmruJ?=
 =?us-ascii?Q?8kN7f3BLK/AknFGOkCrhQvyWxcxd8ZUqVe1W4FFHX5vnlb/bpyHF4T09HJT4?=
 =?us-ascii?Q?dQETlwGjfhPQgWfEzkbzPOFLZR4dCX8oQ9d/yoYFcuLhmoA1Ic8/XCAQNClk?=
 =?us-ascii?Q?B8p+Z57YCo8Qg8RX9mVYGtyk1gY9V4shDVhOqAq6003xkTbS4NHbQOhID3jr?=
 =?us-ascii?Q?Zg3xjMjp11dAdrujSjR62UsXtFg11AgG/uf82okoqCFxTXzwzYMQ4OpCHhhe?=
 =?us-ascii?Q?+gxmyHfFc9AS6r7wv3cXA6es5NMnr80p6SN7NSc+VoU3cKz6L1q7210qugq/?=
 =?us-ascii?Q?CKVqctIYcBz7R/JixvVYOnzfWET2/oxCQce3IXHlzZp19eq/1V/HKqbgC7d0?=
 =?us-ascii?Q?JAaNkkAB+O4Reu+gYDO8KvNX13mNDTD94xniWpndxb0bJWE4KZqxzle9RNCt?=
 =?us-ascii?Q?xppfH0P7iBAobiAIqQDtW/rIgDNczDE7CGGLee1XMVF3T3zdQxrIhmC8lkLY?=
 =?us-ascii?Q?B0Eq9h3FaLTwdhPsPWyLpcUF7rwyLXJKtRGf5C99UUZaNRMHeDkrSGYsW5or?=
 =?us-ascii?Q?vaV1AZMRIB1/nn5bkbNHF4NniVD5vz7XU/NTiC541RY7dlQAlj+Y5hsCIUDr?=
 =?us-ascii?Q?tl1QGWTPyGW9cOHu9gSPYIeDx39aiAAtit7oM/wMoNJ0kIPW/IaNeWsVUQjb?=
 =?us-ascii?Q?jibWL8buel6KnIrSc7bBhn+DD1dqkMZq/ypj30WbDM+C/oxUI8Pui4vgEN3A?=
 =?us-ascii?Q?NAgEsnGTWMJS6NCy8ll/EpQ/4jsl0PUQKWTCQ3wzHk7C6w0y6oyURqJN9zba?=
 =?us-ascii?Q?JCtkuz5Gn+IZ2f5Hd/ZmvrL4voZ0/FTgbLAc22fCf89TTsWBNy4i5s8NK2DA?=
 =?us-ascii?Q?h6NTsX45pvLsrjPQuTFg8t8rz0U+9amaJ2NLMgcjsvo7ssLQz+J34RQJe0Xn?=
 =?us-ascii?Q?4bJR/T/PSnCd9q551RNdD24p7fYcqjz+i6MIVPlherK0kZb1tCIEgb4YCAzJ?=
 =?us-ascii?Q?yb299kM1AvZB5DKA64ti2TUCTZyrxz58oSQh1J1sVeHO72CTq2iJFadGpLYC?=
 =?us-ascii?Q?p3ncEi4yY63fH2jbLyKFtwFUI2k/SivLdO2ZJLNp9vF0LDYsTZr/uYDBuxlA?=
 =?us-ascii?Q?NutDNIFzND07t6J3MWWQmU9lQ2KRa0LgEBkLMSuHhG5ORbj1HJiGn1QEak0s?=
 =?us-ascii?Q?Tdxo+fs4P+XT8CQqjGKUZ747DEIW1cKeyyOblueNLAnMQwEZHPIsq+61IZwU?=
 =?us-ascii?Q?/h43Q8ix1r0ATgVtcsZKm7ZeOpLjs//SL2a3OcYlaGxUapm7Ric4Ig0wzT0w?=
 =?us-ascii?Q?BP5MDJ5bKKwumCSgkjkwCKc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f333e95f-4e17-415c-f914-08dc221a5a25
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:06:15.7623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2WFfwXn9yFx5UREo9AQ96AExaHVqckos5juZ7nFm4kkrse80crQ4yqtGAnhTiqDwe+BzSQ+qoQXZ2sOTj/k9cm9AyALHbpXH4x+oXc4MuHANrQ737fQ7hannY8TWQCL
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

We have endpoint base functions
	- of_graph_get_next_device_endpoint()
	- of_graph_get_device_endpoint_count()
	- for_each_device_endpoint_of_node()

Here, for_each_device_endpoint_of_node() loop finds each endpoints

	ports {
		port@0 {
(1)			endpoint {...};
		};
		port@1 {
(2)			endpoint {...};
		};
		...
	};

In above case, for_each_device_endpoint_of_node() loop finds endpoint
as (1) -> (2) -> ...

Basically, user/driver knows which port is used for what, but not in
all cases. For example on flexible/generic driver case, how many ports
are used is not fixed.

For example Sound Generic Card driver which is used from many venders
can't know how many ports are used. Because the driver is very
flexible/generic, it is impossible to know how many ports are used,
it depends on each vender SoC and/or its used board.

And more, the port can have multi endpoints. For example Generic Sound
Card case, it supports many type of connection between CPU / Codec, and
some of them uses multi endpoint in one port.
Then, Generic Sound Card want to handle each connection via "port"
instead of "endpoint".
But, it is very difficult to handle each "port" by
for_each_device_endpoint_of_node(). Getting "port" by
using of_get_parent() from "endpoint" doesn't work. see below.

	ports {
		port@0 {
(1)			endpoint@0 {...};
(2)			endpoint@1 {...};
		};
		port@1 {
(3)			endpoint {...};
		};
		...
	};

Add "port" base functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 56 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h | 26 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 007729d66972..cba07d2af62b 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -631,6 +631,44 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 }
 EXPORT_SYMBOL(of_graph_get_port_by_id);
 
+/**
+ * of_graph_get_next_port() - get next port node.
+ * @parent: pointer to the parent device node
+ * @port: current port node, or NULL to get first
+ *
+ * Return: A 'port' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *port)
+{
+	if (!parent)
+		return NULL;
+
+	if (!port) {
+		struct device_node *node;
+		struct device_node *port;
+
+		node = of_get_child_by_name(parent, "ports");
+		if (node)
+			parent = node;
+
+		port = of_get_child_by_name(parent, "port");
+		of_node_put(node);
+
+		return port;
+	}
+
+	do {
+		port = of_get_next_child(parent, port);
+		if (!port)
+			break;
+	} while (!of_node_name_eq(port, "port"));
+
+	return port;
+}
+EXPORT_SYMBOL(of_graph_get_next_port);
+
 /**
  * of_graph_get_next_device_endpoint() - get next endpoint node. If it reached to end of the port,
  * it gets next endpoint from next port.
@@ -831,6 +869,24 @@ unsigned int of_graph_get_device_endpoint_count(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_graph_get_device_endpoint_count);
 
+/**
+ * of_graph_get_port_count() - get count of port
+ * @np: pointer to the parent device node
+ *
+ * Return: count of port of this device node
+ */
+unsigned int of_graph_get_port_count(const struct device_node *np)
+{
+	struct device_node *port;
+	int num = 0;
+
+	for_each_port_of_node(np, port)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_port_count);
+
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index f59ce2ea55eb..48f7701feab1 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -37,14 +37,28 @@ struct of_endpoint {
 	for (child = of_graph_get_next_device_endpoint(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_device_endpoint(parent, child))
 
+/**
+ * for_each_port_of_node - iterate over every port in a device node
+ * @parent: parent device node containing ports/port
+ * @child: loop variable pointing to the current port node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_port_of_node(parent, child)			\
+	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
+	     child = of_graph_get_next_port(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 unsigned int of_graph_get_device_endpoint_count(const struct device_node *np);
+unsigned int of_graph_get_port_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_device_endpoint(const struct device_node *parent,
 						      struct device_node *previous);
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -73,6 +87,11 @@ static inline unsigned int of_graph_get_device_endpoint_count(const struct devic
 	return 0;
 }
 
+static inline unsigned int of_graph_get_port_count(const struct device_node *np)
+{
+	return 0;
+}
+
 static inline struct device_node *of_graph_get_port_by_id(
 					struct device_node *node, u32 id)
 {
@@ -86,6 +105,13 @@ static inline struct device_node *of_graph_get_next_device_endpoint(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_port(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg)
 {
-- 
2.25.1

