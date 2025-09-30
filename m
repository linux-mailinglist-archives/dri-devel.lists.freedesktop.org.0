Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CEABAB7AA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFA910E4D7;
	Tue, 30 Sep 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="RYgGLehD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD6910E276
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:11 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035640epoutp038cff86e50db55b1ff2a3ff292b5b0e59~p80NWdyqC3243732437epoutp03F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035640epoutp038cff86e50db55b1ff2a3ff292b5b0e59~p80NWdyqC3243732437epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204600;
 bh=iZRhKuwFGLe8CYtxJ0WD69+dHVtPRw6ZjzKWW6B4V8o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RYgGLehDs0Im3C23Ayc26xaL/b/FyIUxfibQMgCHZkr1eIYXNXaRwtGGM75mPZvRl
 db7dv/wg7xkOMfuwSQzza23TR6y6DwgeIg70kHr/FiWcu/fc2K4xumXoktLQOea1LN
 SFjwHQgL21EvHXakC3v/mGLpKnrJ2UntrheOaFI8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250930035639epcas5p1f669fafdaa861161b71abc062c3b2570~p80MxvNhf1549615496epcas5p1Q;
 Tue, 30 Sep 2025 03:56:39 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPPf1yGQz6B9mB; Tue, 30 Sep
 2025 03:56:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250930035637epcas5p4d52ed2f59e17862cd7d7a650fa01bf44~p80LLtbhp0713607136epcas5p4E;
 Tue, 30 Sep 2025 03:56:37 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035633epsmtip153303c9146034a504efb495bc71277c3~p80HpAp4K2885028850epsmtip1k;
 Tue, 30 Sep 2025 03:56:33 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 18/29] media: mfc: Add V4L2 decoder driver
Date: Tue, 30 Sep 2025 09:33:37 +0530
Message-Id: <20250930040348.3702923-19-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035637epcas5p4d52ed2f59e17862cd7d7a650fa01bf44
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035637epcas5p4d52ed2f59e17862cd7d7a650fa01bf44
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035637epcas5p4d52ed2f59e17862cd7d7a650fa01bf44@epcas5p4.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

Add a V4L2‑based decoder for Exynos MFC.
- Implement full decoder V4L2 ioctl, control, buffer, and stream handling.
- Provide ioctl getter and default format helper.

Move the decoder to the standard V4L2 framework,
to enable proper media‑device registration and user‑space interaction.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |    2 +-
 .../samsung/exynos-mfc/mfc_dec_v4l2.c         | 1741 +++++++++++++++++
 .../samsung/exynos-mfc/mfc_dec_v4l2.h         |   22 +
 3 files changed, 1764 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index 9127f2dc4df6..b6b312ae7f22 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_VIDEO_EXYNOS_MFC) := exynos_mfc.o
 ccflags-y += -I$(srctree)/$(src)
 
 #Dev interface layer
