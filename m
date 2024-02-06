Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DAE84AC86
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 03:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1B511283B;
	Tue,  6 Feb 2024 02:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="EdmyIAWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEA311283A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 02:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZp1vQ4BsU36v3BwF5l3GDZAalMfy2952qnG8QBZtZ4rXhsxTAuiNXfiIAscWjMJF73q6vbaO4xJuVZ8FhQr4NjEJaj5XqUgxUbeXATJqLmWajnPkhJ4KRWlE+of1BDPVjujrPB5Sdj5GKf82o84qnfM9Q6Bc7TkzWBFKXiWUkshv6qy6yQ4kgF4czM0V8wChNMqxKwzvw/r/60iJu5MopEXcV91H8cughAavGy7RQ9hIyG7I5u0By8kVHs56Iy/ItyKpFzjw4EIuP8/eDbwKoYKdQuPLaMq0pkQ18qDUmIhhVvoBvjTQBp4AxcXWCaraCmhPHPrkOPNJ8Wyg5Ecng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwao4mgd6zne6nju4+WqYJ/tYqJbRjF933+zKt305BQ=;
 b=KjR1yjetN8WSzp0Yo5348bXzJ36G2xlW17OS2TXxqCkI7ovxXvaxjtYWePh/q6f2QjiLRSIEiT5OLwjS6BdkFV75f4oJphktQd4l0rUvH8FbkjMZxf9FyRQvSA/fQQd0XO/QXCa2bGL0ir7NukSf4JCWEz3Pw5nKJFUTjYBYmuli1pLUB6YvIC3sthLthj0WEwq0JxSn6sEjE5Bsx6jWncBBaR96govSmw1Rc50cqsGs2aqvnR/Vo0hdiUoD/MobzrshsudpMHJA2igqyWja27bI5rhHYix+VWOV2Uvw4Ytyx9wrXNw8PR/aAiaUffx7B88EbdJlteqLFZLkK/0tPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwao4mgd6zne6nju4+WqYJ/tYqJbRjF933+zKt305BQ=;
 b=EdmyIAWc1V+DKpmjKo8xE+5OwtTIELlbX0ikORh/lUArYjUqSX4zk9lFHONEsBp33c9mkFyDBtDJ9W0EI831g8RNyXjXnz2aurD1ZS+Mg0/MrHPcckka/wZKj2ZHdMuhcbd94kvri9ZIBhesokZWQ1I6NzEGBPHP8kVXR+TlInQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6229.jpnprd01.prod.outlook.com
 (2603:1096:604:ea::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 02:55:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 02:55:45 +0000
Message-ID: <87o7cunvwv.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, =?ISO-8859-1?Q?=22Uwe_?=
 =?ISO-8859-1?Q?Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie
 <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Jacopo Mondi <jacopo@jmondi.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Russell King
 <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sam
 Ravnborg <sam@ravnborg.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey
 <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] video: fbdev: replace of_graph_get_next_endpoint()
