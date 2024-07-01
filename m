Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E891D61F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB64410E2AF;
	Mon,  1 Jul 2024 02:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="e2Alh41v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2082.outbound.protection.outlook.com [40.107.113.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D310E2AF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:32:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoGRzxWSGVzYG/DUJExPxhbuBDYmvgdZy+qh6YBCGqvpdD0DaCOubMEQl5RUd3L2+vfma61wQqZQHsVVyyZHTfcTCEikTyz4+EI70xrt7ngaa+cZyK+/B1P3xAqlrTtX0lg4IDnBGVOLx5QE6tDmt/FJ5j5kw84qajrmQaB6nOHY+47yNA0lxkk9CpHByG7pLXhLN2jcsGpUKbnC7lDnpnK8ZazKDXRHrI6QAfyeAfMPP00zLNn2EZ5T1Hsl0DcmM9gEVPXh558qRVCRha6rVwkePp4HGHLCEOb7CnKZLJmh++Xi1VmjNPeBpdRif+xI92UDsNRr73GqY8g7gH6cXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCaReUbvej2eyrJqLz7qdvo9wWO//WyaJ59QR7IITVE=;
 b=ggASuezI91fEC7Au89LsrQLWL30FC9V80UwPN+bl9u7ORY0K7/QVk26xQhgMHu/ru2ekl3ZLWXqYMM7P1lVZydWV54Wely/HUijYXc8TAwLRxBa2p5XXBMvjrUBUwxvOVcJAHROFe2DBF4tw0tv0SPl3pZYakGZsBWESUXg8Yj75ES6+0QNTWZluBe/pbDQ7wT7kvvhxQfz2cS4G2H4b2GTocInhSyXXYoZGcGCnTwJl8HL/8Nh6xI5Y0Xrs7OQahDRen5vqMogSGEvMWNPaZ0H6v12sEjNJnpRKYNEHYjpwgOre/2u0gz9I4uuq27J+xzvbx3bDrS/GoK2iBa0nyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCaReUbvej2eyrJqLz7qdvo9wWO//WyaJ59QR7IITVE=;
 b=e2Alh41vC58viaZpaDN+NCA8SkeZVdvYOYGbUMw790mLoM6bY223w0gws7hNlyOrFbzUi2I+htpxiQyngA3gj25J4zZcOiR8L7mdd5J10YH9RYlBgcraBdZb/d4dJtfy1/sl9q+yyheou3FALDptOaLr7Tu/28M9Wr6iIMMu8ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6704.jpnprd01.prod.outlook.com
 (2603:1096:400:9f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 02:32:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:32:35 +0000
Message-ID: <878qyl970c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 3/7] hwtracing: use for_each_endpoint_of_node()
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
Date: Mon, 1 Jul 2024 02:32:35 +0000
X-ClientProxiedBy: TYCPR01CA0017.jpnprd01.prod.outlook.com (2603:1096:405::29)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d84ac8-9715-4238-b41b-08dc9976115a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sSf5zA0FUm1hWTWr3MXRX33nZySafqWGUSomKFyEcQawYWGilyTFO9bedQth?=
 =?us-ascii?Q?kYykF8yCFqe0DSHoLu/CDFX1teyzdagO1/BNeGfJIslwOKkkP/d/+Gq0w96y?=
 =?us-ascii?Q?LINSlKV371S9XEBhsftyX4B3/pS31rjbscaQrkCWbZyrWVQ/aU7FFsdXTPy6?=
 =?us-ascii?Q?x3/fZlOxl2gebNBFbuXtWFMdHWNd3tiU7UKL+Cvg7lznoGB0qXsQqsJ9tXKP?=
 =?us-ascii?Q?OW3Zjt27u7gV+WGVQsqqjHRjLXTHk7iyYEo9+c4pu381ixhu4JjLH85VA5UK?=
 =?us-ascii?Q?0Xu/220SKxvbKUZoDivnYAVt0P4B/CLl2whs9Y4pDUbXihsuodS0uHFxW3TH?=
 =?us-ascii?Q?DSShTM8DcNrR+9wSQhSAu7oiyp/G3QV6dWbmyj4PP5/pScGvfyHrwKtYKNv8?=
 =?us-ascii?Q?rSeiWhLRC+y0oKxZMAB8oen9TA3mJFlRc/uv0E3+K4wW5ShsdL8+o7vkTxn8?=
 =?us-ascii?Q?tBaqr2yyyojek52spGxZVMgsjjQGBkv/Ho5ws+qVnmcdgtE18midh4Hakx21?=
 =?us-ascii?Q?dDZPo2NieF/KtkxQuJ/TnsBytfw6j6BtZi+uv7TsUU9ofcu1ZgMb/XPea/74?=
 =?us-ascii?Q?iO2LFJ3taoNY9dqorlDgqgpPJ/2pAu66U+B9nrrMA+8mXE83V13wDIIMeX35?=
 =?us-ascii?Q?QjFPIXh4XmrCpQpwpI2DfmoC52KyUpWobSXsUa70pe/FZSIsZr0iHRBLC1Sj?=
 =?us-ascii?Q?KrslX+0SN6E1TYexPxZjkA7hO1e94cj0FiVj0mUH/SIOBLRl5830QATCbBdt?=
 =?us-ascii?Q?hBmuz7hjLzYhzPYlfh53lwUtkBTfLTh8tR7Q2cQf2pk2n19E55NKEXWmdlU0?=
 =?us-ascii?Q?pIe//fR6oZMM9pWny1wXRHmLFVosEVXTbwVxK6I07gi2LeFre7BEWUNwiTmg?=
 =?us-ascii?Q?UDktzV397hwsUwUyBKItAfA7EUc7JpLiC28IkqiWmFGumwVGXC8ntTkaU8Wn?=
 =?us-ascii?Q?5NzoJ51iktPpB/QamQZATqlC3gLiv9vy7k9fOTSwRJZbW3EofiLFpnBShnNo?=
 =?us-ascii?Q?M2EOtIN83eAeZ8lBAlxVOAF1hrPmpJc3RHivJCPXGXJI0sp+JpOHcJc41wzW?=
 =?us-ascii?Q?fKQmTmP9UfurzkX8vgBOrD11X45dtBe3rsXSkpdW1ObWTEhm+Ql6yQOWbHWs?=
 =?us-ascii?Q?3mnmzpwi8LxolcABFqLiwe3fb+2W5hxONjYKVQUuuemvfIg8y4GMniYiv87Y?=
 =?us-ascii?Q?Qau0QQS4Co+ZsRvwHYwWnfwbJiUfXp6PVo7qD3j3LpMiV2hwsXypSKOtG08U?=
 =?us-ascii?Q?bd765H7XuD3Msfz0DW7nAHNn5Rc+qd5/bECqsqZHEAqOsqjonGAK/a8CutXC?=
 =?us-ascii?Q?SWr/hhMl76QzZw5hNfk5wkKdeSUMmv/vqmUlP1sjqs8diLJ4T4EWpqmULCnP?=
 =?us-ascii?Q?pufI15B3A9j2vJvEmYGDbwdaznCLD7oMJUom86vw709ubplspL+GYwgLGpQt?=
 =?us-ascii?Q?wqiaysGqL7Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WI2tf8XxbDtMdXbxEmnraJobFIlYjKvMxnt9EwN8RT6wO3NrZ0AgU+/Qd9bl?=
 =?us-ascii?Q?2Alx0Udp/wlSD09VZ9hYvPL7DlAJkDc1KzgpJcHoH9fLLEtZY2Fdz7iLBp7R?=
 =?us-ascii?Q?a2pwaeUR8i7E5j/RHErgk5omEWjCT+wASoH8L4dOf4cP+66QS/UGDNg/EhYf?=
 =?us-ascii?Q?uCtngcC9lCS+mv4pZn1yIiM9PrFYZ3F7M2rYVMo+wwLxRNj+Hsb8ao+l2kSu?=
 =?us-ascii?Q?rWD1OSG59plyynU+DoJRvcCzGAn+Akf8/dst6/SI0JMddDiqxnwhMIV1a6FS?=
 =?us-ascii?Q?vV/F3c3rG4Wu6QxGrGovUlQEKSxLQuOy8U+62ANLMeM6r0tC4NK8DaiTLBHl?=
 =?us-ascii?Q?/5VF2KD7J1TsleDbOHGPCZi14cHTCHMa01qyiWeFF9miccJ0jsHfJTUTKcMr?=
 =?us-ascii?Q?NRbyUJX1cRCq0FHZMiGnTxBzGdVSnQczIF/b/a0ays9SQ7IB4XcNd8veBYc7?=
 =?us-ascii?Q?O5x0QrkGYaJk4nmwb+k+ax9PshTLxC8xrpkbdkZRifpzMfwHqccGeaxXxv6B?=
 =?us-ascii?Q?rJDsYcEbM1Lrzat7iDo8odTlCCvdXIKuvzzBm/3wQXrIiwsuqGqBQo+rKJRa?=
 =?us-ascii?Q?xXVGb/xUMXEBRpG7sVxN06JPdOzUdMz1EoCdqV545ztNZodafOxtByE+/fhC?=
 =?us-ascii?Q?7jTM9opQ+LqLF0hzPsapjfRngO8K8wykO2vJ8YHpIBTg08ZtoJt9wYq1AojE?=
 =?us-ascii?Q?+HIxRxkUCbEPGhijbikJySj+41yu+hnHkdCQzsb9GQEt+6YGboE+djtboFJ9?=
 =?us-ascii?Q?x+FY5UiGPDu2WFsFju2xLkeKdcxtPbf6YDVPA3RKVhNNSW6QUY4MKAGNfoVM?=
 =?us-ascii?Q?e5OqC3yaSeR2/1NRCEPTPjAOSck3uGuea1cAdFIBOroufRnmHnhbxcH6YtmE?=
 =?us-ascii?Q?eg/B520AG1PSNlOGtEZ6uxHzRBQLNsBDJw9mlNqnm7GX/DdIG7VMeof0z+GZ?=
 =?us-ascii?Q?P8tnDT0kuhnXCYONZQr9I9xXlq0217CLVT8IlVAdQzJTN4V/MdXy2HLv0aGl?=
 =?us-ascii?Q?+0k20D/w4sWom07xpdW4t8+obxXb97BaB0x3ik+jjnIp6W6R7RimbYQkVIKt?=
 =?us-ascii?Q?sdH3VJSJZU+e3KofteA1zIWJpQbZRcnaaDleKcRQeRj451ckuYYslkEQybtR?=
 =?us-ascii?Q?BUYaNTPaC1BZooHhliuXzLwW9nDsr6lpcLgdUMTtad7oIY0T0jI2OxCYqbia?=
 =?us-ascii?Q?wIaD3CfVDIRqZtD96dbDCyIc0ZAqW+cKUE1shEOVY9CLNEVcOGeC3QIfjszW?=
 =?us-ascii?Q?pv4npjkRMAYVFo8mV/xLRuAZosYJUuiXCACqWhVMcVAFv2/x6e4yMyrYIUdR?=
 =?us-ascii?Q?W8UrbXYkZmLU0ZgA3m+moygFEDwsAr4Hmgfd8tPGiJQA52lkNkXKfh/fAiob?=
 =?us-ascii?Q?ojTPjln3ey7zUPPnLODqKvhSPSG0yYZ8Auhit5pL9Mia3YuccepN82hrXJUv?=
 =?us-ascii?Q?xuyXwNNX73iKgXBEtSdqlmJj+sevxxGwwGyxDVWgaWxuUSfGoiUy+mpOdDdd?=
 =?us-ascii?Q?MeFJSBHIp/cfESXXteIlruyJ3vpUFGHyO9fc2GOhC/y2rF072qeQQAm7MVqH?=
 =?us-ascii?Q?UkU+yOHcBmWnjx3gJ1N6PUDoOkUiPZ5YHdin/FDXjEIQ3cGaz2m6nwtvua38?=
 =?us-ascii?Q?ydo3zrV+CSQ8bBpqJRxbifg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d84ac8-9715-4238-b41b-08dc9976115a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:32:35.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCI0qkBXJgMuK8pbxRJagOr3XMJluQJfkTO6nTXBlYAtcazWh5V2BN2WLLRyhVQAOdcDwIrPtBb6ub6CjtQryx9uwrBMxISseeja2duxVBmV6nlWs5fqZcWHAudO3lxC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6704
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
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 57a009552cc5..64e171eaad82 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	 */
 	if (!parent) {
 		/*
-		 * Avoid warnings in of_graph_get_next_endpoint()
+		 * Avoid warnings in for_each_endpoint_of_node()
 		 * if the device doesn't have any graph connections
 		 */
 		if (!of_graph_is_present(node))
@@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	}
 
 	/* Iterate through each output port to discover topology */
-	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
+	for_each_endpoint_of_node(parent, ep) {
 		/*
 		 * Legacy binding mixes input/output ports under the
 		 * same parent. So, skip the input ports if we are dealing
-- 
2.43.0

