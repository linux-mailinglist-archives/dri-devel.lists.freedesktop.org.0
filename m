Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A98438C5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA02810E02E;
	Wed, 31 Jan 2024 08:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431ED10E4B2;
 Wed, 31 Jan 2024 05:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klesgwiBtSMVwgmKdSbO7v/O0olDsJllw0VbUEIqKPaGLl5+UcI1F19GI1PEB32wUHBLzL18SVFnVQRC4M6KQ+dXq/nZE+VAJW45Tr3C8LkwkWQUhhABPv4YG++rJpILEUORetcof3A2zSpoasjMUPyzHnGI28K6aWpUMe90MRcGrtwpY77ZUhQdsu9hZur0XLTYGWXLNli2bChU8ip8nl0KE2Z1Z4ufWt/Fga0j0q+LTTIOdTBtK/jff1LQdrLzZGFI8zr2tPYKAzZ+Ab31wjDv1b9eUoIlN7qRbDr71F9FW8JuTqjOZl/Otl3X1KWLfJ/eQVUI8gIClYQrLEMCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maeIPmsW4DZ8V4nBY6QneZZ9SJtcvkSRsiWuHbWoEn4=;
 b=OQaUMWxCOXsYvlyAU81m/0FC7vAx1fPuPzRo2wWgVWJnaTKVIWWG3Yf6n25/pSpr0rtNP6tZwPf9+c0lH0Y272GeT4NntM3zfmfwlmIeVwyGfQPuKnnbfVlwTtPTg4bcj4ZnKiwZ8oHcNaXqUEU9PqVjmJCYa65K6ea73wNWVM2IvJJuxls5IQYsuby7bPQr1pqcA34twZVUQGLCFaEnF2yukJMR1t23Gas4Dr+7IhXyImLZ+lWhildqZZdyynMgMGPQDXfvwSm+EVrI1cpp4aZy8PdfSgxS3NYtKi1jFSHGguWs9kV6hYC6Ej8RZAXbJ+D542MTadTlUCm+jW0k2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maeIPmsW4DZ8V4nBY6QneZZ9SJtcvkSRsiWuHbWoEn4=;
 b=Z3CyOxTY0jqFIFE1y8IC/mLd2SVm38weFyUXU8K9khvqHL8miWx8ppkAGV/e5r71FCcqJbN+dvfFIhBDffLedP5iLVO5gtc0vSirk8bsdBbsiUK3HLM8xUp5khFdqWV7oDmQPZxSje3EkjWyP0jb59lbsTV/8ennfnC/PjvoVyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:04:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:04:58 +0000
Message-ID: <87mssm6qkm.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 01/24] of: property: add missing kerneldoc for
 of_graph_get_endpoint_count()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:04:58 +0000
