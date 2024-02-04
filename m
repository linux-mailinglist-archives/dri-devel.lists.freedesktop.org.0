Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62357849555
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528D110E501;
	Mon,  5 Feb 2024 08:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="dUESpUC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E6A10EA07;
 Sun,  4 Feb 2024 23:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlL2dRGMsTIvtqiA/w1SVs36/siA9y6+PxzLSBE4bkZ8PZgTGGH0iQMpuAu3Jq94/I+xFZRrXo3DjtRn1CTEczzvVB3HYv/MbGMu/as0l7MkQJqjOuxXJ8hwQg/qNfp3d9wGC6Lsl/QzF4pcdPWe8zec+EcJ+xuaryEXcZsJpz5ItLpAE/tlXU3zx55IOy4XcFBKu8XSbjtNJ4dMKLQVsv7JgJI/IK7RfMX/rTgVB5Owgr8BzsTl2HF9Np+TLpWcpinvuAwN/Jt1R+8cayi68FNlqpgRd1DvYrr6qiiTKeytWR9XSnTe0oF/7IydhIOPAlwFUKDcZM2r/hJsEsWanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAIGVyqVDt1okm0zADf/MCqj5u3NVqHjHiCFJPiPG6E=;
 b=G/MSoyvLj1hSW7K8L92orU8tatdo7q3n5BZLOttGhL0UnX4eHWiWcwUYobA8BUZqnBVNQvDnuoMDEYtmvCB5QrK59rH8hKHU960FngbHpnRlVno/E49jyO/2U9Upb0Yv9+Gv9gX9zVUmozYqVYgYibZBPOJHZ7Zr0olZZ9CqTLFBO67EqW7V93W2C/HBNKh1bWFfPfRF3bpTCCCSgufMS2a0of3xZHk5SbCeXlocWW/GrO+7UGY4D8j46npqeYx0J4uSQYCjAR6bY4dTlC8+TAsWJxvGDetztmq2tLPZGWMp3twwoW54lepV/4c2rHj0sS/JZwUMsl8dbSc2Yk5YbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAIGVyqVDt1okm0zADf/MCqj5u3NVqHjHiCFJPiPG6E=;
 b=dUESpUC3D7P6nU5PeIQfjD8E4H9/8Mi5dwrPWIQLg5dBBA9+iGitBA88jCILFRlKDbjYMkWZK48bzcdMM54gQRujOE5RBA+FBgpE1v1q4ZUoDuH9pTBPXS+s70Mj/cgwPuPWCDbqwSTu51f1QVG0OLJWnuHzWZqasZ+9qjkZ76Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10656.jpnprd01.prod.outlook.com
 (2603:1096:400:323::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14; Sun, 4 Feb
 2024 23:44:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 23:44:40 +0000
Message-ID: <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,	"Lad,  Prabhakar"
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
 <robdclark@gmail.com>,	Robert Foss <rfoss@kernel.org>,	Russell King
 <linux@armlinux.org.uk>,	Sakari Ailus <sakari.ailus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Shawn Guo <shawnguo@kernel.org>,	Sowjanya
 Komatineni <skomatineni@nvidia.com>,	Stefan Agner <stefan@agner.ch>,	Suzuki
 K Poulose <suzuki.poulose@arm.com>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Thierry Reding
 <thierry.reding@gmail.com>,	Thomas Zimmermann <tzimmermann@suse.de>,	Tim
 Harvey <tharvey@gateworks.com>,	Todor Tomov <todor.too@gmail.com>,	Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,	Yannick Fertre
 <yannick.fertre@foss.st.com>,	Alim Akhtar <alim.akhtar@samsung.com>,	Fabio
 Estevam <festevam@gmail.com>,	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,	Jerome Brunet
 <jbrunet@baylibre.com>,	Jessica Zhang <quic_jesszhan@quicinc.com>,	Jonas
 Karlman <jonas@kwiboo.se>,	Leo Yan <leo.yan@linaro.org>,	Marijn Suijten
 <marijn.suijten@somainline.org>,	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,	Mike Leach <mike.leach@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,	Sean Paul <sean@poorly.run>,	Tom Rix
 <trix@redhat.com>,	coresight@lists.linaro.org,	devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,	freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,	linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org,	linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,	linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,	linux-sound@vger.kernel.org,
 linux-staging@lists.linux.dev,	linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org,	llvm@lists.linux.dev
Subject: Re: [PATCH v3 05/24] media: i2c: switch to use
 of_graph_get_next_device_endpoint()
In-Reply-To: <20240202174941.GA310089-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
 <20240202174941.GA310089-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 4 Feb 2024 23:44:39 +0000
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10656:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9702a3-24e7-4d54-2b1f-08dc25db4164
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /O52G/Tf4EynOcF+CqlepmWEhaPKnRSC7dHmtSIHmNjFXLCtWrivEuE8w7zTy0crJC+Kp05Gy1W4kVB6ir6xcO8b0+sLfhM9YgHBbcwzx4k5FWm5mM6Qtig0wWJwUvdGYwihvC+3V4AC1Wg4mimEqp9ocfNxQEGDr261+Xo7WVJgBNT4mMmZA0VTJCPw39KTly8iInLeEG0L9RqpUPmt1w+WpewISnpi2a/cZ28hUdk3Qx+FuqJin/ERQtbhrkx6r2iJ4MM/0H20HA7TdyR6rSM5WcjUHpxcbADjhHpAbPR0WEOgkhol1o2izt5i9ObWqNz9YNy4+EHsiWZVd42jorfk+6Lm9ItSfbh3/syuN+adMU+a3vd08c1f3rku/PI0qDsgliiproGiY6DVMYNpG48pqW3J+h6KSHa3xZAPfEDdkzVkDA2G7ip1EgE12hk1RePaldVLx/LftupAoyRYfbPI27gyRoVf2pfS8x1jot4OTUGYq0xocxCpGGWX8QVI7TNbC5L4It9DKF7g+6UL7mINFX97/VXXzsqbE/94Ka3CQZH+0HwiM2fhoSZoi4BFdGoFLALGTlYiqlcnqmFQPcxFLfLA7esClBdQ8CAWq/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(4326008)(8676002)(8936002)(66556008)(66476007)(6916009)(66946007)(316002)(54906003)(26005)(6486002)(966005)(478600001)(38100700002)(36756003)(2616005)(6512007)(7416002)(86362001)(41300700001)(7366002)(6506007)(5660300002)(2906002)(7406005)(4744005)(52116002)(7276002)(7336002)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MlOk4Y/sddMQ2YpdYHdbIaOjKUW1atQ/ZAkXUtAY/udPsvSEzQ9wb6w4+9+8?=
 =?us-ascii?Q?16VIPm0Om7pDBamGT853Es+d7hy+wxbWlMU3kcNkuP+DAn0EImtAbpOdXjcH?=
 =?us-ascii?Q?OjXCfnjqy5XlsYTOjQEMv5XFJn9QIp1Pof3/uFQLv2x7jYHi4oSaOemQFXhb?=
 =?us-ascii?Q?QdMDNwsfMx1uWMN5IgmHYyg8iDRKxneb12fssDp24dSBDw6/mrIho9I5bIAl?=
 =?us-ascii?Q?MORU8FW+DfNXTE9i0/IlhKcaqA5oon5WpH7p5xDQu85KFCiMSxGq7X7Ww+od?=
 =?us-ascii?Q?aRmfHONS7Gpo6UMMwiCKwAEvBQC8PBCv4Nr4aGSrWXV7a0/dHJacqnbaVEBS?=
 =?us-ascii?Q?0elyliUF00erR1BQVIUZgVTgOeI1v4lPoEijOujFlFnt+Rbhl6E/KiauXLEk?=
 =?us-ascii?Q?qmly06ccIQcVZle6EcA6BMFsfV0viDT5YoVwHzBIWFysAdyN+4CCKPoERS8N?=
 =?us-ascii?Q?rsuvx3BG5ycwVXeUD1yowGjjO1NF7NmX4eTxsFnOdIi70LUs3edxFTQeOQHN?=
 =?us-ascii?Q?spBmqxPzXCokgy/uata4WktGY/6qXMBAdwr/EEjSmxmzKo2fRJ7pevzp9pLN?=
 =?us-ascii?Q?mLarsYujvZk+avqcbI71Mk1wKScfmz8qqaxAf4RoTYzyxlGFBpjbKg0FgFcN?=
 =?us-ascii?Q?lC6G6jPiZ57QNlEAk/KB9mGLZzKP6l5HfSxdxkKsMIeC7MAKMJexruFRJjdG?=
 =?us-ascii?Q?M1GHAqylyyfhxUwwKJ1BDhKz1oGFa4Rva5HK4peUcaccoGMckcQdFnUT1x/l?=
 =?us-ascii?Q?8WpUxweIkdcq02wmX2hL+cg3vzaXD8JXpPLLvsu5JT2OF7cCKryqlN2VycBZ?=
 =?us-ascii?Q?SgJW+QPjAIh/BPSYOtSC3yg3JoIZ8y03HyA9WVzQWw6NKiegYI4Uu3PixzGX?=
 =?us-ascii?Q?a+gCVAIGpdvmV8WzvmLBbM7Thdv2LIB0wH29R0YK5xBHMzRRs9wN6KbU143T?=
 =?us-ascii?Q?HUP66jrA2i/QuGvSgE4d7MNzoBoHpuyLOJhjbgHtAx8SrA3AfQ2VGEMcAGOq?=
 =?us-ascii?Q?ACWB8BaIYcTHB5OO27tai+9ezbVvbwhRHaChfAxOAZo/2kWhEfV2NEyXWN7w?=
 =?us-ascii?Q?Xmg4ynr68iMGMdenbsM0zhry1BKsuki/t/1Izw/6ouFnuQnXamyBYOnC7I27?=
 =?us-ascii?Q?y0/3H7oIHr4wRkagezECt6IJ2LdJsyGwOaNFwHBOx/ZHNALAFL5tzOXeYkGy?=
 =?us-ascii?Q?GwjwF6OX0MFJYMg0Gy7HYZ1G+0HlU+yKmILIL3GtQTv+oiRaxoW6y+ZcjFir?=
 =?us-ascii?Q?02ALWGgznThFG7IAiUL07L1WbFcx5aPxONUMp72pagrPaO0/cacLHDOX8jV3?=
 =?us-ascii?Q?WGq8wtnSTrFg0+M8d3kOk8UPnudW+XkPwV0DsZ5O4ht8vpoP/u1lafOEhfBm?=
 =?us-ascii?Q?VlNFEqUYYr9mQskQ0NQqDIqg9p9W120bGkdjJZe7nGBJDedVlvVOkNbvkveQ?=
 =?us-ascii?Q?jnZQxVAoLRulrLUIqByzrlICGxao6qG+p5RwFC0JGaFafuJWcHgrIE+p96Oa?=
 =?us-ascii?Q?kanv3Oy9e3D/KBKbY8hcDQnKO65cXuMzb+KRWJ2VwvprFSskYwcKt+82BugF?=
 =?us-ascii?Q?ubjnn/VZZAg4DiHXRXltfRS/FEFvAXXbeSN5TtI164qE8fEO3+7bZELmwmF8?=
 =?us-ascii?Q?YueRChZ6xIjhwbKZh1GH/J4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9702a3-24e7-4d54-2b1f-08dc25db4164
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 23:44:40.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kjz26qbchml8CHh6clYPS1ycK8vwv3eyyJSmF5HgNCf49rF5esw/Tuz24MY6Wj87Zxz+cVpyjTQcx1XymcJbKt0T46SF360Kx0R1bL8HAvASpMJALlHoRaCE/xNEUW6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10656
X-Mailman-Approved-At: Mon, 05 Feb 2024 08:26:04 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Rob

> This is assuming there's just 1 port and 1 endpoint, but let's be 
> specific as the bindings are (first endpoint on port 0):
> 
> of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
> 
> Note we could ask for endpoint 0 here, but the bindings generally allow 
> for more than 1.
> 
> I imagine most of the other cases here are the same.

I will do it on new patch-set

> > -	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
> > +	for_each_device_endpoint_of_node(state->dev->of_node, ep_np) {
> 
> I would skip the rename.

It is needed to avoid confuse, because new function will add
another endpoint loop.

see
https://lore.kernel.org/r/20240131100701.754a95ee@booty


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
