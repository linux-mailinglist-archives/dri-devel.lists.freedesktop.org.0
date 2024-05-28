Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0013B8D2907
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD185112566;
	Tue, 28 May 2024 23:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="FOyPAPAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2083.outbound.protection.outlook.com [40.107.114.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9E11223E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:55:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRpnrPu4inCjci6T2Ogp3EwK66w1xlb7LA3ABT+5v4VfUQGYEAvPWANMISvHLafHupBBWE4pVkP4/OM9PyF91KiB6lGSWy0VdgqEWA3bHGCX0tTTZM3N4IaWfmQG1YkDJDyszR69rODybZn2xjXnsPNlxuQSgoWaKf7WPId9r2N3yrgnxiEWiz/CX9agZKJjhECiqbccXGd+Na0z9zJFf4EKRlzh+I2w2UxzXBG/hqsbUtpIw/2arF5bbjon9Br4dv7MU50llV0hAdbVOX9KOl/YIlIKlh//kf/t/flqxZN0xRsLonU04D30+yXIkJSgAylpB0sTEmistRaD4VWtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKyIcOtJvLvD7O2LiyJI/N2rAEc2ca7YgJ2t0jkn4VY=;
 b=eqWxQ3qZdSSTiHRdjZcToiBRC7L7ZhX28BISOMzcr1A+X+gTxSL3F2Uf/hcfkMHFvXmlIam/pU3xhTRq4Can4bEDnU9CStEYSlerssiDd3dWOkcPAnEheyMFvP3hmlx544c+E2OHia9wWJ1ZO8qhO8eLKVqo7L7A9dKbsV9+6WP9eQUQNn+yzvFx0tgRkOW1aBmRZQPBJOcyc14KAkAA+HpK3r+pNbQYkdc1bkoBwIavKDl3AoX9UW6oSLjn+FYPTB9Cj4hkpS50mxGlwSzMVAJb3XPVuHQdaTo4olm8hFJCTAw3AEj4CphY6ypwTDrHSo6faTACZIqsJCAiRezFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKyIcOtJvLvD7O2LiyJI/N2rAEc2ca7YgJ2t0jkn4VY=;
 b=FOyPAPAh9w5iXQZlm4bbePLonUTP5yMiqUQod4e4S613YT9kjpdPFuIJdCXf9dUbbiO9eT0j4NQ77P+HsVosiCcSZNpGgrZOLi6tcSncTN3HqHXTWhamLuenl6iEseD0zKGyrpByYhVVTCtvi/lXax2pRXUMTI9w8nLY3H/eMrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:42 +0000
Message-ID: <87cyp54hky.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 4/8] media: platform: ti: use
 for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:42 +0000
