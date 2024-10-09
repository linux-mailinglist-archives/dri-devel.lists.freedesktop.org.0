Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAE995D50
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860B910E62E;
	Wed,  9 Oct 2024 01:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Q+qnhwi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7B310E62E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYsGbh0LTTyWYwUDv5zMJamLsNmLL/8SHLMtZ4whuZudz9mFkZl5MN/ouxrts6RN5+pDMyI5FUpXOzN2qX0IvGwrn8MwCx1h7d5xv2oELgR78J698oDDDx0eua/JatznwKXKmASPKmRSorI3QfD9Or1YUyQHBm1xWTNwQJzjD73QCW3r/tO5eTSgu3ZUHaC2FjCWThpOoYxUGgdlNFP6yEe4NZNFlODwG5BegD56aiGgtyM7D1zESayhRBjMkyvuXGSOsPPvD4Qzh7aqEApjtOCmO2Wy27WxRwSnc184qFbO7IfsdLWv6YHJzgV9eNEXoExYLg8SvRhyfE8OUtXu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5DZhUDvEhSeZg3TAD2iwp2rTNW3Lhl221pa49GOsSY=;
 b=E55FIWAHkLCOv1y0l4aFatS5bee+2JRBzqU9QpqkA58MLDGCXRKNmpXe7sG2XASMKEXnncOVokUV0wepsPfihxUE8IK6cximFzN87wuG7g9YBZ4uVqaBAMlqIL05IvGvaG45cz7/lhgFNVDsqYwMqB8PhNeaASOTIpzOcdyNYUOFrdAAPoTDaPM8WblauP0HDz5Jm582edyb653SJbqIqknOkHTt8TIxdz3ch/yhe/PJlVS2TaGMz5gnPinZcXIzc7jj0PCj1TCv63Oe/OmYbT8wSYIF9+9yjbYWsobfUvGOmOyHStzdnmwfJx9l6kdMLFiI3ydu2k4UWrg3EwpyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5DZhUDvEhSeZg3TAD2iwp2rTNW3Lhl221pa49GOsSY=;
 b=Q+qnhwi7v4ak7isCghyFeZggeGP80tDm2/WyeHW2BStvEHYnnJMBTxBs15FFGPqkIyycSp1gGkL6RDAtqGr6SQldR67T2dmyIZJhlM1NC0KidMxGRZJSyEryf5V+VczSpFKmCSIBj8ODBl8MqfqwUVikZxPhjMJrnGzsI/kttx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8318.jpnprd01.prod.outlook.com
 (2603:1096:604:1a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 01:45:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:45:36 +0000
Message-ID: <87jzeirqv3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 9/9] media: xilinx-tpg: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:45:36 +0000
X-ClientProxiedBy: TYWP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e25d8a3-abf9-433e-5c7b-08dce804127f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eaSWeziA9PNumUOjhfSaT95ZPYPlpmNIMxHMZ5kvWrXRhgfaD10nIZJQfdOh?=
 =?us-ascii?Q?gtdjpd2gINETqyUMCvNmvUKlLnSwMEw2YoGZpqjdOsFns+YV3UsgmNIvXXoa?=
 =?us-ascii?Q?QwQC2DftYQaWTyEvgk4RTgOrkfxN9p2WPcHWNlazvDLcA3F0JyHT2LIWoFb7?=
 =?us-ascii?Q?/bUWiR4oZvtn6AUzgb6HM6CTsuC7n66MR0RBwrzgqgfF9O8amDe0wGp8pG+q?=
 =?us-ascii?Q?CWlJWju0qnRiM3KQzVhDaZQuwnGCGLW6KYg7FaOw5+8durQ9tiT34s062iOK?=
 =?us-ascii?Q?XWzQDW2NJVqKbhaoRSg5kqxSS27AvQ/mJRrkxWG/K/MbI9l0nyZ22qKPs1z6?=
 =?us-ascii?Q?g+eryOyyDW4he+HeQUVskIlg7C52DxMbeQ2PYWabjWWl/crvSoFGwU9Zs9P9?=
 =?us-ascii?Q?yFFVjfEVgUgN6VNFbFYXCo9jnp3mQFMoPRghTQlT0mWNFqhbcQwqjXcyp1e2?=
 =?us-ascii?Q?MgJESD9wGe6HKiTH61Krh9L0Q/iDWVCU0ulklEFk0m4V5RwY20JT5n0oIXw2?=
 =?us-ascii?Q?2kdthkUlksPVanZV0InkbGeJ4TKp/t7rTP9kiw4isNuPqDWe2Lroz9YZSQ3P?=
 =?us-ascii?Q?iUKpB/gw0kBpC9wLqye60y/6FS+kMPn3ewx+956N9fHMEYyvM2k3eceQVdiB?=
 =?us-ascii?Q?427Hlo9H9NynWmL2FiPsGTCt8tfPbQEPo/dZa27Cd80nyl5IEcC4B6fzog0c?=
 =?us-ascii?Q?4/tHeevDFEGF6jFozhBX79C25sHq3cqtnD7l0unDvQWHO5XHb/5mi5htMXvl?=
 =?us-ascii?Q?skPPaRY/ChguEktEnolfwFSS/45HzmQk0QHGQtTF3j2FlyL/opSvtTwHHrhl?=
 =?us-ascii?Q?6bXBUvhXZbUZJ/qu6FiF9dIWKLqaZVbnCDNWEzArD8qeovl5SSniID+5rnps?=
 =?us-ascii?Q?J7CLtDh4SQxw/r2gALGkzXVUrpp9+Mlwc0o1XNUl1Aht3brpGLooSQh2Y2Ox?=
 =?us-ascii?Q?sniK+P//8rH2lppf31EXLFl/5FeLhW5qj90BX0HgF17kSxRc1DErfxJTq9/d?=
 =?us-ascii?Q?eLDSwa4fj1JB+xHL/L2479yBpKTwIXX26DAcndilMWoEGyF/sKZEqoBUobZ6?=
 =?us-ascii?Q?/0mFeaZn87UxX2xuRZN/Bs09Xunn1KPX8t8fbNk+N4+A541ermQjuO4b35zV?=
 =?us-ascii?Q?BPEkOyu3qota0DebovKe3aXwcCAJtHV103V78opeLy9Xw+KRuHiZIiE3GY2u?=
 =?us-ascii?Q?gtVj3sIBn1yh1yByGJmQy4Vj1XkEUxS3y7UMFTd8qLXS54BrXvlN+pjAJ2Ir?=
 =?us-ascii?Q?oHayHZfpElYtUPGvT2+yg1Zjr2/HwaD5WtnEhiIwaJn8wERJRI0FF3RTltfH?=
 =?us-ascii?Q?OT61XZXrLsOE0K2unQKrcUqgKgdHEGMmwxwz+tUCc+c5xCpHzR3nRQxz+oUR?=
 =?us-ascii?Q?pV8OjXE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UPvtImAj8CPhbkBXVyKSsopVKlFUh15oMbBGKuVfB9yDe1yCaiT0tb94OOn2?=
 =?us-ascii?Q?V0SN/3FOKPyx9BTZYcZYj+08h8iNRd94v8p+sZpP0Z33OEw2cfkmmUJ1xvCC?=
 =?us-ascii?Q?dnjnvrIulYyKClDTY5t3RkCuqnEduPHV1vB1IetNmk2Y/1OJlo9lyjwl36/Y?=
 =?us-ascii?Q?6H2LAzlhM5Hlo0BlSshfDjBuOj2mtFTMBiYr7X04HrfZBdLacCr+C9JmBw2+?=
 =?us-ascii?Q?20r/qhgc0JWe++AjUhbt9kMJhuqTmPGBz6uGQMXpPpTo8Ugt/BNlseYN1Hqy?=
 =?us-ascii?Q?n8W/d8BY/0ZdcUUkEujTFT77f/cWykmP57CG91JDgoKuzYdnLsbucmAGJ0G/?=
 =?us-ascii?Q?3Xod3WmzUv/RcYO83cHICg/ruY4OuLlm/9dO0dT/LMj1XBX5Y5HU6xPV5qm0?=
 =?us-ascii?Q?J+ge/QWTN+0XOIf3WLZmYriMhwESXmaO9IqwZxczoM+yECFwQROblWUnYgyI?=
 =?us-ascii?Q?1yFrwINIrU+auflQa02+tyjLyYTgvp9YpqdO3amvoKx6Rg3QavY0hMnAJoaN?=
 =?us-ascii?Q?L2qZGP0vg0Wi+Ut82CNbnGDnwS9dTeIzG3K4vNO+wZGwoE/422ZdGDWsqtme?=
 =?us-ascii?Q?jL5lpTQVl3REEFHtimaJ5jSq1+37mE/czYExtE8gUv37209mMBjpRP6t+L68?=
 =?us-ascii?Q?pBka2mGKX8Cjf92z9xFWtOctQY3vWZM/k6FR69ulOTNfCQHv6rpvKRPhB7A/?=
 =?us-ascii?Q?wx1wQ5XmXa+rmg8CHRQ0SXbqgexP0xOQbr9twGTJixmVtRIABr+GJALkZlVi?=
 =?us-ascii?Q?LAqRL41VO/vrEUO1ANxTa7uaKWXMwA2y4x8wo5apLz77YVtUPTqh+5lROpZI?=
 =?us-ascii?Q?kXCEcISt4VCbxBoEM3y0vm8glJaBblcvkuAaaJmenzrQnAVDoV5SIXEvEwvT?=
 =?us-ascii?Q?6V2gcwBizZzr0xHtCBDu1pzucsyeoId/AEsFJnUyGnMl/Uvm7G6hq0882+Da?=
 =?us-ascii?Q?uXRxYCaQ3PxsEETyxkmHVb1N6rrzcryUlCTq5ZJOD6aYUN9VRXOl6A3M2E+S?=
 =?us-ascii?Q?dpYkaHCZimw8E9Uz5TAnmKXucoB9US4aq/6sfZoGO2TuHeL1q/gKkPocIF+A?=
 =?us-ascii?Q?ND4x//GdQeHqOtofBK5rQH4FNHgqMxT22DCv4bOnbvHIZ0yoGGMvEyDgIls0?=
 =?us-ascii?Q?2cwPndfaRafY0VQ1jK7YNjL4kh3qQstjdJAwdMQgwoDVtTfRvnbZW8+Gjfhc?=
 =?us-ascii?Q?6johX3++SwW7lUbrTz2t8C91uWz2abHpWSmfAJtiEO3V21QS1Rr2S6jpXUuX?=
 =?us-ascii?Q?TlRSHbDkqkWqVT9mYYxvsP8ge5EcJLi6spckFw2UPAJj42Yk1NoyR88tHnAd?=
 =?us-ascii?Q?S6gYFFiSzBgsO2+KVgDekMjWxjusidApO2pyveJXUxh9rbtFbB0qmAWisd/w?=
 =?us-ascii?Q?DdmFvg3o3xSM6hhJ/ztaa62MkDgoo4imUdO9fN14ddfmOsoHT89lxgZRqP2o?=
 =?us-ascii?Q?C3bkKv3p+1z1qODp/6rFU/vozMaNi+Y9afXmA2CAx3wL8Tk5zPALNkPuTtX5?=
 =?us-ascii?Q?k/xc+cFt4allSwkUa5BAu8uvplYm6bRlfUmkEpWm+JDdULZwp+zodITryOaF?=
 =?us-ascii?Q?9iGsk5332itJZ4a8qkWOMBBZbQ4NYDfh+b/kuTdBBja1yoDMsmZLNUgf84tH?=
 =?us-ascii?Q?/I8lWfz+gYQmvJbQRRGmQnM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e25d8a3-abf9-433e-5c7b-08dce804127f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:45:36.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckTcS4r6GM6w8k/2KZoyAmrxJ79awduuxAKdFiKQKXCD95LlNfyh8WKE/MRIadIK4OkVHtiAkMIh6CMcG8EdZ1CyuYU+zS3ueoNf/wLV2jy23IzyRZK+0Ty5v81MCocy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8318
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f..1d67f576a44f 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/xilinx-v4l2-controls.h>
 
@@ -711,22 +712,13 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 {
 	struct device *dev = xtpg->xvip.dev;
 	struct device_node *node = xtpg->xvip.dev->of_node;
-	struct device_node *ports;
-	struct device_node *port;
 	unsigned int nports = 0;
 	bool has_endpoint = false;
 
-	ports = of_get_child_by_name(node, "ports");
-	if (ports == NULL)
-		ports = node;
-
-	for_each_child_of_node(ports, port) {
+	for_each_of_graph_port(node, port) {
 		const struct xvip_video_format *format;
 		struct device_node *endpoint;
 
-		if (!of_node_name_eq(port, "port"))
-			continue;
-
 		format = xvip_of_get_format(port);
 		if (IS_ERR(format)) {
 			dev_err(dev, "invalid format in DT");
@@ -744,7 +736,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_port_endpoint(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.43.0

