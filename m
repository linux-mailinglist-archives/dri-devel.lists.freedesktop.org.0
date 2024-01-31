Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAA8438CA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FF61121AE;
	Wed, 31 Jan 2024 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5ED10F1AE;
 Wed, 31 Jan 2024 05:06:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQSKYT7JwnXPLZhi+47RtpdOsCBRWv3IsU1ZbWaK4JV/9ULCqQi5aZA/JBXjDkNL1mTuMAZH6AKSxtBk6QBrU242nREzFiEEp7RBRiV6403GCAhOvMa/Qc8F3+1Dr40qKZxh8rk72jkWBaSaIvyWtDgtDWcwyjboB1YZ2rxJTAkc2jY+WJKvRtos8WS/o5dlgjVOLHNpHzeJGLaL2GlqNBJhWuQh5hEfXCsLC8Ul91i7wti8qj5Zc13meONqEKTzN5M0M2CML1jFpJ7VfGqaHnCzwimhKh69/3oz+bxPGp1CfTYJFhtJL81ROfZR56TeEiKxjwBq7hbe6MIaF+B6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgdxHWYA7YfL4j/ktYaAZ4Nhk96/3I8fgZS3YdTZVXs=;
 b=WQYY4lGUMISOFVADeVHTWHKkaL9erU2vfVFqHnVUxKNjn0LLK1SjeDOvrGPCGXGX16Hb2sNE9n0oFyew59pX9sOlPvxQU/adZPac/M2EwqqIzpxjid7eiRUacK8LEVRj5KTbeGIJ86s1LJKdSx0wDN7hvxScstMVXXTLPHf78XA9fw6jcl1bpZKYuToYAkHCkPW7Xkpi1/OU/eIlMfyxM3Ox5gzGd14dZu2byYPQoTFmCZ4lUwoSDLSLuyWbLMLdYZ1G2F3swTRVE7DAiXQuaW/fXvA8g3h8fcFuwz32fCCEOECl1BOKMrAXoYQ2MrR6SLPuvnfU50PGO7YN4bePpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgdxHWYA7YfL4j/ktYaAZ4Nhk96/3I8fgZS3YdTZVXs=;
 b=A3nRpaolR1AUuxKtgPRWQ1a1JqnCWVwfmBpOBLL0H5VDN5q1Gv6L9fe+yYmKf5s8cPLaq21fQbhhrWKSbm2+q+uMXTFEnLD3Kl2qD1ORVbuxo29WAA+84WLRQrqzQxqyGWR/9B3ybjtSji2jBwrOSEBbg1sGgUFYkEmRWZLPLwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8896.jpnprd01.prod.outlook.com
 (2603:1096:604:158::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:06:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:06:37 +0000
Message-ID: <874jeu6qhv.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 14/24] of: property: add of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:06:36 +0000
X-ClientProxiedBy: TYCPR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:3::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 718d6cfd-8a80-4310-d69b-08dc221a670e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Egs0/kruZUqrBNkrbIY4Fy/euydV5Kt1bXRN+QJsGNTNFgI8z5jUzpqhJyd8t7pv7FeQkCaDkz8cX2ggIVyJXpiKKd+/YDA6O12p0CS4B5DknwDI1AzVEXaQ2CS6AuNmgY8G+/+XldjLIo/Vbs0pcwFKHNVCN2plUo12NFRVc1Jre7/fQ79/WGNVeg/aVDTilw0Noscfy5ak+Cv6fCfy7A69JoOBf1qDfMn89a4kRqZuNXjfCW3sAVCOUfGcsrLw7UvoRYNT8n1i96xXsNF/3Mej43TX0vv+uEqN4vx97AcX8NJhtIIMP6eEhCLCYJnDwKXS81Zp2omRMFaDukuqwUH5wttwF7BwS8B+gMk1U+vN7JFqDsY1MKG2NHLaF/HCa0yOFv0Gh5PJ/qaSdjGgGXEwp2wwp/KVn98DF8S644C3iA7U/GiEJGqJftmVtzIu8uYUekS7dVYfC+AIpxqXUZql/L1uDq9kSeVXSbmaFrHueLGzBKagGgzCLu2jkjG/WU6tv/SUtt8yB5j11AYSyt1xO4EnZ21JmtgEYGv9PjxW1luCPhn3ArrKbEEw6d1n4m0MuJoZqx+7fcQzU/Y9fLD/b2URqvPFOA4I4D62legkI3U7mw5pXWi4kUXp6EGuHkmPa95UIgK4lvQiu7UvULYGhaqlXuHKu31y8iV/RQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(7336002)(7366002)(7276002)(52116002)(7406005)(7416002)(6506007)(38100700002)(6512007)(5660300002)(86362001)(83380400001)(38350700005)(41300700001)(2906002)(2616005)(478600001)(6486002)(26005)(1191002)(921011)(66476007)(66946007)(66556008)(54906003)(110136005)(8936002)(8676002)(316002)(4326008)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2bgGngEQNZqwRQzQuHpQTfh9R/iTs4jHFnlktU4HpeX0bH3WovuZQXcfdqA?=
 =?us-ascii?Q?sUPAa4fHkCtdiY3JY3loBZ/5nFRkA04BgndtiLlyZ4zqTxRXJ6BXacx1PyCq?=
 =?us-ascii?Q?Z2utu5CVIQf2J3jzjpcAh+Jf5bM52QVQ0dgzjM0m0Nr8JsqE252QSQjvPNHi?=
 =?us-ascii?Q?x0Yw2IJ1r7InXT2YNrp+4gBULM1u8EpcK0fXclmG1+OQnhktb9Rk/AQmsW3D?=
 =?us-ascii?Q?rBOHx/PQPEKFWUpxyCzkzlLpIZkugX5q+41R351XCr9mjoSxAmqWtyrAF+rg?=
 =?us-ascii?Q?1gu/qCaga9l5q7UEhzDDEgpgAGYJ6xyIvCO/bcBLsYPJKK7Crbyv4aaHHsCY?=
 =?us-ascii?Q?MV0vr7i+zmQ8ITm9qH7bWT8K30vwz3bttK2d38ZF+Ojok1mqf0ivu4ft/PnA?=
 =?us-ascii?Q?QBbSPHtjB1ZlTizbetv779R+GbbEhtLTbZ3IRwVfp46g4MRn3MrfEDhT1pK5?=
 =?us-ascii?Q?y8mY0uaNglVxNPQ0HAiCWv8LIDzo+jMesMm4ZfY4GBpaJk3kLWF6L98azvOt?=
 =?us-ascii?Q?c8F4cEJqePrt1imfcAL/LsZ9wkCrJ0ljXqeVRdKrb4oULSB1J4K8V1NtDHdr?=
 =?us-ascii?Q?BEi+q9s2XYb+eJtEkPj/uTwF3oU1CSFHKvNUSUaytKtP3U+4oH0ojYMzJ4OV?=
 =?us-ascii?Q?BRw4xNeU84Rg863JbG+/4c+f2Fbm1+HLLy2xGRnJB9AhrohsprzBwBw/rgWy?=
 =?us-ascii?Q?0Gcdpdu4RjyuKJyktPICx94Ba7F1Xhutp+jiPaXL7wMpkCrp5iJCaAQK65xC?=
 =?us-ascii?Q?aCci8ytnL3DRjmbHLbAFILaikCkAiA5gd+Bmy1lb6Mlr7uVGOxsDTFsH2ngf?=
 =?us-ascii?Q?wucKSPEAR/kpchMkEkQeAkP8xzTyjv/A6laC8F6K0Z73F2v9t1Pc1Co6+h7o?=
 =?us-ascii?Q?mY02SMciR8bdN3h2nTuydAKqonYAaIN2SRNh5JIMbvgOxADftpQpKIa2LTNp?=
 =?us-ascii?Q?tY5Voi5U5197brG127ZMHW7xzuSWrVzzhtX0WT7zjHskKi+dyHKY/ICL9sCe?=
 =?us-ascii?Q?noX65MDCwEopE9/q1CN3ObpGT2xW6Hu2KEfg0yhUwOk6R2CsGg6EWs65s+z+?=
 =?us-ascii?Q?n8s5nouiuyxWvQtDj6kzm+a6ETmfE73CKk6o86QO21LLIYCIqs0/1YRc1M5u?=
 =?us-ascii?Q?H9PNw8o+GPITdQYqrtoCf3PipQbOs41hIohgtnW572DlA3qPHHPsdCF8No9u?=
 =?us-ascii?Q?bmiL8opVyFwWp6dUHVSOs60q0XOCOinTpWiwP9SGl3z3/xIXvSmIfdFa2j2d?=
 =?us-ascii?Q?ujQeUnrHQxwUpMspZwYC4wdEZpnJVYJxMJeCGVDLs4zB4/961riUDn6Lk/Sq?=
 =?us-ascii?Q?B/jJLzajmexbFZGnNcFvnZ7AujUyb+S9vZQxi05xyUhtNknJpxOFeyz1b+uV?=
 =?us-ascii?Q?xpQnH9fp4goJuTEAnRYeiKPpp8GXwUwWgKzNHV5IhkcaMDKVPH3LK2ARjkSL?=
 =?us-ascii?Q?iMuV+w6Zu2kFh+ukO3hjrHF8vXLG1ZAweSKmBH5AnEZUCOT70Qm9KEnMwmmH?=
 =?us-ascii?Q?y8mIhcrQGEJnJHs2DldMTw7EppWU/qJUj0v2pluavDo4lgU2Kemi5d4wnZ0b?=
 =?us-ascii?Q?XK/MOE+YJ5n+SvybnKBj4DhEDYTQI0wOSYgi0MTEEFcziDmiVMZ+/Ir/+K6g?=
 =?us-ascii?Q?CvnSxON3VOKj9vTcGSbt5vA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718d6cfd-8a80-4310-d69b-08dc221a670e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:06:37.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVmZZ35VTToskq6N5o9mWHPVvD7j0HWGJGClPXq9toqHWmziqZEgHPVi4ocp0pRZxXTZ1ehGfGqOpu+ICqA0A+hzzgkMx2Q1h1Z4NFsZ38SaYHVkoeQaqAvRCCpTr127
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

