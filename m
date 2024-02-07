Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB184C3BA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 05:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F3C1130F7;
	Wed,  7 Feb 2024 04:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="X6pDPDH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2078.outbound.protection.outlook.com [40.107.113.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733451130F7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 04:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atGuOd8eOP7QIt98pUbowHjfWjbJs6DGhRZgFuQeiDYq9OGTOHSJ8ZLPqipOFC2PorbtCfg0oQDM4aMBv33LrKnnQxckQIYa19DCxa+Q/mJPzvxtd2gsxAoSW2uN8ReSyASfq27bjzXZwYDMqtcalJIHlQ0bjC6Gknn3X1RONDM/eJOD74rMBtKnah/Zcl+J9ajeAPaStkOsNMoDR2j6qhtIACIJab0J1gjWD037UTugb0slrLt0wWm5XMHP3C0A9QlW52WrfWrWtqwXCE/gUdrZC3rtbzvKjh22VLP9qTwyI3w4i1UkHy36J0ZkR0w/gyrgVz97Z7OQorEzIUKYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=N2NohMG3QTZiRe+pOMd4McDZ7t8SyyE0URzxf3tYs9W4uT7RtOcnvbbD2pZOMox4HkeuYs7G2NCNdoLtSM3OfdYE2/TygM0XZYwdrKa4xLtKWjVy20w0QKRk7BBnF/SDIQy1OlakgtXafKUNsCOeY7/0NELrD+ytKQakwz9227XRLygHMg+aGc5aPIdJQqnfZcmXPyjUZLbxhsaaFtzFx81dY3odvmVvgXlhZz5k0xwfFIrN+8MSmBcKwHqxHG3/8WNdkU4XWqf3HgjgZ12BtUhYaoloRHH6+gkexMLx6f0e9qEgvypLi06ZPn6+DIm8zYhPwSfaSMrrsWHm8yvTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPWy+PYtnAvN+6i0I6jsdtewufqRlqn7Qxjn1KjTnik=;
 b=X6pDPDH7BmzEl7c98SJRFmCYn+o6RQQyV2AAKIaI4YsABNaFyspxfuveUHpY4ongSrNxC9nnBGOe08/qXVgswgJy5QZl/RY3jCNizm8qky04XyPmeZYQ5R5kK03fgFk5HWPrpDLySPIr5s/hckUTVNoq9Ql3bG4OhmIedbZdUVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11031.jpnprd01.prod.outlook.com
 (2603:1096:400:398::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 04:39:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 04:39:18 +0000
Message-ID: <87le7wsxai.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Eugen
 Hristev <eugen.hristev@collabora.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] video: fbdev: replace of_graph_get_next_endpoint()