-exynos_mfc-y += mfc.o mfc_dec_vb2.o
+exynos_mfc-y += mfc.o mfc_dec_v4l2.o mfc_dec_vb2.o
 #Dev control layer
 exynos_mfc-y += mfc_rm.o mfc_ctx_ctrl.o mfc_debugfs.o
 #Core interface layer
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c
new file mode 100644
index 000000000000..dd59dc352e34
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c
@@ -0,0 +1,1741 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * mfc_dec_v4l2.c
+ *
+ * Copyright (c) 2016 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/vmalloc.h>
+#include <kunit/visibility.h>
+
+#include "mfc_dec_v4l2.h"
+#include "mfc_dec_vb2.h"
+#include "mfc_rm.h"
+
+#include "mfc_core_hwlock.h"
+
+#include "base/mfc_format.h"
+#include "base/mfc_queue.h"
+#include "base/mfc_utils.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_mem.h"
+
+#define MAX_FRAME_SIZE		(2 * SZ_1K * SZ_1K)
+static struct v4l2_queryctrl dec_controls[] = {
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H.264 Display Delay",
+		.minimum = -1,
+		.maximum = 32,
+		.step = 1,
+		.default_value = -1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Mpeg4 Loop Filter Enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Slice Interface Enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_PACKED_PB,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Packed PB Enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frame Tag",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "CRC enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_LUMA,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "CRC data",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_CHROMA,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "CRC data",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_DISPLAY_STATUS,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Display status",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frame type",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Frame pack sei parse flag",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_I_FRAME_DECODING,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "I frame decoding mode",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frames per second in 1000x scale",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 60000,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODER_IMMEDIATE_DISPLAY,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Immediate Display Enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODER_DECODING_TIMESTAMP_MODE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Decoding Timestamp Mode Enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODER_WAIT_DECODING_START,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Wait until buffer setting done",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_GET_VERSION_INFO,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Get MFC version information",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_SET_DUAL_DPB_MODE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Set Dual DPB mode",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_QOS_RATIO,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "QoS ratio value",
+		.minimum = 20,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 100,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_SET_DYNAMIC_DPB_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Set dynamic DPB",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_SET_USER_SHARED_HANDLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Set dynamic DPB",
+		.minimum = 0,
+		.maximum = U16_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_GET_EXT_INFO,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Get extra information",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_SET_BUF_PROCESS_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Set buffer process type",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_GET_10BIT_INFO,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "10 bit contents information",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_BLACK_BAR_DETECT,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Set black bar detection option",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_HDR_USER_SHARED_HANDLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Dynamic HDR10+ SEI metadata",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_AV1_FILM_GRAIN_USER_SHARED_HANDLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "AV1 Film Grain SEI metadata",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_AV1_FILM_GRAIN_PRESENT,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "AV1 Film Grain presented",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODING_ORDER,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "decoding order enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_UNCOMP_FMT,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Uncompressed format",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_GET_DISPLAY_DELAY,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "display delay for first frame",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_POC,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frame POC",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Buffer flag",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Buffer flag",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SKIP_LAZY_UNMAP,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "skip lazy unmap",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_PRIORITY,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "priority",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_HEIF_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "heif mode",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_MULTI_VIEW_ENABLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Multi-View Enable",
+		.minimum = 0,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 0,
+	},
+};
+
+#define DEC_NUM_CTRLS ARRAY_SIZE(dec_controls)
+/* Find selected format description */
+VISIBLE_IF_KUNIT struct mfc_fmt *__mfc_dec_find_format(struct mfc_ctx *ctx,
+						       unsigned int pixelformat)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_fmt *fmt = NULL;
+	unsigned long i;
+
+	for (i = 0; i < MFC_NUM_FORMATS; i++) {
+		if ((mfc_formats[i].type & MFC_FMT_STREAM) &&
+		    !(mfc_formats[i].type & MFC_FMT_DEC)) {
+			continue;
+		}
+		if (mfc_formats[i].fourcc == pixelformat) {
+			fmt = (struct mfc_fmt *)&mfc_formats[i];
+			break;
+		}
+	}
+
+	if (fmt && !dev->pdata->support_10bit && (fmt->type & MFC_FMT_10BIT)) {
+		mfc_ctx_err("[FRAME] 10bit is not supported\n");
+		fmt = NULL;
+	}
+	if (fmt && !dev->pdata->support_422 && (fmt->type & MFC_FMT_422)) {
+		mfc_ctx_err("[FRAME] 422 is not supported\n");
+		fmt = NULL;
+	}
+	if (fmt && (fmt->type & MFC_FMT_RGB)) {
+		mfc_ctx_err("[FRAME] RGB is not supported by decoder\n");
+		fmt = NULL;
+	}
+	if (fmt && (fmt->type & MFC_FMT_STREAM) &&
+	    dev->pdata->mfc_resource[fmt->codec_mode].op_core_type == MFC_OP_CORE_NOT_FIXED) {
+		mfc_ctx_err("[STREAM] %s is not supported\n", fmt->name);
+		fmt = NULL;
+	}
+
+	return fmt;
+}
+EXPORT_SYMBOL_IF_KUNIT(__mfc_dec_find_format);
+
+static struct v4l2_queryctrl *__mfc_dec_get_ctrl(int id)
+{
+	unsigned long i;
+
+	for (i = 0; i < DEC_NUM_CTRLS; ++i)
+		if (id == dec_controls[i].id)
+			return &dec_controls[i];
+
+	return NULL;
+}
+
+/* Check whether a ctrl value if correct */
+static int __mfc_dec_check_ctrl_val(struct mfc_ctx *ctx, struct v4l2_control *ctrl)
+{
+	struct v4l2_queryctrl *c;
+
+	c = __mfc_dec_get_ctrl(ctrl->id);
+	if (!c) {
+		mfc_ctx_err("[CTRLS] not supported control id (%#x)\n", ctrl->id);
+		return -EINVAL;
+	}
+
+	if (ctrl->value < c->minimum || ctrl->value > c->maximum ||
+	    (c->step != 0 && ctrl->value % c->step != 0)) {
+		mfc_ctx_err("[CTRLS][%s] id: %#x, invalid value (%d)\n",
+			    c->name, ctrl->id, ctrl->value);
+		return -ERANGE;
+	}
+
+	mfc_ctx_debug(5, "[CTRLS][%s] id: %#x, value: %d (%#x)\n",
+		      c->name, ctrl->id, ctrl->value, ctrl->value);
+
+	return 0;
+}
+
+/* Query capabilities of the device */
+static int mfc_dec_querycap(struct file *file, void *priv,
+			    struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "MFC", sizeof(cap->driver));
+	strscpy(cap->card, "decoder", sizeof(cap->card));
+
+	return 0;
+}
+
+static int __mfc_dec_enum_fmt(struct mfc_dev *dev, struct v4l2_fmtdesc *f,
+			      unsigned int type)
+{
+	struct mfc_fmt *fmt;
+	unsigned long i, j = 0;
+
+	for (i = 0; i < MFC_NUM_FORMATS; ++i) {
+		if (!(mfc_formats[i].type & type))
+			continue;
+		if (!dev->pdata->support_10bit && (mfc_formats[i].type & MFC_FMT_10BIT))
+			continue;
+		if (!dev->pdata->support_422 && (mfc_formats[i].type & MFC_FMT_422))
+			continue;
+
+		if (j == f->index) {
+			fmt = &mfc_formats[i];
+			strscpy(f->description, fmt->name,
+				sizeof(f->description));
+			f->pixelformat = fmt->fourcc;
+
+			return 0;
+		}
+
+		++j;
+	}
+
+	return -EINVAL;
+}
+
+static int mfc_dec_enum_fmt_vid_cap_mplane(struct file *file, void *pirv,
+					   struct v4l2_fmtdesc *f)
+{
+	struct mfc_dev *dev = video_drvdata(file);
+
+	return __mfc_dec_enum_fmt(dev, f, MFC_FMT_FRAME);
+}
+
+static int mfc_dec_enum_fmt_vid_out_mplane(struct file *file, void *prov,
+					   struct v4l2_fmtdesc *f)
+{
+	struct mfc_dev *dev = video_drvdata(file);
+
+	return __mfc_dec_enum_fmt(dev, f, MFC_FMT_STREAM);
+}
+
+static void __mfc_dec_change_format_8bit(struct mfc_ctx *ctx)
+{
+	u32 org_fmt = ctx->dst_fmt->fourcc;
+
+	switch (org_fmt) {
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_YUV420M:
+	case V4L2_PIX_FMT_YVU420M:
+		/* It is right format */
+		break;
+	case V4L2_PIX_FMT_NV61M:
+		/* change to CrCb order format */
+		ctx->dst_fmt = __mfc_dec_find_format(ctx, V4L2_PIX_FMT_NV21M);
+		break;
+	default:
+		ctx->dst_fmt = __mfc_dec_find_format(ctx, V4L2_PIX_FMT_NV12M);
+		break;
+	}
+}
+
+static void __mfc_dec_change_format_8bit_422(struct mfc_ctx *ctx)
+{
+	u32 org_fmt = ctx->dst_fmt->fourcc;
+
+	switch (org_fmt) {
+	case V4L2_PIX_FMT_NV16M:
+	case V4L2_PIX_FMT_NV61M:
+		/* It is right format */
+		break;
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_YVU420M:
+		/* change to CrCb order format */
+		ctx->dst_fmt = __mfc_dec_find_format(ctx, V4L2_PIX_FMT_NV61M);
+		break;
+	default:
+		ctx->dst_fmt = __mfc_dec_find_format(ctx, V4L2_PIX_FMT_NV16M);
+		break;
+	}
+}
+
+static void __mfc_dec_change_format(struct mfc_ctx *ctx)
+{
+	u32 org_fmt = ctx->dst_fmt->fourcc;
+
+	if (ctx->is_422)
+		__mfc_dec_change_format_8bit_422(ctx);
+	else
+		__mfc_dec_change_format_8bit(ctx);
+
+	ctx->raw_buf.num_planes = ctx->dst_fmt->num_planes;
+	if (org_fmt != ctx->dst_fmt->fourcc)
+		mfc_ctx_info("[FRAME] format is changed to %s\n", ctx->dst_fmt->name);
+}
+
+static void __mfc_dec_set_num_fd_frame(struct mfc_ctx *ctx,
+				       struct v4l2_pix_format_mplane *pix_fmt_mp)
+{
+	int calc_num_planes;
+	int num_fd_depth_map = 0;
+	int num_view = 1;
+	int num_fd_sub_view_meta = 0;
+
+	if (ctx->multi_view_enable) {
+		pix_fmt_mp->flags |= MFC_FMT_FLAG_MULTI_VIEW;
+		num_view = MFC_NUM_MULTI_VIEW;
+		num_fd_sub_view_meta = MFC_NUM_FD_SUB_VIEW_META;
+
+		// ToDo: Depth is not supported yet.
+		pix_fmt_mp->flags &= ~MFC_FMT_FLAG_DEPTH_MAP;
+		num_fd_depth_map = 0;
+
+		calc_num_planes =
+			(ctx->dst_fmt->mem_planes + num_fd_depth_map) * num_view +
+			 num_fd_sub_view_meta;
+	} else {
+		pix_fmt_mp->flags &= ~MFC_FMT_FLAG_MULTI_VIEW;
+		calc_num_planes = ctx->dst_fmt->mem_planes;
+	}
+
+	mfc_set_view_buf_info(ctx, ctx->dst_fmt->mem_planes,
+			      num_fd_depth_map, num_fd_sub_view_meta);
+
+	ctx->num_fd_frame = calc_num_planes;
+	pix_fmt_mp->num_planes = calc_num_planes;
+}
+
+static void __mfc_dec_update_pix_format(struct mfc_ctx *ctx, struct v4l2_format *f)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct mfc_raw_info *raw;
+	int i;
+
+	raw = &ctx->raw_buf;
+
+	pix_fmt_mp->width = ctx->img_width;
+	pix_fmt_mp->height = ctx->img_height;
+	__mfc_dec_set_num_fd_frame(ctx, pix_fmt_mp);
+
+	if (dec->is_interlaced)
+		pix_fmt_mp->field = V4L2_FIELD_INTERLACED;
+	else
+		pix_fmt_mp->field = V4L2_FIELD_NONE;
+
+	/* Set pixelformat to the format in which MFC outputs the decoded frame */
+	pix_fmt_mp->pixelformat = ctx->dst_fmt->fourcc;
+	for (i = 0; i < ctx->dst_fmt->mem_planes; i++) {
+		pix_fmt_mp->plane_fmt[i].bytesperline = raw->stride[i];
+		if (ctx->dst_fmt->mem_planes == 1)
+			pix_fmt_mp->plane_fmt[i].sizeimage = raw->total_plane_size;
+		else
+			pix_fmt_mp->plane_fmt[i].sizeimage = raw->plane_size[i];
+	}
+}
+
+/* Get format */
+static int mfc_dec_g_fmt_vid_cap_mplane(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+	int ret;
+
+	mfc_ctx_debug_enter();
+
+	/* During g_fmt, context information is need to for only main core */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	mfc_debug(2, "dec dst g_fmt, state: %d wait_state: %d\n",
+		  core_ctx->state, ctx->wait_state);
+	MFC_TRACE_CTX("** DEC g_fmt(state:%d wait_state:%d)\n",
+		      core_ctx->state, ctx->wait_state);
+
+	mutex_lock(&ctx->drc_wait_mutex);
+	if (dec->disp_drc.disp_res_change) {
+		__mfc_dec_update_pix_format(ctx, f);
+		mutex_unlock(&ctx->drc_wait_mutex);
+		return 0;
+	}
+	mutex_unlock(&ctx->drc_wait_mutex);
+
+	if (core_ctx->state == MFCINST_GOT_INST ||
+	    core_ctx->state == MFCINST_RES_CHANGE_INIT ||
+	    core_ctx->state == MFCINST_RES_CHANGE_FLUSH ||
+	    core_ctx->state == MFCINST_RES_CHANGE_FLUSH_FINISHED ||
+	    core_ctx->state == MFCINST_RES_CHANGE_END) {
+		/* If there is no source buffer to parsing, we can't SEQ_START */
+		mutex_lock(&ctx->drc_wait_mutex);
+		if (((ctx->wait_state & WAIT_G_FMT) != 0) &&
+		    mfc_is_queue_count_same(&ctx->buf_queue_lock,
+					    &ctx->src_buf_ready_queue, 0) &&
+		    mfc_is_queue_count_same(&ctx->buf_queue_lock,
+					    &core_ctx->src_buf_queue, 0)) {
+			mfc_err("There is no source buffer to parsing, keep previous resolution\n");
+			mutex_unlock(&ctx->drc_wait_mutex);
+			return -EAGAIN;
+		}
+		mutex_unlock(&ctx->drc_wait_mutex);
+
+		/*
+		 * If the MFC is parsing the header,
+		 * so wait until it is finished.
+		 */
+		ret = mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_SEQ_DONE_RET);
+		if (ret) {
+			if (core_ctx->int_err == MFC_REG_ERR_UNSUPPORTED_FEATURE) {
+				mfc_err("header parsing failed by unsupported feature\n");
+				return -EINVAL;
+			}
+			mfc_err("header parsing failed\n");
+			return -EAGAIN;
+		}
+	}
+
+	if (core_ctx->state >= MFCINST_HEAD_PARSED &&
+	    core_ctx->state < MFCINST_ABORT) {
+		if (mfc_check_resolution(ctx)) {
+			mfc_ctx_err("Unsupported product resolution\n");
+			return -EAGAIN;
+		}
+
+		/* This is run on CAPTURE (decode output) */
+		if (ctx->stream_op_mode == MFC_OP_TWO_MODE1 ||
+		    ctx->stream_op_mode == MFC_OP_TWO_MODE2) {
+			mfc_info("[2CORE] start the sub core\n");
+			if (mfc_rm_instance_setup(dev, ctx)) {
+				mfc_err("[2CORE] failed to setup sub core\n");
+				return -EAGAIN;
+			}
+		}
+
+		/*
+		 * The format should be changed according to various conditions.
+		 * 1. bit depth (8bit or 10bit)
+		 * 2. chroma order (CbCr or CrCb)
+		 * 3. component in memory (multi or single)
+		 */
+
+		__mfc_dec_change_format(ctx);
+
+		/* Width and height are set to the dimensions
+		 * of the movie, the buffer is bigger and
+		 * further processing stages should crop to this
+		 * rectangle.
+		 */
+		mfc_dec_calc_dpb_size(ctx, &ctx->raw_buf, ctx->dst_fmt);
+
+		if (IS_LOW_MEM) {
+			unsigned int dpb_size;
+			/*
+			 * If total memory requirement is too big for this device,
+			 * then it returns error.
+			 * DPB size : Total plane size * the number of DPBs
+			 * 5: the number of extra DPBs
+			 * 3: the number of DPBs for Android framework
+			 * 600MB: being used to return an error,
+			 * when 8K resolution video clip is being tried to be decoded
+			 */
+			dpb_size = (ctx->raw_buf.total_plane_size *
+					(ctx->dpb_count + MFC_EXTRA_DPB + 3));
+			if (dpb_size > SZ_6M) {
+				mfc_info("required memory size is too big (%dx%d, dpb: %d)\n",
+					 ctx->img_width, ctx->img_height, ctx->dpb_count);
+				return -EINVAL;
+			}
+		}
+
+		__mfc_dec_update_pix_format(ctx, f);
+	}
+
+	mutex_lock(&ctx->drc_wait_mutex);
+	if ((ctx->wait_state & WAIT_G_FMT) != 0) {
+		ctx->wait_state &= ~(WAIT_G_FMT);
+		mfc_debug(2, "clear WAIT_G_FMT %d\n", ctx->wait_state);
+		MFC_TRACE_CTX("** DEC clear WAIT_G_FMT(wait_state %d)\n", ctx->wait_state);
+	}
+	mutex_unlock(&ctx->drc_wait_mutex);
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static int mfc_dec_g_fmt_vid_out_mplane(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+
+	mfc_ctx_debug_enter();
+
+	mfc_ctx_debug(4, "dec src g_fmt\n");
+
+	/* This is run on OUTPUT
+	 * The buffer contains compressed image
+	 * so width and height have no meaning
+	 */
+	pix_fmt_mp->width = 0;
+	pix_fmt_mp->height = 0;
+	pix_fmt_mp->field = V4L2_FIELD_NONE;
+	pix_fmt_mp->plane_fmt[0].bytesperline = dec->src_buf_size;
+	pix_fmt_mp->plane_fmt[0].sizeimage = dec->src_buf_size;
+	pix_fmt_mp->pixelformat = ctx->src_fmt->fourcc;
+	pix_fmt_mp->num_planes = ctx->src_fmt->mem_planes;
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+/* Try format */
+static int mfc_dec_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_fmt *fmt;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+
+	fmt = __mfc_dec_find_format(ctx, pix_fmt_mp->pixelformat);
+	if (!fmt) {
+		mfc_ctx_err("Unsupported format for %s\n",
+			    V4L2_TYPE_IS_OUTPUT(f->type) ? "source" : "destination");
+		return -EINVAL;
+	}
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	    fmt->codec_mode == MFC_FORMATS_NO_CODEC) {
+		mfc_ctx_err("MFC_FORMATS_NO_CODEC is invalid to src(fmt is %s)\n",
+			    fmt->name);
+		return -EINVAL;
+	}
+
+	/* For resource reservation */
+	ctx->img_width = pix_fmt_mp->width;
+	ctx->img_height = pix_fmt_mp->height;
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		ctx->src_fmt = fmt;
+		ctx->codec_mode = ctx->src_fmt->codec_mode;
+		ctx->op_core_type = ctx->dev->pdata->mfc_resource[ctx->codec_mode].op_core_type;
+	}
+
+	mfc_ctx_debug(2, "[%s] resolution %dx%d, %s : %s\n",
+		      V4L2_TYPE_IS_OUTPUT(f->type) ? "STREAM" : "FRAME",
+		      ctx->img_width, ctx->img_height,
+		      V4L2_TYPE_IS_OUTPUT(f->type) ? "codectype" : "pixelformat", fmt->name);
+
+	return 0;
+}
+
+/* Set format */
+static int mfc_dec_s_fmt_vid_cap_mplane(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct mfc_fmt *fmt = NULL;
+
+	mfc_ctx_debug_enter();
+
+	if (ctx->vq_dst.streaming) {
+		mfc_ctx_err("queue busy\n");
+		return -EBUSY;
+	}
+
+	fmt = __mfc_dec_find_format(ctx, pix_fmt_mp->pixelformat);
+	if (!fmt) {
+		mfc_ctx_err("Unsupported format for destination\n");
+		return -EINVAL;
+	}
+	ctx->dst_fmt = fmt;
+
+	if ((!ctx->img_width && !ctx->img_height) &&
+	    pix_fmt_mp->width > 0 && pix_fmt_mp->height > 0) {
+		ctx->img_width = pix_fmt_mp->width;
+		ctx->img_height = pix_fmt_mp->height;
+	}
+
+	ctx->raw_buf.num_planes = ctx->dst_fmt->num_planes;
+	mfc_ctx_info("[FRAME] dec dst pixelformat : %s (%d x %d)\n",
+		     ctx->dst_fmt->name, ctx->img_width, ctx->img_height);
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static int mfc_dec_s_fmt_vid_out_mplane(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct mfc_dev *dev = video_drvdata(file);
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct mfc_fmt *fmt = NULL;
+	int ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	if (ctx->vq_src.streaming) {
+		mfc_ctx_err("queue busy\n");
+		return -EBUSY;
+	}
+
+	fmt = __mfc_dec_find_format(ctx, pix_fmt_mp->pixelformat);
+	if (!fmt) {
+		mfc_ctx_err("Unsupported format for source\n");
+		return -EINVAL;
+	}
+	ctx->src_fmt = fmt;
+
+	ctx->codec_mode = ctx->src_fmt->codec_mode;
+	mfc_ctx_info("[STREAM] codectype: %s(%d)\n",
+		     ctx->src_fmt->name, ctx->codec_mode);
+
+	ctx->pix_format = pix_fmt_mp->pixelformat;
+	if (pix_fmt_mp->width > 0 && pix_fmt_mp->height > 0) {
+		ctx->img_height = pix_fmt_mp->height;
+		ctx->img_width = pix_fmt_mp->width;
+	}
+
+	/* As this buffer will contain compressed data, the size is set
+	 * to the maximum size.
+	 */
+	if (pix_fmt_mp->plane_fmt[0].sizeimage)
+		dec->src_buf_size = pix_fmt_mp->plane_fmt[0].sizeimage;
+	else
+		dec->src_buf_size = MAX_FRAME_SIZE;
+	mfc_ctx_debug(2, "[STREAM] sizeimage: %d\n", pix_fmt_mp->plane_fmt[0].sizeimage);
+	pix_fmt_mp->plane_fmt[0].bytesperline = 0;
+
+	ret = mfc_rm_instance_open(dev, ctx);
+	if (ret)
+		mfc_ctx_err("Failed to instance open\n");
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+/* Request buffers */
+static int mfc_dec_reqbufs(struct file *file, void *priv,
+			   struct v4l2_requestbuffers *reqbufs)
+{
+	struct mfc_dev *dev = video_drvdata(file);
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	int i, ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	if (reqbufs->memory == V4L2_MEMORY_MMAP) {
+		mfc_ctx_err("Not supported memory type (%d)\n", reqbufs->memory);
+		return -EINVAL;
+	}
+
+	if (reqbufs->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "dec src reqbuf(%d)\n", reqbufs->count);
+		/* Can only request buffers after
+		 * an instance has been opened.
+		 */
+		if (mfc_rm_query_state(ctx, EQUAL, MFCINST_GOT_INST)) {
+			if (reqbufs->count == 0) {
+				ret = vb2_reqbufs(&ctx->vq_src, reqbufs);
+				ctx->output_state = QUEUE_FREE;
+				return ret;
+			}
+
+			/* Decoding */
+			if (ctx->output_state != QUEUE_FREE) {
+				mfc_ctx_err("Bufs have already been requested\n");
+				return -EINVAL;
+			}
+
+			ret = vb2_reqbufs(&ctx->vq_src, reqbufs);
+			if (ret) {
+				mfc_ctx_err("vb2_reqbufs on src failed\n");
+				return ret;
+			}
+
+			ctx->output_state = QUEUE_BUFS_REQUESTED;
+		}
+	} else if (reqbufs->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_ctx_debug(4, "dec dst reqbuf(%d)\n", reqbufs->count);
+		if (reqbufs->count == 0) {
+			ret = vb2_reqbufs(&ctx->vq_dst, reqbufs);
+
+			if (!dec->inter_res_change) {
+				for (i = 0; i < MFC_CORE_TYPE_NUM; i++) {
+					if (ctx->op_core_num[i] == MFC_CORE_INVALID)
+						break;
+					core = dev->core[ctx->op_core_num[i]];
+
+					core_ctx = core->core_ctx[ctx->num];
+					mfc_release_codec_buffers(core_ctx);
+				}
+			}
+			ctx->capture_state = QUEUE_FREE;
+			return ret;
+		}
+
+		if (ctx->capture_state != QUEUE_FREE) {
+			mfc_ctx_err("Bufs have already been requested\n");
+			return -EINVAL;
+		}
+
+		ret = vb2_reqbufs(&ctx->vq_dst, reqbufs);
+		if (ret) {
+			mfc_ctx_err("vb2_reqbufs on capture failed\n");
+			return ret;
+		}
+
+		if (reqbufs->count < ctx->dpb_count) {
+			mfc_ctx_err("Not enough buffers allocated\n");
+			reqbufs->count = 0;
+			vb2_reqbufs(&ctx->vq_dst, reqbufs);
+			return -ENOMEM;
+		}
+
+		dec->total_dpb_count = reqbufs->count;
+
+		if (!dec->inter_res_change) {
+			for (i = 0; i < MFC_CORE_TYPE_NUM; i++) {
+				if (ctx->op_core_num[i] == MFC_CORE_INVALID)
+					break;
+
+				core = dev->core[ctx->op_core_num[i]];
+				core_ctx = core->core_ctx[ctx->num];
+				ret = mfc_alloc_codec_buffers(core_ctx);
+				if (ret) {
+					mfc_err("Failed to allocate decoding buffers\n");
+					reqbufs->count = 0;
+					vb2_reqbufs(&ctx->vq_dst, reqbufs);
+					return -ENOMEM;
+				}
+			}
+		}
+
+		ctx->capture_state = QUEUE_BUFS_REQUESTED;
+
+		mfc_rm_request_work(dev, MFC_WORK_TRY, ctx);
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+/* Query buffer */
+static int mfc_dec_querybuf(struct file *file, void *priv,
+			    struct v4l2_buffer *buf)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	int ret;
+
+	mfc_ctx_debug_enter();
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_ctx_debug(4, "dec dst querybuf\n");
+		ret = vb2_querybuf(&ctx->vq_dst, buf);
+		if (ret != 0) {
+			mfc_ctx_err("dec dst: error in vb2_querybuf()\n");
+			return ret;
+		}
+	} else if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "dec src querybuf\n");
+		ret = vb2_querybuf(&ctx->vq_src, buf);
+		if (ret != 0) {
+			mfc_ctx_err("dec src: error in vb2_querybuf()\n");
+			return ret;
+		}
+	} else {
+		mfc_ctx_err("invalid buf type (%d)\n", buf->type);
+		return -EINVAL;
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+/* Queue a buffer */
+static int mfc_dec_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	int ret = -EINVAL;
+
+	mfc_ctx_debug_enter();
+
+	if (mfc_rm_query_state(ctx, EQUAL_OR, MFCINST_ERROR)) {
+		mfc_ctx_err("Call on QBUF after unrecoverable error\n");
+		return -EIO;
+	}
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(buf->type)) {
+		mfc_ctx_err("Invalid V4L2 Buffer for driver: type(%d)\n", buf->type);
+		return -EINVAL;
+	}
+
+	if (!buf->length) {
+		mfc_ctx_err("multiplanar but length is zero\n");
+		return -EIO;
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "dec src buf[%d] Q\n", buf->index);
+		if (buf->m.planes[0].bytesused > buf->m.planes[0].length) {
+			mfc_ctx_err("data size (%d) %s(%d)\n",
+				    buf->m.planes[0].bytesused,
+				    "must be less than buffer size",
+				    buf->m.planes[0].length);
+			return -EIO;
+		}
+
+		mfc_idle_update_queued(dev, ctx);
+		mfc_rate_update_bitrate(ctx, buf->m.planes[0].bytesused);
+		mfc_rate_update_bufq_framerate(ctx, MFC_TS_SRC_Q);
+		mfc_rate_update_framerate(ctx);
+		mfc_rm_qos_control(ctx, MFC_QOS_TRIGGER);
+
+		if (!buf->m.planes[0].bytesused) {
+			buf->m.planes[0].bytesused = buf->m.planes[0].length;
+			mfc_ctx_debug(2, "Src size zero, changed to buf size %d\n",
+				      buf->m.planes[0].bytesused);
+		} else {
+			mfc_ctx_debug(2, "Src size, %d, buf length, %d\n",
+				      buf->m.planes[0].bytesused,
+				      buf->m.planes[0].length);
+		}
+
+		ret = vb2_qbuf(&ctx->vq_src, NULL, buf);
+	} else {
+		mfc_ctx_debug(4, "dec dst buf[%d] Q\n", buf->index);
+		mfc_idle_update_queued(dev, ctx);
+		mfc_rate_update_bufq_framerate(ctx, MFC_TS_DST_Q);
+		mfc_rate_update_framerate(ctx);
+		mfc_rm_qos_control(ctx, MFC_QOS_TRIGGER);
+		ret = vb2_qbuf(&ctx->vq_dst, NULL, buf);
+	}
+
+	mfc_ctx_debug_leave();
+	return ret;
+}
+
+/* Dequeue a buffer */
+static int mfc_dec_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct dec_dpb_ref_info *dst_buf, *src_buf;
+	int ret;
+	int ncount = 0;
+
+	mfc_ctx_debug_enter();
+
+	if (mfc_rm_query_state(ctx, EQUAL, MFCINST_ERROR)) {
+		mfc_ctx_err("Call on DQBUF after unrecoverable error\n");
+		return -EIO;
+	}
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(buf->type)) {
+		mfc_ctx_err("Invalid V4L2 Buffer for driver: type(%d)\n", buf->type);
+		return -EINVAL;
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		ret = vb2_dqbuf(&ctx->vq_src, buf, file->f_flags & O_NONBLOCK);
+		mfc_ctx_debug(4, "dec src buf[%d] DQ\n", buf->index);
+	} else {
+		ret = vb2_dqbuf(&ctx->vq_dst, buf, file->f_flags & O_NONBLOCK);
+		mfc_ctx_debug(4, "dec dst buf[%d] DQ\n", buf->index);
+
+		if (buf->index >= MFC_MAX_BUFFERS) {
+			mfc_ctx_err("buffer index[%d] range over\n", buf->index);
+			return -EINVAL;
+		}
+
+		/* Memcpy from dec->ref_info to shared memory */
+		if (dec->ref_info) {
+			src_buf = &dec->ref_info[buf->index];
+			for (ncount = 0; ncount < MFC_MAX_BUFFERS; ncount++) {
+				if (src_buf->dpb[ncount].fd[0] == MFC_INFO_INIT_FD)
+					break;
+				mfc_ctx_debug(2, "[REFINFO] DQ index[%d] Released FD = %d\n",
+					      buf->index, src_buf->dpb[ncount].fd[0]);
+			}
+
+			if (dec->sh_handle_dpb.vaddr) {
+				dst_buf = (struct dec_dpb_ref_info *)
+					dec->sh_handle_dpb.vaddr + buf->index;
+				memcpy(dst_buf, src_buf, sizeof(struct dec_dpb_ref_info));
+				dst_buf->index = buf->index;
+			}
+		}
+	}
+	mfc_ctx_debug_leave();
+	return ret;
+}
+
+/* Stream on */
+static int mfc_dec_streamon(struct file *file, void *priv,
+			    enum v4l2_buf_type type)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	int ret = -EINVAL;
+
+	mfc_ctx_debug_enter();
+
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "dec src streamon\n");
+		ret = vb2_streamon(&ctx->vq_src, type);
+	} else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_ctx_debug(4, "dec dst streamon\n");
+		ret = vb2_streamon(&ctx->vq_dst, type);
+		if (!ret)
+			mfc_rm_qos_control(ctx, MFC_QOS_ON);
+	} else {
+		mfc_ctx_err("unknown v4l2 buffer type\n");
+	}
+
+	mfc_ctx_debug(2, "src: %d, dst: %d, dpb_count = %d\n",
+		      mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->src_buf_ready_queue),
+		      mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->dst_buf_queue),
+		      ctx->dpb_count);
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+/* Stream off, which equals to a pause */
+static int mfc_dec_streamoff(struct file *file, void *priv,
+			     enum v4l2_buf_type type)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	int ret = -EINVAL;
+
+	mfc_ctx_debug_enter();
+
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "dec src streamoff\n");
+		ret = vb2_streamoff(&ctx->vq_src, type);
+	} else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_ctx_debug(4, "dec dst streamoff\n");
+		mfc_rate_reset_bufq_framerate(ctx);
+		ret = vb2_streamoff(&ctx->vq_dst, type);
+		if (!ret)
+			mfc_rm_qos_control(ctx, MFC_QOS_OFF);
+	} else {
+		mfc_ctx_err("unknown v4l2 buffer type\n");
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+static int __mfc_dec_ext_info(struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	int val = 0;
+
+	val |= DEC_SET_DYNAMIC_DPB;
+	val |= DEC_SET_C2_INTERFACE;
+	val |= DEC_SET_BUF_FLAG_CTRL;
+	val |= DEC_SET_FRAME_ERR_TYPE;
+	val |= DEC_SET_OPERATING_FPS;
+	val |= DEC_SET_PRIORITY;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->skype))
+		val |= DEC_SET_SKYPE_FLAG;
+
+	mfc_ctx_debug(5, "[CTRLS] ext info val: %#x\n", val);
+
+	return val;
+}
+
+/* Get ctrl */
+static int __mfc_dec_get_ctrl_val(struct mfc_ctx *ctx, struct v4l2_control *ctrl)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_ctx_ctrl *ctx_ctrl;
+	int found = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
+		ctrl->value = dec->loop_filter_mpeg4;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY:
+		ctrl->value = dec->display_delay;
+		break;
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+		/* These context information is need to for only main core */
+		core = mfc_get_main_core_lock(dev, ctx);
+		core_ctx = core->core_ctx[ctx->num];
+
+		if (core_ctx->state >= MFCINST_HEAD_PARSED &&
+		    core_ctx->state < MFCINST_ABORT) {
+			ctrl->value = ctx->dpb_count;
+			break;
+		} else if (core_ctx->state != MFCINST_INIT) {
+			mfc_err("Decoding not initialised\n");
+			return -EINVAL;
+		}
+
+		/* Should wait for the header to be parsed */
+		if (mfc_wait_for_done_core_ctx(core_ctx,
+					       MFC_REG_R2H_CMD_SEQ_DONE_RET)) {
+			core->sched->yield_work(core, core_ctx);
+			return -EIO;
+		}
+
+		if (core_ctx->state >= MFCINST_HEAD_PARSED &&
+		    core_ctx->state < MFCINST_ABORT) {
+			ctrl->value = ctx->dpb_count;
+		} else {
+			mfc_err("Decoding not initialised\n");
+			return -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
+		ctrl->value = dec->slice_enable;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_PACKED_PB:
+		/* Not used */
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_CRC_ENABLE:
+		ctrl->value = dec->crc_enable;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_CHECK_STATE:
+		core = mfc_get_main_core_lock(dev, ctx);
+		core_ctx = core->core_ctx[ctx->num];
+		if (ctx->is_dpb_realloc &&
+		    mfc_rm_query_state(ctx, EQUAL, MFCINST_HEAD_PARSED))
+			ctrl->value = MFCSTATE_DEC_S3D_REALLOC;
+		else if (core_ctx->state == MFCINST_RES_CHANGE_FLUSH ||
+			 core_ctx->state == MFCINST_RES_CHANGE_END ||
+			 core_ctx->state == MFCINST_HEAD_PARSED ||
+			 dec->inter_res_change)
+			ctrl->value = MFCSTATE_DEC_RES_DETECT;
+		else if (mfc_rm_query_state(ctx, EQUAL, MFCINST_FINISHING))
+			ctrl->value = MFCSTATE_DEC_TERMINATING;
+		else
+			ctrl->value = MFCSTATE_PROCESSING;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:
+		ctrl->value = dec->sei_parse;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_I_FRAME_DECODING:
+		ctrl->value = dec->idr_decoding;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE:
+		ctrl->value = mfc_rate_get_framerate(ctx);
+		break;
+	case V4L2_CID_MPEG_MFC_GET_VERSION_INFO:
+		ctrl->value = dev->pdata->ip_ver;
+		break;
+	case V4L2_CID_MPEG_VIDEO_QOS_RATIO:
+		ctrl->value = ctx->qos_ratio;
+		break;
+	case V4L2_CID_MPEG_MFC_SET_DYNAMIC_DPB_MODE:
+		ctrl->value = dec->is_dynamic_dpb;
+		break;
+	case V4L2_CID_MPEG_MFC_GET_EXT_INFO:
+		ctrl->value = __mfc_dec_ext_info(ctx);
+		break;
+	case V4L2_CID_MPEG_MFC_GET_DRIVER_INFO:
+		ctrl->value = MFC_DRIVER_INFO;
+		break;
+	case V4L2_CID_MPEG_VIDEO_UNCOMP_FMT:
+		if (dec->uncomp_fmt)
+			ctrl->value = dec->uncomp_fmt->fourcc;
+		else
+			ctrl->value = 0;
+		break;
+	case V4L2_CID_MPEG_VIDEO_GET_DISPLAY_DELAY:
+		/* These context information is need to for only main core */
+		core = mfc_get_main_core_lock(dev, ctx);
+		core_ctx = core->core_ctx[ctx->num];
+		if (core_ctx->state >= MFCINST_HEAD_PARSED) {
+			ctrl->value = dec->frame_display_delay;
+		} else {
+			mfc_err("display delay information not parsed yet\n");
+			return -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_PRIORITY:
+		ctrl->value = ctx->prio;
+		mfc_ctx_debug(2, "[PRIO] user get priority: %d (%d)\n",
+			      ctrl->value, ctx->user_prio);
+		break;
+	case V4L2_CID_MPEG_MFC_MULTI_VIEW_ENABLE:
+		ctrl->value = (ctx->multi_view_enable || ctx->ready_to_be_multi_view_enable);
+		break;
+	default:
+		list_for_each_entry(ctx_ctrl, &ctx->ctrls, list) {
+			if (!(ctx_ctrl->type & MFC_CTRL_TYPE_GET))
+				continue;
+
+			if (ctx_ctrl->id == ctrl->id) {
+				if (ctx_ctrl->get.has_new) {
+					ctx_ctrl->get.has_new = 0;
+					ctrl->value = ctx_ctrl->get.val;
+				} else {
+					mfc_ctx_debug(5, "[CTRLS] %s: 0x%08x\n",
+						      "Control value is not up to date",
+						      ctrl->id);
+					return -EINVAL;
+				}
+
+				found = 1;
+				break;
+			}
+		}
+
+		if (!found) {
+			mfc_ctx_err("Invalid control: 0x%08x\n", ctrl->id);
+			return -EINVAL;
+		}
+		break;
+	}
+
+	mfc_ctx_debug(5, "[CTRLS] get id: %#x, value: %d\n", ctrl->id, ctrl->value);
+
+	return 0;
+}
+
+/* Set a ctrl */
+static int mfc_dec_s_ctrl(struct file *file, void *priv,
+			  struct v4l2_control *ctrl)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_ctx_ctrl *ctx_ctrl;
+	int ret = 0;
+	int found = 0;
+
+	mfc_ctx_debug_enter();
+
+	ret = __mfc_dec_check_ctrl_val(ctx, ctrl);
+	if (ret)
+		return ret;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
+		dec->loop_filter_mpeg4 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY:
+		dec->display_delay = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
+		dec->slice_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_PACKED_PB:
+		/* Not used */
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_CRC_ENABLE:
+		dec->crc_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:
+		dec->sei_parse = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_I_FRAME_DECODING:
+		dec->idr_decoding = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DECODER_IMMEDIATE_DISPLAY:
+		dec->immediate_display = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DECODER_DECODING_TIMESTAMP_MODE:
+		dec->is_dts_mode = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DECODER_WAIT_DECODING_START:
+		mutex_lock(&ctx->drc_wait_mutex);
+		ctx->wait_state = ctrl->value;
+		mutex_unlock(&ctx->drc_wait_mutex);
+		break;
+	case V4L2_CID_MPEG_MFC_SET_DUAL_DPB_MODE:
+		mfc_ctx_err("[DPB] not supported CID: 0x%x\n", ctrl->id);
+		break;
+	case V4L2_CID_MPEG_VIDEO_QOS_RATIO:
+		ctx->qos_ratio = ctrl->value;
+		mfc_ctx_info("[QoS] set %d qos_ratio\n", ctrl->value);
+		break;
+	case V4L2_CID_MPEG_MFC_SET_DYNAMIC_DPB_MODE:
+		/* is_dynamic_dpb is controlled by driver */
+		if (dec->is_dynamic_dpb == 0)
+			mfc_ctx_debug(2, "[PLUGIN] is_dynamic_dpb is disabled by driver\n");
+		if (!ctrl->value)
+			mfc_ctx_err("[DPB] user has to enable is_dynamic_dpb by default\n");
+		break;
+	case V4L2_CID_MPEG_MFC_SET_USER_SHARED_HANDLE:
+		if (dec->sh_handle_dpb.fd == -1) {
+			dec->sh_handle_dpb.fd = ctrl->value;
+			if (mfc_mem_get_user_shared_handle(ctx, &dec->sh_handle_dpb, "DPB"))
+				return -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_MFC_SET_BUF_PROCESS_TYPE:
+		ctx->buf_process_type = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BLACK_BAR_DETECT:
+		dec->detect_black_bar = ctrl->value;
+		if (IS_BLACKBAR_OFF(ctx)) {
+			mfc_ctx_info("[BLACKBAR] black bar detection doesn't work\n");
+			dec->detect_black_bar = 0;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_DECODING_ORDER:
+		dec->decoding_order = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SKIP_LAZY_UNMAP:
+		ctx->skip_lazy_unmap = ctrl->value;
+		mfc_ctx_debug(2, "[LAZY_UNMAP] lazy unmap %s\n",
+			      ctx->skip_lazy_unmap ? "disable" : "enable");
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE:
+		mfc_ctx_debug(2, "[QoS] user set the operating frame rate: %d\n", ctrl->value);
+		ctx->operating_framerate = ctrl->value;
+		mfc_rm_update_real_time(ctx);
+		break;
+	case V4L2_CID_MPEG_VIDEO_PRIORITY:
+		mfc_ctx_debug(2, "[PRIO] user set priority: %d\n", ctrl->value);
+		ctx->user_prio = ctrl->value;
+		mfc_rm_update_real_time(ctx);
+		break;
+	case V4L2_CID_MPEG_MFC_HEIF_MODE:
+		mfc_ctx_debug(2, "[HEIF] heif mode: %d\n", ctrl->value);
+		ctx->is_heif_mode = ctrl->value;
+		break;
+	default:
+		list_for_each_entry(ctx_ctrl, &ctx->ctrls, list) {
+			if (!(ctx_ctrl->type & MFC_CTRL_TYPE_SET))
+				continue;
+
+			if (ctx_ctrl->id == ctrl->id) {
+				ctx_ctrl->set.has_new = 1;
+				ctx_ctrl->set.val = ctrl->value;
+
+				found = 1;
+				break;
+			}
+		}
+
+		if (!found) {
+			mfc_ctx_err("Invalid control: 0x%08x\n", ctrl->id);
+			return -EINVAL;
+		}
+		break;
+	}
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static int mfc_dec_s_ext_ctrls(struct file *file, void *priv,
+			       struct v4l2_ext_controls *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct v4l2_ext_control *ext_ctrl;
+	struct v4l2_control ctrl;
+	int i;
+	int ret = 0;
+
+	if (f->which != V4L2_CTRL_CLASS_CODEC && f->which != V4L2_CTRL_CLASS_USER)
+		return -EINVAL;
+
+	for (i = 0; i < f->count; i++) {
+		ext_ctrl = (f->controls + i);
+
+		ctrl.id = ext_ctrl->id;
+		ctrl.value = ext_ctrl->value;
+
+		ret = mfc_dec_s_ctrl(file, priv, &ctrl);
+		if (ret != 0) {
+			f->error_idx = i;
+			break;
+		}
+		mfc_ctx_debug(5, "[CTRLS] set id: %#x, value: %d\n", ctrl.id, ctrl.value);
+	}
+
+	return 0;
+}
+
+static void __mfc_dec_update_disp_res(struct mfc_ctx *ctx, struct v4l2_selection *s)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+
+	s->r.left = 0;
+	s->r.top = 0;
+	s->r.width = dec->disp_drc.width[dec->disp_drc.pop_idx];
+	s->r.height = dec->disp_drc.height[dec->disp_drc.pop_idx];
+	mfc_ctx_debug(2, "[FRAME] Composing info: w=%d h=%d\n", s->r.width, s->r.height);
+
+	dec->disp_drc.disp_res_change--;
+	mfc_ctx_debug(3, "[DRC] disp_res_change[%d] count %d\n",
+		      dec->disp_drc.pop_idx, dec->disp_drc.disp_res_change);
+	dec->disp_drc.pop_idx = (dec->disp_drc.pop_idx + 1) % MFC_MAX_DRC_FRAME;
+
+	if (!dec->disp_drc.disp_res_change) {
+		dec->disp_drc.push_idx = 0;
+		dec->disp_drc.pop_idx = 0;
+	}
+
+	/*
+	 * Do not clear WAIT_G_FMT except RUNNING state
+	 * because the resolution change (DRC) case uses WAIT_G_FMT
+	 */
+	if (mfc_rm_query_state(ctx, EQUAL, MFCINST_RUNNING) &&
+	    (ctx->wait_state & WAIT_G_FMT) != 0) {
+		ctx->wait_state &= ~(WAIT_G_FMT);
+		mfc_ctx_debug(2, "clear WAIT_G_FMT %d\n", ctx->wait_state);
+		MFC_TRACE_CTX("** DEC clear WAIT_G_FMT(wait_state %d)\n", ctx->wait_state);
+	}
+}
+
+/* Get cropping information */
+static int mfc_dec_g_selection(struct file *file, void *priv,
+			       struct v4l2_selection *s)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+
+	mfc_ctx_debug_enter();
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	mutex_lock(&ctx->drc_wait_mutex);
+	if (dec->disp_drc.disp_res_change) {
+		__mfc_dec_update_disp_res(ctx, s);
+		mutex_unlock(&ctx->drc_wait_mutex);
+		return 0;
+	}
+	mutex_unlock(&ctx->drc_wait_mutex);
+
+	if (!NEED_TO_GET_CROP(core_ctx)) {
+		mfc_err("ready to get compose failed\n");
+		return -EINVAL;
+	}
+
+	if (mfc_rm_query_state(ctx, EQUAL, MFCINST_RUNNING) &&
+	    dec->detect_black_bar && dec->black_bar_updated) {
+		s->r.left = dec->black_bar.left;
+		s->r.top = dec->black_bar.top;
+		s->r.width = dec->black_bar.width;
+		s->r.height = dec->black_bar.height;
+		mfc_debug(2, "[FRAME][BLACKBAR] Cropping info: l=%d t=%d w=%d h=%d\n",
+			  dec->black_bar.left,
+			  dec->black_bar.top,
+			  dec->black_bar.width,
+			  dec->black_bar.height);
+	} else {
+		if (ctx->src_fmt->fourcc == V4L2_PIX_FMT_H264 ||
+		    ctx->src_fmt->fourcc == V4L2_PIX_FMT_HEVC) {
+			s->r.left = dec->cr_left;
+			s->r.top = dec->cr_top;
+			s->r.width = ctx->img_width - dec->cr_left - dec->cr_right;
+			s->r.height = ctx->img_height - dec->cr_top - dec->cr_bot;
+			mfc_debug(2, "[FRAME] %s: l=%d t=%d w=%d h=%d (r=%d b=%d fw=%d fh=%d)\n",
+				  "Composing info", s->r.left, s->r.top, s->r.width, s->r.height,
+				  dec->cr_right, dec->cr_bot, ctx->img_width, ctx->img_height);
+		} else {
+			s->r.left = 0;
+			s->r.top = 0;
+			s->r.width = ctx->img_width;
+			s->r.height = ctx->img_height;
+			mfc_debug(2, "[FRAME] Composing info: w=%d h=%d fw=%d fh=%d\n",
+				  s->r.width, s->r.height,
+				  ctx->img_width, ctx->img_height);
+		}
+	}
+
+	mfc_ctx_debug_leave();
+	return 0;
+}
+
+static int mfc_dec_g_ext_ctrls(struct file *file, void *priv,
+			       struct v4l2_ext_controls *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct v4l2_ext_control *ext_ctrl;
+	struct v4l2_control ctrl;
+	int i;
+	int ret = 0;
+
+	if (f->which != V4L2_CTRL_CLASS_CODEC && f->which != V4L2_CTRL_CLASS_USER)
+		return -EINVAL;
+
+	for (i = 0; i < f->count; i++) {
+		ext_ctrl = (f->controls + i);
+
+		ctrl.id = ext_ctrl->id;
+
+		ret = __mfc_dec_get_ctrl_val(ctx, &ctrl);
+		if (ret == 0) {
+			ext_ctrl->value = ctrl.value;
+		} else {
+			f->error_idx = i;
+			break;
+		}
+
+		mfc_ctx_debug(5, "[CTRLS][%d] id: %#x, value: %d\n",
+			      i, ext_ctrl->id, ext_ctrl->value);
+	}
+
+	return ret;
+}
+
+/* Initialize for default format */
+void mfc_dec_set_default_format(struct mfc_ctx *ctx)
+{
+	struct mfc_fmt *fmt = NULL;
+
+	/* Set default format for source */
+	fmt = __mfc_dec_find_format(ctx, V4L2_PIX_FMT_H264);
+	if (!fmt) {
+		/* NEVER come here */
+		mfc_ctx_err("Wrong memory access. Set fmt by mfc_formats[0]\n");
+		fmt = &mfc_formats[0];
+	}
+	ctx->src_fmt = fmt;
+
+	/* Set default format for destination */
+	fmt = __mfc_dec_find_format(ctx, V4L2_PIX_FMT_NV12M);
+	if (!fmt) {
+		/* NEVER come here */
+		mfc_ctx_err("Wrong memory access. Set fmt by mfc_formats[0]\n");
+		fmt = &mfc_formats[0];
+	}
+	ctx->dst_fmt = fmt;
+}
+
+/* v4l2_ioctl_ops */
+static const struct v4l2_ioctl_ops mfc_dec_ioctl_ops = {
+	.vidioc_querycap		= mfc_dec_querycap,
+	.vidioc_enum_fmt_vid_cap	= mfc_dec_enum_fmt_vid_cap_mplane,
+	.vidioc_enum_fmt_vid_out	= mfc_dec_enum_fmt_vid_out_mplane,
+	.vidioc_g_fmt_vid_cap_mplane	= mfc_dec_g_fmt_vid_cap_mplane,
+	.vidioc_g_fmt_vid_out_mplane	= mfc_dec_g_fmt_vid_out_mplane,
+	.vidioc_try_fmt_vid_cap_mplane	= mfc_dec_try_fmt,
+	.vidioc_try_fmt_vid_out_mplane	= mfc_dec_try_fmt,
+	.vidioc_s_fmt_vid_cap_mplane	= mfc_dec_s_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_out_mplane	= mfc_dec_s_fmt_vid_out_mplane,
+	.vidioc_reqbufs			= mfc_dec_reqbufs,
+	.vidioc_querybuf		= mfc_dec_querybuf,
+	.vidioc_qbuf			= mfc_dec_qbuf,
+	.vidioc_dqbuf			= mfc_dec_dqbuf,
+	.vidioc_streamon		= mfc_dec_streamon,
+	.vidioc_streamoff		= mfc_dec_streamoff,
+	.vidioc_s_ext_ctrls		= mfc_dec_s_ext_ctrls,
+	.vidioc_g_selection		= mfc_dec_g_selection,
+	.vidioc_g_ext_ctrls		= mfc_dec_g_ext_ctrls,
+};
+
+const struct v4l2_ioctl_ops *mfc_get_dec_v4l2_ioctl_ops(void)
+{
+	return &mfc_dec_ioctl_ops;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h
new file mode 100644
index 000000000000..04652a71cd23
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * mfc_dec_v4l2.h
+ *
+ * Copyright (c) 2016 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __MFC_DEC_V4L2_H
+#define __MFC_DEC_V4L2_H __FILE__
+
+#include "base/mfc_common.h"
+
+const struct v4l2_ioctl_ops *mfc_get_dec_v4l2_ioctl_ops(void);
+void mfc_dec_set_default_format(struct mfc_ctx *ctx);
+
+#endif /* __MFC_DEC_V4L2_H */
-- 
2.34.1