We already have of_graph_get_next_device_endpoint(), but it is not
intuitive to use.

(X)	node {
(Y)		ports {
			port@0 { endpoint { remote-endpoint = ...; };};
(A1)			port@1 { endpoint { remote-endpoint = ...; };
(A2)				 endpoint { remote-endpoint = ...; };};
(B)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= A1, A2),
I want to use like below

	A1 = of_graph_get_next_device_endpoint(port1, NULL);
	A2 = of_graph_get_next_device_endpoint(port1, A1);

But 1st one will be error, because of_graph_get_next_device_endpoint()
requested "parent" means "node" (X) or "ports" (Y), not "port".
Below are OK

	/* These will be node/ports/port@0/endpoint */
	of_graph_get_next_device_endpoint(node,  NULL);
	of_graph_get_next_device_endpoint(ports, NULL);

In other words, we can't handle A1/A2 directly via
of_graph_get_next_device_endpoint() so far.

There is another non intuitive behavior on
of_graph_get_next_device_endpoint(). In case of if I could get A1 pointer
for some way, and if I want to handle port@1 things, I would like use
it like below

	/*
	 * "ep" is now A1, and handle port1 things here,
	 * but we don't know how many endpoints port1 has.
	 *
	 * Because "ep" is non NULL, we can use port1
	 * as of_graph_get_next_device_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (ep = of_graph_get_next_device_endpoint(port1, ep))

But it also not worked as I expected.
I expect it will be A1 -> A2 -> NULL,
but      it will be A1 -> A2 -> B,    because
of_graph_get_next_device_endpoint() will fetch endpoint beyond the port.

It is not useful on generic driver like Generic Sound Card.
It uses of_get_next_child() instead for now, but it is not intuitive,
and not check node name (= "endpoint").

To handle endpoint more intuitive, create of_graph_get_next_endpoint()

	of_graph_get_next_endpoint(port1, NULL); // A1
	of_graph_get_next_endpoint(port1, A1);   // A2
	of_graph_get_next_endpoint(port1, A2);   // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 24 +++++++++++++++++++++++-
 include/linux/of_graph.h |  9 +++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 083f92513f5e..ff37fd5194c1 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -669,6 +669,28 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
 }
 EXPORT_SYMBOL(of_graph_get_next_port);
 
+/**
+ * of_graph_get_next_endpoint() - get next endpoint node. If it reached to end of the port,
+ * it will return NULL.
+ * @port: pointer to the target port node
+ * @endpoint: current endpoint node, or NULL to get first
+ *
+ * Return: An 'endpoint' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_endpoint(const struct device_node *port,
+					       struct device_node *endpoint)
+{
+	do {
+		endpoint = of_get_next_child(port, endpoint);
+		if (!endpoint)
+			break;
+	} while (!of_node_name_eq(endpoint, "endpoint"));
+
+	return endpoint;
+}
+EXPORT_SYMBOL(of_graph_get_next_endpoint);
+
 /**
  * of_graph_get_next_device_endpoint() - get next endpoint node. If it reached to end of the port,
  * it gets next endpoint from next port.
@@ -712,7 +734,7 @@ struct device_node *of_graph_get_next_device_endpoint(const struct device_node *
 		 * getting the next child. If the previous endpoint is NULL this
 		 * will return the first child.
 		 */
-		endpoint = of_get_next_child(port, prev);
+		endpoint = of_graph_get_next_endpoint(port, prev);
 		if (endpoint) {
 			of_node_put(port);
 			return endpoint;
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 48f7701feab1..ee4b219594f1 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -57,6 +57,8 @@ unsigned int of_graph_get_port_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_device_endpoint(const struct device_node *parent,
 						      struct device_node *previous);
+struct device_node *of_graph_get_next_endpoint(const struct device_node *port,
+					       struct device_node *prev);
 struct device_node *of_graph_get_next_port(const struct device_node *parent,
 					   struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
@@ -105,6 +107,13 @@ static inline struct device_node *of_graph_get_next_device_endpoint(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_endpoint(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_next_port(
 					const struct device_node *parent,
 					struct device_node *previous)
-- 
2.25.1

