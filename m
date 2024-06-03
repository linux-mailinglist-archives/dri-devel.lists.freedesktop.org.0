Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06A8D79A1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1964210E177;
	Mon,  3 Jun 2024 01:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="RXMU90wH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011008.outbound.protection.outlook.com [52.101.228.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B4810E177
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTspZxeOuGPsUsSuL9F/Hms/niyX+LpVz57mtKuvWSl84fzMRNRZsoLEa9xPBAXBZ8cfx9oUXpBfBp0NCoS5KITxF1qQSPVRCnJIJnqQ7a0Mo/lga4xGMhNiuonvfdwIyo1o2Gqp/c1HsSxvbLiwqf4T2CwMzUmeJ81nvhlmHN9L6Swd9XsKy1asmzXnHOSd0mRlm+Jm4eE76IC2maR+Rcv8doGK4bwbqPFrT7sKAikeYlKyK0LZGm+/PFc4ATknRzyQLYV0NQGiNs/gd5zJo+u7uDvtnQBLW9i4v8EYAhgxnuG6YoLu45G8l65T8hvsy/TSTLpFrB8gjsUHOXC4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyTYNVFuiPWsFlVH9oyG1GODHOUjUOsgwsvvhJOqvV0=;
 b=F8EI1Kb4imfyi1uiBazQzxiEjwp7VAok+eb1j23nIETVjr797ZaY2WIseoBi0uhc5wNUO4UBbKH6j1jgxwXNZ8qYeqnTPa1BKZLIL/nx3rqUE7a0mQkrw5qbpupehUeoIoi85pY4uJsDKXv0TQHBtVOunqSJGXuwQUo27pfHlNzN15uuY8Di35+IBLjDzGFKnFzhM+6rQ6SNAoZ2KC657I1ehitNP3iZKm7r/XrfvO6op+1GVm2h5GhtIn8jwTJWzXUWZsEQEzKDScvM9Z1MQJa1mZfHWZSR7AP8vpYWJfyt6tOrFOL81ywtfaayieCwwHHDLY99faeQnRYLmv0ziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyTYNVFuiPWsFlVH9oyG1GODHOUjUOsgwsvvhJOqvV0=;
 b=RXMU90wHOjJvsdLzMdBhq58Z+wk3b1Z68XvJ/o7K/jdo0+vrlCvh7ZL4cNOgrdj+1ZZ1InAjxGQ+XbwQORM1kfbjukh3cghU1GVfgWMtLdVwJgWmL+GT3iy8N+AqBaBxeU80eCwbt5Mvxg1poC9YpRNzPUW+vVxdWIZEA0HTibg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11318.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 01:18:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:38 +0000