In-Reply-To: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Feb 2024 02:55:45 +0000
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d489229-5ff5-4a76-9b6b-08dc26bf1d61
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S++4mPn++clG+pFGR0DnATtGuo+fjwusi67vT+tivWp2j/0523LzLYRLa477A8phmkQvikd8hdtOoyMF4oNQHrETPFgxYvUC15yhXUsHCncHpfZkMBKgW9TcecLS0rxJaZm8JViyVTvteG4dBjZ7kzwAVqPPlT6yBTgj0K7Q7JefiwGXSjkKIWINDgsuM8zyrehUXGxYwHrg6NuJayXI7hsIKz8rHwFITNILqCuGchX66cSEUE//nqrueHbPGgbF1aRjQTMMKUOJWrYq5iFDQ475ttoCf/zvS57eKVScj8O/oO153S0txrImlYEfUW8to0R4JOR4ZChioQ9xwC7ZdL8YT4lA5VZrGXAaPvCo6shptuokZCSxY5S+O1aXHxNqEeTsImWN7TUF7KIDSsRE+ucq4PqWRMNTg17aWyPJeEVmPdbesdZDGum21PfpX0kvx5otoC2zPsIo+n9sWfVnL4GsaczCsHj2R3hEJso7OgCreWHErK0YPo5BFajeNZlc4j80jnWy5wLCRHku/Rhqo6H/koDMPfIxyPZtdacofrP0OoZeq4IjvIGPnSZdELZ/w8Kfq3oaAXDTvwPxHL1eFTHq8Xz3APwxhfHpYcj+16lYj/YjkuhCWTGycI3Qn7mU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(52116002)(6506007)(316002)(83380400001)(26005)(86362001)(2616005)(41300700001)(8676002)(8936002)(6512007)(36756003)(921011)(2906002)(478600001)(6486002)(966005)(7416002)(7406005)(5660300002)(66556008)(66946007)(66476007)(38350700005)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8/DyDToJ0X8YYfX5tHB4iguLuGFAjiPTyivWvfVh84a8VDWD366WJVRiQmkK?=
 =?us-ascii?Q?rNil8r7rAGANG93O2lNKEc44h970SXk6fGANpqMZU+exMd2Z1Z1BmoHcTeWP?=
 =?us-ascii?Q?G7552uE7ptS9oas5KJjq17532EmnzhmTbdtYV7b/d+7X+W0JqXfimQyAqRMT?=
 =?us-ascii?Q?txvLYMQvtGDQaW1JTtAHz6Q0/19KDOAI0zgn+YPuccFnfCJrKnJb27IQvrm+?=
 =?us-ascii?Q?0ITLQk5Zp06NGJk2zKSVxBQJqxqTUpIir5wd9Mqntf6TMSRH0heO/abVQ2Ha?=
 =?us-ascii?Q?S1US+LdPpkYvD6Zt7eV5r0lse5G7DBou/JlltfspGA26T6tPaP1OmG9+VA6D?=
 =?us-ascii?Q?V1YJ78WgsE2lU5swCHbjj6MF33YaWy0K72VrkWFyZOBZmtxE0JTB5OKrrJNg?=
 =?us-ascii?Q?OLtTKjEQVqUC/YUpymPHzDhEhW83bklqQbixT0SLlwMgGo+MAfQrAKmPPlML?=
 =?us-ascii?Q?IrRisFjV1zNMtzBfq+BBDCQiuPkimAT7sm7EVh79vVWFVJvFe33slITo7uoa?=
 =?us-ascii?Q?ij5nZYeanQqlt8JTNWcVGqAV4M/+rlKNYTyPYDffRuQ89xcvd4deb8O26MUS?=
 =?us-ascii?Q?fT6f3ajzIrZdlvlnc+nUsnP72fWsuaKADNU2txqEvXFQUw+rg/1CeY6a+hdi?=
 =?us-ascii?Q?x2loUzD728srgn7XWaPXNSzKMIxxBAoAv+VIoP50fmGGs3dYEgTMfLRH5jYy?=
 =?us-ascii?Q?2KQseX+H+DqBV3UYSEgS3NVY99Bo/TWyP4lRhf+N1D/VlPx3cfOXwav3/VD0?=
 =?us-ascii?Q?ne8RithmBJkIs0vF1d0MHDmWrOgyJlnUHt4DXcE6PKAm6SlEQAt+g/xM4vno?=
 =?us-ascii?Q?8p7WmY/y7xlvfGGcpVJekX2wmGBNoXGT4U+3PXhkK0y1puAbiBguFq5WnKJe?=
 =?us-ascii?Q?kALkW/TTNsoBH+thGitvt4EZ7JBQr9pAJis8hLPfEvEXUpvHvPHMsrUimxRO?=
 =?us-ascii?Q?ldhxtzESzI1XbfSJa2UP8kvt1F/zv1dTMzTfCDRWX/PoqwrxszrdkzlMRZTQ?=
 =?us-ascii?Q?BTIBkSAwsHupHuxGVK2yH2bjIJqYVkPCJQTLsVMuXRUadi65Bg7nCtukIo8a?=
 =?us-ascii?Q?kmUHLRK6EnB8OlB9uF87DzPoW4W1PiZMfbLyH1Xv36j++8O/bd48vjG/+9aI?=
 =?us-ascii?Q?VJu7ZUNS5QzaOvxhC9FtnYYF56oNx2zsQ7ht96YujAH6mhSF+eMCJC5POQnW?=
 =?us-ascii?Q?FKh1MpAv5Xp0zj3WmjG4EOzNLRFVcYZSzMYY/q5Pb0SMoenS7vg/9199zYFe?=
 =?us-ascii?Q?vmShdogdEgqzrcys5z+xGaBBZ+Lcq2s2QhmvNFNVGfpMxx4/SMZ9OcmSCP7a?=
 =?us-ascii?Q?VljX7JotODTo9blmLuToWeK6DRfVFTNJB6VEJqzAK2jp36QVw9985BAAXRBB?=
 =?us-ascii?Q?PVk2RtyiJQkZsXNvCfPdrzSvJj441lHAItyiZVx4LeSdLBNykfFGv4cVaZoF?=
 =?us-ascii?Q?IdMnN8XqtDGMlpOuPz8G/8JKZIErLZ2UzRMBLOu9HF4IXpnyHqgkMY94StPu?=
 =?us-ascii?Q?ivGCIR43EDRwcNoOOC0yDXQA1/RMniampkPHyyIbsStbrLeyyft5BrkCwsI5?=
 =?us-ascii?Q?UcHry0CzbWJfQAmq8hQwJvD1WfhTHkd7lbBSUJinx12lMGeOog55GOVtBqsJ?=
 =?us-ascii?Q?ZFoOfNbaSmtqYOC3MDCYVqE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d489229-5ff5-4a76-9b6b-08dc26bf1d61
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 02:55:45.4737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEicr3Py2OkIdi0H/2E/mQDUa6zW2q7DB/m8GbOKPWr/jezflWziAPWNeHc4hNPqbFK15qADkSTuLdxchqcMsV1HfzqupSNKGtjTvay7gFxPxHRxfUNIsKs5EmrvNULe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6229
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
---
 drivers/video/fbdev/amba-clcd.c               |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 8 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clc=
d.c
index 0399db369e70..2371b204cfd2 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -691,7 +691,7 @@ static int clcdfb_of_init_display(struct clcd_fb *fb)
 	/*
 	 * Fetch the panel endpoint.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(fb->dev->dev.of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(fb->dev->dev.of_node, 0, -1);
 	if (!endpoint)
 		return -ENODEV;
=20
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

