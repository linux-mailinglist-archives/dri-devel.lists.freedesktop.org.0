Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED33755C4A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457E110E1E4;
	Mon, 17 Jul 2023 07:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6967310E1E4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 07:00:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsnJzPBmNaqW+EwgFE4bDFwhQPS9OWkygnjcXxfkm9tQhONMgsmCgGLjigd0+taew2IXaXXvY6IuAQse6WmofUjB4R8RdueHYPVaSlNc7gJRDa8bGNXvkXuJCuWdeXATcOBrKNGmF62fS+OJBls5GefoJ7dXUFefCr93J5HWicUQ/844eEwcOOZ4jEgtnkgXPMWqfKBbNtW6uMaym9myWfPF4f8+jzW2MWbbWYcw3ejbG5O6VVbE+MkAjXG3njclkHWNsQvqbFHbFzi/x3FtSswVnX+ryp/wZkYsXDmypMdsPrQ3EdWdW+I25ozMYu2xgNVhKaKplA1pevl4+/BKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeAhS8GM74slnRzRaoKLaVB/uIKe1g1b2ogIHARGGeI=;
 b=G/+0EYrCgZL+VP0sRmiPBxW5sSSxrne7ZKX1ymwTRsyeF+D0IkN3qpaAsU+I2ji7q0KHNA4u6gWVv5T1PbmJp/80GduJ8LZwt+ovlm+37WmPD2cHT6S/tYBTv+d370fhcVYcM40GhY0fkrDeeqUIt/9/qmJfkldwJgf3Bz4V9cNohmrds72DBcTkQFCLBeoRjPB7qyqvBJcoc/UGXyQ1ZH56a3G0Ra3kxYlCBXEgeP7+Ff942m9jEZDsQwwSEpElkl/PTCWo/pBlPOIJ7jdeaIgwiHoFAuT+1sLf6dErcp44kSDKgFdzfd6g7Mn39RRvkLcnHa/8pMpc0hxePqSk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeAhS8GM74slnRzRaoKLaVB/uIKe1g1b2ogIHARGGeI=;
 b=CtQ9DKwekhluWFI9mkIhmEvHeso9DardqdFRAFiXeB3Wfs1JqIFZocdeOVikZVWQSd82+gRVjstb/bJ5jkR9mitbU9YeySIqb0Xdd9QgfMv2/wOQWQHYUgEiMWe9ai/j67WmUV+qXHkN9ashJV27jFhzdIPwsJfuJUpVOYKxHdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 07:00:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 07:00:47 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: panel: Add a device link between drm device and
 panel device
