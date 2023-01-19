Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6DE673C3D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B41710E96E;
	Thu, 19 Jan 2023 14:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2048.outbound.protection.outlook.com [40.107.241.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC3510E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfoHa1dTlnrkK4AEJJY3i8j6zvQqYWaGG9l4/C83u9p0b3F5i4d94dlj8YRqJd2CRBi1rKTO7bAzK6d8cU1FcQGgITiHjYegK7nPaQK8TEZBGfxUTtta8qF0Gia4QXuiE878z5kgw6kqFOhC0oHXNWqJcDE2H1Ph5QQr/QeZqh6ZFDhgjTBQeXxYwORqA5XM/RJ3U+VaH+acRgPDnZY8H9yyKIY3rzH2l8tuFnQjiLyDybbDFZuukIm7di9wNiXU4kjyQ6SlAZUtm2m0rgJveI4TzlR4PXFe0C2FLc6RyqNGyOsVJFsTPn8j5/kLITok1y7Rs1ResZqHXb9X2UwX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBrPCmaMjMnV11cZ/AnUAfmHjG/9aWQuKuxz3sw7Fw0=;
 b=jAQbazX28MCepCwmic8RUO7g1nR+FrfWajkzNvnAKq8n287V8tsvmZuOQpHFAmRryzZCe4Y8RkilH5qFfOUUKCuv0xriRPfTKnxd1WTbJfhBG2JV19Use16dbHp68H35bQyDFv4fXOccnx4v/qJ5DIv5sfdFuxEnASIMfNF2FzA/SGvirg6aSut3PiocyVwaL71iSoKN+tjrYcJ1vrsdHTMqzU4N+ev/q/vX10vTsvZTytYZqytFbgKc31I/4g9yYlLk3+nZl6r0UQtRSrBM+xQaHwlnSSR79b/7pSv4jKZ24nCpcD/5QHbQY0vvVdHFqc4dNcid2BDsNzJaVSbVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBrPCmaMjMnV11cZ/AnUAfmHjG/9aWQuKuxz3sw7Fw0=;
 b=rHBfl+mJ9dS07jfLecGPw+3SnhJ2VzXVjjR9vN5JuE/hJBp9+1PDQFOT+TzNoHDUbMArM6M88VbFQysgAfrq70k1J+X3a9ShVt6LQAxF6wXQxEBd47g8XkB2Cx4/zl/cezOR3qPvDJoIkRAW1qQzZtDOz/kjrMs24B3rAtbnDc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:39:28 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:39:28 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/rockchip: rgb: add video_port parameter to init
 function
Date: Thu, 19 Jan 2023 15:39:08 +0100
Message-Id: <20230119143911.3793654-4-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c88aa3-7778-4c10-4abf-08dafa2af84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1UWQl7Dloent6EuKeZPiLCYdg+TNO5/qB5AfuYsMcAoeGjUKJVrLjfGco8BTCsZMKQA1hIEhOmOAk8EZXIrGhV7xx5YC3gnJkcWj2j1CCVbQkKeKWtiExXLmXmfHlon/M/7WxTe4GJ7x3BBmQtKw82EOUA+eHmbT1vkzUI3SOZxEb+zEpa6kTcR7tnabg+xGZ9udVFGvrnPmTuHlDmkCGIqAWStw55Yux5++DSAUpADm9KUYuDVWllaWah0arUroGqUwktXy8XXeTrS0M4BTGbCm9i282BjrOIEBwQ2vxSsgyaFjUq5Cycsx6nfzOTmOz1dn8dHednsbChCOzjnR4fIVU8x+ZxLFrazSRIbSrx+1Hd2VWma8Gr4fQ2VxgnxuMtdd8WvvVvZ2K0/b4yYkmJ9xDbt33cgCVM7BRlpDTFqJBoXHuP55W3/Ago+V07x44cOZ9yNh1Tm3XPUnFMGWGqTPvnNYYx/qDVrrG862qT7FqagEjnItt1m0B0MaL/46FAoxDZEu8WfwKmsGIMxcarlGdq8040nEFEW1G4IqC26bh2MdH4E2QRQp6VXLel2x/Fz23kvW3rxjuwBdvCcgsOExMYF+SNqHX1SRJEFfPFNkZiMX+9vzR35T6EWS2YKCfr5tyURymd/m53Eh2DQFng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(2616005)(52116002)(36756003)(478600001)(6512007)(8936002)(186003)(6486002)(5660300002)(83380400001)(41300700001)(7416002)(38100700002)(44832011)(316002)(1076003)(66556008)(66946007)(66476007)(86362001)(8676002)(107886003)(2906002)(4326008)(54906003)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1NwomNwU50AuWXizTTrl4lhQ51wokTgX30l6YHuwTbew9opttdraaXntT6rE?=
 =?us-ascii?Q?TgdTBBEcwdHUNeN+HQ5KCIJZcJsqEdcCd+0P4zuqE9p8BZZOr3vFSZqHVIWA?=
 =?us-ascii?Q?soLq+CCf2FF9uySbxei0S5fCb0rbEvfINIQuSKCCKY+j0PzF4xWsp0qSY2xj?=
 =?us-ascii?Q?qUb70onf1xGX3s5QWPI+zpHWssZ9oeLYJ/eIoUzF6fW/CeXY8or0p2OgAYmV?=
 =?us-ascii?Q?F0w4MYgbmrVbcPigS5PnprncjawMwQcnu9T+38GRO3kO+uBNuMrR8n0gF6p3?=
 =?us-ascii?Q?+CzLAPOt26VgiK8SARc1+tUjGvLpeBavTnwEpHdKsltiGLeVlhl2V6AlU3sX?=
 =?us-ascii?Q?MUyd+mSq+9wrr2ey5SR+6YbMiYi29uxdUsXRTyQIV+XJUKkKfdHC4x0LOuy9?=
 =?us-ascii?Q?v1mzox33c2Q05SUuRaSL5W3PnuysqUv9F2DSJh7o2pIJzkAsW02ANg3Qkfco?=
 =?us-ascii?Q?Cqajn3QLKAPJ35bsv0d7K8RZL5HRJ/fU656QUDawA6xlKz9xwsjBitXgu47n?=
 =?us-ascii?Q?lunSBX/CUhPGjhlyw5oCA8QhBuU17qjX5d2HgXtr8tUz5lPLmUax6WsDraFE?=
 =?us-ascii?Q?1VxE1+p43XwR57OjaE7r4xbwl+ubra9FTG1mfMMU18lRoOIzzxN5EGRL18PY?=
 =?us-ascii?Q?tXZxN9GnrwFnlr87yj42xxHn9OWY6KH+7xpMqaL5gurNxfm0aqGEWIyzlxCo?=
 =?us-ascii?Q?NcqEPH3YxXYiXliMKv6Lunpjko6/r4LvWIpECqOfkytP9R1SE3LwWK8IPPA1?=
 =?us-ascii?Q?1+8OgrZ77q3CM2uz0DdlGGR4AAmgBoepDHtyy82iTTFCizavPP74qu8be8Xi?=
 =?us-ascii?Q?CdAieKd+UYWnS5FWqr+byBcJ+3nZhlWJgUHrLpeTiacQHb0x3P226gTDSyX5?=
 =?us-ascii?Q?uEywFQZpZfYuorskYt7+dFPbzpX5FDYCax2Z1Mx8fw1K9MhSBOX16+Ql6jBK?=
 =?us-ascii?Q?F4bVxOk37FhSs3LIIo1xgXAfmfjnB1JEdM7kAAL3HGE5hZTMJc5XE3pStgUK?=
 =?us-ascii?Q?Z773wNghonJRdRnal6egYYlwCY4LaRYxyJrnkKF/bd5O37O5CpgJ1Os2CnLt?=
 =?us-ascii?Q?W1ppaK5cm9MyF1OxwrdzbYw+H1sdc0CPqN365a14N93TFsm5cluiPOJnDKK5?=
 =?us-ascii?Q?iOgGkkwORLU3G1yQk9CIb3HAySoi+ErGG+SMGjdA0XRZd9ko+872QSIktaP5?=
 =?us-ascii?Q?/GeDAP+WjxRAXTE/G1SHUi7zc7TdYkXR9ju3ifJZ/33P28Yur3YUgEkygI9o?=
 =?us-ascii?Q?3ym55eFycmq955Ibjp+8I9xzNt2dsFv7E9v+SPTNu5/KWNDxrLiLGr+Ja1CM?=
 =?us-ascii?Q?5JKnV5JE5ttcAVj2bujrFwJ2YAXJDriQ+rvh9MzCE7r47YOZYf8Uz/BlU0ip?=
 =?us-ascii?Q?KQp9aE10mauX4j/iup6GgCQQw0IELObuwztyAdHp2Y3yaYNbj2GOJhSDDtkV?=
 =?us-ascii?Q?xYP4CLH+dgxgicr4qtoODIbYRoedQ+9oVyq8QgyPx2hMpUxbXDp5cdzX5Xpa?=
 =?us-ascii?Q?Go8adpW13OLwnWxyU+DLLhW53nqC28e2RH7vQd891tK8pPXdzblIZpLY+9ze?=
 =?us-ascii?Q?8L/NMoVk724TiDsxvj2XdVfinO+3SsmspESxshu+LGbPSZ+f5UbA1NxnZDRT?=
 =?us-ascii?Q?EuAdmbCpl//cXdutbWk4J5WqoX1XLfjpdDVcO4UpyfuXVZPeCbezpQtDzzp3?=
 =?us-ascii?Q?R2NEcvmTyPfAswUbixUhL3RXvCo=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c88aa3-7778-4c10-4abf-08dafa2af84e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:39:28.8578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XU7HtZSajHFt8J4yZmQLSoAy9hLN4T0icX7RZui8r7U6mOWg28eLiCrUPcElTPvFqoDV5LLYgcWX+dw2a8fBC0fIb7OO5EcYzQMS3kUilDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP2 driver has more than one video port, hence the hard-coded
port id will not work anymore. Add an extra parameter for the video
port id to the rockchip_rgb_init function.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v2:
 - no changes

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c     | 9 +++++----
 drivers/gpu/drm/rockchip/rockchip_rgb.h     | 6 ++++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index fa1f4ee6d195..5d18dea5c8d6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -2221,7 +2221,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 		goto err_disable_pm_runtime;
 
 	if (vop->data->feature & VOP_FEATURE_INTERNAL_RGB) {
-		vop->rgb = rockchip_rgb_init(dev, &vop->crtc, vop->drm_dev);
+		vop->rgb = rockchip_rgb_init(dev, &vop->crtc, vop->drm_dev, 0);
 		if (IS_ERR(vop->rgb)) {
 			ret = PTR_ERR(vop->rgb);
 			goto err_disable_pm_runtime;
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 5971df4302f2..c677b71ae516 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -72,7 +72,8 @@ struct drm_encoder_helper_funcs rockchip_rgb_encoder_helper_funcs = {
 
 struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 				       struct drm_crtc *crtc,
-				       struct drm_device *drm_dev)
+				       struct drm_device *drm_dev,
+				       int video_port)
 {
 	struct rockchip_rgb *rgb;
 	struct drm_encoder *encoder;
@@ -90,7 +91,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	rgb->dev = dev;
 	rgb->drm_dev = drm_dev;
 
-	port = of_graph_get_port_by_id(dev->of_node, 0);
+	port = of_graph_get_port_by_id(dev->of_node, video_port);
 	if (!port)
 		return ERR_PTR(-EINVAL);
 
@@ -103,8 +104,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 			continue;
 
 		child_count++;
-		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, endpoint_id,
-						  &panel, &bridge);
+		ret = drm_of_find_panel_or_bridge(dev->of_node, video_port,
+						  endpoint_id, &panel, &bridge);
 		if (!ret) {
 			of_node_put(endpoint);
 			break;
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.h b/drivers/gpu/drm/rockchip/rockchip_rgb.h
index 27b9635124bc..1bd4e20e91eb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.h
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.h
@@ -8,12 +8,14 @@
 #ifdef CONFIG_ROCKCHIP_RGB
 struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 				       struct drm_crtc *crtc,
-				       struct drm_device *drm_dev);
+				       struct drm_device *drm_dev,
+				       int video_port);
 void rockchip_rgb_fini(struct rockchip_rgb *rgb);
 #else
 static inline struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 						     struct drm_crtc *crtc,
-						     struct drm_device *drm_dev)
+						     struct drm_device *drm_dev,
+						     int video_port)
 {
 	return NULL;
 }
-- 
2.30.2

