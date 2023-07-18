Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5A7571C9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 04:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF6B10E06D;
	Tue, 18 Jul 2023 02:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C7010E06D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iewuECT7ppY6KZiKxXTR2QWCQ37j72NYRfejS1qLzRMlisdicF8f6WvpJ6AtmX7jgqsUbtETYaMd4uOoJFibETncfoeWANbNaLRnmT4glq0GJ3yVQ3aBTDCEoiZxTnFEV+1nxFGRrm1J3xKLphWBlesbJWVbO2mVLs/B/izoC32Cv5atm9wDs9kbarwzIpYftniHhav4Z1FAhuG8hVWZad87T2awzto3KhW/dV3li2tziSQ7U/asToXyirGQM/45VpGHYbt9a6+vvsYfCr572K5/FFd6Lyi+FjkDNSfopuvThMGJPnnprUVFeRHvrYdNtT6pnhPADxDzXQJ2qGqaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CkhQG70gS4F9+jpP91MKsEQqyjg2c5ITbiObK4B0Ws=;
 b=LqV908PUDOGhaigOuTb7qKJidaIML+Brf78yt/ag6jRjm5B4gZ5zb7mX0PlmIXAQtEr/pHkkLxy01b6zBuGddzZXDVyCDXlJZ/2FKppKANdcExrq9z6yQ6zWVJbKav4ZEbSj/ZjKKHfmUlDF5L2fJCp0rYhP5bg0KaPQAxq2ocjAvfGBsbca8dfcaUAcZWNS0F85Az2Md6oSIeMWe+uZq3jelQYgZpRelu7W0KlKMrNOHXKkqmEKEJsCjKksdyz73BmFiG9ONtMrNomeiobMTo/ENU8ieRhMlpCVXqjxE7wBPUhyuqMik/GrOmQyz9X+V1ZaXMKLO1eM3rQ+Kaz1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CkhQG70gS4F9+jpP91MKsEQqyjg2c5ITbiObK4B0Ws=;
 b=Z0n6C2mNpfu+Y7t30DKrPEycZVhybtlO6gRCLJKUtn2MFxLkVUDAlykvFgCvMxBG+xDUaSZN2vi9KwTpeLhcJOF/t+Lp6D/Y3lDFXt73mKCTWJLz6P/Wx6fpbrdWiRnhiS22s1CqeP8n0zjQ009fpHd77woc6MolPTcPnRRAUXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 02:33:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Tue, 18 Jul 2023
 02:33:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: panel: Add a device link between drm device
 and panel device
