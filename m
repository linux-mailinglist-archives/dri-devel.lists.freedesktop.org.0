Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E384AC7F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 03:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F29112838;
	Tue,  6 Feb 2024 02:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="jomGM3NJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA7B112838
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 02:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4gX5vAMbVGbRAdQwFmS5h261t7aGaDA6NGQeMAzTiUyNab44irpMePUvdXtrAm3VdVioPtDzBXkdEWqtbYSiwwoBzGuIfYvWb+khAKR6LBEuY9tOyf38utroHUok8SZnekhm84ttCAaknKEioO17+b+2xWlaegnbTjEEmkQ7ZpEqE7drEv+SPVhFddN7eOKRxconeMoQxjOSXeUYoZ1mF4Xbs+YBaayB3TtS7v0BP/SnllKN+P/fL3TkmtttFN1a79SW628Vt23qHfv3T8iigzHK60Oyr4gqbnkMgBRitJeSeUsk+yGEhX70iPrdbTviiXluHq9vkyRLpSgLkwJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXDCKdxu3XbL66spWq/h58bK8M5QiIyVMc6zZQ4C/3Q=;
 b=GqkR7q87sc38HAJ7QdIzZUjN1BxfvNBTPUYUTMBn4wnvy2+EQM0dZwTEfPpH73twOrBbIp/RuzK4L5g/ecqx8Xs/wnxbwHaAaG19bO15ZLMfHSSuwVDYzk1HGwgTtMl5gibeCVowL7UK2lAX0oBX2KWaOUe7qc7YVCgXIuxH4CyGo2PDBx5EsVE54zJMqfbZGsg0xFn0OfZauuTLO6XUs7JAXciThcl56+W3jiZsu5ki4n1Pv0OV4RyHHvziAmijqVzKTdXTRMTqejAZJ9eXzxav7INAeTftI/EAYp8Uxyj7Ktw/XTFRjyEvXM0MMNUlugXJ4jykgNTf7PI5rckrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXDCKdxu3XbL66spWq/h58bK8M5QiIyVMc6zZQ4C/3Q=;
 b=jomGM3NJ1ZoZyY/ofbIJhjcUoZi3otYTKwUft1mF5ipCWafXztAiwtSRfqYHKoz7Os+24yWWOA+Fbks/ISXtqCGV+ZikNcseUcJuPbj2CNyLu1dyUFtl1Il9OECefcbZKMMAln/NAT93KvsqPMdiW2SxwZDnOD23bZkindcPRSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6229.jpnprd01.prod.outlook.com
 (2603:1096:604:ea::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 02:55:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 02:55:38 +0000
Message-ID: <87plxanvx1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 3/4] media: platform: replace of_graph_get_next_endpoint()
In-Reply-To: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Feb 2024 02:55:38 +0000
X-ClientProxiedBy: TYCPR01CA0080.jpnprd01.prod.outlook.com
 (2603:1096:405:3::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2c7cbf-6aae-4fc2-133f-08dc26bf1948
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5dXkc08EDap3nYib0ZnARp/E8xbRt1e9jCc6Ipje3wDe4L0ZDLTuWa6pnkb6rJDknP0txwu2QVPNSCh35Biicu3zw6ynh3KtmwZQzemRFGvliyUBzPTRJ2ak0ErLbHxzYbmXBI0vkblo8hQxS/uBtNhmEmkEZ4XhVewshWanwoNnzs6DBRHSLHt8dk/s4DzGNuUXkj5TX0YgF4+Uok/IqwJH0mQsZLrylyeVsseBx4V36dv1zvFFAofCFlIKWH4gObrSz1Bp79NoHfX0BngXc5EWHQRnj5fKQbDHJtNPzme7UnHzbxKbpNwtbOUF7h/VltTnOwy5YshjCXIriNYsu0L4gwIWtxt9JKlXL0HzClkvoPdUvCfaftyyfgmrzzPN8NYzB1MgnzAo4pOIKbPOTBldIHKR+HuFHyfb93tE7Dcz8B5YbtgJRyzoh0gMSqm0NiVNs1UUAzkmbNwGJdpuXD1eWOvCl2QJLxWprACnavSKpZYBG2KPNYaeRyXE52ZiyAjsc4gLNdFGNSgi0yFSIR+aBfS+hNjlCqhOLB42ll4CvgA8sgJQWbCQMx34919E7IUu7AP7Eu+vsckhDHSxquBH9aEMvyZj4k2VusqpSLs/+idydeu3OWXu8RRtKTm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(52116002)(6506007)(316002)(83380400001)(26005)(86362001)(2616005)(41300700001)(8676002)(8936002)(6512007)(36756003)(921011)(2906002)(478600001)(6486002)(966005)(7416002)(7406005)(5660300002)(66556008)(66946007)(66476007)(38350700005)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P1ZAHBhX1RzMnU6ZtY6e9mTc8o602J/Aw6MXO7AVDFv97UAWKZRvl3e9BbuG?=
 =?us-ascii?Q?VMyzKlFClW3MTYYfNhrji0U6GRqACSksErufri/FcKWMjCqtquSYXbTa6auQ?=
 =?us-ascii?Q?6V72o5COT4RnmClAuRvJRZ8G2uX4EMVqUZQCVmzl+yi+NOROUrrzVeYs+kUo?=
 =?us-ascii?Q?gllnwQrBYFniEzZTxVx8swNoyTDijmdZSaKR01965g1PS6FzdmeZBEeomF1B?=
 =?us-ascii?Q?fk97nvwVBzelf4ox8nNv1yFZFNIkOx8GwEx3XuA5KJpqvFLOfWMbwsP0mOPk?=
 =?us-ascii?Q?H53zfKh4fLLU269uy//UBHLWDCfan36opBvWCiuSu3RvtRB3PFm5R9uvDg87?=
 =?us-ascii?Q?h0x18SogvQAZNr3VVxM6mhYpanI1fcQzhuBiFuN8OzG8fVFPmYKDKqT6khIh?=
 =?us-ascii?Q?bvb/3h33GR6WstiC5vhR8ybEjjbDzUuJ9rkKfHgX4C80Jijt+D6cZfRA2Yak?=
 =?us-ascii?Q?flIdcGltXbuUzChQkazoSZFRS+dU3d1c9SVqvO+UwrhxIuug7OmOvMB/gxC1?=
 =?us-ascii?Q?l/lavUy9gS9xsT6yYm6wIcjgxoeRkVFQ7xu5YtGflEkbU4HFqLmAiiXWPlkN?=
 =?us-ascii?Q?1JkU+lXsEeb2oQtm90HzmdKJCxZg0mpFrSxbQsK7qLnHvyG2Y3/7Y3vs+l63?=
 =?us-ascii?Q?BBNPvIVVcJxtX/gvwiAsIPLW+YDs5dRgqIZKx/7b3hNSszL2Geyb75g5gYej?=
 =?us-ascii?Q?u1Hpko1nky5CZw3wRlRIi6aoFvgtBDYnU8BgcOTy8OXZZ1xI43BfziaI4j+W?=
 =?us-ascii?Q?MrXab1+i9sWNmwDs2XORywt8TK6i82lE4oqcJx5KZwHqfqjyBk7t46u9lNu9?=
 =?us-ascii?Q?BJCqQOnBUGF4fke+DeGUmATgLaLp3O0TYVHdPxYaXAh52aD9I27jjU2neAVn?=
 =?us-ascii?Q?6W/ZgNA8dyccDO8TGjwWQjB0+NW0wyauVeFyJifdEo1BR8GXOkCNkEXZtaAS?=
 =?us-ascii?Q?cF6DPpP0IMxdyCEy2OsSkTIhCfTutLBgNLd4UZn2M8OEeKAVJZOWjw8GF3vr?=
 =?us-ascii?Q?9gudox3W0vXF9paDjsUkZuskJorHSgvFaWWKOdE2FpZAA3iL1Qj9a/m11Wh0?=
 =?us-ascii?Q?G/bX5vnPeNnoUJcAAjYsOE3+etHk6S5nKwpHGKp3qRm39s8Lwvgn0wovTVYZ?=
 =?us-ascii?Q?V357/t6ht1t6PNiMm8oagJmGkT/Jk/cscU5a7Nwwi+LROEMNrYB8gwvQAup3?=
 =?us-ascii?Q?a7cKERkuA87VbjFRCyqbGm6WjkW8vzQ9dfd11vYbkn7Oke3rJWIALujpyCDV?=
 =?us-ascii?Q?YQj9GJVsb9yk1F+5Ir2Nr7arGVnb+uTL4VzENytgdGudr1tKVUr6W5nfdMLm?=
 =?us-ascii?Q?Q2GOG/kUAdmq1HeP4URc8c7LPGV0FhDlsMTXxfiINUe9X+44z2Khvkcp21WN?=
 =?us-ascii?Q?bWKj5bhXN3qZRnSP6xcXCB3c9P9x0u45nwYTNbzDCdYvi+iu1+8zGKeN95im?=
 =?us-ascii?Q?vrLFMXqckumfTpV4LCov/t2QB6LpzKRH70X3Az3+T+Ou8SibhWu/0DE6FOpF?=
 =?us-ascii?Q?TJW3V0Foscs9uO+gvGX0+c2S0f7Ozgbief8cG9k9gQ+uFcN7HtRjLVp+9e9M?=
 =?us-ascii?Q?i2GHKUfNEFpYzKcQEjI9hMJ/f8BzmjGCrp6rH9JSsOhvD7jOo9fR4Hkt957d?=
 =?us-ascii?Q?6M4O2RVKp5CuT/YOqGLPuoY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2c7cbf-6aae-4fc2-133f-08dc26bf1948
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 02:55:38.5869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGEvgiSX8trAIiSA53lvbeWMXwLbvcqvaxR1BOisqClU9Ppng9IitfPg7Jvh3Mwg0qVofmxP5luZZdkd1HrxjqA4TKMDwDBHpkPfPngNW1s5RTx7uS2nN8GmMYif5Pzi
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
 drivers/media/platform/atmel/atmel-isi.c              | 4 ++--
 drivers/media/platform/intel/pxa_camera.c             | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is.c   | 2 +-
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c          | 4 ++--
 drivers/media/platform/ti/davinci/vpif.c              | 3 +--
 6 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platf=
orm/atmel/atmel-isi.c
index 4046212d48b4..f615aee85968 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -831,7 +831,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
 	isi->pdata.full_mode =3D 1;
 	isi->pdata.frate =3D ISI_CFG1_FRATE_CAPTURE_ALL;
=20
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -EINVAL;
@@ -1155,7 +1155,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 	struct device_node *ep;
 	int ret;
=20
-	ep =3D of_graph_get_next_endpoint(isi->dev->of_node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(isi->dev->of_node, 0, -1);
 	if (!ep)
 		return -EINVAL;
=20
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/plat=
form/intel/pxa_camera.c
index 59b89e421dc2..d904952bf00e 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2207,7 +2207,7 @@ static int pxa_camera_pdata_from_dt(struct device *de=
v,
 		pcdev->mclk =3D mclk_rate;
 	}
=20
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(dev, "could not find endpoint\n");
 		return -EINVAL;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/=
media/platform/samsung/exynos4-is/fimc-is.c
index a08c87ef6e2d..39aab667910d 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -175,7 +175,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *=
is, unsigned int index,
 		return -EINVAL;
 	}
=20
-	ep =3D of_graph_get_next_endpoint(node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!ep)
 		return -ENXIO;
=20
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/driver=
s/media/platform/samsung/exynos4-is/mipi-csis.c
index 686ca8753ba2..3f8bea2e3934 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -728,7 +728,7 @@ static int s5pcsis_parse_dt(struct platform_device *pde=
v,
 				 &state->max_num_lanes))
 		return -EINVAL;
