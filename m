Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D38438B9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07328113A73;
	Wed, 31 Jan 2024 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61D410E523;
 Wed, 31 Jan 2024 05:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dujjkunUxG0UFa4gbBGfADXovZWUq/LGS1XasY1kSg7imOLxavfVjN4Q2+emPuJWpeJ8H0C8P0GJfbKY6eDOEd8M50ZrIxtFnyld0tIRnfm2nBH54q8Fl4LNVBY4i/QQvLJvXPmEEXR3p943m4nmLX6I/ovB0a8Qx+m2PFs+bW9XSO5o04ZhmXBjdNrbeH2MLFSsTeNa8dZVysYAaX/FuH5Q7i8PGb4KGs9k7m6pMfrItJ5TVgklPqHOsXrtwyiKuW69oEGUXj84k0fY0YnCu5vk/ytDp0W/j7sdCZ2xz+82NhqxEv3RHaBEEATWTpClVlRJDUBhKVsgADv5Nhi5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5M2xsS2Pvzi9e5gmSY8tMjny82DAlskYKx6Y+wuzco=;
 b=HPNlulHrhD7RjAckmjQT0Zg8UaZF9uJiEeBVUYZjMizXa0De2W/Ks9ZZhb7CLg+QIMznhZURB3eKfO5lyGjOneZlW2SefMo1/qCiyctZnBz9ogbhpKophdFWc6XezFX0FSQ/QxSFAqdhad5UIeobsRfDh8RF+XeYXsz5Nw7A0actbErbm1X2n2WBTEV10D2t3D3e+gzIZkNsKh/C9KlJc8ZdlNPCyDW0ticb94fcuThB0kNg8IVjB7VIjkyJ5ebBY5olRDuU8GKSHAeJ8N3xpGqE/4KE/lsj4SmnGyFHYKH1ypi2cLZR2wjXNqhDvdTi+2PX9qphtkxmorAu7ZOjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5M2xsS2Pvzi9e5gmSY8tMjny82DAlskYKx6Y+wuzco=;
 b=c79WBtYqVYKJrF9GybBod4xFSHODUTYI8PNIZ5l5lK31n6WwWvX6COGJoInQPeEhQMY5UHr2YKg6zHwM7/uO0ITNzFPBjw1vSUpt+cYQ50vMLUdBSx8yhcvRMWiRdTdXZmFvlSmAcC/p43rGMyKNG1ZSGCKDVRoTEMrZjU5dEbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:06:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:06:30 +0000
Message-ID: <875xza6qi2.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 13/24] of: property: use of_graph_get_next_port() on
 of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:06:29 +0000
