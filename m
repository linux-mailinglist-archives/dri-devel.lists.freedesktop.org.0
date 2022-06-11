Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA8547559
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859310E4B3;
	Sat, 11 Jun 2022 14:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5878210F6D8
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UA2Jst12x6EoNzZsCiRVJhmlD3F4dWCgohKtvoV6n0r5i6ROtYIjawyV1lsACStHJUiZcjMzVr2SQT4jzrjSA3ak/L1dT+PuhAX9xJl576OfXHk/s/xHcsBEInClj+U4gA57FlXa4qN0lX3ZX/m0DGrY8k8xY+3ZpaAPEm9rX/jKvymVdjf4qa47whNFrVySaArTnBRrrs1fljskIb3XVE948WGiZ6WuAh7HQpzY2uSi6u5tVN/YHMlJG2OGKFENAQd4G+jZKO6+mtiQaMFqetO+kXXi4BpR27AK69IvgfncCdLBjnhoOZI5z2MKg0z7quTFzFPbSyi2K6r5CT/SOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPv9/pkV2T0aAGsGWCffw9RyRwxn/C/yHQfmzKD8KYA=;
 b=BHP+kkveinBpDbjV0NYHW/gAh0XI4jmGfLMg6NXBIbNaageHIu3459kztzOIaI3GRNAmdckz15QHzgT+RqGa2s9ajlnphCPUbfSwb4LIRGam40YW+S+0aodWh5SZ7Swu+7hIfJUfJOS8iVFtj18r8r2C27kPPBaT8PwF4BMVFQIFWRAQbH88vRD5uUkj3+6RvshIA9qH9gVDgAzGc47cn5+Xenzos3X63fW9FN/orbYMolU/Vx8VVN0yUghd/hWSRdzyg97WsL5y6MUyX3ajQiEq9bqW2YxyGSytSABjaDAXWKnme72KuXlLp0Pt5VFpHHQzONNuSzVs+7ltf5tXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPv9/pkV2T0aAGsGWCffw9RyRwxn/C/yHQfmzKD8KYA=;
 b=swjP7oDdcPhBGqK7fPdmk+wfN+cYIcGXX7e5m5Isbwc+2q49740o/K+8PkkVypSbsxLVn0CtQkT/SfYFtBc+p5HO7FffObpvWYD7QC4DGmHYeN0qOZ/9A+5K78Y6fkJM0z71tjwZNs2ElXycPjbI5O2Jdy59XQ4F0s/MCWD/kl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:13:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:13:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 08/14] drm/bridge: imx: Add i.MX8qxp pixel link to DPI
 support
