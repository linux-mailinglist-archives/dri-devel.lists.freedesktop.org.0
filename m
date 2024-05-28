Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1858D2908
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0DF1126F7;
	Tue, 28 May 2024 23:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="RVbfdBDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2051.outbound.protection.outlook.com [40.107.114.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF671126F7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:55:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckSDY0MHus1qchEwewoec2iYOHJTUjjTa0Z4tqU2ZOKxVvzVXMaE0B+ydraOLCRZi/6kART5TFoNNi0QKMHojv5WtEkJLJuFe4bzCDkr1yfhuwrIWLJq/Opffzn3Zx+oGoHWLWsgAFw1eShW684guCaVjhAPmHNwvq1ejz4PljzCZYhXv8WEdkE1+v+82s5Km/K2XEId+OgB2ijBHRctgr/igHvhp+w+In78Vm6FQYS1eSf8wD9ZKdgUNisG+rygdwvdeKoLZOpx2QYiYrZiB1DkqOtmNesn88Tn1vs60w0QAATIlFt6OfawRTg+irO0SjXKPn79k8AoYEbJgBjmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yvgb2K2aJh6oMMOHfMP0OgSzXQh6pmIyQrdwEaHeLSE=;
 b=bEu3YAIHYFWKzpWsKuXf+rT02+med5PLxEC2rUc4N9Tl+sQEkihDxCgzE693SOYhlEJhi51ESwGlwBK1Tk0Rq/FQFS7FTQd7Nmk2IyJwixDPPqlIk3cE40Z/UN/f4UlgI7gIcasK4Sa7dU8wpoKfb3uVGTfnvCB+c8M0qN1ZtowrG5RtYm0c9c65JW9HHfyZUZTuMQmnJnKqA9cL28GrzBvKO6qK40htp2aVph+alFFstb+ezgqKpXw1ZMcdaSV6p32KcXqBpn44e8VtB763txhbe9TjUZ346NbKgC0rOP2VXzcWIkaNPmgo1EeRxRHsmruL3NJHLCsDxI0FYDSQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yvgb2K2aJh6oMMOHfMP0OgSzXQh6pmIyQrdwEaHeLSE=;
 b=RVbfdBDTN5WtOTNoDzDR4GF7w5dDNmGeJqfRNKnIFRQPbRa0jKnJDkATxc3XWIOsCO/Vzi0fnZQaU0nZYrJU6qG5cz+nnvj+WG9dv4ZZj1ExKEDV6klOS5aqw93OQiJ4KUcAl6eEqRy+EhQ3Zay4oVgYNNy7fAJrejajiN+uEaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:51 +0000
Message-ID: <87a5k94hkp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 6/8] staging: media: atmel: use
 for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:51 +0000
