Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112195E65B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 03:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A9410E023;
	Mon, 26 Aug 2024 01:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LFenaC1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2D10E023
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 01:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0p+K9uSrkaYmyd5sl2Cy3fquZw6YJ2Ctgd3dT4z79X4CvRGqG/5cbpBVR8gqsWQFzhEZu6af7aQb8ZJHzFdz5ua7b3MoTTsHIVPC33qRkSwEJLCGIVIvHCO0/WIL01bKmDuMQRHugrb+RoR3RWdeOMbB4pbve5j/O3+0zp0aWMpAMP5+D0+9eAh95mckQi6LjG6nyoZs4KFAL4Sr0BlqVd9bbS1Zo7DGWFvPlx31w99E9iNMzXerk0ZTbCiWblx27o7JVRJWGO/32ZD41ELso7yV+h+fjdxZ2F/fBp8NbGBQUROicGwY0XvvdMJ56ODHlKmqjXSKR/9rUFTqLJmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSyhOyc2OV8lk5c9oGXR0C4gBwoM3PMTQrZLofPt3G4=;
 b=cFn3qkpqgoo1+twl0fhI1PgZlcNb7HFpgr3bs2ukXxTgDYNJhxE/zWwre6dhTYRz8i1lrcH57HLCcmBlwOFzQ5ImvhqU4k2gpQL/i/QAVP2i4usES75vM+HTQpKV46qi6dy6MWbDwMeaCtMxxMwAdVkEM+3XkyjooCIEe3aV1dSPTQecJJTGCSraiT/WY0W96gs2rm37XSk8bisXrcE+PLPsaKfiPx7UJKtScZ8J2izJFg929RS2oUIoWXf/ZjrZcYHrnarhSVuyDRv3R2X7Ku6lHzY9wVFr04/d9p5l0j/2bWVWiTnokaZb+cE8qtTgLiy1LnCIg0l3O6wm6DjVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSyhOyc2OV8lk5c9oGXR0C4gBwoM3PMTQrZLofPt3G4=;
 b=LFenaC1/2EqJ8l+03OUVchm+cyBGkVxX0iP//lnncl4lk7ENyeBQNrezKqqcLwFpY4ilnSZScpiQkehDl1YtiYsNBZgCDZrD6x+xY4tSf/Acb3kGNL9p4t4RZmhtF6WfTufHq5DJJOCvr/tQwPjZB9PUjftUUdJhPtBkc+Mp7C4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6116.jpnprd01.prod.outlook.com
 (2603:1096:604:c8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 01:38:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 01:38:44 +0000
Date: Mon, 26 Aug 2024 10:38:43 +0900
Message-ID: <87ed6cqd0c.wl-kuninori.morimoto.gx@renesas.com>
To: Alexey Brodkin <abrodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] gpu: drm: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCP286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d50003-01aa-4466-cc86-08dcc56fd267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y51AQYxr8yLexsuq18bHhnEkaOItpCHO+YU8mP+l2Y2PH+/W5eTGvauQqEWR?=
 =?us-ascii?Q?j8JKcM1+RvWixiJ2ZoEGMyptehgUrctBZqpvzWcXdvdtUIlU9xOXLA0XZJKC?=
 =?us-ascii?Q?Ov42qVk/3xgvZ2h3pJcC2b4s0zvWrvcmWUgQ6N+F3E35QMwQOTyyX+OgzjkD?=
 =?us-ascii?Q?8PZrCwj3eIMnEWI5nzgiwQhMhY7XMi7WTAlot4njc3EV4LQ4R5QOMbAVbJ6h?=
 =?us-ascii?Q?mED5sG/RDFHMCnVFIQAL/wch8/FVHOLXp0C/V2jwYKVYrCRv1dCr5irbIYQ/?=
 =?us-ascii?Q?H+4+Yqvdbx7pAlnAPRILvE/Gna7QloE6V2Hf0zfoGfwofqmx3k6+PShAM1RR?=
 =?us-ascii?Q?XMJyfWoO23eWOkXoVHJyDV2wJSC98s8/jyFxyjIuegRz/uJ7pBnzIAUAEj6+?=
 =?us-ascii?Q?V1AnGXff3bVYX6amJvfv19dsshxSrLyjT+eoOYUzlTEFwEaqns2GFOqLRcMp?=
 =?us-ascii?Q?Ud3Jkly8ykD1x3nr53dgM6LnxnM5fjVRgODQ4t+zw9hTUUdI6f7GnD1Me0ID?=
 =?us-ascii?Q?5fsFUg/vDCMB6R1cdN1aIScNgClYxvoZJnrtC0+sQCtKkh7AkjfMVRZjHNHf?=
 =?us-ascii?Q?goiOKVUnDOFkX7Su0ai5OyqcuLPwgdwsijGjfWHqtoYxd9YEnL1MxDXyxPQo?=
 =?us-ascii?Q?qI+wIz78Z1VinmZtVgBCXcG79fpQx7VajlDSQollAqc89B2sEEJjt8LCz0hj?=
 =?us-ascii?Q?7wN8N9nzq8YdGXKnmYY8+iBNms6LPG0BEFjTElsL2byjlmbAuTPiCiWzUISd?=
 =?us-ascii?Q?xpZL/WkJ5g6qaA/Yf6QmUY91AURA6RanDaApcjYl24JqKjLdC65jOKXmpUgS?=
 =?us-ascii?Q?kM8arkHBlZNVku8gwtVaXyb0MKRJEzFrDyE/OuO9/ecpB1RxolFMebnVIoeV?=
 =?us-ascii?Q?7L/sJe6Bd7KNt5OHbOCn4TiLGNyFFg34k0F5gKb6cinM73158WO2ktayThhp?=
 =?us-ascii?Q?htPR6x0kI3hJKVytkUg/s5F1o6Pf9B5hYT3gNw/JjZeRl3LD1xUnN8T2lz0l?=
 =?us-ascii?Q?AUd23fT64QXutDCXkg097xlMrXE3FazP8bQYDBJBLoeaesQG2RDK+9kycVBL?=
 =?us-ascii?Q?WSmf0Kvkf/zCLHNEauccXvQcaM1ekx3uq2BESAF6ZNEp/4A4n+MYIoPPLHfP?=
 =?us-ascii?Q?RhMC9ywsy9iAmrfOiE6izej42xBfNDQotryHSt+4Ptd1+oSNeeD1XSDaidga?=
 =?us-ascii?Q?jOrYe/25AISmC74+cwdSsSMvZuBrkhtzIey55O5wSqtBNf76u1jyAQDkq0u0?=
 =?us-ascii?Q?WYaeHob1vOaGENTrhbKL9mCNP6d5chcT1sKnnXACHmDIONtboGLd+Y5DSkzm?=
 =?us-ascii?Q?PHcDG8IF/MEk+wMvJoXJrnhXN8uNPqybITGcRzDQvB5/e9yY8Zelj+FWyB1P?=
 =?us-ascii?Q?gJ8XhzJQShpntma+v+NNDq16WV+YKR3wPsmm9YFbrQ5Yc07qQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rfaFbi01Q4+cSx0LmvvSMLZlUdtaiTduDjC/YSc5mYRL3MrZQRvDR3yhVPzS?=
 =?us-ascii?Q?FKP6qMeDoNt3sqb6rEZQV7w1rFJphIg1lLNAVRGzmKlb2HzlQWQstZ7J+AE4?=
 =?us-ascii?Q?dSZ2R1Ou7SaZM1gs9a6S3FlzY8wn+p2oPJXPzq46mAYD/zKgl8UtiAf/umn2?=
 =?us-ascii?Q?iZ2wL4H2EgtXMONHz6cNqYfdS/xxBEZd27Wt281L7UbEegJt441HOZ6LjrAR?=
 =?us-ascii?Q?U4Nel+fXx+xmTe1U8z4d3ReRKTmGZRFGBbdQVvHPYUgD/wiRtWymoYAPylJS?=
 =?us-ascii?Q?mh/d4yxxATai5sZo+2MSiI2bmsb5aXco4N3+zJz1XfWYGURyxEAjiOKEV+OC?=
 =?us-ascii?Q?tvOFscKXNq17/FZYPI3xJ/3XOOr1O6Etl77R571YhwqpMpRUe6U3kyp6z8tb?=
 =?us-ascii?Q?rdx1ICfZLq7UutngKqUGaa4Kl0Pm8zWZnHaH86/DRVRu4Zl2rEMtKWkfyeea?=
 =?us-ascii?Q?xmbcAeH2nq16h9f1VRaZn7GixJfdig/bRrJkS9UkHfga6kZV7UeHvdH+/VvY?=
 =?us-ascii?Q?zp5YxycjNeGmLNMGMyMwqr6iydaM3DcZ4l67VDuGF8NQivQThf0f/hIBLGB8?=
 =?us-ascii?Q?5aTdX1xmUKb+IQl/r8isL5ezD93aMet29aLdIBHDyfGUvO782+wBSm2Bm735?=
 =?us-ascii?Q?GhXDxeQtIYeRYIu/FoBa66LKQxtkYRxt+SVd/pPqnUZFBEh8/YLgmxtrb41U?=
 =?us-ascii?Q?0f5a6IcjwQg2nXG84DJvMPcwoXUOC+U1Nc9xlCCmLNfwrAuiqaUrEH8A01GE?=
 =?us-ascii?Q?jICmArBklYvheGDe4WABIvLEy939DVRTE7KKmWhGH0nP/jf/tGhMCyZvS518?=
 =?us-ascii?Q?310t9Ix4u3Pf9Lk+g2IXTjKEJdtdY4RZUZFUsQwF9h6Z4r0GTfR11EvTonw2?=
 =?us-ascii?Q?dskfr+oWhXQ6zpUz1WZDqspPxwhhgyBldD4IGKR5QGsDd9OtaxYi4TyeBluW?=
 =?us-ascii?Q?De/4dZUbZ3ttn2yir8kNbPByzfuI4pXZ0LgDCOwkxq62NT+u7i9hkurcPZPk?=
 =?us-ascii?Q?dFSMtxrUqO19s4Oja4e5gWMq4AvOcRfenvrz4LgwSh8zIQGxHDlrTg86sJjb?=
 =?us-ascii?Q?0NxLGgb/gS3hFozxHOyV2xmhdRzh3tQ5khSe/q9MdTp1DoumMH+bv2N1jmyN?=
 =?us-ascii?Q?XyRfmjdHTNZzOU2HxMEFdeWVQ1LLDKvrt2SiMuFTcZ9gbPoYx9a0C6XdyU67?=
 =?us-ascii?Q?gyo7BI1K6Mbkj/VwvNWmjYuxscHVoAs/y9RyVR/KuszYi3/wsfUB3Q2BUJXT?=
 =?us-ascii?Q?sFGCjfQeq3lHeies0I2eMBNw7VTPGkjAviaRrjxZoufZSGcaAhrV5QBn/68X?=
 =?us-ascii?Q?gsohwZD1AVzC/OneDtl72HVA46WTVcJRmjT5LEi0aeuGrxLloOW8uTSPrFXX?=
 =?us-ascii?Q?wnEF3iud8iblBco0+7soxSRLDyidFam9xi6WtWpK+d1V0RbnLBDegzWqB/co?=
 =?us-ascii?Q?iajsTKVWVEPNVqnSIMTpm6Z2n4YjwHtw2Orft4IUUqAVZ1A6lgX+WZED3VCe?=
 =?us-ascii?Q?NykPXqfxJlIGgnGQHKVK9UaLygb3I8bVwxPfJh0GyjXvcEsgeW9efpk3kMcr?=
 =?us-ascii?Q?RslI+YGdY9N+CKe3sj3MvUR3PTmaFagbgoNvBeBYyQSDM9geAw+Bwc726cXR?=
 =?us-ascii?Q?Q2D4KxdLtCy6IvJEpRf+mEg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d50003-01aa-4466-cc86-08dcc56fd267
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 01:38:44.2551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekiGF306Du0y03apOTlwV1ECY7k/p78w/NB/p7VuKJ8E+RC4c4EhqLztFXOdvDhnj8TZoSfQEGEyW9+EHnotg23JZ6dSL2sVPyf1kiu/Vgn5Htq5j4DTGITWJp9w0zuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6116
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1 -> v2

	- based on latest linux-next/master

 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3c..b6b2cade69aeb 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -504,6 +504,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.
@@ -516,7 +518,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device =
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
index 4618c892cdd65..e10e469aa7a6c 100644
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
index 4f8f3172379e3..8c29b719ea626 100644
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
2.43.0

