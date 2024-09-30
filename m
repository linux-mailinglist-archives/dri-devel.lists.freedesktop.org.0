Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC05989A14
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512BC10E2CC;
	Mon, 30 Sep 2024 05:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NgwXMm7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CB810E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmX5ju3A5ylrV0X664T6KUG7jJmeo2QYr+/bStftsbIG45rsMjb1Uj3sdqvwfL0iW56bH2uEpNS0p7RQzjsKIfstw1pseI8cD/Zk5TnV3qj4WLRydw9pcorJaWAj1VXtAuQzjGKrbRUaq/tWaoDIVOeK0+q6/2mAVn2ydVGGiQeojMrEW6yQxTZnqHssd3s4uKK8nWqnqtwJK1Qk3gMKhdGQiGVSJMBb7PJqsj7WodGsw7on44ErBYlyrxxNU4gs1UuioxEzgceSLESWMa8CDJv4D0z+s4zzDArJd9Hd51Js7ZqzT8/FX7FFyV9Vsd8FIc5xn1F3xfeMMF/DHbGFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4dsoD/QCIXCyIvDUCNrT+J1XxiZ4ehhcSQPBBWHOwE=;
 b=aYEQflmI0Wkj3nvEJ/uHcp5bIGBJnZWA1DMVYoH5LlUPMrTI/Qt3CdoezgT1d3fY/enTbDmlEqDnmZlY3gq1SmysLnzYIewQmuuzTy7ysSRYEM2oWEMzYzDzx5GYdcWlquzF70ey49/lCrx5p49UWNQcqAtKKsSR32350MSJ/SuiPnTRFCyyW59j5w2Ga8RDhBtzc0H7zEqOFI3hlAz4Z7J+t+lxeeYfh2rT5PqcukZP4TWqpf74Ms7c/FEU3gbvO2KJ4a4lGhcGuc8lPix3c7gJxFsefgJu9qYSmgA5efgcm23CHedwV71GZAe0wSySCfNJfxwujGnzlRQUTjy7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4dsoD/QCIXCyIvDUCNrT+J1XxiZ4ehhcSQPBBWHOwE=;
 b=NgwXMm7rKu3iNLlcnHm6T/r1FoVyeq64IF1tzY65ugtzHvw8cjLxX6kIwAeS1XdC68wxqr3S5vUEyKlWCWuHISsMHIWQj/iM+oGiF7KQpXBCWaGgcmoXeTf77ALSaEkuszbF43kfwsy7kYddfur4tciefpBu00aspTje9K/uZ1pQaP2XjS+aYAov+xgrQ1qaPsykeN50dWHO6CHZRglAwoZTs7Hf1gvKA1XKwnJXgU16gs2HVTSZtj1Dg0NhvrHwRbn03Gt9hraW8jqDXLgxvW4/AKl2Y/MuT34Dh2v4tp5/mLiY+CsO9rGjy9tnEf2Rtt4KZbkiv4haGtlGVb88Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 05:29:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:29:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 6/8] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Date: Mon, 30 Sep 2024 13:29:01 +0800