X-ClientProxiedBy: TYWP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: cd468294-585e-4638-4601-08dc221a2c40
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alvUmJA0EL+KyJHjsu7CY63Bb5XIkqgMWn5djv3tF05POWGbbFZqatoJC3QtzqTkhoCOAFTqdb7/BTqrbIbyfUsRz1ZXRe/nXRtUDVA4dGGjgXTI6eNg7IBM6O/OLEZYSDwbPWC7GNhxARE5/xu1Mf4ktyQVCMw40FGQmmy5NJElio62glKM5aSWXfUOJA09Oxfa1dkpQ5TzPM8/fMtZGZ9eWd9TxIM73itaHN2lb94LBlTtrL/OsHTPh6fokIZyNSA2RQFrgqissfAqVSIi7lZ2m9hR4+s5EQEFld7xXQlZH6+bF9edfZCIjyP6+Enk2nKlkvCHhjcMb0Ry9XlWh+2Q4Pn98BOZb63G6oULOhQnykI0Mcys64hfU9rAVgDnaYgKp5HgiH5pLI3/qD6gqBA3/iF0I2zpoTE0T3naMPhhXScZGdNam5/C40dAzaKM6gnFokSj2GAng4iqmGnGlC39hcz+JqamIFZfuVJiNeNGJUbkvQGT0KvkYRvCIxa5xoxjccBdVA0uIBD3tDK06s1KhlVsWtKLuie3Mlsd2S1psATomxaDbZkLD6dJ0pzH4Ee/YgmPMKK7p4OxXbd1YLdq94eI0e+Jq3tKzVd0SBgbbyQEyUSr6clxUIV1/sOdZ59E+kfT92l/jUv46oa7Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(4744005)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b2XVmcUxgLOdwEvlyJ/thiypmF5CHait+3DNvysS31aoidr1c4s28EtIHSV+?=
 =?us-ascii?Q?io1i/rOnTfur54zEr8SbAHqH8NGjDHG7CsXxNd3674kb550zaCu46W3j2+9D?=
 =?us-ascii?Q?mC/oUKz4eq4o5qQhdYG+7jbc+atUboYr4LZJxQYTDsQcXG4uOzEGEQbCXRGI?=
 =?us-ascii?Q?DW+oXhU+4TpHG9g/E8qnPCfIwjaEQ7woEbA2ZNoIT/NFCbQeI8HmYlq7Xkx+?=
 =?us-ascii?Q?9yt7jCPtdF5poHrgj6WhG9QZgcFvQdgBNrH36st/FogzGOZv+wYNnBpjAAnA?=
 =?us-ascii?Q?2jd9HutehL3Xfc8NLn6ErW8o3WM2oqE32XdT3CGCorX/Mf4obeuLlU+sZhMZ?=
 =?us-ascii?Q?uLKsiJZ754ySCqAqImJxiZswQVCFg59o7AuFbYnSkUolMao8IzElkaQpbD1Q?=
 =?us-ascii?Q?Yhj/+20rBSakU+QhdIhPeulL8skIu1f2sn+G5xh8/YxXsTRJzmzZ/s4dWroC?=
 =?us-ascii?Q?l0z90+Dt6YkM7+IxNI3+sEDavlzxwifZ86ORgovF8l0Y9E4iy6kS5QO9LNM4?=
 =?us-ascii?Q?3TJHNA0KIOj+S0sMaz37tFR0y28mIiy8jHIqZTvtgtI6afFp03758YlSaZrB?=
 =?us-ascii?Q?iQc2z0+SFX9QVWBuYL22xBrNPYRyoiFfRH8fCpOwBTFGfjl5zWu9/s1y0qU1?=
 =?us-ascii?Q?0zV+lNVXfUSs5wnpwBnbbUqQA/qjtJ6PgzjifQM7tKm0Fv6AbAFZvbMd6L6G?=
 =?us-ascii?Q?ZnLkU7OcpctZS9SlFTWFrP3tEerLD1ZdQ6h0kel6+liwcX5fse8DjtF5nRGT?=
 =?us-ascii?Q?h9MKOV5ONFiWGb+YPE7RYDuQvAycMZuviJbPZ5tACDRCVzzsAtoGMI2lQx+D?=
 =?us-ascii?Q?+SzattmWKKrybU6pRTtQ5AWC+DoZX3t+lngdX2u1nw79IU+OTeQ/zustQ1H1?=
 =?us-ascii?Q?ZO4DLHqk0khht8rjxSrwv6gEOY6oZTslgoW+CGTiIMSlBAddRYJWet6JQ/ks?=
 =?us-ascii?Q?hn0t29BGpKQqv2JPBN9tAcoJXNa0CXqyuDGqk8iUFklNVGFNdUel9dM1TT5q?=
 =?us-ascii?Q?OLSAgpLopiiLUj3esbSpiNyE7uGHHd04+Q44Uu/5DbAlccehB+Prmvp35ESr?=
 =?us-ascii?Q?315DrG1+umNcca2CH+DgyH/I5bAbeBnpXneafJUC0uesQA3hGnDJu11w/5P6?=
 =?us-ascii?Q?M9a990HTce4CMIK66swfGZHhYO67a0gGuk6geH+ZnfUvInrGz3RacTiFSvrO?=
 =?us-ascii?Q?9PVwzgA23mLeqPU5epzhsZW9/bn4A9Fg0CIW9RZ5JJ4HWCfD54jP2gd8HMWX?=
 =?us-ascii?Q?eJomtPxq+lEpx2+BUAXeN3EsewBeJZJPVpzqykmWHvYFmeQL5IEQg2kboY2f?=
 =?us-ascii?Q?ULJolojP9QZCnrtCCF/mNSjVKV1VJhnUl+fM5MKWtkaBaUPSoca9Lr8hxdJI?=
 =?us-ascii?Q?pTy6+8MS4lKCOZL8DSAhw04aZvg0Z2Xg40gWg9ES8FHwIdPC78+BulLELhJE?=
 =?us-ascii?Q?H+v1dT8N5Emo0vibjwhuw5MRZuCmoK2YmbPBclFo3ZtXqqyp9TFd/+iAGL8k?=
 =?us-ascii?Q?kn+SODgKL+aA+2c03GtXacOxfTIJIk9tD2UnHI1j1+jo7syabFzqOwsA8Y60?=
 =?us-ascii?Q?xAG40/m/I55E8qdbp9pilWoKb+VQsTG8xP1S6K9DQEB5YIlQsGTkLFYbtjkx?=
 =?us-ascii?Q?UCCBF9PWiRlmGfTjKztDwlo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd468294-585e-4638-4601-08dc221a2c40
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:04:58.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMPtbTfyXfxdmQTRaXxZDD1oBdqIcwk7b84tFFVRsSRScbBjQVlWIZUKn8w6rqOvAtknSG1147A59SyaCYINcKuAB5Qr5emqe3ZQLj5CdY2YeEJu4MfNoI8YCatF7JqV
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

of_graph_get_endpoint_count() doesn't have kerneldoc. Add it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index afdaefbd03f6..4e879faa1710 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -811,6 +811,12 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
 }
 EXPORT_SYMBOL(of_graph_get_remote_port);
 
+/**
+ * of_graph_get_endpoint_count() - get count of endpoint
+ * @np: pointer to the parent device node
+ *
+ * Return: count of endpoint of this device node
+ */
 int of_graph_get_endpoint_count(const struct device_node *np)
 {
 	struct device_node *endpoint;
-- 
2.25.1

