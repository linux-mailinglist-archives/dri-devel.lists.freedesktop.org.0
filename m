Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76290A10F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B1910E0E5;
	Mon, 17 Jun 2024 00:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="XbJzMLDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2084.outbound.protection.outlook.com [40.107.113.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576C310E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJcuDX0wh2Bz0jbgdiQY93O5lnMCBWF8XSm/oTIXJibx63kQ/Ho2Hsi3aaE5JyxpgQd/OjkxzqCnx1wKgku14KOYJCEpYYwaNHScSnl3dVqACog4jJJtVWQZCewOPFxitGKeQMSw1oVeTqbknfWmoy/XeXw+n16kt495w8kj2Lc4H1hSpj3x3AbK86KB4NlH+hclGL5kwMcJDxaOhdZtHQuiH3R4dmHbJx4a3IMnZfvg5qiPAbqAh5dOLDtfjlnP7tpkP8LiXvuLZ9rpZsCcJJhV6tZ8lCMzglSYwMG5DZZmAQ7g3KlBdwhXVqMfLTsStXdKd5N+xG1Jelc1pMxQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjGsaR1b+XxwTO9Q3/woPdYTEnq443MXMgIOL4ktaTs=;
 b=d8jaddDuFOHl/UjpYWMdK5R+yPVNo37d6zdKH92pgZAMn/FwwvAts1LwwcfaOqlymIcZ2vfKvWHssHvBEmCn8cE5XwX55aCfjYV82mu7YVUWQUSwONYOdub+GLSrUQFB11fVif21mKCtmoNp49MTttGyMc5JspLoQDbtEDnXgLJDm23BWq99h5oKsBrYvQE+5P0yYj6SHGlWc6jaCsxP32ZqfefzEXfDNsCBmTYdQsoW/cfwAeFN76qC3QFA21o0Ws7zfDblMOXqcRi6htxgqFrI9B0KAhKN+XPqvgTRLYsQ2WevHij3M1Sx+26C3Ju1afbRSVYhq3aaH3QoXjl/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjGsaR1b+XxwTO9Q3/woPdYTEnq443MXMgIOL4ktaTs=;
 b=XbJzMLDHTNLiwQ4FBodmjV1SmwaWfWdQMlAWtIR5sp8EZls0O58/FkK9rtngrVfCOJ05oiOBpqLGXxAob86d+HsHeo8jcT0+qtHRtJV/gHNIs6lbooHsFLQYtbQDc9LM5JFkihl9uKUFySG5BvQXpLviYjyqeMBpDp8BWlyltN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:59:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:59:15 +0000