Date: Tue, 18 Jul 2023 10:38:03 +0800
Message-Id: <20230718023803.2157021-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 11058cbb-e523-4daa-1448-08db87375a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +9JN4prbxxSi7G+GA3G7ZlgizxNhp8ac+XFZyMT0pt/6eokLpbkK4+nvGmUk8A3DOs3zIS8KK5bOWJgBX5rON/AAsVNJWXJQ604M2hDTYOspLnI6pQjrBwRNphCRH3mDfpu3YkSUETuraeQXH7cemn4GQXpWLRQiyIYP5PZdSAHJwme3ONNeYLkejB7SXSCBf+efq1S7SYxhp3O1v3c2WHzHc9rSHeQBTa5axruybu2sHWTK0KK51h3On6NjmvVhz3VgYtKb7lqN3gkSviC5Y29HyfclloQPUaBwCJ9DQfhyHISkybllZYuSwwbUBI7zMGaZj8kRAyqNK1hA3G1/5vwhZCWAXXdXWNQ+TKvQjt9/NW+l20xdkqIw7MBhv43YtuKaMD8D0PuFah6dj6C8wsGVN5mw2pKKUz8jMAUoU9qCMArK5GBedq92j+FPD1fQXD9rLTLOUQ33Pip5RcNHqxsWQlQEveyzTENSPl71UbTvMg8032JG8N3UxVdShP3vMwvNylwjHtBWnKaWyNzXE77NKS8+ZuW2TB15WPJqCQ7p7W30K20uIINTFnXYbNZYKzs9tmiqRI4aK4KcNCb4eN1Q6WgT29JHF/r+kInvJng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(6486002)(52116002)(26005)(6506007)(966005)(6512007)(1076003)(36756003)(2616005)(83380400001)(38350700002)(86362001)(38100700002)(186003)(8936002)(8676002)(41300700001)(2906002)(478600001)(5660300002)(7416002)(4326008)(316002)(66946007)(66476007)(66556008)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x7HWZWwMCDSD+wLBekoYbJqI2sUYhmA6VMrW+PCS4g8R6ljTAF6LtkHiYw/G?=
 =?us-ascii?Q?UmLrnszuEmNgEn3PVwfmtID9DowKYk36Y0neuAm09OzZ6amyFPfK2ZGzXHf1?=
 =?us-ascii?Q?p4IsBReL8GGNejXYzieiUWx+9/Tcwd8/XToeyucFmttDYL7DlNi6405IL9tF?=
 =?us-ascii?Q?E3BA/VZMgXyZ9EuSTMhNDCiGtMVhY4zpLjHehZQ4jTv6eURa12c/Q/WsE1Cu?=
 =?us-ascii?Q?dTvokvsq9GcXN5wTJtw8DT1G6hSrX1fXwW+YeDYRtyKSQFrtcyQof8fhI7rV?=
 =?us-ascii?Q?I9mxcodtxDgSD20zz7McwAwaHw9JXPzhqD5CFTCuG764o1JBb0zFXz1QSdbh?=
 =?us-ascii?Q?Ju+y/z8rZoA4RMlr26oNDpX2hSKfoAtd2ug28+nsS77sZD4y2NEWLCZzNEQm?=
 =?us-ascii?Q?TtFZ67/AxFZPPyCY1XeIiJA1ruUIXrVW0zyJ3iz+0T2QYS9ryzL5rT9VFppf?=
 =?us-ascii?Q?BqpCozvdYb2f3Szz0OoQsbcKJ1jMxPbmq+QVMFy14hD03I+QiST1cQVk3NIP?=
 =?us-ascii?Q?Jp9giFqN+xqxFR9aKPAIWY+NbLp3H4iLnl8N+Czy6SwtYbg1qN4qUu2pKEpE?=
 =?us-ascii?Q?sqVq4LZ1acE40pDHtS2My7mhyX0/nzah7YbQvLA7MfwJ3NlUQzZJ+njga2jT?=
 =?us-ascii?Q?ARWft2w0+fvpalkKl1VuAHO00FciDPWqRSN+RtPU7nqYo6MJ/vXZ29vnoumV?=
 =?us-ascii?Q?7OHVB7fCAi9lrn0hCAsiMx0n2gvDGL506Y+F/R+pKU53a4YZ/v8+jQVMwTkw?=
 =?us-ascii?Q?aQ2sfMSEtPBaL6GPdvX8q7Ws0W7jmdamP1xIOnsiM8CZDqdfJ++wHtXLy1aq?=
 =?us-ascii?Q?gup4nqVlDv3LzZLqolVZsHzmOEwYl/Fctg9a7LSQBHhp1aKsz9lfqn72r0zZ?=
 =?us-ascii?Q?8hVALwGpcocX8O3xZP9Qx/MkRRoRbLzs0LtCgLaJPTUK2rZYWZNuRCc2mOlt?=
 =?us-ascii?Q?w/pY2uUxveyuG0YGCCYg0DfuWVJgILft75pTN3DNe1DFhsRXLDeyqbmKy/2+?=
 =?us-ascii?Q?zTtp9eDkRv5pXvTSU2K1gdoqoon+9dn2hpgqAZpnJvK7x70wpOpyboFrQL89?=
 =?us-ascii?Q?qtojpty/I9gaqWevFT8pvkmDbtZ0BIDRqLmQ3h9kR6eZaSb230G3pigTIZws?=
 =?us-ascii?Q?SPQkii2dpsWBb7kTTV+StW7OEiJPO0dJvR+5o2qST1bkPqg/pbaiA+FbhNMh?=
 =?us-ascii?Q?DC711yK9LF4MZMlx0kQhHdjJFr0vk3/xy0IJ77eTrBP3LfBukpYBDaa5k6zS?=
 =?us-ascii?Q?epE4hCRgo9Fodx+hX1Vt9/hotm9zDcMTl980qRht318/Ojlp4SlL4YQg5bKG?=
 =?us-ascii?Q?n8gK6vKasyBNYVX+83z16A8wU+9ALMEZJICs4T0u81+sMrLs1NXyF4SrgVI0?=
 =?us-ascii?Q?ngQGd5cS6GevinS/jd/OZsXPxeTBtOuaidWycXE5Ad3BqJ4oxW3EL1JFg0pT?=
 =?us-ascii?Q?wQv7YWTCcVuAFZCmLx6l5hPw6D3ALTZJiz/rY89FMP6iTG9MqBECw61JfQbn?=
 =?us-ascii?Q?/aX2P9CfT0rEE7OeqDTQIcaYL+Ney+BcMBpMBxQPbbwOJK4Jcnjr5CjiVXRC?=
 =?us-ascii?Q?8B8lKPFE3R85+Uv5ZMpcRM9YfSZOfUZN+YAfcqod?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11058cbb-e523-4daa-1448-08db87375a31
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 02:33:21.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGE+jeGzDJWmVwBLr/3evewRbQu9tEKwVFpg6swC2LVdqzbXoufKGMNtFAvU/ZsLwC0ZYooCYJPaWkcwg7F/wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680
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
problems where the order is swapped, like the problematic case mentioned
in the below link.

Link: https://lore.kernel.org/lkml/CAPDyKFr0XjrU_udKoUKQ_q8RWaUkyqL+8fV-7s1CTMqi7u3-Rg@mail.gmail.com/T/
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