Message-ID: <87le3m4ydt.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
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
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 7/9] staging: media: atmel: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:38 +0000
X-ClientProxiedBy: TYCPR01CA0015.jpnprd01.prod.outlook.com (2603:1096:405::27)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: b029d902-a901-4b89-8911-08dc836b1938
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QMqdnuVxXD4iLc7USteKpSCGXtf/53XDgLt8urBIZ2ED93faWIDeXhQwVXxS?=
 =?us-ascii?Q?M9sgoT0TrtPiChPlbKaom6v2Cj7J4d4cmZjO5a9/dNvcFDk4sOS4tCvkVolH?=
 =?us-ascii?Q?nrkaRwaLpb35GoZMTdUYRMmWM5X5eXcNnr89Tq3vdqOabnh4SiKrd7WamGmY?=
 =?us-ascii?Q?RvtBRmObc1ptom2AxtPwJnqXtQghbySI2YB0RITLn93TLVveNJH0AWRH9Wmf?=
 =?us-ascii?Q?Oj4G2C7outIe8vVhgr1BpKrG+7D+2ewiG2qyTKg0QDFnWlj6+ExU57VvZiuf?=
 =?us-ascii?Q?aoS4pYClV6RQOjki9rmw52uXD2voii8qvYohbdW4raZ/tcmhYowohlhUO96o?=
 =?us-ascii?Q?NLRw6nNjnVTCCz7Prn2VK1MdEvLuE4pVZlgd/Nee5Q1bGDReNVl4hD245j0H?=
 =?us-ascii?Q?eYUumkDISkef0CAHWD7Z52g/8HaY96GotdG+yKwFdeCbCRciwh70XRd0w0HC?=
 =?us-ascii?Q?ZtrRuQz3ZEjJoAAfhfzyZQiFizAEXEqdFhCrGFuzJzYcY9NK3dUcmmZldda1?=
 =?us-ascii?Q?yTo+O0nzSsm/rSrZN8Lk7tsrcEXr06hHWGvpm258P16GNOE8JExd4ePCYgTu?=
 =?us-ascii?Q?pl54oY0M+LW5B01V4B8txXhydesT2q0lujw8MCq3jF1CELandqWqhD7Wi+6i?=
 =?us-ascii?Q?EqxgB9yAGfRMgzmITv3Ggu52zUa+DNpqgtd0+oMNiSbo90xo9tDHEne6h0ar?=
 =?us-ascii?Q?i0RsszBJ2f2aiEwAB/f8P3WrTWCpbZP79tQqAjFh6To7ztFJLqr58Sv/iIRV?=
 =?us-ascii?Q?cW0fD9QqFpqgH06UA2DHYG+IClYggsakh76ArygfJbgEb03OYtTeX7vnTqTO?=
 =?us-ascii?Q?aYcNJwTeMyJHIKBle3UUewQg/QfPvdt+KT4hQAdME3Cxf+g1cOWxm4QuxNFB?=
 =?us-ascii?Q?/BYUxn8H+Y10O87T1pLog5ayvWW4BdrBC9q2E7WOtwfFCDRdpAAlkObYzabz?=
 =?us-ascii?Q?H4XOS3/OvX7Uc4elAoAEG6z21s3spkjpWEJtFqtb+ldOWdZxsI8Amq9yPSOF?=
 =?us-ascii?Q?Tx211WZ/H8aL3ROl0Lc9MNv6vFvhlxsBiHErdebFzar3tbK8vgHgRb6qXGIN?=
 =?us-ascii?Q?htjPKd0hIksR122y/qdlnnrV+yNixqg+la0gq6Zrua9h1wNdMVbGalyhH3FO?=
 =?us-ascii?Q?Qk+BPNy5utmW838a5oD3VpKfXN26YuUpJfT6msRaZA4rHbH6Esdm26kP6VWD?=
 =?us-ascii?Q?WnE7wjeadqHTIZ2RlW0DSwrnkN18jvi5i77HGoYuddUBwL7aNUyGwnU2vK/4?=
 =?us-ascii?Q?LpWEdkYVAe/QpQrCYq4HlmJ1TX1Yf+QF4EmSv4BYa4pSNQMY2BBpoSCaR76Z?=
 =?us-ascii?Q?0hulWcQS6aj1JSa8uzTl4anCVuKuWrggeuqtAMAz9uGxX2kjsVwz1QXkYz8A?=
 =?us-ascii?Q?PwzDBks=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tKR6/Di2NXSr6ajpIVNyM34t36jmBDWFLZj6fE6JE1PntfLUBXBaWctCAJTd?=
 =?us-ascii?Q?5/gkTIiEz2mfM7nBP/rfOXGvm6kbop68r184yOdJCnMwvj7fqLRg5xPRQKx4?=
 =?us-ascii?Q?5U1QKqheeRLObGCh/HCAkpIkACfCD+/Ya7YUy9XensjmlS+oVnSCOIxcohOa?=
 =?us-ascii?Q?iJ8l+Ikdpe+K+Ef90oFCXW+ERxYpaId/m+CqN/srcIkpHo7+NO29q/pY5HXF?=
 =?us-ascii?Q?YG/jNkkLE02mS+rKglBJXNkPeCRynFxlD97S0pHoSeDEOtFYJhgXD1/JzXl7?=
 =?us-ascii?Q?EpoMQLxbiCiMQ70u9HYVF/4cHZYbrgcH0xPyvGuqyY8ZaxG+/9nkX8LuqZ3/?=
 =?us-ascii?Q?g3XhdZXKMs03rgcCqnib8sYncpv2LkUmyZuhtntmD1XzQDX6XnjGIqf+mA47?=
 =?us-ascii?Q?NyBmfziH72uUx7NJNpy2vV0iacIfH7ZAy0MLgjeQQsFORk7XKGhslmKgK/q9?=
 =?us-ascii?Q?bkZswdCaOVBEz5nWb+A03DaBsyGA4+TtlipaZ4QaqnpD2MBGMMYgyXrStV7P?=
 =?us-ascii?Q?XYVBDsahGJoB7CveECLdAU2a0zRczVxUlQNrgBcAigmDwxWWrmLS0L8g6/IK?=
 =?us-ascii?Q?5RgAW94s5mQj/ja22UGng0K4v+9nkMMUGcpJoLJTbsL8A4TAF7h5j7r9aXDY?=
 =?us-ascii?Q?547tyLc1EVVrR0DoNrU6l4niV286/JXLazowsCMmHC69vfZw7U2iEsuVeuC+?=
 =?us-ascii?Q?tlt/bCcKM/AlYTLJ9zJB+iQm410qtqZ9iVFxdR3jV1s5UqyWvvZInt9E5ftE?=
 =?us-ascii?Q?LY0Bx8hMph27/iN8eXodN+l/p/ukjm4xsnHFCJE289IH/CFvUif+li8EW2up?=
 =?us-ascii?Q?3lBI72rQeZgqjs7ArkPhcvmPpC8v+dycv7KfBLlqAjJmgCMsK58W5Ysrhm6n?=
 =?us-ascii?Q?2+gW+7hK6Cizzw8i+/uOtUFEDaE17xPdEUmCtEhmNoB7chWoN89dIzcRjGwP?=
 =?us-ascii?Q?JLpoYG/6RynN3N+La7hd9fAblBHs/xmF7qgJka+Qh6fLAA1qIkpfOFyy30e7?=
 =?us-ascii?Q?f0PueVhkdjG1XeDiXGfqgGaYBS6M/Kej6dR25g9w8tGlXkdXnwjsLozYhwTA?=
 =?us-ascii?Q?a5EZj9y7t1TTuL5WcS9WIX9z4iQrVvq6WxkQSchevXbrcrKrBKloOp+HGSiR?=
 =?us-ascii?Q?fpz5bOpnuAp7KVQlwttg5n+10Xxt7OhyMKVSojvCNoAjSpYV/C1uj6YJ/cnl?=
 =?us-ascii?Q?qiXAEsS/3/JkWrR3u5Gx/cPX+1DPmUAQlZtV4E7JowuwkGsze1UAq8xY4Yz6?=
 =?us-ascii?Q?JdtQHyz+OsNhigygYuDNbcIK8t36EOxpk9g3BD+GuXRWnb2acTdRq4vJYntj?=
 =?us-ascii?Q?XYA5uHTpCw1YR84iXtHJQC/J/7f5iwcDwbXbxkClz852de0THLtNRpnV369J?=
 =?us-ascii?Q?OkO2FMkSsrg/F58R+9mOvE4BBZu4rQFezPw4amljTYolek6Nb+t2xxHp+LZH?=
 =?us-ascii?Q?zaW+hTVcBenm4Ameh3C8SeTfuEeIRnhFR/e09dYN5k98MnNhiAJS4BtivZ/U?=
 =?us-ascii?Q?ZqHbAUEfFzpie9EYVfBkuoBxkY7WzIMs9u3XHhgSPTCUZ7+XexrNZBwMSc8t?=
 =?us-ascii?Q?nrK7ze6LPtpAlLVGmtiIObydVQ3PT+8AnakGqExLldZuWAFow5Ynpb/oTx4Y?=
 =?us-ascii?Q?yejoRoTN1n6dqtvJ7yklET8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b029d902-a901-4b89-8911-08dc836b1938
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:38.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 752jIk1TKBJKz0trrD/cayY4J6mYzG0Sy1vd4RaN40zT3HUIV33sSoMK3T5c2cbpJXO8m2ip4uvBpB/Ba4plQWdBQhmDHX1lUf9d/D1/m+Fd3wxkI5K1uSHMGj/ybPBx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11318
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 10 +++-------
 .../staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 10 +++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 31b2b48085c59..712f916f0935f 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -333,20 +333,16 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
+	int ret = -EINVAL;
 
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
index 020034f631f57..9485167d5b7d7 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -316,23 +316,19 @@ static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
+	int ret = -EINVAL;
 	bool mipi_mode;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
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

