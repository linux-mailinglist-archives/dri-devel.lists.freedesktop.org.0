Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4128C8889DA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B5C10E568;
	Mon, 25 Mar 2024 03:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Xa1azf2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2046.outbound.protection.outlook.com [40.107.113.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC1810E527
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUYQ0jeobfZs5UVrESeDMheVOtnwCl9BXqoRqjaVF+YTYcmGqh5OmfxxlCU/0QSSIFoY2cnYHtdk06tOCXWUBul/ijzQt3izrD9joa4qZYf4obluf2N99HJbC6Vp80E+3RPysL4tObm+pxKlsTp9F93nLOwHWF/EATWwlf1TYyjJMJQ//fiaYf7r726oNL/bo0R0uiaAVRT4Zl77CJ/j+KCHd4HenAn5ih076/9ymxLx8bi7wjWUI7hjzji2fj/xnO1dW/WnnvNBCA1jKVReNy8fpXhV50XS3hrZcc9a0AmUb90AphW6gU1dt5hoOb1Lcps7U2PlMBxpSjTzrWKMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ3Z6pkpdda/NvTaJ8LOn71kWjDlB4wYtAhi3wOOa1g=;
 b=WjldklFKdIFJnPz1JsTaG2CHOw0+NTw8ckFI6eOWZvSXATU/rYo8F9L3/k6wbbLul1k6DrWDy6gu5RrTh0BnC32pPEG4K+6wccuBNVWKweLBNrkwqJ2RVgM+Hql3yM8QxlUUh6fF41ylxYJ3eYlfgWCqvSAbQCKxbbBFDTqfjfyhWDTk13eR5axswSt5cUSJq4C/UATpPZzh861d2UbhmIPONpzmLdJGZzKo8EXYlPdoeB94fAYcW4FyD0nUBdE6R8DezKqVJAtAC43haqHngu8sYGJ7XmnejIZQPRMCRjCBtb5QPMTBMwzAXx36slyLTeb+9W+SE7TB8NCKfZiBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ3Z6pkpdda/NvTaJ8LOn71kWjDlB4wYtAhi3wOOa1g=;
 b=Xa1azf2oqg/1XLePzkoIfHlLRaNH1XgNFHl3gSUiW2eBSj67qfwAonCRpkJR+uJeOL7io8hMVhzgnxQR7YzxhqX5tAo8uoyQmI99W6xFGemOQU7s+1GZtv23VMWmtPv7yJ5JoVb8fFPaFycdFiaTxkxCHUSSo/u5cPRUABDdFD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:27 +0000
Message-ID: <87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
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
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/8] media: platform: ti: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:27 +0000
X-ClientProxiedBy: TY2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:404:56::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6e4012-e9c5-4a37-8b7c-08dc4c786c55
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHqMNwCH4lOMtbFBBA45uL54ReSAackSm7FPe2Ax72QcAlKwlZaXztbx+Q51TSJk/O4KUrOHifOReFloSm7vieIpqLT7XSa+BPOO/JvjPYka+yHlpWRR/+evKKne0Hk0fFFnVX5o00flcwsNqxDJO1UWLvX2jyjsG/MoOLyMfa109MIxiTnm0zFWDAerJIWiBVW0G8yrTAVQTqflPIDL7ftt/lcKTgHoH3v16kyTSErQMz29a4u0ltRxmX+diW9GTMIQYayMXJDFTG3g/ZM1wnZJOphzD6aQ/iS38Y6FSenTmvZOTj6lrlYFLWg7J734ZI5bTPoXH0vFEVJcdk8M05hvtG8/bmZd7ayeQgCQ8vip5WuxYaWQHWI1IuKDTV592U1ClYZEtKM77hglaROz683xWLF4BsQVHRm1O6AkgOtsVLGwZayOBmhQNxgg7cZjG+QaY/JWTcENO2y6V+EC1q8LlZY2PaiUil3bhjm7Y/NA8Jej+3IyezvmKXlXV8P5US42A3YUVQAV4mD6+90ZYLhtZd7DvEqJXNTQ59yCS/yq6qqjOpON6m3pIpYvpsJ6hR6w2G8twx+j51DxzHpKEnGb+A8pE8c+S5pFTCPEOO24zMZg15cZ4z0PwkqaLmBJgjNl4jb6QRliQECfZrgV860wnD9c8YO4gs2fsQ8Dhzz8NZpy+a6g1tEa4VvxOjdKsJkDtFf/j8ei0G/nXWRuhF4exd/5NJvIqhFlSn3kz+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HKclmJDd9tXwHbWk39VvqaMpcjKPE8gJ+lThaliMgq1hGwPeO7vCzJwdSeAv?=
 =?us-ascii?Q?8DyReu3tEuxT0vB8lXwhdjQZF8n9yC9+lyxEMnGbmObyivbgLdZ2WUN2w7F2?=
 =?us-ascii?Q?F1A6vgKLNRqOvhEc5kfNuUZX9z4Msm8/Rz4UKcBkTiCc/dH0srlg9chkB9zI?=
 =?us-ascii?Q?/Ky9CSUPhGBWHonPF1edcO4f/WD4Uu5o6Qs0VRuc0z2Ay2QBLPN6Och1HZmK?=
 =?us-ascii?Q?3rB9MfDR0fTSDY9ks7eQJhyTvpD54GwAjFDtSRgHEnEXQq/FjSqYt5+jwjA2?=
 =?us-ascii?Q?8SSiye8x27TDJ4WVmPV75vWaXAU3sTSI9w3A2dCD5pH8a2+cYEtfCN/dDhGd?=
 =?us-ascii?Q?YjLwADHqbI/Myj6iYl9zifwAlb9nNo/YuC4XOiQM3sFn1CSz75Q8ChMLOgNp?=
 =?us-ascii?Q?FQcGIi+OFkfx7OKhs0iulszcvRJA+VgYxudErdmytmkIBr7TMo/k6NZCMsY+?=
 =?us-ascii?Q?Tt6SwLjJAELebXm21cKGla5oVns/MtRcN7gMQpLACct4k24oxk1S5XtCOf6W?=
 =?us-ascii?Q?RIx70WSjwT04GKKgGUoE5SPJnPq11NJvyRkeUJs+YLKFxhATFI3cKhJuuM+H?=
 =?us-ascii?Q?lH6nxJYXhhw5MId5VsTVe+DVamDpwxACmTJ3HXqqxSut+o4SJ0WuyoicOyHe?=
 =?us-ascii?Q?/7W/1budtpx8m/0gn2V25xy2atM6cB9leMhz+BbM50WtyIzX1nbr83rg03/9?=
 =?us-ascii?Q?2zFW7KoH/BioUBfigd4mKqOMqQi+oxr2ggyIVABsbHtCaArO+N2siWq1ayId?=
 =?us-ascii?Q?Kv8DaURtJ/WdOpdra4UxknwrLfxyRzsFIAqJnyV4vRuMAqzqiomANrShdAho?=
 =?us-ascii?Q?cPqQ9sLXxPiV9lQEZYR58QnkV+FJ0lO5DO4J+fGo5Rmc4HJwthYSzLWS2Pny?=
 =?us-ascii?Q?I5B51s9xHORhlxfdUcbmVHylFEo5oC0U4AAVBhuP5ZZDwB9StsJg76Jq0ZZ9?=
 =?us-ascii?Q?EotOSGIIGV3lG54u0HHli5YPxJFNCujD0frxzMBaVp8R6Gys5ECi8Os214ot?=
 =?us-ascii?Q?G8y+cuGEEirVCSeoaO1vHinmJOHckscdXP92kCs7A33XJcZkDkb4EtheDHIz?=
 =?us-ascii?Q?jXehoD3hpWqqXAeugLSX7pQ9qUTTZW1F7j2/ko/v4oR47P41D+2OCUo+zQT6?=
 =?us-ascii?Q?G8rKI781oapYbD9DwNGnq4bkY09n8yunrPAuYC08/pxUNysnTA4ivDG0/K3g?=
 =?us-ascii?Q?OLhB21a1F2WsE8ezsjeWmmxE7+1usvgBzWR0/4uB5m4wEQ4DZxNDajifjcob?=
 =?us-ascii?Q?ZRL7spZotWJu66ANzSixh+AeP5dJZ6h6cNmwVDvLK2+bQPbAs3pWvJmopVI5?=
 =?us-ascii?Q?TaGomAp/VoRAGNYwwOPmt68AbWf13RueZ06RdLLiouBV5mm5xyZDh/4MzQFm?=
 =?us-ascii?Q?PcMTzcpbzY66Xifb4w2f13uMMre2wRrQNHGyGXuDPXW7b0bm+IdzH6ZrKZNA?=
 =?us-ascii?Q?Lyea0uEp5G+9dWWpbcvoN2bWsxWMl/nF1TPPrRwhUPHUu/3rjTtndBha1IA4?=
 =?us-ascii?Q?xqFfIYbgK6Jf4fZupv5ifkq5cosnlqh5QbiO5zyqLJpHuMklpGhIZwxSmXDU?=
 =?us-ascii?Q?ZAwwmO+62OuqCq11/Y9tjDnvjnTmWhk1BNMN/Eo2bUlKxNCQcmNk0JJLeVhe?=
 =?us-ascii?Q?0DPe2/WaWWEYZG/7gdxEr5c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6e4012-e9c5-4a37-8b7c-08dc4c786c55
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:27.8006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4zZJ9ucScONzPhhnxsjGb6aCrrMzNt2qmNbMrtkJE9IJW4vuc6uMtcOGYQ8EdKGCtHOAatpVKTjRnlZ7KUpV2z6MtF4PEd/4jGUJTqbKvZmdB0hI60d7iGvL0l6Zz51
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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
 drivers/media/platform/ti/am437x/am437x-vpfe.c   |  8 +++-----
 drivers/media/platform/ti/davinci/vpif_capture.c | 11 +++++------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 77e12457d149..4f185a0d42b3 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2306,14 +2306,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 	if (!pdata)
 		return NULL;
 
-	for (i = 0; ; i++) {
+	for_each_endpoint_of_node(dev->of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		struct device_node *rem;
 
-		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
-		if (!endpoint)
-			break;
-
 		sdinfo = &pdata->sub_devs[i];
 		sdinfo->grp_id = 0;
 
@@ -2371,6 +2367,8 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 		of_node_put(rem);
 		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
+
+		i++;
 	}
 
 	of_node_put(endpoint);
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index c31a5566fc5a..8b7077a265e6 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1517,16 +1517,11 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 	if (!pdata->subdev_info)
 		return NULL;
 
-	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
+	for_each_endpoint_of_node(pdev->dev.of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		unsigned int flags;
 		int err;
 
-		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
-						      endpoint);
-		if (!endpoint)
-			break;
-
 		rem = of_graph_get_remote_port_parent(endpoint);
 		if (!rem) {
 			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
@@ -1577,6 +1572,10 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 			goto err_cleanup;
 
 		of_node_put(rem);
+
+		i++;
+		if (i >= VPIF_CAPTURE_NUM_CHANNELS)
+			break;
 	}
 
 done:
-- 
2.25.1

