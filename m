Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB247C20DD4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED2110E9DA;
	Thu, 30 Oct 2025 15:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="JVO0aF/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazhn15013045.outbound.protection.outlook.com
 [52.102.146.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE510E184
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Ow5Melmhos8LRZ3+LbwX/zM9oe9YyMoCeKHHxNBnmfnVVKKNFp+eXyZP/k9t7nxk/0zGuoNm+EpDwTfeQKgoSXcRFiW9B2/e2kEiAffdvT1gZKOpuIsaX6+5NKVrQ8Ov3ybYKQJTd6fQ5/eKpP5YML0O4WbJ3r0WIxu/GfOg6mL01DVo0lQpzwITtu1WoNhhRmlZ3BqXJfmpDUd2Fn3UvJrRSgmKPYgQjnrZR8WYZb8UNh/O2gbOSbUOdm71dyGS1Lmbvt0WedEACY1iKmgHCvcH3v4UdDiWpYakQMsRnY/dLBtVI3tZ76Y4Kut4x1pcBAl4oyAN+gvzY7QcZBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zjsI4ere3RF6WjIvk42ArA/oNQ/lAfnkcfk8lkkjEM=;
 b=obQr79ZBvXTaQzqc8aNB5vmE6+JjSNcvC73SkxY9vV1VWSROarz5mF5jV9NGeff2ehi31inRLcuwlpTIpSNh9LJzn/9rz/CyLokl9Ushp1AC0sWVu3oYsQtKlfaLqgvqUvu0PSlx82SwX0SHL6uEXC/xJF+uwHum6p1yvSepc7IMQlTrOiHDuSRfe/HFoI2YzN66F9Te28PGqrJgPwRjDBdOaVA7FNj4rqWJ5LlrZNHmiG7rHv44GiM83R5sqimpxtaNDckhRsdAY6XnmF4Q8+WYI0c7lg3/wao+9l7Hw8vwGcVLMgV0Mz34f4+eYS7T1HmZ1SiWrtVJSbGBfqpMOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zjsI4ere3RF6WjIvk42ArA/oNQ/lAfnkcfk8lkkjEM=;
 b=JVO0aF/yyHExmGqdJUVPVERVP0pYq4Kmn6opWlNRYcZhIIkj1ddflNZjyo2/girO50FRrD/ff29x2h/VGEp2LlDy+AEoWYtfaXIvRBgCwwzIJbko4E3Vnk7MVfhRBmB6rfpa9FuRQZCIesNeChCeKgHsajIW4TNfHmDBpaq+KJE=
Received: from PH7P221CA0067.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::28)
 by DS7PR10MB5102.namprd10.prod.outlook.com (2603:10b6:5:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 15:16:52 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:510:328:cafe::d8) by PH7P221CA0067.outlook.office365.com
 (2603:10b6:510:328::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Thu,
 30 Oct 2025 15:16:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 15:16:50 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 10:16:37 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 10:16:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 10:16:36 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.233.157] (may be forged))
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59UFGZs82361018;
 Thu, 30 Oct 2025 10:16:36 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
