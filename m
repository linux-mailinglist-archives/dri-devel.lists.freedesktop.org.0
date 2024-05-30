Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B48D4365
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F79B10EE09;
	Thu, 30 May 2024 02:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="oHujOBbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2041.outbound.protection.outlook.com [40.107.114.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394A610EE09
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtkTF5fD6uChLKjxdIxu9ImDOSbgF15ItY9NyX2jSeVxMHYcnpYwcwaydcFw+2cTP7Gck5c70aF7h3ZcuDBNwmdOnNo74FghO8HjOL9I5/FyYSdlrqWiqVhkAdzWpKy1aXacLZnNPCj0tJQ3pa+7zg4pmBnSjBdeUt9hldDQn2q8WT4CzUOINeeiY1DZoTBIAUMDJEMS7t8G3EJ2h22B/6zqfLuYAHyYyfgD+J+5v0NTL7YcdNWNjlziVTH1oMKyo3I+ehkYsOzngtxIk0yYaQb3J4/h1BmRNLiNgfft5QppL72dZrIRk2WZscDmfgmoqbO0FMJ+4TgQFonKSBYsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=Uu6cSaWW9Rd4Y4JNtVFryGDgZ1Y8gQ7qXCYRMjCes8/HWWEvdt4Ah1GLFroz48ukjXnlFG4KCaTlLcqFpE/SmhziD24AOhV4Aztc3/n0psE831jEP70upgKk/ce7v6/AhjlRFuK6LJ/iK7PQJfUdUPZ7YWbc/75aV4Ig4gAT1Rhx32adb0fNP51P3ArXDrrUjjyZO3dRUVCYt3dbBPVhA8OvL7/J29HUD2BiPzEbsc180CE7FCn2vA+d81HW/dJCukhZz2FiFsr6XXX7ba6sWT8H3Gd5sDtewz+fUIx6u/AbM1CQEqOw235/zND2j4J3BImMLtZ69p55Vuq486e3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=oHujOBbQRQLshEs2SXXmcygjv5BbtZ/lcDLwOflAYwUCpNMXxdDOpH6URFjhXO/9a6B4PDmqFUrl6W5utEJdlSRcOlyF41SmZduQOujLtYMri8GAvupCb5Wi4ktP9FktQsG8EIYhhQEWPbjdH895poLDJRFsQv8UDQuSLJIpdS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10240.jpnprd01.prod.outlook.com
 (2603:1096:400:1e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:06:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:06:16 +0000
Message-ID: <87cyp4oxyg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 6/9] media: platform: xilinx: use
 for_each_endpoint_of_node()
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
Date: Thu, 30 May 2024 02:06:15 +0000
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cc77ef-ef6d-4ef7-8fbf-08dc804d16cc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v+RxCrn4k7gWXnDkavsHHYKpktUZbOlld0ggo3kvGJlRUsu8DPeXbgv6TlK9?=
 =?us-ascii?Q?I0/ywuFtqkmeSwQMKb9TM61xjkq97DUPhfufvO8Pb30RxrpgU+tNlb6VqD/2?=
 =?us-ascii?Q?e/ln9Bo6HT9apk8c1Zp3hrXhm+e588ZLrlvEpTd7cpG9PatgAOw7t8gIASjV?=
 =?us-ascii?Q?zKpmZnZgehM6KlXYgPRgnyeF+S/sUD5eNLpJRvPnvU2fguHQqj3gRzZv3aNm?=
 =?us-ascii?Q?ONkzN2FlNGp5JOuwaP15hOmGcXuPvSpAtGyxUawNEjfF9MRRxOBHSJMeOVNE?=
 =?us-ascii?Q?xe/JVrdhGqeY9jeVUsPvc8KjhmUAuMW7dhOJCiYRXSVK84f2h3HnzbbDviwZ?=
 =?us-ascii?Q?cHoL3EdsGWYOTtIF7JzZkBoKpOBFc1rna1cfzvimGZWEAwu2aN8Xd8TI6MNZ?=
 =?us-ascii?Q?4shc6o6Bips/u7SuMQ1VafXixxXI5No1D+pDVBVKnJQI5E3g+jXFGL3qSBCU?=
 =?us-ascii?Q?IuMw3q/pWiqEjuJgqnqsZXLrmnRWUI17ftH+nGaGS67pA4d0EwnicfFoh1ON?=
 =?us-ascii?Q?8Ki+QxXgDQzWDUHr2NGr1MH5cGBx5wRivxbrV46kX5vJ0hoCKGeRz7TUXXpN?=
 =?us-ascii?Q?C+I1bxzayuEMpJiGX7Vw5CZGktw/PXFbX2/HhKNUGGEIpZ3R+zS99CL0wGIN?=
 =?us-ascii?Q?dwDgBdGAXFBfeiXYD/6f+U/9bjyRfZ1p6/udbMcDvZTPUCmfEJ6fG3K8hUIm?=
 =?us-ascii?Q?Q6tPpQzOGN8bN/pUc66SnvwZTExTj/WT0mYPEcfX+6EgLi1VEqGQzEhu24qR?=
 =?us-ascii?Q?rLf122fQX9ehgOYApgLZPp/mdOQFinmsRfFhGmjlzhhmUOtEH4quEB5L9s34?=
 =?us-ascii?Q?sV6PbRTtDOQMZJRnqY3Lgmi0DX6L0cYDegtIp9x+s6E7pgQOQGE7UTawDek1?=
 =?us-ascii?Q?/Ojd3Tg2g8uKxbuTbyH6HF/pGOo24/2r5q5SlS9ehdamOBNF7CF80aJu5NBe?=
 =?us-ascii?Q?ILV3UpNsmP+Ay4quV9RpcrkXdMsaKWfgkjitgYMIXHLmwn2kmbld/VqNJMNY?=
 =?us-ascii?Q?2iCmde2W66uwspzzQujDzA21+Ag6dItw9AHdtnKrFI1VXX4/HrdMLDJXFpQq?=
 =?us-ascii?Q?kP/JgtVBiijA/sEjN3j01M0klK0JnhEe7cAJ1uOArLYflc+16dTE9/J0CtYO?=
 =?us-ascii?Q?+E+LQi+MRKql4NHhZglhKmpdQlNRaBGLLF8dzmBouxSJOituNM4VM62D/fqR?=
 =?us-ascii?Q?8fQjY2VisVxbEPp9ZFG7NMJRFKlcj3zs/b68k1CFCxBcg5ccHuwYYi/HU6Re?=
 =?us-ascii?Q?aIlsXQKRHOVrVKRSD325eIwwm1TT6WJN70jyhUhblvIYJt0Oag9rX/qmkIiX?=
 =?us-ascii?Q?968sg24+a+W4KsDSnvyr96sxsqdtVcRUuDldxnwSjZxpAt77wSjp/v0xg+Os?=
 =?us-ascii?Q?bBAGDF8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Oi4nsCbeaFp/xCFHUDbetyvlbeTMFnaWkJZZB2mQG7PpkjqaUN2Fxr/Ipqp?=
 =?us-ascii?Q?IlpQ/75KKYxkXyBgIhnr/t+gDhsZW5RYinxXkn5LjGT6+7DygAcV0RIqN1lt?=
 =?us-ascii?Q?v/tzYLCCpPSr4suXdumwr/PU4mea9Y2jNasiKMvZLti5NW0zp0o481np7/Vp?=
 =?us-ascii?Q?DLPn5rO3PMFBqhOvU/msS2LJXFTmoVeAT3I5vxg/07bqmFzzyKrdFircwcnZ?=
 =?us-ascii?Q?TmdSyrsVHH/1yl449gW5Qo7p6Bua5+xwb4QHFRf9p4143ehknoqJLHFtadOc?=
 =?us-ascii?Q?8ZCDIeeeiGF2qLkwBdR6mHYs1PuS1jb0b6pX8JJVMmpfeBQeTYBlam6zd5y9?=
 =?us-ascii?Q?VisFvyEtE+t4JSI5kYvx+kOVtTlNRLJF0v2YxV878HW1P7KyLFRHlcG3ZjGp?=
 =?us-ascii?Q?CFu5b4td2dWfxKhoIp7LtLHa4hJcTp4BGbvydxNiXrrHoUsTOuRLeyfjANGc?=
 =?us-ascii?Q?JJb53s5hSYy0BA0533ZTCYgFJV45u+HjkaUWekaP8yJN/hhraZAqnjFRwibR?=
 =?us-ascii?Q?NDR5Wp5SEu96fHvzVcCxUk9hvzkVGHhhIdfpbqUw56BpCBkF/vuP29F40q82?=
 =?us-ascii?Q?AXCLAuHPMYK2HLU6CsypsEw9pbqdCuyxgf/WTeqKqYv8tr/mJzWzqVbgPoUn?=
 =?us-ascii?Q?mCp26CoGg/ztXk0p1oeUDp18WKwh9gMzFn8GrsAVRmIHZ84pZNv7dmuq9cE+?=
 =?us-ascii?Q?MIQAXvSE9PDoLrqiz25F5Tu6VdZkWEsBJ40Mwaf/lEGwbmWgBdTatqYKvr7j?=
 =?us-ascii?Q?thfmCJpeiMTrcQXt1R1v3jpXQZVflW2ROiz2NEjS0Mgvi+cZIrzyr8IDnvCP?=
 =?us-ascii?Q?jp94F/OXxKK7lIjLEjANXf4Rn3fSceNvlcGzExThVsPSLbn2vtNI62wHX7tL?=
 =?us-ascii?Q?qtO8YO8sEljy98BfMkEeIJglm1JwucI8KKHqevNlI3OgdMVpadiJNmhJkXvs?=
 =?us-ascii?Q?RZQIv4z5RyDeRpDhtsWUn819oo1fRf/6nlzNOYAxpdGQvQ/lP9vvlpKQbnLP?=
 =?us-ascii?Q?+HwBZomRVU09+46hAHecBLhQnszj4UvU5lkgnYcuPzpMqtQOcuU9ECJzrlw8?=
 =?us-ascii?Q?XjXd9o/qtYDfcRPMhPCpztagcjHfJcvH6p6lBUrI4ytS0Y725KEU5NZrp0kh?=
 =?us-ascii?Q?pw6XnhlASeN5/wWJ83xeiZ71Mr1n7nni8VDi6EsevtHg5xyJn3U3Uf/RGL39?=
 =?us-ascii?Q?PhGEZkSAaF+UeaaXHsyLfDMNuQro+gdpSBjieuKuviwsbDzYG+CamKVJPMiS?=
 =?us-ascii?Q?6P4kBhbIF/kwvaqlIrmI9f6UYKXx4gKlYpVK+T4aGysez2O+fZ8RaoCbeWE5?=
 =?us-ascii?Q?2c/eKact2f0QD8cIW1AVpqJBkjY/68Typ1nIUOerqMbSgRsUqRRD42k1BDLr?=
 =?us-ascii?Q?zs18lr72O31fAOp/HJK+4S1Df4FN+RslfAj25bhDUwBvcan3SnQPtC/xGR5t?=
 =?us-ascii?Q?7es8J3qAw23lIyp6GAlo/Osjd3dc7mTiCVvCEZluKzoy5gvMUqBumMxzlhbx?=
 =?us-ascii?Q?zJMbXnOGhyX3OwnQYvs7aKFni/e+rUy1Mj6PPP62tAD79qYWdDXxHo18YDrr?=
 =?us-ascii?Q?2ZYn1UdI3No4uVEd3G/LmkIaN6aP/cAjd6w0Hq8/Ix19iAmKL9Dl8/aa3436?=
 =?us-ascii?Q?4Y9RnhMcpOY4czcLP+3k7Rs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cc77ef-ef6d-4ef7-8fbf-08dc804d16cc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:06:16.4125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3O1Vi7W1KY7lwztQ3dMhWKe1nc6WX/yQS3lUPCvaiZNceXLXPt19kWRXgMpMFfkQsHHrTIp1u5phsOuPYdKAe9T2bZ2FtjFdc5RCZXTfpQPa1cmSBhnvu5uNkpy4pNt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10240
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
 drivers/media/platform/xilinx/xilinx-vipp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a730383..bfe48cc0ab525 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -199,18 +199,13 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 	struct media_pad *sink_pad;
 	struct xvip_graph_entity *ent;
 	struct v4l2_fwnode_link link;
-	struct device_node *ep = NULL;
+	struct device_node *ep;
 	struct xvip_dma *dma;
 	int ret = 0;
 
 	dev_dbg(xdev->dev, "creating links for DMA engines\n");
 
-	while (1) {
-		/* Get the next endpoint and parse its link. */
-		ep = of_graph_get_next_endpoint(node, ep);
-		if (ep == NULL)
-			break;
-
+	for_each_endpoint_of_node(node, ep) {
 		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
 
 		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
-- 
2.43.0

