Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23908D435B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCEA10EB65;
	Thu, 30 May 2024 02:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="UityBz68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2087.outbound.protection.outlook.com [40.107.114.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1C110EB65
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWKE6+6uSKg+IqhIpn3Lkd41gMOLARfrruM0uM73Zs0XQad7eb1v3g3PZXQa5EnGZkDLmCQ5dK+nJxlcX1LGJjm1+ajnJ8bWC75WuifxVPI7ayKQY7Wg7yZC9DJSH+DvfnCrSBQ6qUHrbqP9sit+CuB+ibno4ZjZ6ofaTS+KaP6KhnEk2arCdlw251EiI6ba9jI5BeMwMWA/Nds69HHIniHOgXc+yX+kAJVloPsow1GlKWcoYrqup7GUjnZdoJhhG3npu5f9M6lEoRHd3/X7uw547J5aTixZyHEroJLYAaCdAvKWzj6q5XEaduQjf1N3+HxEY3Fk3DRLRIjsQLc2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=UoNh+nRfGNRs9xN1167FKeh0h0ctgA5zRE537ocfiVUx9tcyquvgUMT7t/QDTs2AVWVsTxJ4VtrxD2Auw8p6/NcLMLtXnHZv5vjrf5FSVCKuDWavP9zFkMkq95FT8cpZP77fBbReVNl+w8Vaih0wTJpocrHVnx0pmEl8ZhF8nbU+XwuKRAwcOeZRl7xCl30Tc54e1XWDjhgUdphVrmqXfpXs7A61imjH9lNcOJhMQ/J50ueMHB+PQiX1objVxSRBU2AD19uAmVzIfZiSNLNvEphs2u5wi0bTV/FsttiWYOcck5iyCrjRqOHmGIkgBlIX96mpru4DcELXYEbnUfx/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=UityBz682bwzibkssJZ62HkBA1+i/6ZcIZenD5i3ASGhedQ46ZKIjhMLydgO17k190WvxUG0DWhrKcriLhKp1heB2+9DdgFrlY2WGIn255kCExcgF7u2EAgrin0TljLBmEaZdJvOyqSfGsP+v7/JrIjBdx2KBhxM/2LoSeCGJXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10240.jpnprd01.prod.outlook.com
 (2603:1096:400:1e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:06:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:06:05 +0000
Message-ID: <87fru0oxyq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/9] media: platform: microchip: use
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
Date: Thu, 30 May 2024 02:06:05 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2e7dbf-b581-4eb6-36cf-08dc804d1074
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jGrNdwinyNqNOKWmNq00Qbse5RNM64lzHgcAdmHAAD3b3zTRJlOkrHrWTF/q?=
 =?us-ascii?Q?Yl+qkgn4zctj9BA4rB2y5ZuQWGn9o49KIH3Q3eWdKSCGih4BWlY4fh23Lxqf?=
 =?us-ascii?Q?OUMqXW+6MVH+Dp40Glph4m7u86DKZgYKoiS3pa9F4v+/n/Dc99H3mf6Nadab?=
 =?us-ascii?Q?vhJS3DN8ZMzh0zolaeJ99Ij9lpLxmzyHPchXg/R5VTZnH+1uzbZgH6fcdKIF?=
 =?us-ascii?Q?jrbx5GIQ9o78e93DPfOSTRhiu3ordnIlxzq6CTlgONpz9v56tp33nygCZ8MY?=
 =?us-ascii?Q?5cIteJ1dwLc4AFAklrbjz+dtkNchVCV1YufZ7CIZLwM7a51dFxOE8BaFssjS?=
 =?us-ascii?Q?5Lq2YZW2BnEfEHXdVyOBFN8FNuLn0DKBHkJCFuGNAeHhbTTSU5Jq2Cy9wCaH?=
 =?us-ascii?Q?8HY52DNhX5S14GfLyZ9cbQNMZDLHyvNoyRhFvOHxWAu6IlaapF/UTl4txRS1?=
 =?us-ascii?Q?myy1IYMdaAc7N1DRFjzmiewWqLqIEet9OFmkVyeLp7X1b+ZxlIC6iRLnnJkt?=
 =?us-ascii?Q?p+zCswivwR47qA7zr76YdHi+TiLJzYeYuFAsnzjq396YHCuOsrIaUpFRb6Df?=
 =?us-ascii?Q?YF+1xy5YrY2Dm5abuPPmRO4taeJhA3dRmGMdq2Kg+Lqfsk+udqZ/Lb2vWLP7?=
 =?us-ascii?Q?p9yt3s7ubt2ZdEQnH1TdQHDnZABofUkitjZP135XcDfaXkT3lILpdaTdYtwO?=
 =?us-ascii?Q?GA0qd36fliDK6Cif62ilHerBFp3FIOWr7cOErWZAY2Vg/oTyL/i9IHY43As9?=
 =?us-ascii?Q?Rrwe2bFj3mtYI6aJYjQcR6E/09FsARO75HigRgG2O0szO6dv/dbvtH6BGsnF?=
 =?us-ascii?Q?9X9KS5i9zvdInIZa0eap9nrh4WXJdNfZa5z/nyUmJrLliFbwmVu8u8N7U2AY?=
 =?us-ascii?Q?aJ88xwlTtB+Jc6aPgeCPKxbSZK2BTrXj7PpZzVQGiwfl6T1ouX9jXNNAmK0J?=
 =?us-ascii?Q?wz7RBh1iCKjCSCOO+/ric7CkFPxTfbMBKYm9UI1LsP+7p4XSyw7ENuuNN4hW?=
 =?us-ascii?Q?UiMAF+pNjZ1XVUAmfwT8T3ud5skNLStLE60KLxQYlxNUKvVF7QSK41QHzWWq?=
 =?us-ascii?Q?cFjDjJWMgwo73K6Oc6mV0ltJPDWWzqvwF0+ZTYQ/omUauV1F7wKEAjY8Nrha?=
 =?us-ascii?Q?X285jl9gACXuZXhfVh/3MqwhVPaouxZWUiK0ampIK9/HkSoh1k+K9+tAeKFd?=
 =?us-ascii?Q?wMILk56rQYKKbUa+VordRJKLz8hefHf7dfuuRKdUQyeaop/xxzKp2Wuc5TQX?=
 =?us-ascii?Q?RuJlVFZ86ZB9JGQisfM4xLByk583iDiO5kzQ1eYJKY5kw9+8P+mUQNLZPKSL?=
 =?us-ascii?Q?6clcI764F0MlfmPuXHqF0nm1bhhbABFmDVg7vIN19+E3DA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?phayKQNkx/q9LdipMVJvK9FzTb1jrk44mkahXVIjOTaMqUMBHc/YgdPvAtFp?=
 =?us-ascii?Q?7I7BdVBxZwXPACiVoS7bNfmpaF9mrs31j2WzbIQnknvkedEk7rqPhYPvvyeW?=
 =?us-ascii?Q?LWYwM47O26oVrAqzkCRgbojwLa3beFvgf52BPSWV1ifrm0F+bisZu/cXPTMn?=
 =?us-ascii?Q?mZkcquhdSczMaKkTWULPkuR0ZUOM0fbHf1eitoJCUy0Tf0uoX4ykwXRheu1l?=
 =?us-ascii?Q?fgGZiy96qlDR9ySRRIhiwgEoLhqExnfDYVWgOwk+jRe7TXRu3oFVV6iEsZcC?=
 =?us-ascii?Q?hbIjp/zA55VmVETecQVz3/HWvWRXASO8xle4Fs//MVLfuiYsdK27XyVz3MXH?=
 =?us-ascii?Q?gAUKMSciDd2yA4OXvMZFYSeQIo28WC/owQJKxafm97JmIbgHP7ebDrjbUw+P?=
 =?us-ascii?Q?H2LTpHKu/7vUM3NML/t8Gv+ZwuoEOc/ZA0+n7eQU0OHxI1MjaEYoCcl4atgI?=
 =?us-ascii?Q?p/seNHCstdTgoqJP8DqTyQaY4fq4C2bQqcj1l88pRdM6DDn2tZ2B36CbMoa0?=
 =?us-ascii?Q?gUSNWmVBZ1cpU5NCIp3dCPmwIPmBNCyctiQwjtsgCwN5xExFDalurJRvPDRH?=
 =?us-ascii?Q?tXOFwiVvDljL4aMhePpZY2SOBQdvyRaacj5QYzf/0u+4uhvS9GrRrWtHFWtD?=
 =?us-ascii?Q?0Ivck2fc4xN8mOnhuA8xErvfLU3lweVOXRtoQaYweN2kUkeTqozi58KL+u1e?=
 =?us-ascii?Q?PYavaPbz7AHrOHs9hnQCklunkRmUpvsUCFcEAl/KLyzznNoZR6co7688Csnj?=
 =?us-ascii?Q?mYUZ5gWqeE3GsdLIP+b7e3acWTzfVo5WRNuhxATBMwTPrREx/0LJV95Hr51T?=
 =?us-ascii?Q?kgeTgXfY2tozEncVu7GnL2c1+ctiIJCkMD0Rv8i9KinJF7DqLUZCxDt+nXs0?=
 =?us-ascii?Q?yviH+kqtE4dhDHmSL11PQHIONtj3OR1OgVhVqLvTxvHqQp6zAKyHm00UOYAR?=
 =?us-ascii?Q?d7vpOL6sbC6S4AabWhnFopCS1bdNiAdDvBVju5zO0ZzSdLd7dHjHTP7LKM6s?=
 =?us-ascii?Q?lEZ7HcSyRe12kSeKuacyEFP5NciHkrQ1PquKNdd9EU1w7FWVOSAAHROqZwgd?=
 =?us-ascii?Q?iLo3274HQVlJvenDaMK9Hyfhq+1xSe/HRrLX2doRUBqvn7MvWeKajEuUvbBY?=
 =?us-ascii?Q?B/hREf1wGvWXYiglmuR2zXANZMp32WUzb2COGmQZVwh9cZKiWIQH7CUbrdNy?=
 =?us-ascii?Q?QQmc9n3KteJN0L3joiEjUGyRaUQsIx7lA4E7PbT0YWZ4zkf3EFNc78sa7F7C?=
 =?us-ascii?Q?WGdZ1LNx9tODkaQN/5VQV4rCqTRVhmXOUO0A+mV7lnjvtXKJvAXjl5qEfIk2?=
 =?us-ascii?Q?P7TKyr1h3ipTSUlhYGHvO5KF49BNJvaWyOkLEt1q5HUW8UP9FQXDvCj3/JNG?=
 =?us-ascii?Q?+kNB9VPEWHDHd8DJYfMSeIxLJ92EZiwdAjPbeKMgWOGYs9ioSZ8Te3C84W6l?=
 =?us-ascii?Q?udG446o14OTHckj5E+BzYPfd4sIiOalpjKG8kr7Ny77IrvTAk+HdHEK/IZBo?=
 =?us-ascii?Q?CTIQDsN46Bb3wTE295PU+RazyyrnZJEpaqZoi1I+M164Ct/NNVNkwNwX0rAw?=
 =?us-ascii?Q?HnwWwMvyTTwQcI3wMl4M2dubMAIweYCbsocr8xOK8ETiwtiHhqdu+5287pPu?=
 =?us-ascii?Q?rPUvsjuwetq5n5uPq6pJqpM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2e7dbf-b581-4eb6-36cf-08dc804d1074
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:06:05.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRSW/hGwduQHN+XcHcN6t56j71DwthOSL5sT1nUDA0FeOQRNiQvSGcoYrk/3bM+lNhSgegGW7mz/HAQHlDBI7fnaDh3y5yOGK+vL2ibEhn3bsv0JCCx05WV5w0UV2Fhb
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
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 2 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5ac149cf3647f..60b6d922d764e 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -353,33 +353,29 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -400,9 +396,8 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_isc_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 73445f33d26ba..e97abe3e35af0 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -336,36 +336,32 @@ static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 	bool mipi_mode;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -389,9 +385,8 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_xisc_probe(struct platform_device *pdev)
-- 
2.43.0

