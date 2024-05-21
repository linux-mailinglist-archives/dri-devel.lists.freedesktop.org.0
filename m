Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEE58CA67E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65410E465;
	Tue, 21 May 2024 02:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908B10E465
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdklX/9wIhq8thQvTsZpCEUGRrWZdQL5nNKAwcO6RsSAQGE5BuO34wcYmmSwC6i7HfIHKpAoHsGFO4pO/EaoyaDO8egz5o6aBS0QiN4a7TWe4MM9FSAch7RWoaG3gu5mubnlCmJaTYEw9w9K9IWjLdRvjvsN7uzg/zuFKqKNcSwhcLJXyFqjEaW1n51irCPxYw0W1Mb6fKkBQcsmly8KHBBOwKN8gepS1XoN3lHFCI7ZmVIGjrHxFtXalXrxqX/OgHp4/5od8Hu/3dJjOx5V8QssgnSLh7vmxlFYVach2tmtb1aMKCVyZLoBQuRTV0qMV7B/uRmEs1NV7Fmmz5ieZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtKFCKRO5L1v4IcU4Rq0x1MMrsUrK41w+oVQOWZBCYI=;
 b=I05sfMRETfvd7irj1DI2ZpXCiL+D+buMB0x8uikdB1sTF0vcng+lS6ISVT7Ofe7S8/meMzxoBPqoCMJikJPBgaufPCVUDhDCLQ2DjZqyfQA8hf402a8kRDyf6hDW93Z4N7SU7SxmzOZhiNwPusLQPKwlL0x9JRJ0XtYQAy8WP3yw/KZATjWWMlo41ByqEH+Ng2uZ52XkXPSrIWpCGgy/T++kngCSpR0VrLBcPNsJxgQ7Lc3tvvwfl/nLqpKzvQOofHgtbtespGBuUy1lrsrhcji+23ZA76dg12QiHB8ZNvmik47wkUHaLl03S4rEc0pXBrJUU12S8E2/ULTgU8pVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1128.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 21 May
 2024 02:58:34 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:34 +0000
