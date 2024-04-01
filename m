Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42988893679
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 02:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E74110EC5B;
	Mon,  1 Apr 2024 00:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="W938LlBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A98210EC5B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 00:06:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIJgk5QZNpQsbECVnWKJV0v0xCMc0pGvw17EGXpJNpWjduSKKvdzKujwvk5DmAKI6GeRhQS+FMTPccrWL6E148VZQ7ZJFOAXj301elW+dcMq6N4452WPuh+EJOdpnu8SbPcXEyygXPVQl6yaCGkDmjuou9Jhv7dO4rx+wMeEbI9C+g+ab7PaSTh8IJi8EUqMRy88eUgvTjd08vB2rt3Hx+/S+sGE6lsigY7Z2nQHA65e+lJf4gBTSDEjz5xi8SbPgcP/Q+P0wop0SBf9ULSC+6SomBOXeWdkZcsmKvcdyUQ4gdkN/wgoljdXhZ8nsUnoFrdfpwDpKGrvMz6L54noow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhWU5pMTa0RW9lB2L2jViSSAy9x86pATn/ADdUCQ1qs=;
 b=oJtq77By+efye2jkrNHZHxhe5+Myf7jFtA/Pvsh0+ODt9HzfXegyR5+zTys02tM8BMKhu6A6jC3JwIHbPgiTiI+8KyMjvyK4KrIXR/yyypyuPSQexEyTfDua90eiUKAdBgkCSGNtsdrJbPuxRtA2ddfjUykaoUl92qgcTcaaIPHskyLYlbHyJ/zg7Tc56SO0vjXILeMTgMJqHjz0ZQeEpNspJoWnoRbJ/ovWKzzlGPyPjDFW34x6F1c12DyNqck+1OebBnO95B92mebkWuaegFCcrpcwy/DKSTrMn08l/fjLp0rNcYfZ0Ci9qxKvALaxUUhv/fg1ZKSsKR247jEvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhWU5pMTa0RW9lB2L2jViSSAy9x86pATn/ADdUCQ1qs=;
 b=W938LlBmiwZH699t+FHsdhwvbbIkbovR3o3AflricCbfNDLtd1Rgwnji4Fy2DlW6T9ESwjnF8P9qDtdEXDinld/eB30axmC4KNXd/YQ5B52tR9kZWdWJxNumHV+Gb/hMuIe5TSJX2Mn7eVSkZppWZhz6FzTecvTrqU2N0gfaQbw=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9325.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:06:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:06:09 +0000