Message-ID: <87o780s7tp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 5/9] media: platform: ti: use
 for_each_endpoint_of_node()
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
 linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:59:14 +0000
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: a438b9b6-1fda-4264-0c8a-08dc8e68b559
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bXu5dPBIJe05RVnrK52g8meObmDqTz+ZSVy8NVyot4qLhjKpegRVmUFLtu7c?=
 =?us-ascii?Q?ygv7zEBgpCNRr5FzAHC/x+9zW4CXxFDkwVcdjRN8SNdZBB0MbizF1W4I4dpw?=
 =?us-ascii?Q?K8Cek1164iq0REQFvWsEY39s4pYePIWVtMBpFqeBoAD/J3XJuQEuvMKmylHi?=
 =?us-ascii?Q?crmtFgkWJzXpcau9j8+oC55YJsrhYqjs/5eC1YbR2MypT53m66OVGdxUB45W?=
 =?us-ascii?Q?OZBV/X9cwCEUYwyaNGbgS8oQMxGmthL1/akX2RO0PLOhfLXihR3vm62/grq/?=
 =?us-ascii?Q?9hbPECP69df5aYfbzwJ3xDUIL8KbiZWsEBt7JX2So1wSr+G08rzw3zrTK0/7?=
 =?us-ascii?Q?KJSN/0F9CT3JG8Y1SKkMGCIjJcw5l0t3+MjlGEux13CzBnw3gmEoo2xE1l+J?=
 =?us-ascii?Q?ABXCgDYN3h4cViHpnHN2gie2KxagKUsu9Wle+BuKn6hfzPTfy8szhLcjyto/?=
 =?us-ascii?Q?Y6r6dsOqi8RYe3O564QPvs5eC3LGWZO6M563LMFUkVi9vDGXEoRXqrUKJDNG?=
 =?us-ascii?Q?xA4xeqdUfi7oxvtB3ZOR+TNXaaH++Q9Ft3K1JdTZp0ieVJM4153n7ABK6AnL?=
 =?us-ascii?Q?kaFN5RM+icuElWOsctjAufI+x2XaCUvqo23YYSztlIaAAl1Ttt1uxiCpahqu?=
 =?us-ascii?Q?6HWphiJLqL6XzNcMeHBydgo2uOzZfDuZ76oVJ5zhyziYyNjp5eZOHZeZ4iVk?=
 =?us-ascii?Q?nqrTsZrJDpd5bYgyupN1GQ41kWvBa+tLhkCTxYkfzY++2m5EvcOLYcOa6/1H?=
 =?us-ascii?Q?VsYvG5DPslJsS0XGpNthueRzPmAPv9G/QnxWIhflaBnf88ykG2HdXi6Wf5o6?=
 =?us-ascii?Q?uzLyp9f7IuAYRPOAda6Ct4EqpQxcifUgFyafFE9IApqUx/fOsrgxUzMeFge/?=
 =?us-ascii?Q?Xu0nHkIYWAS3elIUAlxqWFit8CUfJohfMrg4b54Lqhcl5MAB5MOR/iw+qLr2?=
 =?us-ascii?Q?1JpkmqTGAd4zDqOcN98r0GajALfq0nK/nC9GGw6jIy1nTquGiTiHEacgtt8y?=
 =?us-ascii?Q?P6VqpjGmd56cKnQosuZZt6g7yZOw+60n8FMMc4MzL0iDuTLOS+yq0dIhs9tO?=
 =?us-ascii?Q?D0AKzoia+B7V+dQ8oE8ikb98O2e9G+PMVZ0VPJGFQtjjgTiWwyrT6bJubGrf?=
 =?us-ascii?Q?l8eSUfAUlvhs9koA8i0P1SBLPlN+F5zFe0TIbE/WuXB8MRMk3nMJP6vSzLOy?=
 =?us-ascii?Q?tKS2aVA5pNbEgA5mh9aqNnfEciT8qY21OCgmtraQX+zV7T1QGUAkRv0jm73l?=
 =?us-ascii?Q?a4H2m615nYivuxLjpnerWEIwbqzW9Zm8YDNTKKKOkGgfFHfI5QyrTr+YhfBr?=
 =?us-ascii?Q?LltiSPMmRcFClyOJLCFNrEEbIaA4Ke4L/rOxLjV6Uxe9HMsK3nxmp2bu1kcm?=
 =?us-ascii?Q?YAT6lp7mzZObeLIwUd87ANpI1v/a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97gEvx99sWKh7v98i3mozVlAfX8uHeGOTR8mcaZhst80lniAdG7MkEauEnRB?=
 =?us-ascii?Q?+1C5t4wdM6u5MqMv38JVvG9eQfkzeWSGVWRQ1AaX1viFOgZveqe5Hr8b/msv?=
 =?us-ascii?Q?iA8WeuKzZAvoyqQUVj57735MbuHAboqP6tClHhystZWWvIAjDUsrdBiC/8p3?=
 =?us-ascii?Q?gnx+JmbDEoisaQ/poNlRd+lSqAWSjupQFhvUhD0Qd3h8WdM6eZGDZ6ZH9+wj?=
 =?us-ascii?Q?FNegC7QdpTFZ9jNYqj5Dkjz1d5hlpJe+TG/cT2MZUB97xa9qOXlXwunxI3aI?=
 =?us-ascii?Q?/C3da68ajLJPZhPpSG+GtxUCatM6PCwvQwhULIvMSFHbR8hpHzSXGAamXCoS?=
 =?us-ascii?Q?sLPfhYfTlxINC+0zFr7CmJbmq2JITfjiuvgxkstzpUQMdRyeg35mZ99rF9yv?=
 =?us-ascii?Q?vbnGpS+p9iW9W6svIfO7TkrFf8s0cnc+eCCAclbk53XX9zXvxK0/AP+XF9Qt?=
 =?us-ascii?Q?T91e6Fx7gSQw4OJBJ2JACfTFMUo2wctC1zpDnpEzaPasMBfs7WMzCOpOFYeE?=
 =?us-ascii?Q?L961Q9xnB+V8nZooMB/ovuY+vN35sbuxXqc8aoTbG/UU+e1QG4Bgm7I86SPA?=
 =?us-ascii?Q?ERenyeUgxA4+iUT4z+t1JytsFWr24ELF94sG5izLvf9atXYLcZ2ZTKbZQ3bO?=
 =?us-ascii?Q?EQKpcHPQqezqYlHKXvLfAhWc0mDyOAXIxBvrN4GKgIsdng/WiTlO8Nazle3e?=
 =?us-ascii?Q?WqybGx0gOojvXb9oXUrlGZ2VsyhC3GmbIlRwu/VkxVOZUFFFEqq9Km/w3XhN?=
 =?us-ascii?Q?4Asz1Sii1jpQMVzy/rG7Ce4Uc7c2pxkFP/rtqV8qozt2fwVM/NnW5ZB6U09H?=
 =?us-ascii?Q?17VLEx0v3ST+op0z3kz8fMVPu2LWr7Nmqw2Fl5JXs5wVcVt9BlmJybNojOW9?=
 =?us-ascii?Q?IgwwRL+MUDkhTVa7YAfYV05hEQJg09uUM9ntGpheiBLwRkTnyFTg67xzcply?=
 =?us-ascii?Q?wIg+gPZpg8NJ01vjl9ENCn2LW51kNtqyN3YD2jFSmW1KeZUIfkAPuOP/hLbI?=
 =?us-ascii?Q?LTbnwZ55kWPGjytFcL+dY1lbzjd+RE3lCUSg50tEDfvs1u+GjmTWV65ua5sf?=
 =?us-ascii?Q?1h3simY6+BHBSJ28U1GJ58tUQHIIKozmBE77nml77VD/SElxfR7dWJ/RjFPe?=
 =?us-ascii?Q?LcYH7wQqzWcKdlRM7gJwtW/eq/pF6IRWxyWU2vur89IxG4ZL0dybVE8ej3er?=
 =?us-ascii?Q?hnUCgide/e6oDSyf3PTqXc7Ppx6CaphNTdjnUtMifS9KeXNo92y4Tob4RSup?=
 =?us-ascii?Q?QuIKjkaQhCNJl3qkATX024mJJ8fLiISKSesXeyajZRQQw2AsnQRUbvQ9Fvc6?=
 =?us-ascii?Q?KCjkVY7DT8e524cpgyAxh/SxDelbq5sbDC2seufi8zd3o3o5HzQkJy/2bCv7?=
 =?us-ascii?Q?a659htRIPt9BAezFu6W5kXvg2io3J5kNN7nDDdFaIjkZp4T+u3UDX0S+uLwa?=
 =?us-ascii?Q?PAPZMf0P9Jk5eR1/Ac9BlzF+ainjs9yg/CfbjkcWrJ9ULAZRbQzOWr5O2fYc?=
 =?us-ascii?Q?dgwo45PEU2MMJ0XuI+keI4dRqxUNEvHWepnW9R+rYShuVUzPgC+eRLZuoAZ/?=
 =?us-ascii?Q?7shyg6S5faHNdcZvrvcKGrZwoPPWo12nfSxn9cWwdbYqXYBRiFZ/HU8gj7sW?=
 =?us-ascii?Q?dSd1P4h+RuYfDSvBRCezc1Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a438b9b6-1fda-4264-0c8a-08dc8e68b559
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:59:15.0717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZZK965kHUn/Ui/nrF2LUeeM5+3dOVt5uWL3OpimRilJ1LYALZ48pI84NUKB3HcNxWQjIXH5HbsyIvCaguFn3WjHGf0ROzKsUM/sjDhP4AhlcsAhgE0SYXQH7sCLB7pw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560
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