CC: <tomi.valkeinen@ideasonboard.com>, <praneeth@ti.com>, <vigneshr@ti.com>,
 <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>, <s-wang12@ti.com>,
 <r-donadkar@ti.com>, <h-shenoy@ti.com>, <devarsht@ti.com>,
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Thu, 30 Oct 2025 20:46:35 +0530
Message-ID: <20251030151635.3019864-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|DS7PR10MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d5a7e8-1337-4d9b-4c47-08de17c759ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|34020700016|36860700013|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LMyS9u6DXZT/S5gW0F4A3M0BhvOVaxgtdhakp+jrOD711xF/CXx9hBLVlMmA?=
 =?us-ascii?Q?ePxJ1/gcWXf4xwyiDcUnECCJf9lWjNRn+96IAaicrA/QL8v8Mr25tbchCb4S?=
 =?us-ascii?Q?QuceqHb23zTCW/dNqz0PliiZmghE8/CqBdmrWvRmdddHtTXGAgMDAvV0OaeV?=
 =?us-ascii?Q?4qcGz6xRdNVII59JWmGM5NglclF4tq3VaRuxTXBh4xY7IcchI/qrmbFrwIMo?=
 =?us-ascii?Q?8tsgSrrqAaj0tfrz2I7EiimylP8M07HWzWxNzGgLCmVR9tMYpohXkl5TTUhJ?=
 =?us-ascii?Q?26mvYx6lkUoa8dLIflSNDhQ3PP6CMY+MBB7CZo+FVv0Ftxn/9xUJvRscejDe?=
 =?us-ascii?Q?3VlvQ2Dg6sZP8AtLYvdm9N5a4e3Tax6WD7AM+j6dt1EA4nSh9DjMTIGw/SKF?=
 =?us-ascii?Q?FT3xjFk0CJItuHFwA5EHrzFoyStWzkrzDN0xPd6lItjJLZ6xE5mAFqbUNyBT?=
 =?us-ascii?Q?pSNtUqoVl7WlfuKHPve2sDxNoyrBqD3kpStjPEcVYnNtgR0sYbqPsWGvLEhS?=
 =?us-ascii?Q?bOqRkaViUPgHtLWllQjiJqIvhxHe7GxKwLX9RcYkNKelvODZ/Qi/ImL+wYXk?=
 =?us-ascii?Q?jGQM92FCsx8i6jkVds4p37qcfIU6v7nb6B0NfLGdTdShcDxnQopb1Azfkqca?=
 =?us-ascii?Q?bCPIMsZ65sGQdTmVbK9MccUMScSHuE8cijSrOpAC8ImN+EPNDsVxPSZk+WpV?=
 =?us-ascii?Q?6KbDg3W8CXjSpxQ88xAOHJa1SSm5RpDSb21l1uAO7FdGReiT/0C/IxN0hUEf?=
 =?us-ascii?Q?GbkuuKsBuOHbEiDw55Cd3XTe7L4f/W9R45Kajok/YAULPnRkfp4CQoOBgmXy?=
 =?us-ascii?Q?BiT7L1/w97ZDyU9dMEWha0QPlq7/vEk+hpzyW7+/l+hKgM9JcxRKll3OTorS?=
 =?us-ascii?Q?FlVaZ4eafeK2CD2x/194KNlYy2/hwTBq4WjQ9IeMq/mGpmHCIDPfGmpVe3ez?=
 =?us-ascii?Q?6sErWvoNucyPn/PKnEvU6pdJEr8eheW0aiwqFTOC6smyxq4T7Z2Vtu8a0CLo?=
 =?us-ascii?Q?fzW+A0mCsYrtbT65++f/XVRIetrxDnwUyV2shRRGPZsNa1XnI70p4xkhEiq2?=
 =?us-ascii?Q?/BqkxyamcrgwWl3bmLmb/jTblEVbE/e3KRIr0x5Gen7Hv3yGlJY99lf+0Ip3?=
 =?us-ascii?Q?DwvI617ZhC3APZcCGFLkD28r3POufFp1CmiZILe7P5rdFIdd6l2xZ7UywWY5?=
 =?us-ascii?Q?q9eEWkIZ5AzO7b9wCV/8cCZgK3i6zP0P0d42wQ7CCFd3Ch60wjIa444Fu5ev?=
 =?us-ascii?Q?dSg4bQLMS6hiO85Wt9SKp4BDTy+ABX4PmOaqLlAyHYXeyWI8azNtC0wghYdy?=
 =?us-ascii?Q?nc0GF3omHKLiQ15PNF4cxcEGoNFqnu4m8wQmNhg/Eo+05lI46VCc4/ttszAV?=
 =?us-ascii?Q?AZDFCNNiimGjZegFG4H1G9Oys30+l5dFlDnUEUbwx7ZkOLwkkfNuoV6VoqyT?=
 =?us-ascii?Q?jGziHm8qxAG0sI213+q+FIHKGXcsoduyl1QAOV4Mep22qVW1gRVj7D+uCMxn?=
 =?us-ascii?Q?O93EWWUbK9oEdDnieLHGh8U6Ws0pvmMUtPN1/r7RftMo2GHZpP/l680+dTun?=
 =?us-ascii?Q?6y6s/DyyAeVHg3yN+riUyHjSk2/90B+F+u6HiTxC?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(34020700016)(36860700013)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:16:50.5100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d5a7e8-1337-4d9b-4c47-08de17c759ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5102
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

