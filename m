Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D1BAB7B6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC42610E4DB;
	Tue, 30 Sep 2025 05:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="CX6JPlWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BC810E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:14 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250930035535epoutp048b71f69618617ab889f522f02856f366~p8zRQOHnq1866718667epoutp04A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250930035535epoutp048b71f69618617ab889f522f02856f366~p8zRQOHnq1866718667epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204535;
 bh=1M5DyEI/r7OAsRulfbScNOurvCqrSGtcLH7HJ2j50Uc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CX6JPlWkpB1uHdFoiX8wSgYLSUl0QO+lIV3ivDkI2MGdjp2iQw0J6lVwzoEXNUU4B
 V4Bt0t6u/BWVleYX4faabXJwzBiubi3Ow9cHUeCx7ujZINbzUzl2HUjgixGFtnkEO1
 pUgHm1meOpVP1AyQejzlVB7SBCn8brU/41XTV6xU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250930035534epcas5p10478f6c6370cbbba27c9f3d4d4c73cec~p8zQjUx4I2443624436epcas5p1G;
 Tue, 30 Sep 2025 03:55:34 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPNK2NJRz6B9mB; Tue, 30 Sep
 2025 03:55:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250930035527epcas5p3e6b8c8040341cd99e6e73c9db7a4d74e~p8zKNbC002823728237epcas5p3m;
 Tue, 30 Sep 2025 03:55:27 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035525epsmtip130b1aa521afca33e581f2fe5e454eaef~p8zHySW_K2908429084epsmtip1i;
 Tue, 30 Sep 2025 03:55:25 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 03/29] media: mfc: Add MFC driver data structures and
 debugging macros
Date: Tue, 30 Sep 2025 09:33:22 +0530
Message-Id: <20250930040348.3702923-4-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035527epcas5p3e6b8c8040341cd99e6e73c9db7a4d74e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035527epcas5p3e6b8c8040341cd99e6e73c9db7a4d74e
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035527epcas5p3e6b8c8040341cd99e6e73c9db7a4d74e@epcas5p3.samsung.com>
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

This patch introduces the core data structures and debugging
infrastructure for the Samsung Exynos MFC (Multi‑Format Codec) driver.

mfc_data_struct.h
  Defines all driver‑wide constants, enums, and structures required
    for MFC core, contexts, buffers, QoS, and platform data.
  Includes definitions for codec types, instance states, buffer usage,
    logging options, feature flags, and hardware resources.
  Provides the main struct mfc_dev, struct mfc_core, struct mfc_ctx,
    and related helper structures.

mfc_debug.h
  Implements a comprehensive set of debug macros (mfc_debug,
    mfc_ctx_debug, mfc_core_debug, etc.) with configurable logging levels.
  Adds error‑handling macros and trace utilities for device,
    core, and context tracing.
  Supports printing to the kernel log based on the
    driver’s debugfs.logging_option settings.

These additions lay the groundwork for the MFC driver’s functionality,
enabling detailed logging, state tracking, and proper management of
codec resources.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_data_struct.h | 985 ++++++++++++++++++
 .../samsung/exynos-mfc/base/mfc_debug.h       | 247 +++++
 2 files changed, 1232 insertions(+)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_debug.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
