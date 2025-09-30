Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC9BAB7A4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8010110E4D4;
	Tue, 30 Sep 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="SJMNpDdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C8A10E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:04 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035703epoutp0132531be1a589c78edfe4065a9d77b5d7~p80jPGbdf3131731317epoutp017
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:57:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035703epoutp0132531be1a589c78edfe4065a9d77b5d7~p80jPGbdf3131731317epoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204623;
 bh=JstdFQyZsPfRGGPii8utLZ7Ue2RyZeHPK2kiM0pQXwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SJMNpDdLqXMkAvS+AQJQP45SzpNzSdwAx2/TV1LhFhfeyUIbV4ffUYdGlom3trzPu
 +zwcCl5f2ZRO+5dzZzBu6woqyPeJJE5W2EW2LVlQDWTl+pYsn5DUIeQv25b4rzxQ7u
 g/2e7870Nze3x84HmJe6Kb7xf/wJHdJZfUPmil/k=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035702epcas5p4bb78ee0dffdffd53a0c3c808ac58a9c5~p80is2ftW3091130911epcas5p4G;
 Tue, 30 Sep 2025 03:57:02 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPQ566Phz2SSKk; Tue, 30 Sep
 2025 03:57:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035700epcas5p1860af28e8a9e99d32b94fa1e97ab5456~p80g4DRTh1549615496epcas5p1x;
 Tue, 30 Sep 2025 03:57:00 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035657epsmtip1a49f305b4660ed0519b861d5fa0f2f2a~p80diLnNE2908429084epsmtip1K;
 Tue, 30 Sep 2025 03:56:57 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 25/29] media: mfc: Add encoder v4l2 driver interface
Date: Tue, 30 Sep 2025 09:33:44 +0530
Message-Id: <20250930040348.3702923-26-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035700epcas5p1860af28e8a9e99d32b94fa1e97ab5456
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035700epcas5p1860af28e8a9e99d32b94fa1e97ab5456
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035700epcas5p1860af28e8a9e99d32b94fa1e97ab5456@epcas5p1.samsung.com>
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

- Add encoder V4L2 ioctls, format handling, control operations,
  buffer management, and driver initialization.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |    2 +-
 .../samsung/exynos-mfc/mfc_enc_v4l2.c         | 4179 +++++++++++++++++
 .../samsung/exynos-mfc/mfc_enc_v4l2.h         |   20 +
 3 files changed, 4200 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index dad94a7c468c..96d70f9b790d 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_VIDEO_EXYNOS_MFC) := exynos_mfc.o
 ccflags-y += -I$(srctree)/$(src)
 
 #Dev interface layer