=20
-	node =3D of_graph_get_next_endpoint(node, NULL);
+	node =3D of_graph_get_endpoint_by_regs(node, 0, -1);
 	if (!node) {
 		dev_err(&pdev->dev, "No port node at %pOF\n",
 				pdev->dev.of_node);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/p=
latform/st/stm32/stm32-dcmi.c
index 8cb4fdcae137..4c00aae013af 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1856,7 +1856,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 	struct device_node *ep;
 	int ret;
=20
-	ep =3D of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
+	ep =3D of_graph_get_endpoint_by_regs(dcmi->dev->of_node, 0, -1);
 	if (!ep) {
 		dev_err(dcmi->dev, "Failed to get next endpoint\n");
 		return -EINVAL;
@@ -1915,7 +1915,7 @@ static int dcmi_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
=20
 	/* Get bus characteristics from devicetree */
-	np =3D of_graph_get_next_endpoint(np, NULL);
+	np =3D of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!np) {
 		dev_err(&pdev->dev, "Could not find the endpoint\n");
 		return -ENODEV;
diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platf=
orm/ti/davinci/vpif.c
index 63cdfed37bc9..f4e1fa76bf37 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -465,8 +465,7 @@ static int vpif_probe(struct platform_device *pdev)
 	 * so their devices need to be registered manually here
 	 * for their legacy platform_drivers to work.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(pdev->dev.of_node,
-					      endpoint);
+	endpoint =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
 	if (!endpoint)
 		return 0;
 	of_node_put(endpoint);
--=20
2.25.1

