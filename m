Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08443893672
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 02:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F0310EC56;
	Mon,  1 Apr 2024 00:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="NoG7hfbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DE610EC55
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 00:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlaXhIfgQ6YE8KeKjfskFVDS2kdOuDu8ppQEsnvXM44lRkPS9VoH/c0ZGouIIhNe/UEvhnr55CaW/Oquqb5+iwcgXvkc3nJ92fIk0xJgzT0WPLVZI4K9h1ImMZWaTywlCCgog6WtstYAKeh8f4rITHVq+4ehR7TER/bckyxAWx2/vHWLQUrCW1DpLefIcmKzA61xT/35fQJEkt5dTuf7E7E94MPLRuHoVFh8KQ6738bVcyqaNYbGr6tMNfwepp4aPlpMCtuBb6DbUUmSODd0sWDHwYavD3L64Pt7/JU7iSdc4PxHacUzRnGMxGJcO6nSpaHnLm8uPdRErxR2q7tCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWWHXH+ps4LD329Qze0LPOm8bcp19Ue9qMXFmDFvMqQ=;
 b=h+IBVDhwImVzuEefPkNHnAkDhp9GCMX6/ImYHQVdp2H+niRDVVVd8QgMLJPfU2t0cIFi3S7dSDYR+Ls2VUT5BPvPreX18z5Zc5WquspKP9d1TaxzSbBVYLIoCKoJ2tDkZQQJJXomhcHFWK+H9/5boQMHtvlAksoVmnWrDVWnZsBYnMQyGk6XI1ZBlOK+ium+7/E3l1BOQDBt8a9WDWbs20g7fsC42wCPjA0lC9pgoWb+4cuGgDD432KyreZNic7DrxKa7S2hrb9GGnoaAAanfvh3G0vcJwhABnZrTC0LKwWilqfvkQ9BvPMkLkZ46t72kGEOAXJ0wOjXK8LAuQe8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWWHXH+ps4LD329Qze0LPOm8bcp19Ue9qMXFmDFvMqQ=;
 b=NoG7hfbPmkEjtdKrFrDnSsRMVESyjIgPo150BSJLwYO/+E2khxdnDqWsIaFGRz4qouzMRQUbv6no5+5Q7uM6YvJPvucRMsl2jnc/tIPYK39LJc33rgYUxOxbrtsL3eiiN7cpcNuXlEuE2PvTc02hbz4fzx2efjyeMXk58lYHo+E=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9325.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:05:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:05:59 +0000
