Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128B8438CB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E11E113A53;
	Wed, 31 Jan 2024 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFB710F1AE;
 Wed, 31 Jan 2024 05:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux7cdCW7SXwnB2JH5AK0jQsVHGQm6ya6vxX0uz+mNFDyDDnyOeKinNpi3oAo9mhu9O+ctTDJNuB9ZXoKLk/6JqejfAlpYAdqRZL2cSeaHBEs9g9jUF9cHpR8a6xxKMIakzBuZg0uhUgHGAUmADw1ibQysx545Tx3TQ07Wdd3u4imoRPay88bb44G1B8g1qebykNEMRIfFjwuSYKSx/DygD75owmSkaenYW7fl5Fiqrz7PLfyCITcXf+bA32VtJ3H3Pe0oALZ6jJzdtjWJGelXLHi/LmhBpx73x1ugltGhauj6P9CBla5BAhuarP8hqqfAf83gJlTKjvw4sZ8c9JXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BBD+2hwCWKVV0Gz4IKCygXmCLUzJwjGIsg2wpasMU8=;
 b=gIKFUDJC9LLtXhf1FFbzWS5sAQ1UBro4f2C01+7leiJOIEaypt7gfiXVQ7q2tCWwTTfZrDgVE0JsBgTGrD70PJoTBve6AKqtEkhjTnN3ySj/QH17Oq4pALLLqEWq4XbzJaAEf0YTlMNftWHsomJxvgm/33VMl/ftt7HtpnfNW7idyGYMzJw2wyY4L+8n4zjNoBcO2dqq/c541Sj07ozH+6ta7nJpay+YBICx6H0foRyLeFv7n6ssMlricxi/bF7/DymjBCiet3NUR8vjfAi7i1SG6p4RYcpqaaMDBMdGO6EZBSxw7a+5MRv6GkVsP+ajEw6ngA4Brf02jltLyMGZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BBD+2hwCWKVV0Gz4IKCygXmCLUzJwjGIsg2wpasMU8=;
 b=pfdxCoAfhcM4LZC974RTOUv8zAuytN/U3lcpsH5SS6SrIrHcB/Ha3i4rO8EZavjayOkC+Y/rnFKlDSaGEiqAmDaLZoMyZiqI4hgg4rfjy013zDlsRulGbRGw81UdLOyMsBXBpu8FJjA2HA4GHi2e6+Y2SU1pVgofIiKR+C9iR5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:05:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:05:06 +0000
