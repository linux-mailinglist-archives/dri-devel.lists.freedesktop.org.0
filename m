Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A386BAB77A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D9F10E4C5;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="WaNEPToo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2636C10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:07 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250930035559epoutp016d6f892a0ca38289b22b06f9a5663825~p8zoDSw0_3202032020epoutp01K
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250930035559epoutp016d6f892a0ca38289b22b06f9a5663825~p8zoDSw0_3202032020epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204559;
 bh=fsLERXRDyCNEbx47LNmWUKpYJ8hnbQ5zgukn3NjaXDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WaNEPTooNpqEECbbQi0r02D5p/a3Frx1vhIW8K/+jgxB1JviULfZut27gmq2NVHup
 IzPGD3pnXpawLh/GrjKOgvoh3wIPuK8SXWDTqiskj6KgsBMtesUjmN842aJa8XoEKU
 Ga6LYGsaLwd7UvwfIx+e+hv5WeuMOIfDesgwacW8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035559epcas5p42b42e0b13edc7de117b553724cb92261~p8znkYwHP2781827818epcas5p4T;
 Tue, 30 Sep 2025 03:55:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cbPNt2NNtz3hhTB; Tue, 30 Sep
 2025 03:55:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250930035557epcas5p2efa9fa41298b8a9aabb46e5fac70d49e~p8zl-U8Rm0060500605epcas5p2a;
 Tue, 30 Sep 2025 03:55:57 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035551epsmtip10b3f862702187955e4e92c4cc8153c6e~p8zgNeRAr2931929319epsmtip1N;
 Tue, 30 Sep 2025 03:55:51 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 09/29] =?UTF-8?q?media:=20mfc:=20Add=20bus=E2=80=91devfreq?=
 =?UTF-8?q?,=20QoS,=20multi=E2=80=91view=20and=20control=20infrastructure?=
Date: Tue, 30 Sep 2025 09:33:28 +0530
Message-Id: <20250930040348.3702923-10-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035557epcas5p2efa9fa41298b8a9aabb46e5fac70d49e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035557epcas5p2efa9fa41298b8a9aabb46e5fac70d49e
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035557epcas5p2efa9fa41298b8a9aabb46e5fac70d49e@epcas5p2.samsung.com>
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

- Optional bus‑devfreq support (CONFIG_MFC_USE_BUS_DEVFREQ).
- New control framework (mfc_ctrl_type, mfc_ctrl_mode, ops structs).
- QoS and per‑context/core power‑clock handling.
- Multi‑view / depth‑map support with related buffers and constants.
- Added helper macros (mfc_macros.h) and extra pixel formats.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../samsung/exynos-mfc/base/mfc_data_struct.h | 659 +++++++++++++++++-
 .../samsung/exynos-mfc/base/mfc_format.h      | 132 ++++
 .../samsung/exynos-mfc/base/mfc_macros.h      |  95 +++
 3 files changed, 882 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_macros.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
index 59fef39095d2..34b4b13b4f01 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
@@ -12,6 +12,13 @@
 #ifndef __MFC_DATA_STRUCT_H
 #define __MFC_DATA_STRUCT_H __FILE__
 
+#if IS_ENABLED(CONFIG_EXYNOS_PM_QOS) || IS_ENABLED(CONFIG_EXYNOS_PM_QOS_MODULE)
+#define CONFIG_MFC_USE_BUS_DEVFREQ
+#endif
+
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+#include <soc/samsung/exynos_pm_qos.h>
+#endif
 #include <linux/videodev2.h>
 #include <linux/cma.h>
 #include <linux/genalloc.h>
@@ -24,6 +31,7 @@
 #include "mfc_media.h"
 
 /* DEBUGFS */
+#define MFC_DEFAULT_MEMLOG_LEVEL	0x7
 #define MFC_DEFAULT_LOGGING_OPTION	0x7
 
 #define MFC_NUM_CORE			2
@@ -36,6 +44,9 @@
 #define MFC_SFR_LOGGING_COUNT_SET1	28
 #define MFC_SFR_LOGGING_COUNT_SET2	32
 #define MFC_LOGGING_DATA_SIZE		950
+#define MFC_MAX_DEFAULT_PARAM		100
+#define MFC_NUM_EXTRA_DPB		5
+#define MFC_MAX_MB_TABLE		30
 /* the number of priority is 2N(num of OPP) + 2 */
 #define MFC_MAX_PRIO			12
 /* The number of display DRC max frames that can occur continuously in NAL_Q */
@@ -60,6 +71,14 @@
 #define MFC_FMT_FLAG_MULTI_VIEW		0x0010
 #define MFC_FMT_FLAG_DEPTH_MAP		0x0020
 
+/* MFC Multi-View */
+#define MFC_NUM_FD_DEPTH_MAP		1
+#define MFC_NUM_MULTI_VIEW		2
+#define MFC_NUM_FD_SUB_VIEW_META	1
+
+/* MFC meminfo */
+#define MFC_MEMINFO_MAX_NUM		10
+
 #define MFC_NUM_SPECIAL_BUF_NAME	25
 
 #define BANK_L_CTX			0
