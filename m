Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D3771A00
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 08:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D1A10E1C8;
	Mon,  7 Aug 2023 06:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0B10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 06:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/hu2s5c37kf9g97lQeixyRVvJ1gOf+dYRbsD5zTRAEhDiJWdtIe6VkeYmG9gg2+tY3vsrOUbr3iWTZW5/RszyIVu4ID1DkllPfXQvrEKz3XJ0d91MZTNaS6D2Tm2YQA0kOEX4okm/G8lvHwg8haPjzzWy4jlXsHkicGlyJ5uwuxuqOx87a5M/JulfLcK3AEXKcyovWtz2Q7R0QHfJ+SxTEpelZ9VchJnDgNjay5SB0N8QNwkLy63Z7Tdrw4joHR7a8iu8Mom645XX0tiCrI9pPqUH8Uk3p+6TJXV0+lUbFiiaUF+IV8g/1zAVKZaKscdrM/bMjMdgBlyXnL6/Ld2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZmDnc1a1KpVpPMuG03e10+QC3pZKZZgk8/B2IspMYQ=;
 b=AWL/WoVbzDw004UFDOO4AOe82ptDgi42ZF/IadWzVAFnnkvXWTzqlFOT8D1/Kzc4Xw+s7pzbWKKqLdZ1wAYxaNqC6/d9qkAf1WXMLNGEdwjX2tjNtpQZEYkqeExHHdKVR9G09gwz7EE2SCbxlkNy/l+MM8BbAMHUUam/CF+hsNel7PS9Gq5gX/8unsfD9ST4O0RHa8GCJRvml5liP2MIo10iIaZ0QdK0mEiRaPfdd9iLo3ZA+nYmYexKL0wtIVSoE6ntW+FpNhDVhBy+dIVQAwYd60xzqSHlndXagTeWt2g3jVUAbTy/bZl7jBdLS2rvG8SQrd3rt76/dmdw0kv6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZmDnc1a1KpVpPMuG03e10+QC3pZKZZgk8/B2IspMYQ=;
 b=jDu+iAoX1HFWuM366HOB2Ry0z9+v+U0dggmrscO7huvATM1QSMias8/xWK72K7x1Gfs2762QBb5MsSoZMxX5/VoJxFv1GOWCQ4dlfPICcdhELZgKSfQrFM57jc7jHggWDnlztgGa5qnHWw02BJjZTUBxfiO/7lzJAbhDOz0waD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9125.eurprd04.prod.outlook.com (2603:10a6:20b:448::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 06:06:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 06:06:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/bridge: panel: Add a device link between drm device
 and panel device
Date: Mon,  7 Aug 2023 14:11:15 +0800
Message-Id: <20230807061115.3244501-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 899eb515-7fdd-474f-776a-08db970c7a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wVH3qdRDA2eicp7gRru10Nw/lFwG5ZRw9LlTPH93nzVdpv7gdIZBIm8SlTs+gHs42FyeXPusykCmctB4bVzfh7G8O7bZlylPC8kJ9sgXeQqCGVu4jdLN6MEDrIffgi6Gr7eg0cEDLqiEt1bDF+GVThH3aZTz8SBqcLueu6M+6RY2PpXZcOSPHgjOw/cUbl+R07BCdsBKw7tc2BmCBfMA/eeuWQXYYbBBhyok1aGBKWD1gYoFnaki7w4/3k6Pkph8ft+Egtp4VKRMS6kpI/AGjjsWu9LQ0AiN4rDb2u65QLk50tsKZYtHCfBB4vD6Yozvqx1i+3czjJcHl8bAYNSIxnoQe64/q8rRAWAJIC8Swzwt5NoNj0GaP/syQxzvbIH5tfcl28koFSDy5CWdwqo5mCpMmyCptQp2DlzJZnFLX7NAyEYyByyF5pY/vGTcWUC3MHeRXoAlKd9qsg8TE01TsE711nW41LGxe+0reai5W0AHALRTku+cO9cGt5ZSqf2gNAzD+T8EYl9VY9S3PwGP/atoU8gNJ2UOThRmhH95ceu/dzN/aVFqIhtKWE9WitizryqkpJoSwX+MVVqpN9ITZKQXbrRrb19OKD6gDyS44gE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(1800799003)(186006)(451199021)(1076003)(41300700001)(26005)(2906002)(5660300002)(83380400001)(7416002)(8936002)(8676002)(2616005)(478600001)(86362001)(316002)(6506007)(38350700002)(38100700002)(6486002)(66476007)(66556008)(52116002)(66946007)(6666004)(6512007)(966005)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4N9rUBw4gI5xvx6rVg/4uHOjocxIBaGv+jC2UlnX/iKFXRst/RVaCswUSJH?=
 =?us-ascii?Q?qAiRRR9/K7uB0ZVKak2ibXQsOddGabtA/lySC6/EN2BSpz5eI+YxsBl0GYVn?=
 =?us-ascii?Q?heYS4Qiqj3Q8gx3V2Dv9iV26VJ7MCJUZGgxCxmKTFSpW22TLUSNEBFURSQMd?=
 =?us-ascii?Q?AWA/vDTiOmYY1mP1sfloGpg5AxYfzrW2BDV7ZgSTfR4PybBgO68Y95W9sz+B?=
 =?us-ascii?Q?VPe1wU7ObxDlzN741uxOZ2YOKLGK6ClPRZ1Q55HIKRkECOPewpfmSQQfYktk?=
 =?us-ascii?Q?AWzFsXZShX7zHPmg9RKSMnOBvpY5W2rrY8hw9PSBy7HdduFKBburOSWXTVht?=
 =?us-ascii?Q?0StyCrr4YL6Z66iRuQ6zysf5A/keuRfPvYnH1LMrUrW38zgVM37kQr7NffBd?=
 =?us-ascii?Q?KbheqkNqJ8HZX6/AXRgnAvwJc/au/IodtRjo42TsU7Z//Nn8qhPshOD9j2lA?=
 =?us-ascii?Q?jwk36/9tcwW9vv2JNttl4x8+DEcPvex2++t+bzw7jLvxSUR1KeDMNixJF9cx?=
 =?us-ascii?Q?0Cu3+WynvETX2guvQG2/XkL+L5wOExzKMJdo60uQDslb+dqo26qtEhB5v7Ih?=
 =?us-ascii?Q?BLshFcIg49gV/XmAdvMyX6S653YxwyIeEvfw4EpcsQtxZhZGQNeda4VaB+sN?=
 =?us-ascii?Q?yWyDXSRndm9C/PzekiQKhA9VRDxr67sl1ZWQ29Wma8tS8vqEM3Vn52I1sCkZ?=
 =?us-ascii?Q?QblJR6lUcVsPxprVk/vn0PuzG07+upO3y/DF1xlMrL/9GJMQnaHt3kJpdjLj?=
 =?us-ascii?Q?7Ov70dLjKjy2mNe8OOpqSjdrKjd1yTJlo9fP/DxE+iGvaRwh7mWkkifYazYv?=
 =?us-ascii?Q?/kQnJTcMpYy4zqK6nubRyKgS6V1ex+B+NuiLgk4gg5CwaOWdCtoE5mg8/sO+?=
 =?us-ascii?Q?m0ezti513sV54HVzIxwGHPrLPZI+54kzObvz19fAK0d2mAk35c11pE1KXUqj?=
 =?us-ascii?Q?edtEVMEDskfZkGlIuXPvH6KafOhVsQd6TGOUGhacHT17tO6qDitTANfiSrO0?=
 =?us-ascii?Q?3E+gdz2MuEZuRL/JNZW/yZZdUAJhXkShBqY01NgpZVzcnSTMYM2Auhs/mPCQ?=
 =?us-ascii?Q?v/GEi4m+EdtoKqhL8FvW7HGcrid8VXy/34zM6tIMlNiZfA/k5cRwxfe6CRil?=
 =?us-ascii?Q?a7zTyQ0tug6azZlfGz+G0Tp2O/OBhgWSH1U/EKoZmF8Hce2gopgaWeMOyzqz?=
 =?us-ascii?Q?dWui9Sxpbxlfg1ZCbpArqvHbITiz4g3UH3cYrciSz0ZTHnC6+UBFMv4busog?=
 =?us-ascii?Q?XPVexw71dcGfUg7PakNPOLo1a/WNf/e8cceayj2YpTtsNVwfDsv9/nTwK3x6?=
 =?us-ascii?Q?CJzL0rPnlLOeC2UTCvszbqdNpLTQYU2lwagqyEjuf8yXs28mayO8B+j9zwSD?=
 =?us-ascii?Q?pvYxr/WIjGyA2Gs6QJ4eL+cZ8aIc1DJPFjVHwXQKGqnwuX16pdVJaoY9fXKm?=
 =?us-ascii?Q?tfwAvcbodKN2SNKm2BbTlAJR9PgjveHKMRGDdo5Rcvd6xlLEcW7Mz5GMQ+y7?=
 =?us-ascii?Q?Y0Z7nudsOA+6kPBZqGWFoE49e+KhGF1u/VR/L1Ga/cislz7XGAO6jZF9u3HW?=
 =?us-ascii?Q?jE7G8/LoamnlQz59VJJ4qFcauTywBhrMWoQ5MXN6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899eb515-7fdd-474f-776a-08db970c7a0e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 06:06:44.8104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxiLoS88ERSs4Xov1EAqWb3YoU6v+bWG4fCkD6DoFyR42CA6UiyJRxubYAtGmWCPcjXdvLWiHFjIj7GyKeKqBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9125
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
Cc: neil.armstrong@linaro.org, Ulf Hansson <ulf.hansson@linaro.org>,
 rfoss@kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device link when panel bridge is attached and delete the link
when panel bridge is detached.  The drm device is the consumer while
the panel device is the supplier.  This makes sure that the drm device
suspends eariler and resumes later than the panel device, hence resolves
problems where the order is reversed, like the problematic case mentioned
in the below link.

Link: https://lore.kernel.org/lkml/CAPDyKFr0XjrU_udKoUKQ_q8RWaUkyqL+8fV-7s1CTMqi7u3-Rg@mail.gmail.com/T/
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* Improve commit message s/swapped/reversed/.

v1->v2:
* Fix bailout for panel_bridge_attach() in case device_link_add() fails.

 drivers/gpu/drm/bridge/panel.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 9316384b4474..a6587d233505 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -4,6 +4,8 @@
  * Copyright (C) 2017 Broadcom
  */
 
+#include <linux/device.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -19,6 +21,7 @@ struct panel_bridge {
 	struct drm_bridge bridge;
 	struct drm_connector connector;
 	struct drm_panel *panel;
+	struct device_link *link;
 	u32 connector_type;
 };
 
@@ -60,6 +63,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
+	struct drm_panel *panel = panel_bridge->panel;
+	struct drm_device *drm_dev = bridge->dev;
 	int ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -70,6 +75,14 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
+	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
+					     DL_FLAG_STATELESS);
+	if (!panel_bridge->link) {
+		DRM_ERROR("Failed to add device link between %s and %s\n",
+			  dev_name(drm_dev->dev), dev_name(panel->dev));
+		return -EINVAL;
+	}
+
 	drm_connector_helper_add(connector,
 				 &panel_bridge_connector_helper_funcs);
 
@@ -78,6 +91,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 				 panel_bridge->connector_type);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
+		device_link_del(panel_bridge->link);
 		return ret;
 	}
 
@@ -100,6 +114,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
+	device_link_del(panel_bridge->link);
+
 	/*
 	 * Cleanup the connector if we know it was initialized.
 	 *
-- 
2.37.1