X-ClientProxiedBy: TYBP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: 778a39fa-0cf7-46fd-e1a3-08dc7f71b45c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ty1GV/TjqVOC1W9e760LB2DnFMbvVLf0fMvoANr/yCKMzx1x4Mw2fohUj6MV?=
 =?us-ascii?Q?ki04rJ2HyMqRYGjBC2LQR8kEtBo/j8Kgua4AEtIS5C7SLe26a5Y6viusOBzF?=
 =?us-ascii?Q?XBaCLEENquSbJz0S9IcLIyeVNCFxowjwYEajrG2PRYpBvqhFlGsp4oB1X7kU?=
 =?us-ascii?Q?U5l04R2TUcIJRjwt3rnQdyl40VVGqzDyQi05npO0zafYXHdKXrP55KenAAEl?=
 =?us-ascii?Q?qAAUIp9I2zL2bkqgK4YeBiS54J0OAs1eek5hO+8vPpdU263jPjOILaHYnqVb?=
 =?us-ascii?Q?k0mBIt5u6qq4CSdx3HM97aNaVUFd7u0rx74QRpm2iW+HsZ7vjUtFvrHzPXOQ?=
 =?us-ascii?Q?OpT4+yHBgFbWhYmZe3m0a5mH0a1FkB+5lV1IHOFBmkRVkpDpvOaHYdDlYO8o?=
 =?us-ascii?Q?QQxTXdSyg0ahPjTj5skRnaXxHCkErBhuhdFzfU5BIxH+5OPS/COHRnHZ9/wg?=
 =?us-ascii?Q?lcJMaJN2wgnLO5z5+yI8p8wfcmLh4EJ7KAmXtzx01qNF6JC8H+2vw9IKG9VN?=
 =?us-ascii?Q?A3qndxkNNCotv/gecY/sxJK3I116Llo7ZFMIRj4TXILds1O1dPqpzGlgXeaR?=
 =?us-ascii?Q?8h1cLg8V3IgIw/NoaO17JA1BSGE0oa8Xdg6qPglVeEQLU99CCdsElR7at/3C?=
 =?us-ascii?Q?0NqbsXDdYqx28B37puZ+2HGaz0tiHdAYUR+g+QMjyTXgwQhljMr7ZiC8flrL?=
 =?us-ascii?Q?1YYmDLS8CLKii6CsFO8Hl8Zc0uci+HH9paLZ9wAXj5wXSLCW9D3AQJ7Kk9Ew?=
 =?us-ascii?Q?AqXthooG0HwRzCZ89lYPSGxbGyDE0XQnFdc5SLYQjdK7idV2+3+/AJhKE7WL?=
 =?us-ascii?Q?4OxJSRBnH3qYYXRELWPnA8JMcNDmB9+8lR/CTUkTPAvrAAcU/rZCmZvcjinX?=
 =?us-ascii?Q?nencvrzHraTSIj1EhHVpUb7WPhYz3rh1WEVqLT2QidF/AldVqhFuUMej4bm3?=
 =?us-ascii?Q?LyVx8wSCK/uEkKSuYa+dlemBLRpYJqLYwTjKGlNIM3dMPfR6VuG209KMqY23?=
 =?us-ascii?Q?/TN4VRBz0Wg2NuknOuLhhkzQgEzUWgwdNn9FLbMzNzt9axC7+Ui2XSeyPHEf?=
 =?us-ascii?Q?0D8jz42cW4cq5f5LYwvMEpq49pEHx8XIozfXOG5v79uQeYj6x6UEKcTpL9j1?=
 =?us-ascii?Q?vCKeNGTJ8ESdWEmYB0WuDO5vFanmsIHxBNdqD/T7YM38PLWW+hw6EjIkISch?=
 =?us-ascii?Q?RLuZv9DY//2Rlq3JiAivbn5dZx4RYRrx+YRd6jRnqbYl7vS/rarXWncW9xTF?=
 =?us-ascii?Q?54ddz/M6QKd0UcccvtJLbfIGVXnp5TwhStjH4uWEg+0PBmV5HoX0BwbMp8YQ?=
 =?us-ascii?Q?uXKtr5o03AtImCp+fq9bruogSppQwp4tEWi0cLOKDe4YrUHqR8hFNANfVtnz?=
 =?us-ascii?Q?PlDkAd4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zfpq65ldnKdXL7EwIV/Qh5AExoBY+jqB5YfZGuCBL+Oj7LYErYsSOSDFXM+n?=
 =?us-ascii?Q?0hwl1MiFLdJIDFtQreKbsY+WuQgOAslp5aIe3d74mDJGxY8PRK5uA1ckXRmv?=
 =?us-ascii?Q?LcUVjgxiIhs+BQLXCZWYgQ3IXCti29VL8MsOgGcBceH/Wq24WlDxohpWVNkS?=
 =?us-ascii?Q?Onr+rUgZ3QWgAJIULiJlOizivM+oDhgh6bbrTEsR81+5nR67CSHWmcb/1yC9?=
 =?us-ascii?Q?BuEAKsILe6Di+fQm36+9DQDaw06lus3crgqB1l6guOi0D6XwEX5zCL7/vhlV?=
 =?us-ascii?Q?Ft/9jNlATvbCns3sbxsY05AgJIcQJUxsMG/lLIfA1U7AsyPIBriSuprhUIs6?=
 =?us-ascii?Q?G6YYm1FqIAUsjcRWEkvmGUkY2PqN6ALrEZ7wTmEcOCmNCy7QOH4qp6j34tbT?=
 =?us-ascii?Q?apWrapVJa+ZFKutmd7q3GSqKQOzTBFY/RaF+SPiVKgrLGXFpUwEGoJsqqkPN?=
 =?us-ascii?Q?zQ5gZPMVZK3MDcaBWMO0+3kKdRh9uerF1cpUQI9iU8oSdlGqFRYq4eWg1m/s?=
 =?us-ascii?Q?2qTqen+bMMGKF3/Kx3u+A1LlcDy65Q7G94TSPlVoYpWlwaSUeC9CbwQ6wGxJ?=
 =?us-ascii?Q?NIVo79jgHHrzCIC6Zc9z5rmFrXMytEMLbCC3od0vnDKgl8weNBKXHJgwlHRA?=
 =?us-ascii?Q?Nb5k+PFY79E5tls83jcnqa9yDnCtexQBenDNGi+yNRuSkNWNGy4iwZ7PY5zy?=
 =?us-ascii?Q?tFITm5Jlxz/oXsbd4oTDBU+mPwT4OgdTQ5BIuwkLebwxjOztdbaLYvadV7W/?=
 =?us-ascii?Q?eFLbPmmCpHPNrEdRLiFLIPzX3VYlAwOwNf34Y2bxrRCczgVvPMu2JdJpRYAM?=
 =?us-ascii?Q?Ng85h+M3cUB3ld82rcR58cPTQ1jhsxoORIhnahGruytkHtOu5a2+D3axmv5H?=
 =?us-ascii?Q?JfENyOrxYMVONCpCa1pTznI9fkCjw1rKg25iL3BVTO10fz6LE/wV0RY/jcgs?=
 =?us-ascii?Q?+9pWKs93zGpgqAW+tOgfb9DCzH+WJnPOkiKTjmtBIj95QG7bPskMutMNXpbC?=
 =?us-ascii?Q?t4nAg4zCjAtrHcj6aVPQukhxYQ4+NBkqVSnxmDO/paKMWSE6PC7oMRYHdze1?=
 =?us-ascii?Q?Vmzpl1S+TYs3+NB+tBc7tdFiSYUInHAKWLXaeA+yHK3hxgStHns0d5NrNM6B?=
 =?us-ascii?Q?nLBfua7YDQnOvuVNVXFWJn0zQU4E54OC/c2MCuBMNBGV/Gp0qqQQSM475dma?=
 =?us-ascii?Q?QGQcY1kNcvGV+vxKuXqLPrvGUGX0FTgVseqfrA5Ak+IPkKFaC9HxY+lwIdNi?=
 =?us-ascii?Q?phhwsTfPx1uXIl33wYePnqSbSbUoGyytCo1eTail7toFqZ4RfB0K+DvPSvjz?=
 =?us-ascii?Q?OSomUP0s2JvjLsKyekE3CFofG1CwLQ7V25Fpy6BLBV8CXnI5hPXPMkkYN6w7?=
 =?us-ascii?Q?ka6M+BSa3LvOtjYs+E3wyzgMnd30GX3qo9xc2xMuSjZnSogJ4s0/pl++RoXd?=
 =?us-ascii?Q?ZGwDNaBu30gS/j8MpXEyrOu2lqF41k4CLDejH8s2gBYj8kIxb1UpOwYS47oZ?=
 =?us-ascii?Q?dFkLud93q8Jpt4V+Icb7VSxqIlsCyyQ+IzgqQDJIzNZLJ++EtUfKJx2RcHVp?=
 =?us-ascii?Q?FPG7VzrtBg30XPqZHSO/xBiZKYOH88ndaBL5U0DCs/Pvqk2U9q79l9L0AuS/?=
 =?us-ascii?Q?APUYGEGf0yJU4OlS5f2FjZQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778a39fa-0cf7-46fd-e1a3-08dc7f71b45c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:51.4810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nP5FWabUKayqWbUn86gpMBDepViQDA2xun88ElvDuqCD95gjPRD3izvJz/rLvgZErKZO8zKhmkEgcQRxDUMvFEGsqQMBw4VvBABPX6YZyyhVkXRum97+s3qhBeS46iWK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 6 +-----
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 31b2b48085c59..cbfbec0c6cb57 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -340,13 +340,9 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
-
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 020034f631f57..7c477b1d3c484 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -326,13 +326,9 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
-
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-- 
2.43.0