Message-ID: <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 02/24] of: property: use unsigned int return on
 of_graph_get_endpoint_count()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 05:05:05 +0000
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 54eb8ee5-9a86-403c-eb57-08dc221a30b0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/Jyk3TXrfJNe6reGT2TRj7Xj9qCFxsmignr/N8Ov4NBMkI27vs8GqeGeYwKKmCxJxZNwQU1rTUoufC6ImSTIKFK7J8x++FMFYdAqDBxEzs4TXXo3o7n8QtxcI/FOa/CB17Q7/iLo0+sNcv44rIZMKAvpIksE7cxmhg+/8n6lRLo/9J2sJ074zkX6XWtmufpg2gf1vXx4XFpeKKRTGcWsHBxROIQgxJENDxgsdKzMw0aBkiplVZYuShFNy78kV1nn6XI8oiHYxrZqvffgnGU39KzbhO4sDvW+lxPJ0fml5YGwBsyn4E3Uad5M/dF01S5kYf6vHF+TWsLGt3bhK9/akIdCR5QRNlu7An8a6hCZ9GVk0L+zZodRwEyYRSTrQCZHfFvAKo9lIGqY41eNKO11pC7wpwFQVqLeEXAslVHaNFv7kWji1S1cY8zPAFF8vmZqgdnk4nC/unmL7yZUmHk26+itNJTTxZ2M5reBApetCBYC1wvKWBGvxPoPeDg3DJr1ILPv7DitNTD57AKpT/GVm8Wi+4IwMBtpUY/BVgVfW8Kyoo1dIqFpbVMmOxHdb8d4w4lojxLM0QnASCnHZ+Ep+quqkQlbcHN3S2gI4fxb+LJktLX8Za5+HuJ04zJQFZRKVbI+rPETjkFvXPOINmmrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(1191002)(66476007)(8936002)(4326008)(8676002)(7366002)(5660300002)(2906002)(7416002)(7276002)(86362001)(7406005)(110136005)(66946007)(7336002)(316002)(38350700005)(36756003)(54906003)(38100700002)(66556008)(478600001)(52116002)(6506007)(6512007)(6486002)(83380400001)(26005)(41300700001)(921011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8o30qwN5U3fXTlNzMAwuVpWNFrgq00eCuOZGmQaSvmkLXIt3WbGjHu8DIeC3?=
 =?us-ascii?Q?GZi0uQtBkbrzLm036hc862kFxgKsZ8AN+Rgof8OlvO4ysMv+FJdgvspdX+Ym?=
 =?us-ascii?Q?zfiK+IdHLUxJrzdASUf5MLjauYaUOSFCNcyVB3p9KzkvgpALV7Hh0/bH4rnB?=
 =?us-ascii?Q?qVbi0+TAKATC6Tq0Re/IurVvk24IKamUBrt1cw2MqTAlTRRytqat5vNqQ8Ku?=
 =?us-ascii?Q?Vg7GerRuw7Jw6ff1QeskQ1NfqxBWDVeuEZkGWlBsW03Sy79u8D0CuHf9ynqH?=
 =?us-ascii?Q?MWe4aG3Tv5lg+c5tY5ob//SVU6DYX1lx6eXe4jZtw0e6ggZt4EgU1YKsfNWP?=
 =?us-ascii?Q?dbkthIDcC7TqTKShzv/X/k6bZrRf4EqQwfYOYkjwnyUZwXWI+/WFM3/iJVhg?=
 =?us-ascii?Q?Eqr3XLhQgVEgCrav2KKUo28lRbQiGTEKhIP9oHoIoSRxipo4NrVTiM7xYiwX?=
 =?us-ascii?Q?DsgFR/itvplGC90ZbyTDc9huYWXv4JzqSM6ah/xMLntLBIm946GB/L8qsapB?=
 =?us-ascii?Q?+qqxBVbNI86fGFl1H8MCwQHpZFPV0SLTjmIPNweF7Y5W6DxjWKYnBNBnv99g?=
 =?us-ascii?Q?r9V5sma/Rg0ipJ5/MBu1s0DahJkaYUv7Oedk6tfm5UaS+U2bXiOVYhdqnW9v?=
 =?us-ascii?Q?2D6M8NXSZNPHjHoaKhtw8RtQtYeT2kyvxTbVSjIhCmKBpmHPECEKM/XhFp1x?=
 =?us-ascii?Q?L3zNXqW8V3JZ++LLuahb9ivTkcpWE6pkCivd9T4o9VdCutEovdCdBmN3imq8?=
 =?us-ascii?Q?68VsmtFlKKED3Naa+GpF42fmH3rO7GSE+sk0yCk8JgdSKEt21VS0tNIShO5x?=
 =?us-ascii?Q?gDhCevET+dI7WFu/5xol295mqN+Z5IEFPvZ1RjnHLYM98gX6jjW44/VMobCA?=
 =?us-ascii?Q?X61DzjfKXWwGIbshXB6HG2M8fkwEDdwko1UKVlydThj/FYWTWrYtcxUcRs44?=
 =?us-ascii?Q?RNTxpLaSWSw75+G0lfJzlVwcnviI/RW+N76Jf2wLcVYiO4mi06uZnhA6Jijt?=
 =?us-ascii?Q?3/F+PXJVrWbB7FyWNb4pgyWnv1qplS9qvc6I3cbf+qsk6aDzCHgaY0cV1JjK?=
 =?us-ascii?Q?SYE/bCFmmBzj/k0UsU5oUOs9OHbwXg9Ha255pXMVwlX0k2sY32tjPvncBpf3?=
 =?us-ascii?Q?Wm67LsSNqpQJhcXsFC72mfcKn7dod8jysIm5+fcXF74PAmn15im8QnS4rkku?=
 =?us-ascii?Q?OZt7in84kPb+gTXLq6Vgx5Ne5csTRRzR4OadPZxRhnSKNDulyy+0mW2swTVl?=
 =?us-ascii?Q?98eeFoasuR1idg/K1equIaNE8XTbiOWLSx0kkI51NYuF7mLwPVH7td9/JzJ4?=
 =?us-ascii?Q?PwDRuZX2z4Iga2hnhKTHXw5J3NjSjUhkAKZ1JUfIiCwygUnOnbpXkxLxP87g?=
 =?us-ascii?Q?8jqoxm58BuzGZ/06OfpFancQTUvX0uDa7cv1JkBV0cBk4J5DjaZtE4Vl6vdx?=
 =?us-ascii?Q?L5nTc+Fr/xSfxmCFvZaKImzdqMk9+c4ZtNN6ha6Dc5kdFmoDU+0sRFgLnuzo?=
 =?us-ascii?Q?ZzSOSQN0WpEZS06thzNu3eQWSq1r3/lz1tfYqV9m13c0HVDjVca3tnmoJLkl?=
 =?us-ascii?Q?e8GJ6RmAZKqe2SkjHfUF7dQLh2dPRpUepCQ4Aa7px1nNVXZi3SsDp/RmcYff?=
 =?us-ascii?Q?J/rJ/mHdozWKau3pxvEblo0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54eb8ee5-9a86-403c-eb57-08dc221a30b0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:05:06.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOYJbIOamretAgYnOA7un0mI37FcLhvoEzNTGg5LCaxpQ+Knu6N5nXAA/LcMVNWhSXlsK+uRZJfdhopUoOO3NpcNdztxsbQ6kNulrqPsqX1+aIuKxIWRyIS2AfrbxD1K
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

The return type and the variable of of_graph_get_endpoint_count()
should be unsigned. Tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 2 +-
 include/linux/of_graph.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 4e879faa1710..25d73409aeee 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -817,7 +817,7 @@ EXPORT_SYMBOL(of_graph_get_remote_port);
  *
  * Return: count of endpoint of this device node
  */
-int of_graph_get_endpoint_count(const struct device_node *np)
+unsigned int of_graph_get_endpoint_count(const struct device_node *np)
 {
 	struct device_node *endpoint;
 	int num = 0;
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 4d7756087b6b..a4bea62bfa29 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -41,7 +41,7 @@ struct of_endpoint {
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
-int of_graph_get_endpoint_count(const struct device_node *np);
+unsigned int of_graph_get_endpoint_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
@@ -68,7 +68,7 @@ static inline int of_graph_parse_endpoint(const struct device_node *node,
 	return -ENOSYS;
 }
 
-static inline int of_graph_get_endpoint_count(const struct device_node *np)
+static inline unsigned int of_graph_get_endpoint_count(const struct device_node *np)
 {
 	return 0;
 }
-- 
2.25.1

