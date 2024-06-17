Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267790A117
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0DD10E0FD;
	Mon, 17 Jun 2024 00:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="jPv/e/1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2081.outbound.protection.outlook.com [40.107.113.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEEC10E0FD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:59:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNDJCf8cEm9JUltP5chsPsUjMPxdkrVvI45L0xbiNVtMZRqtYATT+eYXrv563pFwxePux00BMg4y2yagjcrUQLWbKYPRpVfztCLeZlW6Piju4fWYmFxyEWZn1JdBeNGYu0PWzkUcLVOX1UCVZ74vamU6QZLo8xRWHjxNHCKvGGM//8GvMmt2//sMsC5v07p7JIt9/pljrCvz1XOcWmzdtz2l9dUk04Sk38GNc9aEhJJL7K6GybT3QT0j730Hf2dQf+OfiCpyXkGxBYAh9b7b9lqQ+DGuFh5jGbNzA+/ptAW6b9WXmUZAIOvMqR/jTWy2u4sIHjJknyOXbmzx1SgOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyTYNVFuiPWsFlVH9oyG1GODHOUjUOsgwsvvhJOqvV0=;
 b=JBUSfZ3Kv5vuquzKI8kuhQU6L422r9g21zyiY0tqe7XOvTV4+la5B7XRsavD/vo8hzISZPognLGjkpr31LpA0jHLVh8w2r1aLzybK4ZCinH3Nm15UqK3QpxhlPvWlko09Pj6EgnyGjeXhKfUPpBDRso1qye+zxD4MsWherH/Q6h90rd8+Pf3aXZKs1TcCw+UVyhTuqAmsxlI6w8EPnDXXAN2Sh7aMhj9tpXzPH/5NDvTZthWnX5CXcvjoF6OescZHZWT8YxAjYlHge4FZpzgRg8qU0IH6BAWngNLU7ESfYNIxb+6YbqrdL4Ilru12iMJHpM739qtmYE0SDhwEhfKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyTYNVFuiPWsFlVH9oyG1GODHOUjUOsgwsvvhJOqvV0=;
 b=jPv/e/1rvZRAeSl9DF+s19NxneAw056odKS/dOLQ06gTsYL41/9XJUpJhzZvqMGpvJw9RBgYmuJdvClUC/C4jG3H4y8u4XgD6Jc/smiWQX7k41NCx7tQ5/E/YW4pTclZ39+MjWKMDtH0nV9rax/UL7aUQCy1GYjbMWl4nJxuN/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:59:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:59:27 +0000
Message-ID: <87le34s7td.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 7/9] staging: media: atmel: use
 for_each_endpoint_of_node()
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
 linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:59:26 +0000