@@ -102,10 +121,59 @@ enum mfc_inst_type {
 enum mfc_inst_state {
 	MFCINST_FREE = 0,
 	MFCINST_INIT = 100,
+	MFCINST_GOT_INST,
+	MFCINST_HEAD_PARSED,
+	MFCINST_RUNNING_BUF_FULL,
 	MFCINST_RUNNING,
+	MFCINST_FINISHING,
 	MFCINST_RETURN_INST,
 	MFCINST_ERROR,
-	MFCINST_ABORT
+	MFCINST_ABORT,
+	MFCINST_RES_CHANGE_INIT,
+	MFCINST_RES_CHANGE_FLUSH,
+	MFCINST_RES_CHANGE_FLUSH_FINISHED,
+	MFCINST_RES_CHANGE_END,
+	MFCINST_FINISHED,
+	MFCINST_ABORT_INST,
+	MFCINST_DPB_FLUSHING,
+	MFCINST_MOVE_INST,
+	MFCINST_BUF_INIT_BUT_MULTI_MODE_NOT_CHECKED_YET,
+};
+
+enum mfc_inst_state_query {
+	EQUAL = 0,
+	BIGGER,
+	SMALLER,
+	EQUAL_BIGGER,
+	EQUAL_SMALLER,
+	EQUAL_OR,
+};
+
+/**
+ * enum mfc_queue_state - The state of buffer queue.
+ */
+enum mfc_queue_state {
+	QUEUE_FREE = 0,
+	QUEUE_BUFS_REQUESTED,
+	QUEUE_BUFS_QUERIED,
+	QUEUE_BUFS_MMAPED,
+};
+
+enum mfc_dec_wait_state {
+	WAIT_NONE	= 0,
+	WAIT_G_FMT	= BIT(0),
+	WAIT_STOP	= BIT(1),
+};
+
+/**
+ * enum mfc_check_state - The state for user notification
+ */
+enum mfc_check_state {
+	MFCSTATE_PROCESSING = 0,
+	MFCSTATE_DEC_RES_DETECT,
+	MFCSTATE_DEC_TERMINATING,
+	MFCSTATE_ENC_NO_OUTPUT,
+	MFCSTATE_DEC_S3D_REALLOC,
 };
 
 enum mfc_buf_usage_type {
@@ -116,6 +184,54 @@ enum mfc_buf_usage_type {
 	MFCBUF_DRM_FW,
 };
 
+enum mfc_buf_process_type {
+	MFCBUFPROC_DEFAULT		= 0x0,
+	MFCBUFPROC_COPY			= BIT(0),
+	MFCBUFPROC_SHARE		= BIT(1),
+	MFCBUFPROC_META			= BIT(2),
+	MFCBUFPROC_ANBSHARE		= BIT(3),
+	MFCBUFPROC_ANBSHARE_NV12L	= BIT(4),
+};
+
+enum mfc_ctrl_type {
+	MFC_CTRL_TYPE_GET_SRC	= 0x1,
+	MFC_CTRL_TYPE_GET_DST	= 0x2,
+	MFC_CTRL_TYPE_SET_SRC	= 0x4,
+	MFC_CTRL_TYPE_SET_DST	= 0x8,
+};
+
+enum mfc_ctrl_mode {
+	MFC_CTRL_MODE_NONE	= 0x0,
+	MFC_CTRL_MODE_SFR	= 0x1,
+};
+
+enum mfc_mb_flag {
+	/* Driver set to user when DST DQbuf */
+	MFC_FLAG_HDR_CONTENT_LIGHT	= 0,
+	MFC_FLAG_HDR_DISPLAY_COLOUR	= 1,
+	MFC_FLAG_HDR_MAXTIX_COEFF	= 2,
+	MFC_FLAG_HDR_COLOUR_DESC	= 3,
+	MFC_FLAG_HDR_VIDEO_SIGNAL_TYPE	= 4,
+	MFC_FLAG_BLACKBAR_DETECT	= 5,
+	MFC_FLAG_HDR_PLUS		= 6,
+	MFC_FLAG_DISP_RES_CHANGE	= 7,
+	MFC_FLAG_UNCOMP			= 8,
+	MFC_FLAG_FRAMERATE_CH		= 9,
+	MFC_FLAG_SYNC_FRAME		= 10,
+	MFC_FLAG_AV1_FILM_GRAIN		= 11,
+	MFC_FLAG_MULTIFRAME		= 12,
+	MFC_FLAG_RIGHT_IS_MAIN_VIEW	= 13,
+	/* Driver set to user when SRC DQbuf */
+	MFC_FLAG_CONSUMED_ONLY		= 15,
+	/* User set to driver when SRC Qbuf */
+	MFC_FLAG_ENC_SRC_VOTF		= 26,
+	MFC_FLAG_ENC_SRC_FAKE		= 27,
+	MFC_FLAG_ENC_SRC_UNCOMP		= 28,
+	MFC_FLAG_CSD			= 29,
+	MFC_FLAG_EMPTY_DATA		= 30,
+	MFC_FLAG_LAST_FRAME		= 31,
+};
+
 enum mfc_frame_error_type {
 	MFC_ERR_FRAME_NO_ERR		= 0,
 	MFC_ERR_FRAME_CONCEALMENT	= 1,
@@ -152,6 +268,31 @@ enum mfc_debug_cause {
 	MFC_CAUSE_FAIL_DPB_FLUSH		= 12,
 	MFC_CAUSE_FAIL_CACHE_FLUSH		= 13,
 	MFC_CAUSE_FAIL_MOVE_INST		= 14,
+	/* last information */
+	MFC_LAST_INFO_BLACK_BAR                 = 26,
+	MFC_LAST_INFO_NAL_QUEUE                 = 27,
+	MFC_LAST_INFO_CLOCK                     = 28,
+	MFC_LAST_INFO_POWER                     = 29,
+	MFC_LAST_INFO_SHUTDOWN                  = 30,
+	MFC_LAST_INFO_DRM                       = 31,
+};
+
+enum mfc_request_work {
+	MFC_WORK_BUTLER			= 0x1,
+	MFC_WORK_TRY			= 0x2,
+};
+
+enum mfc_qos_control {
+	MFC_QOS_ON		= 0x1,
+	MFC_QOS_OFF		= 0x2,
+	MFC_QOS_TRIGGER		= 0x3,
+};
+
+enum mfc_ts_type {
+	MFC_TS_SRC		= 0x1,
+	MFC_TS_DST_Q		= 0x2,
+	MFC_TS_SRC_Q		= 0x3,
+	MFC_TS_DST_DQ		= 0x4,
 };
 
 enum mfc_core_type {
@@ -200,6 +341,13 @@ enum mfc_real_time {
 	MFC_RT_UNDEFINED        = 4,
 };
 
+enum mfc_hwapg_status {
+	MFC_HWAPG_CLEAR			= 0,
+	MFC_HWAPG_ENABLE		= 1,
+	MFC_HWAPG_HOST_SET		= 2,
+	MFC_HWAPG_HOST_CLEAR	= 3,
+};
+
 enum mfc_sched_type {
 	MFC_SCHED_RR		= 0,
 	MFC_SCHED_PRIO		= 1,
@@ -236,6 +384,7 @@ struct mfc_debug {
 	u8	power_cnt;
 	u8	clock_cnt;
 	/* for decoder only */
+	u64	dynamic_used;
 	u32	last_src_addr;
 	u32	last_dst_addr[MFC_MAX_PLANES];
 	/* total logging data */
@@ -268,6 +417,7 @@ struct mfc_buf {
 	unsigned char *vir_addr[MFC_MAX_PLANES];
 	u32 flag;
 	unsigned long i_ino;
+	int select_view;
 };
 
 struct mfc_buf_queue {
@@ -275,6 +425,12 @@ struct mfc_buf_queue {
 	unsigned int count;
 };
 
+struct mfc_bits {
+	unsigned long bits;
+	/* protection */
+	spinlock_t lock;
+};
+
 struct mfc_hwlock {
 	struct list_head waiting_list;
 	unsigned int wl_count;
@@ -307,9 +463,11 @@ struct mfc_core_intlock {
 
 struct mfc_core_lock {
 	int cnt;
+	int migrate;
 	/* protection */
 	spinlock_t lock;
 	wait_queue_head_t wq;
+	wait_queue_head_t migrate_wq;
 };
 
 struct mfc_pm {
@@ -344,6 +502,7 @@ struct mfc_fw {
 
 struct mfc_ctx_buf_size {
 	size_t dev_ctx;
+	size_t h264_dec_ctx;
 	size_t dbg_info_buf;
 };
 
@@ -487,6 +646,7 @@ struct mfc_debugfs {
 	unsigned int sfr_dump;
 	unsigned int logging_option;
 	unsigned int feature_option;
+	unsigned int core_balance;
 	unsigned int sched_perf_disable;
 	unsigned int sched_type;
 };
@@ -524,6 +684,74 @@ struct mfc_mem {
 	size_t			size;
 };
 
+enum mfc_meminfo_type {
+	MFC_MEMINFO_FW			= 0,
+	MFC_MEMINFO_INTERNAL		= 1,
+	MFC_MEMINFO_INPUT		= 2,
+	MFC_MEMINFO_OUTPUT		= 3,
+	MFC_MEMINFO_CTX_ALL		= 4,
+	MFC_MEMINFO_CTX_MAX		= 5,
+	MFC_MEMINFO_DEV_ALL		= 6,
+};
+
+struct mfc_meminfo {
+	enum mfc_meminfo_type	type;
+	const char		*name;
+	unsigned int		count;
+	size_t			size;
+	size_t			total;
+};
+
+struct mfc_bw_data {
+	unsigned int	peak;
+	unsigned int	read;
+	unsigned int	write;
+};
+
+struct mfc_bw_info {
+	struct mfc_bw_data bw_dec_h264;
+};
+
+/*
+ * threshold_mb - threshold of total MB(macroblock) count
+ * Total MB count can be calculated by
+ *	(MB of width) * (MB of height) * fps
+ */
+struct mfc_qos {
+	unsigned int threshold_mb;
+	unsigned int freq_mfc;
+	unsigned int freq_int;
+	unsigned int freq_mif;
+	unsigned int mo_value;
+	unsigned int time_fw;
+	unsigned int bts_scen_idx;
+	const char *name;
+};
+
+struct mfc_qos_boost {
+	unsigned int num_cluster;
+	unsigned int num_cpu[MAX_NUM_CLUSTER];
+	unsigned int freq_mfc;
+	unsigned int freq_int;
+	unsigned int freq_mif;
+	unsigned int freq_cluster[MAX_NUM_CLUSTER];
+	unsigned int bts_scen_idx;
+	const char *name;
+};
+
+struct mfc_qos_ctrl {
+	unsigned int idx;
+	unsigned int table_type;
+	unsigned int mfc_freq;
+};
+
+struct mfc_qos_weight {
+	unsigned int weight_h264_hevc;
+	unsigned int weight_3plane;
+	unsigned int weight_num_of_tile;
+	unsigned int weight_mbaff;
+};
+
 struct mfc_feature {
 	unsigned int support;
 	unsigned int version;
@@ -537,25 +765,58 @@ struct mfc_resource {
 struct mfc_platdata {
 	/* Debug mode */
 	unsigned int debug_mode;
+	unsigned int stride_align;
+	unsigned int stride_type;
+	unsigned int stream_buf_limit;
+	unsigned int support_8K_cavlc;
+	/* Formats */
+	unsigned int support_10bit;
+	unsigned int support_422;
+	/* Resolution */
+	unsigned int support_check_res;
+
+	/* error type for sync_point display */
+	unsigned int display_err_type;
+	/* output buffer Q framerate */
+	unsigned int display_framerate;
 
 	/* Resource */
 	struct mfc_resource mfc_resource[MFC_MAX_CODEC_TYPE];
 	/* Features */
+	struct mfc_feature skype;
+	struct mfc_feature black_bar;
+	struct mfc_feature color_aspect_dec;
+	struct mfc_feature static_info_dec;
+	struct mfc_feature vp9_stride_align;
 	struct mfc_feature mem_clear;
 	struct mfc_feature wait_fw_status;
+	struct mfc_feature hevc_pic_output_flag;
+
+	struct mfc_bw_info mfc_bw_info;
+	unsigned int dynamic_weight;
+	struct mfc_qos_weight qos_weight;
 
 	const char *fw_name;
 	unsigned int fw_mem_size;
 	unsigned int reserved_start;
 	unsigned int dma_bit_mask;
 	unsigned int ip_ver;
+	int num_mfc_freq;
+	unsigned int mfc_freqs[MAX_NUM_MFC_FREQ];
+	unsigned int core_balance;
 	unsigned int iova_threshold;
+	unsigned int idle_clk_ctrl;
+	unsigned int qos_ctrl_level;
 
 	unsigned int memlog_size;
+	unsigned int memlog_sfr_size;
+
+	unsigned int reg_h264_loop_filter_disable;
 
 	unsigned int scheduler;
 	unsigned int pbs_num_prio;
 	enum mfc_hwacg_type support_hwacg;
+	unsigned int support_mv_hevc;
 };
 
 struct mfc_core_platdata {
@@ -575,6 +836,36 @@ struct mfc_core_platdata {
 	unsigned int masterid_shift;
 	unsigned int masterid_mask;
 	unsigned int tsmux_masterid;
+	/* QoS */
+	unsigned int num_default_qos_steps;
+	unsigned int max_mb;
+	unsigned int max_hw_mb;
+	unsigned int mfc_freq_control;
+	unsigned int mo_control;
+	unsigned int bw_control;
+	unsigned int pm_qos_id;
+	unsigned int mfc_bw_index;
+	struct mfc_qos *default_qos_table;
+	struct mfc_qos *encoder_qos_table;
+	struct mfc_qos_boost *qos_boost_table;
+};
+
+struct mfc_perf {
+	void __iomem *regs_base0;
+	void __iomem *regs_base1;
+
+	struct timespec64 begin;
+	struct timespec64 end;
+
+	int new_start;
+	int count;
+	int drv_margin;
+	unsigned int latency;
+};
+
+struct mfc_dump_ops {
+	void (*dump_info_context)(struct mfc_dev *dev);
+	void (*dump_and_stop_debug_mode)(struct mfc_dev *dev);
 };
 
 struct mfc_dev_memlog {
@@ -618,14 +909,17 @@ struct mfc_dev {
 
 	/* protection */
 	struct mutex mfc_mutex;
+	/* protection */
+	struct mutex mfc_migrate_mutex;
 
 	struct mfc_ctx *ctx[MFC_NUM_CONTEXTS];
 	struct mfc_ctx *move_ctx[MFC_NUM_CONTEXTS];
 	dma_addr_t dma_base[BANK_NUM];
-
+	int move_ctx_cnt;
 	struct list_head ctx_list;
 	/* protection */
 	spinlock_t ctx_list_lock;
+	unsigned int core_balance;
 
 	atomic_t queued_bits;
 	/* protection */
@@ -641,14 +935,45 @@ struct mfc_dev {
 
 	/* Debugfs and dump */
 	struct mfc_debugfs debugfs;
+	struct mfc_dump_ops *dump_ops;
+
+	/* Instance migration worker */
+	struct workqueue_struct *migration_wq;
+	struct work_struct migration_work;
+
+	/* Butler */
+	struct workqueue_struct *butler_wq;
+	struct work_struct butler_work;
+
+	/* Lazy unmap disable */
+	int skip_lazy_unmap;
+
+	int tmu_fps;
+
+	int max_kbps;
+
+	/* Reg test */
+	char *reg_buf;
+	unsigned int *reg_val;
+	unsigned int reg_cnt;
 
+	struct mfc_meminfo meminfo[MFC_MEMINFO_DEV_ALL + 1];
 	struct mfc_dev_memlog memlog;
 
+	const struct mfc_votf_ops *votf_ops;
 };
 
 struct mfc_core_ops {
 	int (*instance_init)(struct mfc_core *core, struct mfc_ctx *ctx);
 	int (*instance_deinit)(struct mfc_core *core, struct mfc_ctx *ctx);
+	int (*instance_open)(struct mfc_core *core, struct mfc_ctx *ctx);
+	void (*instance_cache_flush)(struct mfc_core *core, struct mfc_ctx *ctx);
+	int (*instance_move_to)(struct mfc_core *core, struct mfc_ctx *ctx);
+	int (*instance_move_from)(struct mfc_core *core, struct mfc_ctx *ctx);
+	int (*request_work)(struct mfc_core *core, enum mfc_request_work work, struct mfc_ctx *ctx);
+	/* for DEC */
+	void (*instance_dpb_flush)(struct mfc_core *core, struct mfc_ctx *ctx);
+	int (*instance_init_buf)(struct mfc_core *core, struct mfc_ctx *ctx);
 };
 
 struct dump_info {
@@ -693,6 +1018,7 @@ struct mfc_core {
 	/* Power and Clock */
 	atomic_t clk_ref;
 	struct mfc_pm	pm;
+	struct mfc_perf perf;
 	bool continue_clock_on;
 	bool sleep;
 	bool shutdown;
@@ -725,13 +1051,17 @@ struct mfc_core {
 	int next_ctx_idx;
 
 	/* HW lock */
+	struct mfc_bits work_bits;
 	struct mfc_hwlock hwlock;
 	struct mfc_listable_wq hwlock_wq;
 	wait_queue_head_t cmd_wq;
 
+	struct mfc_core_dump_ops *dump_ops;
+
 	/* batch mode */
 	int batch_enable;
 	int batch_index;
+	enum mfc_hwapg_status hwapg_status;
 	/* protection */
 	spinlock_t batch_lock;
 
@@ -748,10 +1078,20 @@ struct mfc_core {
 	int cache_flush_flag;
 	int last_cmd_has_cache_flush;
 
+	/* Butler */
+	struct workqueue_struct *butler_wq;
+	struct work_struct butler_work;
+
 	/* QoS */
 	struct list_head qos_queue;
 	atomic_t qos_req_cur;
-
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+	struct exynos_pm_qos_request qos_req_mfc_noidle;
+	struct exynos_pm_qos_request qos_req_mfc;
+	struct exynos_pm_qos_request qos_req_int;
+	struct exynos_pm_qos_request qos_req_mif;
+	struct freq_qos_request qos_req_cluster[MAX_NUM_CLUSTER];
+#endif
 	/* protection */
 	struct mutex qos_mutex;
 	int mfc_freq_by_bps;
@@ -760,6 +1100,14 @@ struct mfc_core {
 	unsigned long total_mb;
 	unsigned int cpu_boost_enable;
 
+	/* QoS control depending on MFC H/W run */
+	struct workqueue_struct *qos_ctrl_wq;
+	struct work_struct qos_ctrl_work;
+	struct mfc_qos_ctrl qos_ctrl[MAX_NUM_QOS_DYNAMIC];
+	unsigned int qos_ctrl_last_idx;
+	atomic_t qos_ctrl_cnt;
+	/* protection */
+	struct mutex pm_qos_mutex;
 	/* Logging trace data */
 	atomic_t trace_ref_log;
 	struct _mfc_trace_logging *mfc_trace_logging;
@@ -773,6 +1121,10 @@ struct mfc_core {
 	struct dump_info dbg_info;
 
 	/* Debug */
+	char *reg_buf;
+	unsigned int *reg_val;
+	unsigned int reg_cnt;
+	struct mfc_meminfo meminfo[MFC_MEMINFO_DEV_ALL + 1];
 	struct mfc_core_memlog memlog;
 };
 
@@ -783,6 +1135,7 @@ struct mfc_ctx_ctrl_val {
 
 struct mfc_ctx_ctrl {
 	struct list_head list;
+	enum mfc_ctrl_type type;
 	unsigned int id;
 	unsigned int addr;
 	struct mfc_ctx_ctrl_val set;
@@ -792,6 +1145,7 @@ struct mfc_ctx_ctrl {
 struct mfc_buf_ctrl {
 	struct list_head list;
 	unsigned int id;
+	enum mfc_ctrl_type type;
 	int has_new;
 	int val;
 	unsigned int old_val;		/* only for MFC_CTRL_TYPE_SET */
@@ -808,6 +1162,7 @@ struct mfc_buf_ctrl {
 };
 
 struct mfc_ctrl_cfg {
+	enum mfc_ctrl_type type;
 	unsigned int id;
 	unsigned int is_volatile;	/* only for MFC_CTRL_TYPE_SET */
 	unsigned int mode;
@@ -819,6 +1174,46 @@ struct mfc_ctrl_cfg {
 	unsigned int flag_shft;		/* only for MFC_CTRL_TYPE_SET */
 };
 
+/* per buffer control */
+extern struct mfc_ctrls_ops mfc_ctrls_ops;
+struct mfc_ctrls_ops {
+	void (*cleanup_ctx_ctrls)(struct mfc_ctx *ctx);
+	int (*init_ctx_ctrls)(struct mfc_ctx *ctx);
+	void (*reset_buf_ctrls)(struct list_head *head);
+	int (*cleanup_buf_ctrls)(struct mfc_ctx *ctx, enum mfc_ctrl_type type, unsigned int index);
+	int (*init_buf_ctrls)(struct mfc_ctx *ctx, enum mfc_ctrl_type type, unsigned int index);
+	void (*to_buf_ctrls)(struct mfc_ctx *ctx, struct list_head *head);
+	void (*to_ctx_ctrls)(struct mfc_ctx *ctx, struct list_head *head);
+	int (*get_buf_ctrl_val)(struct mfc_ctx *ctx, struct list_head *head, unsigned int id);
+	void (*update_buf_val)(struct mfc_ctx *ctx, struct list_head *head,
+			       unsigned int id, int value);
+};
+
+extern struct mfc_bufs_ops mfc_bufs_ops;
+struct mfc_bufs_ops {
+	int (*core_set_buf_ctrls)(struct mfc_core *core,
+				  struct mfc_ctx *ctx, struct list_head *head);
+	int (*core_get_buf_ctrls)(struct mfc_core *core,
+				  struct mfc_ctx *ctx, struct list_head *head);
+	int (*core_recover_buf_ctrls)(struct mfc_core *core,
+				      struct mfc_ctx *ctx, struct list_head *head);
+	int (*core_restore_buf_ctrls)(struct mfc_ctx *ctx, struct list_head *head);
+};
+
+struct stored_dpb_info {
+	int fd[MFC_MAX_PLANES];
+};
+
+struct dec_dpb_ref_info {
+	int index;
+	struct stored_dpb_info dpb[MFC_MAX_BUFFERS];
+};
+
+struct temporal_layer_info {
+	unsigned int temporal_layer_count;
+	unsigned int temporal_layer_bitrate[VIDEO_MAX_TEMPORAL_LAYERS];
+};
+
 struct mfc_user_shared_handle {
 	int fd;
 	struct dma_buf *dma_buf;
@@ -835,6 +1230,35 @@ struct mfc_raw_info {
 	unsigned int total_plane_size;
 };
 
+struct mfc_timestamp {
+	struct list_head list;
+	struct timespec64 timestamp;
+	int index;
+	int interval;
+};
+
+struct mfc_ts_control {
+	struct mfc_timestamp ts_array[MAX_TIME_INDEX];
+	int ts_interval_array[MAX_TIME_INDEX];
+	struct list_head ts_list;
+	int ts_count;
+	int ts_is_full;
+	int ts_last_interval;
+	/* protection */
+	spinlock_t ts_lock;
+};
+
+struct mfc_bitrate {
+	struct list_head list;
+	int bytesused;
+};
+
+struct mfc_mb_control {
+	struct list_head list;
+	unsigned long mb_per_sec;
+	unsigned int fps;
+};
+
 struct dpb_table {
 	dma_addr_t addr[MFC_MAX_PLANES];
 	phys_addr_t paddr;
@@ -849,6 +1273,97 @@ struct dpb_table {
 	struct sg_table *sgt[MFC_MAX_PLANES];
 };
 
+struct disp_drc_info {
+	int disp_res_change;
+	int push_idx;
+	int pop_idx;
+	int width[MFC_MAX_DRC_FRAME];
+	int height[MFC_MAX_DRC_FRAME];
+};
+
+struct mfc_dec {
+	int total_dpb_count;
+
+	unsigned int src_buf_size;
+
+	int loop_filter_mpeg4;
+	int display_delay;
+	int immediate_display;
+	int slice_enable;
+	int mv_count;
+	int idr_decoding;
+	int is_interlaced;
+	int is_mbaff;
+	int is_dts_mode;
+	int inter_res_change;
+	struct disp_drc_info disp_drc;
+
+	int crc_enable;
+	unsigned int *crc;
+	int crc_idx;
+
+	unsigned int consumed;
+
+	int sei_parse;
+
+	int cr_left, cr_right, cr_top, cr_bot;
+
+	int detect_black_bar;
+	bool black_bar_updated;
+	struct v4l2_rect black_bar;
+
+	/* For dynamic DPB */
+	int is_dynamic_dpb;
+	int is_dpb_full;
+	int display_index;
+	unsigned long queued_dpb;
+	unsigned long dynamic_set;
+	unsigned long dynamic_used;
+
+	int is_multiframe;
+	int has_multiframe;
+	int is_multiple_show;
+
+	unsigned int num_of_tile_over_4;
+	unsigned int super64_bframe;
+
+	unsigned int color_range;
+	unsigned int color_space;
+
+	unsigned int decoding_order;
+	unsigned int frame_display_delay;
+
+	struct mfc_fmt *uncomp_fmt;
+
+	/* for Internal DPB */
+	struct mfc_special_buf internal_dpb[MFC_MAX_DPBS];
+	unsigned long plugin_used;
+
+	/* for Dynamic DPB */
+	struct dpb_table dpb[MFC_MAX_DPBS];
+	/* protection */
+	struct mutex dpb_mutex;
+	unsigned long dpb_table_used;
+	struct dec_dpb_ref_info *ref_info;
+	struct stored_dpb_info ref_buf[MFC_MAX_BUFFERS];
+	int refcnt;
+	int last_dpb_max_index;
+	struct mfc_user_shared_handle sh_handle_dpb;
+
+	/* for debugging about black bar detection */
+	void *frame_vaddr[3][30];
+	dma_addr_t frame_daddr[3][30];
+	int index[3][30];
+	int fd[3][30];
+	unsigned int frame_size[3][30];
+	unsigned char frame_cnt;
+};
+
+struct mfc_resolution {
+	int width;
+	int height;
+};
+
 struct mfc_fmt {
 	char *name;
 	u32 fourcc;
@@ -868,18 +1383,65 @@ enum mfc_multi_view_buf_idx {
 	MFC_MV_BUF_IDX_MAX,
 };
 
+struct mfc_multi_view_buf_info {
+	int offset;
+	int num_fd;
+};
+
 /**
  * struct mfc_ctx - This struct contains the instance context
  */
 struct mfc_ctx {
 	struct mfc_dev *dev;
+	struct mfc_dec *dec_priv;
 
 	int num;
 	int prio;
 	int user_prio;
 	enum mfc_real_time rt;
 
+	struct mfc_fmt *src_fmt;
+	struct mfc_fmt *dst_fmt;
+
+	struct mfc_buf_queue src_buf_ready_queue;
+	struct mfc_buf_queue dst_buf_queue;
+	struct mfc_buf_queue err_buf_queue;
+	struct mfc_buf_queue ref_buf_queue; /* Encoder only */
+	spinlock_t buf_queue_lock;
+
 	enum mfc_inst_type type;
+	int subcore_inst_no;
+
+	int img_width;
+	int img_height;
+	int crop_width;
+	int crop_height;
+	int crop_left;
+	int crop_top;
+	int mb_width;
+	int mb_height;
+	int dpb_count;
+	int rgb_bpp;
+
+	int min_dpb_size[3];
+	int min_dpb_size_2bits[3];
+
+	int bytesperline[3];
+	struct mfc_raw_info raw_buf;
+
+	int num_fd_frame;
+	struct mfc_multi_view_buf_info view_buf_info[MFC_MV_BUF_IDX_MAX];
+	int select_view;
+	int select_view_irq;
+
+	enum mfc_queue_state capture_state;
+	enum mfc_queue_state output_state;
+
+	DECLARE_BITMAP(src_ctrls_avail, MFC_MAX_BUFFERS);
+	DECLARE_BITMAP(dst_ctrls_avail, MFC_MAX_BUFFERS);
+
+	unsigned int sequence;
+	int stored_tag;
 
 	/* operation mode */
 	int op_core_num[MFC_NUM_CORE];
@@ -888,7 +1450,9 @@ struct mfc_ctx {
 	enum mfc_op_mode op_mode;
 	enum mfc_op_core_type op_core_type;
 	struct mfc_core_lock corelock;
-
+	int serial_src_index;
+	int curr_src_index;
+	int cmd_counter;
 	/* protection */
 	struct mutex op_mode_mutex;
 	int last_op_core;
@@ -900,10 +1464,20 @@ struct mfc_ctx {
 	int codec_mode;
 	__u32 pix_format;
 
+	/* Profile information */
+	int is_422;
+	int bit_depth_luma;
+	int bit_depth_chroma;
+
+	/* for AV1 Annex B */
+	int is_av1_annex_b;
+
 	int is_heif_mode;
 
 	int is_dpb_realloc;
+	enum mfc_dec_wait_state wait_state;
 	/* protection */
+	struct mutex drc_wait_mutex;
 	int clear_work_bit;
 
 	/* Extra Buffers */
@@ -911,8 +1485,25 @@ struct mfc_ctx {
 	struct mfc_special_buf mv_buf;
 
 	unsigned long framerate;
+	unsigned long last_framerate;
+	unsigned long operating_framerate;
+	unsigned long dst_q_framerate;
+	unsigned long dst_dq_framerate;
+	unsigned long src_q_framerate;
+	unsigned long max_framerate;
+	unsigned int qos_ratio;
+	bool update_framerate;
+	bool update_bitrate;
+	bool check_src_ts_full;
+	bool ktime_used;
+
+	struct mfc_ts_control src_ts;
+	struct mfc_ts_control dst_q_ts;
+	struct mfc_ts_control src_q_ts;
+	struct mfc_ts_control dst_dq_ts;
 
 	/* bitrate control for QoS*/
+	struct mfc_bitrate bitrate_array[MAX_TIME_INDEX];
 	struct list_head bitrate_list;
 	int bitrate_index;
 	int bitrate_is_full;
@@ -922,6 +1513,7 @@ struct mfc_ctx {
 	unsigned long weighted_mb;
 	struct list_head list;
 
+	unsigned int *mfc_qos_portion;
 	int disp_ratio;
 
 	int buf_process_type;
@@ -939,11 +1531,35 @@ struct mfc_ctx {
 	/* QoS idle */
 	enum mfc_idle_mode idle_mode;
 
+	/* Lazy unmap disable */
+	int skip_lazy_unmap;
+
 	/* external structure */
 	struct v4l2_fh fh;
 	struct vb2_queue vq_src;
 	struct vb2_queue vq_dst;
 
+	/* per buffer controls */
+	struct mfc_ctrls_ops *c_ops;
+	struct mfc_bufs_ops *b_ops;
+	struct list_head ctrls;
+	struct list_head src_ctrls[MFC_MAX_BUFFERS];
+	struct list_head dst_ctrls[MFC_MAX_BUFFERS];
+
+	/* Extra Buffers size */
+	size_t mv_size;
+	size_t scratch_buf_size;
+	size_t loopfilter_luma_size;
+	size_t loopfilter_chroma_size;
+
+	/* mem info */
+	struct mfc_buf_queue	meminfo_inbuf_q;
+	struct mfc_buf_queue	meminfo_outbuf_q;
+	/* protection */
+	spinlock_t		meminfo_queue_lock;
+	struct mfc_meminfo	meminfo[MFC_MEMINFO_MAX_NUM];
+	size_t			meminfo_size[MFC_MEMINFO_CTX_MAX + 1];
+
 	u32 ready_to_be_multi_view_enable;
 	u32 multi_view_enable;
 	u32 left_view_id;
@@ -963,11 +1579,35 @@ struct mfc_core_ctx {
 	unsigned int int_err;
 	bool check_dump;
 
+	struct mfc_buf_queue src_buf_queue;
+	struct mfc_buf_queue dst_buf_queue;
+	/* protection */
+	spinlock_t buf_queue_lock;
+	unsigned long dynamic_set;
+
 	enum mfc_inst_state state;
 	enum mfc_inst_state prev_state;
 
+	/* QoS */
+	struct list_head qos_list;
+
+	/* MB control for QoS */
+	struct mfc_mb_control mb_table[MFC_MAX_MB_TABLE];
+	struct list_head mb_list;
+	int mb_index;
+	int mb_is_full;
+	int dynamic_weight_level;
+	unsigned int dynamic_weight_started;
+	int mb_update_time;
+	unsigned int avg_runtime;
+	unsigned long mb_not_coded_time;
+
 	/* Extra Buffers */
+	int codec_buffer_allocated;
+	int scratch_buffer_allocated;
+	struct mfc_special_buf codec_buf;
 	struct mfc_special_buf instance_ctx_buf;
+	struct mfc_special_buf scratch_buf;
 
 	/* wait queue */
 	wait_queue_head_t cmd_wq;
@@ -979,7 +1619,18 @@ struct mfc_sched_class {
 	void (*create_work)(struct mfc_core *core);
 	void (*init_work)(struct mfc_core *core);
 	void (*clear_all_work)(struct mfc_core *core);
+	void (*queue_work)(struct mfc_core *core);
+	int  (*is_work)(struct mfc_core *core);
+	int (*pick_next_work)(struct mfc_core *core);
+	int (*get_next_work)(struct mfc_core *core);
+
 	void (*set_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx);
 	void (*clear_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx);
+	int (*enqueue_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx);
+	int (*enqueue_otf_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx, bool flag);
+	int (*dequeue_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx);
+	void (*yield_work)(struct mfc_core *core, struct mfc_core_ctx *core_ctx);
+	int (*change_prio_work)(struct mfc_core *core, struct mfc_ctx *ctx,
+				int cur_rt, int cur_prio, int new_rt, int new_prio);
 };
 #endif /* __MFC_DATA_STRUCT_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
new file mode 100644
index 000000000000..3307c2eeaebb
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_format.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_FORMAT_H
+#define __MFC_FORMAT_H __FILE__
+
+#define MFC_NUM_FORMATS ARRAY_SIZE(mfc_formats)
+
+static struct mfc_fmt mfc_formats[] = {
+	{
+		.name = "Unknown",
+		.fourcc = 0,
+		.codec_mode = 0,
+		.type = 0,
+		.num_planes = 0,
+		.mem_planes = 0,
+	},
+	{
+		.name = "YUV420M",
+		.fourcc = V4L2_PIX_FMT_YUV420M,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME,
+		.num_planes = 3,
+		.mem_planes = 3,
+	},
+	{
+		.name = "YVU420M",
+		.fourcc = V4L2_PIX_FMT_YVU420M,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME,
+		.num_planes = 3,
+		.mem_planes = 3,
+	},
+	{
+		.name = "NV12M",
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME,
+		.num_planes = 2,
+		.mem_planes = 2,
+	},
+	{
+		.name = "NV21M",
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME,
+		.num_planes = 2,
+		.mem_planes = 2,
+	},
+	{
+		.name = "NV16M",
+		.fourcc = V4L2_PIX_FMT_NV16M,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_422,
+		.num_planes = 2,
+		.mem_planes = 2,
+	},
+	{
+		.name = "NV61M",
+		.fourcc = V4L2_PIX_FMT_NV61M,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_422,
+		.num_planes = 2,
+		.mem_planes = 2,
+	},
+	{
+		.name = "RGB888 24bpp",
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_RGB,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "RGB565 16bpp",
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_RGB,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "RGBX8888 32bpp",
+		.fourcc = V4L2_PIX_FMT_RGB32X,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_RGB,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "BGRA8888 32bpp",
+		.fourcc = V4L2_PIX_FMT_BGR32,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_RGB,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "ARGB8888 32bpp",
+		.fourcc = V4L2_PIX_FMT_ARGB32,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_RGB,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "RGB8888 32bpp",
+		.fourcc = V4L2_PIX_FMT_RGB32,
+		.codec_mode = MFC_FORMATS_NO_CODEC,
+		.type = MFC_FMT_FRAME | MFC_FMT_RGB,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+	{
+		.name = "DEC H264",
+		.fourcc = V4L2_PIX_FMT_H264,
+		.codec_mode = MFC_REG_CODEC_H264_DEC,
+		.type = MFC_FMT_STREAM | MFC_FMT_DEC,
+		.num_planes = 1,
+		.mem_planes = 1,
+	},
+};
+
+#endif /* __MFC_FORMAT_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_macros.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_macros.h
new file mode 100644
index 000000000000..a41686214988
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_macros.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_macros.h file
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_MACROS_H
+#define __MFC_MACROS_H __FILE__
+
+/* helper macros */
+#ifndef __ALIGN_UP
+#define __ALIGN_UP(x, a)	({		\
+	typeof(a) _a = (a);			\
+	(((x) + (_a - 1)) & ~(_a - 1));		\
+})
+#endif
+
+#define WIDTH_MB(x_size)  (((x_size) + 15) / 16)
+#define HEIGHT_MB(y_size) (((y_size) + 15) / 16)
+
+/*
+ * Note that lcu_width and lcu_height are defined as follows :
+ * lcu_width = (frame_width + lcu_size - 1)/lcu_size
+ * lcu_height = (frame_height + lcu_size - 1)/lcu_size.
+ * (lcu_size is 32(encoder) or 64(decoder))
+ *
+ * Note that ctb_width and ctb_height are defined as follows :
+ * ctb_width = (frame_width + ctb_size - 1)/ctb_size
+ * ctb_height = (frame_hegiht + ctb_size - 1)/ctb_size
+ * (ctb_size is 128(AV1 decoder))
+ *
+ */
+#define DEC_LCU_WIDTH(x_size)	(((x_size) + 63) / 64)
+#define ENC_LCU_WIDTH(x_size)	(((x_size) + 31) / 32)
+#define DEC_LCU_HEIGHT(y_size)	(((y_size) + 63) / 64)
+#define ENC_LCU_HEIGHT(y_size)	(((y_size) + 31) / 32)
+
+#define DEC_CTB_WIDTH(x_size)	(((x_size) + 127) / 128)
+#define DEC_CTB_HEIGHT(y_size)	(((y_size) + 127) / 128)
+
+#define STREAM_BUF_ALIGN		SZ_512
+#define MFC_LINEAR_BUF_SIZE		SZ_256
+
+#define DEC_STATIC_BUFFER_SIZE		20480
+/* STATIC buffer for AV1 will be aligned by 32 */
+#define DEC_AV1_STATIC_BUFFER_SIZE(x_size, y_size) \
+	__ALIGN_UP((440192 + (DEC_LCU_WIDTH(x_size) * DEC_LCU_HEIGHT(y_size) * SZ_8K)), SZ_32)
+
+#define DEC_MV_SIZE_MB(x, y)	(WIDTH_MB(x) \
+	* (((HEIGHT_MB(y) + SZ_1) / SZ_2) * SZ_2) * SZ_64 + SZ_1K)
+#define DEC_HEVC_MV_SIZE(x, y)	(DEC_LCU_WIDTH(x) * DEC_LCU_HEIGHT(y) * SZ_256 + SZ_512)
+#define DEC_AV1_MV_SIZE(x, y)	((DEC_CTB_WIDTH(x) * DEC_CTB_HEIGHT(y) * 1536) * 10)
+
+#define ENC_LUMA_DPB_SIZE(x, y)   ((((x) + 63) / 64) * 64 * (((y) + 31) / 32) * 32 + 64)
+#define ENC_CHROMA_DPB_SIZE(x, y) ((((x) + 63) / 64) * 64 * (((((y) + 31) / 32) * 32) / 2) + 64)
+
+#define ENC_V100_H264_ME_SIZE(x, y)								   \
+	({											   \
+		typeof(x) __x = (x);								   \
+		typeof(y) __y = (y);								   \
+		((((__x) + 3) * ((__y) + 3) * 8) + (((((__x) * (__y)) + 63) / 64) * 32) +	   \
+		 ((((__y) * 64) + 2304) * ((__x) + 7) / 8));					   \
+	})
+#define ENC_V100_MPEG4_ME_SIZE(x, y)								   \
+	({											   \
+		typeof(x) __x = (x);								   \
+		typeof(y) __y = (y);								   \
+		((((__x) + 3) * ((__y) + 3) * 8) + (((((__x) * (__y)) + 127) / 128) * 16) +	   \
+		 ((((__y) * 64) + 2304) * ((__x) + 7) / 8));					   \
+	})
+#define ENC_V100_VP8_ME_SIZE(x, y)								   \
+	({											   \
+		typeof(x) __x = (x);								   \
+		typeof(y) __y = (y);								   \
+		((((__x) + 3) * ((__y) + 3) * 8) + ((((__y) * 64) + 2304) * ((__x) + 7) / 8));	   \
+	})
+#define ENC_V100_VP9_ME_SIZE(x, y)								   \
+	({											   \
+		typeof(x) __x = (x);								   \
+		typeof(y) __y = (y);								   \
+		(((((__x) * 2) + 3) * (((__y) * 2) + 3) * 128) +				   \
+		 ((((__y) * 256) + 2304) * ((__x) + 1) / 2));					   \
+	})
+#define ENC_V100_HEVC_ME_SIZE(x, y)								   \
+	({											   \
+		typeof(x) __x = (x);								   \
+		typeof(y) __y = (y);								   \
+		((((__x) + 3) * ((__y) + 3) * 32) + ((((__y) * 128) + 2304) * ((__x) + 3) / 4));   \
+	})
+
+#endif /* __MFC_MACROS_H */
-- 
2.34.1

