Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC338452FD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 09:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5E010E629;
	Thu,  1 Feb 2024 08:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A4010FDDD;
 Thu,  1 Feb 2024 00:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtSeVEFv817iAvRHuTIDbLHaMtxP1PWezYINK+bWcRuPREIZvskCxHEKaT+AbkYJ2X8O/68M8qTo/ogegz77mNwOWGjgJZe4/1MmRs0BQ+p8b8tYzZ33oysoMbq3xnM+uPcsnw4EdJRhg4Q/FUtFeUsNQKagPodhKxn7PhemNnAnylRQ+TtsLTQoI5K4oy0bocaWwbxmvvQPiwRuqiLa7cn+p6qBL/k62RxeAypYPwy+VW6TPNeV0WJ4Ok3UdmziWL0mA2LxHJtzsDkP2xvkUDhCBPmPCGJ7xporm8ae+e6Z/AiMihjRhhwxX0oB9BWmD/pmTb3lfjmfqael9BUI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7mT296RnLHvdpqTKC+Lymts/WW7RIz0sJlOGe6xOs4=;
 b=f4fZFRnZ2stoFTkX31xx6MmRY3ZA8t5mGfIPDVbYzg/BUO0QPOOzmgAblyAn9DsmX7cGANyjCHP27UhGyPxCscqhnl+Sw2oSVDTWo3xHNenM92KcxWJRLobqAgagUT6mVVTbqa8tuIbHcKCGrvll5hsIOA4bFB39eS8oSqxPPe15dPCDn7j4BNhKYrfXl1Kj3uc7rRQ98MhrcKEYxe1tM/MiIEPEiFDPeP2prfydn5XZdy5qYK4xIQz9as9EOfP47CJ7Ko7+w2CN7Ebgk52X5klcVLjQj6vYV2OEcWYbK1PzUE+BsnY84NfI+hvFiP9w5RBw1Pziji3gdmGF4XuLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7mT296RnLHvdpqTKC+Lymts/WW7RIz0sJlOGe6xOs4=;
 b=oVDLgoJgojG/VGeo5YNjH6DZH7tt1oQMG/82QcxuyB5sbNmNqaQZVpTRrP4K2TFEy9OdYwJAWUe0O2uc00D390NJBRG6Jv6JqOgPRZ/W9L5AEMr/AyUR5XIvxwPCtnNxbauZtOtESgvaczH+VYT/sBiu5Wf9mHWyWFjgyjj9l/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11377.jpnprd01.prod.outlook.com
 (2603:1096:400:3f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 00:12:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Thu, 1 Feb 2024
 00:12:24 +0000
Message-ID: <87msslniu0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 02/24] of: property: use unsigned int return on
 of_graph_get_endpoint_count()
In-Reply-To: <CAA8EJpoRhS_yvJJUuC3YkWRAKT7e03k+-K=6QKfL_6TkB1XoxA@mail.gmail.com>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
 <CAA8EJpoRhS_yvJJUuC3YkWRAKT7e03k+-K=6QKfL_6TkB1XoxA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 1 Feb 2024 00:12:23 +0000
