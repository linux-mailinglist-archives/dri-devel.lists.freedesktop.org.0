Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B1B96B12D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8660510E652;
	Wed,  4 Sep 2024 06:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="DeugyoXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C162510E652
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3p8qqlss7f0X4x4YU3Y49lHBnJlUZqwpkSu5+R9n8d5LwNSdLmVQ2RJBX0GUpMI8KGqfmqjBZLugw0xykIlr4DE+ARzG/QNFe7w65IKpIWLtsd82Vek+63M9803iWs2O3Px0inI3p7D62z4nmbpkAVYZ4NITdw5+GG+4xqmctdGvyeHfJB5jV1Ez+h6yfxPBz2JB34fysdGUyc/gDUWBuXDQLEz5XVW2RQp0sgiQV2LtDy4WpYafuAMNJ7CMs+DkDXsSdCSbgs/jp5LnV4peZ1+08PyiZbJM4SQoRUv2WV68zdkpby4fAVd3tFrAiWT+Ad7Vw5n+e9gW0I/vfVX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2DCwBcyAm0PIwYLL5kGzf5SziPmE5ed86ihsbUkLBI=;
 b=R0so2kEgWaedYxU8FsPLcoTaLGAiLFkNJcntC6tVgqTL7ElNj5W3h21XBrpe5dwJt5f40jqIVaUmucC7SuZlIVU78p24THYOj0qlDpSxCJWkdAk01l0wLJlU0JB+C4uVyz5WNfO344fdqoSyLm1gWnUvh2tzU4WKAhmn2gYauIfQk658Q11gB8yEhPp9flTEcdMHI4LL7YcyJX2sEl0sWofGA0Q3LZBLzNeU9EMtVCMptMbTttJY21nJIkd5v4wvB03TlByydp4aUfSZi48gqhDwXsNN9U6R5NtogNs5vcTAnstntud6eUvKRln2Foojf/VoXI15Pkt7dtF9BtyXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2DCwBcyAm0PIwYLL5kGzf5SziPmE5ed86ihsbUkLBI=;
 b=DeugyoXDwKEEoSUlekeSf4V26KMhOBBtrLlGg7ik2VBauMgbMT6fFRkN+gGriv3i2Kw/m3KGogbmhvio9WSTS87EMC2zjT+/IS24FxabeI1Y7SN624LmfodLrvWHaNoqoMVvyKug8aCMBwiLop2laM+OcRDwLZxudHU7BA6hytM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:52 +0000
