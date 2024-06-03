Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E58D79A8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546A910E1B8;
	Mon,  3 Jun 2024 01:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="oKODHjl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11011008.outbound.protection.outlook.com [52.101.228.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BAD10E1B9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmASQVD9cIpGDOQIE6oeoxtjO6mvODif/ZS9BJUC5X5NDqx6czfI0f5z3P0V1Mg+Ryn5DBaa6CnjSDjXMpcvyhlJgKT68pkYDZ8KT932pjHvxLCFFlk41QWTVzgkB98W9X6bYJLmHy1/HJ4ucubq5zkTLzVILy/UEzKlXqBzLH4SZlAvTvtWhjqMZfWBIWN2T08bCWtIMF/1iLZ0M9gkdBOc43+xXb9ynyUvOW7MQ3uEFlFpt8aSGF5dqPllnTwVtxAG7aOFBV2tWRlBQvac4I3npVt24oiLw5aZc08mKpHgWw72qtxF/+c0axsjzd7PDcLkbqS5lJ24aJqr1fsKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsagpA/5pNrylws56rjc/fEA7kqQPMX4DxQt4ow3FTA=;
 b=Aom1X2XkQ7okN9g9j/a5GzUBMJPwq7XkX9Zrege5BJb9qV7ocu+/C4BxC84Om1gGE+vYwHtHL16fTsMlBXMSszCfZsNNqkjROlbPvNv4i1RTQXyKrfWCg2y+3fvFuI1Zr5o/Cc7qNBXJnp8vw93UftY02D0UzEOFYevzXEq8Ji+BfGRNLREydj9XjaljSflu83IgJ+DLVI5mdLLppTMsexRG0klV8S+KUxBs5L/Xf91cqXIcpfmU6lMv3pASRL0rS7naYx1zodRn8WwFm5y/T11Vqeep7+G37VAeRYRhYUYQyg3mGFNViosaPspbYRlOVS9JjcFQ85w3/tAiUumc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsagpA/5pNrylws56rjc/fEA7kqQPMX4DxQt4ow3FTA=;
 b=oKODHjl27rAPIloMNy16VOcRfRVslvPpCxYhaEZdC11gpuL0L+j2lnxr5HgP5imOgbrthtII1CjrIWs31nX2tARpxmAdYXyaCFtpsvE8RHC6tz+kF2S8fB3usx+R1No5xe+X21GWWjWytX8N8cFyZPafI+IB13OclYR8VWJrVwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11318.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 01:18:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:49 +0000