Message-Id: <20240930052903.168881-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930052903.168881-1-victor.liu@nxp.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: 119f4bd1-7f62-4686-e39a-08dce110e40e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xBlFKQjwVYGMyXoKpaEz9Z54Ul1aHXEdG/qAjb4zdMGkKzvGETGIlTmrqvEK?=
 =?us-ascii?Q?PuQjLThc5F7hN8X8R2FDuOhQoRLylwLtPSUCi7GDyj8+dKsd81aIobbt+ws5?=
 =?us-ascii?Q?3EWnDfMlTiOdA5i3LK6CoZZvLlefrPIoqozPEJMtDfub5TQz7T2ThVIEXJ5W?=
 =?us-ascii?Q?b6IZWt7J2DuqbkdJFuAMAQ4ZNcgCWbDMRzeMraHtocdNTTfAFqvgNCnZl5Z0?=
 =?us-ascii?Q?tth/AYS3KbeHqhSNEb1EpcQA91c3oIN5dcyE03Yyjid8FQVgHd5LrPNWBwOE?=
 =?us-ascii?Q?PZgjrvMwp3TbkBjLXJdO7jKt6/CZZb2g3VlNHYJi+v4h2w8R7WVreffNRMpP?=
 =?us-ascii?Q?Na3fi6xUbAHe3Z8JAhh78F8LRhUlWnIhLc3oRWUDa1oo61WwfVogowT7+LPE?=
 =?us-ascii?Q?qOesVFLwDW5XYWqoJMRyD+EjQ49eBq6+FmkVVMJzfbOHHXGznP3yTqqD0FRA?=
 =?us-ascii?Q?QZolBilKPs5UjYT+OU0r8+N6XcwNlJpGv5SL5Zm+nAQGlDIjBPb2H36PNmGV?=
 =?us-ascii?Q?ATq7cXsfZ+g4EqnR26HGOZwfNED5DhSqgge8+Dam4Q7/hi+BGbVR6zy5MlDY?=
 =?us-ascii?Q?WhUSH74ZF1FvTAcaSyb9ijQcXzPorLch9TOk9mejltUgjYlpde4GOQrm0PRp?=
 =?us-ascii?Q?sp7BZIVw85WMWW+mOXx4aiv9udcxj9lsSTpFPBpIdrlw/4hmhwP7WgSJY8aY?=
 =?us-ascii?Q?7C+MIrKxX8Szm9qXcmdRDDcNKjiKRzu+N/0FrH6ky4RtgCiovuhMED4cGr4h?=
 =?us-ascii?Q?ZtS2QA//zi5/q+wIPXG4QVtwvUD4oRJtL7nmXWFklcEnR3EcF99kM30OJd9i?=
 =?us-ascii?Q?RBrtxwZaG6fzRfwj3Q9cLl0tyy2XgeHBuhSzdXbj8GrrzlnhW9Hp7nTs0xNs?=
 =?us-ascii?Q?mDqsMiXFxBLBXaRL62K3jvcBNMxr2vtkKkycF2A8PBcMkE/K8QIw+sAnYFan?=
 =?us-ascii?Q?5CQUwfZkJ6tydqPns3I1xGbzb9Tz0Qwg6vX0hZrJ5mBQ3XsXSvukN2PRjcOY?=
 =?us-ascii?Q?y/49XGOE0++KAIoRAA1ijlsqCPkOMAlR5HKyVyRjITSxPeWRFcCcwK9Lb2My?=
 =?us-ascii?Q?OlewATuoxRzQWc9tklJRsrBmLbD/7rRRDiX8hE//qg5P5aku7DXccj8uq9MN?=
 =?us-ascii?Q?ASUQ2eS4dxsRwvS3cEdMZhQT1zo2iX0jDqb91ahnJLhWHtNZV7qTJpJGy0GD?=
 =?us-ascii?Q?d62lokHi2twgdwDfeMu0IhG+4FsW6e1w5lVkQO9WE1OP3jOSl2Btbaf624MR?=
 =?us-ascii?Q?3Vt3H6ImFAv5Edm+7doSNFdDcnC3bgR+0mw1bqQ66gmwHV/qpxHc9GKmh8Yc?=
 =?us-ascii?Q?BuOsWzQIKSb6WTSwDwlruZw83qdNW1ACab4mvS70QCHrLE6YBFZHUmxm0Mwg?=
 =?us-ascii?Q?xLc7k4udTErtCNf7e+7QbsmVo4Ei9bTU45xYL46qSBtnM6MjxQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MnV90eDm4iIiIbCytVKu0BQ4P/CDvC+RkLkVr2MNn4t2q7T9G9IS4IwzG9PL?=
 =?us-ascii?Q?8cLOSXsrkOxYck70aLeFEPWEAKpojjjPzpZtZj+wW4A9YyvRLsu+lFw0j25P?=
 =?us-ascii?Q?bll6OtsPXyWdNWoelai4AR/ICEFd9OEKE6QYHPpm6yYhfYDK2kO11tUD1FjY?=
 =?us-ascii?Q?Ex3+fOcN5WHFljIyo1vH7aIRaDFvpzHE25ZdQ31bud3nwbn7RBXARbIFws4Z?=
 =?us-ascii?Q?dstMu4gAGTsoi+eRQkO++v12CJP4+cOFxjobKWeldamycomhvu9Iz+o9cABY?=
 =?us-ascii?Q?8R+uqOFfRBa/ZLzk5Y+KHOYTrzK8cOR2tm6OehwYKu/P3UYqqcU/xlGQxCRS?=
 =?us-ascii?Q?4ACwb5O6ZgIkbC7hC22i+0vJN+Ecil2kLT/+we/d1Q7KYa52spV/oeH/IUDL?=
 =?us-ascii?Q?NyQw7zvqtMqtDCxDnccTGjpB6S3kmMPqxQA02hxoTjXwdWDNBvmoLh609RrP?=
 =?us-ascii?Q?P51AnCzfLO53IMQ+cKjHaVOE46JS+2sZTYcD33PaTHCIIjwJrKnK+4vPYtng?=
 =?us-ascii?Q?g364VFHT/NdVVHzIwR2GZpZcPLkGPjEMZAAyLeNz9vHZt1KWuKssXRDcoBLy?=
 =?us-ascii?Q?L+3W51R6JG6CnArllxMdByr8m59gib1uyRiW6QJ3VmKym/W5QpOi7E11r245?=
 =?us-ascii?Q?Nc0CWarRp/PFl/NasXJ3oOmSjhi+lTL8EQhWk5sHEfPxjsWgYfFfOL5f5/Bo?=
 =?us-ascii?Q?kRUm1Tx9x0h5iX8FVGa3u2coR+Oh4yAqeDiJsHJ72N1DtqWfzJQ0bgO3IiIq?=
 =?us-ascii?Q?L/xHskkVFUyz7dyxm2iQyI459KCj5UUxM0SjmXjv4hKXHWh6Zy6I1qZ88oT/?=
 =?us-ascii?Q?VMB3rtKpV1x3r6SJ+wmKMewee1XJ2r4HRs904kGKLTzdHmV4KdYCke3OYpR+?=
 =?us-ascii?Q?N+dnkOzB0fzsrLvkgyOr8OjTjhObXhIhIhurziW940DjXfsYY7JPqlqKRXcB?=
 =?us-ascii?Q?6kRysyjwyqGy2owDLng83fmXYiGvIpk18l7Pd0Fxod2wTtMNVg9meA/LLWap?=
 =?us-ascii?Q?Rgejs1CvvMh3+5HmcswmqJAK4qUVRhiBzAqqgDH3V7bVrvNzzA+fyA4ksnX8?=
 =?us-ascii?Q?+FdBvhm1xPGtv2zPpMpnUJwNS9ObtHeY5lCFvz6W92jns4MQihH2MLLOoOB2?=
 =?us-ascii?Q?rCKXG75DBY+y3G8ObppeETTmmM6A1P4NNFVFGjZ/lgLnxb/2g2Gz2cs0icRm?=
 =?us-ascii?Q?Om2SLxiKzoL5zICoQcMip901otuwDZC0T0ocQ+ZSka0xdvyF0vcPnaWsNiS8?=
 =?us-ascii?Q?Ua8yo9GHz20Ztx9xwVR76yHsiTvV8Ec3Cww4kRSFLITmKYmMpKqWShkxKLf/?=
 =?us-ascii?Q?LiJrylZNrkatmetZWMblWFe9n1kOHLRBDjYwCL7t7EpFOIm88g40lGApeCfI?=
 =?us-ascii?Q?C6j0EVujAddEejDEf8VV81xuSBq5AqXB+kFuitWiuxj/+EEV9GfR1I/tgA8v?=
 =?us-ascii?Q?Iq7cIPP9zIAERQlBK5SfwCGcPcuQMGT/KeDwoHNCERo5rTyTRtTZA/LjV1Da?=
 =?us-ascii?Q?lP3IUg7XR91mKoA1OEIG3pzLONM+0+/EJc/cCCfdW6F+qztrsPRqa7WZtCJP?=
 =?us-ascii?Q?5iGLQ0/N6BsrfqYuKYGN4+pkMotZKsixA0TY2ZXR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119f4bd1-7f62-4686-e39a-08dce110e40e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:29:44.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: timJ1n7MCy/NsdlT/Xk0Go+Z48RA3i3ZWur9Nwro1mo/N8vOLDPLHsYFO2/5FZXUBaEaCBD2dafmCR9JhRPBnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
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