Message-ID: <87ed606j88.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 9/9] media: xilinx-tpg: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:51 +0000
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 344732b6-61be-44ef-208c-08dccca877e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HP+NZ9N+EZickr3JwA7mheNhHriy4c0U1K5YPQavRrcevU9JGzcjmHSFSRf4?=
 =?us-ascii?Q?Etk7cT901K81whGV9AG3+Y8IhzL/6fUlk5hcnJ5tKALH9szq73NdlV3nRRGw?=
 =?us-ascii?Q?b6xKxclkFXkvv42/VSWX3cN7kWNyteJA8c1Q53D1nvJZTSKkh+kGHhTKErSV?=
 =?us-ascii?Q?kdl7BGkqBdnaolmgjL8D+l4fw/a5Hfq6MkBmnBVAJnxZPJXX79hGcVriDAh2?=
 =?us-ascii?Q?z/wE+BAivAn2SCR7pbN9Ds7aGpYXhCrzX7NhVsF3vUxY+g9TxZ7DudlSfHoJ?=
 =?us-ascii?Q?rF/XDBiVrxFPbY3q2xjwMO7pUqhLNdNHl/Q15VEQUhy29Cy5dBBe1icfnTRe?=
 =?us-ascii?Q?VW5MmPGsN1u4eTH9A2qup8gncomPvHTvKg65nHeQcL9mJglEsrsMP17XW5Xw?=
 =?us-ascii?Q?BzIgK5jQBZm1QmgU48J1mMnZ3EppOo4GNlmgML/d8QvXnqArsk2zOdxzxKp7?=
 =?us-ascii?Q?SlI+m5ZWhcgAnE+QqpgSncN1d8MrUSZBMdXNzmWtF1UMst3pTaj4MVsNquuU?=
 =?us-ascii?Q?jL63G0N0YZ9rC+DjkzC2d+i25kG2RSBQifgzE6z+fjZyg2J6I2byxYGLAA2t?=
 =?us-ascii?Q?y7m9ULHxQ2bk194JnoP7n3PHk8pIHZjMvu326swRnbgsB2cIC+iYfOy6HUvY?=
 =?us-ascii?Q?4wlDriIewXQG+4NUgPV1NzIM9mO0ikxNs67YChivuStOIP88+xW7aH63y328?=
 =?us-ascii?Q?SPnRqPRyH6d4AzKk46DeD9S2HnYEKmSR1LYPtRxxU1zYHj05EaR44ppMU48b?=
 =?us-ascii?Q?fGHvg+1VWCqyL6S2gwN/ACQcNoKE8v+Sx5blH/LJAoYD8FnTRPv2apn8Vyhl?=
 =?us-ascii?Q?ZGkxqTrHZyX2F7KPi0qbW9rLgJrFDFGRI6xsZVXdFMqr308ntnNHWrVzyqEj?=
 =?us-ascii?Q?QZvvrkjMpyOzH2vrC8CRfrPcBQawPEPHK/iU/Bve0KPEcI3glif0DlmlvVaM?=
 =?us-ascii?Q?RwFlkESVVJ8uxsCe7yooAvzjLP11xCUfLLDGk0r0E11LhujG14K+syb6NP4E?=
 =?us-ascii?Q?IyO702ls8tuO+NSjYXzXiqKPSlk9GrfX2ovIM9kVZC613DNuQWQ4GbnCo8ga?=
 =?us-ascii?Q?6Sn0qqXyZxXAfTFXryfC30vdWMiHRFQfnjkcEocsf92gwzwdnBSDU8SLCQ+B?=
 =?us-ascii?Q?Ul8lWDuVFRtzu8NQhSSrKxF4HCnVobBm/CaeC4j7tTNyPHE7wEPVgU0YsyO3?=
 =?us-ascii?Q?8hzy4TKtQNWmVjOvLayXVGdNzD5ebAMWXxLdXtB56URlwfjDxDRpvQCdNyIc?=
 =?us-ascii?Q?YIK5cawwYvokQnDPZgJO05qcie2Zmm908GIUmzQQAdCFmg4CgKCycnF/yKN1?=
 =?us-ascii?Q?CcEu6Ew8sjh1rYZ9StWgVxePFMKA9VGTraruGGOzXN3OC25cdmZvgWVoV2FA?=
 =?us-ascii?Q?2HwuWk1M7WfsYXeDx9fbTDrEE0ZA7XCgT/MuMg9JmFTmfL04NznVhy8by5Zi?=
 =?us-ascii?Q?3ElegUxVisE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G61LdNOU2ezDhVYJPB3FqmA0WqkFBQ9i0w+3JHPrMiR+TvhPuoQuv7iaSAeD?=
 =?us-ascii?Q?r+k6H+JqNkMgIHmdCljIw2EOuChf72Jdn2bD1juM2zObiMizTt3AXzeWgWIX?=
 =?us-ascii?Q?6MH09jYPd3/Uk7IFGkDFArOONZxBBUrL8qOLC1ttlyTnw3ym2ITR02w9a3H0?=
 =?us-ascii?Q?gflsBupdjII6yZI4QedX4mKLGX4Zerq9FBQ6eMtKgXPZ9raKduDvxFi26Vrc?=
 =?us-ascii?Q?1Je6CL0wMn0ZYkDHS5giH4fmLUnbHY+z6OgpurQ/hgtxwgdJWnWH3AYNwiwB?=
 =?us-ascii?Q?4YNGMfrGpA+/p8YnKC1YS4lTJ07DYIBhYbu1t9UF6yGT2dZeJZgLd3Gx6HVW?=
 =?us-ascii?Q?/gaOAtQ/gIQJ5XclHzLZNFvsw2/peodS3gN1V5bk2whszZF/Or897EtQNvzw?=
 =?us-ascii?Q?0QE0k/WGLuGuu9hQamO3ITuLWR8L/580fJA5TjcGLDdZLUYzkamoXZw52Wv2?=
 =?us-ascii?Q?kszQlJWM8Cold4FhuNyeDOoKxZxGah7oa5/jE6cVXkDTuMKuM2nAOoL8v1Hy?=
 =?us-ascii?Q?6FcLLIME5jD6Xoq5XHU4/FA9QiGV7+hMR/g7LoVjLu9hHBQOjbT2cCxN36hL?=
 =?us-ascii?Q?0SzTd32J/RVEK6D7Mem70Y1/XQjJvkh6wAZYxJ43NL0rtbvFVE7gERhw6vPI?=
 =?us-ascii?Q?WzMlSPobMHr6pzTxCcaWc8+2/QrcqaU9FOQzttJyTEtsA36Zdb9AJJMk+LSS?=
 =?us-ascii?Q?iRSYrbi1F14UOmLj41faDxPWeTctLGFHGEY8jKSN0oB2ouZnX94EZviVDG8w?=
 =?us-ascii?Q?MZr0TBfHhcjouUxM7nU4l69YCxE7HO2xAY1FjfsuyOQ6o7Z1dawvKRk2SfPk?=
 =?us-ascii?Q?fc0u8GzFJUuwR1g/aNDK3LWbiv7+HqjLx1F7QozvE5HVcYXF8MpJlsI3kJbz?=
 =?us-ascii?Q?Di2TyVgwkORUgWcsrN5x0ZUEbtRVCCoIzRCPjjky7cZXAzDH0RvW/WJsZU7z?=
 =?us-ascii?Q?+itQQ1d/3DpTCuQs+4h9sgWOSIOge1YCdrXN1kbYbnNpftAy9nGa9p5jjVll?=
 =?us-ascii?Q?EQoY8t23c+W3YIuUwgGxWye3CG2F2nxhB5yfOCCiJ/8drrLDam8TXgOCKA+P?=
 =?us-ascii?Q?sFPDUNf5Yd9hgHGAzVYdT4s9Eh8afdLIBNDkWCHNx9ZEgqrcR1qBrjrx9txg?=
 =?us-ascii?Q?VAnIVCs06zP5GbjpIFkQl3KFWnpijZOBcPgFI9FlxvGOOSEuJ7Dc/hcn59UO?=
 =?us-ascii?Q?OdXv40Y5NyvDrxm+zkhjocAj7u8MxmEO7yCCj+z3xxXB2xB5PfhVxIzKDXbh?=
 =?us-ascii?Q?XzQmfnZiRgkvvHs60CKG1xPoi2NP2EdQFhJQ+hGRS9Im/EIEYE+maXdj825r?=
 =?us-ascii?Q?lnwnMB4ztiod1Vo+/OHWc30N2sMrAwgfbhq50+GNS7saN5jUqXPRBEQ+lWmc?=
 =?us-ascii?Q?619FIpzBt7JzzmkUksQsBfQ2qDxoIi9VsjRzesJGOBJkVHZPYloo5jNZDXeV?=
 =?us-ascii?Q?RIPya8MggGEElZAdsATed+waIjE4nAAEfn6Ik3IJAgO5X4rPhqa3MdX0tT2D?=
 =?us-ascii?Q?+aqczXrm0ih6sjjqmwT2VB2/cZqms5iAkbEIPqCN7XtLlQd5RjBVFlj8qWZJ?=
 =?us-ascii?Q?kOGolAGbSwu0FLYNc0u/JwT1bBnHAvS0MW6/DhcJKH0SxCtNLf35tOVT+UFS?=
 =?us-ascii?Q?EKJPP3i2gVwf774Z1kxPGjQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344732b6-61be-44ef-208c-08dccca877e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:51.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rip8+Yt0MFm+G2/vfroCB9ujjwh11VdFw1yl0lV/a0O860gTE6cH+hthhSYdqdCtxG/hPeVCnpY1BdewlMODFlmX4v1dd+zw6nB2chNiVCS/2cu3cni2Cw3TdqL19rU+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7309
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
 drivers/media/platform/xilinx/xilinx-tpg.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f7..d8336965085d2 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/xilinx-v4l2-controls.h>
 
@@ -711,22 +712,14 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 {
 	struct device *dev = xtpg->xvip.dev;
 	struct device_node *node = xtpg->xvip.dev->of_node;
-	struct device_node *ports;
 	struct device_node *port;
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
@@ -744,7 +737,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_port_endpoint(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.43.0