Message-ID: <87ikyq4ydi.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v4 9/9] fbdev: omapfb: use of_graph_get_remote_port()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:49 +0000
X-ClientProxiedBy: TYCP286CA0153.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: 62924168-736e-4b1f-cfd2-08dc836b1f8c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E3G/vmxvgfVfr+S9rd62Gpi2/YNUVsqF0fVlihXtjrUPDKk83vUrqISIr48q?=
 =?us-ascii?Q?wGgO4LPGuVP33SJU7WvcX+AcWtQS9/ITZ825/cOwmfhcBxIoK/zujmltKopF?=
 =?us-ascii?Q?BynDOQBDgtUhNzE17+ucoEhWweQlyJGNT9QTjacFnRtNFzXZraxyibqArvBq?=
 =?us-ascii?Q?g1kj6gWZ/+afITvvyzuos+nYxx6glSBCUOaeboF+vWtXy1P4F19tEZGLsJfF?=
 =?us-ascii?Q?u0Li+zQie5bS4H+x7x8yowd5qspAAFZ+swmxe0/b/66a3NmkjB1aNWkrzlap?=
 =?us-ascii?Q?eCyR9iDROCsoSkC4uqgxRm4JdXZIoe6/0SPLSUTtdgKmLuk89NjUPIOuU2cn?=
 =?us-ascii?Q?UFwdlcLsky8OKhvnq441fFcBvzwNWgUGtstXHzAOHLD4jfs9PbJF5jvHIaPX?=
 =?us-ascii?Q?qaaSsuaKud79xHsL3bdqnoANod22KFegjTgCx+Q5bGVo4lB1FqLrlnz6eDFr?=
 =?us-ascii?Q?0U7v3OpoBjk9lHrhdZ5xXh+mNtg+po4KaI0ux+a+mq8wujlagSYKJqlXaYf6?=
 =?us-ascii?Q?vuXqO6lbiVwF4yOjVVoVlznj2YCVF2Xhsv+fNTcqWrGMRBIioJHtc+3HJGr8?=
 =?us-ascii?Q?GconaWPmdayn1XnpAEgpuImNtLTKj7Vm7dkUQfPW0uNPpVAn7XJ2CWXNHkaL?=
 =?us-ascii?Q?klvg3KCzSs3wBgN99jpNOyASfxFVtlDNtMQ6xWwIv3rda/eY7EyY5OWMQci4?=
 =?us-ascii?Q?ZOAz+hzXfCgnpCpdNhlqMgfPg5bUAsDnPCIbcCS/mjNmvW+YaUwsnuQr3FZN?=
 =?us-ascii?Q?/iybXXIErM7Ff4Lf/DEf09cBpoVXrQJr2imt5Hl+s2JQc6mIsSvO+ccPlpN+?=
 =?us-ascii?Q?FhK+JueY5PHjkYV6IblXOQkPmALGgsjqyY8oqtMIlBs8/C/Sr90P7gbap5ba?=
 =?us-ascii?Q?3SHfJIlV45nJq3Gausg+Ly5SgS8m6T0zsogpb50rd8o769nURViUd7H/eARi?=
 =?us-ascii?Q?z1clIeBGV3cB/6omNAZC99kyMLi1lpXaRghSWYtWdGO3xmKEMFRA5bZkFNvN?=
 =?us-ascii?Q?ww4gDMoZmG7WffK5mRMLq2QIRhQv8krVl2T8D8ZVEuJvBUPPEJu597XoCZzE?=
 =?us-ascii?Q?FwYn1+efrUolAzPlIIm19oZyeKbvVBByJI8lMS9mwQA0j+JQivVXF0aBxI3F?=
 =?us-ascii?Q?uAAmRnSs9RsZaKP6FNaSXz23LapeaGBb9qYQ6wr2sN34tXRGd5GK2VdlnXuo?=
 =?us-ascii?Q?gmWv8Wqu411oY0AzBhEBSw7oScRPvoQT8+Wx31GzRL35m+zV7JNymX1bW/eo?=
 =?us-ascii?Q?5Pkwb00bnCjFXUsKUca16g+biVe5XX6OxOL8sUSRICKTL4MnnYhjxN2OFwtI?=
 =?us-ascii?Q?TgYCaMWPirSxhwB/j6/aWhw9ocfw9mqcCyl0cEJEpDIqgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qfliaFvMAsMmtxRa4cTHiUE7D+9dSV8l2oJSrtlTt4zuED4/sCfWS7FliuT4?=
 =?us-ascii?Q?lrQKmI8wZRYhQP0p4/Y7BYA0/HTMbRjjhSnibBC0IurIGR/YP4klt5u+by/N?=
 =?us-ascii?Q?MlLHDhz9Ra/3fB6526UmWlgH1841qI5U78Evg1vhhVrmA4Sfr7r/3yAcHH+b?=
 =?us-ascii?Q?YUZ1h/I1pLT745u+QMIFIxDmj687wQphPNKs077EPolaT7iZl2RNvYDDDJgd?=
 =?us-ascii?Q?TveYD5Ks/OFeMJh++Rz+V5zQ/cDMe8mvC0w/0dt0CGklPKRDiJqDE2SRE0oJ?=
 =?us-ascii?Q?3mYMApzwjCNSiOke7kuXQY3CwVxc4sFyn9ZeVo/DP+eFVQh8y+CPhdZGsdoX?=
 =?us-ascii?Q?5ugrJ2VkcRR8e38HrDnxuCHcTpcLU2Ck4fFPn+hIkDSNqKdipgTTwpJ32Oux?=
 =?us-ascii?Q?TBYihXPIAtlLTd9jRRKszhWubfGQ0t9RG3MG4Jyl1WECToPOMLcQs91VExqp?=
 =?us-ascii?Q?s7U7JDhNT5Z9FiGS/DTWagbFcJqxVHXgC84DYa4LH1YWGvrvlytOaSQmpDr+?=
 =?us-ascii?Q?KDjexprcfqHSvriMDRVCu+CkkXDWrgilERcjQlC4EIiGTnvEJVhkBrZGDiMe?=
 =?us-ascii?Q?DQpoU7HI41O18h3SE2/ubf1drxGOEs+kTvlJG/ceY3FKqeUHmuqewDo1lSOZ?=
 =?us-ascii?Q?DUI7jOAa/FqKpQUkMQU5uc5VtDm0+sDJY+iqB1u38FOiGIElpNiPOC+n895B?=
 =?us-ascii?Q?ah6Je3hNYIjCD51c2Bs6xso7AVRNT2Le6fQqkbuBNijVt6wVwW4nnigXK2at?=
 =?us-ascii?Q?I+KAVYsH/88BHJeDtUW0bD2E6KT0xOt+T34m2p7CUQvYi78dJ9l5Xf2HHqDZ?=
 =?us-ascii?Q?TsHltd0TEEIHOIpFglYaWmJdHnuiXvrI3uoQno7uBw0VHPBXVBZ+kFBktJqd?=
 =?us-ascii?Q?TNvjcsjj641JSOam8NqghEhdspUSX/l8Ukc+6yP5BUc1Bmi/201YFSKzMUgT?=
 =?us-ascii?Q?sMfFmsTfp4l/5OXCS70IV5Ffy7jQZwXN3Fbcg3QSsm7+vaqgqBy+Xv+5FN4d?=
 =?us-ascii?Q?7n84lH5pVdTsO/0u1tJDehcI2eMVWcuwdUX+5T9Ir2sPQYlsfA6/Ba0WTNb7?=
 =?us-ascii?Q?J5Qd3Mxjbe3cyZ7Y1dRjNHO6p15Yal+ikG3ZQ4YnJhzYn808TaCAbSqQRuid?=
 =?us-ascii?Q?3FykPn4HqU97TRBC0WNewp/UwzkatAQVvcCSvE6mqcElcecVyzhiSBNOa61b?=
 =?us-ascii?Q?h4cQ/3LoOpwy7hAopGFlxLurfWhTki/VXt5OknFKcdbA8770syqEjhjCkmBh?=
 =?us-ascii?Q?bvV1TX9Gag4hhkn+rAaZ+T21FaKWlS9rUU3hmEBolK4GiFnQC1o3du5nS2cv?=
 =?us-ascii?Q?JtvJIHlraWSZRT+VlTdl2uUz5YMLQFM0BHibVOX5MSEsBf1jnDagfoaegDxq?=
 =?us-ascii?Q?PgTMS7Y4WJjMy4o8FmPRfPiLTVTBIDf9IRo9Opid8g7v6cKGNbegOd+2eew6?=
 =?us-ascii?Q?gNE/3pIqr7oDZWdg21BBEnOTbscoCGHgURzQB5tGdpbGvqEBl+BV4Xf2Rpq/?=
 =?us-ascii?Q?lcLgCu8V9Bav2TC4PJAVvnLyZ2J80nZatIJVID2DUiIVNYBWEp6yD11wW5rd?=
 =?us-ascii?Q?Cn44gi+fnphCkcCVpgkQfgBizVIPWZ7AeQkyDSC8xwueXascG3xkjL5P3WY2?=
 =?us-ascii?Q?Qo62I6WDHjYsFcWV8STuGus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62924168-736e-4b1f-cfd2-08dc836b1f8c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:49.4787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9nB7U3KeVExeSkrXZCtvJOlsy4tiA9IZHAN1YTPjIpTahJ3Stbu8LCdx9E70RpxWmmj3uppAivOaG1N5Ty5ogknE3LFGVt/8NIwCZ0Kc2tBTqU66cnVcllzeNP7K8qy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11318
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

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 14965a3fd05b7..4040e247e026e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_graph_get_remote_endpoint(node);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.43.0

