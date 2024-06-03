Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29D8D798F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346FA10E17F;
	Mon,  3 Jun 2024 01:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="HsLlZ/7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51F10E102
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6zLaNaYHLjBMoI0Tg/WRzGzPiWoPnDTaC39q0yvHEH+nNuP403qKg0suKTKsSsi1nd0c7BmGXsD7nFruuYKMsYPCmPEE7twfdj4KSlNkiAfYiM0dRmdgkBsLWC1Jr49VJTAKqNeXyJZdcgH7AXL87LV88HhTIA595d3jaZQBgPBwiwpIggOEYfEvKhJNtQR7WgeSPZx9cwU19oHA8NpdU5Y6NuAsGGrgOJWgn5yWGivgES8VJY8SKCOUw7y0TMEW5NRAwVc4gg4AK1xsh0HNjZkGcDXOd7bEwt2Jbz/LCcQu5iyxypu418tS4pILYF4i5N68DVkBq7Vp93deIfZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=b1E/qm1WRTbDaS+inqb86fgsnEUqPdmCzNVl6e/ar06fgi2INewFxavPKdArzqJcJ0S1Lac4cz4v5RuPhIdnwvonZS7AxnvbLM4gkSQpRZAgLJn3PfEVoe81mIkW9ZQgNfxtkFlixp4jrMNLAvI0Ht53Nv4n9QqscAfVukePd6bqAreT76wgzV6jVLLT1aqJDI81ySiFyrwizkp8669qZtr5a9gXOMZinHmslrFgIBpfN/FaqLSQkBNy/YCmrEOCS0hp6o/aE0hZzEtlNDfe1E7HVUCAQwvfhADi8m+PxYobElmBXTlNMrsLZvL4sBhxsSnmank/MtzFZwn6mgNCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=HsLlZ/7JnGWbEnv2rmDmJtPWTuZ2hvRofSJFQVBAOrIx3pKdj9kdjFDwWwjj51K/ckOXG0etAwrf+1/E7U3SJYStdr8sWZgjDSRFUpwzJT/b5vXVqoSwXLL0n/+MXTtzBRz6eD7gKKArdqxQhXJ8QmDE/bMd5ssyr7O1F/wBl4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9479.jpnprd01.prod.outlook.com
 (2603:1096:400:1a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Mon, 3 Jun
 2024 01:18:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:04 +0000
Message-ID: <87sexu4yes.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v4 2/9] gpu: drm: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:04 +0000
X-ClientProxiedBy: TYAPR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: f36f55ec-4dc8-4427-867b-08dc836b04f4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|366007|52116005|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XoFUqiePWocVQ+g4nkODSbme7dzYN8q01x6oPOjj+fH+hHvp0g5julR/FJTK?=
 =?us-ascii?Q?a77dcGABqP+KuRlotT2yRPaEIh9mIwB4jRvckWrTV4EjHqraB/BY2QZTzCam?=
 =?us-ascii?Q?IJZTpCsslSauuXYXjZi853XUD7jPm6QEutYD1o5lQrf+BqGbn1LWXKjPdlgN?=
 =?us-ascii?Q?bw7kkixLjWW0b8DN++m3DS1Bcjn5FIOlEPah6nHNE5KYNw+TV1TJHa5l6gBu?=
 =?us-ascii?Q?pogLjcAQHgKAwNNsKrPGIWuQs166j5O+511JPzVYz3YOizdI2l+lUu9awCHA?=
 =?us-ascii?Q?/oLZpJ09vcttjVunSXVz3BXpfphRxtpakG4oTX0mmJIfTMvCRpvYuv57a3S3?=
 =?us-ascii?Q?W+nVOurc2QUhApG2hE86B9iZKEVMhG2fZCS6iUlge9GON6IlqVOt1+UOmlop?=
 =?us-ascii?Q?VgwNDC2fsHQZPl7DXjBmKRC3YZFC0jxyE4YhhLn/jmhny+PVL6gzPB15b+Mv?=
 =?us-ascii?Q?Q3lMS01bCDWwgcSkjD2ZU/XS6WH5SHPsUIOIo64RwuKh6btBjkSU2dQYTGqY?=
 =?us-ascii?Q?nC/eaUGTmzuVoCBKJjPnSOLUeYfdf8bGyPQlEwpr2sRBeGPrqHCvxg141M82?=
 =?us-ascii?Q?R1Mh265jABzUiIW3+IcloQCeGYXyoZ3bUADNdOOf+Ye3xhdwZB5cySkNZfD3?=
 =?us-ascii?Q?VZzMKCRKo264Ojhrs2BIMvag4Q1lXN8EhSEa6qyjz4gDR5JEo03Kcmb8iE9q?=
 =?us-ascii?Q?icApFnN5bjdJ9x6viguoDiCM+OPea2oty87YggP+InFH8xCApkFEQrX9ORiV?=
 =?us-ascii?Q?w1IT/75AyY2c/Y+JrNP5jSk4Xd/yheWE9TZT50YuQq8f535b4aKQ34kKYiaa?=
 =?us-ascii?Q?oVxFgiR3h0UDjyNLZ2xDIUN0+9C/Fg0+xsA3wKqFQU3QV1rnogYrdO+kuZU4?=
 =?us-ascii?Q?kbredQCmg8vUkKn/W54T6a/WVCw0hF2DV8GbEOFhB7etbgCdC4Em19lOqOTW?=
 =?us-ascii?Q?3Vp9OXKoh6id8W68tnBZFeKKth0y2SVQxTOCgdYl1RQWXQKf0VBwkU4j6t3i?=
 =?us-ascii?Q?VYSEubHZRZDhBWOYqGi9QWs0Y1dZ4hrTn0iIjUrqC9LfQYWe1dWb2sho4Imx?=
 =?us-ascii?Q?sAVstbG043oaLA7n77VKuG9VWrj03ChhStUS6utVy+UMMqpMDav3fpwmd7MM?=
 =?us-ascii?Q?7Mu8pV03WYUKlf8NxVeZSAQANRP2jrxMhdUP08QWO9QeFdrEkGZkXRz7pZ2L?=
 =?us-ascii?Q?6zqaKiIL1I5BWefnUlDGVamFTJ1cWXrGkzInieH7txK3fTl/ZGpYgGtD/bdk?=
 =?us-ascii?Q?Hb+d8WHgnsVe6hl7yoYa5gRWIacWuA0ULm9Vm0tbU5TX0iU+nPSGnykN8WOA?=
 =?us-ascii?Q?Gszv7fiJHwTFTFnLuEEsxLiLuvaROJ+B9C2NIVZxttrdHEIEnpOxUzfNUu4W?=
 =?us-ascii?Q?HMGYCco=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m/6/DTqcUK83xj4CrA0UV1RvwSfA/gf5lelauUpoWQhECcZ2cr1JsSU/GlV8?=
 =?us-ascii?Q?NWbVq0bt/euw11pNWuoBC+s9ifp4kJXj2AI2TZkGJTsj85FbXrfZzDoLpUiz?=
 =?us-ascii?Q?/bAPGqomc2kK3gO0XC7MTiSKNQB904eanW3JOPA9Yn+HNcRMyigM3Bvf7uY1?=
 =?us-ascii?Q?YzU3ZcLevL8IPDauCHLri7uXCooJxYdqwkWbHZXnypINbXNKVHqnwCT+DMxa?=
 =?us-ascii?Q?+rnAZiVR3aQYQ7UZhRDqAFR3648BOH4dCKWfbNSr1iJl70LJnP3n33vnWjMI?=
 =?us-ascii?Q?WWCfQTtcBSLLtAoKqNsCMbG3Zqjm9AzhXTrQOBSoQgoBWGsFgVIjaJwNJlPk?=
 =?us-ascii?Q?eQrz0R2TBECuPG7VQk8I8AsxoR6HiIJpXXphm8LMxzRQjylEXpdrZHMMzm+U?=
 =?us-ascii?Q?GVc0u9N+uVOTTjbrc7+ieNXjO5Sup2Z6RaLEja/Jb+8SKPj30GMrdK+5vVot?=
 =?us-ascii?Q?iIlpb3efq3+1hAnrDF0S7JpPIl9h+vHmPmZL45mnRwsruPfLR777ylGC3oWv?=
 =?us-ascii?Q?YCnxXmYxLOTTgB7kcdVlomZTdaUs4gpZw4eLmdbeiur9r3v9OeDPboLj4Own?=
 =?us-ascii?Q?4JmacoDF8uuJxa2NapgmenEDXifGCA5srlENuQTFI/UI2vdyH+aWKHmSRuka?=
 =?us-ascii?Q?YzZWXyqHoSCn7tvmrxyDZWFHmsrq1QIH+iOZ/MFwufjtERnSrzs6gtDIBjFL?=
 =?us-ascii?Q?qTtSztS6GKdimNpetMlA+ZJGR4Px2VBHUEt2Dm4s3o54BBS0qD6hMgE/9U2g?=
 =?us-ascii?Q?4RaLm5apY/r6IwomgtdJHZZ7jahSXWIdPEAXn6l9YWT4NGyUjdVh+BcmaL7B?=
 =?us-ascii?Q?XviX+UqDhW5k7mhDMKxCfinc/s+JWvLSZk2Uqpr7ikE1lY4j5/Fk7DtjAYp3?=
 =?us-ascii?Q?QIDIEAA7SQL8sTT5Gdg4Mi8V4jPb7yc/Hk31C7MczUut70+nKsrqY2iXTORm?=
 =?us-ascii?Q?oQO2P3EZdH2w1sPmJI/s7c1nJLQuJ0LeSMyrETK20x1mdx8ULsJ9eLzmqpeA?=
 =?us-ascii?Q?xeTlfpzEJ4RtFuFpb8SJX78wajzWDs1WmNvKee9Bioc5e9zcJMNa7ck4ugor?=
 =?us-ascii?Q?viBkq4BQu7OKTSkMIMlfPR6xUCsyIEHzVA1CwZfhODqFF1bAeNAeHl+2xQOj?=
 =?us-ascii?Q?cD0whdliHfiRmAdrlC7PXlDTetvvGAhKPCZQ/OG/HVfG9g2gthzt3Rewlsa1?=
 =?us-ascii?Q?RrolN/GXjG4mF2+Z2iAYocrjMznSX4W4u8r4bWWkUfb6KXEdbKrgRYSsxdwx?=
 =?us-ascii?Q?ky9vKvoP3KfsRlvMN1Y+d9spCMu6YFwsI11SAcElsVp9FGFWXYymiUz0yNSK?=
 =?us-ascii?Q?z8iHxWFmhTKo1XFsZ9eJSSozK1XprnmvGPVwgHv4GfmzprEuQy1LVhcYjPYo?=
 =?us-ascii?Q?lFl/B1CNhLiIV61QW4oFppPDgjbpteIs8RBa4Q4VBXmYWCpnPI9/Ac/h2Jjm?=
 =?us-ascii?Q?t8+rDtN3rknKWn6EK5qbXCr8K2dQtkTwULRnAF9gEUAmHSel1/k6lREf566Y?=
 =?us-ascii?Q?Zbb5KS7FvU8XEo8dkLaa1YWSXSYdthXRCnOYah75pihOFScjCUZJF+J0q1M3?=
 =?us-ascii?Q?rlN8sNviOe/k2cGEWAvtNnwpBKE7Vcj6ix2KlCNMvyOg1sLDOqh7kFn43GsL?=
 =?us-ascii?Q?sNFfyi5GwVfYXm/1G4B2kAY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36f55ec-4dc8-4427-867b-08dc836b04f4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:04.8788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppBV6Z/Suq7JS7PeXrwRQIE+KEPImUKz2dg7JjXskc2JCJLEC2uOzvuIFYnZb8fCGMz5G9nLA0Q5LF4OPRRSNFqH4z+EZ9HVO7RhkGyjGfkgV40Uj51C6EuBIj/ZC74V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9479
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

