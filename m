Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FDB37B8F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8555B10E731;
	Wed, 27 Aug 2025 07:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lwGXllcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7999E10E6FC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:06:45 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250827045908epoutp0195e2e3150e92716192046f4f92c8434b~fhvDL1qor0387503875epoutp01I
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:59:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250827045908epoutp0195e2e3150e92716192046f4f92c8434b~fhvDL1qor0387503875epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756270748;
 bh=Cf32sZsEAMY0FAUtuKN2GksTAFiRBn1+/MODbML0Oio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lwGXllcjBndb+xDGCuEUPixFlaLSt7HGkFC62zt0zImSkUsNyjyJLY+v6dg9NNsmM
 lqbqNpcvn+VAUmFIQ4LTAdQ/maabIQiioKqbjJBWGtFX++fK1VZW00ADnSafzI0ZbA
 DZAU/6ebSlxOCB+ilEd5RpuaMbGaiHDOCnsOtvQw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
 20250827045907epcas2p4bad6cd2807f03ce9328abe7213f8db6b~fhvCFoGee3229232292epcas2p44;
 Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.99]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cBXPQ44bTz6B9m4; Wed, 27 Aug
 2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epcas2p46c8bc31d9c32168f77d1e10808e92b77~fhvAwIFeg3229232292epcas2p4w;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epsmtip257462a6fce5bd22ad4c021c95baa0e01~fhvAf6dzv1437614376epsmtip2R;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 2/4] media: samsung: scaler: add scaler driver code
Date: Wed, 27 Aug 2025 04:47:18 +0000
Message-ID: <20250827044720.3751272-3-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p46c8bc31d9c32168f77d1e10808e92b77
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p46c8bc31d9c32168f77d1e10808e92b77
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
 <CGME20250827045905epcas2p46c8bc31d9c32168f77d1e10808e92b77@epcas2p4.samsung.com>
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

Add scaler driver code for ExynosAutov920 SoC.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 .../platform/samsung/v920-scaler/Kconfig      |   17 +
 .../platform/samsung/v920-scaler/Makefile     |    9 +
 .../samsung/v920-scaler/scaler-core.c         | 3640 +++++++++++++++++
 .../samsung/v920-scaler/scaler-regs.c         |  744 ++++
 .../samsung/v920-scaler/scaler-regs.h         |  406 ++
 .../platform/samsung/v920-scaler/scaler.h     |  621 +++
 .../v920-scaler/videodev2_exynos_media.h      |  162 +
 7 files changed, 5599 insertions(+)
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Kconfig
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Makefile
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-core.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h