In-Reply-To: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0hosxc3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Feb 2024 04:39:17 +0000
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11031:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bbf108-d290-4126-18b2-08dc2796bee3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHasXoaLSyRZ0+tbjrPUZlzlDCAhap6HluvvV7vtAGC5dQGVmg+f8yGl7rsxr4K1V9djMWGwccLKKr/WE0wf91idrO4znZux36ivIY4zhXnGY2SDizUpXr297H0I5ulwlIilRTT8xVurB7Z6LorJHz0qzwpRHr/hGPUKApTANDrHBVnBPo5VfqokreYLnxmRkJBHTfB1rYWHnZbOC9R6wwvXl+U8i1EHl8GdE/s92k55NTwRoTbguzWWRfUVUoJvn1Ll6c12gFe8Yq+Pe9wDxAK1nn5Gi7O6aIfEF9bkSq4nRi63soottsYBvsBlUgUtk9wgR0D5loxvvxjB2cwasC1UeQPVygiw0gnQffzbLipDM0ArLjDztoKiPsFxdc317AlJ2zVH+3BVN+QY6pBuL+R7M948BMMiEtS6z+hjrqFmm0NPLhi1R67f/tCJV/UwzKW5ky2gwC91zYdQsk2kp2//VtDI+BoA+cGnuew99Zjj6O0op7DcSyVrfyyWk/eHV3yGB3rP1pzNsukDGNhity21hjlSCa0MKBtaOtpcrcgLXrRcH+9EPX8skuP28Ve/i5RgikQ3dXoCCQgvn4Fc8C0ENY9IQBLvxq339FqiMH5tQbns2W0w29iaXIkBMtGq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(38100700002)(66556008)(6486002)(66946007)(52116002)(36756003)(66476007)(6512007)(6506007)(966005)(478600001)(8936002)(110136005)(8676002)(38350700005)(316002)(26005)(86362001)(2616005)(83380400001)(7416002)(7406005)(921011)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3FCNt6ZZ7I/Pr/4nlQu6MJxi0u0/fUtTBnsZGdC6hHbWDKArJNX/urFMAZRu?=
 =?us-ascii?Q?jXqfvqmnhSj7pymLVmTgCn6L6xEVuAYG+LESmSkL+ZxZJQh3R+oZrl+GnG+q?=
 =?us-ascii?Q?NcJyY6M8z9Kx+hXX2JxZENWddFTIjhjuNAZjK+NvZiwMCWoAqVcwAKAb2d8o?=
 =?us-ascii?Q?tfhDrEptgTUoWM1unJVs2FfdKQl2T/h4xjp1hoz2JsdENSho76aD9+mxSn85?=
 =?us-ascii?Q?3Up1CWMuVlO/jv9Qw5LUw20Hn1C6rOhXq+KylRMMzDXkURCCfuCI6fP6tWR1?=
 =?us-ascii?Q?/k3s/liAZ6QvUWcQezgz7Z2T8H58T9nv83Vhlk6gf6MRSTLWQPDJaw6qAJkw?=
 =?us-ascii?Q?WyRoaSMusDVuUWdBlfqPWDWyjeNox+vBBetGNlt2yprEdYvijfQ0oMP1kIlb?=
 =?us-ascii?Q?FTWi7TmvcAQjiUL9zIiuf3KeqQbZitgpbQZjzFMtjUuUnYaIevOxBt9U4RS8?=
 =?us-ascii?Q?ZsP89pGEija9iqNM4yFNpEZQCwVxDjn3dENm9SjD5OO22g1ay4t2p8d22gsi?=
 =?us-ascii?Q?vqgtGyXLA/adWoX5I5xAM0jyRzv+yHRa1m6RuwG4+TFs3ouNaJU9L3tkGHmP?=
 =?us-ascii?Q?iUGj/gDOXMy0mi1PmE6AXyyTj4H7aEDn1GpHjAL+imae/6MoD+MdyV/KTg6I?=
 =?us-ascii?Q?U49RBdNvqCfbn38jGlojwIG23/m1dEVu5GLBLMx//cTrDs+He0psThsSEAo6?=
 =?us-ascii?Q?xJFY0QZSniShq8KXlWJ9B0QFeUISqIoVlSbKTADpPqTS0WhGt+kMWTLz5S1z?=
 =?us-ascii?Q?M6sLlu2MW/bVujMP1eC0USjrX267BS0dYpef9wLmm7B4jBRtEvhWoa+Sf0jD?=
 =?us-ascii?Q?BHQO10iEpevi6A0sHaK0wNKNklqwppRes1o4ru8MgDtyo6AacpNYMEmaSePt?=
 =?us-ascii?Q?s7lMLumPJbs9LhO3vGrwiF76DfY3Per0E3F5RFwkLSWsaOxASieIhNnl8T45?=
 =?us-ascii?Q?iNBHlq+Nhf0trFfCES8DuJYxvQks/2SMUerRtH0Hj8tnzM7S+Ae0p1V6JmRG?=
 =?us-ascii?Q?+nZ3SZczz5fFIXErtupgTN/d1BixK7tRz3iY1eAVRrqyTDCIpGVN9Pi6m5Oi?=
 =?us-ascii?Q?67bf++N1v0JOW4HJuDZMsIYqPRazK3LTBegNWUZ8EtfFx5dM9LLV+3JYkD8w?=
 =?us-ascii?Q?mfM4z7YNJh/gUQVB4aa09oWTIBwRqLqB7h2OsoWCu2i4hB9FRR62wRnxpYqn?=
 =?us-ascii?Q?bNMaFfGV9/Nmg0ESr+L7QE8pUevY4swFMc9SGbS+eGVWSxuJ5Q1nxWdhv/aI?=
 =?us-ascii?Q?lwksJvCTc/qQmn56vjd3DvJYH+YlZ8DK2v5e5dTnRCZd/IPK0hGkl+qaEnQ8?=
 =?us-ascii?Q?O6wIhHcsb7YlEAzauZVcSIsCa+X69uqe0EcriX5pu+KzrzcWjFKHUf5dutsF?=
 =?us-ascii?Q?zbUq0F+DsLDkIk/n+9Dj00m+P4S4ISXaNs+pWvmT54aRsDA4eKu89U0xSxca?=
 =?us-ascii?Q?cN4mi0amI4GIJv2RyOLmnvXBuJ1hqZjt27dNehMo4NBc+gKBeuEIo9UnDmdi?=
 =?us-ascii?Q?gI853VOfT0UqK5SeLrUrSogubKggbo1LvqqdcpB7mT04IiCLrLImTY5n0q2x?=
 =?us-ascii?Q?OOo1UgwXZTuSjSCF2XMJhRgkbK8Fpel70WLvP6h2voiQ7dwZM6z5uJUmO05w?=
 =?us-ascii?Q?IE8Ec3paxtv3DlKs/ulOb2Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bbf108-d290-4126-18b2-08dc2796bee3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 04:39:18.1674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAGADB1N3w59RbhRwKjgxftugaJi7nRbpr9cV7P4lk3of76nL6u5jbPXfKlogXTSzJKDreGgYg+8y1XsgjNDZZhEIqiMqLRRTVV6CmigAMVZIumN12nUva2Jfmh4zbex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11031
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 7 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbd=
ev/omap2/omapfb/dss/dsi.c
index b7eb17a16ec4..1f13bcf73da5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -28,6 +28,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>
=20
@@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	struct omap_dsi_pin_config pin_cfg;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/=
fbdev/omap2/omapfb/dss/dss-of.c
index 0282d4eef139..14965a3fd05b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -130,24 +130,6 @@ static struct device_node *omapdss_of_get_remote_port(=
const struct device_node *
 	return np;
 }
