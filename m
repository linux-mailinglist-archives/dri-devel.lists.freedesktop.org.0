Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F25BAB7B3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DCA10E4D2;
	Tue, 30 Sep 2025 05:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="GmPIpW5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C749810E271
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:12 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035621epoutp03d6a69e4e361c8d57aadc72182a087fe5~p8z8Mclun3158331583epoutp03Y
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035621epoutp03d6a69e4e361c8d57aadc72182a087fe5~p8z8Mclun3158331583epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204581;
 bh=70sagfgmj1f/Q2Q8CPKwElFUb4xo/jeygmeqzYkwHvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GmPIpW5/bdZ3BU1x2N5cDbHNFxAcPwK5SeP6fGW7AqXC5TZEC63w1KyHKbz1LevZZ
 Dy9vHnWxBetxySmcGj/xjLALNeLj7h2RDtSOXfFTfnW4uMJFH2GtGyLlkr6LAdJuZU
 OFh4iaEb4TNGs2gMo+fTXgjVY9IMwriKltu+6R8M=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250930035620epcas5p1354fd9a7e19e9ec61a9b26f38ee5f11d~p8z7jqe981575615756epcas5p1m;
 Tue, 30 Sep 2025 03:56:20 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPPH69Trz6B9m7; Tue, 30 Sep
 2025 03:56:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035619epcas5p1a3a8cd3e71442235e571c840a78286d8~p8z59h9tt1532115321epcas5p1z;
 Tue, 30 Sep 2025 03:56:19 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035616epsmtip199ef4b002a7cb9438b2754d1267cffad~p8z3hPQXq2880128801epsmtip1U;
 Tue, 30 Sep 2025 03:56:16 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 14/29] =?UTF-8?q?media:=20mfc:=20Add=20buffer=E2=80=91cont?=
 =?UTF-8?q?rol=20framework?=
Date: Tue, 30 Sep 2025 09:33:33 +0530
Message-Id: <20250930040348.3702923-15-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035619epcas5p1a3a8cd3e71442235e571c840a78286d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035619epcas5p1a3a8cd3e71442235e571c840a78286d8
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035619epcas5p1a3a8cd3e71442235e571c840a78286d8@epcas5p1.samsung.com>
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

- Add core buffer‑control module (mfc_core_buf_ctrl.c)
with set/get/recover/restore ops.
- Add context‑control layer (mfc_ctx_ctrl.c) defining
V4L2 decoder controls and per‑buffer handling.
- Export mfc_bufs_ops and mfc_ctrls_ops for integration
with existing MFC core

Provide flexible V4L2‑based management of hardware registers,
including volatile/non‑volatile settings and buffer‑level
restore/recovery.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |   4 +-
 .../samsung/exynos-mfc/mfc_core_buf_ctrl.c    | 160 +++++
 .../samsung/exynos-mfc/mfc_ctx_ctrl.c         | 666 ++++++++++++++++++
 3 files changed, 828 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index 9def2686cd4e..19e38c886255 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -5,7 +5,7 @@ ccflags-y += -I$(srctree)/$(src)
 #Dev interface layer
 exynos_mfc-y += mfc.o
 #Dev control layer
-exynos_mfc-y += mfc_rm.o mfc_debugfs.o
+exynos_mfc-y += mfc_rm.o mfc_ctx_ctrl.o mfc_debugfs.o
 #Core interface layer
 exynos_mfc-y += mfc_core.o mfc_core_ops.o mfc_core_isr.o
 #Core control layer
@@ -13,7 +13,7 @@ exynos_mfc-y += mfc_core_hwlock.o mfc_core_intlock.o mfc_core_run.o
 exynos_mfc-y += mfc_core_pm.o
 exynos_mfc-y += mfc_core_sync.o mfc_core_sched_prio.o
 #Core HW access layer
