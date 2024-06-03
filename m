Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546678D7998
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 03:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202410E11F;
	Mon,  3 Jun 2024 01:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="bIGdRHVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.229.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C33710E11F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 01:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlWgR2KoIHNAUEPBx8KlFry5ocP85uKofhazMNZOJzTYTu1HE+/Dt570hGrK7ZBWDzCOuxFh6s/jK9cOqioT0iwkTPe0nOBJSgUbyhy8CsS6vkBE8nWFakYi2sMSqzzae4/bafzAg9+jAN1XuayJ+hBAxdLqeLjWWp64545xe4NFTfzrvycvJ9x2yjHr0/ufh9cr30jVtnuU7xz3LwaKaaUYoM4t0hwusTpn2Yx90EbO+p/gaMu9IyIIxOk8vBRbew47BC1uEi6z8Q53WzZP08ec2loX53g+JTW1smB34mUmC/H4HdWaROxFTNyVW6m3Z6aCGNfX8JVoz0TcSYHNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjGsaR1b+XxwTO9Q3/woPdYTEnq443MXMgIOL4ktaTs=;
 b=d1XAq08ISdOW38VfG2QJBU68y6+TAYl2GWWASEHRMS/BwfFRj2sskYXHejlDpUwgtJIU1nJZm4MYIptvWiOWq+fja0bzBCwKnn5fJ50ZnAnwpaaP3qh+4gjP5xQm+IXlK8O+pt7Bza2cvnfuGdQDf0w9tX0h3el9aGxWXVPjpHm0GwjZcapY89dFs5sd65Jas/BqaKJA5mrHzg3VY8jvEFzeORtQfUPYI1qbj0NPRJR7RcFnDdoWqE5KZTDiLPN/r8+mPTUSNrRKujGLM5cr+krnrFeOFNBJF0UIFr8Apv3p4r1zsRdatln5trxzKPbxA7wxFnc/f1OAuN1typmD/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjGsaR1b+XxwTO9Q3/woPdYTEnq443MXMgIOL4ktaTs=;
 b=bIGdRHVy0VP17I5SmRn71A31lHTLvNU20TNFkVKDxLsIsvVeP7ZC5GsqaM9T5SST3tW4qEFMpAfmpsKTxK/q3ESqjTWHJZ2R+EZ1vWqkdNEl/QW91VJdP2j7GdG+DW6VaI4k73/g0ZWve13TZtbOyYr63QerICcGQsDNwAzsiKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11318.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 01:18:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:27 +0000