The sii902x driver was caching HDMI detection state in a sink_is_hdmi field
and checking it in mode_set() to determine whether to set HDMI or DVI
output mode. This approach had two problems:

1. With DRM_BRIDGE_ATTACH_NO_CONNECTOR (used by modern display drivers like
TIDSS), the bridge's get_modes() is never called. Instead, the
drm_bridge_connector helper calls the bridge's edid_read() and updates the
connector itself. This meant sink_is_hdmi was never populated, causing the
driver to default to DVI mode and breaking HDMI audio.

2. The mode_set() callback doesn't receive atomic state or connector
pointer, making it impossible to check connector->display_info.is_hdmi
directly at that point.

Fix this by moving the HDMI vs DVI decision from mode_set() to
atomic_enable(), where we can access the connector via
drm_atomic_get_new_connector_for_encoder(). This works for both connector
models:

- With DRM_BRIDGE_ATTACH_NO_CONNECTOR: Returns the drm_bridge_connector
  created by the display driver, which has already been updated by the
helper's call to drm_edid_connector_update()

- Without DRM_BRIDGE_ATTACH_NO_CONNECTOR (legacy): Returns the connector
  embedded in sii902x struct, which gets updated by the bridge's own
get_modes()

Fixes: 3de47e1309c2 ("drm/bridge: sii902x: use display info is_hdmi")
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V4: Shift HDMI detection to atomic_enable() and remove sink_is_hdmi caching
V3: Use drm_edid_connector_update without edid NULL check
V2: Use drm_edid_connector_update to detect HDMI

Link to V3:
https://lore.kernel.org/all/20251007112309.1103811-1-devarsht@ti.com/
Link to V2:
https://lore.kernel.org/all/20251006150714.3144368-1-devarsht@ti.com/
Link to V1:
https://lore.kernel.org/all/20251003143642.4072918-1-devarsht@ti.com/

 drivers/gpu/drm/bridge/sii902x.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d537b1d036fb..1f0aba28ad1e 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -179,7 +179,6 @@ struct sii902x {
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
 	struct i2c_mux_core *i2cmux;
-	bool sink_is_hdmi;
 	u32 bus_width;
 
 	/*
@@ -315,8 +314,6 @@ static int sii902x_get_modes(struct drm_connector *connector)
 		drm_edid_free(drm_edid);
 	}
 
-	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
-
 	return num;
 }
 
@@ -342,9 +339,17 @@ static void sii902x_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+	struct drm_connector *connector;
+	u8 output_mode = SII902X_SYS_CTRL_OUTPUT_DVI;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (connector && connector->display_info.is_hdmi)
+		output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
 
 	mutex_lock(&sii902x->mutex);
 
+	regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
+			   SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
 	regmap_update_bits(sii902x->regmap, SII902X_PWR_STATE_CTRL,
 			   SII902X_AVI_POWER_STATE_MSK,
 			   SII902X_AVI_POWER_STATE_D(0));
@@ -359,16 +364,12 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *adj)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
-	u8 output_mode = SII902X_SYS_CTRL_OUTPUT_DVI;
 	struct regmap *regmap = sii902x->regmap;
 	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
 	struct hdmi_avi_infoframe frame;
 	u16 pixel_clock_10kHz = adj->clock / 10;
 	int ret;
 
-	if (sii902x->sink_is_hdmi)
-		output_mode = SII902X_SYS_CTRL_OUTPUT_HDMI;
-
 	buf[0] = pixel_clock_10kHz & 0xff;
 	buf[1] = pixel_clock_10kHz >> 8;
 	buf[2] = drm_mode_vrefresh(adj);
@@ -384,11 +385,6 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 
 	mutex_lock(&sii902x->mutex);
 
-	ret = regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
-				 SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
-	if (ret)
-		goto out;
-
 	ret = regmap_bulk_write(regmap, SII902X_TPI_VIDEO_DATA, buf, 10);
 	if (ret)
 		goto out;
-- 
2.39.1

