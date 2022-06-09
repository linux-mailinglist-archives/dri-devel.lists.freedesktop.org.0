Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04B544419
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9986E113DAA;
	Thu,  9 Jun 2022 06:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50057.outbound.protection.outlook.com [40.107.5.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E94113DA5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsNHKqn9g29DUwO/+nMsiNKwp8nKR520pjczIZEi7dZOtfrh1JiGCfZAorcVsN/mLTnNPC1neNmrZloAHpsdj6ZSFkcdb7D6J19r8kRgk/Ul3JSgVKuv4uAlHghGdEsUqgo8/hQ6561ShaTaZkcL5W/HW3DxJBPdyb6z54exR4RcErzivUVia3Vwtb3ZsJgJ7pA1UqNVxF3Zxq6Zbf2bFhNDKGzsBwAFDKhKuWMOtyTyJndrECnmzHGd1qBWXeLschrNTno6z6fTdz/afYxgyPoduiRRgW4q3PQSjN9C66GXS5In9V5Lo8RWn3DaxrZKI7+3p5f9GHmr1PkPB6Xz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tENMvbt86pZa0vQCJzznIcRmYA/F6nNny2aT1juRyj8=;
 b=hlC8reXnHoWmmSY/idLAjbA8Bs7dfulULgQfSNxMHAsB4B9z4B8LM9gkDvcFXrHpYaaHZgZ1iZwrIqzHV2xFRV3tJ88zTVH9O1APSdQ6T5UTt9Qdf5vOiU9I2STe3Uf6YXF6ANRVuzvJwdCAV4ld/oO4Bj2iom5U+9xjRPW+MFV3On3K4uo0oL/Tow4ZS4Mv80gUzIs8zuGWwov4Oj6Av1/TPFjMDTq8Y0TYHrMDrmkFZ5/caIlJcVaJuasjmMesnq229sZo5HROVenuOcFeB/sMpZZIKGiTIaaxu8v/qy3kujAjRj8gV36fF49zgGY2uR1C/TZN0FYS3AxN3a4CUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tENMvbt86pZa0vQCJzznIcRmYA/F6nNny2aT1juRyj8=;
 b=L5C3y/exlQKdhOnFHKZSbMVFGtZhGZYh2TQB1p8mXVpyrpyxFEwpb3Z73knfl58BZe6XBFNIngNGPAv82SmveL/n22cHCVtOssy1WpVtNibme+/dhDkCf3rNI/THtn0Tqzf9UidKiePgd2KUKFIjYrd94JUJhQC3odZiW1H1iRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB5280.eurprd04.prod.outlook.com (2603:10a6:803:5f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:48:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:58 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 08/14] drm/bridge: imx: Add i.MX8qxp pixel link to DPI
 support
Date: Thu,  9 Jun 2022 14:49:25 +0800
Message-Id: <20220609064931.3068601-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf3b40ea-68a7-4a28-2f02-08da49e4212a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5280:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR04MB5280739DEED6D2EBF4545D3C98A79@VI1PR04MB5280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KtgUGa5feWSa1QOKK7wtpySkeieQ5SGOe2tiE1UYrpVy75FFc1vb0HHxFXv8RLpFOUmMDkcnDAvgqroa34xiHApNg6KkUaP2VGS0uP3SPKzk7ntTMzP8NZU8DDbeU1L9ch8rg984IET+NxHZjmicGa9sFFs0lMbKOyDmlZnhVRAj5Gc9RIBCfipQ0WhADIz5ZRqYGO3W1h7M9N4Z8zXWeOjLxjf1KtoDaD0Oux8YoXVCbrAuy2BWn4HIz9Fv/Y+IuYt/euq7rlOI5GsruBL+1t6s+Q6SlZxdpdFMecsnl43sX+mq+xH/GFZJB+5Vae7T+o93LUCH3xF+5o/sRhWAeNaAFYg17qTpTolZtuy/4vuaKA0jcySNERFOXc6MVWLB17HseF9Lom3LSale/GhxJxg4lLhive//2b4DxuEI3//maMhldBOzRMjY7mIHJY46cGQeAaFD9JkJmEe9qlobIGVy5TyNB1B1VOSMqLGiTgP9VPsOfdF9bUeMHLmqnOLKKycpc2THCz36Uc/ido6kwFphB5ePP4bU4qDzdKM3ufvEc4ff4JD3CtON0y5nNNvvBM28io6HMkBcfZDZ2xI5cKEplGVpW2NmVOD875lksfATqusVTz/6rWJbE4Q/DYK4VECVwNun3zKtYAFRTc3y4ACabJixjKECErlWZl6Thc0tw2ShKAseQ9U+HUdntBh6tjsoII6ldwjigqPfcvUUoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(186003)(83380400001)(38350700002)(38100700002)(6506007)(6666004)(36756003)(30864003)(2906002)(52116002)(316002)(6512007)(508600001)(66946007)(6486002)(2616005)(66476007)(66556008)(8676002)(4326008)(7416002)(5660300002)(8936002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEs3SnNHakJnTXp0MWRuTGMxZmJWTmpwQVVISVp5ZXZrVGc3bjhucmNCSFJJ?=
 =?utf-8?B?eldtQVlSc3IwOGdoaHh6dlZlQ0JCNk9odlU4R0ErVDZSQ3BXb0x2clZ4cVJP?=
 =?utf-8?B?TG5zOWhFRVV1SDVzTXJ0UERScW9pdnRpQ2UxeTk4ZEtveTB1bUJMOSt4ZU1a?=
 =?utf-8?B?QUtZMDBCV0d5R1hDdXo2QnVjNlNZYVpqT3JRTUJaK0xZbkVweUZNRzBrNlMv?=
 =?utf-8?B?UmtjSTR1eHAyVmtWV25BWnkwY0U0aTZMcjBIQ0toM3hUN2ZPSjljNHh2em0r?=
 =?utf-8?B?eHFzazBmOWlQOVNuRTlrTXl1UzRvdzJGcWtQTEg0U2Y2dnFqNlBEdWtYTms2?=
 =?utf-8?B?Rm9tbEo4VksvdWtTRzJUS2x4ZVNUaWpROWpCckxyRWJKL2ZvVDN3MjE1UEh4?=
 =?utf-8?B?WUh2dWd3VXkrSmhWZFhGQjJqUjhYZXVkYTVCcXFEQnUwTTVpYlFCSDFKQ3hE?=
 =?utf-8?B?OGo0am9oNERBL1QvbWFneWhjVzdXR3EzS0dpRnpOVE9pZnI5Wm1OeEpNQmlZ?=
 =?utf-8?B?YVBmYnhlTTN4bVE4MVpmeWxTd1pkSGNrRHRmMjJqcThzQXJZd3VEREdaei9J?=
 =?utf-8?B?a1VrbE5yNjBBeEhWZDMwQTZZdXRidUFyNDJaSGtvdXNrYU5KMk1YU0dGUzFl?=
 =?utf-8?B?WjdTT2U5OFlsV3NWcDhNNThtR0JsdjRoM3hxRzVsMWNsTDJZODBvYXZ0TDYz?=
 =?utf-8?B?L01pc2hNaFd6dFY1WFFkNHZuOExrbWYwRGgvWjFPVzV5cEx4RDRaVVZKb3k3?=
 =?utf-8?B?M2JldTV5NitLOWhueDgvR253Z2laaEdpbEpXcDdaLzFWWEFqcjA2OVdlamlG?=
 =?utf-8?B?emFTckZPOTBLa1FBZnQwZG02eUM0dDNiTGdnc1R5cXJVamErN1A5WXN4Mk9S?=
 =?utf-8?B?MWgyNjdlSElmR0FraXRMcnpNV29zU2N1aUd1WG03QXRpYjJweU11czg3SEs4?=
 =?utf-8?B?SHpWQ3NLbEtoczRqcVNYbzZhVWtMb1BoY09NNVVyOTU5bngzaWFEaFlZUzNL?=
 =?utf-8?B?alNKeXU4aXZPZlE2Z0tkeDVIaldwYWxPWjZTRFg2bWJ3bTFsem1Qc3VBTkpo?=
 =?utf-8?B?TWpkSEFCTGJleUNjRUFuMFhOWSs0cU9jN1NZbllQYXFQZm1kZVg0RzNVZ3cx?=
 =?utf-8?B?Y0VHL3RkVFJqRTFTcllKSXR4OWMvY1pFM3pTMDhENXg0NzVOdURiNEg1MVFz?=
 =?utf-8?B?Q1piZ2hIdFNtcE9CZzV5Ti9uaVFhQXVkS2IwRlhNUUw3ZWZGOHN2aFdYblVK?=
 =?utf-8?B?aHBka094Qi9EYzFVRldGcVZ0dk9tYzY3UHU4VWtKaXgxSFd2NkpoSWp4MEEy?=
 =?utf-8?B?YWFTZkg4YlNYUjZKVUtkc0NnekpmQXMydGROZzM4d3FSZkpVTW1DNG55NE9J?=
 =?utf-8?B?T2ZVbTdiK2hrWDNhMnFsT1BHMkk4QjV1UzdPL3llMFhPWG0rQ2JOQ0pURmpu?=
 =?utf-8?B?NWE2MkNNYzFmeVhyWlV6UUtiQ1M3VXJVUDhPZ1NmQ1A2Mjcxd3Q5czhGZGxl?=
 =?utf-8?B?WUx3RllxLzlHZDVGOHpnMGRUbjR1d2NvRTZWdFA4Mm92STJmUGJnNkYrTCtn?=
 =?utf-8?B?enlDU3NyTkpRaVVDWUs0c0MxeHo0RFVZNGwrRXdaMkkxMnMvU1QyclBJcGwv?=
 =?utf-8?B?OVFLbTNaMlBZSTRoaGFsRUoyRDJtTDIxL2hzaXpXc2pZZVkveTRHd0lLL0tB?=
 =?utf-8?B?WTI4NnV2T1VZMTBNRFZ1a01hL3dGdzdZakxkL29oUW1FMTJGU0FIclpPQnpB?=
 =?utf-8?B?YlZjd2hkWnNaZnZyNVRJVkhFZS85ZWN6ckkwWWJrOFBucnl2SVBMU0hXYVhK?=
 =?utf-8?B?czhNSDVlY0c1T25wUlU4bldwa0xHRldoUTVJdjV6N3FCVVFML1hXZUtWZWVS?=
 =?utf-8?B?dGtHMnZ5MTR1aEV6TW80V1hoZVNRSlZKVUx5ejR2SUpYb1RaejJHb2oyZTNU?=
 =?utf-8?B?YldqdG5Zczk0UlpkdG5OZlE5SVc1cUFKVExFbWpkRkkxbTJtZ1FRUytuRnhC?=
 =?utf-8?B?bng0RkQwQnkzcWE1ZWIvTEl2eFZ6Mkg2aHhJMnZTckpMMU9hTHplZml6bkhS?=
 =?utf-8?B?U2t6bzgvL1Rud2prZEQyT2JSYjZyeVdYVUdQOHp0UjVaV0JDZG1pYWRzWkgr?=
 =?utf-8?B?WWZkTlNIYTZRZlEyWGZ6dGhHcU5SSU9mTEZoUmE4OXpvOUJtajg4ejA1Y1du?=
 =?utf-8?B?Y3g0cGhMK1dRYnZNOTV0UlhNTVRaait3bjIwc1ovTHFhOHMwcnZ6SnJkaENS?=
 =?utf-8?B?NmRTdXRvcEdrVGRqQlR5MFQvNFZoV3lXYTJmcVRqMVFjZGtEVktaQThWOHVX?=
 =?utf-8?B?MXFqZTA4Uld1SWROUWRIZWIvWlJHMWlWZ0ZoVXA3eUpxUjVXVzg3Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3b40ea-68a7-4a28-2f02-08da49e4212a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:58.6161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9eT5U2k4DAGacPlv+bhCQxxPJppbv8Zu1AngBVlQBzD/ymfwznsiSQVyUkbqq1PSrb94eNeMmWeevhq5yq7HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5280
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a drm bridge driver for i.MX8qxp pixel link to display
pixel interface(PXL2DPI).  The PXL2DPI interfaces the pixel link 36-bit
data output and the DSI controller’s MIPI-DPI 24-bit data input, and
inputs of LVDS Display Bridge(LDB) module used in LVDS mode, to remap
the pixel color codings between those modules. The PXL2DPI is purely
combinatorial.

Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri iMX8X, LT170410-2WHC, LP156WF1
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Marcel, I add your T-b tag from v6, let me know if you want me to drop it, as
the checkpatch fix and indentation fix in v7 are trivial.

v7->v8:
* No change.

v6->v7:
* Fix below complaints from 'checkpatch.pl --strict'. (Robert)
   - 'Alignment should match open parenthesis'
   - 'ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP'
* A trivial indentation fix. (Robert)
* Add Marcel's T-b tag.
* Add Robert's R-b tag.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Use 'fsl,sc-resource' DT property to get the SCU resource ID associated with
  the PXL2DPI instance instead of using alias ID. (Rob)

v2->v3:
* Call syscon_node_to_regmap() to get regmap instead of
  syscon_regmap_lookup_by_phandle().

v1->v2:
* Drop unnecessary port availability check.

 drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 487 +++++++++++++++++++
 3 files changed, 496 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 4d1f027d07f8..1ea1ce7f558c 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -14,3 +14,11 @@ config DRM_IMX8QXP_PIXEL_LINK
 	help
 	  Choose this to enable display pixel link found in
 	  Freescale i.MX8qm/qxp processors.
+
+config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
+	tristate "Freescale i.MX8QXP pixel link to display pixel interface"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable pixel link to display pixel interface(PXL2DPI)
+	  found in Freescale i.MX8qxp processor.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index c15469fb5789..e74dd6422e95 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
+obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
new file mode 100644
index 000000000000..309f47a14cb6
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2020 NXP
+ */
+
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#define PXL2DPI_CTRL	0x40
+#define  CFG1_16BIT	0x0
+#define  CFG2_16BIT	0x1
+#define  CFG3_16BIT	0x2
+#define  CFG1_18BIT	0x3
+#define  CFG2_18BIT	0x4
+#define  CFG_24BIT	0x5
+
+#define DRIVER_NAME	"imx8qxp-pxl2dpi"
+
+struct imx8qxp_pxl2dpi {
+	struct regmap *regmap;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_bridge *companion;
+	struct device *dev;
+	struct imx_sc_ipc *ipc_handle;
+	u32 sc_resource;
+	u32 in_bus_format;
+	u32 out_bus_format;
+	u32 pl_sel;
+};
+
+#define bridge_to_p2d(b)	container_of(b, struct imx8qxp_pxl2dpi, bridge)
+
+static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
+					 enum drm_bridge_attach_flags flags)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(p2d->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(p2d->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				 p2d->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static int
+imx8qxp_pxl2dpi_bridge_atomic_check(struct drm_bridge *bridge,
+				    struct drm_bridge_state *bridge_state,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+
+	p2d->in_bus_format = bridge_state->input_bus_cfg.format;
+	p2d->out_bus_format = bridge_state->output_bus_cfg.format;
+
+	return 0;
+}
+
+static void
+imx8qxp_pxl2dpi_bridge_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+	struct imx8qxp_pxl2dpi *companion_p2d;
+	int ret;
+
+	ret = pm_runtime_get_sync(p2d->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to get runtime PM sync: %d\n", ret);
+
+	ret = imx_sc_misc_set_control(p2d->ipc_handle, p2d->sc_resource,
+				      IMX_SC_C_PXL_LINK_SEL, p2d->pl_sel);
+	if (ret)
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to set pixel link selection(%u): %d\n",
+							p2d->pl_sel, ret);
+
+	switch (p2d->out_bus_format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG_24BIT);
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG2_18BIT);
+		break;
+	default:
+		DRM_DEV_ERROR(p2d->dev,
+			      "unsupported output bus format 0x%08x\n",
+							p2d->out_bus_format);
+	}
+
+	if (p2d->companion) {
+		companion_p2d = bridge_to_p2d(p2d->companion);
+
+		companion_p2d->in_bus_format = p2d->in_bus_format;
+		companion_p2d->out_bus_format = p2d->out_bus_format;
+
+		p2d->companion->funcs->mode_set(p2d->companion, mode,
+							adjusted_mode);
+	}
+}
+
+static void
+imx8qxp_pxl2dpi_bridge_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+	int ret;
+
+	ret = pm_runtime_put(p2d->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n", ret);
+
+	if (p2d->companion)
+		p2d->companion->funcs->atomic_disable(p2d->companion,
+							old_bridge_state);
+}
+
+static const u32 imx8qxp_pxl2dpi_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
+};
+
+static bool imx8qxp_pxl2dpi_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts); i++) {
+		if (imx8qxp_pxl2dpi_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+						 struct drm_bridge_state *bridge_state,
+						 struct drm_crtc_state *crtc_state,
+						 struct drm_connector_state *conn_state,
+						 u32 output_fmt,
+						 unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (!imx8qxp_pxl2dpi_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
+		break;
+	default:
+		kfree(input_fmts);
+		input_fmts = NULL;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static u32 *
+imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+						  struct drm_bridge_state *bridge_state,
+						  struct drm_crtc_state *crtc_state,
+						  struct drm_connector_state *conn_state,
+						  unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts);
+	return kmemdup(imx8qxp_pxl2dpi_bus_output_fmts,
+			sizeof(imx8qxp_pxl2dpi_bus_output_fmts), GFP_KERNEL);
+}
+
+static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.attach			= imx8qxp_pxl2dpi_bridge_attach,
+	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
+	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
+	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts,
+};
+
+static struct device_node *
+imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
+					   u32 port_id)
+{
+	struct device_node *port, *ep;
+	int ep_cnt;
+
+	port = of_graph_get_port_by_id(p2d->dev->of_node, port_id);
+	if (!port) {
+		DRM_DEV_ERROR(p2d->dev, "failed to get port@%u\n", port_id);
+		return ERR_PTR(-ENODEV);
+	}
+
+	ep_cnt = of_get_available_child_count(port);
+	if (ep_cnt == 0) {
+		DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
+			      port_id);
+		ep = ERR_PTR(-ENODEV);
+		goto out;
+	} else if (ep_cnt > 1) {
+		DRM_DEV_ERROR(p2d->dev,
+			      "invalid available endpoints of port@%u\n",
+			      port_id);
+		ep = ERR_PTR(-EINVAL);
+		goto out;
+	}
+
+	ep = of_get_next_available_child(port, NULL);
+	if (!ep) {
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to get available endpoint of port@%u\n",
+			      port_id);
+		ep = ERR_PTR(-ENODEV);
+		goto out;
+	}
+out:
+	of_node_put(port);
+	return ep;
+}
+
+static struct drm_bridge *
+imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
+{
+	struct device_node *ep, *remote;
+	struct drm_bridge *next_bridge;
+	int ret;
+
+	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
+	if (IS_ERR(ep)) {
+		ret = PTR_ERR(ep);
+		return ERR_PTR(ret);
+	}
+
+	remote = of_graph_get_remote_port_parent(ep);
+	if (!remote || !of_device_is_available(remote)) {
+		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
+		next_bridge = ERR_PTR(-ENODEV);
+		goto out;
+	} else if (!of_device_is_available(remote->parent)) {
+		DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n");
+		next_bridge = ERR_PTR(-ENODEV);
+		goto out;
+	}
+
+	next_bridge = of_drm_find_bridge(remote);
+	if (!next_bridge) {
+		next_bridge = ERR_PTR(-EPROBE_DEFER);
+		goto out;
+	}
+out:
+	of_node_put(remote);
+	of_node_put(ep);
+
+	return next_bridge;
+}
+
+static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
+{
+	struct device_node *ep;
+	struct of_endpoint endpoint;
+	int ret;
+
+	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0);
+	if (IS_ERR(ep))
+		return PTR_ERR(ep);
+
+	ret = of_graph_parse_endpoint(ep, &endpoint);
+	if (ret) {
+		DRM_DEV_ERROR(p2d->dev,
+			      "failed to parse endpoint of port@0: %d\n", ret);
+		goto out;
+	}
+
+	p2d->pl_sel = endpoint.id;
+out:
+	of_node_put(ep);
+
+	return ret;
+}
+
+static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
+{
+	struct imx8qxp_pxl2dpi *companion_p2d;
+	struct device *dev = p2d->dev;
+	struct device_node *companion;
+	struct device_node *port1, *port2;
+	const struct of_device_id *match;
+	int dual_link;
+	int ret = 0;
+
+	/* Locate the companion PXL2DPI for dual-link operation, if any. */
+	companion = of_parse_phandle(dev->of_node, "fsl,companion-pxl2dpi", 0);
+	if (!companion)
+		return 0;
+
+	if (!of_device_is_available(companion)) {
+		DRM_DEV_ERROR(dev, "companion PXL2DPI is not available\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/*
+	 * Sanity check: the companion bridge must have the same compatible
+	 * string.
+	 */
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!of_device_is_compatible(companion, match->compatible)) {
+		DRM_DEV_ERROR(dev, "companion PXL2DPI is incompatible\n");
+		ret = -ENXIO;
+		goto out;
+	}
+
+	p2d->companion = of_drm_find_bridge(companion);
+	if (!p2d->companion) {
+		ret = -EPROBE_DEFER;
+		DRM_DEV_DEBUG_DRIVER(p2d->dev,
+				     "failed to find companion bridge: %d\n",
+				     ret);
+		goto out;
+	}
+
+	companion_p2d = bridge_to_p2d(p2d->companion);
+
+	/*
+	 * We need to work out if the sink is expecting us to function in
+	 * dual-link mode.  We do this by looking at the DT port nodes that
+	 * the next bridges are connected to.  If they are marked as expecting
+	 * even pixels and odd pixels than we need to use the companion PXL2DPI.
+	 */
+	port1 = of_graph_get_port_by_id(p2d->next_bridge->of_node, 1);
+	port2 = of_graph_get_port_by_id(companion_p2d->next_bridge->of_node, 1);
+	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
+	of_node_put(port1);
+	of_node_put(port2);
+
+	if (dual_link < 0) {
+		ret = dual_link;
+		DRM_DEV_ERROR(dev, "failed to get dual link pixel order: %d\n",
+			      ret);
+		goto out;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev,
+			     "dual-link configuration detected (companion bridge %pOF)\n",
+			     companion);
+out:
+	of_node_put(companion);
+	return ret;
+}
+
+static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
+{
+	struct imx8qxp_pxl2dpi *p2d;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	p2d = devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
+	if (!p2d)
+		return -ENOMEM;
+
+	p2d->regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(p2d->regmap)) {
+		ret = PTR_ERR(p2d->regmap);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	ret = imx_scu_get_handle(&p2d->ipc_handle);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
+				      ret);
+		return ret;
+	}
+
+	p2d->dev = dev;
+
+	ret = of_property_read_u32(np, "fsl,sc-resource", &p2d->sc_resource);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to get SC resource %d\n", ret);
+		return ret;
+	}
+
+	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
+	if (IS_ERR(p2d->next_bridge)) {
+		ret = PTR_ERR(p2d->next_bridge);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
+				      ret);
+		return ret;
+	}
+
+	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
+	if (ret)
+		return ret;
+
+	ret = imx8qxp_pxl2dpi_parse_dt_companion(p2d);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, p2d);
+	pm_runtime_enable(dev);
+
+	p2d->bridge.driver_private = p2d;
+	p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
+	p2d->bridge.of_node = np;
+
+	drm_bridge_add(&p2d->bridge);
+
+	return ret;
+}
+
+static int imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
+{
+	struct imx8qxp_pxl2dpi *p2d = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&p2d->bridge);
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id imx8qxp_pxl2dpi_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-pxl2dpi", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8qxp_pxl2dpi_dt_ids);
+
+static struct platform_driver imx8qxp_pxl2dpi_bridge_driver = {
+	.probe	= imx8qxp_pxl2dpi_bridge_probe,
+	.remove = imx8qxp_pxl2dpi_bridge_remove,
+	.driver	= {
+		.of_match_table = imx8qxp_pxl2dpi_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+module_platform_driver(imx8qxp_pxl2dpi_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX8QXP pixel link to DPI bridge driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.25.1

