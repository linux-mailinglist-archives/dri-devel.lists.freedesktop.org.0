Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693A91D625
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F412010E2D7;
	Mon,  1 Jul 2024 02:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="mmO0EgDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E56C10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTC/3HPdk8zIT2LRv24y/0cIsr6Ph6rdKYsKosdHDN+FqBhk6sV1TEiGZY9KbsTDEzepjYaiyPlCuOLUV6sQ1gbrrweYKp/rZJnp8LPgh6OzbMCvpNrjz5IuavBFvjoGF5/lzGT+8kFU+qbC2RN1cxm5XiHpn2pE8zMz/z4hAjmnXuCNJ+mymN3gpV7GB+fuHb/1JceCi91CeEbypi05c8/4m0mRfFYByMvH3vIjCI9UkM8dgJsQ/UtX7BkcxEYfhOrMlNBfTbJM9c0L63FjIZA7YZQZqCkHctxiDv3QqRFcJ6sYMv/WVLfuxiJtlJLp9H5zr0D1Y8jGOA6VJwAR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYlWh8XuVZYCFYjBwCC4koBvO8Vel+UdsPWmd3H5cvw=;
 b=h4eXc5Zm5HL26tyq2rUzy4nDZkGDCqhYJr3OAdKBdFn7/+um0+aHWCl4cyWe7uNm8uzFv0HaX0TqY4Bfm0A7f6Ke9JnP97/civctw2o4UzaKLK739XxS0DU+8N/Obp49ov+RfnDJ0jN0j/s+8/P2a3JB8kNDPhm26AI/IWpG/uKgbNPAyuFWq3S/oGPVm5+4RIxCccZHoK55V7z3bcAX4qQtpbsWeOt5YjEd4YMAWVqLotGAb2i6ZtHqieHbMR/rom3sNIMPQ0lhSBL4Sh78Gv++HqJsYdpRKdZkUsUj/xrZqqPKuF7nkjtHUeIfWsSx4qkLL3EUGgYbCy2hJ6XOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYlWh8XuVZYCFYjBwCC4koBvO8Vel+UdsPWmd3H5cvw=;
 b=mmO0EgDRv5NkjtO1CgpL6xhJ9QU2Cwl2dHOZAI/1AkRthy2yV2PPoHOCat8nL2hbYYjpvocj30Cfye1psoDFU/+FDwSUfm/Es6ELWBhQx8x9bfyZ1m7pdbmdkzv+sO1DQfWgjAHK691YL2e8gJENxEJn8H1feW5qMEabxoPxNAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9627.jpnprd01.prod.outlook.com
 (2603:1096:400:193::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 02:33:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:33:02 +0000
Message-ID: <8734ot96zm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 7/7] staging: media: atmel: use for_each_endpoint_of_node()
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
In-Reply-To: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 02:33:01 +0000
X-ClientProxiedBy: TYCP286CA0273.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3c7cc2-c06e-4188-fbf9-08dc9976211f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pNLFiJvCXBXpjqm17PW8aY2twQKL3xwh0GhcYANJn12IrHYPrgn8yq0wEXkd?=
 =?us-ascii?Q?uyTz1lK0W5+PO3pCfz5ZGsxx3e11HWKEWIrWDLVlYEAG+8sG7gFEPMIqfLkG?=
 =?us-ascii?Q?88GZvxid0ORBgbuHrawzc/Ug06b4MYrAONEiYnYDujgm2ZUjhHy6/zG1Dr+9?=
 =?us-ascii?Q?r6Dfx+VnueF1McA3R1P7RLyd9bYVO0kuye2RE/7GV1y4er5U1vOwzsXRZjJj?=
 =?us-ascii?Q?1Flfa54eO/8JjhbQeLUuk5EfQFiDQKZA12pPn23EJs3m9CgS5f1sJ84kTgsh?=
 =?us-ascii?Q?/skfw5N+EW0xFAyfJo2jFxEFynFVM852RgKuDfZ7dOFUCLbDEfPB/GwYRdVQ?=
 =?us-ascii?Q?v5nutNWIoleihTKTw16zxJdoj99ZnvPAzlNNTBJqZwBWFB/ZTdme0gT32aHo?=
 =?us-ascii?Q?LkdHz90w1+uC6C8Py11ZCHyJ0Ep/X/0RwihrxtptZ7lWXV9tr5L2Oa21MQiK?=
 =?us-ascii?Q?430mIEch9wbDF7dHGdWDOqYGUK3bZQvdrN39duQcRxxouKlKMGnSPFApwp4J?=
 =?us-ascii?Q?8QJSN4+Dy1O20c0vqEt1tIG3sc18TfSV4unZAqJDK0UKg7ZjDYFCUgcWwLYS?=
 =?us-ascii?Q?5R+w9wCqsTmjw6EFOBYKxgQw600zc3GCZE5VDqhlM1YB5ttsSh0vceQgYrV0?=
 =?us-ascii?Q?xoRExvDwYmENFyTEq9yerLr6tQklDyb6HCQGo6nZePbl+wRUfP/hJZtdeOok?=
 =?us-ascii?Q?feAk6LOQp+cB+mjb1Ys9alWcPtfNqY1pOUWa0QjV4R+hKteuaZ1S5DBQtAZP?=
 =?us-ascii?Q?lemhp0PSS1grnUSeMfm78PsJc9JE25GD967S39TdJHNj0zOwn1QbxKG6naD6?=
 =?us-ascii?Q?G0on1U9wU5GthIn3cVhz2PH7JtWAHhfBxrN9p2S7P4fXLgb/wNW60uFhmkP1?=
 =?us-ascii?Q?1Vzdh8SCw5l78fWfSv1sKgNBgjuEipKx2ttatpAe3UOfJ8pkbMYZ1ak9pAEZ?=
 =?us-ascii?Q?4gYr9/tkV63yUr7/OZw6b68KB36XybbUK81g9QDorJ45ceOhJvhAVUqmol2J?=
 =?us-ascii?Q?J2qhGm9zGNGApZ3680QWn0Tz6nJOLu/uVQ8TtK4ASA8pyQ9P0nIIsgsI9Px6?=
 =?us-ascii?Q?2CpfWxeJJz7JiSO9rtfe2MzOdx34xds5lhgv8Y4OSDRo0IWyeFkGQcc4nytP?=
 =?us-ascii?Q?0anA2KND9JwQPAGeR/yQYXEgoD4TYy6U368qgOf0h9Ly0mkSieMb9cMPRWY9?=
 =?us-ascii?Q?5jo72dwtU+5UBwqPTyh9DkptIffleJcvzBLuuWANBIrjNUB8VuVusU1TSu8q?=
 =?us-ascii?Q?al0WdCSzfKUkympOQafsyR+1KG2I8VmIjQrFsiYG5412yz5opgcy4Jv5+fMO?=
 =?us-ascii?Q?wwFnaHTYG6tLv4aAqKNnZYSYYK5YA6cQEN0f9or/AbR7Fy4P6jKjpptDsucF?=
 =?us-ascii?Q?3/s4Tz6sIZU84Iiy1qrhQLnGP2Nqo/wHkRSN+Wlq1CERSUSaSBBVAeb/UoEQ?=
 =?us-ascii?Q?11ib0Yws2To=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Vshg3wpGVocDqn1lc8e55k/yIxnkA4rYKKwP4uHl7luu2D0QwbQ9keAsA3r?=
 =?us-ascii?Q?DpPw61fNf7t/1EWfcKnXGpHPHKIlHo3UFL9Zfs7RxB8wXU4B8pidYOfa6HHj?=
 =?us-ascii?Q?Hx/IsdP+QPQ2er/bnO0DJ4CoEnGBcyFqkjnqj2AhNGIift0ZFOU9yHCIZjHK?=
 =?us-ascii?Q?dL+er9jVdsQOcQ1XvR5H7QD8ZgSrMVE6AhdpjEluPIXPn/z2gqFvcyKvv5Fq?=
 =?us-ascii?Q?9DDJxeLwmLdbfWCg2MzJQWSKGEShwYamvDBXYMajt5Hp3S/ZWxm6MvQ326Ec?=
 =?us-ascii?Q?/q5nBDBhfWQBEgospbCtC7g0qYhsiS3k9Mjz7TYl5asGfFYNXRuFTGPXVB4B?=
 =?us-ascii?Q?LMHYlfFhtQi1mNa2MIPPL8BQxM79qxXiXxsG7fOScLl6wHg3OEVFHjcseq5D?=
 =?us-ascii?Q?NEwZhaIaqTDygaPqLu/mhMAJtHmqw3JZb3j+Hy/R3x7ADnbPxymUy8CKSXh4?=
 =?us-ascii?Q?Asp0fKpHu4iruso15nmg7PWPBMkLAWo7800BaBjdhF4Tdg+/3DmNBAqCmoso?=
 =?us-ascii?Q?3WCPzH5TUbmWoX2Py2lYite7+WTTW7c2n3nC00rnHzQac7wyZl8ij+ocYuTJ?=
 =?us-ascii?Q?fqCNQ5uy31xIbgIfATZRvGQ882EqZ2LF0WCXbjArZ9kC5KLI3aNHaM3FbXqQ?=
 =?us-ascii?Q?g6zoLKYHy9ABonId6yVvu31349lJt5OMX5n/QYkQWIQd/VDea+6j2pu/swrB?=
 =?us-ascii?Q?9qMP7//y0nAxTzWk3PxVHdZ8TI4sZAyd+mVmkSQd0lgQVodJUPKgKY0xDzSC?=
 =?us-ascii?Q?L27AyVBO3WcL5CWmFCZPKiceTUWYKLaxds72VixjrDo6R0rlYsnxPp8DlYj/?=
 =?us-ascii?Q?2mkqPgVi4A690j+P59nqwudOsLr0r/43Q61gwtuCM+MIXvS7kaOempNETre/?=
 =?us-ascii?Q?xNtfcM1nsJ7jQyLO2k1mRfMbFBeil1nVipp++vV0GLItogqH3Cqq/tz0VqK/?=
 =?us-ascii?Q?stvWKw8Fz0PDFZZ5GwxvfctUDHYy2iWO7/xaw++ThZYwrd5FjsjY1B9ZnVxa?=
 =?us-ascii?Q?DQNRS/FMwzNC5NmnJysH1xJ3FQygOXCOvTm1Ar8OAkiM6jk8awPcHD5HMTY+?=
 =?us-ascii?Q?w7MfN10chLsotkvYil8ZD6Vku6SfSqK56UTQ/ulOfxhW7Gs9zQdwlAEb++Vq?=
 =?us-ascii?Q?lUXm2uX9mPiPS/52K2eIEXJwm2ad3Rz61xfVlu+WBmZjMHOyIF0c6EpXInDA?=
 =?us-ascii?Q?twP8qvvGa6n+hYoSaIfyepHtLx/dxrbnb1ryLnDoiO2Wl2MNH7g87itLhyEg?=
 =?us-ascii?Q?Y2nYSAj1TW9EfktQrQkpdncqg0fAdVtGSn9EHQ2PE37WQHIZRaK2jIRDW5pW?=
 =?us-ascii?Q?SnPeLqtzUfyrrb8zZER1POourzXMBHZrZmAmeTBsQE/5PQCms7QDLw/7me+i?=
 =?us-ascii?Q?xAK/fsfXskbkyAv3TblEKpKcoAgGgBJrqkUR2YU+kzW2MEks7pcemk5HysNy?=
 =?us-ascii?Q?HW6b+Z8ZqlTCvufhb9G2QAvToCTemFHrJ+kq2PzdkHfnBradgS2B30LlfMjD?=
 =?us-ascii?Q?A3+PIajUT3P9smPDpvSZznDJGFrXTZyLjSTt3gLLCDYh2Cab0c6azrYBLgHz?=
 =?us-ascii?Q?TOzE7WeYx9hFJZVSEpC4Y5kAfwkQRK/E6L3DdJxx/+BSayhqBeL7kTN3MsNo?=
 =?us-ascii?Q?oDQGCYnJ39iDwRE2rC3qQF0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3c7cc2-c06e-4188-fbf9-08dc9976211f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:33:02.1639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlD9pWhWIDxlG85C4uL7eazSC1qwRvXnWfnPhPQ7CPwfDkH3qNtgqAoMUYGzV/mgOPhAt4F22RFA6tA/0MX4kyN9/mdFO6cJveywJKi1G0NYcF85XSb6+w/AuZuPalfO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9627
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
index 31b2b48085c5..712f916f0935 100644
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
index 020034f631f5..9485167d5b7d 100644
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