X-ClientProxiedBy: TYCP286CA0361.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd31a92-56f4-456d-47d9-08dc7f71af0b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?arCV/Sfamf0olJt7SjwaysRzKtPvX8vRoXP+uViIA4Yw78kCutq/BJ16NSXI?=
 =?us-ascii?Q?z2XSpPeDsp8ZNiakqtpHelBcuvS8U8cWVVmmUHNx0tixDdBUNnndt13eJ/Zr?=
 =?us-ascii?Q?jyET/zIcg6OFLJr1jHxEmw/ltB9R6ilAZoMhrY2azXzVYzsMStvDyTxSQb27?=
 =?us-ascii?Q?Q7aa9m6OT8oEJGAXfqvqWPrcIzJfDzYEG3RPFtAPmnt8gc9z98u324irICYA?=
 =?us-ascii?Q?aHvU5LbrW/JdrlqU4PRIv43Fg3f8oGnAClOeM3Zw1t6BijwQhjroXGdk6b7f?=
 =?us-ascii?Q?gM3NK93zPSpZTf6ByFaA15nmqRmYHeXYFYh6dRDHJpWhlfyN8JZpP7RV8VNi?=
 =?us-ascii?Q?04Xl5L6vFnoYX7W9VtqnA3VC3/+TFbzbbSKK7GwgauZpVENLj1vV2lmokQ0t?=
 =?us-ascii?Q?GUKri+5tiYrtuksIsJO8k/bmp32TZJFGIyNd/qSnR3onQ8tK9vc1JO9E2Xml?=
 =?us-ascii?Q?NRsfMsjxEENSKi25/UeDLBNTvGUsRcZg9PuyS/HeRxrDxonNFDaueAYsdD6z?=
 =?us-ascii?Q?nlyel2G8To0q817u1yzykCZ3aKSeI0VTPoD4kX2eVdY4n9NpvHM0YGMFfgqW?=
 =?us-ascii?Q?Lkc7B3bw1O7pPHij4SmrK+w0t5dMmAPK+l89uKfNlMhsMFHk1bE9Rgeu9hPE?=
 =?us-ascii?Q?2dmoTzFSV1Ml0LXWEMY3Wfm5WQmgezJEWpcvmM+ROFrkSolMqfmSwTLQbS3K?=
 =?us-ascii?Q?5zRZSKrctDakKTLGV56svI/5lnVdkcXheATn0jgMkVubxGXg83VLI6KPSwaY?=
 =?us-ascii?Q?GfQHyPzqxCdoVTkltTBdPPHEDefeRQaItFQyxFMWTSP+vlHjKPlJaIbVaJQ6?=
 =?us-ascii?Q?5vqd0XmiBRKuXn/Rd50jTyRolTno+U2pADQHkCBUnglitVKrPnatd6SS0Mo/?=
 =?us-ascii?Q?SfP4ioJrelyX0q9DQQHgGOqS3MA/UqrLCZ0R0u+rAfsgJGeryBrG4J1zPxXK?=
 =?us-ascii?Q?NfTt9Anq8mTkAxds3ELaGpIOy8i5o/evXXLN6dWJnC46QUY2P9DG17fWn1Dq?=
 =?us-ascii?Q?inaNUQ03Z+T9LFOpRn/QY5DFrRkXIg5G+g56Dlj93MXXBNAivekv6Pfap4e4?=
 =?us-ascii?Q?ushIOjSLo+Fa2dAgL7v31+yETb2gDgVkaRlGvsN6LYjRE/OlGKJWeVFtCzUK?=
 =?us-ascii?Q?VGdqOve3ifHdXatkcTjisqs1A6Rfd9zEIuZjL6310IHkR+AiK2PzjmQZN9F8?=
 =?us-ascii?Q?KmeIHy7xsquWUItKTDUhMmHLPhF2Tu97ngMWU+hmI9YbNto5TdEUOvn4xSYb?=
 =?us-ascii?Q?vp9ZgjlyDoy3WUIDmdcMFYbIJEvgQ7nPGZMLRZen5M3/JOEvWDCLb4pvsh2w?=
 =?us-ascii?Q?KkpS21ioi8ozUoEtNqU2jkxL46fzTuiwOkXLJ6Va57ykAreaeJqbf+jJv+eY?=
 =?us-ascii?Q?3Ymd+w0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnMdrcfIiPiBGzwcZOAPOw/27ZFggXPa8Fi3TZyNHUwXUUdeUENvYc7GTpWg?=
 =?us-ascii?Q?39FWmaRC1Kv/lWgQpiL0YI2Gi3ABCv11qMjNayb9U7xJs8JEKhk0JhKdqjCc?=
 =?us-ascii?Q?PuYOTVEH3eyvbsc6YVvndwdlfXyTXYoQVZ/WzKVZPHlpHVqQETPmZMpj3uz4?=
 =?us-ascii?Q?yMzggy1x6xb93QBAW5TyVSjJDuJsFU99ut92ANI1RIoXvpboSjpKd2H/6I1B?=
 =?us-ascii?Q?UYAECg76Z1kx/tlaJ0dHJR2uH9Ypb/otuwFnUlHYZHXFk05nymsM1vLk6eA8?=
 =?us-ascii?Q?QcjrrA1bwImwndwz3uSWNKzbZpHTwGZ/StnrHK/EN/qe8/C4OjMCNdftPmuA?=
 =?us-ascii?Q?oLTg8qTh8ME3CqZPMF17fDIw5zebmF08UeNOTEIhwgJENALsHuyt48vLFe8Y?=
 =?us-ascii?Q?LoyVm0LTizT/zSYUIrf8zv3g9JRsmD49pwqc0A752ow3BT3XKE6zEOkWi3nv?=
 =?us-ascii?Q?Ndmr71sCFeIR+UPij+DvLvoSnwTm5FUOTEO91eU7afCXYIIIKd0KZIT+0HRI?=
 =?us-ascii?Q?cfrn2GAJTmrg4MEvUKIKX0yr1bwUEDaN+me+qrRVdfwliVvADTPixQF9MwUx?=
 =?us-ascii?Q?bc0LbSJtGaSiLnWBawLanPFjG4l4yEyaAOt1MeiBO92/cc12x+5E5lJ/kowG?=
 =?us-ascii?Q?nxpjZdJJVcAdsMATd5mNqTvION0+yszwIFqbcGLpXUg6DjjoGjVnV2nubc+5?=
 =?us-ascii?Q?YJ2iJCYEq8FE34QZKozh5Th1nuOOjQ04uZ9BzBayDabcYmmcyvPtDZTnXql0?=
 =?us-ascii?Q?q7w0xWPHUWW51rPRZtcPCih7bjmvF/mb191rJBCfvpakw+awa9RLHVKhAVGa?=
 =?us-ascii?Q?L3JOCdRjBJKkdbDAB5iXs2PjCyw/xHmUMOhMOVSMUF8xG0hRXAJsowprHt9/?=
 =?us-ascii?Q?BOqa3Gav4n/33rnEoE3wbrOW1vPfBWHqBmYLVTSynhYy6vHzaIG524E6i355?=
 =?us-ascii?Q?GJmhXooKDM0QRMFhAXQDM3f92etmL5skb3JJWB5DCScXJRxF03o08fJQ4gJU?=
 =?us-ascii?Q?TOINYG2ildzm6ha5Gz4AE91Cm4TGl6O6S8GADTim+MnK+3F3vvBj+puSJ2va?=
 =?us-ascii?Q?xkfRVo9LkN0d0T3ZhGZo+v8Iw8rrzzXTcT7uQUgOvBpeBroU5OmISD6U3WUL?=
 =?us-ascii?Q?uR0KsPKmATrzYLXYBfLuSAMljZ2ufhHPcM3YrUDPSiSUW+n6mQocUyT7A0Zz?=
 =?us-ascii?Q?bmupJkVVuMoDZUfePkZxZn1ORpNEeFCfPwgD5n1WmxfQhe55BMQ+ip7OSFqq?=
 =?us-ascii?Q?QG507qYZgFYRkTG84MGnmCZKtD+3S6V+mAisLEB4u0AQFXJ2a4/zPSkwkBjR?=
 =?us-ascii?Q?B4N0Ml81OK/jVFxH1PBnBADfclcQgK7UCEB51odHbCy+hdqw1ickCzdEdYOc?=
 =?us-ascii?Q?kPvJ+sjKHMw5YR5T5REDVwNsS+eHbkLaedLbAW2NrtHxjVB4VjE/mrDf9l4X?=
 =?us-ascii?Q?V32geskXCQJ5BzjBwjQxFlKrsM6tmwjlCfvJJ2PS38IPCDXuwFUp0AH/BW0Y?=
 =?us-ascii?Q?pM33GrmFG06Ej0+XsQXw80BfAu/a2IuPxOcFC4GRj9GY2CPIgd3wR75mosb4?=
 =?us-ascii?Q?A4jBYd1MjszvRtK9/6wC2I0eOL85j4CVIS3X+Evs6WdhklbPYejbcz7rtsEY?=
 =?us-ascii?Q?D1KoNU4yzQ2yMdY5n/saS9g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd31a92-56f4-456d-47d9-08dc7f71af0b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:42.5664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Z0CyN1IR5Xf0P1Glpea6BeJcvBQNOtzwMrnZ4ymb1AQWybI3qjsFIIrGuAsb7wvYaDWWBefb2bspWCetm/26va+yQ+TBxcEZNE6yrEqEm9YwbhDMSEWZmWjfNAFioAc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
 drivers/media/platform/ti/davinci/vpif_capture.c | 12 ++++++------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 77e12457d1495..009ff68a2b43c 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2287,7 +2287,7 @@ static const struct v4l2_async_notifier_operations vpfe_async_ops = {
 static struct vpfe_config *
 vpfe_get_pdata(struct vpfe_device *vpfe)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device *dev = vpfe->pdev;
 	struct vpfe_subdev_info *sdinfo;
 	struct vpfe_config *pdata;
@@ -2306,14 +2306,11 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 	if (!pdata)
 		return NULL;
 
-	for (i = 0; ; i++) {
+	i = 0;
+	for_each_endpoint_of_node(dev->of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		struct device_node *rem;
 
-		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
-		if (!endpoint)
-			break;
-
 		sdinfo = &pdata->sub_devs[i];
 		sdinfo->grp_id = 0;
 
@@ -2371,9 +2368,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 		of_node_put(rem);
 		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
+
+		i++;
 	}
 
-	of_node_put(endpoint);
 	return pdata;
 
 cleanup:
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index c28794b6677b7..078ae11cd0787 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1517,16 +1517,12 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 	if (!pdata->subdev_info)
 		return NULL;
 
-	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
+	i = 0;
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
@@ -1577,6 +1573,10 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 			goto err_cleanup;
 
 		of_node_put(rem);
+
+		i++;
+		if (i >= VPIF_CAPTURE_NUM_CHANNELS)
+			break;
 	}
 
 done:
-- 
2.43.0