Add basic HDMI video output support. Currently, only RGB888 output
pixel format is supported.  At the LVDS input side, the driver
supports single LVDS link and dual LVDS links with "jeida-24" LVDS
mapping.

Product link:
https://www.ite.com.tw/en/product/cate1/IT6263

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/Kconfig      |   8 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ite-it6263.c | 829 ++++++++++++++++++++++++++++
 3 files changed, 838 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 3eb955333c80..93f99682a090 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,14 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_ITE_IT6263
+	tristate "ITE IT6263 LVDS/HDMI bridge"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  ITE IT6263 LVDS to HDMI bridge chip driver.
+
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 7df87b582dca..f3776dd473fd 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
new file mode 100644
index 000000000000..886588497bc1
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -0,0 +1,829 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+/* -----------------------------------------------------------------------------
+ * LVDS registers
+ */
+
+/* LVDS software reset registers */
+#define LVDS_REG_05			0x05
+#define  REG_SOFT_P_RST			BIT(1)
+
+/* LVDS system configuration registers */
+/* 0x0b */
+#define LVDS_REG_0B			0x0b
+#define  REG_SSC_PCLK_RF		BIT(0)
+#define  REG_LVDS_IN_SWAP		BIT(1)
+
+/* LVDS test pattern gen control registers */
+/* 0x2c */
+#define LVDS_REG_2C			0x2c
+#define  REG_COL_DEP			GENMASK(1, 0)
+#define  BIT8				FIELD_PREP(REG_COL_DEP, 2)
+#define  OUT_MAP			BIT(4)
+#define  JEIDA				0
+#define  REG_DESSC_ENB			BIT(6)
+#define  DMODE				BIT(7)
+#define  DISO				BIT(7)
+#define  SISO				0
+
+#define LVDS_REG_3C			0x3c
+#define LVDS_REG_3F			0x3f
+#define LVDS_REG_47			0x47
+#define LVDS_REG_48			0x48
+#define LVDS_REG_4F			0x4f
+#define LVDS_REG_52			0x52
+
+/* -----------------------------------------------------------------------------
+ * HDMI registers are separated into three banks:
+ * 1) HDMI register common bank: 0x00 ~ 0x2f
+ */
+
+/* HDMI genernal registers */
+#define HDMI_REG_SW_RST			0x04
+#define  SOFTREF_RST			BIT(5)
+#define  SOFTA_RST			BIT(4)
+#define  SOFTV_RST			BIT(3)
+#define  AUD_RST			BIT(2)
+#define  HDCP_RST			BIT(0)
+#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
+					 AUD_RST | HDCP_RST)
+
+#define HDMI_REG_SYS_STATUS		0x0e
+#define  HPDETECT			BIT(6)
+#define  TXVIDSTABLE			BIT(4)
+
+#define HDMI_REG_BANK_CTRL		0x0f
+#define  REG_BANK_SEL			BIT(0)
+
+/* HDMI System DDC control registers */
+#define HDMI_REG_DDC_MASTER_CTRL	0x10
+#define  MASTER_SEL_HOST		BIT(0)
+
+#define HDMI_REG_DDC_HEADER		0x11
+
+#define HDMI_REG_DDC_REQOFF		0x12
+#define HDMI_REG_DDC_REQCOUNT		0x13
+#define HDMI_REG_DDC_EDIDSEG		0x14
+
+#define HDMI_REG_DDC_CMD		0x15
+#define  DDC_CMD_EDID_READ		0x3
+#define  DDC_CMD_FIFO_CLR		0x9
+
+#define HDMI_REG_DDC_STATUS		0x16
+#define  DDC_DONE			BIT(7)
+#define  DDC_NOACK			BIT(5)
+#define  DDC_WAITBUS			BIT(4)
+#define  DDC_ARBILOSE			BIT(3)
+#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
+
+#define HDMI_DDC_FIFO_BYTES		32
+#define HDMI_REG_DDC_READFIFO		0x17
+#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
+#define HDMI_REG_LVDS_PORT_EN		0x1e
+#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
+
+/* -----------------------------------------------------------------------------
+ * 2) HDMI register bank0: 0x30 ~ 0xff
+ */
+
+/* HDMI AFE registers */
+#define HDMI_REG_AFE_DRV_CTRL		0x61
+#define  AFE_DRV_PWD			BIT(5)
+#define  AFE_DRV_RST			BIT(4)
+
+#define HDMI_REG_AFE_XP_CTRL		0x62
+#define  AFE_XP_GAINBIT			BIT(7)
+#define  AFE_XP_ER0			BIT(4)
+#define  AFE_XP_RESETB			BIT(3)
+
+#define HDMI_REG_AFE_ISW_CTRL		0x63
+
+#define HDMI_REG_AFE_IP_CTRL		0x64
+#define  AFE_IP_GAINBIT			BIT(7)
+#define  AFE_IP_ER0			BIT(3)
+#define  AFE_IP_RESETB			BIT(2)
+
+/* HDMI input data format registers */
+#define HDMI_REG_INPUT_MODE		0x70
+#define  IN_RGB				0x00
+
+/* HDMI general control registers */
+#define HDMI_REG_HDMI_MODE		0xc0
+#define  TX_HDMI_MODE			BIT(0)
+
+#define HDMI_REG_GCP			0xc1
+#define  AVMUTE				BIT(0)
+#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
+#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
+
+#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
+#define  ENABLE_PKT			BIT(0)
+#define  REPEAT_PKT			BIT(1)
+
+/* -----------------------------------------------------------------------------
+ * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)
+ */
+
+/* AVI packet registers */
+#define HDMI_REG_AVI_DB1		0x158
+#define  AVI_DB1_COLOR_SPACE		GENMASK(6, 5)
+#define  AVI_COLOR_SPACE_RGB		FIELD_PREP(AVI_DB1_COLOR_SPACE, 0)
+
+#define MAX_PIXEL_CLOCK_KHZ		150000
+#define HIGH_PIXEL_CLOCK_KHZ		80000
+
+struct it6263 {
+	struct device *dev;
+	struct i2c_client *hdmi_i2c;
+	struct i2c_client *lvds_i2c;
+	struct regmap *hdmi_regmap;
+	struct regmap *lvds_regmap;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_connector connector;
+	struct gpio_desc *reset_gpio;
+	bool lvds_dual_link;
+	bool lvds_link12_swap;
+};
+
+static inline struct it6263 *bridge_to_it6263(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct it6263, bridge);
+}
+
+static inline struct it6263 *connector_to_it6263(struct drm_connector *conn)
+{
+	return container_of(conn, struct it6263, connector);
+}
+
+static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_BANK_CTRL:
+	case HDMI_REG_DDC_MASTER_CTRL:
+	case HDMI_REG_DDC_HEADER:
+	case HDMI_REG_DDC_REQOFF:
+	case HDMI_REG_DDC_REQCOUNT:
+	case HDMI_REG_DDC_EDIDSEG:
+	case HDMI_REG_DDC_CMD:
+	case HDMI_REG_LVDS_PORT:
+	case HDMI_REG_LVDS_PORT_EN:
+	case HDMI_REG_AFE_DRV_CTRL:
+	case HDMI_REG_AFE_XP_CTRL:
+	case HDMI_REG_AFE_ISW_CTRL:
+	case HDMI_REG_AFE_IP_CTRL:
+	case HDMI_REG_INPUT_MODE:
+	case HDMI_REG_HDMI_MODE:
+	case HDMI_REG_GCP:
+	case HDMI_REG_PKT_GENERAL_CTRL:
+	case HDMI_REG_AVI_DB1:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int reg)
+{
+	if (it6263_hdmi_writeable_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_range_cfg it6263_hdmi_range_cfg = {
+	.range_min = 0x00,
+	.range_max = HDMI_REG_AVI_DB1,
+	.selector_reg = HDMI_REG_BANK_CTRL,
+	.selector_mask = REG_BANK_SEL,
+	.selector_shift = 0,
+	.window_start = 0x00,
+	.window_len = 0x100,
+};
+
+static const struct regmap_config it6263_hdmi_regmap_config = {
+	.name = "it6263-hdmi",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_hdmi_writeable_reg,
+	.readable_reg = it6263_hdmi_readable_reg,
+	.volatile_reg = it6263_hdmi_volatile_reg,
+	.max_register = HDMI_REG_AVI_DB1,
+	.ranges = &it6263_hdmi_range_cfg,
+	.num_ranges = 1,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static bool it6263_lvds_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LVDS_REG_05:
+	case LVDS_REG_0B:
+	case LVDS_REG_2C:
+	case LVDS_REG_3C:
+	case LVDS_REG_3F:
+	case LVDS_REG_47:
+	case LVDS_REG_48:
+	case LVDS_REG_4F:
+	case LVDS_REG_52:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_lvds_readable_reg(struct device *dev, unsigned int reg)
+{
+	return it6263_lvds_writeable_reg(dev, reg);
+}
+
+static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == LVDS_REG_05;
+}
+
+static const struct regmap_config it6263_lvds_regmap_config = {
+	.name = "it6263-lvds",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_lvds_writeable_reg,
+	.readable_reg = it6263_lvds_readable_reg,
+	.volatile_reg = it6263_lvds_volatile_reg,
+	.max_register = LVDS_REG_52,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const char * const it6263_supplies[] = {
+	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
+	"avcc", "anvdd", "apvdd"
+};
+
+static int it6263_parse_dt(struct it6263 *it)
+{
+	struct device *dev = it->dev;
+	struct device_node *port0, *port1;
+	int ret = 0;
+
+	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	if (IS_ERR(it->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
+				     "failed to get next bridge\n");
+
+	port0 = of_graph_get_port_by_id(dev->of_node, 0);
+	port1 = of_graph_get_port_by_id(dev->of_node, 1);
+	if (port0 && port1) {
+		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
+		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
+			it->lvds_dual_link = true;
+			it->lvds_link12_swap = true;
+		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
+			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
+			it->lvds_dual_link = true;
+		}
+
+		if (!it->lvds_dual_link) {
+			dev_err(dev,
+				"failed to get LVDS dual link pixel order\n");
+			ret = -EINVAL;
+		}
+	} else if (port1) {
+		ret = -EINVAL;
+		dev_err(dev, "single input LVDS port1 is not supported\n");
+	} else if (!port0) {
+		ret = -EINVAL;
+		dev_err(dev, "no input LVDS port\n");
+	}
+
+	of_node_put(port0);
+	of_node_put(port1);
+
+	return ret;
+}
+
+static inline void it6263_reset(struct it6263 *it)
+{
+	if (!it->reset_gpio)
+		return;
+
+	gpiod_set_value_cansleep(it->reset_gpio, 0);
+	fsleep(1000);
+	gpiod_set_value_cansleep(it->reset_gpio, 1);
+	/* The chip maker says the low pulse should be at least 40ms. */
+	fsleep(40000);
+	gpiod_set_value_cansleep(it->reset_gpio, 0);
+	/* addtional time to wait the high voltage to be stable */
+	fsleep(5000);
+}
+
+static inline int it6263_lvds_set_i2c_addr(struct it6263 *it)
+{
+	int ret;
+
+	ret = regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
+			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
+}
+
+static inline void it6263_lvds_reset(struct it6263 *it)
+{
+	/* AFE PLL reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
+
+	/* software pixel clock domain reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
+			  REG_SOFT_P_RST);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
+	fsleep(10000);
+}
+
+static inline void it6263_lvds_set_interface(struct it6263 *it)
+{
+	/* color depth */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
+	/* output mapping */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
+
+	if (it->lvds_dual_link) {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
+	} else {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
+	}
+}
+
+static inline void it6263_lvds_set_afe(struct it6263 *it)
+{
+	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
+
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
+			  REG_SSC_PCLK_RF);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
+			  REG_DESSC_ENB);
+}
+
+static inline void it6263_lvds_sys_cfg(struct it6263 *it)
+{
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
+			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0);
+}
+
+static inline void it6263_lvds_config(struct it6263 *it)
+{
+	it6263_lvds_reset(it);
+	it6263_lvds_set_interface(it);
+	it6263_lvds_set_afe(it);
+	it6263_lvds_sys_cfg(it);
+}
+
+static inline void it6263_hdmi_config(struct it6263 *it)
+{
+	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
+	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
+			  HDMI_COLOR_DEPTH_24);
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_AVI_DB1,
+			  AVI_DB1_COLOR_SPACE, AVI_COLOR_SPACE_RGB);
+}
+
+static enum drm_connector_status it6263_detect(struct it6263 *it)
+{
+	unsigned int val;
+
+	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
+	if (val & HPDETECT)
+		return connector_status_connected;
+	else
+		return connector_status_disconnected;
+}
+
+static enum drm_connector_status
+it6263_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct it6263 *it = connector_to_it6263(connector);
+
+	return it6263_detect(it);
+}
+
+static const struct drm_connector_funcs it6263_connector_funcs = {
+	.detect = it6263_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct it6263 *it = data;
+	struct regmap *regmap = it->hdmi_regmap;
+	unsigned int start = (block % 2) * EDID_LENGTH;
+	unsigned int segment = block >> 1;
+	unsigned int count, val;
+	int ret;
+
+	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
+	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
+	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
+
+	while (len) {
+		/* clear DDC FIFO */
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
+					       val, val & DDC_DONE,
+					       2000, 10000);
+		if (ret) {
+			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
+			return ret;
+		}
+
+		count = len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
+
+		/* fire the read command */
+		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
+		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
+
+		start += count;
+		len -= count;
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
+					       val & (DDC_DONE | DDC_ERROR),
+					       20000, 250000);
+		if (ret && !(val & DDC_ERROR)) {
+			dev_err(it->dev, "failed to read EDID:%d\n", ret);
+			return ret;
+		}
+
+		if (val & DDC_ERROR) {
+			dev_err(it->dev, "DDC error\n");
+			return -EIO;
+		}
+
+		/* cache to buffer */
+		for (; count > 0; count--) {
+			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
+			*(buf++) = val;
+		}
+	}
+
+	return 0;
+}
+
+static int it6263_connector_get_modes(struct drm_connector *connector)
+{
+	struct it6263 *it = connector_to_it6263(connector);
+	const struct drm_edid *drm_edid;
+	int count;
+
+	drm_edid = drm_edid_read_custom(connector, it6263_read_edid, it);
+
+	drm_edid_connector_update(connector, drm_edid);
+	count = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
+
+	return count;
+}
+
+static const struct drm_connector_helper_funcs it6263_connector_helper_funcs = {
+	.get_modes = it6263_connector_get_modes,
+};
+
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+
+	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
+}
+
+static void
+it6263_bridge_atomic_disable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
+	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
+	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
+		     AFE_DRV_RST | AFE_DRV_PWD);
+}
+
+static void
+it6263_bridge_atomic_enable(struct drm_bridge *bridge,
+			    struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct it6263 *it = bridge_to_it6263(bridge);
+	const struct drm_crtc_state *crtc_state;
+	struct regmap *regmap = it->hdmi_regmap;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	bool is_stable = false;
+	struct drm_crtc *crtc;
+	unsigned int val;
+	bool pclk_high;
+	int i, ret;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	mode = &crtc_state->adjusted_mode;
+
+	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
+
+	/* HDMI AFE setup */
+	pclk_high = mode->clock > HIGH_PIXEL_CLOCK_KHZ ? true : false;
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, AFE_DRV_RST);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_GAINBIT | AFE_XP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_ER0 | AFE_XP_RESETB);
+	regmap_write(regmap, HDMI_REG_AFE_ISW_CTRL, 0x10);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_GAINBIT | AFE_IP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_ER0 | AFE_IP_RESETB);
+
+	/* HDMI software video reset */
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, SOFTV_RST);
+	fsleep(1000);
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, 0);
+
+	/* reconfigure LVDS and retry several times in case video is instable */
+	for (i = 0; i < 3; i++) {
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_SYS_STATUS, val,
+					       val & TXVIDSTABLE,
+					       20000, 500000);
+		if (!ret) {
+			is_stable = true;
+			break;
+		}
+
+		it6263_lvds_config(it);
+	}
+
+	if (!is_stable)
+		dev_warn(it->dev, "failed to wait for video stable\n");
+
+	/* HDMI AFE reset release and power up */
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, 0);
+
+	regmap_write_bits(regmap, HDMI_REG_GCP, AVMUTE, 0);
+
+	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT | REPEAT_PKT);
+}
+
+static enum drm_mode_status
+it6263_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode)
+{
+	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? MODE_CLOCK_HIGH : MODE_OK;
+}
+
+static int it6263_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	int ret;
+
+	ret = drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
+				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0)
+		return ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	it->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
+			       DRM_CONNECTOR_POLL_DISCONNECT;
+
+	ret = drm_connector_init(bridge->dev, &it->connector,
+				 &it6263_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(&it->connector,
+				 &it6263_connector_helper_funcs);
+	drm_connector_attach_encoder(&it->connector, bridge->encoder);
+
+	return 0;
+}
+
+static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return it6263_detect(it);
+}
+
+static const struct drm_edid *
+it6263_bridge_edid_read(struct drm_bridge *bridge,
+			struct drm_connector *connector)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return drm_edid_read_custom(connector, it6263_read_edid, it);
+}
+
+static u32 *
+it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts) {
+		*num_input_fmts = 0;
+		return NULL;
+	}
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.attach = it6263_bridge_attach,
+	.mode_valid = it6263_bridge_mode_valid,
+	.atomic_disable = it6263_bridge_atomic_disable,
+	.atomic_enable = it6263_bridge_atomic_enable,
+	.atomic_check = it6263_bridge_atomic_check,
+	.detect = it6263_bridge_detect,
+	.edid_read = it6263_bridge_edid_read,
+	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
+};
+
+static int it6263_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct it6263 *it;
+	int ret;
+
+	it = devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
+	if (!it)
+		return -ENOMEM;
+
+	it->dev = dev;
+	it->hdmi_i2c = client;
+
+	it->hdmi_regmap = devm_regmap_init_i2c(client,
+					       &it6263_hdmi_regmap_config);
+	if (IS_ERR(it->hdmi_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
+				     "failed to init I2C regmap for HDMI\n");
+
+	it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(it->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
+					     it6263_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get power supplies\n");
+
+	ret = it6263_parse_dt(it);
+	if (ret)
+		return ret;
+
+	it6263_reset(it);
+
+	ret = it6263_lvds_set_i2c_addr(it);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
+
+	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
+						 LVDS_INPUT_CTRL_I2C_ADDR);
+	if (IS_ERR(it->lvds_i2c))
+		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
+			      "failed to allocate I2C device for LVDS\n");
+
+	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
+					       &it6263_lvds_regmap_config);
+	if (IS_ERR(it->lvds_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
+				     "failed to init I2C regmap for LVDS\n");
+
+	it6263_lvds_config(it);
+	it6263_hdmi_config(it);
+
+	i2c_set_clientdata(client, it);
+
+	it->bridge.funcs = &it6263_bridge_funcs;
+	it->bridge.of_node = dev->of_node;
+	it->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	drm_bridge_add(&it->bridge);
+
+	return 0;
+}
+
+static void it6263_remove(struct i2c_client *client)
+{
+	struct it6263 *it = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&it->bridge);
+}
+
+static const struct of_device_id it6263_of_match[] = {
+	{ .compatible = "ite,it6263", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, it6263_of_match);
+
+static const struct i2c_device_id it6263_i2c_ids[] = {
+	{ "it6263", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
+
+static struct i2c_driver it6263_driver = {
+	.probe = it6263_probe,
+	.remove = it6263_remove,
+	.driver = {
+		.name = "it6263",
+		.of_match_table = it6263_of_match,
+	},
+	.id_table = it6263_i2c_ids,
+};
+module_i2c_driver(it6263_driver);
+
+MODULE_DESCRIPTION("ITE Tech. Inc. IT6263 LVDS/HDMI bridge");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