-exynos_mfc-y += mfc_core_cmd.o
+exynos_mfc-y += mfc_core_buf_ctrl.o mfc_core_cmd.o
 exynos_mfc-y += mfc_core_hw_reg_api.o mfc_core_reg_api.o
 #Plugin interface layer
 #Plugin control layer
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
new file mode 100644
index 000000000000..56dc3e734d02
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_core_buf_ctrl.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_core_reg_api.h"
+
+static int mfc_core_set_buf_ctrls(struct mfc_core *core,
+				  struct mfc_ctx *ctx, struct list_head *head)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+	unsigned int value = 0;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		if (!(buf_ctrl->type & MFC_CTRL_TYPE_SET) || !buf_ctrl->has_new)
+			continue;
+
+		if (buf_ctrl->mode == MFC_CTRL_MODE_SFR) {
+			/* read old vlaue */
+			value = MFC_CORE_READL(buf_ctrl->addr);
+
+			/* save old vlaue for recovery */
+			if (buf_ctrl->is_volatile)
+				buf_ctrl->old_val =
+				    (value >> buf_ctrl->shft) & buf_ctrl->mask;
+
+			/* write new value */
+			value &= ~(buf_ctrl->mask << buf_ctrl->shft);
+			value |=
+			    ((buf_ctrl->val & buf_ctrl->mask)
+			     << buf_ctrl->shft);
+			MFC_CORE_WRITEL(value, buf_ctrl->addr);
+		}
+
+		/* set change flag bit */
+		if (buf_ctrl->flag_mode == MFC_CTRL_MODE_SFR) {
+			value = MFC_CORE_READL(buf_ctrl->flag_addr);
+			value |= BIT(buf_ctrl->flag_shft);
+			MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
+		}
+
+		buf_ctrl->has_new = 0;
+		buf_ctrl->updated = 1;
+
+		if (buf_ctrl->id == V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG)
+			ctx->stored_tag = buf_ctrl->val;
+
+		mfc_ctx_debug(6,
+			      "[CTRLS] Set buffer control id: 0x%08x, val: %d (%#x)\n",
+			      buf_ctrl->id, buf_ctrl->val, buf_ctrl->val);
+	}
+
+	return 0;
+}
+
+static int mfc_core_get_buf_ctrls(struct mfc_core *core,
+				  struct mfc_ctx *ctx, struct list_head *head)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+	unsigned int value = 0;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		if (!(buf_ctrl->type & MFC_CTRL_TYPE_GET))
+			continue;
+
+		if (buf_ctrl->mode == MFC_CTRL_MODE_SFR)
+			value = MFC_CORE_READL(buf_ctrl->addr);
+
+		value = (value >> buf_ctrl->shft) & buf_ctrl->mask;
+
+		buf_ctrl->val = value;
+		buf_ctrl->has_new = 1;
+
+		if (buf_ctrl->id == V4L2_CID_MPEG_VIDEO_FRAME_ERROR_TYPE)
+			buf_ctrl->val = mfc_get_frame_error_type(ctx, value);
+
+		mfc_ctx_debug(6,
+			      "[CTRLS] Get buffer control id: 0x%08x, val: %d (%#x)\n",
+			      buf_ctrl->id, buf_ctrl->val, buf_ctrl->val);
+	}
+
+	return 0;
+}
+
+static int mfc_core_recover_buf_ctrls(struct mfc_core *core,
+				      struct mfc_ctx *ctx,
+				      struct list_head *head)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+	unsigned int value = 0;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		if (!(buf_ctrl->type & MFC_CTRL_TYPE_SET) ||
+		    !buf_ctrl->is_volatile || !buf_ctrl->updated)
+			continue;
+
+		if (buf_ctrl->mode == MFC_CTRL_MODE_SFR) {
+			value = MFC_CORE_READL(buf_ctrl->addr);
+			value &= ~(buf_ctrl->mask << buf_ctrl->shft);
+			value |=
+			    ((buf_ctrl->old_val & buf_ctrl->mask)
+			     << buf_ctrl->shft);
+			MFC_CORE_WRITEL(value, buf_ctrl->addr);
+		}
+
+		/* clear change flag bit */
+		if (buf_ctrl->flag_mode == MFC_CTRL_MODE_SFR) {
+			value = MFC_CORE_READL(buf_ctrl->flag_addr);
+			value &= ~BIT(buf_ctrl->flag_shft);
+			MFC_CORE_WRITEL(value, buf_ctrl->flag_addr);
+		}
+
+		buf_ctrl->updated = 0;
+		mfc_ctx_debug(6,
+			      "[CTRLS] Recover buffer control id: 0x%08x, old val: %d\n",
+			      buf_ctrl->id, buf_ctrl->old_val);
+	}
+
+	return 0;
+}
+
+/*
+ * This function is used when you want to restore buffer ctrls.
+ * 1) NAL_Q stop: It is enqueued in the NAL_Q queue,
+ *		but it must be restored because HW is not used.
+ * 2) DRC: The input buffer that caused the DRC was used for HW, but it must be reused.
+ */
+static int mfc_core_restore_buf_ctrls(struct mfc_ctx *ctx,
+				      struct list_head *head)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		if (!(buf_ctrl->type & MFC_CTRL_TYPE_SET) ||
+		    !(buf_ctrl->updated))
+			continue;
+
+		buf_ctrl->has_new = 1;
+		buf_ctrl->updated = 0;
+
+		mfc_ctx_debug(6,
+			      "[CTRLS] Restore buffer control id: 0x%08x, val: %d\n",
+			      buf_ctrl->id, buf_ctrl->val);
+	}
+
+	return 0;
+}
+
+struct mfc_bufs_ops mfc_bufs_ops = {
+	.core_set_buf_ctrls = mfc_core_set_buf_ctrls,
+	.core_get_buf_ctrls = mfc_core_get_buf_ctrls,
+	.core_recover_buf_ctrls = mfc_core_recover_buf_ctrls,
+	.core_restore_buf_ctrls = mfc_core_restore_buf_ctrls,
+};
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c b/drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c
new file mode 100644
index 000000000000..8846230f1e20
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c
@@ -0,0 +1,666 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_ctx_ctrl.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "base/mfc_common.h"
+
+static struct mfc_ctrl_cfg mfc_dec_ctrl_list[] = {
+	{
+		.type = MFC_CTRL_TYPE_SET_SRC,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_PICTURE_TAG,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_RET_PICTURE_TAG_TOP,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_DISPLAY_STATUS,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_DISPLAY_STATUS,
+		.mask = 0x7,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	/* CRC related definitions are based on non-H.264 type */
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_LUMA,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_DISPLAY_FIRST_PLANE_CRC,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_CHROMA,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_DISPLAY_SECOND_PLANE_CRC,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_CHROMA1,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_DISPLAY_THIRD_PLANE_CRC,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_2BIT_LUMA,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_DISPLAY_FIRST_PLANE_2BIT_CRC,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_DATA_2BIT_CHROMA,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_DISPLAY_SECOND_PLANE_2BIT_CRC,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_CRC_GENERATED,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_DISPLAY_STATUS,
+		.mask = 0x1,
+		.shft = 6,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FP_AVAIL,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_SEI_AVAIL,
+		.mask = 0x1,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRGMENT_ID,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_FRAME_PACK_ARRGMENT_ID,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FP_INFO,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_FRAME_PACK_SEI_INFO,
+		.mask = 0x3FFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_H264_SEI_FP_GRID_POS,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_FRAME_PACK_GRID_POS,
+		.mask = 0xFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_H264_MVC_VIEW_ID,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_MVC_VIEW_ID,
+		.mask = 0xFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MAX_PIC_AVERAGE_LIGHT,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_CONTENT_LIGHT_LEVEL_INFO_SEI,
+		.mask = 0xFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MAX_CONTENT_LIGHT,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_CONTENT_LIGHT_LEVEL_INFO_SEI,
+		.mask = 0xFFFF,
+		.shft = 16,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MAX_DISPLAY_LUMINANCE,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_0,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_MIN_DISPLAY_LUMINANCE,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_1,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_MATRIX_COEFFICIENTS,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_VIDEO_SIGNAL_TYPE,
+		.mask = 0xFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_FORMAT,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_VIDEO_SIGNAL_TYPE,
+		.mask = 0x7,
+		.shft = 26,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_FULL_RANGE_FLAG,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_VIDEO_SIGNAL_TYPE,
+		.mask = 0x1,
+		.shft = 25,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_COLOUR_PRIMARIES,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_VIDEO_SIGNAL_TYPE,
+		.mask = 0xFF,
+		.shft = 16,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_TRANSFER_CHARACTERISTICS,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_VIDEO_SIGNAL_TYPE,
+		.mask = 0xFF,
+		.shft = 8,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_WHITE_POINT,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_2,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_0,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_3,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_1,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_4,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_SEI_DISPLAY_PRIMARIES_2,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_MASTERING_DISPLAY_COLOUR_VOLUME_SEI_5,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_MFC51_VIDEO_FRAME_POC,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_D_RET_PICTURE_TIME_TOP,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{
+		.type = MFC_CTRL_TYPE_GET_DST,
+		.id = V4L2_CID_MPEG_VIDEO_FRAME_ERROR_TYPE,
+		.is_volatile = 0,
+		.mode = MFC_CTRL_MODE_SFR,
+		.addr = MFC_REG_ERROR_CODE,
+		.mask = 0xFFFFFFFF,
+		.shft = 0,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+		.flag_addr = 0,
+		.flag_shft = 0,
+	},
+	{	/* buffer additional information */
+		.type = MFC_CTRL_TYPE_SRC,
+		.id = V4L2_CID_MPEG_VIDEO_SRC_BUF_FLAG,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_NONE,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+	},
+	{	/* buffer additional information */
+		.type = MFC_CTRL_TYPE_DST,
+		.id = V4L2_CID_MPEG_VIDEO_DST_BUF_FLAG,
+		.is_volatile = 1,
+		.mode = MFC_CTRL_MODE_NONE,
+		.flag_mode = MFC_CTRL_MODE_NONE,
+	}
+};
+
+#define NUM_DEC_CTRL_CFGS ARRAY_SIZE(mfc_dec_ctrl_list)
+
+static void mfc_ctrl_cleanup_ctx(struct mfc_ctx *ctx)
+{
+	struct mfc_ctx_ctrl *ctx_ctrl;
+
+	while (!list_empty(&ctx->ctrls)) {
+		ctx_ctrl = list_entry((&ctx->ctrls)->next,
+				      struct mfc_ctx_ctrl, list);
+		list_del(&ctx_ctrl->list);
+		kfree(ctx_ctrl);
+	}
+
+	INIT_LIST_HEAD(&ctx->ctrls);
+}
+
+static int __mfc_ctrl_init_ctx(struct mfc_ctx *ctx, struct mfc_ctrl_cfg *ctrl_list, int count)
+{
+	unsigned long i;
+	struct mfc_ctx_ctrl *ctx_ctrl;
+
+	INIT_LIST_HEAD(&ctx->ctrls);
+
+	for (i = 0; i < count; i++) {
+		ctx_ctrl = kzalloc(sizeof(*ctx_ctrl), GFP_KERNEL);
+		if (!ctx_ctrl) {
+			mfc_ctrl_cleanup_ctx(ctx);
+
+			return -ENOMEM;
+		}
+
+		ctx_ctrl->type = ctrl_list[i].type;
+		ctx_ctrl->id = ctrl_list[i].id;
+		ctx_ctrl->addr = ctrl_list[i].addr;
+		ctx_ctrl->set.has_new = 0;
+		ctx_ctrl->set.val = 0;
+		ctx_ctrl->get.has_new = 0;
+		ctx_ctrl->get.val = 0;
+
+		list_add_tail(&ctx_ctrl->list, &ctx->ctrls);
+	}
+
+	return 0;
+}
+
+static int mfc_ctrl_init_ctx(struct mfc_ctx *ctx)
+{
+	if (ctx->type == MFCINST_DECODER)
+		return __mfc_ctrl_init_ctx(ctx, mfc_dec_ctrl_list, NUM_DEC_CTRL_CFGS);
+
+	mfc_ctx_err("[CTRLS] invalid type %d\n", ctx->type);
+	return -EINVAL;
+}
+
+static void mfc_ctrl_reset_buf(struct list_head *head)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		buf_ctrl->has_new = 0;
+		buf_ctrl->val = 0;
+		buf_ctrl->old_val = 0;
+		buf_ctrl->updated = 0;
+	}
+}
+
+static void __mfc_ctrl_cleanup_buf(struct list_head *head)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+
+	while (!list_empty(head)) {
+		buf_ctrl = list_entry(head->next,
+				      struct mfc_buf_ctrl, list);
+		list_del(&buf_ctrl->list);
+		kfree(buf_ctrl);
+	}
+
+	INIT_LIST_HEAD(head);
+}
+
+static int mfc_ctrl_cleanup_buf(struct mfc_ctx *ctx, enum mfc_ctrl_type type, unsigned int index)
+{
+	struct list_head *head;
+
+	if (index >= MFC_MAX_BUFFERS) {
+		mfc_ctx_err("Per-buffer control index is out of range\n");
+		return -EINVAL;
+	}
+
+	if (type & MFC_CTRL_TYPE_SRC) {
+		if (!(test_and_clear_bit(index, ctx->src_ctrls_avail)))
+			return 0;
+
+		head = &ctx->src_ctrls[index];
+	} else if (type & MFC_CTRL_TYPE_DST) {
+		if (!(test_and_clear_bit(index, ctx->dst_ctrls_avail)))
+			return 0;
+
+		head = &ctx->dst_ctrls[index];
+	} else {
+		mfc_ctx_err("Control type mismatch. type : %d\n", type);
+		return -EINVAL;
+	}
+
+	__mfc_ctrl_cleanup_buf(head);
+
+	return 0;
+}
+
+static int __mfc_ctrl_init_buf(struct mfc_ctx *ctx, struct mfc_ctrl_cfg *ctrl_list,
+			       enum mfc_ctrl_type type, unsigned int index, int count)
+{
+	unsigned long i;
+	struct mfc_buf_ctrl *buf_ctrl;
+	struct list_head *head;
+
+	if (index >= MFC_MAX_BUFFERS) {
+		mfc_ctx_err("Per-buffer control index is out of range\n");
+		return -EINVAL;
+	}
+
+	if (type & MFC_CTRL_TYPE_SRC) {
+		if (test_bit(index, ctx->src_ctrls_avail)) {
+			mfc_ctrl_reset_buf(&ctx->src_ctrls[index]);
+
+			return 0;
+		}
+
+		head = &ctx->src_ctrls[index];
+	} else if (type & MFC_CTRL_TYPE_DST) {
+		if (test_bit(index, ctx->dst_ctrls_avail)) {
+			mfc_ctrl_reset_buf(&ctx->dst_ctrls[index]);
+
+			return 0;
+		}
+
+		head = &ctx->dst_ctrls[index];
+	} else {
+		mfc_ctx_err("Control type mismatch. type : %d\n", type);
+		return -EINVAL;
+	}
+
+	INIT_LIST_HEAD(head);
+
+	for (i = 0; i < count; i++) {
+		if (!(type & ctrl_list[i].type))
+			continue;
+
+		buf_ctrl = kzalloc(sizeof(*buf_ctrl), GFP_KERNEL);
+		if (!buf_ctrl) {
+			__mfc_ctrl_cleanup_buf(head);
+
+			return -ENOMEM;
+		}
+
+		buf_ctrl->type = ctrl_list[i].type;
+		buf_ctrl->id = ctrl_list[i].id;
+		buf_ctrl->is_volatile = ctrl_list[i].is_volatile;
+		buf_ctrl->mode = ctrl_list[i].mode;
+		buf_ctrl->addr = ctrl_list[i].addr;
+		buf_ctrl->mask = ctrl_list[i].mask;
+		buf_ctrl->shft = ctrl_list[i].shft;
+		buf_ctrl->flag_mode = ctrl_list[i].flag_mode;
+		buf_ctrl->flag_addr = ctrl_list[i].flag_addr;
+		buf_ctrl->flag_shft = ctrl_list[i].flag_shft;
+
+		list_add_tail(&buf_ctrl->list, head);
+	}
+
+	mfc_ctrl_reset_buf(head);
+
+	if (type & MFC_CTRL_TYPE_SRC)
+		set_bit(index, ctx->src_ctrls_avail);
+	else
+		set_bit(index, ctx->dst_ctrls_avail);
+
+	return 0;
+}
+
+static int mfc_ctrl_init_buf(struct mfc_ctx *ctx, enum mfc_ctrl_type type, unsigned int index)
+{
+	if (ctx->type == MFCINST_DECODER)
+		return __mfc_ctrl_init_buf(ctx, mfc_dec_ctrl_list, type, index, NUM_DEC_CTRL_CFGS);
+
+	mfc_ctx_err("[CTRLS] invalid type %d\n", ctx->type);
+	return -EINVAL;
+}
+
+static void mfc_ctrl_to_buf(struct mfc_ctx *ctx, struct list_head *head)
+{
+	struct mfc_ctx_ctrl *ctx_ctrl;
+	struct mfc_buf_ctrl *buf_ctrl;
+
+	list_for_each_entry(ctx_ctrl, &ctx->ctrls, list) {
+		if (!(ctx_ctrl->type & MFC_CTRL_TYPE_SET) ||
+		    !ctx_ctrl->set.has_new)
+			continue;
+
+		list_for_each_entry(buf_ctrl, head, list) {
+			if (!(buf_ctrl->type & MFC_CTRL_TYPE_SET))
+				continue;
+
+			if (buf_ctrl->id == ctx_ctrl->id) {
+				buf_ctrl->has_new = 1;
+				buf_ctrl->val = ctx_ctrl->set.val;
+
+				if (buf_ctrl->is_volatile)
+					buf_ctrl->updated = 0;
+
+				ctx_ctrl->set.has_new = 0;
+
+				break;
+			}
+		}
+	}
+}
+
+static void mfc_ctrl_to_ctx(struct mfc_ctx *ctx, struct list_head *head)
+{
+	struct mfc_ctx_ctrl *ctx_ctrl;
+	struct mfc_buf_ctrl *buf_ctrl;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		if (!(buf_ctrl->type & MFC_CTRL_TYPE_GET) || !buf_ctrl->has_new)
+			continue;
+
+		list_for_each_entry(ctx_ctrl, &ctx->ctrls, list) {
+			if (!(ctx_ctrl->type & MFC_CTRL_TYPE_GET))
+				continue;
+
+			if (ctx_ctrl->id == buf_ctrl->id) {
+				if (ctx_ctrl->get.has_new)
+					mfc_ctx_debug(8, "Overwrite ctx_ctrl value id: %#x, val: %d\n",
+						      ctx_ctrl->id, ctx_ctrl->get.val);
+
+				ctx_ctrl->get.has_new = 1;
+				ctx_ctrl->get.val = buf_ctrl->val;
+
+				buf_ctrl->has_new = 0;
+			}
+		}
+	}
+}
+
+static int mfc_ctrl_get_buf_val(struct mfc_ctx *ctx, struct list_head *head, unsigned int id)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+	int value = 0;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		if (buf_ctrl->id == id) {
+			value = buf_ctrl->val;
+			mfc_ctx_debug(6, "[CTRLS] Get buffer control id: 0x%08x, val: %d (%#x)\n",
+				      buf_ctrl->id, value, value);
+			break;
+		}
+	}
+
+	return value;
+}
+
+static void mfc_ctrl_update_buf_val(struct mfc_ctx *ctx, struct list_head *head,
+				    unsigned int id, int value)
+{
+	struct mfc_buf_ctrl *buf_ctrl;
+
+	list_for_each_entry(buf_ctrl, head, list) {
+		if (buf_ctrl->id == id) {
+			buf_ctrl->val = value;
+			mfc_ctx_debug(6, "[CTRLS] Update buffer control id: 0x%08x, val: %d (%#x)\n",
+				      buf_ctrl->id, buf_ctrl->val, buf_ctrl->val);
+			break;
+		}
+	}
+}
+
+struct mfc_ctrls_ops mfc_ctrls_ops = {
+	.cleanup_ctx_ctrls		= mfc_ctrl_cleanup_ctx,
+	.init_ctx_ctrls			= mfc_ctrl_init_ctx,
+	.reset_buf_ctrls		= mfc_ctrl_reset_buf,
+	.cleanup_buf_ctrls		= mfc_ctrl_cleanup_buf,
+	.init_buf_ctrls			= mfc_ctrl_init_buf,
+	.to_buf_ctrls			= mfc_ctrl_to_buf,
+	.to_ctx_ctrls			= mfc_ctrl_to_ctx,
+	.get_buf_ctrl_val		= mfc_ctrl_get_buf_val,
+	.update_buf_val			= mfc_ctrl_update_buf_val,
+};
-- 
2.34.1

