Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0468438C7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA4B10F0F6;
	Wed, 31 Jan 2024 08:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A85B10F1AE;
 Wed, 31 Jan 2024 05:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFX4TLibtpgyxXP2xT0wXnHiZPMvUKqeEz0cKDGAqPkfSOR2nURLc132YnIl0SXgfx3sKZifmF3/dTCh9y1zjh8SFZQsKB3SHkM1/+LIr3KGwb4NuUD6NGJsx6MDJE1FGEqBFqoehu8J6DVB1kIo1lDdxhV4oPKlpIeUzTAAixG69F+OIhos7lAzmQCDqt2um25DMnDFyZDhqLe9Rl4Ak8+k99cZttIcCKm64ZtOAyWvcaUBkvCiEe5Nvwf5IkN/PsSqU7PY8Xeegf0E2xpc124d8KbAs8yGDhF8ISgUGlFc4G1Woaj7AdTSMls9EjU1LsMGUD6xoNkkIxbpZ6tV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVCSpQ6Gm13JFsk4yudxcp9izZkrD44WheCtk80q3Wk=;
 b=lA6ONlPZ/yjGaxfQJ9pyeOIxhxfAFF91Cfsgc36BjVIwKKHUwjJlF55kjUsIx3gD3FcdXEUZbFuRvW3zfCN58CtApTMvrpm3iW6Vm3jBdyCj2XOr0KZjJHljwsYkj08iHIVu5tyQMMffSbHRl0BPC8gZfKDdPxibHlOwtAH0FF6HQrjcl5H0j8g5ydhC7Pq7qlZIymSmTLSxJtNzC42wCLi+o11ygenTn49NKApoVRDuyEWicrcnFtvMd2Tt9wjL4gaKA+aQUTugnym2mxEDbMVVp1muAhXRD1kYgqTlb4YYiBWepmGxSbg5qkUUS5A3iQanl7nqUDqgSVz6I6vt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVCSpQ6Gm13JFsk4yudxcp9izZkrD44WheCtk80q3Wk=;
 b=i3xggJMAmSAvzRuDGmR2EF0JG/1B0Uy96n3OhnlSdlBcJdqtwEyxVLZfcbTqpDaS49wwSQzle7Hgucvdakbm9VkDbCiV8HLoRe/XVLt5QIGhCbuDpPXrEcHgRqG9HjqV8CLDFxHOUtrJxoCIk/JRLSt2UMIGZD6ZQHUUiRnbNtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:14 +0000
Message-ID: <87jznq6qk6.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 03/24] of: property: rename of_graph_get_next_endpoint() to
 of_graph_get_next_device_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:13 +0000