X-ClientProxiedBy: TYAPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: f649e7aa-ff51-4197-d259-08dc221a62e5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3EcRCaxUqCbDyKvU6aNdyrrqlHDL2IXDzFpCH051BE5LOCOciE6Y4wCcL2NyyhxP2ZckmTKxzy4s3r7Xj8teUz3Lzyo+4ISMTlKy1XxXwyXkSaSSx8/8Yf+1RRPx/JMUAOzC1MKG/hjp03rQpNt0eQ17E4syzQedNyUg8DNyfHw3ZNxzmoy+In34OE7G6CMxUyyBG4cC8Zq1FCS7cD5eCXnpG4Qb1OcoIIEyMMOyqsLXLHy7rrlaV6osCbr/fUQ5XROn10oAhrWqlbmplvlSPQvowM5UsN+ZMmSrHLRx2L/2pxz5ylrwbRK5Z/0M6rK4dTXTQxqY+jD2i4o71cVcy1VoBt45Lq7nsEDaCz7ag2kOqKAdxDsvTrVWSdYuai63CwEu59vljNe7DxR0UbTAYdM2YLJ1xB4ANaI0cKVl3hnNzji0ZOZznAZBFVqgsW9CZvJP0xFkO4kr2AhtJ2TZdFqFiRXdu8vrSl8WCPVMGUG6MvT3vQSgqeWkPJPIBB5N3SiAIEExaAi6v4xzg00/6nVT8Itpds+nz+2BO8wfJdsy2Jm52s0Aadlg/0uhSOFsDTANe1TjY7hs6QfzfqJciBlGo3JVcg552OnxW0F3MNQFpZSzujKYIo4FhmenkcB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GgHRedMtlchdDNS3GTHxfNDDG0ucPQeEANGJOjUAHSm1SU61yzYQsG8YQqfI?=
 =?us-ascii?Q?UDVx6WXSc6v7xTJWfHDIfYQR63WbJ1oPiO07WzSHyH1UsWx4ql3mntYHAWnt?=
 =?us-ascii?Q?J5o6KSalCO8hC8Tbi8YCkfOj6VbStiLV7se86oL7nOuexTld7IunKSgrc5on?=
 =?us-ascii?Q?4zRiTuOATV+i22uj9EPCz9PyM4aHb6JhpOFkLTw70j5w07bO5AIJ2mU2gzJP?=
 =?us-ascii?Q?mBCddJHPZs6LyP7ekXCi+F0KYUyC7EAIGCUQlTQzr5qZLEQ/+iqcB6oPOKhY?=
 =?us-ascii?Q?he2W65d1jJPHONl03P4asmneJrSqC7MulS4kqUnmYy66IuZ+50XxjRu97qBo?=
 =?us-ascii?Q?KAQu82Wtm/ePo8MgtrT+3bmJXEFrnTjDhNtfSWQBxXGqrbGQDEWoCF0Qxklh?=
 =?us-ascii?Q?h81spegeQ7hRs+woO1Rwh9SieLuRiZoKcDUy87CTKyCz+R1svfQtYAMASXLH?=
 =?us-ascii?Q?FOU6h4Z9Ovja03yAn27W4f6UThbtZgYiuCt1UHqXw7tP7wVkHXtGQCWyRiGt?=
 =?us-ascii?Q?8P/y3XW/OsZ1MWW4wSutHjQyKTHoFGOSF4xvm9XJ+r9w/4r51UbfI7O2OFS6?=
 =?us-ascii?Q?fXUnoSRF0/E0PxQSAzR0cw7oKbzwQHuT48wBw18al5LfnIkmFpJ5laCqbtDm?=
 =?us-ascii?Q?b4OIy+a5qfzl/F4MHU89DgGrEAqUzMrOI3nWzJ0bY8/ERv1OUiGuLPIVByDE?=
 =?us-ascii?Q?WdzL+dB04H9F/JTExJkRTnnPxq4aFPp3RicFALLfdrZTbcIn5HrrHZOBcYT0?=
 =?us-ascii?Q?ro6RqePC12nFCWOiddBdyGrnacVp+v7q3fvhs2yoRxxU+DykByioZcCJUoUK?=
 =?us-ascii?Q?PkeSRJH0mcT61H/bWB4N2yNuqLdljnfaKVX1t+4PU32mooCX/AjF73RoG/5A?=
 =?us-ascii?Q?w+75ymzQx8XPpJZx8VLLgdzqPQXziDN0KjOkG7B4NeoTMMd6qUqqEvK8/IA4?=
 =?us-ascii?Q?xsT3RA8zuA4RBZbuC+9snehHMhxn1zKcnBdvlyOtEaGwiPIH01cqd4tlCGW0?=
 =?us-ascii?Q?jNQqvyo9jpxFGlW5xMsTYSwV/9BvsV6jSSgGg0AJbPFFVLx9rBYFQoZH2AOG?=
 =?us-ascii?Q?Kvim3oWCrubiL9vL2+ZSWOJMw66katbB+/jKJGrKZkt4e0lkm9GLPOM90RI0?=
 =?us-ascii?Q?5s9scXRF7UWG2c9S4OJKFAmcmrlHVAPci/cxgRItf9Vn59gOjD8XQYwTexDj?=
 =?us-ascii?Q?fMJXHwbTz7RhF38mGc7QR9S74tJhvolOMO+q16GUQ0qH0juu0sv5lXHX5I9a?=
 =?us-ascii?Q?Pz842BqO/+glg2IWfTKKgsHfvT+pU7X0F+HELuy2K/pEhJUtIup/X4qOhNo1?=
 =?us-ascii?Q?AjQ7S8Ik2dX9VdU5w0K9xtx68W9e1mDRK3Z6qOmbHkEFGFnJ8rGyB2gvrUa/?=
 =?us-ascii?Q?arNmRLRVK/Zg6UgiTr4vthR1O4gnUmfp6/8HGi9Bd4D3jMVL+9QTf5rrfCIw?=
 =?us-ascii?Q?Hyr4wLX9KUfU114hgu5a/BcNFQ1+7xYGxMHAEjLKWQ8FhR4QKiHr80nnODzF?=
 =?us-ascii?Q?E681y5z86gM+gtWmZ1yOhnpkTINuMTwNVFNmw9TkRyRI+nlnvkyncKuC0Tbh?=
 =?us-ascii?Q?/TTRYoIfz996cglyHhQ4ANRC7FTp6N2xwz96lOgykcJbcaVhsJJd1PzQrdBD?=
 =?us-ascii?Q?BH8XRZ3UBYo/Qp7aLxxGkoE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f649e7aa-ff51-4197-d259-08dc221a62e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:06:30.4562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZFd+jFwJVuknS4xYf+7L8TTPgQajXmjQcMKAhQL9IOkOwJ92gORs1z9afo1u7Op223THg2oyEVHbE/WaMKBKRNd4jJKvTroVXH6bbjIO9nlKah/k5a9tN1KtIoIfXgo
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

We have of_graph_get_next_port(), use it on of_graph_get_next_endpoint().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/of/property.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index cba07d2af62b..083f92513f5e 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -694,15 +694,7 @@ struct device_node *of_graph_get_next_device_endpoint(const struct device_node *
 	 * parent port node.
 	 */
 	if (!prev) {
-		struct device_node *node;
-
-		node = of_get_child_by_name(parent, "ports");
-		if (node)
-			parent = node;
-
-		port = of_get_child_by_name(parent, "port");
-		of_node_put(node);
-
+		port = of_graph_get_next_port(parent, NULL);
 		if (!port) {
 			pr_err("graph: no port node found in %pOF\n", parent);
 			return NULL;
@@ -729,11 +721,9 @@ struct device_node *of_graph_get_next_device_endpoint(const struct device_node *
 		/* No more endpoints under this port, try the next one. */
 		prev = NULL;
 
-		do {
-			port = of_get_next_child(parent, port);
-			if (!port)
-				return NULL;
-		} while (!of_node_name_eq(port, "port"));
+		port = of_graph_get_next_port(parent, port);
+		if (!port)
+			return NULL;
 	}
 }
 EXPORT_SYMBOL(of_graph_get_next_device_endpoint);
-- 
2.25.1