Message-ID: <877chiueu1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 4/8] media: platform: ti: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:05:58 +0000
X-ClientProxiedBy: TYXPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:403:a::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9325:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ua89y84TUnnhFvyPPAse0al1j0GeqPl4Wau7JCQXK3VGaEd0csgnReyd0hJOGgSp99QBhCGA2ay1G2H2HUnwTLdv7XZKXOvNm6QJvMT+sT/B9V47OBc6W/0RPrsHXAZACGD+1cWARy5Atdc0FyPOud0v61En/r2ytE2XxZoTkqkZWcRShTWvMSd8c4XYB4gbo/Nw26j1UgtM+u2zABTAw4fw87XVpIgU86RYASbHx7oDu/cso/EJMBFP70xpfOuXQFucCu/hu5hXUA1a5Nu48U1TVbINd9sdA4K31Wrq4KBe4StR4ogLPN1Q8xhT+JDYTiQm8H8zSle57cQQzqAhsQR8VhL9v5/NT5WvI6AEz3uzeWui4qkahuuAcC5q55HlUfyed9dQDsG+SLvMYketSFJTxlhIJKtvfpjgrs9MuRP+vKmKLjJrrr6sIg7hOka1MzT11xAAwUP0gd2KZUsuc5n+9rSxispUARqwR26xxLKv1pibRHZRi2xiEBon1rNuEMEKSTBgbcyxCgx/aFAQv0HNU4qze5L+uEWniWoRYSfyRQJnnSBryWjEmQao1vK2tszh77sPO1Ud6OdXjmiEf/tIEmigbJld7rHHHgZRBV0wo/1DQSqbnquoDNc20z96aIjSsMcJOuxVwHyKx0DfBnx7xGmrsYywv1oTsBnEnT4UzL2vxGZaKKKl2HWuILmiya6Sg56hgeCv8w/A1u+3anfta4bSFYEG6d1lovLOLpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Az8uJD9uruA9/v1NM8dnHrjPczmr31tln/ClHXdUTAif17MEHKqsQQM7z7m6?=
 =?us-ascii?Q?hHo2WHq4fr5ZVGREy9e6o0+SHNW5CEKsgUOTwScRJVx8u39MLB2tGuVmDh9Z?=
 =?us-ascii?Q?+KIqcR4z8EpL/urzMY+0RB0igHn+q2LK4nuZpoxW14w6fQlHH/SpGOFlhYQC?=
 =?us-ascii?Q?QXXjgxSS4X1L4mVmkx1hAhmNPWLFMou4X9IonjrCpE4uIq4DvkiyDzLWXAKH?=
 =?us-ascii?Q?1vP7FWI26vWOtSN+jZcrRKwdgUjLKqBJ1qhtYknNSLeXpHn7k/o46zbTUoZI?=
 =?us-ascii?Q?tMMSQWjbJG5w+81+UaxJTHV0YCh+HAutrmRuhGm0l/Z7duQRDfGTGk6Xh+W7?=
 =?us-ascii?Q?sL4+VwpC2Qz2MQnYyE2vTU85nF/I1QLAzwFuO7GLVAR5Del5srmHaOcuP6Ri?=
 =?us-ascii?Q?o8WkdVG2XWoC5B2PZHDORzckzN9zoIX3sdm0l8fhU8fKSPuHYiIjCHIZEPXs?=
 =?us-ascii?Q?UExzVw27iDYIMqJyjbgCkjNDT2idjIgLp8Rvx/Ml+VQIV/yMpkAzkftdXHTq?=
 =?us-ascii?Q?Dc4puQKB//hl+CrPaS1W9wCjvUIDOijjlyar3dvA46rauJ4b/MA11tarX9A4?=
 =?us-ascii?Q?OXrcR7GqbTWenzvrSkaSJ6RTOz6OvXmLn43UqjIkgB/VQZYW5tsrvUk+N8+J?=
 =?us-ascii?Q?MVx/E2mNrWLWavw0xXM4AsDiyuOZVUfRgJeasL6kU7tlbGpH2ZmxjTkdMwcw?=
 =?us-ascii?Q?QckUXbdJ6VEFyIB8Yl75YyZJvyGM/i0BASnrlg2MuiXhrrvcs5JyD2TeCxYK?=
 =?us-ascii?Q?QEjuoqQZAjxUkjWnSJUZz4dN+aU0D9E64iy38tGl3tQZPXjCWUOsMWzthyhq?=
 =?us-ascii?Q?/K8l/WSWNmyK3/kXxdtpgfGT4GOXaZfJLrBv1R9IHyrntQsPkCkbMsi7DEyI?=
 =?us-ascii?Q?BvIROSJmtqVe5EbaeHf+AljyfV+jcDZnDfaCMpqdzmhSToj67vAuw6BFsqFB?=
 =?us-ascii?Q?9WEx+fiUccv8mzC7tMj808TrUCIcYz/fVrXILEs8lr1XX1xmeLzVbLKjSUW0?=
 =?us-ascii?Q?FyAv62Nx6cgB6UJ1FayheKZnTpwNtXDA1Xg885ICitrEkchihecUINNBNwVr?=
 =?us-ascii?Q?4ODPhzQoPYytQzparCSWHFlswhbiwPsPbk1SS+AEMzYWFMOysHo2lmeHZFoy?=
 =?us-ascii?Q?N1GIIMkEZZBknYMVH2Y/LIWND6rXFGxZFYrmj+H1NzHDJyYCCisbCwnnpJv0?=
 =?us-ascii?Q?N1wApKgMwzz22ji33Ns9+KgqK6NK799Y+BKdBpteHk7VbBTS9Rh32jEvklIR?=
 =?us-ascii?Q?mrg24GZ+OrIrQSFYCwYmKZ+293wFcLFmbBCr/ZpZ9NgCIqw3GrZM+ljXoeIN?=
 =?us-ascii?Q?ZKmZyeiytjj+/XDs7RUYh4dE57fIG5UACrcumfdfjd0WFTMckmJh0DqS/PP1?=
 =?us-ascii?Q?6pRYFZKBvyQgs/BhQ3V6gZGfIGTrAZMzpNlg6nkSzLLBR1DvCn8b0t2ZDsK0?=
 =?us-ascii?Q?1aMATM7Kf+4wGWRK0kM2ify2uVttCty7YcEHi9oWY0QRka6He4E+fzzwN/fJ?=
 =?us-ascii?Q?XxPeuddNzKvUhr3/yPijitFkC3V09LgyV4UNO8+RCgDyRK0cQwXyYxroulty?=
 =?us-ascii?Q?p66HVKILnhiHd/kZZP+3kPvd/rybcjHZA46CVWK8yQHU5r5sIdS6Lxct+tqX?=
 =?us-ascii?Q?TZgl4+iFIzRtVYD8onBMjmI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a175d777-f1b3-4e94-e695-08dc51df82a5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:05:59.2597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtu4pNUQeOomlrmqQrjmSzDAZ0RcPMBte31cLGk4RleQGBj5EGBjHMUnyqWe7bnUbCRpsj0w1+EtKaWfEPEH87jUDwXE25qY5s5yp317GG9s1hAXXPenc5KFKHrsCvWm
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
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
 drivers/media/platform/ti/davinci/vpif_capture.c | 12 ++++++------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 77e12457d149..009ff68a2b43 100644
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
index c31a5566fc5a..3db4e82c8a80 100644
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
2.25.1