diff --git a/drivers/media/platform/samsung/v920-scaler/Kconfig b/drivers/media/platform/samsung/v920-scaler/Kconfig
new file mode 100644
index 000000000000..0878f46335e1
--- /dev/null
+++ b/drivers/media/platform/samsung/v920-scaler/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Platform drivers
+#	Most drivers here are currently for webcam supporit
+
+config VIDEO_EXYNOS_SCALER
+	tristate "EXYNOS Scaler Driver"
+	depends on VIDEO_DEV && HAS_DMA && !SAMSUNG_SCALER_EXYNOSAUTO_KUNIT_TEST
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_SG
+	default n
+	help
+	  This is a v4l2 driver for EXYNOS Scaler (MSCL) device.
+	  This option provides Exynos Scaler device driver support for
+	  ExynosAutoV920 SoC.
+	  When eanbled, the Scaler device will be detected and corresponding /dev/video50
+	  node will be created.
diff --git a/drivers/media/platform/samsung/v920-scaler/Makefile b/drivers/media/platform/samsung/v920-scaler/Makefile
new file mode 100644
index 000000000000..433daaf13d38
--- /dev/null
+++ b/drivers/media/platform/samsung/v920-scaler/Makefile
@@ -0,0 +1,9 @@
+#
+# Copyright (c) 2012 Samsung Electronics Co., Ltd.
+#		http://www.samsung.com
+#
+# Licensed under GPLv2
+#
+
+scaler-objs := scaler-core.o scaler-regs.o
+obj-$(CONFIG_VIDEO_EXYNOS_SCALER)	+= scaler.o
diff --git a/drivers/media/platform/samsung/v920-scaler/scaler-core.c b/drivers/media/platform/samsung/v920-scaler/scaler-core.c
new file mode 100644
index 000000000000..ed48a803571d
--- /dev/null
+++ b/drivers/media/platform/samsung/v920-scaler/scaler-core.c
@@ -0,0 +1,3640 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019 Samsung Electronics Co., Ltd. All Rights Reserved
+ *		http://www.samsung.com
+ *
+ * Core file for Samsung EXYNOS Scaler driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/version.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/interrupt.h>
+#include <linux/clk.h>
+#include <linux/slab.h>
+#include <linux/sort.h>
+#include <linux/pm_runtime.h>
+#include <linux/iommu.h>
+#include <linux/iosys-map.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-fence.h>
+#include <linux/sync_file.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "scaler.h"
+#include "scaler-regs.h"
+
+/* Protection IDs of Scaler are 2 and 3. */
+int sc_show_stat;
+module_param_named(sc_show_stat, sc_show_stat, uint, 0644);
+
+#define BUF_EXT_SIZE	512
+#define BUF_WIDTH_ALIGN	128
+
+static inline unsigned int sc_ext_buf_size(int width)
+{
+	return IS_ALIGNED(width, BUF_WIDTH_ALIGN) ? 0 : BUF_EXT_SIZE;
+}
+
+struct vb2_sc_buffer {
+	struct v4l2_m2m_buffer mb;
+	ktime_t ktime;
+
+	struct dma_fence	*in_fence;
+	int			state;
+	struct dma_fence_cb	fence_cb;
+	struct timer_list	fence_timer;
+	struct work_struct	qbuf_work;
+
+	struct sync_file	*out_sync_file;
+};
+
+static const struct sc_fmt sc_formats[] = {
+	{
+		.name		= "RGB565",
+		.pixelformat	= V4L2_PIX_FMT_RGB565,
+		.cfg_val	= SCALER_CFG_FMT_RGB565,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "RGB1555",
+		.pixelformat	= V4L2_PIX_FMT_RGB555X,
+		.cfg_val	= SCALER_CFG_FMT_ARGB1555,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "ARGB4444",
+		.pixelformat	= V4L2_PIX_FMT_RGB444,
+		.cfg_val	= SCALER_CFG_FMT_ARGB4444,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {	/* swaps of ARGB32 in bytes in half word, half words in word */
+		.name		= "RGBA8888",
+		.pixelformat	= V4L2_PIX_FMT_RGB32,
+		.cfg_val	= SCALER_CFG_FMT_RGBA8888 |
+					SCALER_CFG_BYTE_HWORD_SWAP,
+		.bitperpixel	= { 32 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "BGRA8888",
+		.pixelformat	= V4L2_PIX_FMT_BGR32,
+		.cfg_val	= SCALER_CFG_FMT_ARGB8888,
+		.bitperpixel	= { 32 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "ARGB2101010",
+		.pixelformat	= V4L2_PIX_FMT_ARGB2101010,
+		.cfg_val	= SCALER_CFG_FMT_ARGB2101010,
+		.bitperpixel	= { 32 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "ABGR2101010",
+		.pixelformat	= V4L2_PIX_FMT_ABGR2101010,
+		.cfg_val	= SCALER_CFG_FMT_ABGR2101010,
+		.bitperpixel	= { 32 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "RGBA1010102",
+		.pixelformat	= V4L2_PIX_FMT_RGBA1010102,
+		.cfg_val	= SCALER_CFG_FMT_RGBA1010102,
+		.bitperpixel	= { 32 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "BGRA1010102",
+		.pixelformat	= V4L2_PIX_FMT_BGRA1010102,
+		.cfg_val	= SCALER_CFG_FMT_BGRA1010102,
+		.bitperpixel	= { 32 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.is_rgb		= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous 2-planar, Y/CbCr",
+		.pixelformat	= V4L2_PIX_FMT_NV12,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P,
+		.bitperpixel	= { 12 },
+		.num_planes	= 1,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous 2-planar, Y/CrCb",
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.cfg_val	= SCALER_CFG_FMT_YCRCB420_2P,
+		.bitperpixel	= { 12 },
+		.num_planes	= 1,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 non-contiguous 2-planar, Y/CbCr",
+		.pixelformat	= V4L2_PIX_FMT_NV12M,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P,
+		.bitperpixel	= { 8, 4 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 non-contiguous 2-planar, Y/CrCb",
+		.pixelformat	= V4L2_PIX_FMT_NV21M,
+		.cfg_val	= SCALER_CFG_FMT_YCRCB420_2P,
+		.bitperpixel	= { 8, 4 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 non-contiguous 2-planar, Y/CbCr, tiled",
+		.pixelformat	= V4L2_PIX_FMT_NV12MT_16X16,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P |
+					SCALER_CFG_TILE_EN,
+		.bitperpixel	= { 8, 4 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous 3-planar, Y/Cb/Cr",
+		.pixelformat	= V4L2_PIX_FMT_YUV420,	/* I420 */
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_3P,
+		.bitperpixel	= { 12 },
+		.num_planes	= 1,
+		.num_comp	= 3,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YVU 4:2:0 contiguous 3-planar, Y/Cr/Cb",
+		.pixelformat	= V4L2_PIX_FMT_YVU420,	/* YV12 */
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_3P,
+		.bitperpixel	= { 12 },
+		.num_planes	= 1,
+		.num_comp	= 3,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 non-contiguous 3-planar, Y/Cb/Cr",
+		.pixelformat	= V4L2_PIX_FMT_YUV420M,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_3P,
+		.bitperpixel	= { 8, 2, 2 },
+		.num_planes	= 3,
+		.num_comp	= 3,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YVU 4:2:0 non-contiguous 3-planar, Y/Cr/Cb",
+		.pixelformat	= V4L2_PIX_FMT_YVU420M,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_3P,
+		.bitperpixel	= { 8, 2, 2 },
+		.num_planes	= 3,
+		.num_comp	= 3,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 packed, YCbYCr",
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.cfg_val	= SCALER_CFG_FMT_YUYV,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 packed, CbYCrY",
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.cfg_val	= SCALER_CFG_FMT_UYVY,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 packed, YCrYCb",
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.cfg_val	= SCALER_CFG_FMT_YVYU,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 1,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 contiguous 2-planar, Y/CbCr",
+		.pixelformat	= V4L2_PIX_FMT_NV16,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR422_2P,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 2,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 contiguous 2-planar, Y/CrCb",
+		.pixelformat	= V4L2_PIX_FMT_NV61,
+		.cfg_val	= SCALER_CFG_FMT_YCRCB422_2P,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 2,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 not-contiguous 2-planar, Y/CrCb",
+		.pixelformat	= V4L2_PIX_FMT_NV16M,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR422_2P,
+		.bitperpixel	= { 8, 8 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 not-contiguous 2-planar, Y/CrCb",
+		.pixelformat	= V4L2_PIX_FMT_NV61M,
+		.cfg_val	= SCALER_CFG_FMT_YCRCB422_2P,
+		.bitperpixel	= { 8, 8 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 contiguous 3-planar, Y/Cb/Cr",
+		.pixelformat	= V4L2_PIX_FMT_YUV422P,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR422_3P,
+		.bitperpixel	= { 16 },
+		.num_planes	= 1,
+		.num_comp	= 3,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 not-contiguous 3-planar, Y/Cb/Cr",
+		.pixelformat	= V4L2_PIX_FMT_YUV422M,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR422_3P,
+		.bitperpixel	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.num_comp	= 3,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous Y/CbCr",
+		.pixelformat	= V4L2_PIX_FMT_NV12N,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P,
+		.bitperpixel	= { 12 },
+		.num_planes	= 1,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous Y/CbCr 10-bit",
+		.pixelformat	= V4L2_PIX_FMT_NV12N_10B,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P |
+					SCALER_CFG_10BIT_S10,
+		.bitperpixel	= { 15 },
+		.num_planes	= 1,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous 3-planar Y/Cb/Cr",
+		.pixelformat	= V4L2_PIX_FMT_YUV420N,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_3P,
+		.bitperpixel	= { 12 },
+		.num_planes	= 1,
+		.num_comp	= 3,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous 2-planar, Y/CbCr 8+2 bit",
+		.pixelformat	= V4L2_PIX_FMT_NV12M_S10B,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P |
+					SCALER_CFG_10BIT_S10,
+		.bitperpixel	= { 10, 5 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous 2-planar, Y/CbCr 10-bit",
+		.pixelformat	= V4L2_PIX_FMT_NV12M_P010,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P |
+					SCALER_CFG_BYTE_SWAP |
+					SCALER_CFG_10BIT_P010,
+		.bitperpixel	= { 16, 8 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:0 contiguous, Y/CbCr 10-bit",
+		.pixelformat	= V4L2_PIX_FMT_NV12_P010,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR420_2P |
+					SCALER_CFG_BYTE_SWAP |
+					SCALER_CFG_10BIT_P010,
+		.bitperpixel	= { 24 },
+		.num_planes	= 1,
+		.num_comp	= 2,
+		.h_shift	= 1,
+		.v_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 contiguous 2-planar, Y/CbCr 8+2 bit",
+		.pixelformat	= V4L2_PIX_FMT_NV16M_S10B,
+		.cfg_val	= SCALER_CFG_FMT_YCBCR422_2P |
+					SCALER_CFG_10BIT_S10,
+		.bitperpixel	= { 10, 10 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+	}, {
+		.name		= "YUV 4:2:2 contiguous 2-planar, Y/CrCb 8+2 bit",
+		.pixelformat	= V4L2_PIX_FMT_NV61M_S10B,
+		.cfg_val	= SCALER_CFG_FMT_YCRCB422_2P |
+					SCALER_CFG_10BIT_S10,
+		.bitperpixel	= { 10, 10 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.h_shift	= 1,
+	},
+};
+
+#define SCALE_RATIO_CONST(x, y) ((u32)((1048576ULL * (x)) / (y)))
+
+#define SCALE_RATIO(x, y)							\
+({										\
+		u32 ratio;							\
+		typeof(x) _x = (x);						\
+		typeof(y) _y = (y);						\
+		if (__builtin_constant_p(_x) && __builtin_constant_p(_y)) {	\
+			ratio = SCALE_RATIO_CONST(_x, _y);			\
+		} else if ((_x) < 2048) {					\
+			ratio = (u32)((1048576UL * (_x)) / (_y));		\
+		} else {							\
+			unsigned long long dividend = 1048576ULL;		\
+			dividend *= _x;						\
+			do_div(dividend, _y);					\
+			ratio = (u32)dividend;					\
+		}								\
+		ratio;								\
+})
+
+#define SCALE_RATIO_FRACT(x, y, z) ((u32)((((x) << 20) + SCALER_FRACT_VAL(y)) / (z)))
+
+static const u32 sc_version_table[][2] = {
+	{ 0x07000102, SCALER_VERSION(7, 0, 1) }, /* SC_POLY */
+	{ 0x04000002, SCALER_VERSION(5, 1, 0) }, /* SC_POLY */
+	{ 0x04000001, SCALER_VERSION(5, 1, 0) }, /* SC_POLY */
+	{ 0x04000000, SCALER_VERSION(5, 1, 0) }, /* SC_POLY */
+	{ 0x02000100, SCALER_VERSION(5, 0, 1) }, /* SC_POLY */
+	{ 0x02000000, SCALER_VERSION(5, 0, 0) },
+	{ 0x80060007, SCALER_VERSION(4, 2, 0) }, /* SC_BI */
+	{ 0x0100000f, SCALER_VERSION(4, 0, 1) }, /* SC_POLY */
+	{ 0xA0000013, SCALER_VERSION(4, 0, 1) },
+	{ 0xA0000012, SCALER_VERSION(4, 0, 1) },
+	{ 0x80050007, SCALER_VERSION(4, 0, 0) }, /* SC_POLY */
+	{ 0xA000000B, SCALER_VERSION(3, 0, 2) },
+	{ 0xA000000A, SCALER_VERSION(3, 0, 2) },
+	{ 0x8000006D, SCALER_VERSION(3, 0, 1) },
+	{ 0x80000068, SCALER_VERSION(3, 0, 0) },
+	{ 0x8004000C, SCALER_VERSION(2, 2, 0) },
+	{ 0x80000008, SCALER_VERSION(2, 1, 1) },
+	{ 0x80000048, SCALER_VERSION(2, 1, 0) },
+	{ 0x80010000, SCALER_VERSION(2, 0, 1) },
+	{ 0x80000047, SCALER_VERSION(2, 0, 0) },
+};
+
+static const struct sc_variant sc_variant[] = {
+	{
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 16384,
+			.max_h		= 16384,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 16384,
+			.max_h		= 16384,
+		},
+		.version		= SCALER_VERSION(7, 0, 1),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_up_swmax		= SCALE_RATIO_CONST(1, 64),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.ratio_20bit		= 1,
+		.initphase		= 1,
+		.pixfmt_10bit		= 1,
+		.color_fill		= 1,
+
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(5, 1, 0),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_up_swmax		= SCALE_RATIO_CONST(1, 64),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 0,
+		.ratio_20bit		= 1,
+		.initphase		= 1,
+		.pixfmt_10bit		= 1,
+		.color_fill		= 1,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(5, 0, 1),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_up_swmax		= SCALE_RATIO_CONST(1, 64),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 0,
+		.ratio_20bit		= 1,
+		.initphase		= 1,
+		.pixfmt_10bit		= 1,
+		.extra_buf		= 1,
+		.color_fill		= 1,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(5, 0, 0),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_up_swmax		= SCALE_RATIO_CONST(1, 64),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 0,
+		.ratio_20bit		= 1,
+		.initphase		= 1,
+		.pixfmt_10bit		= 1,
+		.extra_buf		= 1,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(4, 2, 0),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 1,
+		.prescale		= 0,
+		.ratio_20bit		= 1,
+		.initphase		= 1,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(4, 0, 1),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_up_swmax		= SCALE_RATIO_CONST(1, 16),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 0,
+		.ratio_20bit		= 1,
+		.initphase		= 1,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(4, 0, 0),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 0,
+		.ratio_20bit		= 0,
+		.initphase		= 0,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(3, 0, 0),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(16, 1),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 1,
+		.ratio_20bit		= 1,
+		.initphase		= 1,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(2, 2, 0),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 1,
+		.prescale		= 0,
+		.ratio_20bit		= 0,
+		.initphase		= 0,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.version		= SCALER_VERSION(2, 0, 1),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 0,
+		.ratio_20bit		= 0,
+		.initphase		= 0,
+	}, {
+		.limit_input = {
+			.min_w		= 16,
+			.min_h		= 16,
+			.max_w		= 8192,
+			.max_h		= 8192,
+		},
+		.limit_output = {
+			.min_w		= 4,
+			.min_h		= 4,
+			.max_w		= 4096,
+			.max_h		= 4096,
+		},
+		.version		= SCALER_VERSION(2, 0, 0),
+		.sc_up_max		= SCALE_RATIO_CONST(1, 8),
+		.sc_down_min		= SCALE_RATIO_CONST(4, 1),
+		.sc_down_swmin		= SCALE_RATIO_CONST(16, 1),
+		.blending		= 0,
+		.prescale		= 0,
+		.ratio_20bit		= 0,
+		.initphase		= 0,
+	},
+};
+
+static const struct sc_fmt *sc_find_format(struct sc_dev *sc,
+					   u32 pixfmt, bool output_buf)
+{
+	const struct sc_fmt *sc_fmt;
+	unsigned long i;
+
+	for (i = 0; i < ARRAY_SIZE(sc_formats); ++i) {
+		sc_fmt = &sc_formats[i];
+		if (sc_fmt->pixelformat == pixfmt) {
+			if (!!(sc_fmt->cfg_val & SCALER_CFG_TILE_EN)) {
+				/* tile mode is not supported from v3.0.0 */
+				if (sc->version >= SCALER_VERSION(3, 0, 0))
+					return NULL;
+				if (!output_buf)
+					return NULL;
+			}
+			/* bytes swap is not supported under v2.1.0 */
+			if (!!(sc_fmt->cfg_val & SCALER_CFG_SWAP_MASK) &&
+			    sc->version < SCALER_VERSION(2, 1, 0))
+				return NULL;
+			return &sc_formats[i];
+		}
+	}
+
+	return NULL;
+}
+
+static int sc_v4l2_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MODULE_NAME, strlen(MODULE_NAME) + 1);
+	strscpy(cap->card, MODULE_NAME, strlen(MODULE_NAME) + 1);
+
+	return 0;
+}
+
+static int sc_v4l2_g_fmt_mplane(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+	const struct sc_fmt *sc_fmt;
+	struct sc_frame *frame;
+	struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
+	int i;
+
+	frame = ctx_get_frame(ctx, f->type);
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	sc_fmt = frame->sc_fmt;
+
+	pixm->width		= frame->width;
+	pixm->height		= frame->height;
+	pixm->pixelformat	= frame->pixelformat;
+	pixm->field		= V4L2_FIELD_NONE;
+	pixm->num_planes	= frame->sc_fmt->num_planes;
+	pixm->colorspace	= 0;
+
+	for (i = 0; i < pixm->num_planes; ++i) {
+		pixm->plane_fmt[i].bytesperline = (pixm->width *
+				sc_fmt->bitperpixel[i]) >> 3;
+		if (sc_fmt_is_ayv12(sc_fmt->pixelformat)) {
+			unsigned int y_size, c_span;
+
+			y_size = pixm->width * pixm->height;
+			c_span = ALIGN(pixm->width >> 1, 16);
+			pixm->plane_fmt[i].sizeimage =
+				y_size + (c_span * pixm->height >> 1) * 2;
+		} else {
+			pixm->plane_fmt[i].sizeimage =
+				pixm->plane_fmt[i].bytesperline * pixm->height;
+		}
+	}
+
+	return 0;
+}
+
+int sc_calc_s10b_planesize(u32 pixelformat, u32 width, u32 height,
+			   u32 *ysize, u32 *csize, bool only_8bit, u8 byte32num)
+{
+	int ret = 0;
+	int c_padding = 0;
+
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_NV12M_S10B:
+	case V4L2_PIX_FMT_NV12N_10B:
+			*ysize = NV12M_Y_SIZE(width, height);
+			*csize = NV12M_CBCR_SIZE(width, height);
+		break;
+	case V4L2_PIX_FMT_NV16M_S10B:
+	case V4L2_PIX_FMT_NV61M_S10B:
+			*ysize = NV16M_Y_SIZE(width, height);
+			*csize = NV16M_CBCR_SIZE(width, height);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret || only_8bit)
+		return ret;
+
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_NV12M_S10B:
+	case V4L2_PIX_FMT_NV12N_10B:
+			*ysize += NV12M_Y_2B_SIZE(width, height);
+			*csize += NV12M_CBCR_2B_SIZE(width, height);
+			c_padding = 256;
+		break;
+	case V4L2_PIX_FMT_NV16M_S10B:
+	case V4L2_PIX_FMT_NV61M_S10B:
+			*ysize += NV16M_Y_2B_SIZE(width, height);
+			*csize += NV16M_CBCR_2B_SIZE(width, height);
+			c_padding = 256;
+		break;
+	}
+
+	*csize -= c_padding;
+
+	return ret;
+}
+
+static int sc_v4l2_try_fmt_mplane(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+	const struct sc_fmt *sc_fmt;
+	struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
+	const struct sc_size_limit *limit;
+	int i;
+	int h_align = 0;
+	int w_align = 0;
+	unsigned int ext_size = 0;
+	struct sc_frame *frame;
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "not supported v4l2 type\n");
+		return -EINVAL;
+	}
+
+	sc_fmt = sc_find_format(ctx->sc_dev, f->fmt.pix_mp.pixelformat,
+				V4L2_TYPE_IS_OUTPUT(f->type));
+	if (!sc_fmt) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "not supported format type\n");
+		return -EINVAL;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type))
+		limit = &ctx->sc_dev->variant->limit_input;
+	else
+		limit = &ctx->sc_dev->variant->limit_output;
+
+	/*
+	 * Y_SPAN - should even in interleaved YCbCr422
+	 * C_SPAN - should even in YCbCr420 and YCbCr422
+	 */
+	w_align = sc_fmt->h_shift;
+	h_align = sc_fmt->v_shift;
+
+	/* Bound an image to have width and height in limit */
+	v4l_bound_align_image(&pixm->width, limit->min_w, limit->max_w,
+			      w_align, &pixm->height, limit->min_h,
+			      limit->max_h, h_align, 0);
+
+	pixm->num_planes = sc_fmt->num_planes;
+	pixm->colorspace = 0;
+
+	if (ctx->sc_dev->variant->extra_buf && V4L2_TYPE_IS_OUTPUT(f->type))
+		ext_size = sc_ext_buf_size(pixm->width);
+
+	frame = ctx_get_frame(ctx, f->type);
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	for (i = 0; i < pixm->num_planes; ++i) {
+		pixm->plane_fmt[i].bytesperline = (pixm->width *
+				sc_fmt->bitperpixel[i]) >> 3;
+		if (sc_fmt_is_ayv12(sc_fmt->pixelformat)) {
+			unsigned int y_size, c_span;
+
+			y_size = pixm->width * pixm->height;
+			c_span = ALIGN(pixm->width >> 1, 16);
+			pixm->plane_fmt[i].sizeimage =
+				y_size + (c_span * pixm->height >> 1) * 2;
+		} else {
+			pixm->plane_fmt[i].sizeimage =
+				pixm->plane_fmt[i].bytesperline * pixm->height;
+		}
+	}
+
+	for (i = 0; ext_size && i < pixm->num_planes; i++)
+		pixm->plane_fmt[i].sizeimage += (i == 0) ? ext_size : ext_size / 2;
+
+	return 0;
+}
+
+static int sc_v4l2_s_fmt_mplane(struct file *file, void *fh,
+				struct v4l2_format *f)
+
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	struct sc_frame *frame;
+	struct v4l2_pix_format_mplane *pixm = &f->fmt.pix_mp;
+	const struct sc_size_limit *limitout =
+				&ctx->sc_dev->variant->limit_input;
+	const struct sc_size_limit *limitcap =
+				&ctx->sc_dev->variant->limit_output;
+	int i, ret = 0;
+
+	if (IS_ERR_OR_NULL(vq)) {
+		pr_err("[%s] vq(%p) is wrong\n", __func__, vq);
+		return -EINVAL;
+	}
+
+	if (vb2_is_streaming(vq)) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev, "device is busy\n");
+		return -EBUSY;
+	}
+
+	ret = sc_v4l2_try_fmt_mplane(file, fh, f);
+	if (ret < 0)
+		return ret;
+
+	frame = ctx_get_frame(ctx, f->type);
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	set_bit(CTX_PARAMS, &ctx->flags);
+
+	frame->sc_fmt = sc_find_format(ctx->sc_dev, f->fmt.pix_mp.pixelformat,
+				       V4L2_TYPE_IS_OUTPUT(f->type));
+	if (!frame->sc_fmt) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "not supported format values\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < frame->sc_fmt->num_planes; i++)
+		frame->bytesused[i] = pixm->plane_fmt[i].sizeimage;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    (pixm->width > limitout->max_w ||
+			 pixm->height > limitout->max_h)) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "%dx%d of source image is not supported: too large\n",
+			pixm->width, pixm->height);
+		return -EINVAL;
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    (pixm->width > limitcap->max_w ||
+	    pixm->height > limitcap->max_h)) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "%dx%d of target image is not supported: too large\n",
+			 pixm->width, pixm->height);
+		return -EINVAL;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    (pixm->width < limitout->min_w ||
+	    pixm->height < limitout->min_h)) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "%dx%d of source image is not supported: too small\n",
+			 pixm->width, pixm->height);
+		return -EINVAL;
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    (pixm->width < limitcap->min_w ||
+	    pixm->height < limitcap->min_h)) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "%dx%d of target image is not supported: too small\n",
+			 pixm->width, pixm->height);
+		return -EINVAL;
+	}
+
+	if (pixm->flags == V4L2_PIX_FMT_FLAG_PREMUL_ALPHA &&
+	    ctx->sc_dev->version != SCALER_VERSION(4, 0, 0))
+		frame->pre_multi = true;
+	else
+		frame->pre_multi = false;
+
+	frame->width = pixm->width;
+	frame->height = pixm->height;
+	frame->pixelformat = pixm->pixelformat;
+
+	frame->crop.width = pixm->width;
+	frame->crop.height = pixm->height;
+
+	return 0;
+}
+
+static int sc_v4l2_reqbufs(struct file *file, void *fh,
+			   struct v4l2_requestbuffers *reqbufs)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+
+	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
+}
+
+static int sc_v4l2_querybuf(struct file *file, void *fh,
+			    struct v4l2_buffer *buf)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+
+	return v4l2_m2m_querybuf(file, ctx->m2m_ctx, buf);
+}
+
+#define sc_from_vb2_to_sc_buf(vb2_buf)					       \
+({									       \
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);	       \
+	struct v4l2_m2m_buffer *m2m_buf =				       \
+				container_of(v4l2_buf, typeof(*m2m_buf), vb);  \
+	struct vb2_sc_buffer *sc_buf =					       \
+				container_of(m2m_buf, typeof(*sc_buf), mb);    \
+									       \
+	sc_buf;								       \
+})
+
+static void __sc_vb2_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
+			       struct vb2_v4l2_buffer *v4l2_buf);
+
+static void sc_fence_cb(struct dma_fence *f, struct dma_fence_cb *cb)
+{
+	struct vb2_sc_buffer *sc_buf = container_of(cb, typeof(*sc_buf),
+						    fence_cb);
+	struct vb2_buffer *vb = &sc_buf->mb.vb.vb2_buf;
+	struct sc_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct dma_fence *fence;
+
+	do {
+		fence = sc_buf->in_fence;
+	} while (cmpxchg(&sc_buf->in_fence, fence, NULL) != fence);
+
+	if (!fence)
+		return;
+
+	if (fence->error) {
+		dev_err(ctx->sc_dev->dev,
+			"%s: in-fence: %s #%llu, error: %d\n",
+		       __func__, fence->ops->get_driver_name(fence),
+		       fence->seqno, fence->error);
+
+		sc_buf->state = fence->error;
+	}
+	dma_fence_put(fence);
+
+	schedule_work(&sc_buf->qbuf_work);
+}
+
+static void __sc_qbuf_work(struct work_struct *work)
+{
+	struct vb2_sc_buffer *sc_buf = container_of(work, typeof(*sc_buf),
+						    qbuf_work);
+	struct vb2_v4l2_buffer *v4l2_buf = &sc_buf->mb.vb;
+	struct sc_ctx *ctx = vb2_get_drv_priv(v4l2_buf->vb2_buf.vb2_queue);
+
+	__sc_vb2_buf_queue(ctx->m2m_ctx, v4l2_buf);
+}
+
+#define SC_FENCE_TIMEOUT	(1000)
+static void sc_fence_timeout_handler(struct timer_list *t)
+{
+	struct vb2_sc_buffer *sc_buf = container_of(t, typeof(*sc_buf),
+						    fence_timer);
+	struct vb2_buffer *vb = &sc_buf->mb.vb.vb2_buf;
+	struct sc_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct dma_fence *fence;
+
+	do {
+		fence = sc_buf->in_fence;
+	} while (cmpxchg(&sc_buf->in_fence, fence, NULL) != fence);
+
+	if (!fence)
+		return;
+
+	dma_fence_remove_callback(fence, &sc_buf->fence_cb);
+
+	dev_err(ctx->sc_dev->dev,
+		"%s: timeout(%d ms) in-fence: %s #%llu (%s), error: %d\n",
+		__func__, SC_FENCE_TIMEOUT,
+		fence->ops->get_driver_name(fence), fence->seqno,
+		dma_fence_is_signaled(fence) ? "signaled" : "active",
+		fence->error);
+
+	sc_buf->state = -ETIMEDOUT;
+
+	dma_fence_put(fence);
+
+	fence = sc_buf->out_sync_file->fence;
+	if (fence)
+		dev_err(ctx->sc_dev->dev,
+			"%s: out-fence: #%llu\n", __func__, fence->seqno);
+
+	__sc_vb2_buf_queue(ctx->m2m_ctx, &sc_buf->mb.vb);
+}
+
+static void sc_remove_out_fence(struct vb2_sc_buffer *sc_buf)
+{
+	fput(sc_buf->out_sync_file->file);
+	sc_buf->out_sync_file = NULL;
+}
+
+static struct vb2_sc_buffer *sc_get_sc_buf_from_v4l2_buf(struct sc_ctx *ctx,
+							 struct v4l2_buffer *buf)
+{
+	struct vb2_queue *vq;
+	struct vb2_buffer *vb;
+
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, buf->type);
+	if (IS_ERR_OR_NULL(vq))
+		return ERR_PTR(-EINVAL);
+
+	if (buf->index >= VB2_MAX_FRAME) {
+		dev_err(ctx->sc_dev->dev,
+			"%s: buf->index(%d) >= VB2_MAX_FRAME(%d)\n",
+			__func__, buf->index, VB2_MAX_FRAME);
+		return ERR_PTR(-EINVAL);
+	}
+
+	vb = vq->bufs[buf->index];
+	if (IS_ERR_OR_NULL(vb)) {
+		dev_err(ctx->sc_dev->dev,
+			"%s: vb2_buffer is NULL\n", __func__);
+		return ERR_PTR(-EFAULT);
+	}
+
+	if (IS_ERR_OR_NULL(buf->m.planes)) {
+		dev_err(ctx->sc_dev->dev, "the array of planes is invalid\n");
+		return ERR_PTR(-EFAULT);
+	}
+
+	if (buf->length < vb->num_planes || buf->length > VB2_MAX_PLANES) {
+		dev_err(ctx->sc_dev->dev,
+			"%s: buf->length is expected %d, but got %d.\n",
+			__func__, buf->length, vb->num_planes);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return sc_from_vb2_to_sc_buf(vb);
+}
+
+static int sc_v4l2_qbuf(struct file *file, void *fh,
+			struct v4l2_buffer *buf)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+	struct vb2_sc_buffer *sc_buf;
+	int out_fence_fd = -1;
+	int ret;
+
+	if (IS_ERR_OR_NULL(buf)) {
+		dev_err(ctx->sc_dev->dev, "%s : buf(%p) is wrong\n",
+			__func__, buf);
+		return -EINVAL;
+	}
+
+	sc_buf = sc_get_sc_buf_from_v4l2_buf(ctx, buf);
+	if (IS_ERR(sc_buf)) {
+		dev_err(ctx->sc_dev->dev, "%s : failed to get sc_buf from v4l2_buf\n",
+			__func__);
+		return PTR_ERR(sc_buf);
+	}
+
+	sc_buf->state = 0;
+
+	ret = v4l2_m2m_qbuf(file, ctx->m2m_ctx, buf);
+	if (ret)
+		goto err;
+
+	if (sc_buf->out_sync_file) {
+		fd_install((unsigned int)out_fence_fd, get_file(sc_buf->out_sync_file->file));
+		buf->reserved = (unsigned int)out_fence_fd;
+	}
+
+	return ret;
+
+err:
+	if (sc_buf->in_fence) {
+		dma_fence_put(sc_buf->in_fence);
+		sc_buf->in_fence = NULL;
+	}
+	if (sc_buf->out_sync_file)
+		sc_remove_out_fence(sc_buf);
+	if (out_fence_fd >= 0)
+		put_unused_fd(out_fence_fd);
+
+	return ret;
+}
+
+static int sc_v4l2_dqbuf(struct file *file, void *fh,
+			 struct v4l2_buffer *buf)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+
+	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
+}
+
+static int sc_v4l2_streamon(struct file *file, void *fh,
+			    enum v4l2_buf_type type)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+
+	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
+}
+
+static int sc_v4l2_streamoff(struct file *file, void *fh,
+			     enum v4l2_buf_type type)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+
+	return v4l2_m2m_streamoff(file, ctx->m2m_ctx, type);
+}
+
+static int sc_v4l2_g_selection(struct file *file, void *fh,
+			       struct v4l2_selection *s)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+	struct sc_frame *frame;
+
+	if (IS_ERR_OR_NULL(s)) {
+		pr_err("[%s] s(%p) is wrong\n", __func__, s);
+		return PTR_ERR(s);
+	}
+
+	frame = ctx_get_frame(ctx, s->type);
+
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	s->r.left = SC_CROP_MAKE_FR_VAL(frame->crop.left, ctx->init_phase.yh);
+	s->r.top = SC_CROP_MAKE_FR_VAL(frame->crop.top, ctx->init_phase.yv);
+	s->r.width = SC_CROP_MAKE_FR_VAL(frame->crop.width, ctx->init_phase.w);
+	s->r.height = SC_CROP_MAKE_FR_VAL(frame->crop.height, ctx->init_phase.h);
+
+	return 0;
+}
+
+static int sc_get_fract_val(struct v4l2_rect *rect, struct sc_ctx *ctx)
+{
+	if (IS_ERR_OR_NULL(rect) || IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] rect(%p) or ctx(%p) is wrong\n", __func__, rect, ctx);
+		return -EINVAL;
+	}
+
+	ctx->init_phase.yh = SC_CROP_GET_FR_VAL(rect->left);
+	if (ctx->init_phase.yh)
+		rect->left &= SC_CROP_INT_MASK;
+
+	ctx->init_phase.yv = SC_CROP_GET_FR_VAL(rect->top);
+	if (ctx->init_phase.yv)
+		rect->top &= SC_CROP_INT_MASK;
+
+	ctx->init_phase.w = SC_CROP_GET_FR_VAL(rect->width);
+	if (ctx->init_phase.w) {
+		rect->width &= SC_CROP_INT_MASK;
+		rect->width += 1;
+	}
+
+	ctx->init_phase.h = SC_CROP_GET_FR_VAL(rect->height);
+	if (ctx->init_phase.h) {
+		rect->height &= SC_CROP_INT_MASK;
+		rect->height += 1;
+	}
+
+	if (sc_fmt_is_yuv420(ctx->s_frame.sc_fmt->pixelformat)) {
+		ctx->init_phase.ch = ctx->init_phase.yh / 2;
+		ctx->init_phase.cv = ctx->init_phase.yv / 2;
+	} else {
+		ctx->init_phase.ch = ctx->init_phase.yh;
+		ctx->init_phase.cv = ctx->init_phase.yv;
+	}
+
+	if ((ctx->init_phase.yh || ctx->init_phase.yv || ctx->init_phase.w ||
+	     ctx->init_phase.h) &&
+	     (!(sc_fmt_is_yuv420(ctx->s_frame.sc_fmt->pixelformat) ||
+	     sc_fmt_is_rgb888(ctx->s_frame.sc_fmt->pixelformat)))) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "%s format on real number is not supported",
+			 ctx->s_frame.sc_fmt->name);
+		return -EINVAL;
+	}
+
+	v4l2_dbg(1, SC_LOG_LEVEL, &ctx->sc_dev->m2m.v4l2_dev,
+		 "src crop position (x,y,w,h) = (%d.%d, %d.%d, %d.%d, %d.%d) %d, %d\n",
+		 rect->left, ctx->init_phase.yh,
+		 rect->top, ctx->init_phase.yv,
+		 rect->width, ctx->init_phase.w,
+		 rect->height, ctx->init_phase.h,
+		 ctx->init_phase.ch, ctx->init_phase.cv);
+	return 0;
+}
+
+static int sc_v4l2_s_selection(struct file *file, void *fh,
+			       struct v4l2_selection *s)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(fh);
+	struct sc_dev *sc = ctx->sc_dev;
+	struct sc_frame *frame;
+	struct v4l2_rect rect;
+	const struct sc_size_limit *limit = NULL;
+	int w_align = 0;
+	int h_align = 0;
+	int ret = 0;
+
+	if (IS_ERR_OR_NULL(s)) {
+		pr_err("[%s] s(%p) is wrong\n", __func__, s);
+		return -EINVAL;
+	}
+
+	rect = s->r;
+	frame = ctx_get_frame(ctx, s->type);
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	if (!test_bit(CTX_PARAMS, &ctx->flags)) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "color format is not set\n");
+		return -EINVAL;
+	}
+
+	if (s->r.left < 0 || s->r.top < 0) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "crop position is negative\n");
+		return -EINVAL;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(s->type)) {
+		ret = sc_get_fract_val(&rect, ctx);
+		if (ret < 0)
+			return ret;
+		limit = &sc->variant->limit_input;
+		set_bit(CTX_SRC_FMT, &ctx->flags);
+	} else {
+		limit = &sc->variant->limit_output;
+		set_bit(CTX_DST_FMT, &ctx->flags);
+	}
+
+	w_align = frame->sc_fmt->h_shift;
+	h_align = frame->sc_fmt->v_shift;
+
+	/* Bound an image to have crop width and height in limit */
+	v4l_bound_align_image(&rect.width, limit->min_w, limit->max_w,
+			      w_align, &rect.height, limit->min_h,
+			      limit->max_h, h_align, 0);
+
+	/* Bound an image to have crop position in limit */
+	v4l_bound_align_image(&rect.left, 0, frame->width - rect.width,
+			      w_align, &rect.top, 0, frame->height - rect.height,
+			      h_align, 0);
+
+	if (!V4L2_TYPE_IS_OUTPUT(s->type))
+		rect.width = ALIGN_DOWN(rect.width, 4);
+
+	if (rect.height > frame->height || rect.top > frame->height ||
+	    rect.width > frame->width || rect.left > frame->width) {
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "Out of crop range: (%d,%d,%d,%d) from %dx%d\n",
+			 rect.left, rect.top, rect.width, rect.height,
+			 frame->width, frame->height);
+		return -EINVAL;
+	}
+
+	frame->crop.top = rect.top;
+	frame->crop.left = rect.left;
+	frame->crop.height = rect.height;
+	frame->crop.width = rect.width;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops sc_v4l2_ioctl_ops = {
+	.vidioc_querycap		= sc_v4l2_querycap,
+
+	.vidioc_g_fmt_vid_cap_mplane	= sc_v4l2_g_fmt_mplane,
+	.vidioc_g_fmt_vid_out_mplane	= sc_v4l2_g_fmt_mplane,
+
+	.vidioc_try_fmt_vid_cap_mplane	= sc_v4l2_try_fmt_mplane,
+	.vidioc_try_fmt_vid_out_mplane	= sc_v4l2_try_fmt_mplane,
+
+	.vidioc_s_fmt_vid_cap_mplane	= sc_v4l2_s_fmt_mplane,
+	.vidioc_s_fmt_vid_out_mplane	= sc_v4l2_s_fmt_mplane,
+
+	.vidioc_reqbufs			= sc_v4l2_reqbufs,
+	.vidioc_querybuf		= sc_v4l2_querybuf,
+
+	.vidioc_qbuf			= sc_v4l2_qbuf,
+	.vidioc_dqbuf			= sc_v4l2_dqbuf,
+
+	.vidioc_streamon		= sc_v4l2_streamon,
+	.vidioc_streamoff		= sc_v4l2_streamoff,
+
+	.vidioc_g_selection		= sc_v4l2_g_selection,
+	.vidioc_s_selection		= sc_v4l2_s_selection,
+};
+
+struct v4l2_m2m_dev *sc_get_m2m_dev(struct sc_ctx *ctx)
+{
+	struct v4l2_m2m_dev *m2m_dev;
+	struct sc_dev *sc = ctx->sc_dev;
+
+	m2m_dev = (ctx->priority == SC_CTX_HIGH_PRIO ?
+		sc->m2m.m2m_dev_hp : sc->m2m.m2m_dev_lp);
+
+	return m2m_dev;
+}
+
+static int sc_ctx_stop_req(struct sc_ctx *ctx)
+{
+	struct sc_ctx *curr_ctx;
+	struct sc_dev *sc = NULL;
+	struct v4l2_m2m_dev *m2m_dev;
+	int ret = 0;
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return -EBUSY;
+	}
+
+	sc = ctx->sc_dev;
+	m2m_dev = sc_get_m2m_dev(ctx);
+
+	curr_ctx = v4l2_m2m_get_curr_priv(m2m_dev);
+	if (!test_bit(CTX_RUN, &ctx->flags) || curr_ctx != ctx)
+		return 0;
+
+	set_bit(CTX_ABORT, &ctx->flags);
+
+	ret = wait_event_timeout(sc->wait,
+				 !test_bit(CTX_RUN, &ctx->flags), SC_TIMEOUT);
+
+	/* TODO: How to handle case of timeout event */
+	if (ret == 0) {
+		dev_err(sc->dev, "device failed to stop request\n");
+		ret = -EBUSY;
+	}
+
+	return ret;
+}
+
+static void sc_calc_planesize(struct sc_frame *frame, unsigned int pixsize)
+{
+	int idx = 0;
+
+	if (IS_ERR_OR_NULL(frame)) {
+		pr_err("[%s] frame(%p) is wrong\n", __func__, frame);
+		return;
+	}
+
+	idx = frame->sc_fmt->num_planes;
+
+	while (idx-- > 0)
+		frame->addr.size[idx] =
+			(pixsize * frame->sc_fmt->bitperpixel[idx]) / 8;
+}
+
+static int sc_prepare_2nd_scaling(struct sc_ctx *ctx,
+				  __s32 src_width, __s32 src_height,
+				  unsigned int *h_ratio, unsigned int *v_ratio)
+{
+	struct sc_dev *sc = ctx->sc_dev;
+	struct v4l2_rect crop = ctx->d_frame.crop;
+	const struct sc_size_limit *limit;
+	unsigned int halign = 0, walign = 0;
+	const struct sc_fmt *target_fmt = ctx->d_frame.sc_fmt;
+
+	limit = &sc->variant->limit_input;
+	if (*v_ratio > SCALE_RATIO_CONST(4, 1))
+		crop.height = ((src_height + 7) / 8) * 2;
+
+	if (crop.height < limit->min_h)
+		crop.height = limit->min_h;
+
+	if (*h_ratio > SCALE_RATIO_CONST(4, 1))
+		crop.width = ((src_width + 7) / 8) * 2;
+
+	if (crop.width < limit->min_w)
+		crop.width = limit->min_w;
+
+	if (*v_ratio < SCALE_RATIO_CONST(1, 8)) {
+		crop.height = src_height * 8;
+		if (crop.height > limit->max_h)
+			crop.height = limit->max_h;
+	}
+
+	if (*h_ratio < SCALE_RATIO_CONST(1, 8)) {
+		crop.width = src_width * 8;
+		if (crop.width > limit->max_w)
+			crop.width = limit->max_w;
+	}
+
+	walign = target_fmt->h_shift;
+	halign = target_fmt->v_shift;
+
+	limit = &sc->variant->limit_output;
+	v4l_bound_align_image(&crop.width, limit->min_w, limit->max_w,
+			      walign, &crop.height, limit->min_h,
+			      limit->max_h, halign, 0);
+
+	/* align up for scale down, align down for scale up */
+	*h_ratio = SCALE_RATIO(src_width, crop.width);
+	*v_ratio = SCALE_RATIO(src_height, crop.height);
+
+	if (ctx->i_frame->frame.sc_fmt != ctx->d_frame.sc_fmt ||
+	    memcmp(&crop, &ctx->i_frame->frame.crop, sizeof(crop)) ||
+	    ctx->cp_enabled != test_bit(CTX_INT_FRAME_CP, &sc->state)) {
+		if (ctx->cp_enabled)
+			set_bit(CTX_INT_FRAME_CP, &sc->state);
+		else
+			clear_bit(CTX_INT_FRAME_CP, &sc->state);
+
+		memcpy(&ctx->i_frame->frame, &ctx->d_frame,
+		       sizeof(ctx->d_frame));
+		memcpy(&ctx->i_frame->frame.crop, &crop, sizeof(crop));
+	}
+
+	return 0;
+}
+
+static struct sc_dnoise_filter sc_filter_tab[5] = {
+	{SC_FT_240,   426,  240},
+	{SC_FT_480,   854,  480},
+	{SC_FT_720,  1280,  720},
+	{SC_FT_960,  1920,  960},
+	{SC_FT_1080, 1920, 1080},
+};
+
+static int sc_find_filter_size(struct sc_ctx *ctx)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sc_filter_tab); i++) {
+		if (sc_filter_tab[i].strength == ctx->dnoise_ft.strength) {
+			if (ctx->s_frame.width >= ctx->s_frame.height) {
+				ctx->dnoise_ft.w = sc_filter_tab[i].w;
+				ctx->dnoise_ft.h = sc_filter_tab[i].h;
+			} else {
+				ctx->dnoise_ft.w = sc_filter_tab[i].h;
+				ctx->dnoise_ft.h = sc_filter_tab[i].w;
+			}
+			break;
+		}
+	}
+
+	if (i == ARRAY_SIZE(sc_filter_tab)) {
+		dev_err(ctx->sc_dev->dev,
+			"%s: can't find filter size\n", __func__);
+		return -EINVAL;
+	}
+
+	if (ctx->s_frame.crop.width < ctx->dnoise_ft.w ||
+	    ctx->s_frame.crop.height < ctx->dnoise_ft.h) {
+		dev_err(ctx->sc_dev->dev,
+			"%s: filter is over source size.(%dx%d -> %dx%d)\n",
+			__func__, ctx->s_frame.crop.width,
+			ctx->s_frame.crop.height, ctx->dnoise_ft.w,
+			ctx->dnoise_ft.h);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int sc_prepare_denoise_filter(struct sc_ctx *ctx)
+{
+	unsigned int sc_down_min = 0;
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return -ENOMEM;
+	}
+
+	sc_down_min = ctx->sc_dev->variant->sc_down_min;
+
+	if (ctx->dnoise_ft.strength <= SC_FT_BLUR)
+		return 0;
+
+	if (sc_find_filter_size(ctx))
+		return -EINVAL;
+
+	memcpy(&ctx->i_frame->frame, &ctx->d_frame, sizeof(ctx->d_frame));
+	ctx->i_frame->frame.crop.width = ctx->dnoise_ft.w;
+	ctx->i_frame->frame.crop.height = ctx->dnoise_ft.h;
+
+	ctx->h_ratio = SCALE_RATIO(ctx->s_frame.crop.width, ctx->dnoise_ft.w);
+	ctx->v_ratio = SCALE_RATIO(ctx->s_frame.crop.height, ctx->dnoise_ft.h);
+
+	if (ctx->h_ratio > sc_down_min ||
+	    ctx->h_ratio < ctx->sc_dev->variant->sc_up_max) {
+		dev_err(ctx->sc_dev->dev,
+			"filter can't support width scaling(%d -> %d)\n",
+			ctx->s_frame.crop.width, ctx->dnoise_ft.w);
+	}
+
+	if (ctx->v_ratio > sc_down_min ||
+	    ctx->v_ratio < ctx->sc_dev->variant->sc_up_max) {
+		dev_err(ctx->sc_dev->dev,
+			"filter can't support height scaling(%d -> %d)\n",
+			ctx->s_frame.crop.height, ctx->dnoise_ft.h);
+	}
+
+	if (ctx->sc_dev->variant->prescale) {
+		if (ctx->h_ratio > SCALE_RATIO_CONST(8, 1))
+			ctx->pre_h_ratio = 2;
+		else if (ctx->h_ratio > SCALE_RATIO_CONST(4, 1))
+			ctx->pre_h_ratio = 1;
+		else
+			ctx->pre_h_ratio = 0;
+
+		if (ctx->v_ratio > SCALE_RATIO_CONST(8, 1))
+			ctx->pre_v_ratio = 2;
+		else if (ctx->v_ratio > SCALE_RATIO_CONST(4, 1))
+			ctx->pre_v_ratio = 1;
+		else
+			ctx->pre_v_ratio = 0;
+
+		if (ctx->pre_h_ratio || ctx->pre_v_ratio) {
+			if (!IS_ALIGNED(ctx->s_frame.crop.width,
+					1 << (ctx->pre_h_ratio +
+					ctx->s_frame.sc_fmt->h_shift))) {
+				dev_err(ctx->sc_dev->dev,
+					"filter can't support not-aligned source(%d -> %d)\n",
+			ctx->s_frame.crop.width, ctx->dnoise_ft.w);
+			} else if (!IS_ALIGNED(ctx->s_frame.crop.height,
+					1 << (ctx->pre_v_ratio +
+					ctx->s_frame.sc_fmt->v_shift))) {
+				dev_err(ctx->sc_dev->dev,
+					"filter can't support not-aligned source(%d -> %d)\n",
+			ctx->s_frame.crop.height, ctx->dnoise_ft.h);
+			} else {
+				ctx->h_ratio >>= ctx->pre_h_ratio;
+				ctx->v_ratio >>= ctx->pre_v_ratio;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int sc_find_scaling_ratio(struct sc_ctx *ctx)
+{
+	__s32 src_width, src_height;
+	unsigned int h_ratio, v_ratio;
+	struct sc_dev *sc = NULL;
+	unsigned int sc_down_min = 0;
+	unsigned int sc_up_max = 0;
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return -EINVAL;
+	}
+
+	sc = ctx->sc_dev;
+	sc_down_min = sc->variant->sc_down_min;
+	sc_up_max = sc->variant->sc_up_max;
+
+	if (ctx->s_frame.crop.width == 0 ||
+	    ctx->d_frame.crop.width == 0)
+		return 0; /* s_fmt is not complete */
+
+	src_width = ctx->s_frame.crop.width;
+	src_height = ctx->s_frame.crop.height;
+	if (!!(ctx->flip_rot_cfg & SCALER_ROT_90))
+		swap(src_width, src_height);
+
+	h_ratio = SCALE_RATIO(src_width, ctx->d_frame.crop.width);
+	v_ratio = SCALE_RATIO(src_height, ctx->d_frame.crop.height);
+
+	/*
+	 * If the source crop width or height is fractional value
+	 * calculate scaling ratio including it and calculate with original
+	 * crop.width and crop.height value because they were rounded up.
+	 */
+	if (ctx->init_phase.w)
+		h_ratio = SCALE_RATIO_FRACT((src_width - 1), ctx->init_phase.w,
+					    ctx->d_frame.crop.width);
+	if (ctx->init_phase.h)
+		v_ratio = SCALE_RATIO_FRACT((src_height - 1), ctx->init_phase.h,
+					    ctx->d_frame.crop.height);
+	sc_dbg("Scaling ratio h_ratio %d, v_ratio %d\n", h_ratio, v_ratio);
+
+	if (h_ratio > sc->variant->sc_down_swmin ||
+	    h_ratio < sc->variant->sc_up_swmax) {
+		dev_err(sc->dev, "Width scaling is out of range(%d -> %d)\n",
+			src_width, ctx->d_frame.crop.width);
+		return -EINVAL;
+	}
+
+	if (v_ratio > sc->variant->sc_down_swmin ||
+	    v_ratio < sc->variant->sc_up_swmax) {
+		dev_err(sc->dev, "Height scaling is out of range(%d -> %d)\n",
+			src_height, ctx->d_frame.crop.height);
+		return -EINVAL;
+	}
+
+	if (sc->variant->prescale) {
+		if (h_ratio > SCALE_RATIO_CONST(8, 1))
+			ctx->pre_h_ratio = 2;
+		else if (h_ratio > SCALE_RATIO_CONST(4, 1))
+			ctx->pre_h_ratio = 1;
+		else
+			ctx->pre_h_ratio = 0;
+
+		if (v_ratio > SCALE_RATIO_CONST(8, 1))
+			ctx->pre_v_ratio = 2;
+		else if (v_ratio > SCALE_RATIO_CONST(4, 1))
+			ctx->pre_v_ratio = 1;
+		else
+			ctx->pre_v_ratio = 0;
+
+		/*
+		 * If the source image resolution violates the constraints of
+		 * pre-scaler, then performs poly-phase scaling twice
+		 */
+		if (ctx->pre_h_ratio || ctx->pre_v_ratio) {
+			if (!IS_ALIGNED(src_width, 1 << (ctx->pre_h_ratio +
+					ctx->s_frame.sc_fmt->h_shift)) ||
+				!IS_ALIGNED(src_height, 1 << (ctx->pre_v_ratio +
+					ctx->s_frame.sc_fmt->v_shift))) {
+				sc_down_min = SCALE_RATIO_CONST(4, 1);
+				ctx->pre_h_ratio = 0;
+				ctx->pre_v_ratio = 0;
+			} else {
+				h_ratio >>= ctx->pre_h_ratio;
+				v_ratio >>= ctx->pre_v_ratio;
+			}
+		}
+
+		if (sc_down_min == SCALE_RATIO_CONST(4, 1)) {
+			dev_info(sc->dev,
+				 "%s: Prepared 2nd polyphase scaler (%dx%d->%dx%d)\n",
+				 __func__,
+				 ctx->s_frame.crop.width, ctx->s_frame.crop.height,
+				 ctx->d_frame.crop.width, ctx->d_frame.crop.height);
+		}
+	}
+
+	if (h_ratio > sc_down_min || v_ratio > sc_down_min ||
+	    h_ratio < sc_up_max || v_ratio < sc_up_max) {
+		int ret;
+
+		ret = sc_prepare_2nd_scaling(ctx, src_width, src_height,
+					     &h_ratio, &v_ratio);
+		if (ret)
+			return ret;
+	}
+
+	ctx->h_ratio = h_ratio;
+	ctx->v_ratio = v_ratio;
+
+	return 0;
+}
+
+static int sc_vb2_queue_setup(struct vb2_queue *vq,
+			      unsigned int *num_buffers, unsigned int *num_planes,
+			      unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct sc_ctx *ctx = vb2_get_drv_priv(vq);
+	struct sc_frame *frame;
+	int ret;
+	int i;
+
+	frame = ctx_get_frame(ctx, vq->type);
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	/* Get number of planes from format_list in driver */
+	*num_planes = frame->sc_fmt->num_planes;
+	for (i = 0; i < frame->sc_fmt->num_planes; i++) {
+		if (frame->bytesused[i] == 0) {
+			v4l2_err(&ctx->sc_dev->m2m.v4l2_dev, "not supported VIDIOC_REQBUFS before VIDIOC_S_FMT!\n");
+			return -EINVAL;
+		}
+		sizes[i] = frame->bytesused[i];
+		alloc_devs[i] = ctx->sc_dev->dev;
+	}
+
+	ret = sc_find_scaling_ratio(ctx);
+	if (ret)
+		return ret;
+
+	ret = sc_prepare_denoise_filter(ctx);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int sc_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct sc_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct sc_frame *frame;
+	enum dma_data_direction dir;
+	struct dma_buf *dbuf;
+	int i;
+
+	frame = ctx_get_frame(ctx, vb->vb2_queue->type);
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		for (i = 0; i < frame->sc_fmt->num_planes; i++)
+			vb2_set_plane_payload(vb, i, frame->bytesused[i]);
+	}
+
+	if (vb->vb2_queue->memory == VB2_MEMORY_DMABUF) {
+		dir = V4L2_TYPE_IS_OUTPUT(vb->type) ?
+				DMA_TO_DEVICE : DMA_FROM_DEVICE;
+
+		for (i = 0; i < vb->num_planes; i++)
+			dbuf = vb->planes[i].dbuf;
+	}
+	return 0;
+}
+
+static void sc_vb2_buf_finish(struct vb2_buffer *vb)
+{
+	struct vb2_sc_buffer *sc_buf = sc_from_vb2_to_sc_buf(vb);
+	struct dma_fence *fence;
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct dma_buf *dbuf;
+	int i;
+
+	do {
+		fence = sc_buf->in_fence;
+	} while (cmpxchg(&sc_buf->in_fence, fence, NULL) != fence);
+
+	if (fence) {
+		dma_fence_remove_callback(fence, &sc_buf->fence_cb);
+		dma_fence_put(fence);
+	} else if (work_busy(&sc_buf->qbuf_work)) {
+		cancel_work_sync(&sc_buf->qbuf_work);
+	}
+
+	if (sc_buf->out_sync_file)
+		sc_remove_out_fence(sc_buf);
+
+	if (vb->vb2_queue->memory == VB2_MEMORY_DMABUF) {
+		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+			for (i = 0; i < vb->num_planes; i++)
+				dbuf = vb->planes[i].dbuf;
+		}
+	}
+}
+
+static void __sc_vb2_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
+			       struct vb2_v4l2_buffer *v4l2_buf)
+{
+	v4l2_m2m_buf_queue(m2m_ctx, v4l2_buf);
+	v4l2_m2m_try_schedule(m2m_ctx);
+}
+
+static void sc_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct sc_ctx *ctx = NULL;
+	struct vb2_v4l2_buffer *v4l2_buf = NULL;
+	struct vb2_sc_buffer *sc_buf = NULL;
+
+	if (IS_ERR_OR_NULL(vb)) {
+		pr_err("[%s] vb(%p) is wrong\n", __func__, vb);
+		return;
+	}
+
+	ctx = vb2_get_drv_priv(vb->vb2_queue);
+	v4l2_buf = to_vb2_v4l2_buffer(vb);
+	sc_buf = sc_from_vb2_to_sc_buf(vb);
+
+	if (sc_buf->in_fence) {
+		int ret;
+
+		ret = dma_fence_add_callback(sc_buf->in_fence,
+					     &sc_buf->fence_cb, sc_fence_cb);
+		if (ret) {
+			dma_fence_put(sc_buf->in_fence);
+			sc_buf->in_fence = NULL;
+			if (ret != -ENOENT) {
+				dev_err(ctx->sc_dev->dev,
+					"%s: failed to add fence_cb[err:%d]\n",
+					__func__, ret);
+				sc_buf->state = ret;
+			}
+		} else {
+			timer_setup(&sc_buf->fence_timer,
+				    sc_fence_timeout_handler, 0);
+			mod_timer(&sc_buf->fence_timer,
+				  jiffies + msecs_to_jiffies(SC_FENCE_TIMEOUT));
+
+			return;
+		}
+	}
+
+	__sc_vb2_buf_queue(ctx->m2m_ctx, v4l2_buf);
+}
+
+static void sc_vb2_buf_cleanup(struct vb2_buffer *vb)
+{
+}
+
+static void sc_vb2_lock(struct vb2_queue *vq)
+{
+	struct sc_ctx *ctx = vb2_get_drv_priv(vq);
+
+	mutex_lock(&ctx->sc_dev->lock);
+}
+
+static void sc_vb2_unlock(struct vb2_queue *vq)
+{
+	struct sc_ctx *ctx = vb2_get_drv_priv(vq);
+
+	mutex_unlock(&ctx->sc_dev->lock);
+}
+
+static int sc_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct sc_ctx *ctx = vb2_get_drv_priv(vq);
+
+	set_bit(CTX_STREAMING, &ctx->flags);
+	return 0;
+}
+
+static void sc_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct sc_ctx *ctx = vb2_get_drv_priv(vq);
+	int ret;
+
+	ret = sc_ctx_stop_req(ctx);
+	if (ret < 0)
+		dev_err(ctx->sc_dev->dev, "wait timeout\n");
+
+	clear_bit(CTX_STREAMING, &ctx->flags);
+}
+
+static int sc_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_sc_buffer *sc_buf = sc_from_vb2_to_sc_buf(vb);
+
+	INIT_WORK(&sc_buf->qbuf_work, __sc_qbuf_work);
+	return 0;
+}
+
+static const struct vb2_ops sc_vb2_ops = {
+	.queue_setup		= sc_vb2_queue_setup,
+	.buf_init		= sc_vb2_buf_init,
+	.buf_prepare		= sc_vb2_buf_prepare,
+	.buf_finish		= sc_vb2_buf_finish,
+	.buf_queue		= sc_vb2_buf_queue,
+	.buf_cleanup		= sc_vb2_buf_cleanup,
+	.wait_finish		= sc_vb2_lock,
+	.wait_prepare		= sc_vb2_unlock,
+	.start_streaming	= sc_vb2_start_streaming,
+	.stop_streaming		= sc_vb2_stop_streaming,
+};
+
+static int queue_init(void *priv, struct vb2_queue *src_vq,
+		      struct vb2_queue *dst_vq)
+{
+	struct sc_ctx *ctx = priv;
+	int ret;
+
+	if (IS_ERR_OR_NULL(src_vq) || IS_ERR_OR_NULL(dst_vq)) {
+		pr_err("[%s] src_vq(%p) or dst_vq(%p) is wrong\n", __func__, src_vq, dst_vq);
+		return -EINVAL;
+	}
+
+	memset(src_vq, 0, sizeof(*src_vq));
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->ops = &sc_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_sg_memops;
+	src_vq->drv_priv = ctx;
+	src_vq->buf_struct_size = sizeof(struct vb2_sc_buffer);
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	memset(dst_vq, 0, sizeof(*dst_vq));
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->ops = &sc_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	dst_vq->drv_priv = ctx;
+	dst_vq->buf_struct_size = sizeof(struct vb2_sc_buffer);
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static bool sc_configure_rotation_degree(struct sc_ctx *ctx, int degree)
+{
+	ctx->flip_rot_cfg &= ~SCALER_ROT_MASK;
+
+	/*
+	 * we expect that the direction of rotation is clockwise
+	 * but the Scaler does in counter clockwise.
+	 * Since the GScaler doest that in clockwise,
+	 * the following makes the direction of rotation by the Scaler
+	 * clockwise.
+	 */
+	if (degree == 270) {
+		ctx->flip_rot_cfg |= SCALER_ROT_90;
+	} else if (degree == 180) {
+		ctx->flip_rot_cfg |= SCALER_ROT_180;
+	} else if (degree == 90) {
+		ctx->flip_rot_cfg |= SCALER_ROT_270;
+	} else if (degree != 0) {
+		dev_err(ctx->sc_dev->dev,
+			"%s: Rotation of %d is not supported\n",
+			__func__, degree);
+		return false;
+	}
+
+	return true;
+}
+
+static void sc_set_framerate(struct sc_ctx *ctx, int framerate)
+{
+	if (!ctx->sc_dev->qos_table)
+		return;
+
+	if (framerate == 0)
+		ctx->framerate = 0;
+	else
+		ctx->framerate = framerate;
+}
+
+static void sc_set_src_cspan(struct sc_ctx *ctx, int align)
+{
+	if (align < ALIGN_RESERVED)
+		ctx->s_frame.cspanalign = align;
+	else
+		ctx->s_frame.cspanalign = 0;
+}
+
+static void sc_set_dst_cspan(struct sc_ctx *ctx, int align)
+{
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return;
+	}
+
+	if (align < ALIGN_RESERVED)
+		ctx->d_frame.cspanalign = align;
+	else
+		ctx->d_frame.cspanalign = 0;
+}
+
+static void sc_set_src_yspan(struct sc_ctx *ctx, int align)
+{
+	if (align < ALIGN_RESERVED)
+		ctx->s_frame.yspanalign = align;
+	else
+		ctx->s_frame.yspanalign = 0;
+}
+
+static void sc_set_dst_yspan(struct sc_ctx *ctx, int align)
+{
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return;
+	}
+
+	if (align < ALIGN_RESERVED)
+		ctx->d_frame.yspanalign = align;
+	else
+		ctx->d_frame.yspanalign = 0;
+}
+
+static int sc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct sc_ctx *ctx;
+	struct sc_dev *sc;
+	struct v4l2_m2m_dev *m2m_dev;
+	int ret = 0;
+
+	sc_dbg("ctrl ID:%d, value:%d\n", ctrl->id, ctrl->val);
+	ctx = container_of(ctrl->handler, struct sc_ctx, ctrl_handler);
+	sc = ctx->sc_dev;
+
+	switch (ctrl->id) {
+	case V4L2_CID_VFLIP:
+		if (ctrl->val)
+			ctx->flip_rot_cfg |= SCALER_FLIP_X_EN;
+		else
+			ctx->flip_rot_cfg &= ~SCALER_FLIP_X_EN;
+		break;
+	case V4L2_CID_HFLIP:
+		if (ctrl->val)
+			ctx->flip_rot_cfg |= SCALER_FLIP_Y_EN;
+		else
+			ctx->flip_rot_cfg &= ~SCALER_FLIP_Y_EN;
+		break;
+	case V4L2_CID_ROTATE:
+		if (!sc_configure_rotation_degree(ctx, ctrl->val))
+			return -EINVAL;
+		break;
+	case V4L2_CID_GLOBAL_ALPHA:
+		ctx->g_alpha = ctrl->val;
+		break;
+	case V4L2_CID_2D_BLEND_OP:
+		if (!ctx->sc_dev->variant->blending && ctrl->val > 0) {
+			dev_err(ctx->sc_dev->dev,
+				"%s: blending is not supported from v2.2.0\n",
+				__func__);
+			return -EINVAL;
+		}
+		ctx->bl_op = ctrl->val;
+		break;
+	case V4L2_CID_2D_FMT_PREMULTI:
+		ctx->pre_multi = ctrl->val;
+		break;
+	case V4L2_CID_2D_DITH:
+		ctx->dith = ctrl->val;
+		break;
+	case V4L2_CID_CSC_EQ:
+		ctx->csc.csc_eq = ctrl->val;
+		break;
+	case V4L2_CID_CSC_RANGE:
+		ctx->csc.csc_range = ctrl->val;
+		break;
+	case V4L2_CID_CONTENT_PROTECTION:
+		ctx->cp_enabled = !!ctrl->val;
+		break;
+	case SC_CID_DNOISE_FT:
+		ctx->dnoise_ft.strength = ctrl->val;
+		break;
+	case SC_CID_FRAMERATE:
+		sc_set_framerate(ctx, ctrl->val);
+		break;
+	case V4L2_SC_CID_SRC_CSPAN:
+		sc_set_src_cspan(ctx, ctrl->val);
+		break;
+	case V4L2_SC_CID_DST_CSPAN:
+		sc_set_dst_cspan(ctx, ctrl->val);
+		break;
+	case V4L2_SC_CID_SRC_YSPAN:
+		sc_set_src_yspan(ctx, ctrl->val);
+		break;
+	case V4L2_SC_CID_DST_YSPAN:
+		sc_set_dst_yspan(ctx, ctrl->val);
+		break;
+
+	case SC_CID_CTX_PRIORITY_SETTING:
+		if (ctrl->val == SC_CTX_HIGH_PRIO) {
+			m2m_dev = sc->m2m.m2m_dev_hp;
+
+			v4l2_m2m_ctx_release(ctx->m2m_ctx);
+			ctx->m2m_ctx = NULL;
+
+		} else {
+			m2m_dev = sc->m2m.m2m_dev_lp;
+		}
+		if (!ctx->m2m_ctx) {
+			ctx->m2m_ctx = v4l2_m2m_ctx_init(m2m_dev, ctx, queue_init);
+			if (IS_ERR(ctx->m2m_ctx)) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+		ctx->priority = ctrl->val;
+		break;
+	case V4L2_CID_2D_COLOR_FILL:
+		if (!ctx->sc_dev->variant->color_fill) {
+			dev_err(ctx->sc_dev->dev,
+				"%s: color fill is not supported\n",
+				__func__);
+			return -EINVAL;
+		}
+
+		if (ctrl->val >= 0) {
+			sc_dbg("color filled s ctrl called 0x%08x\n", ctrl->val);
+			ctx->color_fill |= ctrl->val;
+			ctx->color_fill_enabled = true;
+		}
+
+		break;
+	case V4L2_CID_2D_ALPHA_FILL:
+		if (!ctx->sc_dev->variant->color_fill) {
+			dev_err(ctx->sc_dev->dev,
+				"%s: alpha color fill is not supported\n",
+				__func__);
+			return -EINVAL;
+		}
+
+		if (ctrl->val >= 0) {
+			sc_dbg("alpha filled s ctrl called 0x%08x\n", ctrl->val);
+			ctx->color_fill |= ctrl->val << SCALER_ALPHA_FILL_SHIFT;
+			ctx->color_fill_enabled = true;
+		}
+
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops sc_ctrl_ops = {
+	.s_ctrl = sc_s_ctrl,
+};
+
+static const struct v4l2_ctrl_config sc_custom_ctrl[] = {
+	{
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_GLOBAL_ALPHA,
+		.name = "Set constant src alpha",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.flags = V4L2_CTRL_FLAG_SLIDER,
+		.step = 1,
+		.min = 0,
+		.max = 255,
+		.def = 255,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_2D_BLEND_OP,
+		.name = "set blend op",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.flags = V4L2_CTRL_FLAG_SLIDER,
+		.step = 1,
+		.min = 0,
+		.max = BL_OP_ADD,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_2D_DITH,
+		.name = "set dithering",
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.flags = V4L2_CTRL_FLAG_SLIDER,
+		.step = 1,
+		.min = false,
+		.max = true,
+		.def = false,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_2D_FMT_PREMULTI,
+		.name = "set pre-multiplied format",
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.flags = V4L2_CTRL_FLAG_SLIDER,
+		.step = 1,
+		.min = false,
+		.max = true,
+		.def = false,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_CSC_EQ,
+		.name = "Set CSC equation",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.flags = V4L2_CTRL_FLAG_SLIDER,
+		.step = 1,
+		.min = V4L2_COLORSPACE_DEFAULT,
+		.max = V4L2_COLORSPACE_BT2020,
+		.def = V4L2_COLORSPACE_DEFAULT,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_CSC_RANGE,
+		.name = "Set CSC range",
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.flags = V4L2_CTRL_FLAG_SLIDER,
+		.step = 1,
+		.min = SC_CSC_NARROW,
+		.max = SC_CSC_WIDE,
+		.def = SC_CSC_NARROW,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_CONTENT_PROTECTION,
+		.name = "Enable contents protection",
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.flags = V4L2_CTRL_FLAG_SLIDER,
+		.step = 1,
+		.min = 0,
+		.max = 1,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = SC_CID_DNOISE_FT,
+		.name = "Enable denoising filter",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = 0,
+		.max = SC_FT_MAX,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = SC_CID_FRAMERATE,
+		.name = "Frame rate setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = 0,
+		.max = SC_FRAMERATE_MAX,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_SC_CID_SRC_CSPAN,
+		.name = "C span align setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = ALIGN_DEFAULT,
+		.max = ALIGN_256BYTES,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_SC_CID_DST_CSPAN,
+		.name = "C span align setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = ALIGN_DEFAULT,
+		.max = ALIGN_256BYTES,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_SC_CID_SRC_YSPAN,
+		.name = "y span align setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = ALIGN_DEFAULT,
+		.max = ALIGN_256BYTES,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_SC_CID_DST_YSPAN,
+		.name = "Y span align setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = ALIGN_DEFAULT,
+		.max = ALIGN_256BYTES,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = SC_CID_CTX_PRIORITY_SETTING,
+		.name = "context priority setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = SC_CTX_DEFAULT_PRIO,
+		.max = SC_CTX_HIGH_PRIO,
+		.def = 0,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_2D_COLOR_FILL,
+		.name = "color fill setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = -1,
+		.max = INT_MAX,
+		.def = -1,
+	}, {
+		.ops = &sc_ctrl_ops,
+		.id = V4L2_CID_2D_ALPHA_FILL,
+		.name = "alpha fill setting",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.step = 1,
+		.min = -1,
+		.max = INT_MAX,
+		.def = -1,
+	}
+};
+
+static int sc_add_ctrls(struct sc_ctx *ctx)
+{
+	unsigned long i;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_handler, SC_MAX_CTRL_NUM);
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &sc_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &sc_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &sc_ctrl_ops,
+			  V4L2_CID_ROTATE, 0, 270, 90, 0);
+
+	for (i = 0; i < ARRAY_SIZE(sc_custom_ctrl); i++)
+		v4l2_ctrl_new_custom(&ctx->ctrl_handler,
+				     &sc_custom_ctrl[i], NULL);
+	if (ctx->ctrl_handler.error) {
+		int err = ctx->ctrl_handler.error;
+
+		v4l2_err(&ctx->sc_dev->m2m.v4l2_dev,
+			 "v4l2_ctrl_handler_init failed %d\n", err);
+		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+		return err;
+	}
+
+	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
+
+	return 0;
+}
+
+static int sc_power_clk_enable(struct sc_dev *sc)
+{
+	int ret;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return -EINVAL;
+	}
+
+	if (in_interrupt())
+		ret = pm_runtime_get(sc->dev);
+	else
+		ret = pm_runtime_get_sync(sc->dev);
+
+	if (ret < 0) {
+		dev_err(sc->dev,
+			"%s=%d: Failed to enable local power\n", __func__, ret);
+		return ret;
+	}
+
+	if (!IS_ERR(sc->pclk)) {
+		ret = clk_enable(sc->pclk);
+		if (ret) {
+			dev_err(sc->dev, "%s: Failed to enable PCLK (err %d)\n",
+				__func__, ret);
+			goto err_pclk;
+		}
+	}
+
+	if (!IS_ERR(sc->aclk)) {
+		ret = clk_enable(sc->aclk);
+		if (ret) {
+			dev_err(sc->dev, "%s: Failed to enable ACLK (err %d)\n",
+				__func__, ret);
+			goto err_aclk;
+		}
+	}
+
+	return 0;
+err_aclk:
+	if (!IS_ERR(sc->pclk))
+		clk_disable(sc->pclk);
+err_pclk:
+	pm_runtime_put(sc->dev);
+	return ret;
+}
+
+static void sc_clk_power_disable(struct sc_dev *sc)
+{
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	sc_clear_aux_power_cfg(sc);
+
+	if (!IS_ERR(sc->aclk))
+		clk_disable(sc->aclk);
+
+	if (!IS_ERR(sc->pclk))
+		clk_disable(sc->pclk);
+
+	pm_runtime_put(sc->dev);
+}
+
+static int sc_open(struct file *file)
+{
+	struct sc_dev *sc = video_drvdata(file);
+	struct sc_ctx *ctx;
+	int ret;
+
+	if (atomic_read(&sc->m2m.in_use) == SC_MAX_CTX_NUM) {
+		dev_err(sc->dev, "scaler device is out of contexts\n");
+		return -EBUSY;
+	}
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+
+	if (!ctx)
+		return -ENOMEM;
+
+	atomic_inc(&sc->m2m.in_use);
+	ctx->context_type = SC_CTX_V4L2_TYPE;
+	INIT_LIST_HEAD(&ctx->node);
+	ctx->sc_dev = sc;
+
+	/*
+	 * The device context for mem2mem will setup in s_ctrl
+	 */
+	ctx->m2m_ctx = NULL;
+
+	v4l2_fh_init(&ctx->fh, sc->m2m.vfd);
+	ret = sc_add_ctrls(ctx);
+	if (ret)
+		goto err_fh;
+
+	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
+	file->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh);
+
+	/* Default color format */
+	ctx->s_frame.sc_fmt = &sc_formats[0];
+	ctx->d_frame.sc_fmt = &sc_formats[0];
+
+	if (!IS_ERR(sc->pclk)) {
+		ret = clk_prepare(sc->pclk);
+		if (ret) {
+			dev_err(sc->dev, "%s: failed to prepare PCLK(err %d)\n",
+				__func__, ret);
+			goto err_pclk_prepare;
+		}
+	}
+
+	if (!IS_ERR(sc->aclk)) {
+		ret = clk_prepare(sc->aclk);
+		if (ret) {
+			dev_err(sc->dev, "%s: failed to prepare ACLK(err %d)\n",
+				__func__, ret);
+			goto err_aclk_prepare;
+		}
+	}
+
+	ctx->pm_qos_lv = -1;
+
+	return 0;
+
+err_aclk_prepare:
+	if (!IS_ERR(sc->pclk))
+		clk_unprepare(sc->pclk);
+err_pclk_prepare:
+	v4l2_fh_del(&ctx->fh);
+err_fh:
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_exit(&ctx->fh);
+	atomic_dec(&sc->m2m.in_use);
+	kfree(ctx);
+
+	return ret;
+}
+
+static int sc_release(struct file *file)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(file->private_data);
+	struct sc_dev *sc = ctx->sc_dev;
+
+	sc_dbg("refcnt= %d", atomic_read(&sc->m2m.in_use));
+
+	atomic_dec(&sc->m2m.in_use);
+
+	v4l2_m2m_ctx_release(ctx->m2m_ctx);
+
+	if (ctx->framerate)
+		ctx->framerate = 0;
+
+	if (!IS_ERR(sc->aclk))
+		clk_unprepare(sc->aclk);
+	if (!IS_ERR(sc->pclk))
+		clk_unprepare(sc->pclk);
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+
+	return 0;
+}
+
+static unsigned int sc_poll(struct file *file,
+			    struct poll_table_struct *wait)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(file->private_data);
+
+	return v4l2_m2m_poll(file, ctx->m2m_ctx, wait);
+}
+
+static int sc_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct sc_ctx *ctx = fh_to_sc_ctx(file->private_data);
+
+	return v4l2_m2m_mmap(file, ctx->m2m_ctx, vma);
+}
+
+static const struct v4l2_file_operations sc_v4l2_fops = {
+	.owner		= THIS_MODULE,
+	.open		= sc_open,
+	.release	= sc_release,
+	.poll		= sc_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= sc_mmap,
+};
+
+static void sc_buffer_done(struct vb2_v4l2_buffer *vb,
+			   enum vb2_buffer_state state)
+{
+	struct vb2_sc_buffer *sc_buf;
+
+	v4l2_m2m_buf_done(vb, state);
+
+	sc_buf = sc_from_vb2_to_sc_buf(&vb->vb2_buf);
+
+	if (sc_buf->out_sync_file) {
+		if (state == VB2_BUF_STATE_ERROR)
+			dma_fence_set_error(sc_buf->out_sync_file->fence,
+					    -EFAULT);
+		dma_fence_signal(sc_buf->out_sync_file->fence);
+	}
+}
+
+static void sc_job_finish(struct sc_dev *sc, struct sc_ctx *ctx)
+{
+	unsigned long flags;
+	struct vb2_v4l2_buffer *src_vb, *dst_vb;
+	struct v4l2_m2m_dev *m2m_dev;
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return;
+	}
+
+	m2m_dev = sc_get_m2m_dev(ctx);
+
+	spin_lock_irqsave(&sc->slock, flags);
+
+	if (ctx->context_type == SC_CTX_V4L2_TYPE) {
+		ctx = v4l2_m2m_get_curr_priv(m2m_dev);
+		if (!ctx || !ctx->m2m_ctx) {
+			dev_err(sc->dev, "current ctx is NULL\n");
+			spin_unlock_irqrestore(&sc->slock, flags);
+			return;
+		}
+		clear_bit(CTX_RUN, &ctx->flags);
+
+		src_vb = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		dst_vb = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+
+		sc_buffer_done(src_vb, VB2_BUF_STATE_ERROR);
+		sc_buffer_done(dst_vb, VB2_BUF_STATE_ERROR);
+
+		v4l2_m2m_job_finish(m2m_dev, ctx->m2m_ctx);
+	}
+
+	spin_unlock_irqrestore(&sc->slock, flags);
+}
+
+static void sc_watchdog(struct timer_list *t)
+{
+	struct sc_dev *sc = NULL;
+	struct sc_ctx *ctx;
+	unsigned long flags;
+
+	if (IS_ERR_OR_NULL(t)) {
+		pr_err("[%s] t(%p) is wrong\n", __func__, t);
+		return;
+	}
+
+	sc_dbg("timeout watchdog\n");
+	if (atomic_read(&sc->wdt.cnt) >= SC_WDT_CNT) {
+		sc_hwset_soft_reset(sc);
+
+		atomic_set(&sc->wdt.cnt, 0);
+		clear_bit(DEV_RUN, &sc->state);
+
+		spin_lock_irqsave(&sc->ctxlist_lock, flags);
+		ctx = sc->current_ctx;
+		sc->current_ctx = NULL;
+		spin_unlock_irqrestore(&sc->ctxlist_lock, flags);
+
+		sc_job_finish(sc, ctx);
+		sc_clk_power_disable(sc);
+		return;
+	}
+
+	if (test_bit(DEV_RUN, &sc->state)) {
+		atomic_inc(&sc->wdt.cnt);
+		dev_err(sc->dev, "scaler is still running\n");
+		mod_timer(&sc->wdt.timer, jiffies + SC_TIMEOUT);
+	} else {
+		sc_dbg("scaler finished job\n");
+	}
+}
+
+static void sc_set_csc_coef(struct sc_ctx *ctx)
+{
+	struct sc_frame *s_frame, *d_frame;
+	struct sc_dev *sc;
+	enum sc_csc_idx idx;
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return;
+	}
+
+	sc = ctx->sc_dev;
+	s_frame = &ctx->s_frame;
+	d_frame = &ctx->d_frame;
+
+	if (s_frame->sc_fmt->is_rgb == d_frame->sc_fmt->is_rgb)
+		idx = NO_CSC;
+	else if (s_frame->sc_fmt->is_rgb)
+		idx = CSC_R2Y;
+	else
+		idx = CSC_Y2R;
+
+	sc_hwset_csc_coef(sc, idx, &ctx->csc);
+}
+
+static bool sc_process_2nd_stage(struct sc_dev *sc, struct sc_ctx *ctx)
+{
+	struct sc_frame *s_frame, *d_frame;
+	const struct sc_size_limit *limit;
+	unsigned int halign = 0, walign = 0;
+	unsigned int pre_h_ratio = 0;
+	unsigned int pre_v_ratio = 0;
+	unsigned int h_ratio = SCALE_RATIO(1, 1);
+	unsigned int v_ratio = SCALE_RATIO(1, 1);
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return false;
+	}
+
+	if (!test_bit(CTX_INT_FRAME, &ctx->flags))
+		return false;
+
+	s_frame = &ctx->i_frame->frame;
+	d_frame = &ctx->d_frame;
+
+	s_frame->addr.ioaddr[SC_PLANE_Y] = ctx->i_frame->src_addr.ioaddr[SC_PLANE_Y];
+	s_frame->addr.ioaddr[SC_PLANE_CB] = ctx->i_frame->src_addr.ioaddr[SC_PLANE_CB];
+	s_frame->addr.ioaddr[SC_PLANE_CR] = ctx->i_frame->src_addr.ioaddr[SC_PLANE_CR];
+
+	walign = d_frame->sc_fmt->h_shift;
+	halign = d_frame->sc_fmt->v_shift;
+
+	limit = &sc->variant->limit_input;
+	v4l_bound_align_image(&s_frame->crop.width, limit->min_w, limit->max_w,
+			      walign, &s_frame->crop.height, limit->min_h,
+			      limit->max_h, halign, 0);
+
+	sc_hwset_src_image_format(sc, s_frame);
+	sc_hwset_dst_image_format(sc, d_frame);
+	sc_hwset_src_imgsize(sc, s_frame);
+	sc_hwset_dst_imgsize(sc, d_frame);
+
+	if (ctx->flip_rot_cfg & SCALER_ROT_90 &&
+	    ctx->dnoise_ft.strength > SC_FT_BLUR) {
+		h_ratio = SCALE_RATIO(s_frame->crop.height, d_frame->crop.width);
+		v_ratio = SCALE_RATIO(s_frame->crop.width, d_frame->crop.height);
+	} else {
+		h_ratio = SCALE_RATIO(s_frame->crop.width, d_frame->crop.width);
+		v_ratio = SCALE_RATIO(s_frame->crop.height, d_frame->crop.height);
+	}
+
+	pre_h_ratio = 0;
+	pre_v_ratio = 0;
+
+	if (!sc->variant->ratio_20bit) {
+		/* No prescaler, 1/4 precision */
+		h_ratio >>= 4;
+		v_ratio >>= 4;
+	}
+
+	sc_hwset_hratio(sc, h_ratio, pre_h_ratio);
+	sc_hwset_vratio(sc, v_ratio, pre_v_ratio);
+
+	sc_hwset_polyphase_hcoef(sc, h_ratio, h_ratio, 0);
+	sc_hwset_polyphase_vcoef(sc, v_ratio, v_ratio, 0);
+
+	sc_hwset_src_pos(sc, s_frame->crop.left, s_frame->crop.top,
+			 s_frame->sc_fmt->h_shift, s_frame->sc_fmt->v_shift);
+	sc_hwset_src_wh(sc, s_frame->crop.width, s_frame->crop.height,
+			pre_h_ratio, pre_v_ratio,
+			s_frame->sc_fmt->h_shift, s_frame->sc_fmt->v_shift);
+
+	sc_hwset_dst_pos(sc, d_frame->crop.left, d_frame->crop.top);
+	sc_hwset_dst_wh(sc, d_frame->crop.width, d_frame->crop.height);
+
+	sc_hwset_src_addr(sc, s_frame);
+	sc_hwset_dst_addr(sc, d_frame);
+
+	if (ctx->flip_rot_cfg & SCALER_ROT_MASK &&
+	    ctx->dnoise_ft.strength > SC_FT_BLUR)
+		sc_hwset_flip_rotation(sc, ctx->flip_rot_cfg);
+	else
+		sc_hwset_flip_rotation(sc, 0);
+
+	sc_hwset_start(sc);
+	clear_bit(CTX_INT_FRAME, &ctx->flags);
+
+	return true;
+}
+
+static void sc_set_dithering(struct sc_ctx *ctx)
+{
+	struct sc_dev *sc = NULL;
+	unsigned int val = 0;
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return;
+	}
+
+	sc = ctx->sc_dev;
+
+	if (ctx->dith)
+		val = sc_dith_val(1, 1, 1);
+
+	sc_dbg("dither value is 0x%x\n", val);
+	sc_hwset_dith(sc, val);
+}
+
+static void sc_set_initial_phase(struct sc_ctx *ctx)
+{
+	struct sc_dev *sc = NULL;
+
+	if (IS_ERR_OR_NULL(ctx)) {
+		pr_err("[%s] ctx(%p) is wrong\n", __func__, ctx);
+		return;
+	}
+
+	sc = ctx->sc_dev;
+
+	/* TODO: need to check scaling, csc, rot according to H/W Goude  */
+	sc_hwset_src_init_phase(sc, &ctx->init_phase);
+}
+
+static int ctx_empty(struct sc_dev *sc)
+{
+	return (list_empty(&sc->ctx_list_high_prio) &&
+		list_empty(&sc->ctx_list_low_prio));
+}
+
+static void sc_hwset_ratio_polyphase_pos(struct sc_ctx *ctx, struct sc_dev *sc)
+{
+	struct sc_frame *d_frame, *s_frame;
+	unsigned int pre_h_ratio = 0;
+	unsigned int pre_v_ratio = 0;
+	unsigned int h_ratio = SCALE_RATIO(1, 1);
+	unsigned int v_ratio = SCALE_RATIO(1, 1);
+	unsigned int ch_ratio = SCALE_RATIO(1, 1);
+	unsigned int cv_ratio = SCALE_RATIO(1, 1);
+	unsigned int h_shift, v_shift;
+
+	s_frame = &ctx->s_frame;
+	d_frame = &ctx->d_frame;
+
+	if (ctx->i_frame)
+		d_frame = &ctx->i_frame->frame;
+
+	h_ratio = ctx->h_ratio;
+	v_ratio = ctx->v_ratio;
+	pre_h_ratio = ctx->pre_h_ratio;
+	pre_v_ratio = ctx->pre_v_ratio;
+
+	if (!sc->variant->ratio_20bit) {
+		/* No prescaler, 1/4 precision */
+		h_ratio >>= 4;
+		v_ratio >>= 4;
+	}
+
+	h_shift = s_frame->sc_fmt->h_shift;
+	v_shift = s_frame->sc_fmt->v_shift;
+
+	if (!!(ctx->flip_rot_cfg & SCALER_ROT_90)) {
+		swap(pre_h_ratio, pre_v_ratio);
+		swap(h_shift, v_shift);
+	}
+
+	if (h_shift < d_frame->sc_fmt->h_shift)
+		ch_ratio = h_ratio * 2; /* chroma scaling down */
+	else if (h_shift > d_frame->sc_fmt->h_shift)
+		ch_ratio = h_ratio / 2; /* chroma scaling up */
+	else
+		ch_ratio = h_ratio;
+
+	if (v_shift < d_frame->sc_fmt->v_shift)
+		cv_ratio = v_ratio * 2; /* chroma scaling down */
+	else if (v_shift > d_frame->sc_fmt->v_shift)
+		cv_ratio = v_ratio / 2; /* chroma scaling up */
+	else
+		cv_ratio = v_ratio;
+
+	sc_hwset_hratio(sc, h_ratio, pre_h_ratio);
+	sc_hwset_vratio(sc, v_ratio, pre_v_ratio);
+
+	sc_hwset_polyphase_hcoef(sc, h_ratio, ch_ratio,
+				 ctx->dnoise_ft.strength);
+	sc_hwset_polyphase_vcoef(sc, v_ratio, cv_ratio,
+				 ctx->dnoise_ft.strength);
+
+	sc_hwset_src_pos(sc, s_frame->crop.left, s_frame->crop.top,
+			 s_frame->sc_fmt->h_shift, s_frame->sc_fmt->v_shift);
+	sc_hwset_src_wh(sc, s_frame->crop.width, s_frame->crop.height,
+			pre_h_ratio, pre_v_ratio,
+			s_frame->sc_fmt->h_shift, s_frame->sc_fmt->v_shift);
+
+	sc_hwset_dst_pos(sc, d_frame->crop.left, d_frame->crop.top);
+	sc_hwset_dst_wh(sc, d_frame->crop.width, d_frame->crop.height);
+}
+
+static void sc_hwset_operation(struct sc_ctx *ctx, struct sc_dev *sc)
+{
+	unsigned int cfg = 0;
+
+	sc_set_dithering(ctx);
+
+	if (ctx->bl_op)
+		sc_hwset_blend(sc, ctx->bl_op, ctx->pre_multi, ctx->g_alpha);
+
+	if (ctx->dnoise_ft.strength > SC_FT_BLUR)
+		sc_hwset_flip_rotation(sc, 0);
+	else
+		sc_hwset_flip_rotation(sc, ctx->flip_rot_cfg);
+
+	if (ctx->color_fill_enabled) {
+		sc_hwset_color_fill(sc, ctx->color_fill);
+	} else {
+		cfg = readl(sc->regs + SCALER_CFG);
+		cfg &= ~(SCALER_CFG_FILL_EN);
+		writel(cfg, sc->regs + SCALER_CFG);
+	}
+}
+
+static void sc_hwset_image(struct sc_ctx *ctx, struct sc_dev *sc)
+{
+	struct sc_frame *d_frame, *s_frame;
+
+	s_frame = &ctx->s_frame;
+	d_frame = &ctx->d_frame;
+
+	if (ctx->i_frame) {
+		set_bit(CTX_INT_FRAME, &ctx->flags);
+		d_frame = &ctx->i_frame->frame;
+	}
+
+	sc_hwset_src_image_format(sc, s_frame);
+	sc_hwset_dst_image_format(sc, d_frame);
+
+	sc_hwset_pre_multi_format(sc, s_frame->pre_multi, d_frame->pre_multi);
+
+	sc_hwset_src_imgsize(sc, s_frame);
+	sc_hwset_dst_imgsize(sc, d_frame);
+
+	sc_set_csc_coef(ctx);
+
+	sc_hwset_ratio_polyphase_pos(ctx, sc);
+
+	if (sc->variant->initphase)
+		sc_set_initial_phase(ctx);
+
+	sc_hwset_src_addr(sc, s_frame);
+	sc_hwset_dst_addr(sc, d_frame);
+}
+
+static void sc_hwset(struct sc_ctx *ctx, struct sc_dev *sc)
+{
+	sc_hwset_clk_request(sc, true);
+	sc_hwset_image(ctx, sc);
+	sc_hwset_operation(ctx, sc);
+	sc_hwset_int_en(sc);
+}
+
+static int sc_run_next_job(struct sc_dev *sc)
+{
+	struct sc_ctx *ctx;
+	int ret;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return -EINVAL;
+	}
+
+	ret = sc_power_clk_enable(sc);
+	if (ret) {
+		/*
+		 * Failed to enable the power and the clock. Let's push the task
+		 * again for the later retry.
+		 */
+		clear_bit(DEV_RUN, &sc->state);
+
+		/*
+		 * V4L2 mem2mem assumes that the tasks in device_run() are
+		 * always succeed in processing in H/W while m2m1shot accepts
+		 * failure in device_run(). m2m1shot2 returns failure to the
+		 * users if devce_run() fails. To prevent returning failure to
+		 * users and losing a task to run, we should assume that
+		 * processing a task always succeeds.
+		 */
+		return 0;
+	}
+
+	sc_hwset(ctx, sc);
+	sc_hwset_start(sc);
+
+	return 0;
+}
+
+static irqreturn_t sc_irq_handler(int irq, void *priv)
+{
+	struct sc_dev *sc = priv;
+	struct sc_ctx *ctx;
+	struct vb2_v4l2_buffer *src_vb, *dst_vb;
+	struct v4l2_m2m_dev *m2m_dev;
+	u32 irq_status;
+
+	spin_lock(&sc->slock);
+
+	ctx = sc->current_ctx;
+	if (!ctx) {
+		if (ctx_empty(sc)) {
+			irq_status = sc_hwget_and_clear_irq_status(sc);
+			spin_unlock(&sc->slock);
+			return IRQ_HANDLED;
+		}
+	}
+
+	m2m_dev = sc_get_m2m_dev(ctx);
+
+	irq_status = sc_hwget_and_clear_irq_status(sc);
+
+	if (SCALER_INT_OK(irq_status) && sc_process_2nd_stage(sc, ctx))
+		goto isr_unlock;
+
+	if (!SCALER_INT_OK(irq_status))
+		sc_hwset_soft_reset(sc);
+
+	sc_hwset_clk_request(sc, false);
+
+	clear_bit(DEV_RUN, &sc->state);
+	clear_bit(CTX_RUN, &ctx->flags);
+
+	if (ctx->context_type == SC_CTX_V4L2_TYPE) {
+		src_vb = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		dst_vb = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+
+		sc_buffer_done(src_vb,
+			       SCALER_INT_OK(irq_status) ? VB2_BUF_STATE_DONE
+							 : VB2_BUF_STATE_ERROR);
+		sc_buffer_done(dst_vb,
+			       SCALER_INT_OK(irq_status) ? VB2_BUF_STATE_DONE
+							 : VB2_BUF_STATE_ERROR);
+
+		v4l2_m2m_job_finish(m2m_dev, ctx->m2m_ctx);
+
+		/* Wake up from CTX_ABORT state */
+		clear_bit(CTX_ABORT, &ctx->flags);
+	}
+
+	spin_lock(&sc->ctxlist_lock);
+	sc->current_ctx = NULL;
+	spin_unlock(&sc->ctxlist_lock);
+
+	wake_up(&sc->wait);
+
+	sc_run_next_job(sc);
+
+	sc_clk_power_disable(sc);
+isr_unlock:
+	spin_unlock(&sc->slock);
+
+	return IRQ_HANDLED;
+}
+
+static dma_addr_t sc_get_vb2_dma_addr(struct vb2_buffer *vb2buf, int plane_no)
+{
+	struct sg_table *sgt;
+
+	sgt = vb2_dma_sg_plane_desc(vb2buf, plane_no);
+	if (!sgt)
+		return -ENOMEM;
+
+	return sg_dma_address(sgt->sgl);
+}
+
+static int sc_get_bufaddr(struct sc_dev *sc, struct vb2_buffer *vb2buf,
+			  struct sc_frame *frame)
+{
+	unsigned int pixsize, bytesize;
+
+	pixsize = frame->width * frame->height;
+	bytesize = (pixsize * frame->sc_fmt->bitperpixel[0]) >> 3;
+
+	frame->addr.ioaddr[SC_PLANE_Y] = sc_get_vb2_dma_addr(vb2buf, 0);
+	frame->addr.ioaddr[SC_PLANE_CB] = 0;
+	frame->addr.ioaddr[SC_PLANE_CR] = 0;
+
+	switch (frame->sc_fmt->num_comp) {
+	case 1: /* rgb, yuyv */
+		frame->addr.size[SC_PLANE_Y] = bytesize;
+		frame->addr.size[SC_PLANE_CB] = 0;
+		frame->addr.size[SC_PLANE_CR] = 0;
+		break;
+	case 2:
+		frame->addr.size[SC_PLANE_CB] = 0;
+		frame->addr.size[SC_PLANE_CR] = 0;
+		if (frame->sc_fmt->num_planes == 1) {
+			if (frame->sc_fmt->pixelformat == V4L2_PIX_FMT_NV12N) {
+				unsigned int w = frame->width;
+				unsigned int h = frame->height;
+
+				frame->addr.ioaddr[SC_PLANE_CB] =
+					NV12N_CBCR_BASE(frame->addr.ioaddr[SC_PLANE_Y], w, h);
+				frame->addr.size[SC_PLANE_Y] = NV12N_Y_SIZE(w, h);
+				frame->addr.size[SC_PLANE_CB] = NV12N_CBCR_SIZE(w, h);
+			} else if (frame->sc_fmt->pixelformat == V4L2_PIX_FMT_NV12N_10B) {
+				unsigned int w = frame->width;
+				unsigned int h = frame->height;
+
+				frame->addr.ioaddr[SC_PLANE_CB] =
+					NV12N_10B_CBCR_BASE(frame->addr.ioaddr[SC_PLANE_Y], w, h);
+				frame->addr.size[SC_PLANE_Y] = NV12N_Y_SIZE(w, h);
+				frame->addr.size[SC_PLANE_CB] = NV12N_CBCR_SIZE(w, h);
+			} else {
+				if (frame->sc_fmt->pixelformat == V4L2_PIX_FMT_NV12_P010)
+					pixsize *= 2;
+				frame->addr.ioaddr[SC_PLANE_CB] =
+					frame->addr.ioaddr[SC_PLANE_Y] + pixsize;
+				frame->addr.size[SC_PLANE_Y] = pixsize;
+				frame->addr.size[SC_PLANE_CB] = bytesize - pixsize;
+			}
+		} else if (frame->sc_fmt->num_planes == 2) {
+			frame->addr.ioaddr[SC_PLANE_CB] = sc_get_vb2_dma_addr(vb2buf, 1);
+			sc_calc_planesize(frame, pixsize);
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (frame->sc_fmt->pixelformat == V4L2_PIX_FMT_YVU420 ||
+	    frame->sc_fmt->pixelformat == V4L2_PIX_FMT_YVU420M) {
+		u32 t_cb = frame->addr.ioaddr[SC_PLANE_CB];
+
+		frame->addr.ioaddr[SC_PLANE_CB] = frame->addr.ioaddr[SC_PLANE_CR];
+		frame->addr.ioaddr[SC_PLANE_CR] = t_cb;
+	}
+
+	sc_dbg("y addr %pa y size %#x\n", &frame->addr.ioaddr[SC_PLANE_Y],
+	       frame->addr.size[SC_PLANE_Y]);
+	sc_dbg("cb addr %pa cb size %#x\n", &frame->addr.ioaddr[SC_PLANE_CB],
+	       frame->addr.size[SC_PLANE_CB]);
+	sc_dbg("cr addr %pa cr size %#x\n", &frame->addr.ioaddr[SC_PLANE_CR],
+	       frame->addr.size[SC_PLANE_CR]);
+
+	return 0;
+}
+
+static void sc_m2m_device_run(void *priv)
+{
+	struct sc_ctx *ctx = priv;
+	struct sc_dev *sc = ctx->sc_dev;
+	struct sc_frame *s_frame, *d_frame;
+	struct vb2_buffer *src_vb, *dst_vb;
+	struct vb2_v4l2_buffer *src_vb_v4l2, *dst_vb_v4l2;
+	struct vb2_sc_buffer *src_sc_buf, *dst_sc_buf;
+	struct v4l2_m2m_dev *m2m_dev;
+
+	s_frame = &ctx->s_frame;
+	d_frame = &ctx->d_frame;
+
+	m2m_dev = sc_get_m2m_dev(ctx);
+
+	src_vb = (struct vb2_buffer *)v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	dst_vb = (struct vb2_buffer *)v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+
+	src_sc_buf = sc_from_vb2_to_sc_buf(src_vb);
+	dst_sc_buf = sc_from_vb2_to_sc_buf(dst_vb);
+
+	if (src_sc_buf->state || dst_sc_buf->state) {
+		src_vb_v4l2 = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		dst_vb_v4l2 = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+
+		sc_buffer_done(src_vb_v4l2, VB2_BUF_STATE_ERROR);
+		sc_buffer_done(dst_vb_v4l2, VB2_BUF_STATE_ERROR);
+
+		v4l2_m2m_job_finish(m2m_dev, ctx->m2m_ctx);
+		return;
+	}
+
+	sc_get_bufaddr(sc, src_vb, s_frame);
+	sc_get_bufaddr(sc, dst_vb, d_frame);
+}
+
+static void sc_m2m_job_abort(void *priv)
+{
+	struct sc_ctx *ctx = priv;
+	int ret;
+
+	ret = sc_ctx_stop_req(ctx);
+	if (ret < 0)
+		dev_err(ctx->sc_dev->dev, "wait timeout\n");
+}
+
+static struct v4l2_m2m_ops sc_m2m_ops = {
+	.device_run	= sc_m2m_device_run,
+	.job_abort	= sc_m2m_job_abort,
+};
+
+static void sc_unregister_m2m_device(struct sc_dev *sc)
+{
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	v4l2_m2m_release(sc->m2m.m2m_dev_hp);
+	v4l2_m2m_release(sc->m2m.m2m_dev_lp);
+	video_unregister_device(sc->m2m.vfd);
+	v4l2_device_unregister(&sc->m2m.v4l2_dev);
+}
+
+static int sc_register_m2m_device(struct sc_dev *sc, int dev_id)
+{
+	struct v4l2_device *v4l2_dev;
+	struct device *dev;
+	struct video_device *vfd;
+	int ret = 0;
+
+	dev = sc->dev;
+	v4l2_dev = &sc->m2m.v4l2_dev;
+
+	scnprintf(v4l2_dev->name, sizeof(v4l2_dev->name), "%s.m2m",
+		  MODULE_NAME);
+
+	ret = v4l2_device_register(dev, v4l2_dev);
+	if (ret) {
+		dev_err(sc->dev, "failed to register v4l2 device\n");
+		return ret;
+	}
+
+	vfd = video_device_alloc();
+	if (!vfd) {
+		dev_err(sc->dev, "failed to allocate video device\n");
+		goto err_v4l2_dev;
+	}
+
+	vfd->fops	= &sc_v4l2_fops;
+	vfd->ioctl_ops	= &sc_v4l2_ioctl_ops;
+	vfd->release	= video_device_release;
+	vfd->lock	= &sc->lock;
+	vfd->vfl_dir	= VFL_DIR_M2M;
+	vfd->v4l2_dev	= v4l2_dev;
+	vfd->device_caps =  V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING |
+				V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+				V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+	scnprintf(vfd->name, sizeof(vfd->name), "%s:m2m", MODULE_NAME);
+
+	video_set_drvdata(vfd, sc);
+
+	sc->m2m.vfd = vfd;
+	sc->m2m.m2m_dev_lp = v4l2_m2m_init(&sc_m2m_ops);
+	if (IS_ERR(sc->m2m.m2m_dev_lp)) {
+		dev_err(sc->dev, "failed to initialize v4l2-m2m low priority device\n");
+		ret = PTR_ERR(sc->m2m.m2m_dev_lp);
+		goto err_lp_dev_alloc;
+	}
+
+	sc->m2m.m2m_dev_hp = v4l2_m2m_init(&sc_m2m_ops);
+	if (IS_ERR(sc->m2m.m2m_dev_hp)) {
+		dev_err(sc->dev, "failed to initialize v4l2-m2m low priority device\n");
+		ret = PTR_ERR(sc->m2m.m2m_dev_hp);
+		goto err_hp_dev_alloc;
+	}
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 50 + dev_id);
+	if (ret) {
+		dev_err(sc->dev, "failed to register video device (video%d)\n",
+			50 + dev_id);
+		goto err_m2m_dev;
+	}
+
+	return 0;
+
+err_m2m_dev:
+	v4l2_m2m_release(sc->m2m.m2m_dev_hp);
+err_hp_dev_alloc:
+	v4l2_m2m_release(sc->m2m.m2m_dev_lp);
+err_lp_dev_alloc:
+	video_device_release(sc->m2m.vfd);
+err_v4l2_dev:
+	v4l2_device_unregister(v4l2_dev);
+
+	return ret;
+}
+
+#ifdef CONFIG_PM_SLEEP
+
+static int sc_suspend(struct device *dev)
+{
+	struct sc_dev *sc = dev_get_drvdata(dev);
+	int ret;
+
+	set_bit(DEV_SUSPEND, &sc->state);
+
+	ret = wait_event_timeout(sc->wait,
+				 !test_bit(DEV_RUN, &sc->state), SC_TIMEOUT);
+	if (ret == 0)
+		dev_err(sc->dev, "wait timeout\n");
+
+	return 0;
+}
+
+static int sc_resume(struct device *dev)
+{
+	struct sc_dev *sc = dev_get_drvdata(dev);
+
+	clear_bit(DEV_SUSPEND, &sc->state);
+
+	if (sc->version >= SCALER_VERSION(7, 0, 1) && !IS_ERR(sc->sysreg))
+		writel(SCALER_LLC_NO_HINT, sc->sysreg + sc->sysreg_offset);
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_PM
+
+static int sc_runtime_resume(struct device *dev)
+{
+	struct sc_dev *sc = dev_get_drvdata(dev);
+
+	if (!IS_ERR(sc->clk_chld) && !IS_ERR(sc->clk_parn)) {
+		int ret = clk_set_parent(sc->clk_chld, sc->clk_parn);
+
+		if (ret) {
+			dev_err(sc->dev, "%s: Failed to setup MUX: %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int sc_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops sc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(sc_suspend, sc_resume)
+	SET_RUNTIME_PM_OPS(NULL, sc_runtime_resume, sc_runtime_suspend)
+};
+
+static int sc_compare_qos_table_entries(const void *p1, const void *p2)
+{
+	const struct sc_qos_table *t1 = NULL;
+	const struct sc_qos_table *t2 = NULL;
+
+	if (IS_ERR_OR_NULL(p1) || IS_ERR_OR_NULL(p2)) {
+		pr_err("[%s] p1(%p) or p2(%p) is wrong\n", __func__, p1, p2);
+		return -1;
+	}
+
+	t1 = p1;
+	t2 = p2;
+
+	if (t1->freq_int < t2->freq_int)
+		return 1;
+	else
+		return -1;
+}
+
+static int sc_populate_dt(struct sc_dev *sc)
+{
+	struct device *dev = NULL;
+	struct sc_qos_table *qos_table;
+	struct sc_ppc_table *ppc_table;
+	int i, len;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return -ENOMEM;
+	}
+
+	dev = sc->dev;
+
+	len = of_property_count_u32_elems(dev->of_node, "mscl_qos_table");
+	if (len <= 0) {
+		dev_info(dev, "No qos table for scaler\n");
+		return 0;
+	}
+
+	sc->qos_table_cnt = len / 3;
+
+	qos_table = devm_kzalloc(dev, sizeof(struct sc_qos_table) * sc->qos_table_cnt, GFP_KERNEL);
+	if (!qos_table)
+		return -ENOMEM;
+
+	of_property_read_u32_array(dev->of_node, "mscl_qos_table",
+				   (unsigned int *)qos_table, len);
+
+	sort(qos_table, sc->qos_table_cnt, sizeof(*qos_table),
+	     sc_compare_qos_table_entries, NULL);
+
+	for (i = 0; i < sc->qos_table_cnt; i++) {
+		dev_info(dev, "MSCL QoS Table[%d] mif : %u int : %u [%u]\n", i,
+			 qos_table[i].freq_mif,
+			 qos_table[i].freq_int,
+			 qos_table[i].data_size);
+	}
+
+	sc->qos_table = qos_table;
+
+	len = of_property_count_u32_elems(dev->of_node, "mscl_ppc_table");
+	if (len <= 0) {
+		dev_info(dev, "No ppc table for scaler\n");
+		return -ENOENT;
+	}
+
+	sc->ppc_table_cnt = len / 3;
+
+	ppc_table = devm_kzalloc(dev,
+				 sizeof(*ppc_table) * sc->ppc_table_cnt, GFP_KERNEL);
+	if (!ppc_table)
+		return -ENOMEM;
+
+	of_property_read_u32_array(dev->of_node, "mscl_ppc_table",
+				   (unsigned int *)ppc_table, len);
+
+	for (i = 0; i < sc->ppc_table_cnt; i++) {
+		dev_info(dev, "MSCL PPC Table[%d] bpp : %u ppc : %u/%u\n", i,
+			 ppc_table[i].bpp,
+			 ppc_table[i].ppc[0],
+			 ppc_table[i].ppc[1]);
+	}
+
+	sc->ppc_table = ppc_table;
+
+	return 0;
+}
+
+static int sc_get_hwversion(struct sc_dev *sc)
+{
+	int ret = 0;
+	size_t ivar;
+	bool get_hwversion = false;
+	u32 hwver = 0;
+
+	ret = pm_runtime_get_sync(sc->dev);
+	if (ret < 0) {
+		dev_err(sc->dev, "%s: failed to local power on (err %d)\n",
+			__func__, ret);
+		goto err_ver_rpm_get;
+	}
+
+	if (!IS_ERR(sc->pclk)) {
+		ret = clk_prepare_enable(sc->pclk);
+		if (ret) {
+			dev_err(sc->dev,
+				"%s: failed to enable PCLK (err %d)\n",
+				__func__, ret);
+			goto err_ver_pclk_get;
+		}
+	}
+
+	if (!IS_ERR(sc->aclk)) {
+		ret = clk_prepare_enable(sc->aclk);
+		if (ret) {
+			dev_err(sc->dev,
+				"%s: failed to enable ACLK (err %d)\n",
+				__func__, ret);
+			goto err_ver_aclk_get;
+		}
+	}
+
+	sc->version = SCALER_VERSION(2, 0, 0);
+
+	hwver = __raw_readl(sc->regs + SCALER_VER);
+
+	/* selects the lowest version number if no version is matched */
+	for (ivar = 0; ivar < ARRAY_SIZE(sc_version_table); ivar++) {
+		sc->version = sc_version_table[ivar][1];
+		if (hwver == sc_version_table[ivar][0]) {
+			get_hwversion = true;
+			ret = hwver;
+			break;
+		}
+	}
+
+	if (!get_hwversion) {
+		dev_err(sc->dev,
+			"Could not support this hw in driver(version: %08x)\n", hwver);
+		ret = -EINVAL;
+		goto err_ver_aclk_get;
+	}
+
+	return ret;
+err_ver_aclk_get:
+	if (!IS_ERR(sc->pclk))
+		clk_disable_unprepare(sc->pclk);
+err_ver_pclk_get:
+	pm_runtime_put(sc->dev);
+err_ver_rpm_get:
+	sc_unregister_m2m_device(sc);
+	return ret;
+}
+
+static int sc_probe(struct platform_device *pdev)
+{
+	struct sc_dev *sc;
+	struct resource *res;
+	int ret = 0;
+	size_t ivar;
+	u32 hwver = 0;
+	int irq_num;
+
+	sc = devm_kzalloc(&pdev->dev, sizeof(struct sc_dev), GFP_KERNEL);
+	if (!sc)
+		goto err_dev;
+
+	sc->dev = &pdev->dev;
+	spin_lock_init(&sc->ctxlist_lock);
+	INIT_LIST_HEAD(&sc->ctx_list_high_prio);
+	INIT_LIST_HEAD(&sc->ctx_list_low_prio);
+	spin_lock_init(&sc->slock);
+	mutex_init(&sc->lock);
+	init_waitqueue_head(&sc->wait);
+
+	sc->fence_context = dma_fence_context_alloc(1);
+	spin_lock_init(&sc->fence_lock);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pr_err("Resource start: 0x%pa, end: 0x%pa, size: 0x%lx, flags: 0x%lx\n",
+	       &res->start, &res->end,
+	       (unsigned long)resource_size(res),
+	       (unsigned long)res->flags);
+	sc->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(sc->regs)) {
+		pr_err("devm_ioremap_resource failed: %pe\n", sc->regs);
+		goto err_io_resource;
+	}
+	dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
+
+	atomic_set(&sc->wdt.cnt, 0);
+	timer_setup(&sc->wdt.timer, sc_watchdog, 0);
+
+	if (pdev->dev.of_node) {
+		sc->dev_id = of_alias_get_id(pdev->dev.of_node, "scaler");
+		if (sc->dev_id < 0) {
+			dev_err(&pdev->dev,
+				"Failed to read scaler node id(%d)!\n", sc->dev_id);
+			ret = -EINVAL;
+			goto err_node_id;
+		}
+	} else {
+		sc->dev_id = pdev->id;
+	}
+
+	platform_set_drvdata(pdev, sc);
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = sc_populate_dt(sc);
+	if (ret)
+		goto err_dt;
+
+	ret = sc_register_m2m_device(sc, sc->dev_id);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register m2m device\n");
+		goto err_m2m;
+	}
+
+#if defined(CONFIG_PM_DEVFREQ) && defined(NEVER_DEFINED)
+	if (!of_property_read_u32(pdev->dev.of_node, "mscl,int_qos_minlock",
+				  (u32 *)&sc->qosreq_int_level)) {
+		if (sc->qosreq_int_level > 0) {
+			exynos_pm_qos_add_request(&sc->qosreq_int,
+						  PM_QOS_DEVICE_THROUGHPUT, 0);
+			dev_info(&pdev->dev, "INT Min.Lock Freq. = %u\n",
+				 sc->qosreq_int_level);
+		}
+	}
+#endif
+	if (of_property_read_u32(pdev->dev.of_node, "mscl,cfw",
+				 (u32 *)&sc->cfw))
+		sc->cfw = 0;
+
+	ret = sc_get_hwversion(sc);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "%s: failed to get hw version (err %d)\n",
+			__func__, ret);
+		goto err_m2m;
+	} else {
+		hwver = ret;
+	}
+
+	for (ivar = 0; ivar < ARRAY_SIZE(sc_variant); ivar++) {
+		if (sc->version >= sc_variant[ivar].version) {
+			sc->variant = &sc_variant[ivar];
+			break;
+		}
+	}
+
+	if (sc->version >= SCALER_VERSION(7, 0, 1)) {
+		sc->sysreg_offset = SCALER_SYSREG_OFFSET(res->start);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		if (res) {
+			sc->sysreg = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(sc->sysreg)) {
+				dev_info(&pdev->dev, "SCALER LLC SYSREG is not setted.\n");
+			} else {
+				writel(SCALER_LLC_NO_HINT, sc->sysreg + sc->sysreg_offset);
+				dev_info(&pdev->dev, "SCALER LLC SYSREG is setted with NO_HINT.\n");
+			}
+		}
+	}
+
+	sc_hwset_soft_reset(sc);
+
+	if (!IS_ERR(sc->aclk))
+		clk_disable_unprepare(sc->aclk);
+	if (!IS_ERR(sc->pclk))
+		clk_disable_unprepare(sc->pclk);
+	pm_runtime_put(&pdev->dev);
+
+	irq_num = platform_get_irq(pdev, 0);
+	if (irq_num < 0) {
+		dev_err(&pdev->dev, "failed to get IRQ resource\n");
+		ret = -ENOENT;
+		goto err_get_irq_res;
+	}
+
+	ret = devm_request_irq(&pdev->dev, irq_num, sc_irq_handler, 0,
+			       pdev->name, sc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to install irq\n");
+		goto err_request_irq;
+	}
+
+	dev_info(&pdev->dev,
+		 "Driver probed successfully(version: %08x(%x))\n",
+		 hwver, sc->version);
+
+	return 0;
+
+err_request_irq:
+err_get_irq_res:
+err_m2m:
+err_dt:
+err_node_id:
+err_io_resource:
+	if (sc)
+		devm_kfree(&pdev->dev, sc);
+err_dev:
+	dev_err(&pdev->dev,
+		"Driver probed failed!\n");
+
+	return ret;
+}
+
+static void sc_remove(struct platform_device *pdev)
+{
+	struct sc_dev *sc = platform_get_drvdata(pdev);
+
+	sc_unregister_m2m_device(sc);
+}
+
+static void sc_shutdown(struct platform_device *pdev)
+{
+	struct sc_dev *sc = platform_get_drvdata(pdev);
+
+	set_bit(DEV_SUSPEND, &sc->state);
+
+	wait_event(sc->wait,
+		   !test_bit(DEV_RUN, &sc->state));
+}
+
+static const struct of_device_id exynos_sc_match[] = {
+	{
+		.compatible = "samsung,exynos5-scaler",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, exynos_sc_match);
+
+static struct platform_driver sc_driver = {
+	.probe		= sc_probe,
+	.remove		= sc_remove,
+	.shutdown	= sc_shutdown,
+	.driver = {
+		.name	= MODULE_NAME,
+		.owner	= THIS_MODULE,
+		.pm	= &sc_pm_ops,
+		.of_match_table = of_match_ptr(exynos_sc_match),
+	}
+};
+
+module_platform_driver(sc_driver);
+
+MODULE_DESCRIPTION("EXYNOS m2m scaler driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/samsung/v920-scaler/scaler-regs.c b/drivers/media/platform/samsung/v920-scaler/scaler-regs.c
new file mode 100644
index 000000000000..87104094b349
--- /dev/null
+++ b/drivers/media/platform/samsung/v920-scaler/scaler-regs.c
@@ -0,0 +1,744 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019 Samsung Electronics Co., Ltd. All Rights Reserved
+ *		http://www.samsung.com
+ *
+ * Register interface file for Exynos Scaler driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "scaler.h"
+#include "scaler-regs.h"
+
+#define COEF(val_l, val_h) ((((val_h) & 0x7FF) << 16) | ((val_l) & 0x7FF))
+
+static const __u32 sc_coef_8t_org[7][16][4] = {
+	{	/* 8:8 or Zoom-in */
+		{COEF(0,    0), COEF(0,   0),   COEF(512,   0), COEF(0,    0)},
+		{COEF(-1,   2), COEF(-9,  30),  COEF(509, -25), COEF(8,   -2)},
+		{COEF(-1,   5), COEF(-19,  64), COEF(499, -46), COEF(14,  -4)},
+		{COEF(-2,   8), COEF(-30, 101), COEF(482, -62), COEF(20,  -5)},
+		{COEF(-3,  12), COEF(-41, 142), COEF(458, -73), COEF(23,  -6)},
+		{COEF(-3,  15), COEF(-53, 185), COEF(429, -80), COEF(25,  -6)},
+		{COEF(-4,  19), COEF(-63, 228), COEF(395, -83), COEF(26,  -6)},
+		{COEF(-5,  21), COEF(-71, 273), COEF(357, -82), COEF(25,  -6)},
+		{COEF(-5,  23), COEF(-78, 316), COEF(316, -78), COEF(23,  -5)},
+	}, {	/* 8:7 Zoom-out */
+		{COEF(0,   12), COEF(-32,  52), COEF(444,  56), COEF(-32, 12)},
+		{COEF(-3,  13), COEF(-39,  82), COEF(445,  29), COEF(-24,  9)},
+		{COEF(-3,  14), COEF(-46, 112), COEF(438,   6), COEF(-16,  7)},
+		{COEF(-3,  15), COEF(-52, 144), COEF(426, -14), COEF(-9,   5)},
+		{COEF(-3,  16), COEF(-58, 177), COEF(410, -30), COEF(-3,   3)},
+		{COEF(-3,  16), COEF(-63, 211), COEF(390, -43), COEF(2,    2)},
+		{COEF(-2,  16), COEF(-66, 244), COEF(365, -53), COEF(7,    1)},
+		{COEF(-2,  15), COEF(-66, 277), COEF(338, -60), COEF(10,   0)},
+		{COEF(-1,  13), COEF(-65, 309), COEF(309, -65), COEF(13,  -1)},
+	}, {	/* 8:6 or Zoom-in */
+		{COEF(0,   8), COEF(-44, 100), COEF(384, 100), COEF(-44,   8)},
+		{COEF(0,   8), COEF(-47, 123), COEF(382,  77), COEF(-40,   9)},
+		{COEF(1,   7), COEF(-49, 147), COEF(377,  57), COEF(-36,   8)},
+		{COEF(2,   5), COEF(-49, 171), COEF(369,  38), COEF(-32,   8)},
+		{COEF(2,   3), COEF(-48, 196), COEF(358,  20), COEF(-27,   8)},
+		{COEF(3,   1), COEF(-47, 221), COEF(344,   5), COEF(-22,   7)},
+		{COEF(3,  -2), COEF(-43, 245), COEF(329,  -9), COEF(-18,   7)},
+		{COEF(4,  -5), COEF(-37, 268), COEF(310, -20), COEF(-13,   5)},
+		{COEF(5,  -9), COEF(-30, 290), COEF(290, -30), COEF(-9,    5)},
+	}, {	/* 8:5 Zoom-out */
+		{COEF(0,  -3), COEF(-31, 130), COEF(320, 130), COEF(-31,  -3)},
+		{COEF(3,  -6), COEF(-29, 147), COEF(319, 113), COEF(-32,  -3)},
+		{COEF(3,  -8), COEF(-26, 165), COEF(315,  97), COEF(-33,  -1)},
+		{COEF(3, -11), COEF(-22, 182), COEF(311,  81), COEF(-32,   0)},
+		{COEF(3, -13), COEF(-17, 199), COEF(304,  66), COEF(-31,   1)},
+		{COEF(3, -16), COEF(-11, 216), COEF(296,  52), COEF(-30,   2)},
+		{COEF(3, -18), COEF(-3,  232), COEF(286,  38), COEF(-28,   2)},
+		{COEF(3, -21), COEF(5,   247), COEF(274,  26), COEF(-25,   3)},
+		{COEF(3, -23), COEF(15,  261), COEF(261,  15), COEF(-23,   3)},
+	}, {	/* 8:4 Zoom-out */
+		{COEF(0,  -12), COEF(0,  140), COEF(255, 140), COEF(0,   -11)},
+		{COEF(0,  -13), COEF(5,  151), COEF(254, 129), COEF(-4,  -10)},
+		{COEF(-1, -14), COEF(10, 163), COEF(253, 117), COEF(-7,   -9)},
+		{COEF(-1, -15), COEF(16, 174), COEF(250, 106), COEF(-10,  -8)},
+		{COEF(-1, -16), COEF(22, 185), COEF(246,  95), COEF(-12,  -7)},
+		{COEF(-2, -16), COEF(29, 195), COEF(241,  85), COEF(-14,  -6)},
+		{COEF(-2, -17), COEF(37, 204), COEF(236,  74), COEF(-15,  -5)},
+		{COEF(-3, -17), COEF(46, 214), COEF(229,  64), COEF(-16,  -5)},
+		{COEF(-4, -17), COEF(55, 222), COEF(222,  55), COEF(-17,  -4)},
+	}, {	/* 8:3 or Zoom-in */
+		{COEF(0,   -6), COEF(31, 133), COEF(195, 133), COEF(31,   -5)},
+		{COEF(-3,  -4), COEF(37, 139), COEF(195, 126), COEF(27,   -5)},
+		{COEF(-3,  -3), COEF(41, 146), COEF(194, 119), COEF(23,   -5)},
+		{COEF(-4,  -2), COEF(47, 152), COEF(193, 112), COEF(19,   -5)},
+		{COEF(-4,  -2), COEF(53, 158), COEF(191, 105), COEF(16,   -5)},
+		{COEF(-4,   0), COEF(59, 163), COEF(189,  98), COEF(12,   -5)},
+		{COEF(-4,   1), COEF(65, 169), COEF(185,  91), COEF(10,   -5)},
+		{COEF(-4,   3), COEF(71, 174), COEF(182,  84), COEF(7,    -5)},
+		{COEF(-5,   5), COEF(78, 178), COEF(178,  78), COEF(5,    -5)},
+	}, {	/* 8:2 Zoom-out */
+		{COEF(0,  10), COEF(52, 118), COEF(152, 118), COEF(52,    10)},
+		{COEF(0,  11), COEF(56, 122), COEF(152, 114), COEF(48,     9)},
+		{COEF(1,  13), COEF(60, 125), COEF(151, 110), COEF(45,     7)},
+		{COEF(1,  15), COEF(64, 129), COEF(150, 106), COEF(41,     6)},
+		{COEF(1,  17), COEF(68, 132), COEF(149, 102), COEF(38,     5)},
+		{COEF(1,  19), COEF(72, 135), COEF(148,  98), COEF(35,     4)},
+		{COEF(1,  21), COEF(77, 138), COEF(146,  94), COEF(31,     4)},
+		{COEF(2,  23), COEF(81, 140), COEF(145,  89), COEF(29,     3)},
+		{COEF(2,  26), COEF(85, 143), COEF(143,  85), COEF(26,     2)},
+	}
+};
+
+static const __u32 sc_coef_4t_org[7][16][2] = {
+	{ /* 8:8 or Zoom-in */
+		{COEF(0,     0), COEF(512,   0)},
+		{COEF(-1,   20), COEF(508, -15)},
+		{COEF(-3,   45), COEF(495, -25)},
+		{COEF(-5,   75), COEF(473, -31)},
+		{COEF(-8,  110), COEF(443, -33)},
+		{COEF(-11, 148), COEF(408, -33)},
+		{COEF(-14, 190), COEF(367, -31)},
+		{COEF(-19, 234), COEF(324, -27)},
+		{COEF(-23, 279), COEF(279, -23)},
+	}, { /* 8:7 Zoom-out */
+		{COEF(0,    32), COEF(448,  32)},
+		{COEF(-6,   55), COEF(446,  17)},
+		{COEF(-7,   79), COEF(437,   3)},
+		{COEF(-9,  107), COEF(421,  -7)},
+		{COEF(-11, 138), COEF(399, -14)},
+		{COEF(-13, 170), COEF(373, -18)},
+		{COEF(-15, 204), COEF(343, -20)},
+		{COEF(-18, 240), COEF(310, -20)},
+		{COEF(-19, 275), COEF(275, -19)},
+	}, { /* 8:6 Zoom-out */
+		{COEF(0,    61), COEF(390,  61)},
+		{COEF(-7,   83), COEF(390,  46)},
+		{COEF(-8,  106), COEF(383,  31)},
+		{COEF(-8,  130), COEF(371,  19)},
+		{COEF(-9,  156), COEF(356,   9)},
+		{COEF(-10, 183), COEF(337,   2)},
+		{COEF(-10, 210), COEF(315,  -3)},
+		{COEF(-10, 238), COEF(291,  -7)},
+		{COEF(-9,  265), COEF(265,  -9)},
+	}, { /* 8:5 Zoom-out */
+		{COEF(0,    86), COEF(341,  85)},
+		{COEF(-5,  105), COEF(341,  71)},
+		{COEF(-4,  124), COEF(336,  56)},
+		{COEF(-4,  145), COEF(328,  43)},
+		{COEF(-3,  166), COEF(317,  32)},
+		{COEF(-2,  187), COEF(304,  23)},
+		{COEF(-1,  209), COEF(288,  16)},
+		{COEF(1,   231), COEF(271,   9)},
+		{COEF(5,   251), COEF(251,   5)},
+	}, { /* 8:4 Zoom-out */
+		{COEF(0,   104), COEF(304, 104)},
+		{COEF(1,   120), COEF(302,  89)},
+		{COEF(2,   136), COEF(298,  76)},
+		{COEF(3,   153), COEF(293,  63)},
+		{COEF(5,   170), COEF(285,  52)},
+		{COEF(7,   188), COEF(275,  42)},
+		{COEF(10,  205), COEF(264,  33)},
+		{COEF(14,  221), COEF(251,  26)},
+		{COEF(20,  236), COEF(236,  20)},
+	}, { /* 8:3 Zoom-out */
+		{COEF(0,   118), COEF(276, 118)},
+		{COEF(7,   129), COEF(273, 103)},
+		{COEF(9,   143), COEF(270,  90)},
+		{COEF(11,  157), COEF(266,  78)},
+		{COEF(14,  171), COEF(260,  67)},
+		{COEF(17,  185), COEF(253,  57)},
+		{COEF(21,  199), COEF(244,  48)},
+		{COEF(27,  211), COEF(234,  40)},
+		{COEF(33,  223), COEF(223,  33)},
+	}, { /* 8:2 Zoom-out */
+		{COEF(0,   127), COEF(258, 127)},
+		{COEF(14,  135), COEF(252, 111)},
+		{COEF(15,  147), COEF(250, 100)},
+		{COEF(18,  159), COEF(247,  88)},
+		{COEF(21,  171), COEF(242,  78)},
+		{COEF(25,  182), COEF(237,  68)},
+		{COEF(30,  193), COEF(230,  59)},
+		{COEF(36,  204), COEF(222,  50)},
+		{COEF(43,  213), COEF(213,  43)},
+	},
+};
+
+static struct sc_csc_tab sc_no_csc = {
+	{ 0x200, 0x000, 0x000, 0x000, 0x200, 0x000, 0x000, 0x000, 0x200 },
+};
+
+static struct sc_csc_tab sc_y2r = {
+	/* REC.601 Narrow */
+	{ 0x0254, 0x0000, 0x0331, 0x0254, 0xFF37, 0xFE60, 0x0254, 0x0409, 0x0000 },
+	/* REC.601 Wide */
+	{ 0x0200, 0x0000, 0x02BE, 0x0200, 0xFF54, 0xFE9B, 0x0200, 0x0377, 0x0000 },
+	/* REC.709 Narrow */
+	{ 0x0254, 0x0000, 0x0396, 0x0254, 0xFF93, 0xFEEF, 0x0254, 0x043A, 0x0000 },
+	/* REC.709 Wide */
+	{ 0x0200, 0x0000, 0x0314, 0x0200, 0xFFA2, 0xFF16, 0x0200, 0x03A1, 0x0000 },
+	/* BT.2020 Narrow */
+	{ 0x0254, 0x0000, 0x035B, 0x0254, 0xFFA0, 0xFEB3, 0x0254, 0x0449, 0x0000 },
+	/* BT.2020 Wide */
+	{ 0x0200, 0x0000, 0x02E2, 0x0200, 0xFFAE, 0xFEE2, 0x0200, 0x03AE, 0x0000 },
+};
+
+static struct sc_csc_tab sc_r2y = {
+	/* REC.601 Narrow */
+	{ 0x0083, 0x0102, 0x0032, 0xFFB4, 0xFF6B, 0x00E1, 0x00E1, 0xFF44, 0xFFDB },
+	/* REC.601 Wide  */
+	{ 0x0099, 0x012D, 0x003A, 0xFFA8, 0xFF53, 0x0106, 0x0106, 0xFF25, 0xFFD5 },
+	/* REC.709 Narrow */
+	{ 0x005D, 0x013A, 0x0020, 0xFFCC, 0xFF53, 0x00E1, 0x00E1, 0xFF34, 0xFFEB },
+	/* REC.709 Wide */
+	{ 0x006D, 0x016E, 0x0025, 0xFFC4, 0xFF36, 0x0106, 0x0106, 0xFF12, 0xFFE8 },
+	/* BT.2020 Narrow */
+	{ 0x0074, 0x012A, 0x001A, 0xFFC1, 0xFF5E, 0x00E1, 0x00E1, 0xFF31, 0xFFEE },
+	/* BT.2020 Wide */
+	{ 0x0087, 0x015B, 0x001E, 0xFFB7, 0xFF43, 0x0106, 0x0106, 0xFF0F, 0xFFEB },
+};
+
+static struct sc_csc_tab *sc_csc_list[] = {
+	[0] = &sc_no_csc,
+	[1] = &sc_y2r,
+	[2] = &sc_r2y,
+};
+
+static struct sc_bl_op_val sc_bl_op_tbl[] = {
+	/* Sc,	 Sa,	Dc,	Da */
+	{ZERO,	 ZERO,	ZERO,	ZERO},		/* CLEAR */
+	{ ONE,	 ONE,	ZERO,	ZERO},		/* SRC */
+	{ZERO,	 ZERO,	ONE,	ONE},		/* DST */
+	{ ONE,	 ONE,	INV_SA,	INV_SA},	/* SRC_OVER */
+	{INV_DA, ONE,	ONE,	INV_SA},	/* DST_OVER */
+	{DST_A,	 DST_A,	ZERO,	ZERO},		/* SRC_IN */
+	{ZERO,	 ZERO,	SRC_A,	SRC_A},		/* DST_IN */
+	{INV_DA, INV_DA, ZERO,	ZERO},		/* SRC_OUT */
+	{ZERO,	 ZERO,	INV_SA,	INV_SA},	/* DST_OUT */
+	{DST_A,	 ZERO,	INV_SA,	ONE},		/* SRC_ATOP */
+	{INV_DA, ONE,	SRC_A,	ZERO},		/* DST_ATOP */
+	{INV_DA, ONE,	INV_SA,	ONE},		/* XOR: need to WA */
+	{INV_DA, ONE,	INV_SA,	INV_SA},	/* DARKEN */
+	{INV_DA, ONE,	INV_SA,	INV_SA},	/* LIGHTEN */
+	{INV_DA, ONE,	INV_SA,	INV_SA},	/* MULTIPLY */
+	{ONE,	 ONE,	INV_SC,	INV_SA},	/* SCREEN */
+	{ONE,	 ONE,	ONE,	ONE},		/* ADD */
+};
+
+int sc_hwset_src_image_format(struct sc_dev *sc, struct sc_frame *frame)
+{
+	u32 val = 0;
+
+	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(frame)) {
+		pr_err("[%s] sc(%p) or frame(%p) is wrong\n", __func__, sc, frame);
+		return -1;
+	}
+
+	val = frame->sc_fmt->cfg_val;
+
+	writel(val, sc->regs + SCALER_SRC_CFG);
+	return 0;
+}
+
+int sc_hwset_dst_image_format(struct sc_dev *sc, struct sc_frame *frame)
+{
+	u32 val = 0;
+
+	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(frame)) {
+		pr_err("[%s] sc(%p) or frame(%p) is wrong\n", __func__, sc, frame);
+		return -1;
+	}
+	val = frame->sc_fmt->cfg_val;
+
+	writel(val, sc->regs + SCALER_DST_CFG);
+
+	/*
+	 * When output format is RGB,
+	 * CSC_Y_OFFSET_DST_EN should be 0
+	 * to avoid color distortion
+	 */
+	if (frame->sc_fmt->is_rgb) {
+		writel(readl(sc->regs + SCALER_CFG) &
+					~SCALER_CFG_CSC_Y_OFFSET_DST,
+				sc->regs + SCALER_CFG);
+	}
+
+	return 0;
+}
+
+void sc_hwset_pre_multi_format(struct sc_dev *sc, bool src, bool dst)
+{
+	unsigned long cfg = 0;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	cfg = readl(sc->regs + SCALER_SRC_CFG);
+
+	if (sc->version == SCALER_VERSION(4, 0, 1)) {
+		if (src != dst)
+			dev_err(sc->dev,
+				"pre-multi fmt should be same between src and dst\n");
+		return;
+	}
+
+	if (src && ((cfg & SCALER_CFG_FMT_MASK) == SCALER_CFG_FMT_ARGB8888)) {
+		cfg &= ~SCALER_CFG_FMT_MASK;
+		cfg |= SCALER_CFG_FMT_P_ARGB8888;
+		writel(cfg, sc->regs + SCALER_SRC_CFG);
+	}
+
+	cfg = readl(sc->regs + SCALER_DST_CFG);
+	if (dst && ((cfg & SCALER_CFG_FMT_MASK) == SCALER_CFG_FMT_ARGB8888)) {
+		cfg &= ~SCALER_CFG_FMT_MASK;
+		cfg |= SCALER_CFG_FMT_P_ARGB8888;
+		writel(cfg, sc->regs + SCALER_DST_CFG);
+	}
+}
+
+void get_blend_value(unsigned int *cfg, u32 val, bool pre_multi)
+{
+	unsigned int tmp;
+
+	*cfg &= ~(SCALER_SEL_INV_MASK | SCALER_SEL_MASK |
+			SCALER_OP_SEL_INV_MASK | SCALER_OP_SEL_MASK);
+
+	if (val == 0xff) {
+		*cfg |= (1 << SCALER_SEL_INV_SHIFT);
+	} else {
+		if (pre_multi)
+			*cfg |= (1 << SCALER_SEL_SHIFT);
+		else
+			*cfg |= (2 << SCALER_SEL_SHIFT);
+		tmp = val & 0xf;
+		*cfg |= (tmp << SCALER_OP_SEL_SHIFT);
+	}
+
+	if (val >= BL_INV_BIT_OFFSET)
+		*cfg |= (1 << SCALER_OP_SEL_INV_SHIFT);
+}
+
+void sc_hwset_blend(struct sc_dev *sc, enum sc_blend_op bl_op, bool pre_multi,
+		    unsigned char g_alpha)
+{
+	unsigned int cfg = 0;
+	int idx = 0;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	cfg = readl(sc->regs + SCALER_CFG);
+	idx = bl_op - 1;
+	if (idx < 0) {
+		pr_err("idx value is negative\n");
+		return;
+	}
+
+	cfg |= SCALER_CFG_BLEND_EN;
+	writel(cfg, sc->regs + SCALER_CFG);
+
+	cfg = readl(sc->regs + SCALER_SRC_BLEND_COLOR);
+	get_blend_value(&cfg, sc_bl_op_tbl[idx].src_color, pre_multi);
+	if (g_alpha < 0xff)
+		cfg |= (SRC_GA << SCALER_OP_SEL_SHIFT);
+	writel(cfg, sc->regs + SCALER_SRC_BLEND_COLOR);
+	sc_dbg("src_blend_color is 0x%x, %d\n", cfg, pre_multi);
+
+	cfg = readl(sc->regs + SCALER_SRC_BLEND_ALPHA);
+	get_blend_value(&cfg, sc_bl_op_tbl[idx].src_alpha, 1);
+	if (g_alpha < 0xff)
+		cfg |= (SRC_GA << SCALER_OP_SEL_SHIFT) | (g_alpha << 0);
+	writel(cfg, sc->regs + SCALER_SRC_BLEND_ALPHA);
+	sc_dbg("src_blend_alpha is 0x%x\n", cfg);
+
+	cfg = readl(sc->regs + SCALER_DST_BLEND_COLOR);
+	get_blend_value(&cfg, sc_bl_op_tbl[idx].dst_color, pre_multi);
+	if (g_alpha < 0xff)
+		cfg |= ((INV_SAGA & 0xf) << SCALER_OP_SEL_SHIFT);
+	writel(cfg, sc->regs + SCALER_DST_BLEND_COLOR);
+	sc_dbg("dst_blend_color is 0x%x\n", cfg);
+
+	cfg = readl(sc->regs + SCALER_DST_BLEND_ALPHA);
+	get_blend_value(&cfg, sc_bl_op_tbl[idx].dst_alpha, 1);
+	if (g_alpha < 0xff)
+		cfg |= ((INV_SAGA & 0xf) << SCALER_OP_SEL_SHIFT);
+	writel(cfg, sc->regs + SCALER_DST_BLEND_ALPHA);
+	sc_dbg("dst_blend_alpha is 0x%x\n", cfg);
+
+	/*
+	 * If dst format is non-premultiplied format
+	 * and blending operation is enabled,
+	 * result image should be divided by alpha value
+	 * because the result is always pre-multiplied.
+	 */
+	if (!pre_multi) {
+		cfg = readl(sc->regs + SCALER_CFG);
+		cfg |= SCALER_CFG_BL_DIV_ALPHA_EN;
+		writel(cfg, sc->regs + SCALER_CFG);
+	}
+}
+
+void sc_hwset_color_fill(struct sc_dev *sc, unsigned int val)
+{
+	unsigned int cfg = 0;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	cfg = readl(sc->regs + SCALER_CFG);
+
+	cfg |= SCALER_CFG_FILL_EN;
+	writel(cfg, sc->regs + SCALER_CFG);
+
+	cfg = readl(sc->regs + SCALER_FILL_COLOR);
+	cfg = val;
+	writel(cfg, sc->regs + SCALER_FILL_COLOR);
+	sc_dbg("color filled is 0x%08x\n", val);
+}
+
+void sc_hwset_dith(struct sc_dev *sc, unsigned int val)
+{
+	unsigned int cfg = 0;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	cfg = readl(sc->regs + SCALER_DITH_CFG);
+
+	cfg &= ~(SCALER_DITH_R_MASK | SCALER_DITH_G_MASK | SCALER_DITH_B_MASK);
+	cfg |= val;
+	writel(cfg, sc->regs + SCALER_DITH_CFG);
+}
+
+void sc_hwset_csc_coef(struct sc_dev *sc, enum sc_csc_idx idx,
+		       struct sc_csc *csc)
+{
+	unsigned int i, j, tmp;
+	unsigned long cfg = 0;
+	int *csc_eq_val;
+
+	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(csc)) {
+		pr_err("[%s] sc(%p) or csc(%p) is wrong\n", __func__, sc, csc);
+		return;
+	}
+
+	if (idx == NO_CSC) {
+		csc_eq_val = sc_csc_list[idx]->narrow_601;
+	} else {
+		if (csc->csc_eq == V4L2_COLORSPACE_REC709) {
+			if (csc->csc_range == SC_CSC_NARROW)
+				csc_eq_val = sc_csc_list[idx]->narrow_709;
+			else
+				csc_eq_val = sc_csc_list[idx]->wide_709;
+		} else if (csc->csc_eq == V4L2_COLORSPACE_BT2020) {
+			if (csc->csc_range == SC_CSC_NARROW)
+				csc_eq_val = sc_csc_list[idx]->narrow_2020;
+			else
+				csc_eq_val = sc_csc_list[idx]->wide_2020;
+		} else {
+			if (csc->csc_range == SC_CSC_NARROW)
+				csc_eq_val = sc_csc_list[idx]->narrow_601;
+			else
+				csc_eq_val = sc_csc_list[idx]->wide_601;
+		}
+	}
+
+	tmp = SCALER_CSC_COEF22 - SCALER_CSC_COEF00;
+
+	for (i = 0, j = 0; i < 9; i++, j += 4) {
+		cfg = readl(sc->regs + SCALER_CSC_COEF00 + j);
+		cfg &= ~SCALER_CSC_COEF_MASK;
+		cfg |= csc_eq_val[i];
+		writel(cfg, sc->regs + SCALER_CSC_COEF00 + j);
+		sc_dbg("csc value %d - %d\n", i, csc_eq_val[i]);
+	}
+
+	/* set CSC_Y_OFFSET_EN */
+	cfg = readl(sc->regs + SCALER_CFG);
+	if (idx == CSC_Y2R) {
+		if (csc->csc_range == SC_CSC_WIDE)
+			cfg &= ~SCALER_CFG_CSC_Y_OFFSET_SRC;
+		else
+			cfg |= SCALER_CFG_CSC_Y_OFFSET_SRC;
+	} else if (idx == CSC_R2Y) {
+		if (csc->csc_range == SC_CSC_WIDE)
+			cfg &= ~SCALER_CFG_CSC_Y_OFFSET_DST;
+		else
+			cfg |= SCALER_CFG_CSC_Y_OFFSET_DST;
+	}
+	writel(cfg, sc->regs + SCALER_CFG);
+}
+
+static const __u32 sc_scaling_ratio[] = {
+	1048576,	/* 0: 8:8 scaing or zoom-in */
+	1198372,	/* 1: 8:7 zoom-out */
+	1398101,	/* 2: 8:6 zoom-out */
+	1677721,	/* 3: 8:5 zoom-out */
+	2097152,	/* 4: 8:4 zoom-out */
+	2796202,	/* 5: 8:3 zoom-out */
+	/* higher ratio -> 6: 8:2 zoom-out */
+};
+
+static unsigned int sc_get_scale_filter(unsigned int ratio)
+{
+	unsigned int filter;
+
+	for (filter = 0; filter < ARRAY_SIZE(sc_scaling_ratio); filter++)
+		if (ratio <= sc_scaling_ratio[filter])
+			return filter;
+
+	return filter;
+}
+
+static u32 sc_coef_adjust(u32 val)
+{
+	/*
+	 * Truncate LSB 2 bit of two 11 bit value like below.
+	 * [26:16] -> [24:16], [10:0] -> [8:0]
+	 *
+	 * If val has 0x01BC0038, for example, it will return 0x006F000E.
+	 */
+	return ((val >> 2) & 0x1ff01ff);
+}
+
+#define sc_coef_adj(x, val) ({			\
+	typeof(val) _v = (val);			\
+	unlikely(x) ? sc_coef_adjust(_v) : _v;	\
+})
+void sc_hwset_polyphase_hcoef(struct sc_dev *sc,
+			      unsigned int yratio, unsigned int cratio,
+			      unsigned int filter)
+{
+	unsigned int phase;
+	unsigned int yfilter = 0;
+	unsigned int cfilter = 0;
+	const __u32 (*sc_coef_8t)[16][4] = sc_coef_8t_org;
+	bool bit_adj;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	yfilter = sc_get_scale_filter(yratio);
+	cfilter = sc_get_scale_filter(cratio);
+	bit_adj = !sc->variant->pixfmt_10bit;
+
+	for (phase = 0; phase < 9; phase++) {
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[yfilter][phase][3]),
+			     sc->regs + SCALER_YHCOEF + phase * 16);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[yfilter][phase][2]),
+			     sc->regs + SCALER_YHCOEF + phase * 16 + 4);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[yfilter][phase][1]),
+			     sc->regs + SCALER_YHCOEF + phase * 16 + 8);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[yfilter][phase][0]),
+			     sc->regs + SCALER_YHCOEF + phase * 16 + 12);
+	}
+
+	for (phase = 0; phase < 9; phase++) {
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[cfilter][phase][3]),
+			     sc->regs + SCALER_CHCOEF + phase * 16);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[cfilter][phase][2]),
+			     sc->regs + SCALER_CHCOEF + phase * 16 + 4);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[cfilter][phase][1]),
+			     sc->regs + SCALER_CHCOEF + phase * 16 + 8);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_8t[cfilter][phase][0]),
+			     sc->regs + SCALER_CHCOEF + phase * 16 + 12);
+	}
+}
+
+void sc_hwset_polyphase_vcoef(struct sc_dev *sc,
+			      unsigned int yratio, unsigned int cratio,
+			      unsigned int filter)
+{
+	unsigned int phase;
+	unsigned int yfilter = 0;
+	unsigned int cfilter = 0;
+	const __u32 (*sc_coef_4t)[16][2] = sc_coef_4t_org;
+	bool bit_adj;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	yfilter = sc_get_scale_filter(yratio);
+	cfilter = sc_get_scale_filter(cratio);
+	bit_adj = !sc->variant->pixfmt_10bit;
+
+	/* reset value of the coefficient registers are the 8:8 table */
+	for (phase = 0; phase < 9; phase++) {
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[yfilter][phase][1]),
+			     sc->regs + SCALER_YVCOEF + phase * 8);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[yfilter][phase][0]),
+			     sc->regs + SCALER_YVCOEF + phase * 8 + 4);
+	}
+
+	for (phase = 0; phase < 9; phase++) {
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[cfilter][phase][1]),
+			     sc->regs + SCALER_CVCOEF + phase * 8);
+		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[cfilter][phase][0]),
+			     sc->regs + SCALER_CVCOEF + phase * 8 + 4);
+	}
+}
+
+void sc_get_span(struct sc_frame *frame, u32 *yspan, u32 *cspan)
+{
+	if (IS_ERR_OR_NULL(frame) || IS_ERR_OR_NULL(yspan) || IS_ERR_OR_NULL(cspan)) {
+		pr_err("[%s] frame(%p) or yspan(%p) or cspan(%p) is wrong\n",
+		       __func__, frame, yspan, cspan);
+		return;
+	}
+
+	*yspan = frame->width;
+
+	if (frame->sc_fmt->num_comp == 2) {
+		*cspan = frame->width << frame->sc_fmt->cspan;
+	} else if (frame->sc_fmt->num_comp == 3) {
+		if (sc_fmt_is_ayv12(frame->sc_fmt->pixelformat)) {
+			*cspan = ALIGN(frame->width >> 1, 16);
+		} else if (sc_fmt_is_yuv420(frame->sc_fmt->pixelformat)) { /* YUV420 */
+			if (frame->cspanalign) {
+				*cspan = ALIGN(frame->width >> 1,
+					       8 << (frame->cspanalign - 1));
+			} else {
+				*cspan = frame->width >> 1;
+			}
+		} else if (frame->sc_fmt->cspan) { /* YUV444 */
+			*cspan = frame->width;
+		} else {
+			*cspan = frame->width >> 1;
+		}
+	} else if (frame->sc_fmt->num_comp == 1) {
+		if (sc_fmt_is_rgb888(frame->sc_fmt->pixelformat))
+			if (frame->yspanalign)
+				*yspan = ALIGN(frame->width,
+					       8 << (frame->yspanalign - 1));
+		*cspan = 0;
+	} else {
+		*cspan = 0;
+	}
+}
+
+void sc_hwset_src_imgsize(struct sc_dev *sc, struct sc_frame *frame)
+{
+	u32 yspan = 0, cspan = 0;
+
+	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(frame)) {
+		pr_err("[%s] sc(%p) or frame(%p) is wrong\n", __func__, sc, frame);
+		return;
+	}
+
+	sc_get_span(frame, &yspan, &cspan);
+
+	if (sc->version < SCALER_VERSION(7, 0, 1)) {
+		writel(yspan | (cspan << 16), sc->regs + SCALER_SRC_SPAN);
+	} else {
+		writel(yspan, sc->regs + SCALER_SRC_YSPAN);
+		if (frame->sc_fmt->num_comp > 1)
+			writel(cspan, sc->regs + SCALER_SRC_CSPAN);
+	}
+}
+
+void sc_hwset_intsrc_imgsize(struct sc_dev *sc, int num_comp, __u32 width)
+{
+	u32 yspan = 0, cspan = 0;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return;
+	}
+
+	yspan = width;
+
+	/*
+	 * TODO: C width should be half of Y width
+	 * but, how to get the diffferent c width from user
+	 * like AYV12 format
+	 */
+	if (num_comp == 2)
+		cspan = width;
+	if (num_comp == 3)
+		cspan = width >> 1;
+
+	if (sc->version < SCALER_VERSION(7, 0, 1)) {
+		writel(yspan | (cspan << 16), sc->regs + SCALER_SRC_SPAN);
+	} else {
+		writel(yspan, sc->regs + SCALER_SRC_YSPAN);
+		if (num_comp > 1)
+			writel(cspan, sc->regs + SCALER_SRC_CSPAN);
+	}
+}
+
+void sc_hwset_dst_imgsize(struct sc_dev *sc, struct sc_frame *frame)
+{
+	u32 yspan = 0, cspan = 0;
+
+	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(frame)) {
+		pr_err("[%s] sc(%p) or frame(%p) is wrong\n", __func__, sc, frame);
+		return;
+	}
+
+	sc_get_span(frame, &yspan, &cspan);
+
+	if (sc->version < SCALER_VERSION(7, 0, 1)) {
+		writel(yspan | (cspan << 16), sc->regs + SCALER_DST_SPAN);
+	} else {
+		writel(yspan, sc->regs + SCALER_DST_YSPAN);
+		if (frame->sc_fmt->num_comp > 1)
+			writel(cspan, sc->regs + SCALER_DST_CSPAN);
+	}
+}
+
+void sc_hwset_src_addr(struct sc_dev *sc, struct sc_frame *frame)
+{
+	struct sc_addr *addr = NULL;
+
+	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(frame)) {
+		pr_err("[%s] sc(%p) or frame(%p) is wrong\n", __func__, sc, frame);
+		return;
+	}
+
+	addr = &frame->addr;
+
+	writel(addr->ioaddr[SC_PLANE_Y], sc->regs + SCALER_SRC_Y_BASE);
+	writel(addr->ioaddr[SC_PLANE_CB], sc->regs + SCALER_SRC_CB_BASE);
+	writel(addr->ioaddr[SC_PLANE_CR], sc->regs + SCALER_SRC_CR_BASE);
+}
+
+void sc_hwset_dst_addr(struct sc_dev *sc, struct sc_frame *frame)
+{
+	struct sc_addr *addr = NULL;
+
+	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(frame)) {
+		pr_err("[%s] sc(%p) or frame(%p) is wrong\n", __func__, sc, frame);
+		return;
+	}
+
+	addr = &frame->addr;
+
+	writel(addr->ioaddr[SC_PLANE_Y], sc->regs + SCALER_DST_Y_BASE);
+	writel(addr->ioaddr[SC_PLANE_CB], sc->regs + SCALER_DST_CB_BASE);
+	writel(addr->ioaddr[SC_PLANE_CR], sc->regs + SCALER_DST_CR_BASE);
+}
+
+u32 sc_hwget_and_clear_irq_status(struct sc_dev *sc)
+{
+	u32 val = 0;
+
+	if (IS_ERR_OR_NULL(sc)) {
+		pr_err("[%s] sc(%p) is wrong\n", __func__, sc);
+		return val;
+	}
+
+	val = __raw_readl(sc->regs + SCALER_INT_STATUS);
+	__raw_writel(val, sc->regs + SCALER_INT_STATUS);
+	return val;
+}
diff --git a/drivers/media/platform/samsung/v920-scaler/scaler-regs.h b/drivers/media/platform/samsung/v920-scaler/scaler-regs.h
new file mode 100644
index 000000000000..f095007129ee
--- /dev/null
+++ b/drivers/media/platform/samsung/v920-scaler/scaler-regs.h
@@ -0,0 +1,406 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019 Samsung Electronics Co., Ltd. All Rights Reserved
+ *		http://www.samsung.com
+ *
+ * Register header file for Exynos Scaler driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __SCALER_REGS_H__
+#define __SCALER_REGS_H__
+
+#include "scaler.h"
+
+/* Status */
+#define SCALER_STATUS			0x00
+
+/* Configuration */
+#define SCALER_CFG			0x04
+#define SCALER_CFG_DRCG_EN		BIT(31)
+#define SCALER_CFG_CORE_BYP_EN		BIT(29)
+#define SCALER_CFG_SRAM_CG_EN		BIT(28)
+#define SCALER_CFG_FILL_EN		BIT(24)
+#define SCALER_CFG_BL_DIV_ALPHA_EN	BIT(17)
+#define SCALER_CFG_BLEND_EN		BIT(16)
+#define SCALER_CFG_CSC_Y_OFFSET_SRC	BIT(10)
+#define SCALER_CFG_BURST_WR		BIT(8)
+#define SCALER_CFG_BURST_RD		BIT(7)
+#define SCALER_CFG_CSC_Y_OFFSET_DST	BIT(9)
+#define SCALER_CFG_STOP_REQ		BIT(3)
+#define SCALER_CFG_RESET_OKAY		BIT(2)
+#define SCALER_CFG_SOFT_RST		BIT(1)
+#define SCALER_CFG_START_CMD		BIT(0)
+
+/* Interrupt */
+#define SCALER_INT_EN			0x08
+#define SCALER_INT_EN_FRAME_END		BIT(0)
+#define SCALER_INT_EN_ALL		0x807fffff
+#define SCALER_INT_EN_ALL_v3		0x82ffffff
+#define SCALER_INT_EN_ALL_v4		0xb2ffffff
+#define SCALER_INT_EN_ALL_v7		0xfcffffff
+#define SCALER_INT_OK(status)		((status) == SCALER_INT_EN_FRAME_END)
+
+#define SCALER_INT_STATUS		0x0c
+#define SCALER_INT_STATUS_FRAME_END	BIT(0)
+
+#define SCALER_SRC_CFG			0x10
+
+/* Source Image Configuration */
+#define SCALER_CFG_TILE_EN		BIT(10)
+#define SCALER_CFG_VHALF_PHASE_EN	BIT(9)
+#define SCALER_CFG_BIG_ENDIAN		BIT(8)
+#define SCALER_CFG_SBWC_LOSSY		BIT(10)
+#define SCALER_CFG_SBWC_FORMAT		BIT(9)
+#define SCALER_CFG_10BIT_P010		BIT(7)
+#define SCALER_CFG_10BIT_S10		(2 << 7)
+#define SCALER_CFG_10BIT_SBWC		(3 << 7)
+#define SCALER_CFG_10BIT_MASK		(3 << 7)
+#define SCALER_CFG_SWAP_MASK		(3 << 5)
+#define SCALER_CFG_BYTE_SWAP		BIT(5)
+#define SCALER_CFG_HWORD_SWAP		(2 << 5)
+#define SCALER_CFG_BYTE_HWORD_SWAP	(3 << 5)
+#define SCALER_CFG_FMT_MASK		(0x1f << 0)
+#define SCALER_CFG_FMT_YCBCR420_2P	(0 << 0)
+#define SCALER_CFG_FMT_YUYV		(0xa << 0)
+#define SCALER_CFG_FMT_UYVY		(0xb << 0)
+#define SCALER_CFG_FMT_YVYU		(9 << 0)
+#define SCALER_CFG_FMT_YCBCR422_2P	(2 << 0)
+#define SCALER_CFG_FMT_YCBCR444_2P	(3 << 0)
+#define SCALER_CFG_FMT_RGB565		(4 << 0)
+#define SCALER_CFG_FMT_ARGB1555		(5 << 0)
+#define SCALER_CFG_FMT_ARGB4444		(0xc << 0)
+#define SCALER_CFG_FMT_ARGB8888		(6 << 0)
+#define SCALER_CFG_FMT_RGBA8888		(0xe << 0)
+#define SCALER_CFG_FMT_P_ARGB8888	(7 << 0)
+#define SCALER_CFG_FMT_L8A8		(0xd << 0)
+#define SCALER_CFG_FMT_L8		(0xf << 0)
+#define SCALER_CFG_FMT_YCRCB420_2P	(0x10 << 0)
+#define SCALER_CFG_FMT_YCRCB422_2P	(0x12 << 0)
+#define SCALER_CFG_FMT_YCRCB444_2P	(0x13 << 0)
+#define SCALER_CFG_FMT_YCBCR420_3P	(0x14 << 0)
+#define SCALER_CFG_FMT_YCBCR422_3P	(0x16 << 0)
+#define SCALER_CFG_FMT_YCBCR444_3P	(0x17 << 0)
+#define SCALER_CFG_FMT_ARGB2101010	(0x18 << 0)
+#define SCALER_CFG_FMT_ABGR2101010	(0x19 << 0)
+#define SCALER_CFG_FMT_RGBA1010102	(0x1a << 0)
+#define SCALER_CFG_FMT_BGRA1010102	(0x1b << 0)
+#define SCALER_CFG_SBWC_LOSSY_BYTES32NUM(x)    (((x) & 0x7) << 11)
+#define SCALER_CFG_FMT_Y_MONO		(0x1c << 0)
+
+/* Source Y Base Address */
+#define SCALER_SRC_Y_BASE		0x14
+#define SCALER_SRC_CB_BASE		0x18
+#define SCALER_SRC_CR_BASE		0x294
+#define SCALER_SRC_SPAN			0x1c
+#define SCALER_SRC_CSPAN_MASK		(0xffff << 16)
+#define SCALER_SRC_YSPAN_MASK		(0xffff << 0)
+#define SCALER_SRC_YSPAN		0x1c
+#define SCALER_SRC_CSPAN		0x2c
+
+#define SCALER_SRC_Y_POS		0x20
+#define SCALER_SRC_WH			0x24
+#define SCALER_SRC_PRESC_WH		0x2C
+
+#define SCALER_SRC_C_POS		0x28
+
+#define SCALER_DST_CFG			0x30
+#define SCALER_DST_Y_BASE		0x34
+#define SCALER_DST_CB_BASE		0x38
+#define SCALER_DST_CR_BASE		0x298
+#define SCALER_DST_SPAN			0x3c
+#define SCALER_DST_CSPAN_MASK		(0xffff << 16)
+#define SCALER_DST_YSPAN_MASK		(0xffff << 0)
+#define SCALER_DST_YSPAN		0x3c
+#define SCALER_DST_CSPAN		0x4c
+
+#define SCALER_DST_WH			0x40
+
+#define SCALER_DST_POS			0x44
+
+#define SCALER_H_RATIO			0x50
+#define SCALER_V_RATIO			0x54
+
+#define SCALER_ROT_CFG			0x58
+#define SCALER_ROT_MASK			(3 << 0)
+#define SCALER_FLIP_MASK		(3 << 2)
+#define SCALER_FLIP_X_EN		BIT(3)
+#define SCALER_FLIP_Y_EN		BIT(2)
+#define SCALER_ROT_90			BIT(0)
+#define SCALER_ROT_180			(2 << 0)
+#define SCALER_ROT_270			(3 << 0)
+
+#define SCALER_LAT_CON			0x5c
+
+#define SCALER_YHCOEF			0x60
+#define SCALER_YVCOEF			0xf0
+#define SCALER_CHCOEF			0x140
+#define SCALER_CVCOEF			0x1d0
+
+#define SCALER_CSC_COEF00		0x220
+#define SCALER_CSC_COEF10		0x224
+#define SCALER_CSC_COEF20		0x228
+#define SCALER_CSC_COEF01		0x22c
+#define SCALER_CSC_COEF11		0x230
+#define SCALER_CSC_COEF21		0x234
+#define SCALER_CSC_COEF02		0x238
+#define SCALER_CSC_COEF12		0x23c
+#define SCALER_CSC_COEF22		0x240
+#define SCALER_CSC_COEF_MASK		(0xffff << 0)
+
+#define SCALER_DITH_CFG			0x250
+#define SCALER_DITH_R_MASK		(7 << 6)
+#define SCALER_DITH_G_MASK		(7 << 3)
+#define SCALER_DITH_B_MASK		(7 << 0)
+#define SCALER_DITH_R_SHIFT		(6)
+#define SCALER_DITH_G_SHIFT		(3)
+#define SCALER_DITH_B_SHIFT		(0)
+#define SCALER_DITH_SRC_INV		BIT(1)
+#define SCALER_DITH_DST_EN		BIT(0)
+
+#define SCALER_VER			0x260
+
+#define SCALER_CRC_COLOR01		0x270
+#define SCALER_CRC_COLOR23		0x274
+#define SCALER_CYCLE_COUNT		0x278
+
+#define SCALER_SRC_BLEND_COLOR		0x280
+#define SCALER_SRC_BLEND_ALPHA		0x284
+#define SCALER_DST_BLEND_COLOR		0x288
+#define SCALER_DST_BLEND_ALPHA		0x28c
+#define SCALER_SEL_INV_MASK		BIT(31)
+#define SCALER_SEL_MASK			(2 << 29)
+#define SCALER_OP_SEL_INV_MASK		BIT(28)
+#define SCALER_OP_SEL_MASK		(0xf << 24)
+#define SCALER_SEL_INV_SHIFT		(31)
+#define SCALER_SEL_SHIFT		(29)
+#define SCALER_OP_SEL_INV_SHIFT		(28)
+#define SCALER_OP_SEL_SHIFT		(24)
+
+#define SCALER_SRC_2BIT_Y_BASE		0x280
+#define SCALER_SRC_2BIT_C_BASE		0x284
+#define SCALER_SRC_2BIT_SPAN		0x288
+#define SCALER_SRC_2BIT_YSPAN_MASK	(0x7fff << 0)
+#define SCALER_SRC_2BIT_CSPAN_MASK	(0x7fff << 16)
+#define SCALER_SRC_HEADER_YSPAN		0x288
+#define SCALER_SRC_HEADER_CSPAN		0x28C
+
+#define SCALER_DST_2BIT_Y_BASE		0x2A0
+#define SCALER_DST_2BIT_C_BASE		0x2A4
+#define SCALER_DST_2BIT_SPAN		0x2A8
+#define SCALER_DST_2BIT_YSPAN_MASK	(0x7fff << 0)
+#define SCALER_DST_2BIT_CSPAN_MASK	(0x7fff << 16)
+#define SCALER_DST_HEADER_YSPAN		0x2A8
+#define SCALER_DST_HEADER_CSPAN		0x2AC
+
+#define SCALER_FILL_COLOR		0x290
+#define SCALER_ALPHA_FILL_SHIFT		(24)
+
+#define SCALER_TIMEOUT_CTRL		0x2c0
+#define SCALER_TIMEOUT_CNT		0x2c4
+#define SCALER_CLK_REQ			0x2cc
+
+#define SCALER_SRC_YH_INIT_PHASE	0x2d0
+#define SCALER_SRC_YV_INIT_PHASE	0x2d4
+#define SCALER_SRC_CH_INIT_PHASE	0x2d8
+#define SCALER_SRC_CV_INIT_PHASE	0x2dc
+
+/* Scaler System Register */
+#define SCALER_AXI2ACEL_M2M0		0x410
+#define SCALER_AXI2ACEL_M2M1		0x414
+#define SCALER_LLC_NO_HINT		0xFFC0F81F
+#define SCALER_SYSREG_OFFSET(a)		((((a) >> 16) & 0x1) ? \
+					SCALER_AXI2ACEL_M2M0 : SCALER_AXI2ACEL_M2M1)
+
+/* macros to make words to SFR */
+#define SCALER_VAL_WH(w, h)	((((w) & 0x3FFF) << 16) | ((h) & 0x3FFF))
+#define SCALER_VAL_WH_16K(w, h)	((((w) & 0x7FFF) << 16) | ((h) & 0x7FFF))
+#define SCALER_VAL_SRC_POS(l, t) ((((l) & 0x3FFF) << 18) | (((t) & 0x3FFF) << 2))
+#define SCALER_VAL_DST_POS(l, t) ((((l) & 0x3FFF) << 16) | ((t) & 0x3FFF))
+
+static inline void sc_hwset_clk_request(struct sc_dev *sc, bool enable)
+{
+	if (sc->version >= SCALER_VERSION(5, 0, 1))
+		writel(enable ? 1 : 0, sc->regs + SCALER_CLK_REQ);
+}
+
+static inline void sc_hwset_src_pos(struct sc_dev *sc, __s32 left, __s32 top,
+				    unsigned int chshift, unsigned int cvshift)
+{
+	/* SRC pos have fractional part of 2 bits which is not used */
+	__raw_writel(SCALER_VAL_SRC_POS(left, top),
+		     sc->regs + SCALER_SRC_Y_POS);
+	__raw_writel(SCALER_VAL_SRC_POS(left >> chshift, top >> cvshift),
+		     sc->regs + SCALER_SRC_C_POS);
+}
+
+static inline void sc_hwset_src_wh(struct sc_dev *sc, __s32 width, __s32 height,
+				   unsigned int pre_h_ratio, unsigned int pre_v_ratio,
+				   unsigned int chshift, unsigned int cvshift)
+{
+	__s32 pre_width = round_down(width >> pre_h_ratio, 1 << chshift);
+	__s32 pre_height = round_down(height >> pre_v_ratio, 1 << cvshift);
+
+	sc_dbg("width %d, height %d\n", pre_width, pre_height);
+
+	if (sc->variant->prescale) {
+		/*
+		 * crops the width and height if the pre-scaling result violates
+		 * the width/height constraints:
+		 *  - result width or height is not a natural number
+		 *  - result width or height violates the constrains
+		 *    of YUV420/422
+		 */
+		width = pre_width << pre_h_ratio;
+		height = pre_height << pre_v_ratio;
+		if (sc->version < SCALER_VERSION(7, 0, 1)) {
+			__raw_writel(SCALER_VAL_WH(width, height),
+				     sc->regs + SCALER_SRC_PRESC_WH);
+		} else {
+			__raw_writel(SCALER_VAL_WH_16K(width, height),
+				     sc->regs + SCALER_SRC_PRESC_WH);
+		}
+	}
+	if (sc->version < SCALER_VERSION(7, 0, 1)) {
+		__raw_writel(SCALER_VAL_WH(pre_width, pre_height),
+			     sc->regs + SCALER_SRC_WH);
+	} else {
+		__raw_writel(SCALER_VAL_WH_16K(pre_width, pre_height),
+			     sc->regs + SCALER_SRC_WH);
+	}
+}
+
+static inline void sc_hwset_dst_pos(struct sc_dev *sc, __s32 left, __s32 top)
+{
+	__raw_writel(SCALER_VAL_DST_POS(left, top), sc->regs + SCALER_DST_POS);
+}
+
+static inline void sc_hwset_dst_wh(struct sc_dev *sc, __s32 width, __s32 height)
+{
+	if (sc->version < SCALER_VERSION(7, 0, 1))
+		__raw_writel(SCALER_VAL_WH(width, height), sc->regs + SCALER_DST_WH);
+	else
+		__raw_writel(SCALER_VAL_WH_16K(width, height), sc->regs + SCALER_DST_WH);
+}
+
+static inline void sc_hwset_hratio(struct sc_dev *sc, u32 ratio, u32 pre_ratio)
+{
+	__raw_writel((pre_ratio << 28) | ratio, sc->regs + SCALER_H_RATIO);
+}
+
+static inline void sc_hwset_vratio(struct sc_dev *sc, u32 ratio, u32 pre_ratio)
+{
+	__raw_writel((pre_ratio << 28) | ratio, sc->regs + SCALER_V_RATIO);
+}
+
+static inline void sc_hwset_flip_rotation(struct sc_dev *sc, u32 flip_rot_cfg)
+{
+	__raw_writel(flip_rot_cfg & 0xF, sc->regs + SCALER_ROT_CFG);
+}
+
+static inline void sc_hwset_int_en(struct sc_dev *sc)
+{
+	unsigned int val;
+
+	if (sc->version < SCALER_VERSION(3, 0, 0))
+		val = SCALER_INT_EN_ALL;
+	else if (sc->version < SCALER_VERSION(4, 0, 1) ||
+		 sc->version == SCALER_VERSION(4, 2, 0))
+		val = SCALER_INT_EN_ALL_v3;
+	else if (sc->version < SCALER_VERSION(7, 0, 1))
+		val = SCALER_INT_EN_ALL_v4;
+	else
+		val = SCALER_INT_EN_ALL_v7;
+	__raw_writel(val, sc->regs + SCALER_INT_EN);
+}
+
+static inline void sc_clear_aux_power_cfg(struct sc_dev *sc)
+{
+	/* Clearing all power saving features */
+	writel(readl(sc->regs + SCALER_CFG) & ~SCALER_CFG_DRCG_EN,
+	       sc->regs + SCALER_CFG);
+}
+
+static inline void sc_hwset_bus_idle(struct sc_dev *sc)
+{
+	if (sc->version >= SCALER_VERSION(5, 0, 1)) {
+		int cnt = 1000;
+
+		writel(SCALER_CFG_STOP_REQ, sc->regs + SCALER_CFG);
+
+		while (cnt-- > 0)
+			if (readl(sc->regs + SCALER_CFG)
+						& SCALER_CFG_RESET_OKAY)
+				break;
+
+		WARN_ON(cnt <= 0);
+	}
+}
+
+static inline void sc_hwset_init(struct sc_dev *sc)
+{
+	unsigned long cfg;
+
+	sc_hwset_clk_request(sc, true);
+
+#ifdef SC_NO_SOFTRST
+	cfg = (SCALER_CFG_CSC_Y_OFFSET_SRC | SCALER_CFG_CSC_Y_OFFSET_DST);
+#else
+	cfg = SCALER_CFG_SOFT_RST;
+#endif
+	writel(cfg, sc->regs + SCALER_CFG);
+}
+
+static inline void sc_hwset_soft_reset(struct sc_dev *sc)
+{
+	sc_hwset_bus_idle(sc);
+	writel(SCALER_CFG_SOFT_RST, sc->regs + SCALER_CFG);
+}
+
+static inline void sc_hwset_start(struct sc_dev *sc)
+{
+	unsigned long cfg = readl(sc->regs + SCALER_CFG);
+
+	cfg |= SCALER_CFG_START_CMD;
+	if (sc->version >= SCALER_VERSION(3, 0, 1)) {
+		cfg |= SCALER_CFG_CORE_BYP_EN;
+		cfg |= SCALER_CFG_SRAM_CG_EN;
+	}
+	writel(cfg, sc->regs + SCALER_CFG);
+}
+
+u32 sc_hwget_and_clear_irq_status(struct sc_dev *sc);
+
+#define SCALER_FRACT_VAL(x)		((x) << (20 - SC_CROP_FRACT_MULTI))
+#define SCALER_INIT_PHASE_VAL(i, f)	(((i) & 0xf << 20) | \
+					((SCALER_FRACT_VAL(f)) & 0xfffff))
+static inline void sc_hwset_src_init_phase(struct sc_dev *sc, struct sc_init_phase *ip)
+{
+	if (ip->yh) {
+		__raw_writel(SCALER_INIT_PHASE_VAL(0, ip->yh),
+			     sc->regs + SCALER_SRC_YH_INIT_PHASE);
+		__raw_writel(SCALER_INIT_PHASE_VAL(0, ip->ch),
+			     sc->regs + SCALER_SRC_CH_INIT_PHASE);
+		sc_dbg("initial phase value is yh 0x%x, ch 0x%x\n",
+		       SCALER_FRACT_VAL(ip->yh), SCALER_FRACT_VAL(ip->ch));
+	}
+
+	if (ip->yv) {
+		__raw_writel(SCALER_INIT_PHASE_VAL(0, ip->yv),
+			     sc->regs + SCALER_SRC_YV_INIT_PHASE);
+		__raw_writel(SCALER_INIT_PHASE_VAL(0, ip->cv),
+			     sc->regs + SCALER_SRC_CV_INIT_PHASE);
+		sc_dbg("initial phase value is yv 0x%x, cv 0x%x\n",
+		       SCALER_FRACT_VAL(ip->yv), SCALER_FRACT_VAL(ip->cv));
+	}
+}
+
+void sc_hwset_polyphase_hcoef(struct sc_dev *sc,
+			      unsigned int yratio, unsigned int cratio, unsigned int filter);
+void sc_hwset_polyphase_vcoef(struct sc_dev *sc,
+			      unsigned int yratio, unsigned int cratio, unsigned int filter);
+
+#endif /*__SCALER_REGS_H__*/
diff --git a/drivers/media/platform/samsung/v920-scaler/scaler.h b/drivers/media/platform/samsung/v920-scaler/scaler.h
new file mode 100644
index 000000000000..de6e2c42d277
--- /dev/null
+++ b/drivers/media/platform/samsung/v920-scaler/scaler.h
@@ -0,0 +1,621 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019 Samsung Electronics Co., Ltd. All Rights Reserved
+ *		http://www.samsung.com
+ *
+ * Header file for Exynos Scaler driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef SCALER__H_
+#define SCALER__H_
+
+#include <linux/delay.h>
+#include <linux/sched.h>
+#include <linux/timer.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+#include "videodev2_exynos_media.h"
+#include <linux/io.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ctrls.h>
+#if IS_ENABLED(CONFIG_EXYNOS_ITMON)
+#include <soc/samsung/exynos-itmon.h>
+#endif
+#define SC_LOG_LEVEL	0
+
+#if SC_LOG_LEVEL
+#define sc_dbg(fmt, args...)\
+	pr_info("[%s:%d] " fmt, __func__, __LINE__, ##args)
+#else
+#define sc_dbg(...)\
+	do {}  while (0)
+#endif
+
+#define MODULE_NAME		"exynos5-scaler"
+#define SC_MAX_DEVS		1
+#define SC_TIMEOUT		(2 * HZ)	/* 2 seconds */
+#define SC_WDT_CNT		3
+#define SC_MAX_CTRL_NUM		11
+#define SC_MAX_CTX_NUM		64
+#define SC_MAX_PLANES		3
+/* Address index */
+#define SC_ADDR_RGB		0
+#define SC_ADDR_Y		0
+#define SC_ADDR_CB		1
+#define SC_ADDR_CBCR		1
+#define SC_ADDR_CR		2
+
+/* Scaler hardware device state */
+#define DEV_RUN		1
+#define DEV_SUSPEND	2
+#define DEV_CP		4 /* contents path protection */
+
+/* Scaler m2m context state */
+#define CTX_PARAMS	1
+#define CTX_STREAMING	2
+#define CTX_RUN		3
+#define CTX_ABORT	4
+#define CTX_SRC_FMT	5
+#define CTX_DST_FMT	6
+#define CTX_INT_FRAME	7 /* intermediate frame available */
+#define CTX_INT_FRAME_CP 8 /* intermediate frame available */
+
+/* CSC equation */
+#define SC_CSC_NARROW	0
+#define SC_CSC_WIDE	1
+
+/* Scaler Crop Fixed Point value */
+#define SC_CROP_FRACT_SHIFT	15
+#define SC_CROP_FRACT_MULTI	16
+#define SC_CROP_FRACT_MASK	((1 << SC_CROP_FRACT_MULTI) - 1)
+#define SC_CROP_INT_MASK	((1 << SC_CROP_FRACT_SHIFT) - 1)
+#define SC_CROP_GET_FR_VAL(x)	(((x) >> SC_CROP_FRACT_SHIFT) & SC_CROP_FRACT_MASK)
+#define SC_CROP_MAKE_FR_VAL(i, f)	((((f) & SC_CROP_FRACT_MASK) \
+			<< SC_CROP_FRACT_SHIFT) | ((i) & SC_CROP_INT_MASK))
+
+#define fh_to_sc_ctx(__fh)	container_of(__fh, struct sc_ctx, fh)
+#define sc_fmt_is_rgb888(x)			\
+({						\
+		typeof(x) _x = (x);		\
+		(((_x) == V4L2_PIX_FMT_RGB32) ||\
+		((_x) == V4L2_PIX_FMT_BGR32));	\
+})
+
+#define sc_fmt_is_yuv422(x)				\
+({							\
+		typeof(x) _x = (x);			\
+		(((_x) == V4L2_PIX_FMT_YUYV) ||		\
+		((_x) == V4L2_PIX_FMT_UYVY) ||		\
+		((_x) == V4L2_PIX_FMT_YVYU) ||		\
+		((_x) == V4L2_PIX_FMT_YUV422P) ||	\
+		((_x) == V4L2_PIX_FMT_NV16) ||		\
+		((_x) == V4L2_PIX_FMT_NV61));		\
+})
+
+#define sc_fmt_is_yuv420(x)				\
+({							\
+		typeof(x) _x = (x);			\
+		(((_x) == V4L2_PIX_FMT_YUV420) ||	\
+		((_x) == V4L2_PIX_FMT_YVU420) ||	\
+		((_x) == V4L2_PIX_FMT_NV12) ||		\
+		((_x) == V4L2_PIX_FMT_NV21) ||		\
+		((_x) == V4L2_PIX_FMT_NV12M) ||		\
+		((_x) == V4L2_PIX_FMT_NV21M) ||		\
+		((_x) == V4L2_PIX_FMT_YUV420M) ||	\
+		((_x) == V4L2_PIX_FMT_YVU420M) ||	\
+		((_x) == V4L2_PIX_FMT_NV12MT_16X16));	\
+})
+
+#define sc_fmt_is_ayv12(x)	((x) == V4L2_PIX_FMT_YVU420)
+#define sc_fmt_is_422p(x)				\
+({							\
+		typeof(x) _x = (x);			\
+		(((_x) == V4L2_PIX_FMT_YUV422P) ||	\
+		((_x) == V4L2_PIX_FMT_YUV422M));		\
+})
+
+#define sc_dith_val(a, b, c)	(((a) << SCALER_DITH_R_SHIFT) |	\
+		((b) << SCALER_DITH_G_SHIFT) | ((c) << SCALER_DITH_B_SHIFT))
+
+#define SCALER_VERSION(x, y, z) (((x) << 16) | ((y) << 8) | (z))
+
+#define SC_FMT_PREMULTI_FLAG	10
+
+/* for blend operation */
+#define V4L2_CID_GLOBAL_ALPHA		(V4L2_CID_EXYNOS_BASE + 1)
+#define V4L2_CID_2D_BLEND_OP		(V4L2_CID_EXYNOS_BASE + 103)
+#define V4L2_CID_2D_COLOR_FILL		(V4L2_CID_EXYNOS_BASE + 104)
+#define V4L2_CID_2D_DITH		(V4L2_CID_EXYNOS_BASE + 105)
+#define V4L2_CID_2D_FMT_PREMULTI	(V4L2_CID_EXYNOS_BASE + 106)
+#define V4L2_CID_2D_ALPHA_FILL		(V4L2_CID_EXYNOS_BASE + 107)
+
+/* for performance */
+#define SC_CID_FRAMERATE		(V4L2_CID_EXYNOS_BASE + 110)
+
+/* for scaler context priority setting and getting */
+#define SC_CID_CTX_PRIORITY_SETTING	(V4L2_CID_EXYNOS_BASE + 310)
+
+enum {
+	SC_CTX_DEFAULT_PRIO,
+	SC_CTX_LOW_PRIO = SC_CTX_DEFAULT_PRIO,
+	SC_CTX_HIGH_PRIO,
+};
+
+#define SC_FRAMERATE_MAX		(500)
+
+/* for denoising filter */
+#define SC_CID_DNOISE_FT		(V4L2_CID_EXYNOS_BASE + 150)
+
+#define SC_M2M1SHOT_OP_FILTER_SHIFT    (28)
+#define SC_M2M1SHOT_OP_FILTER_MASK     (0xf << 28)
+
+enum sc_csc_cspan_align {
+	ALIGN_DEFAULT,
+	ALIGN_8BYTES,
+	ALIGN_16BYTES,
+	ALIGN_32BYTES,
+	ALIGN_64BYTES,
+	ALIGN_128BYTES,
+	ALIGN_256BYTES,
+	ALIGN_RESERVED,
+};
+
+enum sc_csc_idx {
+	NO_CSC,
+	CSC_Y2R,
+	CSC_R2Y,
+};
+
+struct sc_csc_tab {
+	int narrow_601[9];
+	int wide_601[9];
+	int narrow_709[9];
+	int wide_709[9];
+	int narrow_2020[9];
+	int wide_2020[9];
+};
+
+enum sc_clk_status {
+	SC_CLK_ON,
+	SC_CLK_OFF,
+};
+
+enum sc_clocks {
+	SC_GATE_CLK,
+	SC_CHLD_CLK,
+	SC_PARN_CLK
+};
+
+enum sc_dith {
+	SC_DITH_NO,
+	SC_DITH_8BIT,
+	SC_DITH_6BIT,
+	SC_DITH_5BIT,
+	SC_DITH_4BIT,
+};
+
+/*
+ * blending operation
+ * The order is from Android PorterDuff.java
+ */
+enum sc_blend_op {
+	/* [0, 0] */
+	BL_OP_CLR = 1,
+	/* [Sa, Sc] */
+	BL_OP_SRC,
+	/* [Da, Dc] */
+	BL_OP_DST,
+	/* [Sa + (1 - Sa)*Da, Rc = Sc + (1 - Sa)*Dc] */
+	BL_OP_SRC_OVER,
+	/* [Sa + (1 - Sa)*Da, Rc = Dc + (1 - Da)*Sc] */
+	BL_OP_DST_OVER,
+	/* [Sa * Da, Sc * Da] */
+	BL_OP_SRC_IN,
+	/* [Sa * Da, Sa * Dc] */
+	BL_OP_DST_IN,
+	/* [Sa * (1 - Da), Sc * (1 - Da)] */
+	BL_OP_SRC_OUT,
+	/* [Da * (1 - Sa), Dc * (1 - Sa)] */
+	BL_OP_DST_OUT,
+	/* [Da, Sc * Da + (1 - Sa) * Dc] */
+	BL_OP_SRC_ATOP,
+	/* [Sa, Sc * (1 - Da) + Sa * Dc ] */
+	BL_OP_DST_ATOP,
+	/* [-(Sa * Da), Sc * (1 - Da) + (1 - Sa) * Dc] */
+	BL_OP_XOR,
+	/* [Sa + Da - Sa*Da, Sc*(1 - Da) + Dc*(1 - Sa) + min(Sc, Dc)] */
+	BL_OP_DARKEN,
+	/* [Sa + Da - Sa*Da, Sc*(1 - Da) + Dc*(1 - Sa) + max(Sc, Dc)] */
+	BL_OP_LIGHTEN,
+	/** [Sa * Da, Sc * Dc] */
+	BL_OP_MULTIPLY,
+	/* [Sa + Da - Sa * Da, Sc + Dc - Sc * Dc] */
+	BL_OP_SCREEN,
+	/* Saturate(S + D) */
+	BL_OP_ADD,
+};
+
+/*
+ * Co = <src color op> * Cs + <dst color op> * Cd
+ * Ao = <src_alpha_op> * As + <dst_color_op> * Ad
+ */
+#define BL_INV_BIT_OFFSET	0x10
+
+enum sc_bl_comp {
+	ONE = 0,
+	SRC_A,
+	SRC_C,
+	DST_A,
+	SRC_GA = 0x5,
+	INV_SA = 0x11,
+	INV_SC,
+	INV_DA,
+	INV_SAGA = 0x17,
+	ZERO = 0xff,
+};
+
+struct sc_bl_op_val {
+	u32 src_color;
+	u32 src_alpha;
+	u32 dst_color;
+	u32 dst_alpha;
+};
+
+/*
+ * struct sc_size_limit - Scaler variant size information
+ *
+ * @min_w: minimum pixel width size
+ * @min_h: minimum pixel height size
+ * @max_w: maximum pixel width size
+ * @max_h: maximum pixel height size
+ */
+struct sc_size_limit {
+	u16 min_w;
+	u16 min_h;
+	u16 max_w;
+	u16 max_h;
+};
+
+struct sc_variant {
+	struct sc_size_limit limit_input;
+	struct sc_size_limit limit_output;
+	u32 version;
+	u32 sc_up_max;
+	u32 sc_down_min;
+	u32 sc_up_swmax;
+	u32 sc_down_swmin;
+	u8 blending:1;
+	u8 prescale:1;
+	u8 ratio_20bit:1;
+	u8 initphase:1;
+	u8 pixfmt_10bit:1;
+	u8 extra_buf:1;
+	u8 color_fill:1;
+};
+
+/*
+ * struct sc_fmt - the driver's internal color format data
+ * @name: format description
+ * @pixelformat: the fourcc code for this format, 0 if not applicable
+ * @num_planes: number of physically non-contiguous data planes
+ * @num_comp: number of color components(ex. RGB, Y, Cb, Cr)
+ * @h_div: horizontal division value of C against Y for crop
+ * @v_div: vertical division value of C against Y for crop
+ * @bitperpixel: bits per pixel
+ * @color: the corresponding sc_color_fmt
+ */
+struct sc_fmt {
+	char	*name;
+	u32	pixelformat;
+	u32	cfg_val;
+	u8	bitperpixel[SC_MAX_PLANES];
+	u8	num_planes:2;
+	u8	num_comp:2;
+	u8	h_shift:1;
+	u8	v_shift:1;
+	u8	is_rgb:1;
+	u8	cspan:1;
+};
+
+enum {
+	SC_PLANE_Y = 0,
+	SC_PLANE_CB,
+	SC_PLANE_CR,
+};
+
+struct sc_addr {
+	dma_addr_t	ioaddr[SC_MAX_PLANES];
+	unsigned int	size[SC_MAX_PLANES];
+};
+
+/*
+ * struct sc_frame - source/target frame properties
+ * @fmt:	buffer format(like virtual screen)
+ * @crop:	image size / position
+ * @addr:	buffer start address(access using SC_ADDR_XXX)
+ * @bytesused:	image size in bytes (w x h x bpp)
+ */
+struct sc_frame {
+	const struct sc_fmt		*sc_fmt;
+	unsigned short		width;
+	unsigned short		height;
+	__u32			pixelformat;
+	struct v4l2_rect	crop;
+
+	struct sc_addr			addr;
+	__u32			cspanalign;
+	__u32			yspanalign;
+	__u32			bytesused[SC_MAX_PLANES];
+	__u8			byte32num;
+	bool			pre_multi;
+};
+
+struct sc_int_frame {
+	struct sc_frame			frame;
+	struct sc_addr			src_addr;
+	struct sc_addr			dst_addr;
+	struct sg_table			*sgt[3];
+	struct dma_buf			*dma_buf[3];
+	struct dma_buf_attachment	*attachment[3];
+	struct dma_heap			*dma_heap;
+};
+
+/*
+ * struct sc_m2m_device - v4l2 memory-to-memory device data
+ * @v4l2_dev: v4l2 device
+ * @vfd: the video device node
+ * @m2m_dev: v4l2 memory-to-memory device data
+ * @in_use: the open count
+ */
+struct sc_m2m_device {
+	struct v4l2_device	v4l2_dev;
+	struct video_device	*vfd;
+	struct v4l2_m2m_dev	*m2m_dev_lp;	/* Low priority m2m_dev, also for default */
+	struct v4l2_m2m_dev	*m2m_dev_hp;	/* High priority m2m_dev */
+	atomic_t		in_use;
+};
+
+struct sc_wdt {
+	struct timer_list	timer;
+	atomic_t		cnt;
+};
+
+struct sc_csc {
+	unsigned int		csc_eq;
+	bool			csc_range;
+};
+
+struct sc_init_phase {
+	u32			yh;
+	u32			yv;
+	u32			ch;
+	u32			cv;
+	u32			w;
+	u32			h;
+};
+
+enum sc_ft {
+	SC_FT_NONE = 0,
+	SC_FT_BLUR,
+	SC_FT_240,
+	SC_FT_480,
+	SC_FT_720,
+	SC_FT_960,
+	SC_FT_1080,
+	SC_FT_MAX,
+};
+
+struct sc_dnoise_filter {
+	u32			strength;
+	u32			w;
+	u32			h;
+};
+
+struct sc_qos_table {
+	unsigned int freq_mif;
+	unsigned int freq_int;
+	unsigned int data_size;
+};
+
+struct sc_ppc_table {
+	unsigned int bpp;
+	unsigned int ppc[2];
+};
+
+struct sc_ctx;
+
+/*
+ * struct sc_dev - the abstraction for Rotator device
+ * @dev:	pointer to the Rotator device
+ * @variant:	the IP variant information
+ * @m2m:	memory-to-memory V4L2 device information
+ * @aclk:	aclk required for scaler operation
+ * @pclk:	pclk required for scaler operation
+ * @clk_chld:	child clk of mux required for scaler operation
+ * @clk_parn:	parent clk of mux required for scaler operation
+ * @regs:	the mapped hardware registers
+ * @regs_res:	the resource claimed for IO registers
+ * @wait:	interrupt handler waitqueue
+ * @ws:		work struct
+ * @state:	device state flags
+ * @alloc_ctx:	videobuf2 memory allocator context
+ * @slock:	the spinlock pscecting this data structure
+ * @lock:	the mutex pscecting this data structure
+ * @wdt:	watchdog timer information
+ * @version:	IP version number
+ * @cfw:	cfw flag
+ * @pb_disable:       prefetch-buffer disable flag
+ * @itmon_nb:	structure object of itmon notifier
+ * @s2mpu_nb:	structure object of s2mpu notifier
+ */
+struct sc_dev {
+	struct device			*dev;
+	const struct sc_variant		*variant;
+	struct sc_m2m_device		m2m;
+	struct clk			*aclk;
+	struct clk			*pclk;
+	struct clk			*clk_chld;
+	struct clk			*clk_parn;
+	void __iomem			*regs;
+	struct resource			*regs_res;
+	struct workqueue_struct		*qosclr_int_wq;
+	wait_queue_head_t		wait;
+	unsigned long			state;
+	struct vb2_alloc_ctx		*alloc_ctx;
+	/* protects access to irqsave */
+	spinlock_t			slock;
+	/* protects access to sc_dev */
+	struct mutex			lock;
+	struct sc_wdt			wdt;
+	/* protects access to context list */
+	spinlock_t			ctxlist_lock;
+	struct sc_ctx			*current_ctx;
+
+	struct list_head		ctx_list_high_prio; /* for sc_ctx_abs.node */
+	struct list_head		ctx_list_low_prio; /* for sc_ctx_abs.node */
+
+#if IS_ENABLED(CONFIG_EXYNOS_PM_QOS) || \
+		IS_ENABLED(CONFIG_EXYNOS_PM_QOS_MODULE) && \
+		defined(NEVER_DEFINED)
+	struct exynos_pm_qos_request	qosreq_int;
+#endif
+	s32				qosreq_int_level;
+	int				dev_id;
+	u32				version;
+	bool				pb_disable;
+	u32				cfw;
+	struct sc_qos_table		*qos_table;
+	struct sc_ppc_table		*ppc_table;
+	int qos_table_cnt;
+	int ppc_table_cnt;
+	struct notifier_block itmon_nb;
+	u64				fence_context;
+	atomic_t			fence_timeline;
+	/* protects access to fence */
+	spinlock_t			fence_lock;
+	u32				s2mpu_addr;
+	void __iomem			*sysreg;
+	u32				sysreg_offset;
+	struct notifier_block s2mpu_nb;
+};
+
+enum SC_CONTEXT_TYPE {
+	SC_CTX_V4L2_TYPE,
+	SC_CTX_M2M1SHOT_TYPE
+};
+
+struct sc_qos_request { };
+
+/*
+ * sc_ctx - the abstration for Rotator open context
+ * @node:		list to be added to sc_dev.context_list
+ * @context_type	determines if the context is @m2m_ctx or @m21_ctx.
+ * @sc_dev:		the Rotator device this context applies to
+ * @m2m_ctx:		memory-to-memory device context
+ * @frame:		source frame properties
+ * @ctrl_handler:	v4l2 controls handler
+ * @fh:			v4l2 file handle
+ * @flip_rot_cfg:	rotation and flip configuration
+ * @bl_op:		image blend mode
+ * @dith:		image dithering mode
+ * @g_alpha:		global alpha value
+ * @color_fill:		enable color fill
+ * @flags:		context state flags
+ * @pre_multi:		pre-multiplied format
+ * @csc:		csc equation value
+ */
+struct sc_ctx {
+	struct list_head		node;
+	enum SC_CONTEXT_TYPE		context_type;
+	struct sc_dev			*sc_dev;
+	union {
+		struct v4l2_m2m_ctx	*m2m_ctx;
+	};
+	struct sc_frame			s_frame;
+	struct sc_int_frame		*i_frame;
+	struct sc_frame			d_frame;
+	struct v4l2_ctrl_handler	ctrl_handler;
+	union {
+		struct v4l2_fh		fh;
+	};
+	u32				flip_rot_cfg; /* SCALER_ROT_CFG */
+	enum sc_blend_op		bl_op;
+	u32				dith;
+	u32				g_alpha;
+	u32				color_fill;
+	bool				color_fill_enabled;
+	unsigned int			h_ratio;
+	unsigned int			v_ratio;
+	unsigned int			pre_h_ratio;
+	unsigned int			pre_v_ratio;
+	unsigned long			flags;
+	bool				pre_multi;
+	bool				cp_enabled;
+	struct sc_csc			csc;
+	struct sc_init_phase		init_phase;
+	struct sc_dnoise_filter		dnoise_ft;
+	struct sc_qos_request		pm_qos;
+	int				pm_qos_lv;
+	int				framerate;
+	int				priority;
+};
+
+static inline struct sc_frame *ctx_get_frame(struct sc_ctx *ctx,
+					     enum v4l2_buf_type type)
+{
+	struct sc_frame *frame;
+
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		frame = &ctx->s_frame;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		frame = &ctx->d_frame;
+		break;
+	default:
+		dev_err(ctx->sc_dev->dev,
+			"Wrong V4L2 buffer type %d\n", type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return frame;
+}
+
+int sc_hwset_src_image_format(struct sc_dev *sc, struct sc_frame *frame);
+int sc_hwset_dst_image_format(struct sc_dev *sc, struct sc_frame *frame);
+void sc_hwset_pre_multi_format(struct sc_dev *sc, bool src, bool dst);
+void sc_hwset_blend(struct sc_dev *sc, enum sc_blend_op bl_op, bool pre_multi,
+		    unsigned char g_alpha);
+void sc_hwset_color_fill(struct sc_dev *sc, unsigned int val);
+void sc_hwset_dith(struct sc_dev *sc, unsigned int val);
+void sc_hwset_csc_coef(struct sc_dev *sc, enum sc_csc_idx idx,
+		       struct sc_csc *csc);
+void sc_hwset_src_imgsize(struct sc_dev *sc, struct sc_frame *frame);
+void sc_hwset_dst_imgsize(struct sc_dev *sc, struct sc_frame *frame);
+void sc_hwset_src_crop(struct sc_dev *sc, struct v4l2_rect *rect,
+		       const struct sc_fmt *fmt,
+		       unsigned int pre_h_ratio, unsigned int pre_v_ratio);
+void sc_hwset_dst_crop(struct sc_dev *sc, struct v4l2_rect *rect);
+void sc_hwset_src_addr(struct sc_dev *sc, struct sc_frame *frame);
+void sc_hwset_dst_addr(struct sc_dev *sc, struct sc_frame *frame);
+void sc_hwset_hcoef(struct sc_dev *sc, unsigned int coef);
+void sc_hwset_vcoef(struct sc_dev *sc, unsigned int coef);
+
+void sc_hwset_intsrc_imgsize(struct sc_dev *sc, int num_comp, __u32 width);
+void sc_get_span(struct sc_frame *frame, u32 *yspan, u32 *cspan);
+void get_blend_value(unsigned int *cfg, u32 val, bool pre_multi);
+struct v4l2_m2m_dev *sc_get_m2m_dev(struct sc_ctx *ctx);
+int sc_calc_s10b_planesize(u32 pixelformat, u32 width, u32 height,
+			   u32 *ysize, u32 *csize, bool only_8bit, u8 byte32num);
+#endif /* SCALER__H_ */
diff --git a/drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h b/drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h
new file mode 100644
index 000000000000..3ed957fee912
--- /dev/null
+++ b/drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Video for Linux Two header file for Exynos
+ *
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This header file contains several v4l2 APIs to be proposed to v4l2
+ * community and until being accepted, will be used restrictly for Exynos.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __LINUX_VIDEODEV2_EXYNOS_MEDIA_H
+#define __LINUX_VIDEODEV2_EXYNOS_MEDIA_H
+
+#include <linux/videodev2.h>
+
+/*
+ *	C O N T R O L S
+ */
+/* CID base for Exynos controls (USER_CLASS) */
+#define V4L2_CID_EXYNOS_BASE		(V4L2_CTRL_CLASS_USER | 0x2000)
+
+/* cacheable configuration */
+#define V4L2_CID_CACHEABLE		(V4L2_CID_EXYNOS_BASE + 10)
+
+/* for color space conversion equation selection */
+#define V4L2_CID_CSC_EQ_MODE		(V4L2_CID_EXYNOS_BASE + 100)
+#define V4L2_CID_CSC_EQ			(V4L2_CID_EXYNOS_BASE + 101)
+#define V4L2_CID_CSC_RANGE		(V4L2_CID_EXYNOS_BASE + 102)
+
+/* for scaler color space conversion C width span setting */
+#define V4L2_SC_CID_SRC_CSPAN	(V4L2_CID_EXYNOS_BASE + 111)
+#define V4L2_SC_CID_DST_CSPAN	(V4L2_CID_EXYNOS_BASE + 112)
+#define V4L2_SC_CID_SRC_YSPAN	(V4L2_CID_EXYNOS_BASE + 113)
+#define V4L2_SC_CID_DST_YSPAN	(V4L2_CID_EXYNOS_BASE + 114)
+
+/* for DRM playback scenario */
+#define V4L2_CID_CONTENT_PROTECTION	(V4L2_CID_EXYNOS_BASE + 201)
+
+/*
+ *	V I D E O   I M A G E   F O R M A T
+ */
+/* 1 plane -- one Y, one Cb + Cr interleaved, non contiguous  */
+#define V4L2_PIX_FMT_NV12N		v4l2_fourcc('N', 'N', '1', '2')
+#define V4L2_PIX_FMT_NV12NT		v4l2_fourcc('T', 'N', '1', '2')
+
+/* 1 plane -- one Y, one Cb, one Cr, non contiguous */
+#define V4L2_PIX_FMT_YUV420N		v4l2_fourcc('Y', 'N', '1', '2')
+
+/* 1 plane -- 8bit Y, 2bit Y, 8bit Cb + Cr interleaved, 2bit Cb + Cr interleaved, non contiguous */
+#define V4L2_PIX_FMT_NV12N_10B		v4l2_fourcc('B', 'N', '1', '2')
+#define V4L2_PIX_FMT_NV12M_S10B		v4l2_fourcc('B', 'M', '1', '2')
+#define V4L2_PIX_FMT_NV21M_S10B		v4l2_fourcc('B', 'M', '2', '1')
+#define V4L2_PIX_FMT_NV16M_S10B		v4l2_fourcc('B', 'M', '1', '6')
+#define V4L2_PIX_FMT_NV61M_S10B		v4l2_fourcc('B', 'M', '6', '1')
+#define V4L2_PIX_FMT_NV12M_P010		v4l2_fourcc('P', 'M', '1', '2')
+#define V4L2_PIX_FMT_NV21M_P010		v4l2_fourcc('P', 'M', '2', '1')
+#define V4L2_PIX_FMT_NV16M_P210		v4l2_fourcc('P', 'M', '1', '6')
+#define V4L2_PIX_FMT_NV61M_P210		v4l2_fourcc('P', 'M', '6', '1')
+
+#define V4L2_PIX_FMT_NV12N_P010		v4l2_fourcc('N', 'P', '1', '2')
+#define V4L2_PIX_FMT_NV12_P010		v4l2_fourcc('P', 'N', '1', '2')
+
+#define V4L2_PIX_FMT_ARGB2101010	v4l2_fourcc('A', 'R', '3', '0')
+#define V4L2_PIX_FMT_ABGR2101010	v4l2_fourcc('A', 'R', '1', '0')
+#define V4L2_PIX_FMT_RGBA1010102	v4l2_fourcc('R', 'A', '3', '0')
+#define V4L2_PIX_FMT_BGRA1010102	v4l2_fourcc('B', 'A', '1', '0')
+
+/* 12 Y/CbCr 4:2:0 SBWC */
+#define V4L2_PIX_FMT_NV12M_SBWC_8B	v4l2_fourcc('M', '1', 'S', '8')
+#define V4L2_PIX_FMT_NV12M_SBWC_10B	v4l2_fourcc('M', '1', 'S', '1')
+
+/* 21 Y/CrCb 4:2:0 SBWC */
+#define V4L2_PIX_FMT_NV21M_SBWC_8B	v4l2_fourcc('M', '2', 'S', '8')
+#define V4L2_PIX_FMT_NV21M_SBWC_10B	v4l2_fourcc('M', '2', 'S', '1')
+#define V4L2_PIX_FMT_NV12N_SBWC_256_8B	v4l2_fourcc('N', '1', 'S', '6')
+#define V4L2_PIX_FMT_NV12N_SBWC_256_10B	v4l2_fourcc('N', '1', 'S', '7')
+
+/* 12 Y/CbCr 4:2:0 SBWC single */
+#define V4L2_PIX_FMT_NV12N_SBWC_8B	v4l2_fourcc('N', '1', 'S', '8')
+#define V4L2_PIX_FMT_NV12N_SBWC_10B	v4l2_fourcc('N', '1', 'S', '1')
+
+/* 12 Y/CbCr 4:2:0 SBWC Lossy */
+#define V4L2_PIX_FMT_NV12M_SBWCL_8B	v4l2_fourcc('M', '1', 'L', '8')
+#define V4L2_PIX_FMT_NV12M_SBWCL_10B	v4l2_fourcc('M', '1', 'L', '1')
+
+/* 12 Y/CbCr 4:2:0 SBWC Lossy single */
+#define V4L2_PIX_FMT_NV12N_SBWCL_8B	v4l2_fourcc('N', '1', 'L', '8')
+#define V4L2_PIX_FMT_NV12N_SBWCL_10B	v4l2_fourcc('N', '1', 'L', '1')
+
+/* 12 Y/CbCr 4:2:0 SBWC Lossy v2.7 32B/64B align */
+#define V4L2_PIX_FMT_NV12M_SBWCL_32_8B	v4l2_fourcc('M', '1', 'L', '3')
+#define V4L2_PIX_FMT_NV12M_SBWCL_32_10B	v4l2_fourcc('M', '1', 'L', '4')
+#define V4L2_PIX_FMT_NV12M_SBWCL_64_8B	v4l2_fourcc('M', '1', 'L', '6')
+#define V4L2_PIX_FMT_NV12M_SBWCL_64_10B	v4l2_fourcc('M', '1', 'L', '7')
+
+/* 12 Y/CbCr 4:2:0 SBWC Lossy v2.7 single 32B/64B align */
+#define V4L2_PIX_FMT_NV12N_SBWCL_32_8B	v4l2_fourcc('N', '1', 'L', '3')
+#define V4L2_PIX_FMT_NV12N_SBWCL_32_10B	v4l2_fourcc('N', '1', 'L', '4')
+#define V4L2_PIX_FMT_NV12N_SBWCL_64_8B	v4l2_fourcc('N', '1', 'L', '6')
+#define V4L2_PIX_FMT_NV12N_SBWCL_64_10B	v4l2_fourcc('N', '1', 'L', '7')
+
+/* helper macros */
+#ifndef __ALIGN_UP
+#define __ALIGN_UP(x, a) ({			\
+		typeof(a) _a = (a);		\
+		(((x) + (_a - 1)) & ~(_a - 1));	\
+})
+#endif
+
+#define NV12N_Y_SIZE(w, h)		(__ALIGN_UP((w), 16) * __ALIGN_UP((h), 16))
+#define NV12N_CBCR_SIZE(w, h)		(__ALIGN_UP((__ALIGN_UP((w), 16) * \
+					(__ALIGN_UP((h), 16) / 2)), 16))
+#define NV12N_CBCR_BASE(base, w, h)	((base) + NV12N_Y_SIZE((w), (h)))
+#define NV12N_10B_Y_8B_SIZE(w, h)	(__ALIGN_UP((w), 64) * \
+					__ALIGN_UP((h), 16) + 256)
+#define NV12N_10B_Y_2B_SIZE(w, h)	((__ALIGN_UP((w) / 4, 16) * \
+					__ALIGN_UP((h), 16) + 64))
+#define NV12N_10B_CBCR_8B_SIZE(w, h)	(__ALIGN_UP((__ALIGN_UP((w), 64) * \
+					(__ALIGN_UP((h), 16) / 2) + 256), 16))
+#define NV12N_10B_CBCR_2B_SIZE(w, h)	((__ALIGN_UP((w) / 4, 16) * \
+					(__ALIGN_UP((h), 16) / 2) + 64))
+#define NV12N_10B_CBCR_BASE(base, w, h)	({			\
+		typeof(w) _w = (w);				\
+		typeof(h) _h = (h);				\
+		((base) + NV12N_10B_Y_8B_SIZE((_w), (_h))	\
+		+ NV12N_10B_Y_2B_SIZE((_w), (_h)));		\
+})
+
+#define YUV420N_Y_SIZE(w, h)		(__ALIGN_UP((w), 16) * \
+					__ALIGN_UP((h), 16) + 256)
+#define YUV420N_CB_SIZE(w, h)		(__ALIGN_UP((__ALIGN_UP((w) / 2, 16) * \
+					(__ALIGN_UP((h), 16) / 2) + 256), 16))
+#define YUV420N_CR_SIZE(w, h)		(__ALIGN_UP((__ALIGN_UP((w) / 2, 16) * \
+					(__ALIGN_UP((h), 16) / 2) + 256), 16))
+#define YUV420N_CB_BASE(base, w, h)	((base) + YUV420N_Y_SIZE((w), (h)))
+#define YUV420N_CR_BASE(base, w, h) ({			\
+		typeof(w) _w = (w);			\
+		typeof(h) _h = (h);			\
+		YUV420N_CB_BASE((base), (_w), (_h)) +	\
+		YUV420N_CB_SIZE((_w), (_h));		\
+})
+
+#define NV12M_Y_SIZE(w, h)		(__ALIGN_UP((w), 64) * __ALIGN_UP((h), 16) + 256)
+#define NV12M_CBCR_SIZE(w, h)		((__ALIGN_UP((w), 64) * __ALIGN_UP((h), 16) / 2) + 256)
+#define NV12M_Y_2B_SIZE(w, h)		(__ALIGN_UP(((w) / 4), 16) * __ALIGN_UP((h), 16) + 256)
+#define NV12M_CBCR_2B_SIZE(w, h)	((__ALIGN_UP(((w) / 4), 16) * \
+					__ALIGN_UP((h), 16) / 2) + 256)
+
+#define NV16M_Y_SIZE(w, h)		(__ALIGN_UP((w), 64) * __ALIGN_UP((h), 16) + 256)
+#define NV16M_CBCR_SIZE(w, h)		(__ALIGN_UP((w), 64) * __ALIGN_UP((h), 16) + 256)
+#define NV16M_Y_2B_SIZE(w, h)		(__ALIGN_UP(((w) / 4), 16) * __ALIGN_UP((h), 16) + 256)
+#define NV16M_CBCR_2B_SIZE(w, h)	(__ALIGN_UP(((w) / 4), 16) * __ALIGN_UP((h), 16) + 256)
+
+#define S10B_8B_STRIDE(w)		(__ALIGN_UP((w), 64))
+#define S10B_2B_STRIDE(w)		(__ALIGN_UP((((w) + 3) / 4), 16))
+
+#endif /* __LINUX_VIDEODEV2_EXYNOS_MEDIA_H */
-- 
2.25.1

