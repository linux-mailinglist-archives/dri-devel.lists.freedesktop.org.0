Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336394026D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 02:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26BF10E1CD;
	Tue, 30 Jul 2024 00:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="aFNwga+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2049810E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:34:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmW0JAt7ihBm/N7uPUiH+EyKccM6l7i6slEAbG+kIrPTGAMIbNnc8u2gkkd2tn/4jJ5CkYWZoq+XqYYpvMNXbDrJYYITtEzRxkpEjO0xWc7JusUPtsKB6JEimjxeEV+sy3QfscIHSqKZlW11crxOpyXsQ7Zu374ihRk0dZ4A6Vtw+Eu1uFkJGwHBPXR93K/8lJ8btG2X6gpaV+L3cwtV1wwBlLOisWDl0geQdNi10ZpKdO/8ZQb2Lir6IvqorB1OBLlLbOui9eF8ZY7akliHlrKsQwNhV+HCRGLSVh5fUkYahXU9kHJRscpOdlYOLhgjY2RJ/nGnTYo/17NuDHIBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=xZX8CGP9YNiY6gmFp5LIwGWztXGOP6z0sfePUp3U07SSEWzepIam9oEhwea+i8jfsnzSpIvUQ0r0UPVnMTYwPstcBmWLo0YqM2K1pewKm2gIFf796kwidojVXS+/xe0PD5CL7QZnuEtD1EmHHmG/7n0n1asgwJTLBEcJQqGJYIo7XrmSenDycBcSlkoiFaf8eyxKaFQhfhNm4je63jvRLGkJV1OKfGSoOnPvmQ4qOaRMwjI+7DxK9pOdc5Iv0DnK6sfq0WO5b+TvMy3tmtXPcxijakJFXvRI5QGjlh8/UMn7OyMfpADMp+hP3MCBK1NFFsifQCeVHD90PBazlmUjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=aFNwga+hnYU1qUNkHUAcwjJv4nD9kpN/h1LwGlC1kcGuNOom8m+D0hpCuQj56ZenBdvQxkxx/ak3DTecMnDTtLa501IDwWJGKLq8nQPYpYL8NKucDuaLEjbAWZRtrhnOcB7s3KtZ7DtovEiO+l22kv4hIDOo527bAHI+xn+qbYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6972.jpnprd01.prod.outlook.com
 (2603:1096:604:13a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 00:34:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 00:34:41 +0000
Message-ID: <87jzh3lnts.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] gpu: drm: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 00:34:40 +0000
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e6d33a-0946-438e-a6f4-08dcb02f6690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YGvPzjDSp6QKd4K7nQAJHMM9iDjF+mXopBCe9uFzHBZ6EwXMUcjm/d6V4MFd?=
 =?us-ascii?Q?o5bwc6lBEKvUOMqrYQrgo6MezLrhv7oMWgrU2ocojYxw4WtzPLR+PhgRJlnv?=
 =?us-ascii?Q?sSIHlelZnGLo83OHAltEFW3vdP6oH2hLhdBUkOoYY6799L9NoCxgeSGfjDiS?=
 =?us-ascii?Q?iUNNn9FFTIR5Y1iNIF51XhIaxRFJG/YSJNa7fSg8sjSB7TW+Vg9/ayNpc0vj?=
 =?us-ascii?Q?DGBFabOgMYAHx286DsvuBlLDDKZ+wTcSCxgylVq39+gwRTO2hBWZFJ8oMBwD?=
 =?us-ascii?Q?KkYxRG+5DrHpQDmUSGYYfjnmJLI1EM1AlP6iSORUMw52k6NiB17rKU1DUOd5?=
 =?us-ascii?Q?qTMDDSPEFytYRcwPCK1N16dxutVWG1IlJ7yBEZeDTRfM2L5ckAd9S0oYpJD3?=
 =?us-ascii?Q?8H0clMt2lmqHDKaKIpT1pSlYc3B2w/GhyPyPDWkiczpPnH4QXanmBFvA4tPM?=
 =?us-ascii?Q?nr9/p00gojEe/gpQm+10BUmuNEToAifkTpQ66Q+6ba4kL5NGQJcpbkArt+E7?=
 =?us-ascii?Q?X23aWQvkCN0j1nZBiipOS212afnGAVbsqsf3kXJjCgiSuZI6rI4p0QZw4xom?=
 =?us-ascii?Q?AFXnh7xlfwojYii/nU+sInbumGnX5cthIXtKkXKgIZmJt3wLAOGKiqUno4v5?=
 =?us-ascii?Q?OET/U+qJrytyFfm8FFEjL+pSgSkePI2glWP0WIGn6LVlbvwlenhEneUHBG53?=
 =?us-ascii?Q?PGrm3iDP26OHdZUrdo/0gUEf7mIb6Ya0X6CGEY6XdxsyHOgj3IdfM3tvTqHW?=
 =?us-ascii?Q?s2a2VpFyaqipGgtFQZOUwyU2fyfLdy99f6OOXrNo5U5ZPidFZNGR9Q6he5/b?=
 =?us-ascii?Q?pLGf1e3ZqE3q7xPLpzn7pRHPpNHv5SYZefPmmBPIBZg3Ry/OlN5LRiLnNCIv?=
 =?us-ascii?Q?vP9EgjbYdr6YTNGvVMApzfOQjnKneCvEZMZtNJ72TnHpU1OpagOUO03SAosD?=
 =?us-ascii?Q?jhBpHuj4fsHbXXG1w8cUpgRVb4WBdya3t45aePFRAiCrb08A2eVYjxmlyzGx?=
 =?us-ascii?Q?wWN60D84Y1+JAHsSsBL3969RXYvYVmlgOjDIbY8mF0bbmw4niDOXhnVSOPFS?=
 =?us-ascii?Q?jgdRj0qkO+R5spRTVhnnBz1w340QdtyyqQB9ECCpI/lqq3Iz3/29gKo7Qg32?=
 =?us-ascii?Q?XG9GH09gyGSCJZHXEK5hIWHXoAp7+Hpd4QNAHa2dzEBAZuvCvG60irfHagpO?=
 =?us-ascii?Q?/UA6RZ4LAdAsPLJtbAKw537zqvVTnyXqGbfffG7Ahx3UDU2X4spBxaMKCiGL?=
 =?us-ascii?Q?Y9jZysbXnyZRs8zfxy96nYKzPpJh0Y8SzSGlR3uJbaXD/SRAbWjEvmJA8NTl?=
 =?us-ascii?Q?YuVoPKsz1MbWdC+L/rDlqd33s/EzAa4yIM4eyXZYIqpQu7hi/KnKwhbLXD8B?=
 =?us-ascii?Q?WSMkL6XjiEz4W6oeG7LJvdWC4q3mfzvUaCK/DIqb8o4ood674Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?azl68bmO/YPA6s3z5/S5x+Z4wA2pXc/cCq2tAxVRsrF7j/k1U8FrjEw4KsBi?=
 =?us-ascii?Q?ENNRUhcUmYM75kkNXwJodVjDQtOsO9VMyIzg4CjlqswK4GS/zSNrZeQ+CKnu?=
 =?us-ascii?Q?XZbdXOZJcaGswHOIbKFCQ7MyYGdtipHKRc6T1sWUyUn/x/zGDkoKb4XPt4YC?=
 =?us-ascii?Q?IsO5SqUKiinUJ+9LwYscOo1Dl0JNOtz+p1rTDgNpPsyW+gkCRICF9fSMUHO1?=
 =?us-ascii?Q?L7iv7v/EtIt7aVHNrmhJWuuqAUYRl3/nJD+uExsGG55WbmfceX7gEH/C+YXp?=
 =?us-ascii?Q?vvsDkLYPjJOxudFubItvv3U0WStc1gOu7O2tKz6z5NuwVYgSDcA0/uPrtuB8?=
 =?us-ascii?Q?MeiG8pmg2WqjlMOfX6IPHHpmMFi4EVYGfloQTF7ZSpPT6QZmZkcI5+BSrMrH?=
 =?us-ascii?Q?Qby0aM41BxKgx0Q40krjZEGk3zv6BbCOSt/to70eZNJpusWTbIldG/At9D5/?=
 =?us-ascii?Q?/EtdMSUrENrEt3Ii1uWPBf66jJZuSeGAcA3Bmu8a81FSbVnu2h7rgH5QslrS?=
 =?us-ascii?Q?4KRuCIF87K1VwnQE1JkBpUIkmRQ5IwBIb31U7X3iRZodBgbvAO4k5OFNMAin?=
 =?us-ascii?Q?cqBPsjPrtQi6RdhIG/beoqmnBRueV8GSuq83h8Cd5YnP24G2H9kfp/d/7I0d?=
 =?us-ascii?Q?ldYLh+uEBGaPwjMAeLfv93rSDqRPFiC0RdTLhUNyVAVKaXUPo/zcxx3kTEe6?=
 =?us-ascii?Q?lUZh17VDVWvWYYY/cZMZj19SmmGkdD3LVBE0kz1OD/DqKHRLr1u+qaEZef58?=
 =?us-ascii?Q?nOn/64Z3z47fnLhaoARRWFNw3uvHSr+b8ICEm/1zj1bp4Q+6nOWSoLh0+KLV?=
 =?us-ascii?Q?XaPixSdaVWfh1p63XptgrVkgvKSS61Kt86FdWu9JTpsVmqpX+LVtw3aNqVpi?=
 =?us-ascii?Q?dNk+3MD4aI0/lsmUIoxd7/Kirda/HbwWnIJzOvO04McSLnKDlrSZBYNdeEuK?=
 =?us-ascii?Q?hKHEWfbG34eLrvSYiwQ3aZEL5op3tIGnP6xngoVeDRh19oGNuiC6Q5HixlGI?=
 =?us-ascii?Q?RsKS8FVEYguWYSX64ggwCwcJqtCyeXPmHIbI1u6D5x9nJERzdkMw/5RzM8H4?=
 =?us-ascii?Q?pyU7XbjHpFrQ+Fb37FuSxe40RS+lJS7gXE+KZyydAFp6fOyDBNbn5Otc8p6e?=
 =?us-ascii?Q?/5S8Bx+P4q4tjkCbLLR3lntZULWrSyq4EBOlt+P3VPtbO1x3F+1Pz07V2qLQ?=
 =?us-ascii?Q?t21S6DoqvgmnD9xDNI2IxBQ4rjrLAYUkS/lsXSNuIH9cai+nkwdOZ+aw8M5n?=
 =?us-ascii?Q?+OWbYVqEF/jjXikuGNvVClNrdGJ3er3bxqOURedicxOcWjKrcQ32xt63jTV3?=
 =?us-ascii?Q?zv/46Xt2fvbroNJqy7P24HALQphR8jkItVtcSnCmGkCzUNSHjJyW5KyZVtxm?=
 =?us-ascii?Q?nwAwpYiQiJK9jckfutqbse7ka9dfcjl7xPYDUvWLI2NCBYxpnMI6BARhBbMn?=
 =?us-ascii?Q?BehDs7E8yZVxztRGJgJqqlT8D6tv0OBNGUbD234QacnhgdVCjUv5JSgqceGP?=
 =?us-ascii?Q?CB/kYjURoWRr9dFLqWkXo8WtxWnWdiFTqJVzPmJzPABizmXSX9G2ZozX7B5w?=
 =?us-ascii?Q?FWm9y2WRv1iOt9fjTaY0Mq+9BMDS71FaKQRuAA+LdAdfgMVqIik8uvuSyTxA?=
 =?us-ascii?Q?U0sON59RUo86+gbe2Cp2/L8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e6d33a-0946-438e-a6f4-08dcb02f6690
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 00:34:41.1629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RT/TRXXVGBTt2TI2QrfJWMblChpI04GZ4CFseHx4elwbpnP7IplZqBhRV6DpzYsw6LKFchQ69ODvYXW97IwIZZNR+EocLMY2z74r1FFcTCGIO7yWlolaB/DmraM28zzG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6972
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