Message-ID: <874jcmuetr.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/8] staging: media: atmel: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:06:08 +0000
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9325:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVmsKeXM34HrmWfyR91eaGYnFOpQhdmXGvBq8ueLXUsNQRhU9V46UMoIfhu6WMCV/o59vAj1cVvp35VPd5b6DFeCYx4Kfid+chdnwOCZYtlXb7wQXIUgKXtToqbY28o/5QoE3p4PsyuRcHVXRp9Bw6//J+4m2jWVwcDXZEPZyfHUTOaTabjJO7zOrfeF0riZSuL9SDBG7clg0W0EYXiZ62M0PwaoM33lpoxbp21IFpBQPmMc9IewRDjl27mdHJEzZq8/Ojyl6SoBgZ8kIvWM22oah/hj2acd5dpbjUdvTz/5gYCLHIavTv/T6jXmGTg/WN6GEqD+n+ci5muXS0FiEc5KiA63Sbeyec84puuVIDfOgNyYgs6jHpoE+2eYDATs7eBHUb91NKJw3Zgjq9l2i18wym6j4gF6ZAFJ9FpVvFHo9WKM5m/65TUukGCMJdzauGNbAgI8C27di26Okn1oofu1PZ5QJ96xC26wQ4mE24OkqiQRpBanUvymYmqGPRIB7cGnGgWYCZQsFbxWEF+6ssuvjYsl91Q180PeBzib2AxIlPQJPnaxjUge93iGWrNOZw1xcV/Jt6zkjnWfu1Dg4YYgSF1oiUajCk66ucnLSWNXL/t4P58oacdj46mzNhhPkY8kYvpwED2TIe0rQi7CywgvqDlHiGiRpLs+A9SlJ7vw/pE5o9o0OWMai66kS5zfO5HuhFASdyOrpcwBmzjYdzRt5SyuzMjWElaT243rs5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pnyCD80WiKS+nDS6PEy3Gkgx4qbKE7xISByX3Ujjn7Kdn5efqVBDa5YtjQMa?=
 =?us-ascii?Q?n/OwabEoPtELuEZuyKasYsLjq0/hhn9N/A6TCN438LGsZIBVEwLv3CVEPqGi?=
 =?us-ascii?Q?DwH5vSuAynDfmjyq+KmU9ulz1cDDhvOdgZCOWMz9fZK1NgGZ1mnISFbs84fo?=
 =?us-ascii?Q?8GDvzYPJP94gqVkdO7+01JnO1E827jHkBLj5dXnNcCBzPHz3KSB+LChx9yaJ?=
 =?us-ascii?Q?yFjzYsMcVXXjWWiVc8mOZAImGZnp6Zkvlou6hR27Y5zy56AU7CGxELDaYx9q?=
 =?us-ascii?Q?wovSH5Nvd7zrlp+EbdcP9CUgbwt14SDNLx8kA9JXs2WJ38qTFBl+9m2bFBlx?=
 =?us-ascii?Q?6L15XrK5kDgqqQs5mm6UMYCX7/DS5HZzCkp17kXcpGt1Ac0qAOC0mYvJr63O?=
 =?us-ascii?Q?/w3lXQOhKwvWAf/dvKh6DynSwOGuCdg86v2krxi2TwhguJYDeScH0lqOLoIr?=
 =?us-ascii?Q?bcpet8eOtbtcIgbsmcXx+fuhI6Mm3+7LJ9FaLff+0dDCKKhDaMCZK1kJe90w?=
 =?us-ascii?Q?6+TKTh0Ll4E0ouCM3nr5FdSx0TS0/ExnNPUGfstWNDoYDJsr/ICoJvx0z1Wq?=
 =?us-ascii?Q?F8rvu8qD7Ow1M5nboxKbWr9UVz4KdzBt1GKeEmon54dW8UWUTglBZfcuyaRB?=
 =?us-ascii?Q?5ZCW93TLu0HgucQrwoS360yvVx0+tg3QwHCiXhDmQ1OL+ayPN9kcmbfRPYWg?=
 =?us-ascii?Q?VeqxEv2++J/p+Zsh1yM1+XM3jdXKrzuMzAI2xjNA7UUEFAiZsfXvWWou8nxb?=
 =?us-ascii?Q?1esFOLAHVWDBKlHQJsXTUTInVY07/a/QHnMPeEMeJqzoA+yoggKng5svG4A+?=
 =?us-ascii?Q?S1VEGXI4Gi+xroItUcRy3KMq8bq3b08QKcFIpvLT4s7aTwXTGD8z53S4X2O/?=
 =?us-ascii?Q?yexa8NTfopWwA6f4OhkQ+U8FwT6OdQAFMrBPKZZbUckN0gOCeAOWVXtCLKxg?=
 =?us-ascii?Q?tbPfPCTSprEWxkRZs7MAJQMa/QMYWaCUVBKMRhO6Pb0utCJofHb23WVvStlO?=
 =?us-ascii?Q?JgY3PtO5YBKZYKNwLdfZ2EiA3LEN3GH1djmSGaZl8LtsvF8EkPq6VfG8LVNr?=
 =?us-ascii?Q?WguRYfN5Szzsazv88qRPzp4sqJ1I7zZl03VH1LZ2EbyKeyiB+rUJEbDRteQs?=
 =?us-ascii?Q?717/w5hasoyP4ZCH1Yabpl6FLH1oWDpaRPny/YxvnxI4BPJKdREwYC6LrtSV?=
 =?us-ascii?Q?7+Lc0c88yOsYWAUlvUnL7MaSmHLI4Ou23byUi+ewHxVXqq2HsC4Qkihp/749?=
 =?us-ascii?Q?cR9U+G+3VPI7dRhLtZAAUUOAvB2FOiSHE0vzn9roxfqaMMep7h7fp8UdsoVB?=
 =?us-ascii?Q?mX1hvx/8Z6cIwMSN8UStsy7RlixE3RQIv1V6IDT8NG7U6L9p7gNPiYVme4rg?=
 =?us-ascii?Q?hfcqOSiFYHu8WHfR+DCMb5/IniicoiouHW2AJd/f/XUhejWTYsF3ykgaQjt7?=
 =?us-ascii?Q?mGiZ8yJPGjqDCNI8uy9Jt5ImSREY6/dWd3TTgg2A4L3Psx6xo/V5CMeCLW5O?=
 =?us-ascii?Q?IdZOiXpM0FvT9olH10oxz9VhUmqAZGYyX1DO6AjVI7JH8pG6zvnKwnEBB7KH?=
 =?us-ascii?Q?wrimmTM9tQ1eVqqcP4zFufhuhASid1Ch8DLEc9gaPASC+LFZh27bupt+BIe/?=
 =?us-ascii?Q?P8Nlm32Nfa5Lt5tLMHkofik=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adb02ff-7cbd-4a7b-3448-08dc51df8890
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:06:09.1612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDJZiM6oquNrEGFJjWIeIFKnJo6U5K2cII9g3VUY+WuvzV1dZLSv6kN8Whhe/iQdVRZHEYEjwztx15G9dg0d+KoBkFEuCqDJlYUmZ/xAa8dJppP5Wu1Ey46kw1bxnNj1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9325
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
index 31b2b48085c5..cbfbec0c6cb5 100644
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
index 020034f631f5..7c477b1d3c48 100644
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
2.25.1