X-ClientProxiedBy: TYCPR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:405:4::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11377:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5a76be-1638-44dc-47b0-08dc22ba776b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ce3o2XhdjwEmexdxfd6TsiyijBesvytRBVqHJjXrvpqdO3slPPXdPYLvmZlNgYgMebGBaQZJlTTnNsQBmN/BFaDvIeB0vwUuMCnibNz3Kb8JOjx56W6h1PLWSx7oEdUllVIHlvnVvCdmAfkkTG6Ek2USp0Dyjhy18FUUPy8AzWv1pj4UK5iOlchOdfjG5AtoekNz+TYL3cdOlTFDPk8BjdM1wdNznqFIsIsNSW4HRhK0Ngfi6+DE9TVfS0j4zi/Eg5fYXyB7dQz34LRDFDs+po7IRkJt3R6/xNpo5O5Up2BQwcPWS861MeJQBn/b8+NoYWu8duNvcL2eza4tUFoL4of4QZunvY9REbPR25na1cCIrLRCeqGEpk+X7LSk6+RNNLiYTuFuLm274QV7W0YxRpVNHC7GodgfP1TNvBMnT1+XItSRLJ+1Oyy9ekgDEOfafZMOu9VecWkNPNEjjKCKrk/0FJ1dTrnfLgcfzY9O2B++PXGG5WMtzl6LlT9srr0P1TRoWCgCwq2f3rJ9bZj+dYp/yb9NCUZxZGa7NS0lQMIbe744gdmuJk03nnwhkEdwGxAoALSatVS4758CJYGA9qll7njckZKvSKXfXDihYy6aflJunRo+sOT9ohLnSgsp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6506007)(26005)(86362001)(52116002)(2616005)(6512007)(316002)(66556008)(7336002)(7366002)(7276002)(7416002)(7406005)(66946007)(66476007)(54906003)(38350700005)(6916009)(2906002)(36756003)(38100700002)(41300700001)(6486002)(4744005)(4326008)(8676002)(478600001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TNYll6zN+fTlmxQsJNIIBDnU32d+vM6lN9+8PQpcL9VRS/kntZeUZTM3iHQa?=
 =?us-ascii?Q?1kdlsCasVWgJBcCl+EQTf9Qn69nKHMoO66oJmOoWr9b8L0MHeAj6nFlago7i?=
 =?us-ascii?Q?hqDYwKAE+fqoTKal8OvlOdb4QaGdL7JZuOtX5uJCHY8SrOsq4WSUzA7lcqqn?=
 =?us-ascii?Q?YYxu9+PoOFJztL2Df6VEOd7gfeGBsy4P9ywBN3G1fzwZW6CmVZol6VPe04nw?=
 =?us-ascii?Q?Y8rBRPZU2Wpdo4tabKhC/cUva2jYA2LLQYhNyVprgpeiCRVDxHkoYUGLs5mr?=
 =?us-ascii?Q?iuOTi4lUDNA5EwqbM1KkbEf+JHTS3XI/vJbRUpKTTjhjxUgZ2hsq7vjnI6ti?=
 =?us-ascii?Q?UJ5wIEi/A0tDJSxupP4rfhcmkDmbGMepn0mdZb5GtqB7zqF+4FwGMdP7Sf47?=
 =?us-ascii?Q?SsEulLdCK7+ExIgdOctwd9PzydiKSJzp83eHEiQQNiU3zO5vsfHO3Cb7V9jR?=
 =?us-ascii?Q?qwLo55pySDgSdpjCuwCZrXkE3MeI2Zn38Hj/CGmL8iUG3aVd/TR/LSEGDyqH?=
 =?us-ascii?Q?mjz22IIgNc8ieavGgehflMI1RsBT4KsJE7tuYkbOu309EBNFxbjce2L6uVls?=
 =?us-ascii?Q?vIOOuJMFWYmtQMZCWgBFUPKgJcLmWQsp5wk8/k/o0yUIeMP8oqhQ/kB6Qe89?=
 =?us-ascii?Q?6JiFt2MuF/Fu9MVwjE+XbfXhW0SAXMv0x+W5qYdQ5WdOxmCQeTsGryWru6QO?=
 =?us-ascii?Q?pocqG6VaksOYqH9zRTW4LL/5wcdwWcqNftKWZJYAbXrFx1P3gkKFCXLo3c/m?=
 =?us-ascii?Q?BGTX93g/B0+fTFlmTAdsXfPipCiTt2JkVQAJpPIWIdDyVaIEi9oeIiHsfiYH?=
 =?us-ascii?Q?uNQH6bgzzfNDNvS5e+UXUE42UmE6MpuvKuqfdjpoBHpbfrS2kSWhnURg6/Ce?=
 =?us-ascii?Q?5CZUlamnbd8ZmebvitT/BAmzcjxNkUq8eQn4jWTNmkP3wOwWVQcC6QCxCPWA?=
 =?us-ascii?Q?+fuj7uvQrLohf6PDWGW1SXOINQHfrMxdcgZ23/wTIfjSy4XZfLTQXVNGjk+C?=
 =?us-ascii?Q?leIozA7sHpzl2Rla0nAfenLiikJToN6KXK6X59HzPLls+78CSG262LF+57LD?=
 =?us-ascii?Q?qs4q+afb+9n44FKl9ScvLcZRdvzLgpL4mOZeCr+IS/AILBawLvRhtunRjw1Y?=
 =?us-ascii?Q?NAcAam8w7zTe2/M8JcpHvfxxDFkCisbel5sdJgdcKS/2zF+itYxZ1pH+cD0f?=
 =?us-ascii?Q?YE2FbiU5WahO/5FhxIU359GKeeRh4P64IGwYIHACOrW/egoNoPBdeBqhbGiu?=
 =?us-ascii?Q?kDCnyu0X2fimM4+EiW89cWpCR/PEE0In86tOopZUtwwbG0u7jMQ/SBFHmtws?=
 =?us-ascii?Q?1P1zdc63lXbcgQKZKWPcPR46IBEvHDmHXg0Glf3mckCFFeYSSEGlAZTC5P4Q?=
 =?us-ascii?Q?vZx8UaeAJtz+9qoJPYmCJ3fIStir0TYWCQ0naDsx9W6wvRqvlp69gHYHN02L?=
 =?us-ascii?Q?TAXrmgmrjKdoo1BWutXLySw4IegoNpe2Y9RhqO3lXa/ZQ74pmCSbvEv+qfP1?=
 =?us-ascii?Q?28neuoFdwo7D9adVHSeYOSJK48r2KI3FQMyiLPG7aZ+TAJaCDbPsVuonz7wg?=
 =?us-ascii?Q?vf9XVbX17tCbnv/ORLVrvThbFwnHrHu3cCnFEI0Wn4SRZeE9dX3F+X1TqbrZ?=
 =?us-ascii?Q?yVXGnrPuKH5EgVFPZQZFIIo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5a76be-1638-44dc-47b0-08dc22ba776b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 00:12:24.4473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vunkfxMX/wtDex5syvgE3CIcmK7vDAXE2n7OcQ2uevNusX1kwO03ubZ/AkSX2xdIsrtnlwgNuEBLWUNwP95TM13W83/5RFGBxA0994S4RTNgQGlIQXcfgDeARmWaI5ih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11377
X-Mailman-Approved-At: Thu, 01 Feb 2024 08:43:22 +0000
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
Cc: dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=C3?= =?ISO-8859-1?Q?=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-omap@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Saravana Kannan <saravanak@google.com>, Fabio Estevam <festevam@gmail.com>,
 Helge Deller <deller@gmx.de>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Niklas =?ISO-8859-1?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Harvey <tharvey@gateworks.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Emma Anholt <emma@anholt.net>,
 llvm@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Todor Tomov <todor.too@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 linux-sound@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Leo Yan <leo.yan@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dmitry

Thank you for your review

> > The return type and the variable of of_graph_get_endpoint_count()
> > should be unsigned. Tidyup it.
> 
> 'the variable'?
> 
> I'd have added a few words telling that return type can be unsigned
> because there is no error reporting for this function.

I see. v4 will be

	Because of of_graph_get_endpoint_count() doesn't report error,
	just return count of endpoint, the return type of it should be
	unsigned. Tidyup it.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