=20
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent)
-{
-	struct device_node *port, *ep;
-
-	port =3D omapdss_of_get_next_port(parent, NULL);
-
-	if (!port)
-		return NULL;
-
-	ep =3D omapdss_of_get_next_endpoint(port, NULL);
-
-	of_node_put(port);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -155,7 +137,7 @@ omapdss_of_find_source_for_first_ep(struct device_node =
*node)
 	struct device_node *src_port;
 	struct omap_dss_device *src;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return ERR_PTR(-EINVAL);
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/f=
bdev/omap2/omapfb/dss/hdmi4.c
index f05b4e35a842..8f407ec134dc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/f=
bdev/omap2/omapfb/dss/hdmi5.c
index 03292945b1d4..4ad219f522b9 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fb=
dev/omap2/omapfb/dss/venc.c
index c9d40e28a06f..0bd80d3b8f1b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
=20
 #include <video/omapfb_dss.h>
@@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
 	u32 channels;
 	int r;
=20
-	ep =3D omapdss_of_get_first_endpoint(node);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return 0;
=20
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index fa943612c4e2..2ef56fa28aff 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *dev,
 	u32 bus_width;
 	int ret, i;
=20
-	np =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	np =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index e8eaac2cb7b8..a8c0c3eeeb5b 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -819,9 +819,6 @@ struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev);
=20
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
--=20
2.25.1

