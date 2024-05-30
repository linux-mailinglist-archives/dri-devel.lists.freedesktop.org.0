Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36F8D4355
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CE810E320;
	Thu, 30 May 2024 02:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="LF/LVi9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2046.outbound.protection.outlook.com [40.107.113.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B71710E536
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5InSjUzspYgw80d/aEUWEErhFSAWFkiSexT3yOn9BrCj7LHhXSduOHMT4vNtBq9RxNEBgzdDCnzFEhKu0IPhosHzhq4maGoXczhhrYO2x7feqT2RK6Uym3G84iBFX5LuzpEbwuSb3sISmF98MCCGFXFTUCX8nfwBqrUnI4FI3pVumr8a/pq1tXMTatMdP+SdZTM5bCfBu9+XB1F4qkQjQEHmwThUM1/Fp4FqOwN/0WOesDOpM6crZGdNoseddDE5s1SghJQZzbpXFDYFot20a01VLqOOomzOHkegNdSVcrCwrd/rKxhyZPWZXm3AG3N8eq4AycV+qEl2R+cFIXJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=REFstSi3XaVMPmRmcU0m1/1jfcYi0etq1fjCjnwX7hH6OiC2Nt6/a5v+3FagfLbRHN7C9BKwTyVYgtMcsd3gk4PNfkw/DuYFZYv2oriZaLJ+HNwcOxCYtk4xOOXomqH5u9AJ/hqjAQGu2BGA8z70p2o4V+0EPDXc/BStjys9iGY5zFfv1XMnN7/ysUhUY8Pz/1crjvxT4wcsTbEEJUzEmY1/SfV1d15vwPCCBl0U6sdTeNDA8yMl2ru92yd8rVP+j3PO2zBwGBHuIoka0g1aMLq10gDmSN0YEZjgkPvd3iirBptissPHk0LoJN7JkrE5phbFo6MpRIPFQCuY+ZsLHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=LF/LVi9PKtpB+wUWr36GcQoL8HWgMD6/6XBEcwDAK2jGkeWTFlQ/ypIfqE5AJCfpOxhumz6oGsjMDSbXBkpubNOIWe0AKFjcY4thZPMcwXZKAk7+gUafsLe5ib1bv9W1494y/eDnE0CBHL6nfN+TJKIlQRzAFCF6eacWOQrWg6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9900.jpnprd01.prod.outlook.com
 (2603:1096:400:223::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:05:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:05:39 +0000
Message-ID: <87ikywoxzh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/9] gpu: drm: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 02:05:38 +0000
X-ClientProxiedBy: TYWP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d2c3f2-4eef-4278-7ad2-08dc804d0088
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|52116005|1800799015|376005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D49oeb8KknhK1Q5sj7Eqnt6PZtzW5EKmMYCMX+2p1R9qkWF1PmFbXIe8kdhO?=
 =?us-ascii?Q?6BNsMl2nJ2C3bH2kv9Psz7Q6S7dz3CxdqeMuuE9L2Ccq2lh8dGLCJb6uxv+e?=
 =?us-ascii?Q?sxHjnDWvBgAS1758k0IUDoQJYUNj3FRnAEnKbZ3PMeXzKYCODxFlys/QPY7c?=
 =?us-ascii?Q?Vj71yUk1mbo3fJu8ytkqga1IlFGQETI500/j0djCJGQ5TnFDDBPRAwu0f2DI?=
 =?us-ascii?Q?eDPylWV8C9pyB6w5zHECWAJi9tPjEfTO+pS8bSK/BlmaN03/7BFp219mpycL?=
 =?us-ascii?Q?yMbGSR4PKfyioGWrFP81sTyTZkong2zB065H7C1724938nA1xqFHC5cQmTln?=
 =?us-ascii?Q?Ee+OGGGpHl3HY59+2mG9G+2R3KP86daAaPbJwXD5p+A2uL5jHnP11atSaZeY?=
 =?us-ascii?Q?LC5mAuxCRFU90Bu0X9xLun5BrGC4d+ahmuZkDCT7Qn3RMwxJhaYuhHNXvFs3?=
 =?us-ascii?Q?Dn++G4r/j7gGwOG1tQ7+uOd2k7yDXDebOL3ZDBgUdGydA5wMy7a2DOGfiYKY?=
 =?us-ascii?Q?raIGlQS9mQKP9kxRIH6FubY9znztZz8Jf01Gs/1KLwaLYtjCuGVWkalYFMkr?=
 =?us-ascii?Q?363qaiNu94xJ9u35V3zCBBvK91w/IBfBF0yk73sB8hr7kYAHgbC8HNtot3f7?=
 =?us-ascii?Q?t8KHMHi6ILYTdihkcJsUHw7O+cbS91Bg7CWkuuBSH+HdOMD9PA8NcgoJM8jR?=
 =?us-ascii?Q?B4Q8yZuK+IengI05FU8pecsVyGIN2NJ727EuOWGWRFB0vW1Ja9kEpjtxzu9a?=
 =?us-ascii?Q?nLPWrzFc8buk3T++HuPb79jIPu2fuOtG2BgTwybp8ZTOwhvPVZoH35ds6F+l?=
 =?us-ascii?Q?8qE4NI1JyaIuzOTwxAIGiV4R36rVvPy5GGfc00sWosocpcnNnrxsaFyDq1ZD?=
 =?us-ascii?Q?72BNzq9m4IhdMbUnWgoCUqdLyHyZDIGSx5n8qsUxy0PrXwjG8OK6KfPEwtbx?=
 =?us-ascii?Q?0enPJycSJjqyi1rm67r6gotjLQSovxyW3DGWuNxEGGnV1nZg6/EmV3RuyO4/?=
 =?us-ascii?Q?NfUCTj8LGIyB/iTWswD+lDAjLOssqVFtDVrE7H43Y3A60gaJK6IfR1+xOiw/?=
 =?us-ascii?Q?Kfmypgt4KcX3bRCBfuKzpnQx7QlB44fmqwu568cXxy0UlRis5TTMklyAtPAk?=
 =?us-ascii?Q?Y1eEGcPi15NuO3dtdmqd97+ijFBxgLN4DFH9+7nW5HDgx/3F/cSDht7Z7c+1?=
 =?us-ascii?Q?QOsYgwny4o8AL+luhbnUsdiJFonynrrs8Ci8FPiEa5b/jaCw7sSfJJKNXpLN?=
 =?us-ascii?Q?Fhm5x7LTc4bwmrA1m7AvcUdB+XKWyzGVJ6cM44J7PynPyfS9PU8Y26DPaEAs?=
 =?us-ascii?Q?TarsF61nIErFmBIOPXb8PKkARVBa8oPF59hpVyZLPmnyQ6DZ/LaU1mvsuJyQ?=
 =?us-ascii?Q?NN9Qgk0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Khjqf1SHbeGy1eNN6IcJ1uMxVu0/BmhGSI5bT7d2MP9diseefMwb1voIlJi6?=
 =?us-ascii?Q?QRMhuUqNQCsBXk0+N/AaWVpRMqeLPej7VwQYBVtXMwkE5drTaktsRj6hHsAk?=
 =?us-ascii?Q?1zdec5J8F5IfBKX8fBcDXo4CIfernanktlARF9RqNvRp8CSYCkA9RbMhLKN1?=
 =?us-ascii?Q?oSr8+XA4/CUWQLJm6jW88SrmTi8vjkm8aWmSjvU4OUs29YBzWUyNcLOU3qje?=
 =?us-ascii?Q?JGQAMv9uHeGmRmGcpc/AmLFkKE0wRn9Emuun+8zWFGaHGVVE5QGrnPhpoPEQ?=
 =?us-ascii?Q?1k2rYIVF0msZlp6lkbGIBpCWRTqOdqRyBJfs8bz0zaU8V5GD8gF1FC2sOy/A?=
 =?us-ascii?Q?uZL/qQPAbBQSMphcpKDmRFa5DVrNI98vlVqbPj9zrrbGyAevXTNVUeEuicpu?=
 =?us-ascii?Q?zQLVsrXQim/RXvdNyfOjCEdIzSqvE/OZSIe2SapZoV85+VFiRw80HAh8Dvv9?=
 =?us-ascii?Q?xJx+enNujN3LUrcjHa8po4Z6n6GEc/8QOFZmZyW00c7h9A3x7O74wR0M1KO/?=
 =?us-ascii?Q?9BcdV9VjnXH+yQNv4UEXhQ5SAC0t4fIQ+gjNKikokpqiAkt7+aRSNwKD5bIj?=
 =?us-ascii?Q?Cyi0/C2I+nxqwDAcsMMPGt1/O6qKGrDMWRiP6hxrFYk8ItIOx3nX0fpgJvlJ?=
 =?us-ascii?Q?ZOeL9kGlJCA8gZUeQssbHjqwGWbeo/uVE1zz4XIgFjkKnRMdd6WeOTJ4iow4?=
 =?us-ascii?Q?914fTzcdZuOrU84k5ToaB/GenYMEPiG1yLoi62QsiI+RRantkhZ9600W4NH4?=
 =?us-ascii?Q?QhTqUbtC4kgALtdrH2Ph84mhxIp1X4hby7nl5MacyCPz9yZuYCpwitylhzrI?=
 =?us-ascii?Q?qPRCJ0rMa5iI1N837nqmdGYSKQL+SN8SGnA1Uz9IwSsyzNEkJtFk+QIyEpVI?=
 =?us-ascii?Q?SbVZszvkox3pPJ3BAFN2o/hzGKyIqa9YAfZybfqCZH+949GtS9lalZ0G0T3G?=
 =?us-ascii?Q?7yXnUVLet/i52SlbsmIGPaP1YEx12BqFUlEZIKSgcmvsyiv+1t3iQFG/ThTP?=
 =?us-ascii?Q?OA7ct//ZKY0EGoYRKiz1tcD2GmYE2Z7Q63QmSYFwZrEsr4qHrTVRXn0x1Ef+?=
 =?us-ascii?Q?G6uiMvYsfSJxi64HrHAhFuaWhlKUv2P1gtkzu8TyKBtS40wtVLLMk1TnN+gF?=
 =?us-ascii?Q?mUJZBKBT9Y0gPAGSOV+JKif89jYEs6VX/df6/gdZdU1UWsSbQFkEVHu2Mc6P?=
 =?us-ascii?Q?yRdy+wZfWBT1UECqNu9xRC1JYN+8IRMcbHHnXRONWor7GoCFT2FxC1sl1deV?=
 =?us-ascii?Q?h7q3rD50kL+KJD3f8UtNh4TYRKRTdimto2geT+wkMTzSr2sgQQ2C6jDyngW2?=
 =?us-ascii?Q?40QihXUA9tWYOfVZ4LW0HPB1OtN7xXNILpCdSOw+n1hK8DVo/xTo25W23KFP?=
 =?us-ascii?Q?k4tQWb3Dxz08wZ5OAPLjLV2hQTGbRuh4jlGBvF4p5FvS0aGninlsdbrU4Cag?=
 =?us-ascii?Q?+865E+KqVZn0YWgdVhI3dlZs6leSC34uvwk7hmkCT2IswrEqLI8GRgQQ7vl3?=
 =?us-ascii?Q?zZfrAGyqT+6/MZtHfBf4ZZW7UKcWUSMSJi8K+5T7AZIjcHIDpPPGsvQDJLN0?=
 =?us-ascii?Q?6wqycU8KzxuEEPX1J/8y+SjSdtJe21iI87ZdmLm0WMcdOH1qdtWJORg0MyEz?=
 =?us-ascii?Q?VrFy3kb7p7zr7zmUCIGYWW4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d2c3f2-4eef-4278-7ad2-08dc804d0088
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:05:39.1057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwVUgX/1QgC+c+nyFocwkN5nJ07NI9pRk1QgFbnGP2Jxv8hp2pkUNloodZKmOZUB6QEw7XrUWC0p4jYGfZosiv9sg7Wgvt/hg/0DjoVucn3ZyHAbwEXZxuKsKBBYCJBc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9900
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
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac58..5f8002f6bb7a5 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn = of_graph_get_remote_port_parent(n);
 
 		if (!pn)
-- 
2.43.0