X-ClientProxiedBy: TYAPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a901168-d2a5-47eb-3c32-08dc8e68bcbb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gew90t/xjpaU7IKssLFkW79YA5lz441f7oB3NVT31DVGKLOVYZumV3zXq6py?=
 =?us-ascii?Q?KwHFM2gFjILInLqcI4ji0smtr8UISx29jErego8Dsdkc+Qws9egES3yTTIPM?=
 =?us-ascii?Q?sN08lTFhItTiYFpNb2CKr8nmDq32WvFY+O7r9lEG99Uzm59Skl55KsRywU+H?=
 =?us-ascii?Q?UHcy+f9KEs1aVyAvtTm11hsiLNeqwqPfCi+L8qAVPuGA585Fyk/dGXfLsMWJ?=
 =?us-ascii?Q?nypWc5p5eu2agSEI9+FY9LEU6q4nsfeLqFwHNV6dQtGlxoTPZTHW2h18nZJu?=
 =?us-ascii?Q?5CiU+VsepvE4kQ3wXtvX6DwE8UwtBH+6gT4RiDdMIyCmGQOd5iMW9esTPM/w?=
 =?us-ascii?Q?mcPNFfOw7buW6pUoOIW/RnS6Wc5cVCIlGucafzg7u6bV3FJqbIJfPCG3vzYC?=
 =?us-ascii?Q?hblzVYte/p/0cQcw5RgVxWSkl3XKeG6zbGHHX4XpkTUMxOGIK4HP/MPHr+q4?=
 =?us-ascii?Q?42B4SUnzDa9OiWUJs3LqE8gXkQNmJHa5K5iAkiXtmPjLnE6cxAXHz7JT3HXD?=
 =?us-ascii?Q?819o5B06U+LkMEk4iH/GQTiZwz5x4o0AC4JoQs6nM/X4O/A5e+yJIDS7K6B1?=
 =?us-ascii?Q?jkJLKeZaNkn6nAedNHCSP2V4GKiW4/Im44hQx+/8OfGAEudTOLiM4aaeWarU?=
 =?us-ascii?Q?X5rggrYJ9LD26GmWxf09c0NiQPwbe6G3QEL5qHvdXa9yTO4iKeuxkT1sXYTk?=
 =?us-ascii?Q?8epIoV7SguoJyy4MZB1MOpZJpfEWr50yUt7A9VQjUjwDwRuU/Lr+MbTET2Ug?=
 =?us-ascii?Q?iqm0Pi9ddgetuoaRmjvaDGNunKIbNsoNYEDFnv5dhi+9YXDg3EKfpS7L63NC?=
 =?us-ascii?Q?BA0mt53KF3rwM2yhYVlbq2G9tgpkZZgJnXNnCyO1ijsIPQF+s2xw5ZKopY2Q?=
 =?us-ascii?Q?Hdy1/AtyMLiJyO9k3IOnsbr2DEA2n8UGzuXokZXYwsuP8jb3asHwZBQXfHFN?=
 =?us-ascii?Q?S6jyav3GWnEp3YX+H0qKTlyJdgjKkEIRAMdFETuI7bFd0Qvu/LzgLzyhQpBE?=
 =?us-ascii?Q?K0Lg3/qT6AuKAOTlFJJTDa68SKjcqXAGUyeq7VjERO0/JYzRBARO+UQGoOWG?=
 =?us-ascii?Q?GyI3rpFYsmhPPDqOIEIzjiOunvnOlAwe3FNCrWRWWtAijGay9JwMl9WR4RTw?=
 =?us-ascii?Q?XxRvOAaiQVRiq8skJ5zciCAFL1caQvvnkNWhnUSukwyNxWdNAJQXnM0qZ5iO?=
 =?us-ascii?Q?eczNBDaix80ZBLHqgnRh5aAu3EjVIqkuktLksahHRhZ0OF0MaqlFNixChsv/?=
 =?us-ascii?Q?fSdS9ZgLA1yHey5U/V16mwnS9TdfAKs/WK2Sq/1PcnVYHd97h5GrQRAsw5dl?=
 =?us-ascii?Q?LlMwhTVG4M/Lp0NGjr2TktpsEVc8yaQn/mSfEqLUfI+qMmYR3ZQJtu2rsTVa?=
 =?us-ascii?Q?0WtLoNC9ppwyeh7h3jp3EJTj6W4c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ZTwFgDw9ah75GxkagQYPi5DzJEHwk0g6f3Fx/PKf9+Tk2zGMbkBv76M7dmF?=
 =?us-ascii?Q?ctR8qjxr/iVEl62oU4ybHKFfzRZfW2h8zJcbDHNGAYn2p+gyKjBGQTwVjyrd?=
 =?us-ascii?Q?9N9nhjOGNiM4j6p66EMOncJPzrqMP7xinNC3HWE0krlNDKoF4a/dupw24SgF?=
 =?us-ascii?Q?8zAnbsl4p4VWZtikP/tFtf3aktHhWzCjCsxvMbqoGt2UZSbT78dXQYD9FRRn?=
 =?us-ascii?Q?ggmoxFE3Tj/D3slvxMFOatYd+/xnS9Eikx+u2TBiukvFhgf4XeLyszoPl2Bs?=
 =?us-ascii?Q?id+MxW17JNuKgNxa7tMfNnYdPPVrCtc7GpkZTdy/mcPNVDJPJ/oJMer2qSp4?=
 =?us-ascii?Q?qDVQUD/9h7gTLujYEaInwfHKstL7hHnavqgQkO4n9laUXJ2vZJ2NMB4H7vrn?=
 =?us-ascii?Q?h8IP4BSMPLuf33kOBtZrLU1Aqbk+yICz32J5eqcmtw0JkE04+T4P9c6UmorC?=
 =?us-ascii?Q?8xJq7ATWZ2nmpnEnGMYTAj4zqLb36nSbdDWo6REbIRBkfAq5Sqgj30tnq8K5?=
 =?us-ascii?Q?Cw2QyL4xytJum6WVburussYkrH8wuYAl7C81jRezIAcPwQE08MgGOSENcP34?=
 =?us-ascii?Q?RcZDMXXq8EuGg+LesICAOfLUT7yfxFPvboZ7021xrx1JERwzyAGCk6IRkON/?=
 =?us-ascii?Q?S2gr1hM5jtTa0KJd6xXBdzYK8RSQkBYig45Joz+rxhG3GQyBN2KJReZf0Ar9?=
 =?us-ascii?Q?K+k5KjGHVp+vqxU/1wgC6fGLEStYHWPl/fbo5kiZDcQNNpGoupmbYs6FQg/s?=
 =?us-ascii?Q?+n6/TJiiMv3e6mc7M+QNvVAwT8S96ag04dIodYnbGYA5vdZu9HUXCakzrBtf?=
 =?us-ascii?Q?apox4u0cQ3QcPgd4PHmqtPJAItxKfQpZqollqK9OtZwEDz5hJUh7eI6uTVXJ?=
 =?us-ascii?Q?RAQUqN7jAWJRuO6UKxXCB+vMPBffBEOXaSO9iF2i3WbglKqg5YG5dICFEERh?=
 =?us-ascii?Q?rqffjtzgfLdc3NWtSMk1wiaE125ul/95xesE2/UiYjoma2FZakwe0UQ2DfrA?=
 =?us-ascii?Q?S7kJwCPwaR6lAsMJOM5MTjP7XZyvnOzaJt1MgqftbRSdn4Y+r/sZ8F2d3ZMJ?=
 =?us-ascii?Q?j3KuIrJIZllGVpLiXta64wRgc2aNljujN90CPYT1FSK4lqkDmB+qlNryIiaL?=
 =?us-ascii?Q?6NpfCiyBqR7sVb/dodnB14pHfHn1GKVmJw9REuCykRJhqGw1U5CzZqBnpRoV?=
 =?us-ascii?Q?waXXqfoKFlnEn5aDpmU0TeXNi1vz6tzuwgME+9cIDjNt5jQ0rx5w9WymZwUf?=
 =?us-ascii?Q?RL2FELuhi5KuGqhQuE+xP4DrVXwdqjclyGUUX8JS3+1l0oKfe/qRNC8Xkrzb?=
 =?us-ascii?Q?Yqpc92R2E9cljfugLEjYBUG3X5vxJFooUukBLNNwiA/D/o9qCUTWJ6nNmgt0?=
 =?us-ascii?Q?UZSPdA5fSB4TlTqj3aNsnUQ3Ix+zNUgcRRNA3B9GnpQ0cWKURsku31cAuhOR?=
 =?us-ascii?Q?VkpKW3rFcGa+34VVvG7txWc9fnz2LkGDbkLFrJBr08/zTVIJrRQEAFsEAKYM?=
 =?us-ascii?Q?b9RpGIyAGuFJ/mwtcdtM8HyCmYFNayMri1dZI1pVliI5ILHP5J5smuteQNZM?=
 =?us-ascii?Q?yfi7y4gRVd76fo0nF7aylpsGBIJ7CrWqW6wzWppqUBj/uHfDPQXHBv9a+DtL?=
 =?us-ascii?Q?fE0NSNxut1mG3wivsrkz7Bs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a901168-d2a5-47eb-3c32-08dc8e68bcbb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:59:27.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1PfOw9wcsaaFEiLi83pESmnilzkxCG/VbOgbN1cYrXhSUm7M0hut/JNjdHUnrMb7g/b6vYd2NdLx4ElPeyReGHO2eQNIcyob1P7JLZiLH2aBwJakUahu+G7FkkSSmLV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560
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