X-ClientProxiedBy: TY2PR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:404:a::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 29980f97-1af4-43e0-e3e6-08dc221a35ad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tNCfMt2rVvIvnhrk0CfwGnYl6Fcx5wi5leYgkzk4ZMS4cmuq9VyNO6bnUDuwaekzmIsMUh9jL9mH0XKa+2IPE6D1iVIfz8yA/A/e9GCrlv5RQR0q0v1IhY3LMJm23G7sCg9C5T+2BIQNykiyXicCQPkjzDXFBoroW2IkTgXMibWFxWfSjKvb0bZ33uOfcKgeqI6vnPv8LVEwx3QMEVpC0iYHnpHsxc0Yoq7FVyjUmimrE2ZCCvnrGvar4yTyhUOz21n+0B5H+stBXqeXl/fDjRc3Ta1l2H4F07Qv15oCcuWzxHBDRCIDR0T6NI9LK168jN+ybdo53r3KclYSdlq3C5NBiwXFo96Fzos/IUcO46VmuRQsNlJBx0c5dZT2oIQJKN9QSUKAN0kuYAYSfaKZLwHoU2Sj565ZaWJB+/7pr+desmG5/9DBGPCK+JmEm132hrY9By2QHo4u4+JwgkiboyuNknHRKhmE2wYIZ/lllqErUsz4MCm+JmAXCC4onms50D0ZSvBo0+AWnPgWQlroeTVKyKAWCRKjZ9GeRXj4VeQHSbBBQXECZ+/kIk4ITAEF1J7TTVbPaGV+QLOB55BH8OwAbiB5B163wylNd4/UxSBW9E5YLw4b7NX1/MVUpjDGFv2pLo6J+/GCj0gioe/6TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(83380400001)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PbFn/JVHmH9FGEWy0j/dBIlNiuoPXsCC7Kq6IQ8XKcad6yP13wDbMeH0bVbu?=
 =?us-ascii?Q?oq9zwWqIi4EmUrIJrRf5k7TyYgDgg+mJjQQavooPAiCmiu67m5xvzY+8yxV3?=
 =?us-ascii?Q?s5x6mZS9v1nCa/mAkfvlusblNp6mxfDgZUl2Y9cbcDx21BAlIE8bDPfN6Wlj?=
 =?us-ascii?Q?t8cqgzikookGk9mouZ8XqW8R+V4im9n2+22H/5HYXP+K7wz+JZH5odfNRxK1?=
 =?us-ascii?Q?jptIcOHuudMqmRUelqpAOWPc3t2batAKDhTULgomOUEU4/ZmHdXe8L2KqKj5?=
 =?us-ascii?Q?bUAUnbIBy7xHxuoZX5CLWM0wd+aHIPYO+LL7sb9VLcP970+1GKZigA9CMEHp?=
 =?us-ascii?Q?uD3+gcKxirnFy81fmltEqjs8Ews2w1wtwMOi2qak1P5x86N9CKl70+wgpU7t?=
 =?us-ascii?Q?EA3AwHQDq9ZYeT+SVs1Y8M7JlnNbzmeK3gYDoNZ+Cxv80xQ+myKbWTCFed5J?=
 =?us-ascii?Q?8cUC0WF/Fg9S22zTvxGtt4/IAgrLixvI5TA9vS08W63eLFnsHpodOdW/mTne?=
 =?us-ascii?Q?HuBgwkXQX0et/+Jc87EINutKbbu3OjHb1JNNYgGEfTeGRcF4IC28Cp+Z7khI?=
 =?us-ascii?Q?OZKOL96ix4LeMkcY/Bzd2/syQFn6BUINoBncO8rvsY/Ta0zyymMa+uIFQ6ox?=
 =?us-ascii?Q?VCxRW7qV5UixVZMy48uv/0sUULudPWvFFS5waUibCihoDOmTGVAPjv8v86WX?=
 =?us-ascii?Q?rlt2VWNA/zyfchl3M3mg3Z9Nd0uAmtAYERBwnVDVRfQHoG/EldcBl4wDD7Kh?=
 =?us-ascii?Q?vnA6bXpt0JwkdBcHRh+zSKRSECqPLJxhWmmcX46Qiko0Y2FjmCN/VwWQqAGJ?=
 =?us-ascii?Q?VbiTAzy0A1fsJWacNDX7bMHBCKqDxq0Qix/T7mdiuFrkbpDwE8ZOLBZ8nzv+?=
 =?us-ascii?Q?/1VgtabliNV31iiwBY1PpRDr0JrtFKqzDQp48XPa2pAdUwDJ6BzwgdTK97iQ?=
 =?us-ascii?Q?3iJIPFF9047eNDnlrnggEfxx/NQSPceiKU451QC9OEjx8RuP0O14r0ZYgbIC?=
 =?us-ascii?Q?9ESVpH58vXL8b1S3neRcThVBM4cmCixJqZVkV6kl0LJWGgJxQrIvVLsVnFcR?=
 =?us-ascii?Q?2ghWxesgRYejuwKLrLhMG04B6BjspqdoTMAIohXM6KPI+e5DuiUE5ila4kSf?=
 =?us-ascii?Q?GUZRNvg3mAD+d4F0AU9lqQZBX7B+BxbbKo9qSTqOG7CIUYJHtUZxE1n8eEJX?=
 =?us-ascii?Q?vcN0BmCgJ7JwTljNj58C/evX0GynHx0matxBpWALPmTP/nYbxS2KRz/AYGEf?=
 =?us-ascii?Q?1w/eJ7w2agpAz4DIOMql+9b2255RX1+ZTIo4W695WlvcTKXqsN/StGUUJ73b?=
 =?us-ascii?Q?iWvvXud13GMNqbJUTo9Lp8Ze6cobgH1XR9wdfTWwfFXH9jI4zRAh/C+Kwqm8?=
 =?us-ascii?Q?Tn5kG5x+dVc+zD+lVD7lz2ZX3oTLCBVm28rDebnxB+lgWsH0ClytZA18AKC8?=
 =?us-ascii?Q?AtLb8irbWvYBMMyx5+A7Iq/H2ugexfTQPG9g5CT+vnsX/2dolgvtJPiqVw75?=
 =?us-ascii?Q?ID8wLoQTOODYGrT66FhygZ/YSJ9bu9IFruwDCTlU/dIZahMtWY8PBbij4jLT?=
 =?us-ascii?Q?L+hu4ojNtGNRQUEJ2Zo3uwzBWIsPj1B2FofsJTGzRBvw3XzvXamKlgRc+/Ia?=
 =?us-ascii?Q?VT+iJJhvhTzXLVKpIIXn874=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29980f97-1af4-43e0-e3e6-08dc221a35ad
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:14.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttaYoRAqWdkLLa7gGHzwcvTo4Hyxd+l66+ybjg1qgkR9GgCW7VRVScBycGjkhM2EIwgsf9j47RDiR/Gc6zeW1bGZX7wSBKy4J/suHchl7YyJAVCBv8CdCJurbQM3XrpG
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