From: keith <keith.zhao@starfivetech.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 keith.zhao@starfivetech.com
Subject: [PATCH v4 08/10] drm/vs: add vs drm master driver
Date: Tue, 21 May 2024 18:58:15 +0800
Message-Id: <20240521105817.3301-9-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240521105817.3301-1-keith.zhao@starfivetech.com>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1047:EE_|ZQ0PR01MB1128:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5de063-1dd6-4507-84e6-08dc7941e784
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6HOkAaU80PZzU2zIenjNFBYe+GVh6t8c+Wa7QUZCguVmGtaBp/5a3W32Aa9ZM1Wr3x2G2QwavHEOVqjDVKicFlTHf7fogKDXalkYF8d2S2qN8GtNSkSx87ZPg3xvscNswPbCm9DvxZrTh3W2f+hnTFksinDCLJqpFQJ3EctiZwaobJkv9xQOw8nBTEL9LR2OPl9YRLmwo8f+EUD+IOVdfIwITsJhlN1zafzj0Js+tLMI56X7j56U4LUsAXgXk2+VLwjmshVWmRtStWxklp3ouCckAPiPvhi0WlzLUMXtDiMV8Wi5SRa5LObOUQrEjJykBHyY3/UKytvHE2RULKNUPsNPjPeFU2dMVv5uoUH0/XpZFhKe3T4ao2LMfkF9UyCajmwjcok8pyCLIHF9agZmZfZ4rCLniyNzmEpZ1RXXxE+EBgIsU583M0VySZeqaJksKjlwdASuM1sbNHJ+LKRh0p5XCTHldWItFeawcFuftIDsWvsFSPlORZAYK/pgzmrI4//VGJYg2igWQrdXcKtvUKntX451EtSI0QcvZ+DTpUX3yTOUSTCqvIN9PXJpu5XL7g2VjLgQoRGfMH9b8Y5BPlftihzkvzLV1rwFnHN6Ub2e7oQ/AfIoAye+fgzbIGJ6UKViwNdUcEehJI3FT9z+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(52116005)(7416005)(1800799015)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BSRIFqIUGGCbJ6wv5N8Rgflys62TyF23aLhHl8A0Rv0r000Erbnv67GoPM/9?=
 =?us-ascii?Q?gFREeWl7ABm4bxp56CaKjbA/9JgyDk+9jVnqY+C8Dvfm96yc0eK8UUydJy0O?=
 =?us-ascii?Q?5ic5znYT+6HBrN/Pm8lqBaCwOe8bxF9cpLUAz1T/3nW/nPR1elZlqytyLVja?=
 =?us-ascii?Q?qSbxEY7efld763NGXzw+u7dODmW+ndOq7HAISNh40Q+cHPtUUExbNwUu3A3Z?=
 =?us-ascii?Q?wDPRN1x7+BbXt1ws9KswVrGsBlTnN+z9Bq9LOHM0jvkBXq/6hgvn4iTmAUX0?=
 =?us-ascii?Q?9PS5Hu7jU2UES+EJ0AcFOHKCknAfKpNFojMNfM92KCe67X1VIqwY3GicmsEX?=
 =?us-ascii?Q?B4RC/7OAbAFNMXk+W+25u1Pp4APp6tDnIIqVAgPc6mJanVnDjG+BkB1b6elR?=
 =?us-ascii?Q?oPWEno30ijxMsfedBrVRRQsSUsur83Ga13aADRW5XNBoKv9LfWkEWrLfcliq?=
 =?us-ascii?Q?g/z10vvAPwVtrEbPDivuRDQoU4sNt3DjOk/Xjs4GMSDrMhnSt/FhVLk0VCc0?=
 =?us-ascii?Q?lf8/ecDAtjjET5yaYTljZWdJ5l2WDtkiOMdHQDdSyR7Ht6BRScUwyY2xAtB3?=
 =?us-ascii?Q?WuUVeCMrif8KGlPuoM6A/aoYWLZawAn07zzZYhfXXr4onkzFK0tk752bNkU9?=
 =?us-ascii?Q?C2QUblgvmap2r9Sv31oyuKqdY46zuebLpTRlOuF0Ka/yb5xbWJmFqZTxfevg?=
 =?us-ascii?Q?w/e3g8+eYFjbMSBdG55k9/KPp97D4f680suaw/mJChSWnIHA1bnF/JeyctL7?=
 =?us-ascii?Q?SuOIOX52k60ez45LRsVvgqAAUjss+kVj+I9dmGdbdOTqQMN8ALGWCQCvLq7W?=
 =?us-ascii?Q?cNSY6QOR9YuxXxgoQHc7AGfpi2eURGtLV+jfqasySw7jipLSL2ovgYz8AygF?=
 =?us-ascii?Q?uVinDdt71SRXwiStPUGlxLlyXIFN1xfPMHBNrgx7/tymRajd0qIoMsrgn0eq?=
 =?us-ascii?Q?uQYPfNMrVjdcTsHUPE45QdDQTo0T89pE5MqR8NS4wWBUtoFPP0taWJHNc1h6?=
 =?us-ascii?Q?JJ2FuWh4A2q9wafbHOpKSsXq+4ZRJHp4KIPV7wCz38U3smzvrtzl/9O0oXa5?=
 =?us-ascii?Q?+98fPSBzUvoNNqtBZfxNfggdLzGa4R6U6e1X6yY8nZABGjQnIQ5hYK8sxi1i?=
 =?us-ascii?Q?mLMrx2HyaqIdh+J9d0ZaZIdxZ6hjIUYYFhdREGnmJO6MFcbZkwDFsFVd1WMX?=
 =?us-ascii?Q?mjOGG8pwtSmipdK5rANbdElWTayaN+r/gcTfyIhe2njylI2ZgckLsEqHTNrR?=
 =?us-ascii?Q?QiMYRlKwAzKI4Bk6GHeYhLkrzRVH3pYHWMz17298oag9olkDu9dxJP3DKNVI?=
 =?us-ascii?Q?u3Vk9WsCjrb+oa7NILiQcadiACl3Kvc+/DUSGXns7p2hGYsCxTP6RDB10AHR?=
 =?us-ascii?Q?nf6pXSVh2Tax7+zYZEnfPQuB8VqQwIpUlmdMLQghTCuJ0j5GXdP0QI3H9ppd?=
 =?us-ascii?Q?wh/wLLc3QwRP4rAhbOvjwiJn9MjIPwBP3q1XGg92Ycyf7FCrGbwUUKtdm/36?=
 =?us-ascii?Q?eqAl1rewSPaKgqV0F8jxRMjtTVu3hOD/Mm1wls+wl3z1+ybLG+qTknFfOCPt?=
 =?us-ascii?Q?jewsEe4rMiTYb+NrtHygZUvi9qdoVejkYh+R6gqUffK32jpZXvOLlqTDIiL9?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5de063-1dd6-4507-84e6-08dc7941e784
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:34.5329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGJ4ojovCHPyfK4H2bBLym7wHjErTk2FmR4bFJGkyissZf70DUt2VqunkMy9N+W0UdhGpjDrLpXXc4eKu+fUueWJgfMI56XmojmqvOexRzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1128
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