Message-ID: <87o78i4ye4.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v4 5/9] media: platform: ti: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:27 +0000
X-ClientProxiedBy: TYBP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f848c52-896c-44bf-3d05-08dc836b1284
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qkLEfFSY+xY2W2+Kjn9NnAlnAGaap1fK5IiRENou7SA77SK1i+TnkFzsDOdT?=
 =?us-ascii?Q?rGIe16+42RtDl42iAz+Rw4iGkyYu49Ys8yl2kL6tvC0R6/wAE/jzcnPYMvFW?=
 =?us-ascii?Q?kWG4tzQCNouPQ/MwZlnozloGaPr0UilMW33A/qy2J/5+50H/bcbgIedduShS?=
 =?us-ascii?Q?RHrceUF2Z0/lN5TVwd+OSKObtNlDLZYsMQaGzdWNk8ZuNz12LY+Y8WTi6zQO?=
 =?us-ascii?Q?ia/IKs30SKBrLTaoZLK/iWzykdAqcWw8sMa3BC3lJCskLX/1kfWI6woNQawI?=
 =?us-ascii?Q?aaWKncRcmJOZzcApRgPaSWPgWtf38ETvRO79+RqTzfjtu7u4eQOYAMLLjve0?=
 =?us-ascii?Q?4F1+dOIm5gygrDFmDU8XOU3kdCkLT9dRIwCetn+4mtigE9pG/sEV9Zs0iWaq?=
 =?us-ascii?Q?j/6EsVnZXZXmFoMG9C7osc0WRTt/X4s3NCPZvbjy1nDqDnwYMfmLBShzgB21?=
 =?us-ascii?Q?xLbSMbRlLexRyDwAb7w2o4BAEunJwoFTFPCn4yy4FwoUaKL9frCV+yFl8bFf?=
 =?us-ascii?Q?rdV2gP93DTp5SA9voUlb753zWA2WkS1EGU9RRwbybr78gAjOdItODuW/GzBt?=
 =?us-ascii?Q?dEDix+pY3GgRD/Bk/mZhg9Vz6IrJQWewEBL82qN9V0i0JJsXYCmn24pDNjON?=
 =?us-ascii?Q?0eEbcFVGWw/v8iEjzcTBJynYAvYp9xmtGqlO1LZNv74VrJfJJZE4RFuLdg/P?=
 =?us-ascii?Q?sXniN38raCFrJKzQSh2cJ5RTnwTt2GtfmlG/Pfi3UfwvtZjEDda15yY0vz1R?=
 =?us-ascii?Q?drHschLVN1gfLFDfmTdxdf3QIfmDkhaj7G2SB6JS9Oa5DhLyj7UPxxR1uToR?=
 =?us-ascii?Q?ui2Z90mfKPxofLqLGNPwsj+E6BcxtmupTEXN6/tGcnjmMW7v9RS0+qq6Odnh?=
 =?us-ascii?Q?s6tPhkH3vj/voSYs4g3DzNukRl9CKrcJ1eGIz5KkfajN0Vzv+0ZOZVQy1t85?=
 =?us-ascii?Q?CkRNvdynqkOQKoetDMN7Qcb7Ig5bvra9ftb6l4CoJsA26Q7jbjcidEvTYOoE?=
 =?us-ascii?Q?mFEYelQdBBYvovw+fcn3+RoKWICYkvFaf37FaQc6VNgCcpbyzKOQHSY6bznD?=
 =?us-ascii?Q?N9uQ/pHMRojYAm406H8czfvcWwwApujIp7kJ5kCFAshOTo/y2N3Oe50EkszV?=
 =?us-ascii?Q?MpmR0LQWxi2U0eEAFq9OgZd00gRJKk/lQmg7Cm9gyN7klUHPauvSQg2ZGNLC?=
 =?us-ascii?Q?RlogQtfn8I0oaPpUXjKQw6sfSplKTMVykPJTxSQspZfVqxY5wNELFsO6pSes?=
 =?us-ascii?Q?H9nbntJA5wfgRcPMVxB+ueypfu2r+KM6jbIKCS2ZcHN4DAQMmMRBEzEt47/h?=
 =?us-ascii?Q?hT9HRJUewkTKwTcsRbwSkQnfeXPczZjk1v4MRkN4ZY4cQz1BOkVP1dH1mzSP?=
 =?us-ascii?Q?yamhCYY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+XVNs5R3wU9g3O6YUafrqLl+MBYUKjJbQBgLn1lLLd9QwucLOMV9rcb+cwrA?=
 =?us-ascii?Q?ld2Ikd4ZqQWJjx22wmhbMZqWmX6T1B0+LmW8BH6kXboNV125hL+jdEqJkr8j?=
 =?us-ascii?Q?Hf3ne3f4JCBl0j2P6H9QlNd761gfi19Zfa5rTii5W7tGrba1x61mjNqacrCG?=
 =?us-ascii?Q?v7n0uXpB6elZ3dHYHnvUz+CdXBnB/iakHtJBqDe/cetxKJxwV8QvCH60q6wy?=
 =?us-ascii?Q?C0IvNTMNigb6YFwzWTmDUDF7bWlekfiPWlkUsWIz/H8GHqB4F+QlRi+IPoiL?=
 =?us-ascii?Q?42Y1OoX3WSM1+rJzQv2m8s+8Y5uXwCY7Ii4d6ToalO2tmJdDW4AzrnbaLu8O?=
 =?us-ascii?Q?b/1BClNXuScrOc6uN9v27K8mqf7Wb8YWAvNBk1jiNQWsGli91rXWnXkzipcI?=
 =?us-ascii?Q?tvrjgUJJXfitPPGmGJMFdihC2eXlpAUWY5bBh/Im9YU95YqTvhI0ZrrrErmC?=
 =?us-ascii?Q?xPwsIISjKAL4sbBFiW72wR6twopMDyxiUbZjYRKUk2lzlGbWCxIHWaow0gAX?=
 =?us-ascii?Q?lkP+uwLyy5tPyoeH2N+LiVZiWUO4+tM55UqrK1kptWt5Id4NP95U9Ag+psfb?=
 =?us-ascii?Q?BkP8q/9XhwWTzmjwzqSaulPXGHPi4bD9p83isGFnlcqUBSLyjoUMuCee5rYK?=
 =?us-ascii?Q?AX9/ZSFhzCezoPcoEvDHg6+ACIDKvk6FWambXWR1X+/3TvWJag6hiukmXtja?=
 =?us-ascii?Q?Ia5biYPQSTxSr01xku7xAGCP/U8pqKyKzE94OBO5VF8Rll5rM7Ts696kInNp?=
 =?us-ascii?Q?OzXQfWglxtFUUIAg9cEL1Q4/S61AtTcBomH1Axu/iqSiVA5eY1FyQSZcmnPY?=
 =?us-ascii?Q?W5dj3PCYD0wTEhYrWT5jhTwieBkVAB/WRD/ky5vVwZnc1YjmH/WkFu8cOvmS?=
 =?us-ascii?Q?tdlu5Es2KgHLDOKbjqnF31hPat8IqKxA8Pw4zUw0GTNo5y3/tpxyVwfHfilH?=
 =?us-ascii?Q?SXreZfsPdXIuFhxDUQtTk8VSM02wJXaLWqUiYMFR3Zwej890ZORDacSvkrXQ?=
 =?us-ascii?Q?mElDdnMJvqGP9sqZe6xsSqFuVvAejMAukhn9ZGJb9JDCGB+Yv5RV0pRUvrgj?=
 =?us-ascii?Q?yzPsyqDUjG7h64JTMRuHj65s//lMljRqyasb7+GB1N08V8+PglS5I+a7X+AB?=
 =?us-ascii?Q?I4IT5OA96mUknJP2L1XZgNr8+udGYRVUf8Er9pHk6tpUR+Pr7nrHCKVW2HhJ?=
 =?us-ascii?Q?pWoEg6Y3Wkwdpv7NigXHMpjb0Yk1eWwCyHqHAiUkjDM9gQ6nNipte1rh5nNx?=
 =?us-ascii?Q?81GCaoHPLbVTD1mhxrDpjpK5e59knpG2B1B3BI2ZuLu9ty28vtrWbpN4hdbl?=
 =?us-ascii?Q?+YhFaQe24CiBKVAxDb7W5mYTxaFpGay06UnzDAlUqE9TjzFxtU1I42BZL2t5?=
 =?us-ascii?Q?JjF0Ajnnb5ut8O7rTeGQOg0Si/d4Sou6Xju+CFT/r9VLTO2QOaPB7Gj5CHIm?=
 =?us-ascii?Q?2OGpDWY8o1BUsmICRZG+9VWkl18gw4eH0MmCycxGcciKt260qSbZl+nhmRpK?=
 =?us-ascii?Q?KeY3ivslx0SBSxVgrbeUSNqHUddBfyu53g/2ZF5BE+JtaOIRyUe7ggvwBdgd?=
 =?us-ascii?Q?YbIhCjBQp7JyPI5jUGID1y4NUA7mMOiFPLKtkcND3p8D/0r8ycMaCbDhJ8y8?=
 =?us-ascii?Q?nydZm7fe/3opBIvNuT6zwpI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f848c52-896c-44bf-3d05-08dc836b1284
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:27.6193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRSE8ajIxWeaFK4YAjAk/MwA/iOttnom8hwdBE0Fh4ZHrR8IsHNHKKt8MkDGmKFweBt0tLfkDMUk/epDLHr7runwPFLFQWQaL9a/6nmVnxG5wupe8YZJG9AIz2p1HlsF
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
 drivers/media/platform/ti/davinci/vpif_capture.c | 14 +++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

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
index c28794b6677b7..16326437767f8 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1487,7 +1487,7 @@ static struct vpif_capture_config *
 vpif_capture_get_pdata(struct platform_device *pdev,
 		       struct v4l2_device *v4l2_dev)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device_node *rem = NULL;
 	struct vpif_capture_config *pdata;
 	struct vpif_subdev_info *sdinfo;
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