Current of_graph_get_next_endpoint() will get next endpoint.

	ports {
		port@0 {
			endpoint@0 {...};
(A)			endpoint@1 {...};
		};
		port@1 {
(B)			endpoint {...};
		};
		...
	};

If it reached to end of port (A), it will get next endpoint from next
port (B). This behavior is not intuitive to user. User assume it return
NULL after (A) from this function name.

This function gets "endpoint" from "device" one after another instead
of "port". So let's rename related functions as

of_graph_get_next_endpoint()  -> of_graph_get_next_device_endpoint()
of_graph_get_endpoint_count() -> of_graph_get_device_endpoint_count()
for_each_endpoint_of_node()   -> for_each_device_endpoint_of_node()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .clang-format            |  2 +-
 drivers/of/property.c    | 24 +++++++++++++-----------
 include/linux/of_graph.h | 23 ++++++++++++++---------
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/.clang-format b/.clang-format
index 0bbb1991defe..e8ca6d577073 100644
--- a/.clang-format
+++ b/.clang-format
@@ -231,6 +231,7 @@ ForEachMacros:
   - 'for_each_dedup_cand'
   - 'for_each_dev_addr'
   - 'for_each_dev_scope'
+  - 'for_each_device_endpoint_of_node'
   - 'for_each_dma_cap_mask'
   - 'for_each_dpcm_be'
   - 'for_each_dpcm_be_rollback'
@@ -243,7 +244,6 @@ ForEachMacros:
   - 'for_each_element'
   - 'for_each_element_extid'
   - 'for_each_element_id'
-  - 'for_each_endpoint_of_node'
   - 'for_each_event'
   - 'for_each_event_tps'
   - 'for_each_evictable_lru'
diff --git a/drivers/of/property.c b/drivers/of/property.c
index 25d73409aeee..007729d66972 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -632,15 +632,17 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 EXPORT_SYMBOL(of_graph_get_port_by_id);
 
 /**
- * of_graph_get_next_endpoint() - get next endpoint node
+ * of_graph_get_next_device_endpoint() - get next endpoint node. If it reached to end of the port,
+ * it gets next endpoint from next port.
+ *
  * @parent: pointer to the parent device node
  * @prev: previous endpoint node, or NULL to get first
  *
  * Return: An 'endpoint' node pointer with refcount incremented. Refcount
  * of the passed @prev node is decremented.
  */
-struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
-					struct device_node *prev)
+struct device_node *of_graph_get_next_device_endpoint(const struct device_node *parent,
+						      struct device_node *prev)
 {
 	struct device_node *endpoint;
 	struct device_node *port;
@@ -696,7 +698,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		} while (!of_node_name_eq(port, "port"));
 	}
 }
