Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F584AC74
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 03:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9DE112418;
	Tue,  6 Feb 2024 02:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="h2bRmjjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CEB112418
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 02:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNA5bWN2CzQzAJ0j3UvmO27lwpTFtVASzlV5cvbKabppLC6WcOHDPusnA/98cVepW8kvIo1Qg0YNBwOOkySC3l88lJeuG8HH8UUH+S1aMWRGzs0LoRh4o6jVIt1zSqu4/1z0y525cLgj7yWuCu5R4Qs6KPuJP/U4agCmoZT3KwYBk/agoue9xt6rl87T7AbR+RmDXpZFsFHnWujMDMnXAzbp3+TOcVK4R65ZE7N3Gy28PT8SjDSaeC3qkBENM1Y1/X2b7r0/2BC5uEncZvqk0qpYXT+JGSRnN9Slmieb1pU6WsBqZVWZG4/ZPPawZY9L83eMTDFdIj4I+A7bkMSulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iayePQaMqz6HiATSvdbrEEMINCdHsBYoIgHDVRwiAQI=;
 b=dQobejUTQSbZyWDAiVpPzgRRHIT8LxgqSPyizzoCJmT+vMFKbdl/qD3UsEp17A+WegsJLI7/6KKr5vuSS8oAabB0rcRQ7pUAQK3pNfT6/t6SA+Pj+pMNp/XZXXCWfPwIh7/9S4hQK1ylMiR0yqJ5eYPlvWbSIV9ZvvE3uNEMhHixFOoFU+TPSI5IsXDBmKE3WTvYouSCl0y0Isq09CROE4vm20DTYgUBrILz8/5Ta2a5W2wMVJ0wJEpbMEBVKlRljOu4q86rLh0G8goDNrDG8p95DTdlSDzPZ2ikJchyRywEfIQIeUJ1KV6FQHGaFo87UfCciO6cK0LhweSkDMdb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iayePQaMqz6HiATSvdbrEEMINCdHsBYoIgHDVRwiAQI=;
 b=h2bRmjjOK+tPChod8dwmkTXoFqhpucnavJmzx59h0Oj1rGQ32+kxHumOXHKCjaKbixmiMPBEsGqFjxf4phLommipj6/Fs755swOTHGtHgWdv5gAwZK1P9sLK5GAhPadOnk8H0pGgdREiWEvbLYaEUo0v39GZ3+EqssMHE9F5ybY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9700.jpnprd01.prod.outlook.com
 (2603:1096:400:220::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 02:55:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 02:55:02 +0000
Message-ID: <87sf26nvy2.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 1/4] gpu: drm: replace of_graph_get_next_endpoint()
In-Reply-To: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Feb 2024 02:55:01 +0000
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a48314-7b86-4a7f-6b68-08dc26bf03bc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +P1Cp0ZhdoF44ZMT5+6/wCc6fbUn0q0gKVq3R40cRq12TH9FP8ok0wLpmEkWZxEdP8wxzIlS7grwe0V23M4oexJEZweUxtyh2mQqAYk/WbzzVbZWCmfPMXZtgVtQJkpHj5f3twTtEynDcRYKYJvbKjNjjSburHLWgSvuZl1GMF090OkqCcMNmD3p4wOo4CbXcQtdv9OjSsL12fdmTNJ8vjcBwjzB1JkVENyuMgslD+SVkQxQeOpvFmwc/gNycbH/YsQB80Pu22q27K9eFacPPCtL/BPDCts5I3knGnoBv+F1jsLIPioVbaaouAbLAhKkPevDB4J6wVex46PuutghStspCRZJDc9zUKrtGBaV+zTXoK9Kal62x/r9jpsEP7RKZvNO4wp6YhRZDGxcTnikCTRSMGhbVz202gp5BRLW85XmnkQFc0nPvozm4p/+AcT4HSue+6Mm6qSRYqMJXHPhJzYmoMEhmrIP0ouFfLC/ulVY1xFnmre8zTry5jq156rz5Rw9isqf1gMaTxcuq0rtYHQLXMjpwhysyOIwnnWpnTVkajCOifBA10QBxXPdLmjM/tFkZa90yPLWXZlAR4+GrTyyX4JdDm05lK53+QDHZ5auxZX585/XQAWCumbaVxxz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(38100700002)(6486002)(110136005)(966005)(478600001)(36756003)(6512007)(6506007)(316002)(38350700005)(66946007)(66556008)(66476007)(52116002)(2616005)(26005)(86362001)(83380400001)(921011)(8936002)(8676002)(7406005)(7416002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y5JYXDZgyjOB0/l25KvEKnw2Ztyr45wlD1GWHJM9Re8fCAaT8peLiS8EfE/u?=
 =?us-ascii?Q?hUMDu+zPETuyB7htWRvU8Maji/PevcO9NObyVbICNn//hIuPlWEdtWoFYVZ9?=
 =?us-ascii?Q?tWEGrCb5RiFb6G1MmAqELKXQd32923QUYnGJ45na3rY5QaNzbOsDYvYgYVrW?=
 =?us-ascii?Q?mOFzVrgyk8WSt9RPPK2vB6IV+KCBx4OiaGSuoxsL+Je6+n66X3TX298OVVAk?=
 =?us-ascii?Q?eewfok9RSWs4sx1pea7VLOvZzXgZ93EX5u+v8R1hUTMQyF4wX7sBjwu8i5VP?=
 =?us-ascii?Q?bcBXyzvcRdt9r2g8/6sEqNrs0hy/2DFhzPNstoyRKnp3P9gQDEzoMoPY30Q0?=
 =?us-ascii?Q?Wmthnk/HwC8JCQmmW4tOIXOUpDmtx/9xW0To/+fc3B5LgUHCU+rxOipgrYCL?=
 =?us-ascii?Q?9WqmxzkfqnhvTLzefqs2dcY2kyfJIq6JOMmCWyivyJm27fPRlQkTt1mTVFcN?=
 =?us-ascii?Q?RrtSZEJXyVLqMb62Yo1bMuCwQUbeL7ANVRK3a5SGzjgGff6dAHCC1ZDuhwwR?=
 =?us-ascii?Q?Er8TM225oMftSnO8JFJLrGMNYVwMk4fpZiS4hocRHe/jPh9WhitAbUxBM/Av?=
 =?us-ascii?Q?tjvUZJml48wTYlt50ESi6kEg6KxlgUzWg5Wtjmd6B12Gwz6PJ6JEz3RQWIK2?=
 =?us-ascii?Q?ThWhEasquL3AGdsZAOEHgXY+tovBT9AoUOVD/bkf/Nom19Q2/CWEVQdOq2Ox?=
 =?us-ascii?Q?iPOeMDO5D1T5EdMCub0FrZbvDNqt1Qf3Z+Qn0SKBumMuNJLVF1TKLBZSvlMh?=
 =?us-ascii?Q?FXaTjAkro9hiyk1gmDFReygQzGsCVPymqVfN7ulw5RiyXUeRykKOPw2HTe3K?=
 =?us-ascii?Q?ONWzaWf1cqzdnz1rnkMvci9lI4kitVobBEnXB+zmIDP9vauwcusqxz+zHLpl?=
 =?us-ascii?Q?/DxeEtuTpJgVdaAdNd4LrxnjnF12HV62+3S3LE7tq/fxT67N11oOC4jB42gM?=
 =?us-ascii?Q?rHQBhQKy4CEB/l75MZQNwqToZ56rcI5gU00cdLgF/b/hQPSkq7mbUuKZN1Us?=
 =?us-ascii?Q?6CUiIjhxYldYsG7h3BU6Pt3ku7AGfzDMBlrlcmgXVIelg23kmivgQdm6p9Bp?=
 =?us-ascii?Q?oDcRFNa0RzBBmICxPtXI76IogU+iDDgNy7/FlAzKoNiEflT/rCWtWzWhYzAQ?=
 =?us-ascii?Q?6YxI/LkqN0U03lb4Fw/NjNJBAZjO+1/FNWrpm8vsuK8ZKZ3EDj5oCeUdBtAd?=
 =?us-ascii?Q?JEjxsAkY3aak5KC2HEuJGdnUVH3JrTPwvZsjSSrbJcfZrw8VrWM00HpRioi1?=
 =?us-ascii?Q?/zNAxaUEa57XCR0qBRS3y548OSyFM5akg+0tNjHsrNZdUZEVmpm9Z9nba7WX?=
 =?us-ascii?Q?FichOHUJpt0Bppo/jqwBLUu0AZ/5of1Q7Kl8pOLPa4dlMaHOuMlWn5N1s0A3?=
 =?us-ascii?Q?weh+cVVYZGXKza/dbogHEHgiSt/SbYeSwRmah8td1noe/QUtoCdsPpEf0Z9P?=
 =?us-ascii?Q?Edy6RUMx1m7tJCSk3ggqll6GoQ8dCR8pJsH27RzjIu7l9LgNzU5qkjC6RnV7?=
 =?us-ascii?Q?J9I87nXvJdIFegQRkEod6snhGLM6hH7AaykIsaiVau6lRKxgx79Kn6ELKMuI?=
 =?us-ascii?Q?CkrqguAmqPMKjkQyyzMBg/FQR4AkMfyXqoPz7rMgDyDkKX680VD4wZTWGapj?=
 =?us-ascii?Q?HdPKyg1zjMSphzPmldQLDtg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a48314-7b86-4a7f-6b68-08dc26bf03bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 02:55:02.4302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SriNZuDemdvq/9XrEcHo3KBOoPGs6ac6wbhViHJ+q4I3WwrZMocnWqyBEYeN+ujBGy3BhSUxSXR80TGniGlFEcnDpjeSUv9zdFFuxZnz3QUZW8nsKctPt4ZTN3jheWpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9700
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
 drivers/gpu/drm/drm_of.c                              | 2 +-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..c2eae9296012 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -516,7 +516,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device =
*dev)
 	/*
 	 * Get first endpoint child from device.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return ERR_PTR(-ENODEV);
=20
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driver=
s/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd6..e10e469aa7a6 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c=
)
 	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
=20
 	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return -ENODEV;
=20
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..04d0053b9315 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpg=
u)
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
 	 */
-	endpoint_node =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	endpoint_node =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1)=
;
 	if (endpoint_node) {
 		encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
--=20
2.25.1