Add vs DRM master driver for JH7110 SoC
ADD DMA GEM driver

Signed-off-by: keith <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile |   3 +-
 drivers/gpu/drm/verisilicon/vs_drv.c | 718 +++++++++++++++++++++++++++
 2 files changed, 720 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 26a43ca0fd36..88a07a308e31 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -3,6 +3,7 @@
 vs_drm-objs := vs_dc_hw.o \
 		vs_modeset.o \
 		vs_plane.o \
-		vs_crtc.o
+		vs_crtc.o \
+		vs_drv.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
new file mode 100644
index 000000000000..c22fd2199fe2
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -0,0 +1,718 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/of_device.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_module.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_blend.h>
+
+#include "vs_drv.h"
+#include "vs_crtc.h"
+#include "vs_plane.h"
+#include "vs_modeset.h"
+
+#define DRV_NAME	"verisilicon"
+#define DRV_DESC	"Verisilicon DRM driver"
+#define DRV_DATE	"20230516"
+#define DRV_MAJOR	1
+#define DRV_MINOR	0
+
+#define FRAC_16_16(mult, div)	 (((mult) << 16) / (div))
+
+static const u32 primary_overlay_format[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_XBGR4444,
+	DRM_FORMAT_RGBX4444,
+	DRM_FORMAT_BGRX4444,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_BGRX5551,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_P010,
+};
+
+static const u32 cursor_formats[] = {
+	DRM_FORMAT_ARGB8888
+};
+
+static const u64 format_modifier[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static const u64 secondary_format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static const struct vs_plane_primary_info dc_hw_planes_primary[2] = {
+	{
+		.id			= PRIMARY_PLANE_0,
+		.num_formats		= ARRAY_SIZE(primary_overlay_format),
+		.formats		= primary_overlay_format,
+		.num_modifiers		= ARRAY_SIZE(format_modifier),
+		.modifiers		= format_modifier,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.min_scale		= FRAC_16_16(1, 3),
+		.max_scale		= FRAC_16_16(10, 1),
+		.rotation		= DRM_MODE_ROTATE_0 |
+					  DRM_MODE_ROTATE_90 |
+					  DRM_MODE_ROTATE_180 |
+					  DRM_MODE_ROTATE_270 |
+					  DRM_MODE_REFLECT_X |
+					  DRM_MODE_REFLECT_Y,
+		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) | BIT(DRM_COLOR_YCBCR_BT2020),
+		.zpos			= 0,
+	},
+	{
+		.id			= PRIMARY_PLANE_1,
+		.num_formats		= ARRAY_SIZE(primary_overlay_format),
+		.formats		= primary_overlay_format,
+		.num_modifiers		= ARRAY_SIZE(format_modifier),
+		.modifiers		= format_modifier,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.min_scale		= FRAC_16_16(1, 3),
+		.max_scale		= FRAC_16_16(10, 1),
+		.rotation		= DRM_MODE_ROTATE_0 |
+					  DRM_MODE_ROTATE_90 |
+					  DRM_MODE_ROTATE_180 |
+					  DRM_MODE_ROTATE_270 |
+					  DRM_MODE_REFLECT_X |
+					  DRM_MODE_REFLECT_Y,
+		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) | BIT(DRM_COLOR_YCBCR_BT2020),
+		.zpos			= 3,
+	},
+};
+
+static const struct vs_plane_overlay_info dc_hw_planes_overlay[4] = {
+	{
+		.id			= OVERLAY_PLANE_0,
+		.num_formats		= ARRAY_SIZE(primary_overlay_format),
+		.formats		= primary_overlay_format,
+		.num_modifiers		= ARRAY_SIZE(format_modifier),
+		.modifiers		= format_modifier,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.min_scale		= FRAC_16_16(1, 3),
+		.max_scale		= FRAC_16_16(10, 1),
+		.rotation		= DRM_MODE_ROTATE_0 |
+					  DRM_MODE_ROTATE_90 |
+					  DRM_MODE_ROTATE_180 |
+					  DRM_MODE_ROTATE_270 |
+					  DRM_MODE_REFLECT_X |
+					  DRM_MODE_REFLECT_Y,
+		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) | BIT(DRM_COLOR_YCBCR_BT2020),
+		.zpos			= 1,
+	},
+	{
+		.id			= OVERLAY_PLANE_1,
+		.num_formats		= ARRAY_SIZE(primary_overlay_format),
+		.formats		= primary_overlay_format,
+		.num_modifiers		= ARRAY_SIZE(secondary_format_modifiers),
+		.modifiers		= secondary_format_modifiers,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.min_scale		= DRM_PLANE_NO_SCALING,
+		.max_scale		= DRM_PLANE_NO_SCALING,
+		.rotation		= 0,
+		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) | BIT(DRM_COLOR_YCBCR_BT2020),
+		.zpos			= 2,
+	},
+	{
+		.id			= OVERLAY_PLANE_2,
+		.num_formats		= ARRAY_SIZE(primary_overlay_format),
+		.formats		= primary_overlay_format,
+		.num_modifiers		= ARRAY_SIZE(format_modifier),
+		.modifiers		= format_modifier,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.min_scale		= FRAC_16_16(1, 3),
+		.max_scale		= FRAC_16_16(10, 1),
+		.rotation		= DRM_MODE_ROTATE_0 |
+					  DRM_MODE_ROTATE_90 |
+					  DRM_MODE_ROTATE_180 |
+					  DRM_MODE_ROTATE_270 |
+					  DRM_MODE_REFLECT_X |
+					  DRM_MODE_REFLECT_Y,
+		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) | BIT(DRM_COLOR_YCBCR_BT2020),
+		.zpos			= 4,
+	},
+	{
+		.id			= OVERLAY_PLANE_3,
+		.num_formats		= ARRAY_SIZE(primary_overlay_format),
+		.formats		= primary_overlay_format,
+		.num_modifiers		= ARRAY_SIZE(secondary_format_modifiers),
+		.modifiers		= secondary_format_modifiers,
+		.min_width		= 0,
+		.min_height		= 0,
+		.max_width		= 4096,
+		.max_height		= 4096,
+		.min_scale		= DRM_PLANE_NO_SCALING,
+		.max_scale		= DRM_PLANE_NO_SCALING,
+		.rotation		= 0,
+		.color_encoding		= BIT(DRM_COLOR_YCBCR_BT709) | BIT(DRM_COLOR_YCBCR_BT2020),
+		.zpos			= 5,
+	},
+};
+
+static const struct vs_plane_cursor_info dc_hw_planes_cursor[2] = {
+	{
+		.id			= CURSOR_PLANE_0,
+		.num_formats		= ARRAY_SIZE(cursor_formats),
+		.formats		= cursor_formats,
+		.min_width		= 32,
+		.min_height		= 32,
+		.max_width		= 64,
+		.max_height		= 64,
+		.zpos			= 255,
+	},
+	{
+		.id			= CURSOR_PLANE_1,
+		.num_formats		= ARRAY_SIZE(cursor_formats),
+		.formats		= cursor_formats,
+		.min_width		= 32,
+		.min_height		= 32,
+		.max_width		= 64,
+		.max_height		= 64,
+		.zpos			= 255,
+	},
+};
+
+static const struct vs_dc_info dc8200_info = {
+	.name			= "DC8200",
+	.panel_num		= 2,
+	.primary_num		= 2,
+	.overlay_num		= 4,
+	.cursor_num		= 2,
+	.primary		= dc_hw_planes_primary,
+	.overlay		= dc_hw_planes_overlay,
+	.cursor			= dc_hw_planes_cursor,
+	.layer_num		= 6,
+	.gamma_size		= GAMMA_EX_SIZE,
+	.gamma_bits		= 12,
+	.pitch_alignment	= 128,
+};
+
+static int vs_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
+			      struct drm_mode_create_dumb *args)
+{
+	struct vs_drm_device *priv = to_vs_drm_private(dev);
+	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+
+	args->pitch = ALIGN(pitch, priv->pitch_alignment);
+	return drm_gem_dma_dumb_create_internal(file, dev, args);
+}
+
+DEFINE_DRM_GEM_FOPS(vs_drm_fops);
+
+static struct drm_driver vs_drm_driver = {
+	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
+
+	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vs_gem_dumb_create),
+
+	.fops			= &vs_drm_fops,
+	.name			= DRV_NAME,
+	.desc			= DRV_DESC,
+	.date			= DRV_DATE,
+	.major			= DRV_MAJOR,
+	.minor			= DRV_MINOR,
+};
+
+static irqreturn_t vs_dc_isr(int irq, void *data)
+{
+	struct vs_drm_device *priv = data;
+	struct vs_dc *dc = &priv->dc;
+	struct vs_dc_info *dc_info = dc->hw.info;
+	u32 i;
+
+	dc_hw_get_interrupt(&dc->hw);
+
+	for (i = 0; i < dc_info->panel_num; i++)
+		drm_crtc_handle_vblank(&dc->crtc[i]->base);
+
+	return IRQ_HANDLED;
+}
+
+static int vs_drm_device_init_res(struct vs_drm_device *priv)
+{
+	struct device *dev = priv->base.dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	int ret;
+	struct vs_dc *dc;
+
+	dc = &priv->dc;
+	dc->hw.hi_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dc->hw.hi_base))
+		return PTR_ERR(dc->hw.hi_base);
+
+	dc->hw.reg_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dc->hw.reg_base))
+		return PTR_ERR(dc->hw.reg_base);
+
+	dc->hw.info = (struct vs_dc_info *)of_device_get_match_data(dev);
+
+	ret = devm_clk_bulk_get_all(dev, &priv->clks);
+	if (ret < 0) {
+		dev_err(dev, "can't get vout clock, ret=%d\n", ret);
+		return ret;
+	}
+	priv->clk_count = ret;
+
+	priv->rsts = devm_reset_control_array_get_shared(dev);
+	if (IS_ERR(priv->rsts))
+		return PTR_ERR(priv->rsts);
+
+	priv->irq = platform_get_irq(pdev, 0);
+
+	/* do not autoenable, will be enabled later */
+	ret = devm_request_irq(dev, priv->irq, vs_dc_isr, IRQF_NO_AUTOEN, dev_name(dev), priv);
+	if (ret < 0) {
+		dev_err(dev, "Failed to install irq:%u.\n", priv->irq);
+		return ret;
+	}
+
+	return ret;
+}
+
+static u32 get_addr_offset(u32 id)
+{
+	u32 offset = 0;
+
+	switch (id) {
+	case PRIMARY_PLANE_1:
+	case OVERLAY_PLANE_1:
+		offset = 0x04;
+		break;
+	case OVERLAY_PLANE_2:
+		offset = 0x08;
+		break;
+	case OVERLAY_PLANE_3:
+		offset = 0x0C;
+		break;
+	default:
+		break;
+	}
+
+	return offset;
+}
+
+static int vs_drm_device_crtc_plane_create(struct vs_drm_device *priv)
+{
+	struct vs_dc *dc;
+	struct drm_device *drm_dev;
+	int i, ret;
+	struct device_node *port;
+	struct vs_crtc *crtc;
+	struct vs_dc_info *dc_info;
+	struct vs_plane *plane;
+	struct vs_plane_primary_info *primary_info;
+	struct vs_plane_overlay_info *overlay_info;
+	struct vs_plane_cursor_info *cursor_info;
+
+	struct device *dev = priv->base.dev;
+	u32 max_width = 0, max_height = 0;
+	u32 min_width = 0xffff, min_heigth = 0xffff;
+	u32 possible_crtc = 0;
+
+	dc = &priv->dc;
+	dc_info = dc->hw.info;
+	drm_dev = &priv->base;
+
+	for (i = 0; i < dc_info->panel_num; i++) {
+		crtc = vs_crtc_create(drm_dev, dc_info);
+		if (!crtc) {
+			drm_err(drm_dev, "Failed to create CRTC.\n");
+			ret = -ENOMEM;
+			return ret;
+		}
+		crtc->dev = drm_dev->dev;
+
+		port = of_graph_get_port_by_id(crtc->dev->of_node, i);
+		if (!port) {
+			drm_err(drm_dev, "no port node found for crtc_port%d\n", i);
+			return -ENOENT;
+		}
+
+		crtc->base.port = port;
+		dc->crtc[i] = crtc;
+
+		of_node_put(port);
+	}
+
+	if (!dc->crtc[0]->base.port || !dc->crtc[1]->base.port) {
+		drm_err(drm_dev, "no port no crtc mask, fail to create plane\n");
+		return -ENOENT;
+	}
+
+	for (i = 0; i < dc_info->primary_num; i++) {
+		primary_info = (struct vs_plane_primary_info *)&dc_info->primary[i];
+
+		if (primary_info->id == PRIMARY_PLANE_0)
+			possible_crtc = drm_crtc_mask(&dc->crtc[0]->base);
+		else
+			possible_crtc = drm_crtc_mask(&dc->crtc[1]->base);
+
+		plane = vs_plane_primary_create(drm_dev, primary_info,
+						dc_info->layer_num, possible_crtc);
+		if (IS_ERR(plane)) {
+			dev_err(dev, "failed to construct plane\n");
+			return PTR_ERR(plane);
+		}
+
+		plane->id = primary_info->id;
+		dc->planes[plane->id].id = primary_info->id;
+		dc->planes[plane->id].offset = get_addr_offset(primary_info->id);
+
+		if (primary_info->id == PRIMARY_PLANE_0)
+			dc->crtc[0]->base.primary = &plane->base;
+		else
+			dc->crtc[1]->base.primary = &plane->base;
+
+		min_width = min_t(u32, min_width, primary_info->min_width);
+		min_heigth = min_t(u32, min_heigth, primary_info->min_height);
+		/*
+		 * Note: these values are used for multiple independent things:
+		 * hw display mode filtering, plane buffer sizes ...
+		 * Use the combined maximum values here to cover all use cases,
+		 * and do more specific checking in the respective code paths.
+		 */
+		max_width = max_t(u32, max_width, primary_info->max_width);
+		max_height = max_t(u32, max_height, primary_info->max_height);
+	}
+
+	for (i = 0; i < dc_info->overlay_num; i++) {
+		overlay_info = (struct vs_plane_overlay_info *)&dc_info->overlay[i];
+
+		possible_crtc = drm_crtc_mask(&dc->crtc[0]->base) |
+				drm_crtc_mask(&dc->crtc[1]->base);
+
+		plane = vs_plane_overlay_create(drm_dev, overlay_info,
+						dc_info->layer_num, possible_crtc);
+		if (IS_ERR(plane)) {
+			dev_err(dev, "failed to construct plane\n");
+			return PTR_ERR(plane);
+		}
+
+		plane->id = overlay_info->id;
+		dc->planes[plane->id].id = overlay_info->id;
+		dc->planes[plane->id].offset = get_addr_offset(overlay_info->id);
+	}
+
+	for (i = 0; i < dc_info->cursor_num; i++) {
+		cursor_info = (struct vs_plane_cursor_info *)&dc_info->cursor[i];
+
+		if (cursor_info->id == CURSOR_PLANE_0)
+			possible_crtc = drm_crtc_mask(&dc->crtc[0]->base);
+		else
+			possible_crtc = drm_crtc_mask(&dc->crtc[1]->base);
+
+		plane = vs_plane_cursor_create(drm_dev, cursor_info, possible_crtc);
+		if (IS_ERR(plane)) {
+			dev_err(dev, "failed to construct plane\n");
+			return PTR_ERR(plane);
+		}
+
+		plane->id = cursor_info->id;
+		dc->planes[plane->id].id = cursor_info->id;
+		dc->planes[plane->id].offset = get_addr_offset(cursor_info->id);
+
+		if (cursor_info->id == CURSOR_PLANE_0)
+			dc->crtc[0]->base.cursor = &plane->base;
+		else
+			dc->crtc[1]->base.cursor = &plane->base;
+		drm_dev->mode_config.cursor_width =
+			max_t(u32, drm_dev->mode_config.cursor_width,
+			      cursor_info->max_width);
+		drm_dev->mode_config.cursor_height =
+			max_t(u32, drm_dev->mode_config.cursor_height,
+			      cursor_info->max_height);
+		}
+
+	drm_dev->mode_config.min_width = min_width;
+	drm_dev->mode_config.min_height = min_heigth;
+	drm_dev->mode_config.max_width = max_width;
+	drm_dev->mode_config.max_height = max_height;
+
+	if (dc_info->pitch_alignment > priv->pitch_alignment)
+		priv->pitch_alignment = dc_info->pitch_alignment;
+
+	return 0;
+}
+
+static int vs_load(struct vs_drm_device *priv)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(priv->clk_count, priv->clks);
+	if (ret)
+		return ret;
+
+	reset_control_deassert(priv->rsts);
+
+	ret = dc_hw_init(&priv->dc);
+	if (ret) {
+		DRM_ERROR("failed to init DC HW\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int vs_drm_bind(struct device *dev)
+{
+	struct vs_drm_device *priv;
+	int ret;
+	struct drm_device *drm_dev;
+
+	priv = devm_drm_dev_alloc(dev, &vs_drm_driver, struct vs_drm_device, base);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->pitch_alignment = 64;
+	drm_dev = &priv->base;
+	dev_set_drvdata(dev, drm_dev);
+
+	ret = dma_set_coherent_mask(drm_dev->dev, DMA_BIT_MASK(40));
+	if (ret)
+		return ret;
+
+	ret = vs_drm_device_init_res(priv);
+	if (ret)
+		return ret;
+
+	vs_mode_config_init(drm_dev);
+
+	/* Remove existing drivers that may own the framebuffer memory. */
+	ret = drm_aperture_remove_framebuffers(&vs_drm_driver);
+	if (ret)
+		return ret;
+
+	ret = vs_drm_device_crtc_plane_create(priv);
+	if (ret) {
+		DRM_ERROR("Failed to create ctrc and plane\n");
+		return ret;
+	}
+
+	ret = vs_load(priv);
+	if (ret)
+		return ret;
+
+	/* Now try and bind all our sub-components */
+	ret = component_bind_all(dev, drm_dev);
+	if (ret) {
+		ret = -EPROBE_DEFER;
+		goto unload;
+	}
+	ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
+	if (ret)
+		goto err_unbind_all;
+
+	drm_mode_config_reset(drm_dev);
+
+	ret = drmm_kms_helper_poll_init(drm_dev);
+	if (ret)
+		goto err_unbind_all;
+
+	ret = drm_dev_register(drm_dev, 0);
+	if (ret)
+		goto err_unbind_all;
+
+	drm_fbdev_generic_setup(drm_dev, 32);
+
+	return 0;
+
+err_unbind_all:
+	component_unbind_all(drm_dev->dev, drm_dev);
+unload:
+	reset_control_assert(priv->rsts);
+	clk_bulk_disable_unprepare(priv->clk_count, priv->clks);
+	return ret;
+
+}
+
+static void vs_drm_unbind(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct vs_drm_device *priv = to_vs_drm_private(drm_dev);
+
+	reset_control_assert(priv->rsts);
+	clk_bulk_disable_unprepare(priv->clk_count, priv->clks);
+
+	drm_dev_unregister(drm_dev);
+	drm_atomic_helper_shutdown(drm_dev);
+	component_unbind_all(drm_dev->dev, drm_dev);
+}
+
+static const struct component_master_ops vs_drm_ops = {
+	.bind = vs_drm_bind,
+	.unbind = vs_drm_unbind,
+};
+
+static struct platform_driver *drm_sub_drivers[] = {
+
+};
+
+static struct component_match *vs_add_external_components(struct device *dev)
+{
+	struct component_match *match = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(drm_sub_drivers); ++i) {
+		struct platform_driver *drv = drm_sub_drivers[i];
+		struct device *p = NULL, *d;
+
+		while ((d = platform_find_device_by_driver(p, &drv->driver))) {
+			put_device(p);
+
+			drm_of_component_match_add(dev, &match, component_compare_of,
+						   d->of_node);
+			p = d;
+		}
+		put_device(p);
+	}
+
+	return match ? match : ERR_PTR(-ENODEV);
+}
+
+static int vs_drm_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct component_match *match;
+
+	/* all the planes and CRTC would be created in this platform device
+	 * , so external components are encoder + connector or self-defined
+	 * encoder.
+	 */
+	match = vs_add_external_components(dev);
+	if (IS_ERR(match))
+		return PTR_ERR(match);
+
+	return component_master_add_with_match(dev, &vs_drm_ops, match);
+}
+
+static int vs_drm_platform_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &vs_drm_ops);
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int vs_drm_suspend(struct device *dev)
+{
+	return drm_mode_config_helper_suspend(dev_get_drvdata(dev));
+}
+
+static int vs_drm_resume(struct device *dev)
+{
+	drm_mode_config_helper_resume(dev_get_drvdata(dev));
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(vs_drm_pm_ops, vs_drm_suspend, vs_drm_resume);
+
+static const struct of_device_id vs_drm_dt_ids[] = {
+	{ .compatible = "starfive,jh7110-dc8200", .data = &dc8200_info,},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, vs_drm_dt_ids);
+
+static struct platform_driver vs_drm_platform_driver = {
+	.probe = vs_drm_platform_probe,
+	.remove = vs_drm_platform_remove,
+
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = vs_drm_dt_ids,
+		.pm = &vs_drm_pm_ops,
+	},
+};
+
+static int __init vs_drm_init(void)
+{
+	int ret;
+
+	ret = platform_register_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
+	if (ret)
+		return ret;
+
+	ret = drm_platform_driver_register(&vs_drm_platform_driver);
+	if (ret)
+		platform_unregister_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
+
+	return ret;
+}
+
+static void __exit vs_drm_fini(void)
+{
+	platform_driver_unregister(&vs_drm_platform_driver);
+	platform_unregister_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
+}
+
+late_initcall_sync(vs_drm_init);
+module_exit(vs_drm_fini);
+
+MODULE_DESCRIPTION("VeriSilicon DRM Driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0