-exynos_mfc-y += mfc.o mfc_dec_v4l2.o mfc_dec_vb2.o mfc_enc_vb2.o
+exynos_mfc-y += mfc.o mfc_dec_v4l2.o mfc_dec_vb2.o mfc_enc_v4l2.o mfc_enc_vb2.o
 #Dev control layer
 exynos_mfc-y += mfc_rm.o mfc_ctx_ctrl.o mfc_debugfs.o
 #Core interface layer
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c
new file mode 100644
index 000000000000..84edebac82b2
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c
@@ -0,0 +1,4179 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_enc_v4l2.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_enc_v4l2.h"
+#include "mfc_enc_vb2.h"
+#include "mfc_rm.h"
+
+#include "base/mfc_queue.h"
+#include "base/mfc_utils.h"
+#include "base/mfc_buf.h"
+#include "base/mfc_mem.h"
+static struct v4l2_queryctrl enc_controls[] = {
+	{
+		.id = V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The period of intra frame",
+		.minimum = 0,
+		.maximum = BIT(30) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The slice partitioning method",
+		.minimum = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.maximum = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_FIXED_BYTES,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of MB in a slice",
+		.minimum = 1,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The maximum bits per slices",
+		.minimum = 350,
+		.maximum = INT_MAX / 8,
+		.step = 1,
+		.default_value = 350,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB_ROW,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of MB row in a slice",
+		.minimum = 1,
+		.maximum = INT_MAX / SZ_256,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of intra refresh MBs",
+		.minimum = 0,
+		.maximum = BIT(18) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_PADDING,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Padding control enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Padding Color YUV Value",
+		.minimum = 0,
+		.maximum = BIT(24) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Frame level rate control enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_BITRATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Target bit rate rate-control",
+		.minimum = 1,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Rate control reaction coeff.",
+		.minimum = 1,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_STREAM_SIZE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Encoded stream size",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+		.flags = V4L2_CTRL_FLAG_READ_ONLY,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_COUNT,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Encoded frame count",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+		.flags = V4L2_CTRL_FLAG_READ_ONLY,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Encoded frame type",
+		.minimum = 0,
+		.maximum = 5,
+		.step = 1,
+		.default_value = 0,
+		.flags = V4L2_CTRL_FLAG_READ_ONLY,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Force frame type",
+		.minimum = V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED,
+		.maximum = V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_NOT_CODED,
+		.step = 1,
+		.default_value = V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VBV_SIZE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VBV buffer size (1Kbits)",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEADER_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Sequence header mode",
+		.minimum = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.maximum = V4L2_MPEG_VIDEO_HEADER_MODE_AT_THE_READY,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frame skip enable",
+		.minimum = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.maximum = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step = 1,
+		.default_value = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Fixed target bit enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_B_FRAMES,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of B frames",
+		.minimum = 0,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 profile",
+		.minimum = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.maximum = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 level",
+		.minimum = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.maximum = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_INTERLACE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "H264 interlace mode",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 loop filter mode",
+		.minimum = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.maximum = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_S_B,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 loop filter alpha offset",
+		.minimum = -12,
+		.maximum = 12,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 loop filter beta offset",
+		.minimum = -12,
+		.maximum = 12,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 entorpy mode",
+		.minimum = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.maximum = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of ref. picture of P",
+		.minimum = 1,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "H264 8x8 transform enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "MB level rate control",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_RC_FRAME_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Frame rate",
+		.minimum = 1,
+		.maximum = FRAME_RATE_RESOLUTION,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Frame QP value",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "H264 dark region adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "H264 smooth region adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "H264 static region adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "H264 MB activity adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 P frame QP value",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 B frame QP value",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Aspect ratio VUI enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VUI aspect ratio IDC",
+		.minimum = V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED,
+		.maximum = V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Horizontal size of SAR",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Vertical size of SAR",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_GOP_CLOSURE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "GOP closure",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 I period",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Hierarchical Coding",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Type",
+		.minimum = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
+		.maximum = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer QP",
+		.minimum = 0,
+		.maximum = ((6 << 16) | 0xFFFF), /* (index << 16) | value */
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "frame pack sei generation flag",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Current frame is frame 0 flag",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frame packing arrangement type",
+		.minimum = V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_SIDE_BY_SIDE,
+		.maximum = V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TEMPORAL,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_SIDE_BY_SIDE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_FMO,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Flexible Macroblock Order",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Map type for FMO",
+		.minimum = V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES,
+		.maximum = V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Number of slice groups for FMO",
+		.minimum = 1,
+		.maximum = 4,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "FMO Run Length",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Direction of the slice group",
+		.minimum = V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_RIGHT,
+		.maximum = V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_LEFT,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_RIGHT,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Size of the first slice group",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_ASO,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Arbitrary Slice Order",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "ASO Slice order",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_PREPEND_SPSPPS_TO_IDR,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Prepend SPS/PPS to every IDR",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 profile",
+		.minimum = V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE,
+		.maximum = V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 level",
+		.minimum = V4L2_MPEG_VIDEO_MPEG4_LEVEL_0,
+		.maximum = V4L2_MPEG_VIDEO_MPEG4_LEVEL_6,
+		.step = 1,
+		.default_value = V4L2_MPEG_VIDEO_MPEG4_LEVEL_0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 Frame QP value",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_QPEL,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Quarter pixel search enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 P frame QP value",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 B frame QP value",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_MPEG4_VOP_TIME_RES,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 vop time resolution",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_MPEG4_VOP_FRM_DELTA,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 frame delta",
+		.minimum = 1,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_H263_RC_FRAME_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H263 Frame rate",
+		.minimum = 1,
+		.maximum = BIT(8) - 1,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H263 Frame QP value",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H263 P frame QP value",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
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
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_STATUS,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frame Status",
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
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_VERSION,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 version",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_I_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Frame QP value",
+		.minimum = 0,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_P_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Frame QP value",
+		.minimum = 0,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_RC_FRAME_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Frame rate",
+		.minimum = 1,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_NUM_OF_PARTITIONS,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 number of partitions",
+		.minimum = 0,
+		.maximum = 8,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_FILTER_LEVEL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 loop filter level",
+		.minimum = 0,
+		.maximum = 63,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_FILTER_SHARPNESS,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 loop filter sharpness",
+		.minimum = 0,
+		.maximum = 7,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_GOLDEN_FRAMESEL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 indication of golden frame",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_GF_REFRESH_PERIOD,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 indication of golden frame",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "VP8 hierarchy QP enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 layer0 QP value",
+		.minimum = 0,
+		.maximum = ((2 << 16) | 0xFFFF), /* (index << 16) | value */
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 layer1 QP value",
+		.minimum = 0,
+		.maximum = ((2 << 16) | 0xFFFF), /* (index << 16) | value */
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_HIERARCHY_QP_LAYER2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 layer2 QP value",
+		.minimum = 0,
+		.maximum = ((2 << 16) | 0xFFFF), /* (index << 16) | value */
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_REF_NUMBER_FOR_PFRAMES,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Number of reference picture",
+		.minimum = 1,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_DISABLE_INTRA_MD4X4,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "VP8 intra 4x4 mode disable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC70_VIDEO_VP8_NUM_TEMPORAL_LAYER,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "VP8 number of hierarchical layer",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_VERSION,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 version",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 profile",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_LEVEL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 level",
+		.minimum = 10,
+		.maximum = 62,
+		.step = 1,
+		.default_value = 10,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_I_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Frame QP value",
+		.minimum = 1,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_P_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Frame QP value",
+		.minimum = 1,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_RC_FRAME_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Frame rate",
+		.minimum = 1,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_GOLDEN_FRAMESEL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 indication of golden frame",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_GF_REFRESH_PERIOD,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 indication of golden frame",
+		.minimum = 0,
+		.maximum = (BIT(16) - 1),
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHY_QP_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "VP9 hierarchy QP enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 layer0 QP value",
+		.minimum = 0,
+		.maximum = ((2 << 16) | 0xFFFF), /* (index << 16) | value */
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_REF_NUMBER_FOR_PFRAMES,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Number of reference picture",
+		.minimum = 1,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "VP9 number of hierarchical layer",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MAX_PARTITION_DEPTH,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "VP9 Maximum coding unit depth",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_DISABLE_INTRA_PU_SPLIT,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "VP9 disable intra pu split",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit0",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit1",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_BIT2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit2",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Change",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DISABLE_IVF_HEADER,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "IVF header generation",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Frame QP value",
+		.minimum = -12,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC P frame QP value",
+		.minimum = -12,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC B frame QP value",
+		.minimum = -12,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_DARK,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC dark region adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_SMOOTH,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC smooth region adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_STATIC,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC static region adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_ADAPTIVE_RC_ACTIVITY,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC activity adaptive",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC Profile",
+		.minimum = 0,
+		.maximum = 4,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC level",
+		.minimum = 10,
+		.maximum = 62,
+		.step = 1,
+		.default_value = 10,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_TIER_FLAG,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC tier_flag default is Main",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_RC_FRAME_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Frame rate",
+		.minimum = 1,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_MAX_PARTITION_DEPTH,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Maximum coding unit depth",
+		.minimum = 0,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 2,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REF_NUMBER_FOR_PFRAMES,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Number of reference picture",
+		.minimum = 1,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REFRESH_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Number of reference picture",
+		.minimum = 0,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_CONST_INTRA_PRED_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC refresh type",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LOSSLESS_CU_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC lossless encoding select",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_WAVEFRONT_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC Wavefront enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_DISABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC Filter disable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_SLICE_BOUNDARY,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "across or not slice boundary",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LTR_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "long term reference enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_QP_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "QP values for temporal layer",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_TYPE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Hierarchical Coding Type",
+		.minimum = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
+		.maximum = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer",
+		.minimum = 0,
+		.maximum = 7,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer QP",
+		.minimum = 0,
+		.maximum = ((6 << 16) | 0xFFFF), /* (index << 16) | value */
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer BIT0",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer BIT1",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer BIT2",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT3,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer BIT3",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT4,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer BIT4",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT5,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer BIT5",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_BIT6,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer BIT6",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Change",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_SIGN_DATA_HIDING,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC Sign data hiding",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_GENERAL_PB_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC General pb enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_TEMPORAL_ID_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC Temporal id enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_STRONG_SMOTHING_FLAG,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC Strong intra smoothing flag",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_DISABLE_INTRA_PU_SPLIT,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC disable intra pu split",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_DISABLE_TMV_PREDICTION,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "HEVC disable tmv prediction",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "max number of candidate MVs",
+		.minimum = 0,
+		.maximum = 4,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_WITHOUT_STARTCODE_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "ENC without startcode enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_REFRESH_PERIOD,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Number of reference picture",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_BETA_OFFSET_DIV2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC loop filter beta offset",
+		.minimum = -6,
+		.maximum = 6,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_LF_TC_OFFSET_DIV2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC loop filter tc offset",
+		.minimum = -6,
+		.maximum = 6,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC size of length field",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_USER_REF,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "user long term reference frame",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC90_VIDEO_HEVC_STORE_REF,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "store long term reference frame",
+		.minimum = 0,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 0, /* need to check default value */
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
+		.id = V4L2_CID_MPEG_MFC_GET_EXTRA_BUFFER_SIZE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Get extra buffer size",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
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
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit0",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit1",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit2",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT3,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit3",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT4,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit4",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT5,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit5",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT6,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit6",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Change",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit0",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit1",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_BIT2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Bit2",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding Layer Change",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_H264_ENABLE_LTR,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Enable LTR",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_H264_NUM_OF_LTR,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Number of LTR",
+		.minimum = 0,
+		.maximum = 4,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_H264_MARK_LTR,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Set the frame as a LTRP",
+		.minimum = 0,
+		.maximum = 4,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_H264_USE_LTR,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Specify a LTRP for encoding",
+		.minimum = 0,
+		.maximum = 0xF,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Base Layer Priority",
+		.minimum = 0,
+		.maximum = 63,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_CONFIG_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "QP control per each frame",
+		.minimum = -12,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_H264_VUI_RESTRICTION_ENABLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 vui generation enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_PREPEND_SPSPPS_TO_IDR,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Prepend SPS/PPS to every IDR",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_CONFIG_QP_ENABLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "set dynamic qp controls",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_ROI_CONTROL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Region-Of-Interest control",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_ROI_ENABLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Region-Of-Interest enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Min QP value for I frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Max QP value for I frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Min QP value for I frame",
+		.minimum = -12,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Max QP value for I frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 Min QP value for I frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 Max QP value for I frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H263_MIN_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H263 Min QP value for I frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H263_MAX_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H263 Max QP value for I frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MIN_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Min QP value for I frame",
+		.minimum = 0,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MAX_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Max QP value for I frame",
+		.minimum = 0,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MIN_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Min QP value for I frame",
+		.minimum = 1,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MAX_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Max QP value for I frame",
+		.minimum = 1,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Min QP value for P frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Max QP value for P frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Min QP value for P frame",
+		.minimum = -12,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Max QP value for P frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 Min QP value for P frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 Max QP value for P frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H263_MIN_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H263 Min QP value for P frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H263_MAX_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H263 Max QP value for P frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MIN_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Min QP value for P frame",
+		.minimum = 0,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP8_MAX_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP8 Max QP value for P frame",
+		.minimum = 0,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MIN_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Min QP value for P frame",
+		.minimum = 1,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_VP9_MAX_QP_P,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "VP9 Max QP value for P frame",
+		.minimum = 1,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_MIN_QP_B,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Min QP value for B frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_MAX_QP_B,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "H264 Max QP value for B frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP_B,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Min QP value for B frame",
+		.minimum = -12,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP_B,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "HEVC Max QP value for B frame",
+		.minimum = 0,
+		.maximum = 51,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP_B,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 Min QP value for B frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP_B,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MPEG4 Max QP value for B frame",
+		.minimum = 1,
+		.maximum = 31,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_RC_PVC_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Perceptual Video Coding enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_TEMPORAL_SHORTTERM_MAX_LAYER,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Hierarchical Coding max layer",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_WEIGHTED_ENABLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Weighted Prediction enable",
+		.minimum = 0,
+		.maximum = 3,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_YSUM,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "YSUM for weighted Prediction",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_RATIO_OF_INTRA,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "ratio of intra encoded size",
+		.minimum = 15,
+		.maximum = 50,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_FULL_RANGE_FLAG,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Color range",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_COLOUR_PRIMARIES,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Colour primaries",
+		.minimum = 0,
+		.maximum = 22,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_TRANSFER_CHARACTERISTICS,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Transfer characteristics",
+		.minimum = 0,
+		.maximum = 18,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MATRIX_COEFFICIENTS,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Matrix coefficients",
+		.minimum = 0,
+		.maximum = 10,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_HIERARCHICAL_BITRATE_CTRL,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Hierarchical bitrate control",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 1,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_STATIC_INFO_ENABLE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Static info enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MAX_PIC_AVERAGE_LIGHT,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Max pic average light",
+		.minimum = 0,
+		.maximum = 0xFFFF,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MAX_CONTENT_LIGHT,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Max content light",
+		.minimum = 0,
+		.maximum = 0xFFFF,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MAX_DISPLAY_LUMINANCE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Max display luminance",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MIN_DISPLAY_LUMINANCE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Min display luminance",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_WHITE_POINT,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "White point",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Display primaries 0",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Display primaries 1",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_2,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Display primaries 2",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
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
+		.id = V4L2_CID_MPEG_VIDEO_DROP_CONTROL,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Drop control",
+		.minimum = INT_MIN,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_CHROMA_QP_OFFSET_CB,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Chroma QP index for Cb",
+		.minimum = -12,
+		.maximum = 12,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_CHROMA_QP_OFFSET_CR,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Chroma QP index for Cr",
+		.minimum = -12,
+		.maximum = 12,
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
+		.id = V4L2_CID_MPEG_VIDEO_GDC_VOTF,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "GDC vOTF",
+		.minimum = 0,
+		.maximum = 2,
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
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frames per second in 1000x scale",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 60000,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_GOP_CTRL,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Meaning of GOP_SIZE",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_AVERAGE_QP,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frames average QP",
+		.minimum = 0,
+		.maximum = U8_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MV_SEARCH_MODE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MV search mode",
+		.minimum = 0,
+		.maximum = 2,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MV HOR position L0",
+		.minimum = -128,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MV HOR position L1",
+		.minimum = -128,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L0,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MV VER position L0",
+		.minimum = -128,
+		.maximum = 127,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L1,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MV VER position L1",
+		.minimum = -128,
+		.maximum = 127,
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
+		.id = V4L2_CID_MPEG_VIDEO_MIN_QUALITY,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "MIN quality mode enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MAX_IFRAME_SIZE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "max I frame size",
+		.minimum = 0,
+		.maximum = BIT(16) - 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_WP_TWO_PASS_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "WP two pass encoding enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_MFC_TIMING_INFO_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Timing info enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_ADAPTIVE_GOP_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Adaptive GOP enable",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SUM_SKIP_MB,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of skip MB",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SUM_INTRA_MB,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of intra MB",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_SUM_ZERO_MV_MB,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "The number of zero MV MB",
+		.minimum = 0,
+		.maximum = INT_MAX,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MV_HOR_RANGE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MV HOR Range",
+		.minimum = 16,
+		.maximum = 128,
+		.step = 1,
+		.default_value = 0,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_MV_VER_RANGE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "MV VER Range",
+		.minimum = 16,
+		.maximum = 128,
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
+	{
+		.id = V4L2_CID_MPEG_MFC_MULTI_VIEW_MAIN_TYPE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Main-View Type",
+		.minimum = 0,
+		.maximum = 1,
+		.step = 1,
+		.default_value = 0,
+	},
+};
+
+#define ENC_NUM_CTRLS ARRAY_SIZE(enc_controls)
+/* Find selected format description */
+static struct mfc_fmt *__mfc_enc_find_format(struct mfc_ctx *ctx,
+					     unsigned int pixelformat)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_fmt *fmt = NULL;
+	unsigned long i;
+
+	for (i = 0; i < MFC_NUM_FORMATS; i++) {
+		if ((mfc_formats[i].type & MFC_FMT_STREAM) &&
+		    !(mfc_formats[i].type & MFC_FMT_ENC)) {
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
+	if (fmt && !dev->pdata->support_rgb && (fmt->type & MFC_FMT_RGB)) {
+		mfc_ctx_err("[FRAME] RGB is not supported\n");
+		fmt = NULL;
+	}
+
+	if (fmt && (fmt->type & MFC_FMT_STREAM) &&
+	    dev->pdata->mfc_resource[fmt->codec_mode].op_core_type == MFC_OP_CORE_NOT_FIXED) {
+		mfc_ctx_err("[STREAM] %s is not supported\n", fmt->name);
+		fmt = NULL;
+	}
+
+	return fmt;
+}
+
+static struct v4l2_queryctrl *__mfc_enc_get_ctrl(int id)
+{
+	unsigned long i;
+
+	for (i = 0; i < ENC_NUM_CTRLS; ++i)
+		if (id == enc_controls[i].id)
+			return &enc_controls[i];
+	return NULL;
+}
+
+static int __mfc_enc_check_ctrl_val(struct mfc_ctx *ctx, struct v4l2_control *ctrl)
+{
+	struct v4l2_queryctrl *c;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+
+	c = __mfc_enc_get_ctrl(ctrl->id);
+	if (!c) {
+		mfc_ctx_err("[CTRLS] not supported control id (%#x)\n", ctrl->id);
+		return -EINVAL;
+	}
+
+	if (ctrl->id == V4L2_CID_MPEG_VIDEO_GOP_SIZE && ctrl->value > c->maximum) {
+		mfc_ctx_info("GOP_SIZE is changed to max(%d -> %d)\n",
+			     ctrl->value, c->maximum);
+		ctrl->value = c->maximum;
+	}
+
+	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER ||
+	    ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER) {
+		if ((ctrl->value & ~BIT(16)) < c->minimum ||
+		    (ctrl->value & ~BIT(16)) > c->maximum ||
+				(c->step != 0 && (ctrl->value & ~BIT(16)) % c->step != 0)) {
+			mfc_ctx_err("[CTRLS][%s] Invalid control id: %#x, value: %d (%#x)\n",
+				    c->name, ctrl->id, ctrl->value, ctrl->value);
+			return -ERANGE;
+		} else {
+			return 0;
+		}
+	}
+
+	if (ctrl->id == V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY) {
+		if (ctrl->value < c->minimum ||
+		    (ctrl->value + p->num_hier_max_layer - 1) > c->maximum ||
+				(c->step != 0 && (ctrl->value & ~BIT(16)) % c->step != 0)) {
+			mfc_ctx_err("[CTRLS][%s] Invalid control id: %#x, value: %d (%#x)\n",
+				    c->name, ctrl->id, ctrl->value, ctrl->value);
+			return -ERANGE;
+		} else {
+			return 0;
+		}
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
+static inline int __mfc_enc_h264_profile(struct mfc_ctx *ctx, int profile)
+{
+	int ret = 0;
+
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		ret = MFC_REG_E_PROFILE_H264_MAIN;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		ret = MFC_REG_E_PROFILE_H264_HIGH;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		ret = MFC_REG_E_PROFILE_H264_BASELINE;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		ret = MFC_REG_E_PROFILE_H264_CONSTRAINED_BASELINE;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH:
+		ret = MFC_REG_E_PROFILE_H264_CONSTRAINED_HIGH;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+/* Query capabilities of the device */
+static int mfc_enc_querycap(struct file *file, void *priv,
+			    struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, "MFC", sizeof(cap->driver));
+	strscpy(cap->card, "encoder", sizeof(cap->card));
+
+	return 0;
+}
+
+static int __mfc_enc_enum_fmt(struct mfc_dev *dev, struct v4l2_fmtdesc *f,
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
+		if (!dev->pdata->support_rgb && (mfc_formats[i].type & MFC_FMT_RGB))
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
+static int mfc_enc_enum_fmt_vid_cap_mplane(struct file *file, void *pirv,
+					   struct v4l2_fmtdesc *f)
+{
+	struct mfc_dev *dev = video_drvdata(file);
+
+	return __mfc_enc_enum_fmt(dev, f, MFC_FMT_STREAM);
+}
+
+static int mfc_enc_enum_fmt_vid_out_mplane(struct file *file, void *prov,
+					   struct v4l2_fmtdesc *f)
+{
+	struct mfc_dev *dev = video_drvdata(file);
+
+	return __mfc_enc_enum_fmt(dev, f, MFC_FMT_FRAME);
+}
+
+static int mfc_enc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct mfc_raw_info *raw;
+	int i;
+
+	mfc_ctx_debug_enter();
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_ctx_debug(4, "enc dst g_fmt\n");
+		/* This is run on output (encoder dest) */
+		pix_fmt_mp->width = 0;
+		pix_fmt_mp->height = 0;
+		pix_fmt_mp->field = V4L2_FIELD_NONE;
+		pix_fmt_mp->pixelformat = ctx->dst_fmt->fourcc;
+		pix_fmt_mp->num_planes = ctx->dst_fmt->mem_planes;
+
+		pix_fmt_mp->plane_fmt[0].bytesperline = enc->dst_buf_size;
+		pix_fmt_mp->plane_fmt[0].sizeimage = enc->dst_buf_size;
+	} else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "enc src g_fmt\n");
+		/* This is run on capture (encoder src) */
+		raw = &ctx->raw_buf;
+
+		pix_fmt_mp->width = ctx->img_width;
+		pix_fmt_mp->height = ctx->img_height;
+		pix_fmt_mp->field = V4L2_FIELD_NONE;
+		pix_fmt_mp->pixelformat = ctx->src_fmt->fourcc;
+		pix_fmt_mp->num_planes = ctx->src_fmt->mem_planes;
+		for (i = 0; i < ctx->src_fmt->mem_planes; i++) {
+			pix_fmt_mp->plane_fmt[i].bytesperline = raw->stride[i];
+			pix_fmt_mp->plane_fmt[i].sizeimage = raw->plane_size[i];
+		}
+	} else {
+		mfc_ctx_err("invalid buf type (%d)\n", f->type);
+		return -EINVAL;
+	}
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static int mfc_enc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_fmt *fmt;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+
+	fmt = __mfc_enc_find_format(ctx, pix_fmt_mp->pixelformat);
+	if (!fmt) {
+		mfc_ctx_err("Unsupported format for %s\n",
+			    V4L2_TYPE_IS_OUTPUT(f->type) ? "source" : "destination");
+		return -EINVAL;
+	}
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    fmt->codec_mode == MFC_FORMATS_NO_CODEC) {
+		mfc_ctx_err("MFC_FORMATS_NO_CODEC is invalid to dst(fmt is %s)\n",
+			    fmt->name);
+		return -EINVAL;
+	}
+
+	/* For resource reservation */
+	if ((!ctx->img_width && !ctx->img_height) &&
+	    pix_fmt_mp->width > 0 && pix_fmt_mp->height > 0) {
+		ctx->img_width = pix_fmt_mp->width;
+		ctx->img_height = pix_fmt_mp->height;
+	}
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		ctx->dst_fmt = fmt;
+		ctx->codec_mode = ctx->dst_fmt->codec_mode;
+		ctx->op_core_type = ctx->dev->pdata->mfc_resource[ctx->codec_mode].op_core_type;
+	}
+
+	mfc_ctx_debug(2, "[%s] resolution %dx%d, %s : %s\n",
+		      V4L2_TYPE_IS_OUTPUT(f->type) ? "FRAME" : "STREAM",
+		      ctx->img_width, ctx->img_height,
+		      V4L2_TYPE_IS_OUTPUT(f->type) ? "pixelformat" : "codectype", fmt->name);
+
+	return 0;
+}
+
+static void __mfc_enc_check_format(struct mfc_ctx *ctx)
+{
+	ctx->is_422 = 0;
+	ctx->rgb_bpp = 0;
+
+	switch (ctx->src_fmt->fourcc) {
+	case V4L2_PIX_FMT_NV16M:
+	case V4L2_PIX_FMT_NV61M:
+		mfc_ctx_debug(2, "[FRAME] is 422 format\n");
+		ctx->is_422 = 1;
+		break;
+	case V4L2_PIX_FMT_RGB24:
+		ctx->rgb_bpp = 24;
+		break;
+	case V4L2_PIX_FMT_RGB565:
+		ctx->rgb_bpp = 16;
+		break;
+	case V4L2_PIX_FMT_RGB32X:
+	case V4L2_PIX_FMT_BGR32:
+	case V4L2_PIX_FMT_ARGB32:
+	case V4L2_PIX_FMT_RGB32:
+		ctx->rgb_bpp = 32;
+		break;
+	default:
+		break;
+	}
+	mfc_ctx_debug(2, "[FRAME] 422: %d, rgb: %d\n",
+		      ctx->is_422, ctx->rgb_bpp);
+}
+
+static int __mfc_enc_check_resolution(struct mfc_ctx *ctx)
+{
+	int max_width = 0, max_height = 0, min_width = 0, min_height = 0, swap_check = 0;
+
+	/* Check max resolution */
+	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_H264_ENC:
+		max_width = 8192;
+		max_height = 8192;
+		break;
+	default:
+		mfc_ctx_err("Not supported codec(%d)\n", ctx->codec_mode);
+		return -EINVAL;
+	}
+
+	if (swap_check) {
+		if (!((ctx->crop_width < max_width && ctx->crop_height < max_height) ||
+		      (ctx->crop_width < max_height && ctx->crop_height < max_width))) {
+			mfc_ctx_err("Resolution is too big(%dx%d > %dxi%d or %dx%d\n",
+				    ctx->crop_width, ctx->crop_height, max_width, max_height,
+					max_height, max_width);
+			return -EINVAL;
+		}
+	} else {
+		if (ctx->crop_width > max_width || ctx->crop_height > max_height) {
+			mfc_ctx_err("Resolution is too big(%dx%d > %dx%d)\n",
+				    ctx->crop_width, ctx->crop_height, max_width, max_height);
+			return -EINVAL;
+		}
+	}
+
+	/* Check min resolution */
+	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_H264_ENC:
+		min_width = 32;
+		min_height = 32;
+		break;
+	default:
+		mfc_ctx_err("Not supported codec(%d)\n", ctx->codec_mode);
+		return -EINVAL;
+	}
+
+	if (ctx->crop_width < min_width || ctx->crop_height < min_height) {
+		mfc_ctx_err("Resolution is too small(%dx%d < %dx%d)\n",
+			    ctx->crop_width, ctx->crop_height, min_width, min_height);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mfc_enc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct mfc_dev *dev = video_drvdata(file);
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct mfc_fmt *fmt = NULL;
+	int ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	if (ctx->vq_dst.streaming) {
+		mfc_ctx_err("dst queue busy\n");
+		return -EBUSY;
+	}
+
+	fmt = __mfc_enc_find_format(ctx, pix_fmt_mp->pixelformat);
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
+		ctx->crop_width = ctx->img_width;
+		ctx->crop_height = ctx->img_height;
+	}
+
+	ctx->codec_mode = ctx->dst_fmt->codec_mode;
+	mfc_ctx_info("[STREAM] codectype: %s(%d), %d x %d\n",
+		     ctx->dst_fmt->name, ctx->codec_mode,
+		     ctx->img_width, ctx->img_height);
+
+	if (__mfc_enc_check_resolution(ctx)) {
+		mfc_ctx_err("Unsupported MFC resolution\n");
+		return -EINVAL;
+	}
+
+	if (mfc_check_resolution(ctx)) {
+		mfc_ctx_err("Unsupported product resolution\n");
+		return -EINVAL;
+	}
+
+	enc->dst_buf_size = pix_fmt_mp->plane_fmt[0].sizeimage;
+	pix_fmt_mp->plane_fmt[0].bytesperline = 0;
+
+	ret = mfc_rm_instance_open(dev, ctx);
+	if (ret)
+		mfc_ctx_err("Failed to instance open\n");
+
+	if (dev->pdata->support_enc_mode1 &&
+	    (dev->debugfs.feature_option & MFC_OPTION_SET_MULTI_CORE_FORCE)) {
+		if (dev->debugfs.feature_option & MFC_OPTION_MULTI_CORE_DISABLE) {
+			mfc_ctx_info("[2CORE] multi core mode disabled\n");
+		} else {
+			if (dev->num_inst > 1)
+				mfc_ctx_debug(2, "[2CORE] multi core bits: %#lx, num inst: %d\n",
+					      dev->multi_core_inst_bits, dev->num_inst);
+			ctx->stream_op_mode = MFC_OP_TWO_MODE1;
+			mfc_ctx_info("[2CORE] This stream need to multi core stream_op_mode(%d)\n",
+				     ctx->stream_op_mode);
+		}
+	}
+
+	mfc_ctx_debug_leave();
+	return ret;
+}
+
+static int __mfc_enc_set_num_fd_frame(struct mfc_ctx *ctx,
+				      struct v4l2_pix_format_mplane *pix_fmt_mp)
+{
+	int calc_num_planes;
+	int num_fd_depth_map = 0;
+	int num_view = 1;
+	int num_fd_sub_view_meta = 0;
+
+	if (ctx->multi_view_enable) {
+		if (pix_fmt_mp->flags & MFC_FMT_FLAG_MULTI_VIEW) {
+			num_view = MFC_NUM_MULTI_VIEW;
+			num_fd_sub_view_meta = MFC_NUM_FD_SUB_VIEW_META;
+		}
+		if (pix_fmt_mp->flags & MFC_FMT_FLAG_DEPTH_MAP)
+			num_fd_depth_map = MFC_NUM_FD_DEPTH_MAP;
+
+		calc_num_planes =
+			(ctx->src_fmt->mem_planes + num_fd_depth_map) * num_view +
+			 num_fd_sub_view_meta;
+	} else {
+		calc_num_planes = ctx->src_fmt->mem_planes;
+	}
+
+	if (calc_num_planes != pix_fmt_mp->num_planes)
+		return -EINVAL;
+
+	mfc_set_view_buf_info(ctx, ctx->src_fmt->mem_planes,
+			      num_fd_depth_map, num_fd_sub_view_meta);
+
+	ctx->num_fd_frame = calc_num_planes;
+
+	return 0;
+}
+
+static int mfc_enc_s_fmt_vid_out_mplane(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_fmt *prev_src_fmt = NULL;
+	struct mfc_fmt *fmt = NULL;
+	int i, shift;
+
+	mfc_ctx_debug_enter();
+
+	if (ctx->vq_src.streaming) {
+		mfc_ctx_err("src queue busy\n");
+		return -EBUSY;
+	}
+
+	/* Backup previous format */
+	prev_src_fmt = ctx->src_fmt;
+	fmt = __mfc_enc_find_format(ctx, pix_fmt_mp->pixelformat);
+	if (!fmt) {
+		mfc_ctx_err("Unsupported format for source\n");
+		return -EINVAL;
+	}
+	ctx->src_fmt = fmt;
+
+	if (__mfc_enc_set_num_fd_frame(ctx, pix_fmt_mp)) {
+		mfc_ctx_err("[FRAME] enc src plane number is different (%d != %d)\n",
+			    ctx->num_fd_frame, pix_fmt_mp->num_planes);
+		return -EINVAL;
+	}
+
+	ctx->raw_buf.num_planes = ctx->src_fmt->num_planes;
+	shift = ctx->src_fmt->num_planes - 2;
+	ctx->img_width = pix_fmt_mp->width;
+	ctx->img_height = pix_fmt_mp->height;
+	for (i = 0; i < ctx->src_fmt->mem_planes; i++)
+		ctx->bytesperline[i] = pix_fmt_mp->plane_fmt[i].bytesperline;
+
+	__mfc_enc_check_format(ctx);
+
+	/* Encoder works only single core */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	/* Dynamic Resolution & Format Changes */
+	if (core_ctx->state == MFCINST_FINISHED) {
+		mfc_change_state(core_ctx, MFCINST_GOT_INST);
+		if (ctx->stream_op_mode == MFC_OP_TWO_MODE1) {
+			core = mfc_get_sub_core_lock(dev, ctx);
+			if (core) {
+				core_ctx = core->core_ctx[ctx->num];
+				mfc_change_state(core_ctx, MFCINST_GOT_INST);
+				mfc_clean_core_ctx_int_flags(core_ctx);
+			}
+		}
+		if (ctx->src_fmt->fourcc != prev_src_fmt->fourcc)
+			mfc_info("[DFC] Enc Dynamic Format Changed %s -> %s\n",
+				 prev_src_fmt->name, ctx->src_fmt->name);
+		else
+			mfc_info("[DRC] Enc Dynamic Resolution Changed\n");
+	}
+
+	/* When single fd format, use luma stride for chroma stride */
+	if (IS_SINGLE_FD(ctx, ctx->src_fmt))
+		for (i = 1; i < ctx->src_fmt->num_planes; i++)
+			ctx->bytesperline[i] = ctx->bytesperline[0] >> shift;
+
+	mfc_info("[FRAME] enc src pixelformat : %s\n", ctx->src_fmt->name);
+	mfc_info("[FRAME] resolution w: %d, h: %d, Y stride: %d, C stride: %d\n",
+		 pix_fmt_mp->width, pix_fmt_mp->height,
+		 ctx->bytesperline[0], ctx->bytesperline[1]);
+
+	/*
+	 * It should be keep till buffer size and stride was calculated.
+	 * And it can be changed to real encoding size, if user call the s_crop.
+	 */
+	ctx->crop_width = ctx->img_width;
+	ctx->crop_height = ctx->img_height;
+	mfc_enc_calc_src_size(ctx);
+
+	ctx->output_state = QUEUE_FREE;
+
+	mfc_ctx_debug_leave();
+	return 0;
+}
+
+static int mfc_enc_g_selection(struct file *file, void *fh,
+			       struct v4l2_selection *s)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+
+	mfc_ctx_debug_enter();
+
+	s->r.left = ctx->crop_left;
+	s->r.top = ctx->crop_top;
+	s->r.width = ctx->crop_width;
+	s->r.height = ctx->crop_height;
+
+	mfc_ctx_debug(2, "[FRAME] enc crop w: %d, h: %d, offset l: %d t: %d\n",
+		      ctx->crop_width, ctx->crop_height, ctx->crop_left, ctx->crop_top);
+
+	mfc_ctx_debug_leave();
+
+	return 0;
+}
+
+static int mfc_enc_s_selection(struct file *file, void *priv,
+			       struct v4l2_selection *s)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+
+	mfc_ctx_debug_enter();
+
+	if (!V4L2_TYPE_IS_OUTPUT(s->type)) {
+		mfc_ctx_err("not supported type (It can only in the source)\n");
+		return -EINVAL;
+	}
+
+	if (s->r.left < 0 || s->r.top < 0) {
+		mfc_ctx_err("[FRAME] crop position is negative\n");
+		return -EINVAL;
+	}
+
+	if (s->r.height > ctx->img_height || s->r.top > ctx->img_height ||
+	    s->r.width > ctx->img_width || s->r.left > ctx->img_width ||
+	    (s->r.left > (ctx->img_width - s->r.width)) ||
+	    (s->r.top > (ctx->img_height - s->r.height))) {
+		mfc_ctx_err("[FRAME] Out of crop range: (%d,%d,%d,%d) from %dx%d\n",
+			    s->r.left, s->r.top, s->r.width, s->r.height,
+			    ctx->img_width, ctx->img_height);
+		return -EINVAL;
+	}
+
+	ctx->crop_top = s->r.top;
+	ctx->crop_left = s->r.left;
+	ctx->crop_height = s->r.height;
+	ctx->crop_width = s->r.width;
+
+	mfc_ctx_debug(3, "[FRAME] enc original: %dx%d, crop: %dx%d, offset l: %d t: %d\n",
+		      ctx->img_width, ctx->img_height,
+		      ctx->crop_width, ctx->crop_height,
+		      ctx->crop_left, ctx->crop_top);
+
+	return 0;
+}
+
+static int mfc_enc_reqbufs(struct file *file, void *priv,
+			   struct v4l2_requestbuffers *reqbufs)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	int ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	if (reqbufs->memory == V4L2_MEMORY_MMAP) {
+		mfc_ctx_err("Not supported memory type (%d)\n", reqbufs->memory);
+		return -EINVAL;
+	}
+
+	if (reqbufs->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_ctx_debug(4, "enc dst reqbuf(%d)\n", reqbufs->count);
+
+		if (reqbufs->count == 0) {
+			ret = vb2_reqbufs(&ctx->vq_dst, reqbufs);
+			ctx->capture_state = QUEUE_FREE;
+			return ret;
+		}
+
+		if (ctx->capture_state != QUEUE_FREE) {
+			mfc_ctx_err("invalid capture state: %d\n", ctx->capture_state);
+			return -EINVAL;
+		}
+
+		ret = vb2_reqbufs(&ctx->vq_dst, reqbufs);
+		if (ret) {
+			mfc_ctx_err("error in vb2_reqbufs() for E(D)\n");
+			return ret;
+		}
+
+		ctx->capture_state = QUEUE_BUFS_REQUESTED;
+	} else if (reqbufs->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "enc src reqbuf(%d)\n", reqbufs->count);
+		if (reqbufs->count == 0) {
+			ret = vb2_reqbufs(&ctx->vq_src, reqbufs);
+			ctx->output_state = QUEUE_FREE;
+			return ret;
+		}
+
+		if (ctx->output_state != QUEUE_FREE) {
+			mfc_ctx_err("invalid output state: %d\n", ctx->output_state);
+			return -EINVAL;
+		}
+
+		ret = vb2_reqbufs(&ctx->vq_src, reqbufs);
+		if (ret) {
+			mfc_ctx_err("error in vb2_reqbufs() for E(S)\n");
+			return ret;
+		}
+
+		ctx->output_state = QUEUE_BUFS_REQUESTED;
+	} else {
+		mfc_ctx_err("invalid buf type (%d)\n", reqbufs->type);
+		return -EINVAL;
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+static int mfc_enc_querybuf(struct file *file, void *priv,
+			    struct v4l2_buffer *buf)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	int ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	/* Encoder works only single core */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		mfc_debug(4, "enc dst querybuf, state: %d\n", core_ctx->state);
+		ret = vb2_querybuf(&ctx->vq_dst, buf);
+		if (ret != 0) {
+			mfc_err("enc dst: error in vb2_querybuf()\n");
+			return ret;
+		}
+	} else if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_debug(4, "enc src querybuf, state: %d\n", core_ctx->state);
+		ret = vb2_querybuf(&ctx->vq_src, buf);
+		if (ret != 0) {
+			mfc_err("enc src: error in vb2_querybuf()\n");
+			return ret;
+		}
+	} else {
+		mfc_err("invalid buf type (%d)\n", buf->type);
+		return -EINVAL;
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+/* Queue a buffer */
+static int mfc_enc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	int i, ret = -EINVAL;
+
+	mfc_ctx_debug_enter();
+
+	/* Encoder works only single core */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	if (core_ctx->state == MFCINST_ERROR) {
+		mfc_err("Call on QBUF after unrecoverable error\n");
+		return -EIO;
+	}
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(buf->type)) {
+		mfc_err("Invalid V4L2 Buffer for driver: type(%d)\n", buf->type);
+		return -EINVAL;
+	}
+
+	if (!buf->length) {
+		mfc_err("multiplanar but length is zero\n");
+		return -EIO;
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_debug(4, "enc src buf[%d] Q\n", buf->index);
+
+		if (ctx->num_fd_frame != buf->length) {
+			mfc_err("number of memory container miss-match between Src%s planes(%d) and buffer length(%d)\n",
+				ctx->multi_view_enable ? "(Multi-View)" : "",
+				ctx->num_fd_frame, buf->length);
+			return -EINVAL;
+		}
+
+		mfc_idle_update_queued(dev, ctx);
+		mfc_rate_update_bufq_framerate(ctx, MFC_TS_SRC_Q);
+		mfc_rate_update_framerate(ctx);
+
+		for (i = 0; i < ctx->num_fd_frame; i++) {
+			if (!buf->m.planes[i].bytesused) {
+				mfc_debug(2, "[FRAME] enc src[%d] %s %d\n",
+					  i,
+					  "size zero, changed to buf size",
+					  buf->m.planes[i].length);
+				buf->m.planes[i].bytesused = buf->m.planes[i].length;
+			} else {
+				mfc_debug(2, "[FRAME] enc src[%d] size %d\n",
+					  i, buf->m.planes[i].bytesused);
+			}
+		}
+
+		ret = vb2_qbuf(&ctx->vq_src, NULL, buf);
+	} else {
+		mfc_idle_update_queued(dev, ctx);
+		mfc_rate_update_bufq_framerate(ctx, MFC_TS_DST_Q);
+		mfc_rate_update_framerate(ctx);
+
+		mfc_debug(4, "enc dst buf[%d] Q\n", buf->index);
+		ret = vb2_qbuf(&ctx->vq_dst, NULL, buf);
+	}
+
+	mfc_ctx_debug_leave();
+	return ret;
+}
+
+/* Dequeue a buffer */
+static int mfc_enc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	int ret;
+
+	mfc_ctx_debug_enter();
+
+	/* Encoder works only single core */
+	core = mfc_get_main_core_lock(dev, ctx);
+	core_ctx = core->core_ctx[ctx->num];
+
+	if (core_ctx->state == MFCINST_ERROR) {
+		mfc_err("Call on DQBUF after unrecoverable error\n");
+		return -EIO;
+	}
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(buf->type)) {
+		mfc_err("Invalid V4L2 Buffer for driver: type(%d)\n", buf->type);
+		return -EINVAL;
+	}
+
+	if (buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		ret = vb2_dqbuf(&ctx->vq_src, buf, file->f_flags & O_NONBLOCK);
+		mfc_debug(4, "enc src buf[%d] DQ\n", buf->index);
+	} else {
+		ret = vb2_dqbuf(&ctx->vq_dst, buf, file->f_flags & O_NONBLOCK);
+		mfc_debug(4, "enc dst buf[%d] DQ\n", buf->index);
+	}
+	mfc_ctx_debug_leave();
+	return ret;
+}
+
+/* Stream on */
+static int mfc_enc_streamon(struct file *file, void *priv,
+			    enum v4l2_buf_type type)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	int ret = -EINVAL;
+
+	mfc_ctx_debug_enter();
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(type)) {
+		mfc_ctx_err("Invalid V4L2 Buffer for driver: type(%d)\n", type);
+		return -EINVAL;
+	}
+
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "enc src streamon\n");
+		ret = vb2_streamon(&ctx->vq_src, type);
+		if (!ret)
+			mfc_rm_qos_control(ctx, MFC_QOS_ON);
+	} else {
+		mfc_ctx_debug(4, "enc dst streamon\n");
+		ret = vb2_streamon(&ctx->vq_dst, type);
+	}
+
+	mfc_ctx_debug(2, "src: %d, dst: %d, dpb_count = %d\n",
+		      mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->src_buf_ready_queue),
+		  mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->dst_buf_queue),
+		  ctx->dpb_count);
+	mfc_ctx_debug_leave();
+	return ret;
+}
+
+/* Stream off, which equals to a pause */
+static int mfc_enc_streamoff(struct file *file, void *priv,
+			     enum v4l2_buf_type type)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	int ret = -EINVAL;
+
+	mfc_ctx_debug_enter();
+
+	if (!V4L2_TYPE_IS_MULTIPLANAR(type)) {
+		mfc_ctx_err("Invalid V4L2 Buffer for driver: type(%d)\n", type);
+		return -EINVAL;
+	}
+
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		mfc_ctx_debug(4, "enc src streamoff\n");
+		mfc_rate_reset_last_framerate(ctx);
+
+		ret = vb2_streamoff(&ctx->vq_src, type);
+		if (!ret)
+			mfc_rm_qos_control(ctx, MFC_QOS_OFF);
+	} else {
+		mfc_ctx_debug(4, "enc dst streamoff\n");
+		ret = vb2_streamoff(&ctx->vq_dst, type);
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+static int __mfc_enc_ext_info(struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	int val = 0;
+
+	val |= ENC_SET_SPARE_SIZE;
+	val |= ENC_SET_TEMP_SVC_CH;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->skype))
+		val |= ENC_SET_SKYPE_FLAG;
+
+	val |= ENC_SET_ROI_CONTROL;
+	val |= ENC_SET_QP_BOUND_PB;
+	val |= ENC_SET_FIXED_SLICE;
+	val |= ENC_SET_PVC_MODE;
+	val |= ENC_SET_RATIO_OF_INTRA;
+	val |= ENC_SET_DROP_CONTROL;
+	val |= ENC_SET_CHROMA_QP_CONTROL;
+	val |= ENC_SET_BUF_FLAG_CTRL;
+	val |= ENC_SET_OPERATING_FPS;
+	val |= ENC_SET_GOP_CTRL;
+	val |= ENC_SET_PRIORITY;
+	val |= ENC_SET_TIMING_INFO_ENABLE;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->color_aspect_enc))
+		val |= ENC_SET_COLOR_ASPECT;
+
+	val |= ENC_SET_HP_BITRATE_CONTROL;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->static_info_enc))
+		val |= ENC_SET_STATIC_INFO;
+
+	if (dev->pdata->support_422)
+		val |= ENC_SET_VP9_PROFILE_LEVEL;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->average_qp))
+		val |= ENC_SET_AVERAGE_QP;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->mv_search_mode))
+		val |= ENC_SET_MV_SEARCH_MODE;
+
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->max_i_frame_size))
+		val |= ENC_SET_IFRAME_SIZE;
+
+	/*
+	 * This is the integrated meaning of all the function support below.
+	 * V4L2_CID_MPEG_VIDEO_WP_TWO_PASS_ENABLE
+	 * V4L2_CID_MPEG_VIDEO_ADAPTIVE_GOP_ENABLE
+	 * V4L2_CID_MPEG_VIDEO_SUM_SKIP_MB
+	 * V4L2_CID_MPEG_VIDEO_SUM_INTRA_MB
+	 * V4L2_CID_MPEG_VIDEO_SUM_ZERO_MV_MB
+	 * V4L2_CID_MPEG_VIDEO_MV_HOR_RANGE
+	 * V4L2_CID_MPEG_VIDEO_MV_VER_RANGE
+	 * V4L2_CID_MPEG_MFC_H264_SUB_GOP_ENABLE
+	 * V4L2_CID_MPEG_MFC_H264_SUB_GOP_TYPE
+	 * V4L2_CID_MPEG_MFC_HEVC_SUB_GOP_ENABLE
+	 */
+	if (MFC_FEATURE_SUPPORT(dev, dev->pdata->enc_capability))
+		val |= ENC_SET_CAPABILITY;
+
+	mfc_ctx_debug(5, "[CTRLS] ext info val: %#x\n", val);
+
+	return val;
+}
+
+static int __mfc_enc_get_ctrl_val(struct mfc_ctx *ctx, struct v4l2_control *ctrl)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_ctx_ctrl *ctx_ctrl;
+	int ret = 0;
+	int found = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_MFC51_VIDEO_STREAM_SIZE:
+		ctrl->value = enc->dst_buf_size;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TYPE:
+		ctrl->value = enc->frame_type;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_CHECK_STATE:
+		ctrl->value = MFCSTATE_PROCESSING;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG:
+	case V4L2_CID_MPEG_MFC51_VIDEO_LUMA_ADDR:
+	case V4L2_CID_MPEG_MFC51_VIDEO_CHROMA_ADDR:
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_STATUS:
+	case V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG:
+	case V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG:
+	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:
+	case V4L2_CID_MPEG_VIDEO_SUM_SKIP_MB:
+	case V4L2_CID_MPEG_VIDEO_SUM_INTRA_MB:
+	case V4L2_CID_MPEG_VIDEO_SUM_ZERO_MV_MB:
+		list_for_each_entry(ctx_ctrl, &ctx->ctrls, list) {
+			if (!(ctx_ctrl->type & MFC_CTRL_TYPE_GET))
+				continue;
+
+			if (ctx_ctrl->id == ctrl->id) {
+				if (ctx_ctrl->get.has_new) {
+					ctx_ctrl->get.has_new = 0;
+					ctrl->value = ctx_ctrl->get.val;
+				} else {
+					mfc_ctx_debug(5, "[CTRLS] %s 0x%08x\n",
+						      "Control value is not up to date:",
+						      ctrl->id);
+					if (ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG)
+						ctrl->value = IGNORE_TAG;
+					else
+						return -EINVAL;
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
+	case V4L2_CID_MPEG_MFC_GET_VERSION_INFO:
+		ctrl->value = dev->pdata->ip_ver;
+		break;
+	case V4L2_CID_MPEG_MFC_GET_DRIVER_INFO:
+		ctrl->value = MFC_DRIVER_INFO;
+		break;
+	case V4L2_CID_MPEG_MFC_GET_EXTRA_BUFFER_SIZE:
+		ctrl->value = MFC_LINEAR_BUF_SIZE;
+		break;
+	case V4L2_CID_MPEG_VIDEO_QOS_RATIO:
+		ctrl->value = ctx->qos_ratio;
+		break;
+	case V4L2_CID_MPEG_MFC_GET_EXT_INFO:
+		ctrl->value = __mfc_enc_ext_info(ctx);
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE:
+		ctrl->value = mfc_rate_get_framerate(ctx);
+		break;
+	case V4L2_CID_MPEG_VIDEO_PRIORITY:
+		ctrl->value = ctx->prio;
+		mfc_ctx_debug(2, "[PRIO] user get priority: %d(%d)\n", ctrl->value, ctx->user_prio);
+		break;
+	default:
+		mfc_ctx_err("Invalid control: 0x%08x\n", ctrl->id);
+		ret = -EINVAL;
+		break;
+	}
+
+	mfc_ctx_debug(5, "[CTRLS] get id: %#x, value: %d\n", ctrl->id, ctrl->value);
+
+	return ret;
+}
+
+static inline int __mfc_enc_h264_level(enum v4l2_mpeg_video_h264_level lvl)
+{
+	static unsigned int t[V4L2_MPEG_VIDEO_H264_LEVEL_6_0 + 1] = {
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_0   */ 10,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_1B    */ 9,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_1   */ 11,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_2   */ 12,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_1_3   */ 13,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_2_0   */ 20,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_2_1   */ 21,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_2_2   */ 22,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_3_0   */ 30,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_3_1   */ 31,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_3_2   */ 32,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_4_0   */ 40,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_4_1   */ 41,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_4_2   */ 42,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_5_0   */ 50,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_5_1   */ 51,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_5_2   */ 52,
+		/* V4L2_MPEG_VIDEO_H264_LEVEL_6_0   */ 60,
+	};
+	return t[lvl];
+}
+
+static inline int __mfc_enc_mpeg4_level(enum v4l2_mpeg_video_mpeg4_level lvl)
+{
+	static unsigned int t[V4L2_MPEG_VIDEO_MPEG4_LEVEL_6 + 1] = {
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_0	     */ 0,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B, Simple    */ 9,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_1	     */ 1,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_2	     */ 2,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_3	     */ 3,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_3B, Advanced  */ 7,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_4	     */ 4,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_5	     */ 5,
+		/* V4L2_MPEG_VIDEO_MPEG4_LEVEL_6,  Simple    */ 6,
+	};
+	return t[lvl];
+}
+
+static inline int __mfc_enc_vui_sar_idc(enum v4l2_mpeg_video_h264_vui_sar_idc sar)
+{
+	static unsigned int t[V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED + 1] = {
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED     */ 0,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1             */ 1,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_12x11           */ 2,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_10x11           */ 3,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_16x11           */ 4,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_40x33           */ 5,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_24x11           */ 6,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_20x11           */ 7,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_32x11           */ 8,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_80x33           */ 9,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_18x11           */ 10,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_15x11           */ 11,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_64x33           */ 12,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_160x99          */ 13,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_4x3             */ 14,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_3x2             */ 15,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_2x1             */ 16,
+		/* V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED        */ 255,
+	};
+	return t[sar];
+}
+
+static int __mfc_enc_get_roi(struct mfc_ctx *ctx, int value)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	int index = 0;
+
+	if (enc->sh_handle_roi.fd == -1) {
+		enc->sh_handle_roi.fd = value;
+		if (mfc_mem_get_user_shared_handle(ctx, &enc->sh_handle_roi, "ROI"))
+			return -EINVAL;
+	}
+	index = enc->roi_index;
+
+	/* Copy the ROI info from shared buf */
+	memcpy(&enc->roi_info[index], enc->sh_handle_roi.vaddr,
+	       sizeof(struct mfc_enc_roi_info));
+	if (enc->roi_info[index].size > enc->roi_buf[index].size) {
+		mfc_ctx_err("[MEMINFO][ROI] roi info size %d is over\n",
+			    enc->roi_info[index].size);
+		return -EINVAL;
+	}
+
+	/* Copy the ROI map buffer from user's map buf */
+	if (copy_from_user(enc->roi_buf[index].vaddr,
+			   enc->roi_info[index].addr,
+				enc->roi_info[index].size))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int __mfc_enc_set_param(struct mfc_ctx *ctx, struct v4l2_control *ctrl)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	int ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_QOS_RATIO:
+		ctx->qos_ratio = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_PRIORITY:
+		mfc_ctx_debug(2, "[PRIO] user set priority: %d\n", ctrl->value);
+		ctx->user_prio = ctrl->value;
+		mfc_rm_update_real_time(ctx);
+		break;
+	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+		p->gop_size = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+		p->slice_mode =
+			(enum v4l2_mpeg_video_multi_slice_mode)ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+		p->slice_mb = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+		p->slice_bit = ctrl->value * 8;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB_ROW:
+		p->slice_mb_row = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
+		p->intra_refresh_mb = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_PADDING:
+		p->pad = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV:
+		p->pad_luma = (ctrl->value >> 16) & 0xff;
+		p->pad_cb = (ctrl->value >> 8) & 0xff;
+		p->pad_cr = (ctrl->value >> 0) & 0xff;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		p->rc_frame = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		p->rc_bitrate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF:
+		p->rc_reaction_coeff = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE:
+		enc->force_frame_type = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:
+		p->vbv_buf_size = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+		p->seq_hdr_mode =
+			(enum v4l2_mpeg_video_header_mode)(ctrl->value);
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE:
+		p->frame_skip_mode =
+			(enum v4l2_mpeg_mfc51_video_frame_skip_mode)
+			(ctrl->value);
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT:
+		p->fixed_target_bit = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		p->num_b_frame = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		p->codec.h264.profile =
+		__mfc_enc_h264_profile(ctx, (enum v4l2_mpeg_video_h264_profile)(ctrl->value));
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		p->codec.h264.level =
+		__mfc_enc_h264_level((enum v4l2_mpeg_video_h264_level)(ctrl->value));
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H264_INTERLACE:
+		p->codec.h264.interlace = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+		p->codec.h264.loop_filter_mode =
+		(enum v4l2_mpeg_video_h264_loop_filter_mode)(ctrl->value);
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+		p->codec.h264.loop_filter_alpha = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+		p->codec.h264.loop_filter_beta = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+		p->codec.h264.entropy_mode =
+			(enum v4l2_mpeg_video_h264_entropy_mode)(ctrl->value);
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P:
+		p->num_refs_for_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
+		p->codec.h264._8x8_transform = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
+		p->rc_mb = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H264_RC_FRAME_RATE:
+		p->rc_framerate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+		p->codec.h264.rc_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+		p->codec.h264.rc_min_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+		p->codec.h264.rc_max_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP_P:
+		p->codec.h264.rc_min_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP_P:
+		p->codec.h264.rc_max_qp_p = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP_B:
+		p->codec.h264.rc_min_qp_b = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP_B:
+		p->codec.h264.rc_max_qp_b = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK:
+		p->codec.h264.rc_mb_dark = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH:
+		p->codec.h264.rc_mb_smooth = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC:
+		p->codec.h264.rc_mb_static = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY:
+		p->codec.h264.rc_mb_activity = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+		p->codec.h264.rc_p_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+		p->codec.h264.rc_b_frame_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
+		p->codec.h264.ar_vui = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
+		p->codec.h264.ar_vui_idc =
+		__mfc_enc_vui_sar_idc((enum v4l2_mpeg_video_h264_vui_sar_idc)(ctrl->value));
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:
+		p->codec.h264.ext_sar_width = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:
+		p->codec.h264.ext_sar_height = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
+		p->codec.h264.open_gop = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
+		p->codec.h264.open_gop_size = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
+		p->codec.h264.hier_qp_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
+		p->codec.h264.hier_qp_type =
+		(enum v4l2_mpeg_video_h264_hierarchical_coding_type)(ctrl->value);
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
+		p->codec.h264.num_hier_layer = ctrl->value & 0x7;
+		p->codec.h264.hier_ref_type = (ctrl->value >> 16) & 0x1;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP:
+		p->codec.h264.hier_qp_layer[(ctrl->value >> 16) & 0x7] =
+			ctrl->value & 0xFF;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT0:
+		p->codec.h264.hier_bit_layer[0] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT1:
+		p->codec.h264.hier_bit_layer[1] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT2:
+		p->codec.h264.hier_bit_layer[2] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT3:
+		p->codec.h264.hier_bit_layer[3] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT4:
+		p->codec.h264.hier_bit_layer[4] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT5:
+		p->codec.h264.hier_bit_layer[5] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_BIT6:
+		p->codec.h264.hier_bit_layer[6] = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:
+		p->codec.h264.sei_gen_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0:
+		p->codec.h264.sei_fp_curr_frame_0 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
+		p->codec.h264.sei_fp_arrangement_type = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_FMO:
+		p->codec.h264.fmo_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
+		switch ((enum v4l2_mpeg_video_h264_fmo_map_type)(ctrl->value)) {
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES:
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES:
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_RASTER_SCAN:
+		case V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN:
+			p->codec.h264.fmo_slice_map_type = ctrl->value;
+			break;
+		default:
+			ret = -EINVAL;
+		}
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP:
+		p->codec.h264.fmo_slice_num_grp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH:
+		p->codec.h264.fmo_run_length[(ctrl->value >> 30) & 0x3]	= ctrl->value & 0x3FFFFFFF;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION:
+		p->codec.h264.fmo_sg_dir = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE:
+		p->codec.h264.fmo_sg_rate = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_ASO:
+		p->codec.h264.aso_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER:
+		p->codec.h264.aso_slice_order[(ctrl->value >> 18) & 0x7] &=
+			~(0xFF << (((ctrl->value >> 16) & 0x3) << 3));
+		p->codec.h264.aso_slice_order[(ctrl->value >> 18) & 0x7] |=
+			(ctrl->value & 0xFF) <<	(((ctrl->value >> 16) & 0x3) << 3);
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PREPEND_SPSPPS_TO_IDR:
+		p->codec.h264.prepend_sps_pps_to_idr = ctrl->value ? 1 : 0;
+		break;
+	case V4L2_CID_MPEG_MFC_H264_ENABLE_LTR:
+		p->codec.h264.enable_ltr = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_H264_NUM_OF_LTR:
+		p->codec.h264.num_of_ltr = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY:
+		p->codec.h264.base_priority = ctrl->value;
+		p->codec.h264.set_priority = 1;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_ENABLE:
+		p->roi_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_H264_VUI_RESTRICTION_ENABLE:
+		p->codec.h264.vui_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_CONFIG_QP_ENABLE:
+		p->dynamic_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_CONFIG_QP:
+		p->config_qp = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_RC_PVC_ENABLE:
+		/* It is valid for H.264, HEVC, VP8, VP9 */
+		p->rc_pvc = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_TEMPORAL_SHORTTERM_MAX_LAYER:
+		p->num_hier_max_layer = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC90_VIDEO_HEVC_SIGN_DATA_HIDING:
+		break;
+	case V4L2_CID_MPEG_VIDEO_WEIGHTED_ENABLE:
+		p->weighted_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_RATIO_OF_INTRA:
+		p->ratio_intra = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FULL_RANGE_FLAG:
+		p->check_color_range = 1;
+		p->color_range = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_COLOUR_PRIMARIES:
+		p->colour_primaries = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_TRANSFER_CHARACTERISTICS:
+		p->transfer_characteristics = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MATRIX_COEFFICIENTS:
+		p->matrix_coefficients = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HIERARCHICAL_BITRATE_CTRL:
+		p->hier_bitrate_ctrl = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_STATIC_INFO_ENABLE:
+		p->static_info_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_MAX_PIC_AVERAGE_LIGHT:
+		p->max_pic_average_light = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_MAX_CONTENT_LIGHT:
+		p->max_content_light = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_MAX_DISPLAY_LUMINANCE:
+		p->max_display_luminance = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_MIN_DISPLAY_LUMINANCE:
+		p->min_display_luminance = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_WHITE_POINT:
+		p->white_point = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_0:
+		p->display_primaries_0 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_1:
+		p->display_primaries_1 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_2:
+		p->display_primaries_2 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DROP_CONTROL:
+		p->drop_control = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_CHROMA_QP_OFFSET_CB:
+		p->chroma_qp_offset_cb = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_CHROMA_QP_OFFSET_CR:
+		p->chroma_qp_offset_cr = ctrl->value;
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
+	case V4L2_CID_MPEG_VIDEO_GOP_CTRL:
+		p->gop_ctrl = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_SEARCH_MODE:
+		p->mv_search_mode = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L0:
+		p->mv_hor_pos_l0 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L1:
+		p->mv_hor_pos_l1 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L0:
+		p->mv_ver_pos_l0 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L1:
+		p->mv_ver_pos_l1 = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MIN_QUALITY:
+		p->min_quality_mode = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MAX_IFRAME_SIZE:
+		p->max_i_frame_size = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_WP_TWO_PASS_ENABLE:
+		p->wp_two_pass_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ADAPTIVE_GOP_ENABLE:
+		p->adaptive_gop_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_HOR_RANGE:
+		p->mv_hor_range = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_VER_RANGE:
+		p->mv_ver_range = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_TIMING_INFO_ENABLE:
+		p->timing_info_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_MULTI_VIEW_ENABLE:
+		ctx->multi_view_enable = ctrl->value;
+		break;
+	case V4L2_CID_MPEG_MFC_MULTI_VIEW_MAIN_TYPE:
+		ctx->left_view_id = ((ctrl->value & 0x1) == 0) ? MFC_VIEW_ID_MAIN : MFC_VIEW_ID_SUB;
+		break;
+	/* These are stored in specific variables */
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_LAYER_CH:
+	case V4L2_CID_MPEG_VIDEO_VP9_HIERARCHICAL_CODING_LAYER_CH:
+	case V4L2_CID_MPEG_VIDEO_VP8_HIERARCHICAL_CODING_LAYER_CH:
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH:
+	/* These require control per buffer */
+	case V4L2_CID_MPEG_VIDEO_YSUM:
+	case V4L2_CID_MPEG_VIDEO_ROI_CONTROL:
+	case V4L2_CID_MPEG_MFC_H264_USE_LTR:
+	case V4L2_CID_MPEG_MFC_H264_MARK_LTR:
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG:
+	case V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG:
+	case V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG:
+		break;
+	default:
+		mfc_ctx_err("Invalid control: 0x%08x\n", ctrl->id);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int __mfc_enc_set_ctrl_val_list(struct mfc_ctx *ctx,
+				       struct v4l2_control *ctrl)
+{
+	struct mfc_enc *enc = ctx->enc_priv;
+	struct mfc_enc_params *p = &enc->params;
+	struct mfc_ctx_ctrl *ctx_ctrl;
+	int ret = 0;
+	int found = 0;
+
+	list_for_each_entry(ctx_ctrl, &ctx->ctrls, list) {
+		if (!(ctx_ctrl->type & MFC_CTRL_TYPE_SET))
+			continue;
+
+		if (ctx_ctrl->id == ctrl->id) {
+			ctx_ctrl->set.has_new = 1;
+			ctx_ctrl->set.val = ctrl->value;
+			if (ctx_ctrl->id ==
+				V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH) {
+				if (enc->sh_handle_svc.fd == -1) {
+					enc->sh_handle_svc.fd = ctrl->value;
+					if (mfc_mem_get_user_shared_handle
+						(ctx, &enc->sh_handle_svc, "SVC"))
+						return -EINVAL;
+				}
+			}
+			if (ctx_ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_I_PERIOD_CH &&
+			    p->i_frm_ctrl_mode) {
+				if (!p->gop_ctrl)
+					ctx_ctrl->set.val = ctx_ctrl->set.val *
+						(p->num_b_frame + 1);
+
+				if (ctx_ctrl->set.val >= 0x3FFFFFFF) {
+					mfc_ctx_info("I frame interval is bigger than max: %d\n",
+						     ctx_ctrl->set.val);
+					ctx_ctrl->set.val = 0x3FFFFFFF;
+				}
+			}
+			if (ctx_ctrl->id == V4L2_CID_MPEG_VIDEO_H264_LEVEL)
+				ctx_ctrl->set.val = __mfc_enc_h264_level
+					((enum v4l2_mpeg_video_h264_level)(ctrl->value));
+			if (ctx_ctrl->id == V4L2_CID_MPEG_VIDEO_H264_PROFILE)
+				ctx_ctrl->set.val =
+					__mfc_enc_h264_profile
+					(ctx,
+					 (enum v4l2_mpeg_video_h264_profile)(ctrl->value));
+			if (ctx_ctrl->id == V4L2_CID_MPEG_VIDEO_ROI_CONTROL) {
+				ret = __mfc_enc_get_roi(ctx, ctrl->value);
+				if (ret)
+					return ret;
+			}
+
+			found = 1;
+			break;
+		}
+	}
+
+	if (!found) {
+		mfc_ctx_err("Invalid control: 0x%08x\n", ctrl->id);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int __mfc_enc_set_ctrl_val(struct mfc_ctx *ctx, struct v4l2_control *ctrl)
+{
+	int ret = 0;
+
+	/* update parameter value */
+	ret = __mfc_enc_set_param(ctx, ctrl);
+	if (ret)
+		return ret;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_QOS_RATIO:
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP_P:
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP_P:
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP_B:
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP_B:
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG:
+	case V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE:
+	case V4L2_CID_MPEG_MFC51_VIDEO_I_PERIOD_CH:
+	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_RATE_CH:
+	case V4L2_CID_MPEG_MFC51_VIDEO_BIT_RATE_CH:
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_CH:
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+	case V4L2_CID_MPEG_MFC_H264_MARK_LTR:
+	case V4L2_CID_MPEG_MFC_H264_USE_LTR:
+	case V4L2_CID_MPEG_MFC_H264_BASE_PRIORITY:
+	case V4L2_CID_MPEG_MFC_CONFIG_QP:
+	case V4L2_CID_MPEG_VIDEO_ROI_CONTROL:
+	case V4L2_CID_MPEG_VIDEO_YSUM:
+	case V4L2_CID_MPEG_VIDEO_RATIO_OF_INTRA:
+	case V4L2_CID_MPEG_VIDEO_DROP_CONTROL:
+	case V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L0:
+	case V4L2_CID_MPEG_VIDEO_MV_HOR_POSITION_L1:
+	case V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L0:
+	case V4L2_CID_MPEG_VIDEO_MV_VER_POSITION_L1:
+	case V4L2_CID_MPEG_VIDEO_MAX_IFRAME_SIZE:
+	case V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG:
+	case V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG:
+		ret = __mfc_enc_set_ctrl_val_list(ctx, ctrl);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int mfc_enc_g_ext_ctrls(struct file *file, void *priv,
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
+		ret = __mfc_enc_get_ctrl_val(ctx, &ctrl);
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
+static int mfc_enc_s_ext_ctrls(struct file *file, void *priv,
+			       struct v4l2_ext_controls *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct v4l2_ext_control *ext_ctrl;
+	struct v4l2_control ctrl;
+	int i;
+	int ret = 0;
+
+	mfc_ctx_debug_enter();
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
+		ret = __mfc_enc_check_ctrl_val(ctx, &ctrl);
+		if (ret != 0) {
+			f->error_idx = i;
+			break;
+		}
+
+		if (f->which == V4L2_CTRL_CLASS_USER)
+			ret = __mfc_enc_set_ctrl_val(ctx, &ctrl);
+		else
+			ret = __mfc_enc_set_param(ctx, &ctrl);
+		if (ret != 0) {
+			f->error_idx = i;
+			break;
+		}
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+static int mfc_enc_try_ext_ctrls(struct file *file, void *priv,
+				 struct v4l2_ext_controls *f)
+{
+	struct mfc_ctx *ctx = fh_to_mfc_ctx(file->private_data);
+	struct v4l2_ext_control *ext_ctrl;
+	struct v4l2_control ctrl;
+	int i;
+	int ret = 0;
+
+	mfc_ctx_debug_enter();
+
+	if (f->which != V4L2_CTRL_CLASS_CODEC)
+		return -EINVAL;
+
+	for (i = 0; i < f->count; i++) {
+		ext_ctrl = (f->controls + i);
+
+		ctrl.id = ext_ctrl->id;
+		ctrl.value = ext_ctrl->value;
+
+		ret = __mfc_enc_check_ctrl_val(ctx, &ctrl);
+		if (ret != 0) {
+			f->error_idx = i;
+			break;
+		}
+	}
+
+	mfc_ctx_debug_leave();
+
+	return ret;
+}
+
+/* Initialize for default format */
+void mfc_enc_set_default_format(struct mfc_ctx *ctx)
+{
+	struct mfc_fmt *fmt = NULL;
+
+	/* Set default format for source */
+	fmt = __mfc_enc_find_format(ctx, V4L2_PIX_FMT_NV12M);
+	if (!fmt) {
+		/* NEVER come here */
+		mfc_ctx_err("Wrong memory access. Set fmt by mfc_formats[0]\n");
+		fmt = &mfc_formats[0];
+	}
+	ctx->src_fmt = fmt;
+
+	/* Set default format for destination */
+	fmt = __mfc_enc_find_format(ctx, V4L2_PIX_FMT_H264);
+	if (!fmt) {
+		/* NEVER come here */
+		mfc_ctx_err("Wrong memory access. Set fmt by mfc_formats[0]\n");
+		fmt = &mfc_formats[0];
+	}
+	ctx->dst_fmt = fmt;
+}
+
+static const struct v4l2_ioctl_ops mfc_enc_ioctl_ops = {
+	.vidioc_querycap		= mfc_enc_querycap,
+	.vidioc_enum_fmt_vid_cap	= mfc_enc_enum_fmt_vid_cap_mplane,
+	.vidioc_enum_fmt_vid_out	= mfc_enc_enum_fmt_vid_out_mplane,
+	.vidioc_g_fmt_vid_cap_mplane	= mfc_enc_g_fmt,
+	.vidioc_g_fmt_vid_out_mplane	= mfc_enc_g_fmt,
+	.vidioc_try_fmt_vid_cap_mplane	= mfc_enc_try_fmt,
+	.vidioc_try_fmt_vid_out_mplane	= mfc_enc_try_fmt,
+	.vidioc_s_fmt_vid_cap_mplane	= mfc_enc_s_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_out_mplane	= mfc_enc_s_fmt_vid_out_mplane,
+	.vidioc_g_selection		= mfc_enc_g_selection,
+	.vidioc_s_selection		= mfc_enc_s_selection,
+	.vidioc_reqbufs			= mfc_enc_reqbufs,
+	.vidioc_querybuf		= mfc_enc_querybuf,
+	.vidioc_qbuf			= mfc_enc_qbuf,
+	.vidioc_dqbuf			= mfc_enc_dqbuf,
+	.vidioc_streamon		= mfc_enc_streamon,
+	.vidioc_streamoff		= mfc_enc_streamoff,
+	.vidioc_g_ext_ctrls		= mfc_enc_g_ext_ctrls,
+	.vidioc_s_ext_ctrls		= mfc_enc_s_ext_ctrls,
+	.vidioc_try_ext_ctrls		= mfc_enc_try_ext_ctrls,
+};
+
+const struct v4l2_ioctl_ops *mfc_get_enc_v4l2_ioctl_ops(void)
+{
+	return &mfc_enc_ioctl_ops;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.h b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.h
new file mode 100644
index 000000000000..93cca69ae385
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_enc_v4l2.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_ENC_V4L2_H
+#define __MFC_ENC_V4L2_H __FILE__
+
+#include "base/mfc_common.h"
+
+const struct v4l2_ioctl_ops *mfc_get_enc_v4l2_ioctl_ops(void);
+void mfc_enc_set_default_format(struct mfc_ctx *ctx);
+
+#endif /* __MFC_ENC_V4L2_H */
-- 
2.34.1