Date: Sat, 11 Jun 2022 22:14:15 +0800
Message-Id: <20220611141421.718743-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eaa3a73-2047-45da-e73f-08da4bb497a4
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB6347A861359F8669A6B366AB98A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00nwUp2KcecCJjVAFZszy1A5EVpIqB1PdGkG2X2prOHV36UnXXsN6i7HYTxfdKrDiPRQGTGw1PPVVLXz6mabgo29udFCKsPcNqCG8hl1RshWlkpkOeitegU/J3xJVQb9y9D92hE/DhSnJyktKUfPMHFd6VCAbOEz/uCJDHRfFBtsn3/zQMonhcFnRQNZmKCHfWBC7GPiv1bzVL0bGhFHHNpTYXU5YEnVl9menI8uWKGOzutERzuKnVFSEDI4UtCcykZx6YcUTH4V1zI7AsvSRRlm/9krZql5jikN4Yw0D8FP3NWT9Fsyh68p7dlVNU+DZJ87UiPTnOo/Py0LR2YMGj4BFAA4RfDjuEprYm5UuBG8DD7A7Hydj1cnQCKkUEa7ZD9PiVa0yr8tRkXpWoF627W1NfHqh8ItkO4DicKAJiaoaoZ8lklnToR2Xd64sNuI/pDOw9LCSemU40IOWPp6kMKQPsw3cP1EbguJON9wRDd9CDbO65+1rerGcE1POHlOhfwYZICjH2EnOzUVOcppEjtLXQBArRV5pHjl2xOZPVSs2+WkOIASmq+vmCpS3hQO1ujvIYed4iYqSdyX6ZMNh9hBOdSexDQTsvxLUKeiWl/Y8jAGTCxmB7Y+xnRZ7RA7kMLxoaT35AKW073d8YLj+uBubwKRMEIgKn6nF+cuOQBa2Qm80B4uoPXEAy0SoUx+jyg3FNUH3dtxYMP1dlO0Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(30864003)(36756003)(83380400001)(52116002)(38350700002)(38100700002)(6512007)(26005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGRiZDlaN3JIb1loNDVROUxMc2pyZk90UWUvOTJxRXphUGxNNjk4V1h1UGJ1?=
 =?utf-8?B?RmxQU3hmUGh0b0QvQWF4dGhaMmxDTXhWOHlYc1hIVDNzRWsvRUZKT29VZmwv?=
 =?utf-8?B?Z0FzUGx6K2tHQVBJbUFrcWM2emY5Q0dkb3BRRkF3eTRuaHd0VFA3cGNLL1Fo?=
 =?utf-8?B?eDVqZUYvQ0pYcUt3eTNZaUo2Z0xZcWRxeWgvZG9TUkpCdlNsNDdQaEIxL0M2?=
 =?utf-8?B?ZXF2Vy91aUxqSGJvTUU4c3V0MXJYVk9jR0RFTlpNNWFXQzgrb2ROeVZJNVlF?=
 =?utf-8?B?MzRkMnNVY2wxc1M5TjIxYzBvTnRuNXQyaUN3YXFoLzJkSURNUDdlbFpxblNz?=
 =?utf-8?B?Y0VwaWtkOVNOaWN4UFFLTkVNQ2N0N0djK0tIWHM0TENqRVNRT1pyc0xlU01z?=
 =?utf-8?B?OHBGYk9JNmE5eGZ5RVhVZXI3VXM5OGIyQjZiKzNmR3lNUC81NUhGRXBjQ2My?=
 =?utf-8?B?Sm43NDNFZTd3V1VyYXRYNWV5dFJ3MCtvRWVNQmFzVzJwbkJZOE42bGJvZFk2?=
 =?utf-8?B?d20yMzRONkM0SDM5Qld6d2U4aDRmT3V0UUlXVzVpUXEzMjducU1KemkvMm5l?=
 =?utf-8?B?cVFEdGJXVU82b2ZsY3dsd01BVHRhT0tSdG9GeEdOVk1aeGhuTjIvWFJtaFl6?=
 =?utf-8?B?TDgveitJVGtweGtwZzhvYjIwZllMSm5ZVUJ6UG1xdDZkM2xmWGFLYnRUSDJv?=
 =?utf-8?B?VXNYV0RRNzA3L1p1U0xHYk1ET2QrV0hMYXJYdEQ5YmxibDVtZ1V1TDRzSHNl?=
 =?utf-8?B?MFdFZW05UHIydzAyT1lNUTlEZzVlOW5VZ1ZGNGh6TExmZVQ2QTl0TDRPYWE3?=
 =?utf-8?B?OXVDbUt0YzJsU0kxdXI4ZmNzbUR4V25aWGJGU1g3TzNSRS8zdnZyclI3dERF?=
 =?utf-8?B?MWppSzFnKzkwdE02ZGVwZnd6bXMvcWoxNmRDcmVxMHJkQlBYR2Z2ekFsZFh5?=
 =?utf-8?B?TitHbE5CNTdPYkc2SWFqdU9qWjdtTzJiQkpsNmZISnkySHBKVEd2bDNUVmN4?=
 =?utf-8?B?V05Na2lxMDJlOE5hV3FLVEZGckFpK1BEY2V6TFQ1SWRPTExhVzRTSWR1d3dF?=
 =?utf-8?B?cDdTaE4vbjEzck9pdE5UT3YyUkRDd1pTWVJuR2NFaFQwRjFjT0kvRVltMlN5?=
 =?utf-8?B?ZkcwdmtuRlVITUlnZWxrdmJ4VUVkY2Z0Wmx2aWlwbTJPb2FMRTZqQXZBU0VL?=
 =?utf-8?B?am51WjllcmhiV2dMWUs4Qy9URjFZRElsUnFGeXdIKzR3UUVtZFF0c25kbHlK?=
 =?utf-8?B?dkQzODloYkpMV25VcW4xdndOcXpVV2JLdE93NHNiOW5temxuRW1ndm53eWdE?=
 =?utf-8?B?Z3NIQ3ZlM0hZYW84Zno3V2lNSzJZL3l4VFRvM1F4WHhoZjVnOC9keElRTWl5?=
 =?utf-8?B?VlV1cnVBc0RnZnFUNWlkOFk3SVNvZGV6YUlhc0FHVjZuNHJFbDA4ZkFUMENQ?=
 =?utf-8?B?WFE0K2I4SGZXWFFmNVpaamxaWGtHMUNsV3lONXU4ejRwTnRFYlNlWkR5ODhz?=
 =?utf-8?B?TnN6VFQ0MHYxL3o2ZEV2eEFRb2RaY1RvbXczZjlUOW9rSS9YWUFyRndaV29X?=
 =?utf-8?B?YjR1Q250ME1PdWEzb1lvUURhUVgvZ3BMVXVibzIvZFE1VFBTdW1WRmNLTGw5?=
 =?utf-8?B?VGw3dmdFZGNOMmlMVHpWTEZCeGdmcHhFclRHUmNJNDB2Q0FueUpZUHdtZWZi?=
 =?utf-8?B?aVhKTDlEeEEzSW9QSUE0eFRLekM3MkdvNjNHazBlL2o3NmZVVDM4WkFXbHNz?=
 =?utf-8?B?Rk5OeC9qRWJrU2dOZE9QN1hnL2dYbE04Y0NsQWgzaVRmSEpMclk4QStjRlN2?=
 =?utf-8?B?QjBpWnRMQldNV1I2cEhOeDY3UkdDNFV0b2MwRlU0NVJZUjdCWGJPYWpRbVps?=
 =?utf-8?B?UTFSOTQzc2VEbmtDbG1taU40dElOWEhEWkNDZnhLdHRmaEpZS1dZekkrT3Ey?=
 =?utf-8?B?QWlpT2VUU2F5ZmJsZ1cvTWJ1TFZDbTlrZzg2MnJUaW80MGJQY3YzTnI3VnZV?=
 =?utf-8?B?QXFCMUJKOFRPZWYvd2wxZGVJOWI4dEpNTVEycG5Yd0kxdXJEYkM4eXFGckRX?=
 =?utf-8?B?bnlKT2lQUmxPeExzZDBKQTJEYXBweUZGS3phdmUzcTREcFZDQWhDUVpZaUdO?=
 =?utf-8?B?U3d6Q1gwaExrMDdXQXZNTzRCVnFzMXdTeHp1VjRYaTRuVkVJeFdFdUU0cWtB?=
 =?utf-8?B?dFVPSTB0aEl4ZXRSQWt3SGQ2d1dZUGJXQThTaWthakxMekVCdnozamJXS0Qy?=
 =?utf-8?B?ZExjZWdjbWdpdDFyYmFaV255N0JwdE1hSVVHWEVodnkyWCtVdTVPTEZ0UU42?=
 =?utf-8?B?ZEpFMWNVb044WVVuN1FvWHFjeXpaT09iMmx5MCtjOFB2UHlaZnFSQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaa3a73-2047-45da-e73f-08da4bb497a4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:13:43.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nWbNDvFiZ2gO6SqiuOTl8rm85H8B9rMwV8/N/Ddd874alEksjmmmsGKcFawVSGTuVjtHYn8IeO9tQlZv+vU8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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

v8->v9:
* No change.

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
index 9f6ec601af37..53001650a61a 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -15,3 +15,11 @@ config DRM_IMX8QXP_PIXEL_LINK
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