-EXPORT_SYMBOL(of_graph_get_next_endpoint);
+EXPORT_SYMBOL(of_graph_get_next_device_endpoint);
 
 /**
  * of_graph_get_endpoint_by_regs() - get endpoint node of specific identifiers
@@ -714,7 +716,7 @@ struct device_node *of_graph_get_endpoint_by_regs(
 	struct of_endpoint endpoint;
 	struct device_node *node = NULL;
 
-	for_each_endpoint_of_node(parent, node) {
+	for_each_device_endpoint_of_node(parent, node) {
 		of_graph_parse_endpoint(node, &endpoint);
 		if (((port_reg == -1) || (endpoint.port == port_reg)) &&
 			((reg == -1) || (endpoint.id == reg)))
@@ -812,22 +814,22 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
 EXPORT_SYMBOL(of_graph_get_remote_port);
 
 /**
- * of_graph_get_endpoint_count() - get count of endpoint
+ * of_graph_get_device_endpoint_count() - get count of endpoint
  * @np: pointer to the parent device node
  *
  * Return: count of endpoint of this device node
  */
-unsigned int of_graph_get_endpoint_count(const struct device_node *np)
+unsigned int of_graph_get_device_endpoint_count(const struct device_node *np)
 {
 	struct device_node *endpoint;
 	int num = 0;
 
-	for_each_endpoint_of_node(np, endpoint)
+	for_each_device_endpoint_of_node(np, endpoint)
 		num++;
 
 	return num;
 }
-EXPORT_SYMBOL(of_graph_get_endpoint_count);
+EXPORT_SYMBOL(of_graph_get_device_endpoint_count);
 
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
@@ -1017,8 +1019,8 @@ static struct fwnode_handle *
 of_fwnode_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
 				  struct fwnode_handle *prev)
 {
-	return of_fwnode_handle(of_graph_get_next_endpoint(to_of_node(fwnode),
-							   to_of_node(prev)));
+	return of_fwnode_handle(of_graph_get_next_device_endpoint(to_of_node(fwnode),
+								  to_of_node(prev)));
 }
 
 static struct fwnode_handle *
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index a4bea62bfa29..80b7a579e96a 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -26,25 +26,30 @@ struct of_endpoint {
 	const struct device_node *local_node;
 };
 
+/* REMOVE ME */
+#define of_graph_get_next_endpoint(parent, previous) of_graph_get_next_device_endpoint(parent, previous)
+#define for_each_endpoint_of_node(parent, child) for_each_device_endpoint_of_node(parent, child)
+#define of_graph_get_endpoint_count(np) of_graph_get_device_endpoint_count(np)
+
 /**
- * for_each_endpoint_of_node - iterate over every endpoint in a device node
+ * for_each_device_endpoint_of_node - iterate over every endpoint in a device node
  * @parent: parent device node containing ports and endpoints
  * @child: loop variable pointing to the current endpoint node
  *
  * When breaking out of the loop, of_node_put(child) has to be called manually.
  */
-#define for_each_endpoint_of_node(parent, child) \
-	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
-	     child = of_graph_get_next_endpoint(parent, child))
+#define for_each_device_endpoint_of_node(parent, child) \
+	for (child = of_graph_get_next_device_endpoint(parent, NULL); child != NULL; \
+	     child = of_graph_get_next_device_endpoint(parent, child))
 
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
-unsigned int of_graph_get_endpoint_count(const struct device_node *np);
+unsigned int of_graph_get_device_endpoint_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
-struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
-					struct device_node *previous);
+struct device_node *of_graph_get_next_device_endpoint(const struct device_node *parent,
+						      struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -68,7 +73,7 @@ static inline int of_graph_parse_endpoint(const struct device_node *node,
 	return -ENOSYS;
 }
 
-static inline unsigned int of_graph_get_endpoint_count(const struct device_node *np)
+static inline unsigned int of_graph_get_device_endpoint_count(const struct device_node *np)
 {
 	return 0;
 }
@@ -79,7 +84,7 @@ static inline struct device_node *of_graph_get_port_by_id(
 	return NULL;
 }
 
-static inline struct device_node *of_graph_get_next_endpoint(
+static inline struct device_node *of_graph_get_next_device_endpoint(
 					const struct device_node *parent,
 					struct device_node *previous)
 {
-- 
2.25.1

