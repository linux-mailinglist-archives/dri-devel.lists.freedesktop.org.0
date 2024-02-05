Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F259084AAE9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 00:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8730310FD91;
	Mon,  5 Feb 2024 23:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LdM3kakP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7656210E241;
 Mon,  5 Feb 2024 23:34:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSncuTQQRUMza2hJZa7n5crJoCJb+E8Xl9OQjVy9zKW3rc9yemcA2ZVoBia3O6hm8I4k49nm/2wDnIkLKmAiUf/clAioaoqZvGrQTrhvl3VxgL0j2UTnOZuK1u7uXGjR+ipARIhy0T5qBRMyKovpbOr83mWK3BaUwJBY02yWAW9rqQ+3IsMbRyIEWbeNPmZ/KwCXjZLlldFNiBhoYycPJocmviYHSATdLgTP86MRS4ck9aAKR9iZ++MhGzYI6q2o4WviX2A2k89/u0UE5aPuGpXjg2Z91B6Xu+hTwBzxMGPH8LmfZFP8tKGP8k2594mtyRMzMi8Qskg1kIs/UjnaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6CTY1AE3rULai2Q51dhU2cOWwixx0Jb0zGXhDmQbK4=;
 b=PG741DE+EYVLJs1Ezt9kKWKPLLwIKl4c9M/G/ficgX8cERwYrZOTiH7XtkIyZ5tIIjtiMRYe/zNXHFhil4Sa5yfeDJgshCf8Ja/UjuhRunuozkNhR/pA5uagKekYzxsrTxceWIEbSsVu1HjNH7rSuEjK29G16/nWhFZjA8n5wWSjtiPulLB7lLHO6ZwCm56mtCcc6KU7VV0idDMZRT0F7ITR+g1Crp0XF5KNXoFtMcu+Lu4jmPXRkX5L72sGapqGubRg3Uo3irJBzcs6YKMTkBIiQTwEPowgaD/QIs8jKvWnLOAy7NsrKDwEn5dtOEiqSnoKeOwnQ8FK3n+FVaGfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6CTY1AE3rULai2Q51dhU2cOWwixx0Jb0zGXhDmQbK4=;
 b=LdM3kakPz0Gu1LB1SkQiYsY3sOKjhyBHLnJYZqliuP2WuwPNQDLsQBbKrEepvdxJQgtrt1PyBeNscxaOgN+LzlHaWOis6u3LaWHJNZ1m1TWAdsuavp7PDT9ZzmgC6vC3qYVryMbijBXsnqnAR427m7FOFXYxyMEN0/DMHkIfLNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5621.jpnprd01.prod.outlook.com
 (2603:1096:604:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Mon, 5 Feb
 2024 23:34:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Mon, 5 Feb 2024
 23:34:04 +0000
Message-ID: <871q9qpjtg.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <20240205165517.GA3486840-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
 <20240202174941.GA310089-robh@kernel.org>
 <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>
 <20240205165517.GA3486840-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Feb 2024 23:34:03 +0000
X-ClientProxiedBy: TYAPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:404:29::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe7e1f7-a8c1-4f9d-aee6-08dc26a2f09b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R03WMc6xoMjPuunVmHoqrgpDL0tud2ZU2G/xDUyO57Wv/gkQNewAh8XaaPrfDwm+3HFpYCYifn+ghnZSkbbMAJA/ak5F6NdSssWAFHIX2qhjnRVOvOldMr6cHKsCHcslQh5SQAv85HsqNpHL93BsMfecMQLdzo1bmOwr5Zd5n5ww5fhUz3JspN83FgviomVORLG1WMsu7VH3BilhlIR5U1fFl6pOpByAdDBwvJ0TKYhSY9fXgO4F1J9KgeOmnh+kxMWITjbv4wibjrLWKBJDJl0U0inJ1HBHmdlt0N6wCEIJCAqTypm69hnjrlkReVijYglx9R8yZkyT+tYkZ4EA2GCsReBYlC3LaKD+VK70GoowpeE4mmn5RbTYz7O8LNEvoueMkFKGCnHWwvWTyzDGc1QHH3gRhnU33wwxEV7PTcf/PZQ02wC+XDNedLdo0H+a0+31180skN6jxaMUFgXicA44GzgjotARWvfxCbuP64qd1PmjDp/DYIqYb2UFyr710JvBJ4taJ7kqHP1gi869ZqPDGVn4JaKygQOgzjFeEQzF4OzG+2uUCOl5pPuMcM8B+dkUR/6oolLBj0nKeaEscleSiGzXyztA9oK+xQ92+Vvgtv6+SIm/fn+jTLGGaaDr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(6486002)(36756003)(66946007)(66556008)(66476007)(54906003)(52116002)(6506007)(6512007)(478600001)(6916009)(8936002)(8676002)(4326008)(316002)(38350700005)(38100700002)(26005)(2616005)(86362001)(5660300002)(7406005)(7366002)(7336002)(7276002)(7416002)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYueY2tTFnTvcjbzmfnnVLDV0hb93H4eCtj3dlbjh1K4m55NXcs1sbvoGSXn?=
 =?us-ascii?Q?dk14v4gUOVRve2l2Ish8uRnZZ4XhOC1ymtzCTXQknP2rseCepjw6gYfatmSH?=
 =?us-ascii?Q?hxlE6aN3UW+J+iJpPnqSYyvdLreYauOwsQyB/NR2a5fmTRUhupe/U5xwYRAN?=
 =?us-ascii?Q?zWUal/mCYlA27/pvxmimsGIgJ5e81vA8r73NOvDaiERtjseZogKBWxMa/d11?=
 =?us-ascii?Q?G+oXkYgNOlb7CAztNGUb9tABrsL/RhTUFCtu5NGWO65PMZ4cAbRBMe9YI/+O?=
 =?us-ascii?Q?slQrvmZYIh3QoZWCjQ0oYzeYVBgxrsnyrxwzq57qhXrwk1s7F2eFTz0ySVdt?=
 =?us-ascii?Q?Dpa7EKDM3OZnO++e8mj1KapWryQ6d6UDVvPDlDWOv7GmzHek2aS22CdVDZSa?=
 =?us-ascii?Q?uryJOqtA7uycyA2jpOECQZ2jhvYPQuzxVIM38IzwSphvLPxzccCFtB817blW?=
 =?us-ascii?Q?R1dwLKJquWxwvgH8p0yVN4q3NO70crkOs9nRNLo+AgOl3PLG1JrlH+RV/R1z?=
 =?us-ascii?Q?vOBirVGaDtMwdsmqyeaRMiK259kPz4bGmYd6W9TpZOl/jqW6fgvd972k9RMS?=
 =?us-ascii?Q?2Q1txnpj57dlyaePjdb4QVz8XA/hOEpWB39kFueje1Qsj76F1fz8XNgYDtjF?=
 =?us-ascii?Q?nPe3sefVW3w7fDMWM++SBiKxddG20KTQg58gojHuU6giFDNZdMBwIPUGGOTL?=
 =?us-ascii?Q?cj1u9jA/gKQM1CUlhBo0XvItN7O3oP2SHEbCFY3Bdp7X52sOkX80NDk7cv4E?=
 =?us-ascii?Q?Hws458hBAPRs3BoOtafbr9WDvYeuEaW5Oo0yokVrvr77zzB159KQ/1ee/+W9?=
 =?us-ascii?Q?jNkyoio/2NlhTRPQEjxsX5Jl5INXEbZRocrjHNgisg6kytwxkZmUY4NxvxVG?=
 =?us-ascii?Q?SGSxYqB258SKBc2XrY4TmworovQTlqLzaVneUAc+bqMd+BWSORoVZyU8FPIa?=
 =?us-ascii?Q?q76/30vEFmbnUJAuKI3zKUJx7IpQVUCKGz9dYTA9GgvHYl/c/LuXhSTvJ5a0?=
 =?us-ascii?Q?jTlpohDUEOuoA+qPW0LrIORgrVfOCyTi3J25KhwJfxk7VTSV8tM6N/CrQ328?=
 =?us-ascii?Q?MOM7f/fifRzSeIGDQzxmTa019BMkAuEc9IHsy6RK1qJOHLt0oAbp9EoT/nSl?=
 =?us-ascii?Q?ZkNxm3ExpePj2gesPNTVhgUzEj4xJqZCDVwQGUdo8HXzXMAzDTBSZ8d2Z8GD?=
 =?us-ascii?Q?lK43yJC0tZy5GLGgGEbSAuod/fHcMKcODYWiiS7lnxDVx4Q66hgUVCBWq0y7?=
 =?us-ascii?Q?559fu/S6d83gBDN4zrm+RwvnqmY5LspM+/a70csQoqTpmprGkKMYkjRNpBrr?=
 =?us-ascii?Q?tD3wQCLjSIdhyoeGEt+3vsZYJ5+06Zed0ULR/ZP2BW1HzMGZXxYRne5nLFxs?=
 =?us-ascii?Q?utkKo4wKgDqGkDnTZNMDwNNcAY0N2EcoBjHHhY3+PRCkgItB1erjkjqfw3h7?=
 =?us-ascii?Q?iFzOeBXQ39pJux/3T5h8NeGJHdUNFzRyhjlUVGQrryTZFokbbpmlj5U85oZ+?=
 =?us-ascii?Q?Sqs4QlB1BaRLmh0dCjcALywQPVQwatjwFmZfy0EHC9BJDWFAq8GeiTQgFVIG?=
 =?us-ascii?Q?273gBU2/1s15zvVpu49UMZ9lQEtd6d6whEOTXgrC1mLc8Oi2r+7RxTCyruJ2?=
 =?us-ascii?Q?O+yYzChOstN1QM7owDBZG04=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe7e1f7-a8c1-4f9d-aee6-08dc26a2f09b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 23:34:04.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F57SjbVYIdTnAKUq0fEW3bYhZPCvtoKU/E32wStH3OvWgE+2xmKubE9TVsW6bnKXdOA7MxYtnbvXjGgHmq2trvTAt4CzKtuZmSGpuUV1sNJ86gJ6qF4WFAfMwMWghu7g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5621
X-Mailman-Approved-At: Mon, 05 Feb 2024 23:57:32 +0000
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

> I've read the threads already and think you should skip the rename. Just 
> put 'port' in the name of the new one.

OK

> That and taking a port number param should be enough distinction.

I think we want to use "port" directly instead of "port number"
on new function.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