Date: Mon, 17 Jul 2023 15:05:28 +0800
Message-Id: <20230717070528.1996891-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 93980355-ce56-4068-61b3-08db86938bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rRyjtikMR4GTuEBkkRxYhOK5FdotWaxU6KxbNQu4JhqZ2gpgpF10uid9DBGXmVSZ++i5gwvA2q++eNEiGdhdU8at5RLfx4Apl2sJHjZSjI64WwbNYS6lIuIGZ4YanugoPWtFPGEKjCv6UhfXbCwqfewz3NcvZS0jZTbiTWu7ow+9S/xSUktWym6ZeplG9sJcXLR73ThBfRyCzyh0OR4nT+Q1X09JdUnlf5/ELJ0GMovCHJYDhT23dY+LgOJbuQKaCNeynCOZm6N/R5TZShU3UVyaeCUCFZxU4ivbti/StXl2bytxmGedG58toQL6SUWMBcFBkqRuISgwfYd7ltXfV48rpDtq8ul+nn/RamdUqoGAvZoCVBZVaF5n8rxQ8xJnN1cXBkpRbCcT7nWRZZVg/0J8mFSmKzZWMChIEBOIdAFnPKOwFf21SSojpBzgLoOE/B/KANI/ArRcB3GOrWLXVhGo0vf3RTrRCVjMceyL4jS+faHG0p5Wiyh3ace2pJaPOISU4/MB8o0n3IdHWTqZVcQVOilP/S6DPWtJk0S1HwEyxW4aALORSMMEEwkg8PTgCQB5prmAb0AWyam+q51BRzH5UhpVEoUupov2ICrojg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(478600001)(52116002)(6486002)(6666004)(83380400001)(2616005)(86362001)(2906002)(26005)(186003)(1076003)(6506007)(6512007)(966005)(38350700002)(38100700002)(4326008)(66476007)(66946007)(41300700001)(316002)(66556008)(8936002)(8676002)(5660300002)(7416002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZV7Nxcl55NBeq/DnPbItG0OfgZLpI0/YZQz1Y0Oij4QNSmskcE4JruWogrFE?=
 =?us-ascii?Q?O1LACHvghM63bYEt2ooTbnQEkk4cPkWDGZedpVJ7iUvDLJ1pbCSkkLUHkRf8?=
 =?us-ascii?Q?HaNlLa5/HttdaVzWXmnynDui9r1lAXHQI6m8Lh6lkxhse3EQaYSUfFh+4ce7?=
 =?us-ascii?Q?k3QWWqfv482Qw4inTDZkokHoS+Tw0UBLgwB7iEwPyYAIt+EKECnz4K8DuwZE?=
 =?us-ascii?Q?J5VFAY3w/dKxc3kSo4hUULUI8X/WeZaIUdlw945UvSnO/beGoMDQkL/gWye9?=
 =?us-ascii?Q?F2567EC96o+KapS6vKVITsO8vv6oE7+P5CfVeQdl9te+ZAwqAHQPma2y24Sz?=
 =?us-ascii?Q?LFSLa9vVCX/ivb+YLyzrTpIr2hqRAiQGAlr3GCrReCq5zjqu2TJ06t3jNXIE?=
 =?us-ascii?Q?rk5IQOjAM8cBAadkFg2o4jiSUE81QWwThXHHG9JdSp/+cSogngjFhR67mORS?=
 =?us-ascii?Q?7NYfEnRnPYloeq7HusbQmmqsNmW2607O2Yf6i5Uyyo9qO45Z2RpGxjg2cGUV?=
 =?us-ascii?Q?Zv8DRQqpihv9a2TrHffcTG1TolO14kPEDNMTySCmpLrEnIRt6AeXqCVFwb8S?=
 =?us-ascii?Q?0hTil0XOC/A7dhFzYlEbKGHP+9x3hzGQ/DSlWc13Ef6IxyKCd3k4lOyLmOLe?=
 =?us-ascii?Q?7BDD5N0+f6GKDORIdIAmaeW5D2d/FdjD+SaAud/4l+gRPwQJitXkmGHYSY/f?=
 =?us-ascii?Q?uYQMtbum9JVVasMebQQczW/wLN51eZysH0dfRYi0Z8xGKYNqBoUDi9DwnQ3+?=
 =?us-ascii?Q?OGWX6Qi3UI5s1rVZE+DiWsNwlcdg8eI1PrpF6voKgcTNyQj5U+Y/rkmhiIyd?=
 =?us-ascii?Q?vSkvk0dbkVvi38TxzgUVhFQKr7/6n2uGf6GaPP++V+he9cI5dVgcNemnJO6g?=
 =?us-ascii?Q?KC3UqFzWQ/GgEIFPi0q8BAGuXIBaP+bkrvBEsPMUN9oz3cw2ZDI1YE60vbgj?=
 =?us-ascii?Q?MRmWA28kpibyjdVpnZRYWpbJrQk1graBNJtYnKN3Z9oCUEcAp+DDe0ddmqTy?=
 =?us-ascii?Q?IpA6Z3lc6cUqOT1GEFUgZwXztK723OZPKudsvGSc3p/pV6EEquvpct9WW9uB?=
 =?us-ascii?Q?FiajqWF8wx/0sGSni2WeiNnK43iqunoZksZ4+breeB4pgeewEGMEC7A8DBfR?=
 =?us-ascii?Q?go5SBeD07jL7U1mbxYBVoF0P0iD2X4QPBKN8sDrQQ/K0NVcywsQ8L/rPLNlZ?=
 =?us-ascii?Q?FspcxCoJQX3Dtnl959ac0DpZxpA9pwxDYC+v2XIOEP5eSOtrvt9t2bb+B5tt?=
 =?us-ascii?Q?jF2/lcM/NL/snHOk//cLrvNz16jCkLQtAtpFV785NfNZDfpiGFJoGXs3rf6p?=
 =?us-ascii?Q?hekUh8L1oqSK5aVJ4ZsaI1SxdzktqK3ErA+CF8MqqjlqoNI1Y7a1eF8Vr42b?=
 =?us-ascii?Q?n+OTG0V5KlRIHMKTp8UaHifgOfLVdOXiZlnAlPGJ7eu8c7oW1hvotMv66ssW?=
 =?us-ascii?Q?yjLAf9pgsMa+ViRoExoVISElaqbwdVhs60yXF0tnES5mtlYZXU4v8RE/go5U?=
 =?us-ascii?Q?B/mTmKDxF2Mt49jKNfWXMnHvdbfFWeutWyg8Dt/8ZHhswWXtPu9xWNy9CXMw?=
 =?us-ascii?Q?AGWRoxXHRXRGQ3lQDUuRfglAZyndr/NDkHyrID8Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93980355-ce56-4068-61b3-08db86938bda
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:00:47.0096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUZ49u54bdOiSDEQuLtVu1jZPEzYqu1S7wDNczri3AYuHDBE8gMMw0Jr2C7xnJ9IQDzRm911uyO1jOy3xotGZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
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
 drivers/gpu/drm/bridge/panel.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 9316384b4474..85fc6e6dba58 100644
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
@@ -92,6 +97,14 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 		drm_connector_register(connector);
 	}
 
+	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
+					     DL_FLAG_STATELESS);
+	if (!panel_bridge->link) {
+		DRM_ERROR("Failed to add device link between %s and %s\n",
+			  dev_name(drm_dev->dev), dev_name(panel->dev));
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -100,6 +113,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
+	device_link_del(panel_bridge->link);
+
 	/*
 	 * Cleanup the connector if we know it was initialized.
 	 *
-- 
2.37.1