new file mode 100644
index 000000000000..59fef39095d2
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
@@ -0,0 +1,985 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * mfc_data_struct.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_DATA_STRUCT_H
+#define __MFC_DATA_STRUCT_H __FILE__
+
+#include <linux/videodev2.h>
+#include <linux/cma.h>
+#include <linux/genalloc.h>
+#include <linux/pm_qos.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "mfc_media.h"
+
+/* DEBUGFS */
+#define MFC_DEFAULT_LOGGING_OPTION	0x7
+
+#define MFC_NUM_CORE			2
+#define MFC_NUM_CONTEXTS		32
+#define MFC_MAX_PLANES			3
+#define MFC_MAX_DPBS			64
+#define MFC_MAX_BUFFERS			32
+#define MFC_MAX_EXTRA_BUF		10
+#define MFC_SFR_LOGGING_COUNT_SET0	10
+#define MFC_SFR_LOGGING_COUNT_SET1	28
+#define MFC_SFR_LOGGING_COUNT_SET2	32
+#define MFC_LOGGING_DATA_SIZE		950
+/* the number of priority is 2N(num of OPP) + 2 */
+#define MFC_MAX_PRIO			12
+/* The number of display DRC max frames that can occur continuously in NAL_Q */
+#define MFC_MAX_DRC_FRAME		MFC_MAX_BUFFERS
+
+/* The last number of the standard(MFC_REG_CODEC_BPG_ENC) supported by MFC + 1 */
+#define MFC_MAX_CODEC_TYPE		(33 + 1)
+
+/* Maximum number of temporal layers */
+#define VIDEO_MAX_TEMPORAL_LAYERS	7
+
+/* Batch mode */
+#define MAX_NUM_IMAGES_IN_VB		8
+
+/* QoS */
+#define MAX_TIME_INDEX			15
+#define MAX_NUM_CLUSTER			3
+#define MAX_NUM_MFC_BPS			2
+#define MAX_NUM_MFC_FREQ		10
+#define MAX_NUM_QOS_DYNAMIC		10
+
+#define MFC_FMT_FLAG_MULTI_VIEW		0x0010
+#define MFC_FMT_FLAG_DEPTH_MAP		0x0020
+
+#define MFC_NUM_SPECIAL_BUF_NAME	25
+
+#define BANK_L_CTX			0
+#define BANK_R_CTX			1
+#define BANK_NUM			2
+
+/**
+ * enum mfc_inst_type - The type of an MFC device node.
+ */
+enum mfc_node_type {
+	MFCNODE_INVALID = -1,
+	MFCNODE_DECODER = 0,
+	MFCNODE_ENCODER = 1,
+	MFCNODE_DECODER_DRM = 2,
+	MFCNODE_ENCODER_DRM = 3,
+	MFCNODE_ENCODER_OTF = 4,
+	MFCNODE_ENCODER_OTF_DRM = 5,
+};
+
+/**
+ * enum mfc_dev_state - The type of an MFC device.
+ */
+enum mfc_core_state {
+	MFCCORE_INIT	= 0,
+	MFCCORE_ERROR	= 1,
+};
+
+/**
+ * enum mfc_inst_type - The type of an MFC instance.
+ */
+enum mfc_inst_type {
+	MFCINST_INVALID = 0,
+	MFCINST_DECODER = 1,
+	MFCINST_ENCODER = 2,
+};
+
+/**
+ * enum mfc_inst_state - The state of an MFC instance.
+ */
+enum mfc_inst_state {
+	MFCINST_FREE = 0,
+	MFCINST_INIT = 100,
+	MFCINST_RUNNING,
+	MFCINST_RETURN_INST,
+	MFCINST_ERROR,
+	MFCINST_ABORT
+};
+
+enum mfc_buf_usage_type {
+	MFCBUF_INVALID = 0,
+	MFCBUF_NORMAL,
+	MFCBUF_DRM,
+	MFCBUF_NORMAL_FW,
+	MFCBUF_DRM_FW,
+};
+
+enum mfc_frame_error_type {
+	MFC_ERR_FRAME_NO_ERR		= 0,
+	MFC_ERR_FRAME_CONCEALMENT	= 1,
+	MFC_ERR_FRAME_SYNC_POINT	= 2,
+	MFC_ERR_FRAME_BROKEN		= 3,
+};
+
+enum mfc_do_cache_flush {
+	MFC_NO_CACHEFLUSH		= 0,
+	MFC_CACHEFLUSH			= 1,
+};
+
+enum mfc_idle_mode {
+	MFC_IDLE_MODE_NONE	= 0,
+	MFC_IDLE_MODE_RUNNING	= 1,
+	MFC_IDLE_MODE_IDLE	= 2,
+	MFC_IDLE_MODE_CANCEL	= 3,
+};
+
+enum mfc_debug_cause {
+	/* panic cause */
+	MFC_CAUSE_0WRITE_PAGE_FAULT		= 0,
+	MFC_CAUSE_0PAGE_FAULT			= 1,
+	MFC_CAUSE_1WRITE_PAGE_FAULT		= 2,
+	MFC_CAUSE_1PAGE_FAULT			= 3,
+	MFC_CAUSE_NO_INTERRUPT			= 4,
+	MFC_CAUSE_NO_SCHEDULING			= 5,
+	MFC_CAUSE_FAIL_STOP_NAL_Q		= 6,
+	MFC_CAUSE_FAIL_STOP_NAL_Q_FOR_OTHER	= 7,
+	MFC_CAUSE_FAIL_CLOSE_INST		= 8,
+	MFC_CAUSE_FAIL_SLEEP			= 9,
+	MFC_CAUSE_FAIL_WAKEUP			= 10,
+	MFC_CAUSE_FAIL_RISC_ON			= 11,
+	MFC_CAUSE_FAIL_DPB_FLUSH		= 12,
+	MFC_CAUSE_FAIL_CACHE_FLUSH		= 13,
+	MFC_CAUSE_FAIL_MOVE_INST		= 14,
+};
+
+enum mfc_core_type {
+	MFC_CORE_INVALID		= -1,
+	MFC_CORE_MAIN			= 0,
+	MFC_CORE_SUB			= 1,
+	MFC_CORE_TYPE_NUM		= 2,
+};
+
+enum mfc_op_core_type {
+	MFC_OP_CORE_NOT_FIXED	= -1,
+	MFC_OP_CORE_FIXED_0	= 0,
+	MFC_OP_CORE_FIXED_1	= 1,
+	MFC_OP_CORE_ALL		= 2,
+};
+
+enum mfc_op_mode {
+	MFC_OP_SINGLE			= 0,
+	MFC_OP_TWO_MODE1		= 1,
+	MFC_OP_TWO_MODE2		= 2,
+	MFC_OP_SWITCHING		= 3,
+	MFC_OP_SWITCH_TO_SINGLE		= 4,
+	MFC_OP_SWITCH_BUT_MODE2		= 5,
+};
+
+enum mfc_enc_gdc_type {
+	MFC_GDC_VOTF			= 1,
+	MFC_GDC_OTF			= 2,
+};
+
+enum mfc_hwacg_type {
+	MFC_HWACG_NONE			= 0,
+	MFC_HWACG_DRV_CTRL		= 1,
+	MFC_HWACG_HWFW_CTRL		= 2,
+};
+
+enum mfc_real_time {
+	/* real-time */
+	MFC_RT                  = 0,
+	/* low-priority real-time */
+	MFC_RT_LOW              = 1,
+	/* constrained real-time */
+	MFC_RT_CON              = 2,
+	/* non real-time */
+	MFC_NON_RT              = 3,
+	MFC_RT_UNDEFINED        = 4,
+};
+
+enum mfc_sched_type {
+	MFC_SCHED_RR		= 0,
+	MFC_SCHED_PRIO		= 1,
+};
+
+/* core driver */
+extern struct platform_driver mfc_core_driver;
+
+struct mfc_ctx;
+struct mfc_core_ctx;
+struct mfc_sched_class;
+
+struct mfc_debug {
+	u32	fw_version;
+	u32	cause;
+	u8	fault_status;
+	u32	fault_trans_info;
+	u64	fault_addr;
+	u32	sfrs_set0[MFC_SFR_LOGGING_COUNT_SET0];
+	u32	sfrs_set1[MFC_SFR_LOGGING_COUNT_SET1];
+	u32	sfrs_set2[MFC_SFR_LOGGING_COUNT_SET2];
+	u8	curr_ctx;
+	u8	state;
+	u8	last_cmd;
+	u32	last_cmd_sec;
+	u32	last_cmd_nsec;
+	u8	last_int;
+	u32	last_int_sec;
+	u32	last_int_nsec;
+	u32	frame_cnt;
+	u8	hwlock_dev;
+	u32	hwlock_ctx;
+	u8	num_inst;
+	u8	power_cnt;
+	u8	clock_cnt;
+	/* for decoder only */
+	u32	last_src_addr;
+	u32	last_dst_addr[MFC_MAX_PLANES];
+	/* total logging data */
+	char	errorinfo[MFC_LOGGING_DATA_SIZE];
+};
+
+enum mfc_view_id {
+	MFC_VIEW_ID_MAIN	= 0,
+	MFC_VIEW_ID_SUB		= 1,
+};
+
+/**
+ * struct mfc_buf - MFC buffer
+ *
+ */
+struct mfc_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	dma_addr_t addr[MAX_NUM_IMAGES_IN_VB][MFC_MAX_PLANES];
+	phys_addr_t paddr;
+	struct dma_buf *dmabufs[MAX_NUM_IMAGES_IN_VB][MFC_MAX_PLANES];
+	struct dma_buf_attachment *attachments[MAX_NUM_IMAGES_IN_VB][MFC_MAX_PLANES];
+	size_t sg_size;
+	int src_index;
+	int dpb_index;
+	int next_index;
+	int done_index;
+	int used;
+	int num_valid_bufs;
+	unsigned char *vir_addr[MFC_MAX_PLANES];
+	u32 flag;
+	unsigned long i_ino;
+};
+
+struct mfc_buf_queue {
+	struct list_head head;
+	unsigned int count;
+};
+
+struct mfc_hwlock {
+	struct list_head waiting_list;
+	unsigned int wl_count;
+	unsigned long bits;
+	unsigned long dev;
+	unsigned int owned_by_irq;
+	unsigned int transfer_owner;
+	/* protection */
+	spinlock_t lock;
+};
+
+struct mfc_listable_wq {
+	struct list_head list;
+	wait_queue_head_t wait_queue;
+	/* protection */
+	struct mutex wait_mutex;
+	struct mfc_dev *dev;
+	struct mfc_core *core;
+	struct mfc_ctx *ctx;
+	struct mfc_core_ctx *core_ctx;
+};
+
+struct mfc_core_intlock {
+	int lock;
+	unsigned long bits;
+	unsigned long pending;
+	/* protection */
+	struct mutex core_mutex;
+};
+
+struct mfc_core_lock {
+	int cnt;
+	/* protection */
+	spinlock_t lock;
+	wait_queue_head_t wq;
+};
+
+struct mfc_pm {
+	struct clk	*clock;
+	atomic_t	pwr_ref;
+	atomic_t	protect_ref;
+	struct device	*device;
+	/* protection */
+	spinlock_t	clklock;
+
+	int clock_on_steps;
+	int clock_off_steps;
+	enum mfc_buf_usage_type base_type;
+};
+
+enum mfc_fw_status {
+	MFC_FW_NONE		= 0,
+	MFC_FW_ALLOC		= BIT(0),	// 0x1
+	MFC_CTX_ALLOC		= BIT(1),	// 0x2
+	MFC_FW_LOADED		= BIT(2),	// 0x4
+	MFC_FW_VERIFIED		= BIT(3),	// 0x8
+	MFC_FW_PROTECTED	= BIT(4),	// 0x10
+	MFC_FW_INITIALIZED	= BIT(5),	// 0x20
+};
+
+struct mfc_fw {
+	int			date;
+	int			fimv_info;
+	size_t			fw_size;
+	enum mfc_fw_status	status;
+};
+
+struct mfc_ctx_buf_size {
+	size_t dev_ctx;
+	size_t dbg_info_buf;
+};
+
+struct mfc_buf_size {
+	size_t firmware_code;
+	unsigned int cpb_buf;
+	struct mfc_ctx_buf_size *ctx_buf;
+};
+
+struct mfc_variant {
+	struct mfc_buf_size *buf_size;
+	int	num_entities;
+};
+
+enum mfc_sfr_dump_type {
+	MFC_DUMP_NONE			= 0,
+	MFC_DUMP_DEC_SEQ_START		= BIT(0),
+	MFC_DUMP_DEC_INIT_BUFS		= BIT(1),
+	MFC_DUMP_DEC_FIRST_NAL_START	= BIT(2),
+	MFC_DUMP_ENC_SEQ_START		= BIT(3),
+	MFC_DUMP_ENC_INIT_BUFS		= BIT(4),
+	MFC_DUMP_ENC_FIRST_NAL_START	= BIT(5),
+	MFC_DUMP_ERR_INT		= BIT(6),
+	MFC_DUMP_WARN_INT		= BIT(7),
+	MFC_DUMP_DEC_NAL_START		= BIT(8),
+	MFC_DUMP_DEC_FRAME_DONE		= BIT(9),
+	MFC_DUMP_ENC_NAL_START		= BIT(10),
+	MFC_DUMP_ENC_FRAME_DONE		= BIT(11),
+	MFC_DUMP_MOVE_INSTANCE_RET	= BIT(12),
+	MFC_DUMP_UNKNOWN_INT		= BIT(13),
+	MFC_DUMP_DEC_SEQ_DONE		= BIT(15),
+	MFC_DUMP_DEC_INIT_BUF_DONE	= BIT(16),
+	MFC_DUMP_DEC_FIRST_FRAME_DONE	= BIT(17),
+	MFC_DUMP_ENC_SEQ_DONE		= BIT(18),
+	MFC_DUMP_ENC_INIT_BUF_DONE	= BIT(19),
+	MFC_DUMP_ENC_FIRST_FRAME_DONE	= BIT(20),
+	MFC_DUMP_DEC_CRC		= BIT(29),
+	MFC_DUMP_FIRMWARE		= BIT(30),
+	MFC_DUMP_ALL_INFO		= BIT(31),
+};
+
+enum mfc_logging_option {
+	MFC_LOGGING_NONE		= 0,
+	MFC_LOGGING_PRINTK		= BIT(0),
+	MFC_LOGGING_MEMLOG_PRINTF	= BIT(1),
+	MFC_LOGGING_MEMLOG_SFR_DUMP	= BIT(2),
+	MFC_LOGGING_MEMLOG		= (BIT(1) | BIT(2)),
+	MFC_LOGGING_ALL			= 0x7,
+};
+
+enum mfc_feature_option {
+	MFC_OPTION_NONE			= 0,
+	MFC_OPTION_RECON_SBWC_DISABLE	= BIT(0),
+	MFC_OPTION_DECODING_ORDER	= BIT(1),
+	MFC_OPTION_MEERKAT_DISABLE	= BIT(2),
+	MFC_OPTION_OTF_PATH_TEST_ENABLE	= BIT(3),
+	MFC_OPTION_MULTI_CORE_DISABLE	= BIT(4),
+	MFC_OPTION_SET_MULTI_CORE_FORCE	= BIT(5),
+	MFC_OPTION_BLACK_BAR_ENABLE	= BIT(6),
+	MFC_OPTION_DEC_ENC_SBWC_ENABLE	= BIT(7),
+	MFC_OPTION_DYNAMIC_QOS_DISABLE	= BIT(8),
+	MFC_OPTION_USE_FIXED_WEIGHT	= BIT(9),
+	MFC_OPTION_FPS_SBWC_ENABLE	= BIT(10),
+	MFC_OPTION_FILMGRAIN_DISABLE	= BIT(11),
+	MFC_OPTION_SW_MEMCPY_PLUGIN	= BIT(12),
+	MFC_OPTION_INTER_SBWC_DISABLE	= BIT(13),
+	MFC_OPTION_MSR_ENABLE		= BIT(14),
+	MFC_OPTION_STREAM_COPY_DISABLE	= BIT(15),
+};
+
+enum mfc_get_img_size {
+	MFC_GET_RESOL_SIZE		= 0,
+	MFC_GET_RESOL_DPB_SIZE		= 1,
+};
+
+enum mfc_color_space {
+	MFC_COLORSPACE_UNSPECIFICED	= 0,
+	MFC_COLORSPACE_BT601		= 1,
+	MFC_COLORSPACE_BT709		= 2,
+	MFC_COLORSPACE_SMPTE_170	= 3,
+	MFC_COLORSPACE_SMPTE_240	= 4,
+	MFC_COLORSPACE_BT2020		= 5,
+	MFC_COLORSPACE_RESERVED		= 6,
+	MFC_COLORSPACE_SRGB		= 7,
+};
+
+enum mfc_color_primaries {
+	MFC_PRIMARIES_RESERVED		= 0,
+	MFC_PRIMARIES_BT709_5		= 1,
+	MFC_PRIMARIES_UNSPECIFIED	= 2,
+	MFC_PRIMARIES_BT470_6M		= 4,
+	MFC_PRIMARIES_BT601_6_625	= 5,
+	MFC_PRIMARIES_BT601_6_525	= 6,
+	MFC_PRIMARIES_SMPTE_240M	= 7,
+	MFC_PRIMARIES_GENERIC_FILM	= 8,
+	MFC_PRIMARIES_BT2020		= 9,
+	MFC_PRIMARIES_EG432			= 12,
+};
+
+enum mfc_transfer_characteristics {
+	MFC_TRANSFER_RESERVED		= 0,
+	MFC_TRANSFER_BT709		= 1,
+	MFC_TRANSFER_UNSPECIFIED	= 2,
+	/* RESERVED			= 3, */
+	MFC_TRANSFER_GAMMA_22		= 4,
+	MFC_TRANSFER_GAMMA_28		= 5,
+	MFC_TRANSFER_SMPTE_170M		= 6,
+	MFC_TRANSFER_SMPTE_240M		= 7,
+	MFC_TRANSFER_LINEAR		= 8,
+	MFC_TRANSFER_LOGARITHMIC	= 9,
+	MFC_TRANSFER_LOGARITHMIC_S	= 10,
+	MFC_TRANSFER_XvYCC		= 11,
+	MFC_TRANSFER_BT1361		= 12,
+	MFC_TRANSFER_SRGB		= 13,
+	MFC_TRANSFER_BT2020_1		= 14,
+	MFC_TRANSFER_BT2020_2		= 15,
+	MFC_TRANSFER_ST2084		= 16,
+	MFC_TRANSFER_ST428		= 17,
+	MFC_TRANSFER_HLG		= 18,
+};
+
+enum mfc_matrix_coeff {
+	MFC_MATRIX_COEFF_IDENTITY		= 0,
+	MFC_MATRIX_COEFF_REC709			= 1,
+	MFC_MATRIX_COEFF_UNSPECIFIED		= 2,
+	MFC_MATRIX_COEFF_RESERVED		= 3,
+	MFC_MATRIX_COEFF_470_SYSTEM_M		= 4,
+	MFC_MATRIX_COEFF_470_SYSTEM_BG		= 5,
+	MFC_MATRIX_COEFF_SMPTE170M		= 6,
+	MFC_MATRIX_COEFF_SMPTE240M		= 7,
+	MFC_MATRIX_COEFF_BT2020			= 9,
+	MFC_MATRIX_COEFF_BT2020_CONSTANT	= 10,
+};
+
+struct mfc_debugfs {
+	struct dentry *root;
+	unsigned int debug_level;
+	unsigned int debug_ts;
+	unsigned int debug_mode_en;
+	unsigned int dbg_enable;
+	unsigned int sfr_dump;
+	unsigned int logging_option;
+	unsigned int feature_option;
+	unsigned int sched_perf_disable;
+	unsigned int sched_type;
+};
+
+/**
+ * struct mfc_special_buf - represents internal used buffer
+ * @daddr:		device virtual address
+ * @iova:		device virtual address allocated to the reserved address for F/W,
+ *			it only used for specific internal buffer
+ * @virt:		kernel virtual address, only valid when the
+ *			buffer accessed by driver
+ * @priv_data:		special purpose private data required for each buffer.
+ *			- internal_dpb: timestamp
+ */
+struct mfc_special_buf {
+	enum mfc_buf_usage_type		buftype;
+	struct dma_buf			*dma_buf;
+	struct dma_buf_attachment	*attachment;
+	struct sg_table			*sgt;
+	dma_addr_t			daddr;
+	dma_addr_t			iova;
+	phys_addr_t			paddr;
+	void				*vaddr;
+	size_t				size;
+	size_t				map_size;
+	struct cma			*cma_area;
+	char				name[MFC_NUM_SPECIAL_BUF_NAME];
+	u64				priv_data;
+	struct iosys_map	map;
+};
+
+struct mfc_mem {
+	struct list_head	list;
+	dma_addr_t		addr;
+	size_t			size;
+};
+
+struct mfc_feature {
+	unsigned int support;
+	unsigned int version;
+};
+
+struct mfc_resource {
+	enum mfc_op_core_type op_core_type;
+	int max_kbps;
+};
+
+struct mfc_platdata {
+	/* Debug mode */
+	unsigned int debug_mode;
+
+	/* Resource */
+	struct mfc_resource mfc_resource[MFC_MAX_CODEC_TYPE];
+	/* Features */
+	struct mfc_feature mem_clear;
+	struct mfc_feature wait_fw_status;
+
+	const char *fw_name;
+	unsigned int fw_mem_size;
+	unsigned int reserved_start;
+	unsigned int dma_bit_mask;
+	unsigned int ip_ver;
+	unsigned int iova_threshold;
+
+	unsigned int memlog_size;
+
+	unsigned int scheduler;
+	unsigned int pbs_num_prio;
+	enum mfc_hwacg_type support_hwacg;
+};
+
+struct mfc_core_platdata {
+	/* MFC version */
+	unsigned int ip_ver;
+	/* Sysmmu check */
+	unsigned int share_sysmmu;
+	unsigned int fault_status;
+	unsigned int fault_info1;
+	unsigned int axid_mask;
+	unsigned int mfc_axid;
+	unsigned int tsmux_axid;
+	unsigned int fault_info2;
+	unsigned int pmmuid_shift;
+	unsigned int pmmuid_mask;
+	unsigned int tsmux_pmmuid;
+	unsigned int masterid_shift;
+	unsigned int masterid_mask;
+	unsigned int tsmux_masterid;
+};
+
+struct mfc_dev_memlog {
+	unsigned int log_enable;
+};
+
+struct mfc_core_memlog {
+	unsigned int sfr_enable;
+};
+
+/**
+ * struct mfc_dev - The struct containing driver internal parameters.
+ */
+struct mfc_dev {
+	struct mfc_core	*core[MFC_NUM_CORE];
+	struct mfc_core *plugin;
+	int num_core;
+	int num_subsystem;
+	int fw_date;
+	int fw_changed_info;
+	size_t fw_rmem_offset;
+
+	struct device		*device;
+	struct device		*mem_dev[BANK_NUM];
+	struct device		*cache_op_dev;
+	struct v4l2_device	v4l2_dev;
+	struct video_device	*vfd_dec;
+	struct video_device	*vfd_enc;
+
+	struct mfc_platdata	*pdata;
+	struct mfc_variant	*variant;
+
+	struct iommu_domain	*domain;
+	struct gen_pool		*iova_pool;
+
+	int num_inst;
+	int num_dec_inst;
+	int num_enc_inst;
+
+	unsigned long multi_core_inst_bits;
+
+	/* protection */
+	struct mutex mfc_mutex;
+
+	struct mfc_ctx *ctx[MFC_NUM_CONTEXTS];
+	struct mfc_ctx *move_ctx[MFC_NUM_CONTEXTS];
+	dma_addr_t dma_base[BANK_NUM];
+
+	struct list_head ctx_list;
+	/* protection */
+	spinlock_t ctx_list_lock;
+
+	atomic_t queued_bits;
+	/* protection */
+	spinlock_t idle_bits_lock;
+
+	/* Trace */
+	atomic_t trace_ref;
+	struct _mfc_trace *mfc_trace;
+	atomic_t trace_ref_longterm;
+	struct _mfc_trace *mfc_trace_longterm;
+	atomic_t trace_ref_rm;
+	struct _mfc_trace *mfc_trace_rm;
+
+	/* Debugfs and dump */
+	struct mfc_debugfs debugfs;
+
+	struct mfc_dev_memlog memlog;
+
+};
+
+struct mfc_core_ops {
+	int (*instance_init)(struct mfc_core *core, struct mfc_ctx *ctx);
+	int (*instance_deinit)(struct mfc_core *core, struct mfc_ctx *ctx);
+};
+
+struct dump_info {
+	char		*name;
+	void            *addr;
+	u64             size;
+};
+
+struct mfc_core {
+	struct device		*device;
+	struct iommu_domain	*domain;
+
+	const struct mfc_core_ops *core_ops;
+
+	void __iomem		*regs_base;
+	void __iomem		*sysmmu0_base;
+	void __iomem		*sysmmu1_base;
+	void __iomem		*pmu_base;
+	void __iomem		*cmu_busc_base;
+	void __iomem		*cmu_mif0_base;
+	void __iomem		*cmu_mif1_base;
+	void __iomem		*cmu_mif2_base;
+	void __iomem		*cmu_mif3_base;
+
+	unsigned int		id;
+	char			name[10];
+	int			irq;
+	struct resource		*mfc_mem;
+
+	struct mfc_variant	*variant;
+	struct mfc_core_platdata *core_pdata;
+
+	struct mfc_sched_class *sched;
+	enum mfc_sched_type	sched_type;
+
+	enum mfc_core_state state;
+
+	bool has_2sysmmu;
+	bool has_cmu;
+	bool has_pmu;
+
+	/* Power and Clock */
+	atomic_t clk_ref;
+	struct mfc_pm	pm;
+	bool continue_clock_on;
+	bool sleep;
+	bool shutdown;
+
+	/* Internal buffers */
+	struct mfc_fw		fw;
+	struct mfc_special_buf	fw_buf;
+	struct mfc_special_buf	common_ctx_buf;
+	struct mfc_special_buf	dbg_info_buf;
+
+	/* Context information */
+	struct mfc_dev *dev;
+	struct mfc_core_ctx *core_ctx[MFC_NUM_CONTEXTS];
+	int curr_core_ctx;
+	int preempt_core_ctx;
+	int num_inst;
+
+	int int_condition;
+	int int_reason;
+	unsigned int int_err;
+
+	/* PBS */
+	int num_prio;
+	int total_num_prio;
+	unsigned long prio_work_bits[MFC_MAX_PRIO];
+	/* protection */
+	spinlock_t prio_work_lock;
+	int last_core_ctx[MFC_MAX_PRIO];
+	int max_runtime;
+	int next_ctx_idx;
+
+	/* HW lock */
+	struct mfc_hwlock hwlock;
+	struct mfc_listable_wq hwlock_wq;
+	wait_queue_head_t cmd_wq;
+
+	/* batch mode */
+	int batch_enable;
+	int batch_index;
+	/* protection */
+	spinlock_t batch_lock;
+
+	/* QoS idle */
+	atomic_t hw_run_bits;
+	/* protection */
+	struct mutex idle_qos_mutex;
+	enum mfc_idle_mode idle_mode;
+	struct timer_list mfc_idle_timer;
+	struct workqueue_struct *mfc_idle_wq;
+	struct work_struct mfc_idle_work;
+
+	/* for DRM */
+	int cache_flush_flag;
+	int last_cmd_has_cache_flush;
+
+	/* QoS */
+	struct list_head qos_queue;
+	atomic_t qos_req_cur;
+
+	/* protection */
+	struct mutex qos_mutex;
+	int mfc_freq_by_bps;
+	int last_mfc_freq;
+	int last_table_type;
+	unsigned long total_mb;
+	unsigned int cpu_boost_enable;
+
+	/* Logging trace data */
+	atomic_t trace_ref_log;
+	struct _mfc_trace_logging *mfc_trace_logging;
+	struct mfc_debug *logging_data;
+	int last_cmd;
+	int last_int;
+	struct timespec64 last_cmd_time;
+	struct timespec64 last_int_time;
+
+	/* debug info dump */
+	struct dump_info dbg_info;
+
+	/* Debug */
+	struct mfc_core_memlog memlog;
+};
+
+struct mfc_ctx_ctrl_val {
+	int has_new;
+	int val;
+};
+
+struct mfc_ctx_ctrl {
+	struct list_head list;
+	unsigned int id;
+	unsigned int addr;
+	struct mfc_ctx_ctrl_val set;
+	struct mfc_ctx_ctrl_val get;
+};
+
+struct mfc_buf_ctrl {
+	struct list_head list;
+	unsigned int id;
+	int has_new;
+	int val;
+	unsigned int old_val;		/* only for MFC_CTRL_TYPE_SET */
+	unsigned int old_val2;		/* only for MFC_CTRL_TYPE_SET */
+	unsigned int is_volatile;	/* only for MFC_CTRL_TYPE_SET */
+	unsigned int updated;
+	unsigned int mode;
+	unsigned int addr;
+	unsigned int mask;
+	unsigned int shft;
+	unsigned int flag_mode;		/* only for MFC_CTRL_TYPE_SET */
+	unsigned int flag_addr;		/* only for MFC_CTRL_TYPE_SET */
+	unsigned int flag_shft;		/* only for MFC_CTRL_TYPE_SET */
+};
+
+struct mfc_ctrl_cfg {
+	unsigned int id;
+	unsigned int is_volatile;	/* only for MFC_CTRL_TYPE_SET */
+	unsigned int mode;
+	unsigned int addr;
+	unsigned int mask;
+	unsigned int shft;
+	unsigned int flag_mode;		/* only for MFC_CTRL_TYPE_SET */
+	unsigned int flag_addr;		/* only for MFC_CTRL_TYPE_SET */
+	unsigned int flag_shft;		/* only for MFC_CTRL_TYPE_SET */
+};
+
+struct mfc_user_shared_handle {
+	int fd;
+	struct dma_buf *dma_buf;
+	void *vaddr;
+	size_t data_size;
+};
+
+struct mfc_raw_info {
+	int num_planes;
+	int stride[3];
+	int plane_size[3];
+	int stride_2bits[3];
+	int plane_size_2bits[3];
+	unsigned int total_plane_size;
+};
+
+struct dpb_table {
+	dma_addr_t addr[MFC_MAX_PLANES];
+	phys_addr_t paddr;
+	size_t size;
+	int fd[MFC_MAX_PLANES];
+	int new_fd; /* it means first plane only */
+	int mapcnt;
+	int ref;
+	int queued;
+	struct dma_buf *dmabufs[MFC_MAX_PLANES];
+	struct dma_buf_attachment *attach[MFC_MAX_PLANES];
+	struct sg_table *sgt[MFC_MAX_PLANES];
+};
+
+struct mfc_fmt {
+	char *name;
+	u32 fourcc;
+	u32 codec_mode;
+	u32 type;
+	u32 num_planes;
+	u32 mem_planes;
+};
+
+enum mfc_multi_view_buf_idx {
+	MFC_MV_BUF_IDX_VIEW0		= 0,
+	MFC_MV_BUF_IDX_VIEW0_DEPTH,
+	MFC_MV_BUF_IDX_VIEW1,
+	MFC_MV_BUF_IDX_VIEW1_DEPTH,
+	MFC_MV_BUF_IDX_VIEW1_META,
+	/* the number of index */
+	MFC_MV_BUF_IDX_MAX,
+};
+
+/**
+ * struct mfc_ctx - This struct contains the instance context
+ */
+struct mfc_ctx {
+	struct mfc_dev *dev;
+
+	int num;
+	int prio;
+	int user_prio;
+	enum mfc_real_time rt;
+
+	enum mfc_inst_type type;
+
+	/* operation mode */
+	int op_core_num[MFC_NUM_CORE];
+	int move_core_num[MFC_NUM_CORE];
+	enum mfc_op_mode stream_op_mode;
+	enum mfc_op_mode op_mode;
+	enum mfc_op_core_type op_core_type;
+	struct mfc_core_lock corelock;
+
+	/* protection */
+	struct mutex op_mode_mutex;
+	int last_op_core;
+
+	/* interrupt lock */
+	struct mfc_core_intlock intlock;
+
+	/* Control values */
+	int codec_mode;
+	__u32 pix_format;
+
+	int is_heif_mode;
+
+	int is_dpb_realloc;
+	/* protection */
+	int clear_work_bit;
+
+	/* Extra Buffers */
+	int mv_buffer_allocated;
+	struct mfc_special_buf mv_buf;
+
+	unsigned long framerate;
+
+	/* bitrate control for QoS*/
+	struct list_head bitrate_list;
+	int bitrate_index;
+	int bitrate_is_full;
+	int kbps;
+	int last_bps_section;
+	int load;
+	unsigned long weighted_mb;
+	struct list_head list;
+
+	int disp_ratio;
+
+	int buf_process_type;
+
+	int frame_cnt;
+	dma_addr_t last_src_addr;
+	dma_addr_t last_dst_addr[MFC_MAX_PLANES];
+
+	bool mem_type_10bit;
+
+	unsigned long gdc_ready_buf_ino;
+	/* protection */
+	spinlock_t gdc_lock;
+
+	/* QoS idle */
+	enum mfc_idle_mode idle_mode;
+
+	/* external structure */
+	struct v4l2_fh fh;
+	struct vb2_queue vq_src;
+	struct vb2_queue vq_dst;
+
+	u32 ready_to_be_multi_view_enable;
+	u32 multi_view_enable;
+	u32 left_view_id;
+
+	/* DRC (Display Resolution Change) */
+	u32 handle_drc_multi_mode;
+};
+
+struct mfc_core_ctx {
+	struct mfc_core *core;
+	struct mfc_ctx *ctx;
+
+	int num;
+	int inst_no;
+	int int_condition;
+	int int_reason;
+	unsigned int int_err;
+	bool check_dump;
+
+	enum mfc_inst_state state;
+	enum mfc_inst_state prev_state;
+
+	/* Extra Buffers */
+	struct mfc_special_buf instance_ctx_buf;
+
+	/* wait queue */
+	wait_queue_head_t cmd_wq;
+
+	struct mfc_listable_wq hwlock_wq;
+};
+
+struct mfc_sched_class {
+	void (*create_work)(struct mfc_core *core);
+	void (*init_work)(struct mfc_core *core);
+	void (*clear_all_work)(struct mfc_core *core);
+	void (*set_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx);
+	void (*clear_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx);
+};
+#endif /* __MFC_DATA_STRUCT_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_debug.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_debug.h
new file mode 100644
index 000000000000..02a6a0bbbceb
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_debug.h
@@ -0,0 +1,247 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * mfc_debug.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_DEBUG_H
+#define __MFC_DEBUG_H __FILE__
+
+#define DEBUG
+
+#ifdef DEBUG
+
+#define mfc_debug(level, fmt, args...)								\
+	do {											\
+		if ((core_ctx->core->dev->debugfs.logging_option & MFC_LOGGING_PRINTK) &&	\
+		    core_ctx->core->dev->debugfs.debug_level >= (level))		\
+			dev_info(core_ctx->core->device, "[c:%d] %s:%d: " fmt,\
+				core_ctx->num, __func__, __LINE__, ##args);	\
+	} while (0)
+
+#define mfc_ctx_debug(level, fmt, args...)							\
+	do {											\
+		if ((ctx->dev->debugfs.logging_option & MFC_LOGGING_PRINTK) &&			\
+		    ctx->dev->debugfs.debug_level >= (level))					\
+			dev_info(ctx->dev->device, "[c:%d] %s:%d: " fmt,			\
+				ctx->num, __func__, __LINE__, ##args);				\
+	} while (0)
+
+#define mfc_core_debug(level, fmt, args...)							\
+	do {											\
+		if ((core->dev->debugfs.logging_option & MFC_LOGGING_PRINTK) &&			\
+		    core->dev->debugfs.debug_level >= (level))					\
+			dev_info(core->device, "%s:%d: " fmt,					\
+				__func__, __LINE__, ##args);					\
+	} while (0)
+
+#define mfc_dev_debug(level, fmt, args...)							\
+	do {											\
+		if ((dev->debugfs.logging_option & MFC_LOGGING_PRINTK) &&			\
+		    dev->debugfs.debug_level >= (level))					\
+			dev_info(dev->device, "%s:%d: " fmt,					\
+				 __func__, __LINE__, ##args);					\
+	} while (0)
+
+#else
+#define mfc_debug(fmt, args...)
+#define mfc_ctx_debug(fmt, args...)
+#define mfc_core_debug(fmt, args...)
+#define mfc_dev_debug(fmt, args...)
+#endif
+
+#define mfc_debug_enter()	mfc_debug(5, "enter\n")
+#define mfc_debug_leave()	mfc_debug(5, "leave\n")
+#define mfc_ctx_debug_enter()	mfc_ctx_debug(5, "enter\n")
+#define mfc_ctx_debug_leave()	mfc_ctx_debug(5, "leave\n")
+#define mfc_core_debug_enter()	mfc_core_debug(5, "enter\n")
+#define mfc_core_debug_leave()	mfc_core_debug(5, "leave\n")
+#define mfc_dev_debug_enter()	mfc_dev_debug(5, "enter\n")
+#define mfc_dev_debug_leave()	mfc_dev_debug(5, "leave\n")
+
+/* ERROR */
+#define mfc_pr_err(fmt, args...)								\
+	pr_err("[Exynos][MFC][ ERROR]: %s:%d: " fmt, __func__, __LINE__, ##args)
+
+#define mfc_dev_err(fmt, args...)								\
+	do {											\
+		if (dev->debugfs.logging_option & MFC_LOGGING_PRINTK)				\
+			dev_err(dev->device, "%s:%d: " fmt,					\
+				__func__, __LINE__, ##args);					\
+												\
+	} while (0)
+
+#define mfc_core_err(fmt, args...)								\
+	do {											\
+		if (core->dev->debugfs.logging_option & MFC_LOGGING_PRINTK)			\
+			dev_err(core->device, "%s:%d: " fmt,					\
+				__func__, __LINE__, ##args);					\
+												\
+	} while (0)
+
+#define mfc_ctx_err(fmt, args...)								\
+	do {											\
+		if (ctx->dev->debugfs.logging_option & MFC_LOGGING_PRINTK)			\
+			dev_err(ctx->dev->device,						\
+				"[c:%d] %s:%d: " fmt,						\
+			ctx->num, __func__, __LINE__, ##args);					\
+												\
+	} while (0)
+
+#define mfc_err(fmt, args...)									\
+	do {											\
+		if (core_ctx->core->dev->debugfs.logging_option & MFC_LOGGING_PRINTK)		\
+			dev_err(core_ctx->core->device,						\
+				"[c:%d] %s:%d: " fmt,						\
+			core_ctx->num, __func__, __LINE__, ##args);				\
+												\
+	} while (0)
+
+#define mfc_dev_info(fmt, args...)								\
+	do {											\
+		if (dev->debugfs.logging_option & MFC_LOGGING_PRINTK)				\
+			dev_info(dev->device, "%s:%d: " fmt,					\
+				__func__, __LINE__, ##args);					\
+												\
+	} while (0)
+
+#define mfc_core_info(fmt, args...)								\
+	do {											\
+		if (core->dev->debugfs.logging_option & MFC_LOGGING_PRINTK)			\
+			dev_info(core->device, "%s:%d: " fmt,					\
+				__func__, __LINE__, ##args);					\
+												\
+	} while (0)
+
+#define mfc_ctx_info(fmt, args...)								\
+	do {											\
+		if (ctx->dev->debugfs.logging_option & MFC_LOGGING_PRINTK)			\
+			dev_info(ctx->dev->device,						\
+				"[c:%d] %s:%d: " fmt,						\
+				ctx->num, __func__, __LINE__, ##args);				\
+	} while (0)
+
+#define mfc_info(fmt, args...)									\
+	do {											\
+		if (core_ctx->core->dev->debugfs.logging_option & MFC_LOGGING_PRINTK)		\
+			dev_info(core_ctx->core->device,					\
+				"[c:%d] %s:%d: " fmt,						\
+				core_ctx->num, __func__, __LINE__, ##args);			\
+	} while (0)
+
+#define MFC_TRACE_STR_LEN		80
+#define MFC_TRACE_COUNT_MAX		1024
+#define MFC_TRACE_COUNT_PRINT		50
+#define MFC_TRACE_COUNT_PRINT_LONG	100
+#define MFC_TRACE_LOG_STR_LEN		25
+#define MFC_TRACE_LOG_COUNT_MAX		256
+#define MFC_TRACE_LOG_COUNT_PRINT	20
+
+#define MFC_DUMP_BUF_SIZE		SZ_6M
+
+struct _mfc_trace {
+	unsigned long long time;
+	char str[MFC_TRACE_STR_LEN];
+};
+
+struct _mfc_trace_logging {
+	unsigned long long time;
+	char str[MFC_TRACE_LOG_STR_LEN];
+};
+
+/* If there is no core structure */
+#define MFC_TRACE_DEV(fmt, args...)								\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&dev->trace_ref) & (MFC_TRACE_COUNT_MAX - 1);		\
+		dev->mfc_trace[cnt].time = cpu_clock(cpu);					\
+		snprintf(dev->mfc_trace[cnt].str, MFC_TRACE_STR_LEN,				\
+				fmt, ##args);							\
+	} while (0)
+
+/* If there is core structure */
+#define MFC_TRACE_CORE(fmt, args...)								\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&core->dev->trace_ref) & (MFC_TRACE_COUNT_MAX - 1);	\
+		core->dev->mfc_trace[cnt].time = cpu_clock(cpu);				\
+		snprintf(core->dev->mfc_trace[cnt].str, MFC_TRACE_STR_LEN,			\
+				"[MFC%d] "fmt, core->id, ##args);				\
+	} while (0)
+
+/* If there is ctx structure */
+#define MFC_TRACE_CTX(fmt, args...)								\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&ctx->dev->trace_ref) & (MFC_TRACE_COUNT_MAX - 1);	\
+		ctx->dev->mfc_trace[cnt].time = cpu_clock(cpu);					\
+		snprintf(ctx->dev->mfc_trace[cnt].str, MFC_TRACE_STR_LEN,			\
+				"[c:%d] " fmt, ctx->num, ##args);				\
+	} while (0)
+
+/* If there is core_ctx structure */
+#define MFC_TRACE_CORE_CTX(fmt, args...)							\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&core_ctx->core->dev->trace_ref) &			\
+		      (MFC_TRACE_COUNT_MAX - 1);						\
+		core_ctx->core->dev->mfc_trace[cnt].time = cpu_clock(cpu);			\
+		snprintf(core_ctx->core->dev->mfc_trace[cnt].str, MFC_TRACE_STR_LEN,		\
+				"[MFC%d][c:%d] " fmt, core_ctx->core->id,			\
+				core_ctx->num, ##args);						\
+	} while (0)
+
+/* If there is no ctx structure */
+#define MFC_TRACE_DEV_LT(fmt, args...)								\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&dev->trace_ref_longterm) & (MFC_TRACE_COUNT_MAX - 1);	\
+		dev->mfc_trace_longterm[cnt].time = cpu_clock(cpu);				\
+		snprintf(dev->mfc_trace_longterm[cnt].str, MFC_TRACE_STR_LEN,			\
+				fmt, ##args);							\
+	} while (0)
+
+/* If there is ctx structure */
+#define MFC_TRACE_CTX_LT(fmt, args...)								\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&ctx->dev->trace_ref_longterm) &			\
+		      (MFC_TRACE_COUNT_MAX - 1);						\
+		ctx->dev->mfc_trace_longterm[cnt].time = cpu_clock(cpu);			\
+		snprintf(ctx->dev->mfc_trace_longterm[cnt].str, MFC_TRACE_STR_LEN,		\
+				"[c:%d] " fmt, ctx->num, ##args);				\
+	} while (0)
+
+/* If there is core structure */
+#define MFC_TRACE_LOG_CORE(fmt, args...)							\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&core->trace_ref_log) & (MFC_TRACE_LOG_COUNT_MAX - 1);	\
+		core->mfc_trace_logging[cnt].time = cpu_clock(cpu);				\
+		snprintf(core->mfc_trace_logging[cnt].str, MFC_TRACE_LOG_STR_LEN,		\
+				fmt, ##args);							\
+	} while (0)
+
+/* Resource manager dedicated */
+#define MFC_TRACE_RM(fmt, args...)								\
+	do {											\
+		int cpu = raw_smp_processor_id();						\
+		int cnt;									\
+		cnt = atomic_inc_return(&dev->trace_ref_rm) & (MFC_TRACE_COUNT_MAX - 1);	\
+		dev->mfc_trace_rm[cnt].time = cpu_clock(cpu);					\
+		snprintf(dev->mfc_trace_rm[cnt].str, MFC_TRACE_STR_LEN,				\
+				fmt, ##args);				\
+	} while (0)
+#endif /* __MFC_DEBUG_H */
-- 
2.34.1

