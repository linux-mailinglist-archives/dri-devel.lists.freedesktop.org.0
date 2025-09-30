Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1DFBAB781
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCBF10E4C6;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="YyRprlGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E737010E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:12 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035602epoutp0319194f89170c917f6098d3180d365556~p8zq0PsUj3155831558epoutp03O
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035602epoutp0319194f89170c917f6098d3180d365556~p8zq0PsUj3155831558epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204562;
 bh=GmReH713XOv6Ei1nlAtnwGxy+kOekFmsGqxXzzq0lxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YyRprlGfbzoopo4+KrO2i9+9KppjqbMnnphAlza4Xw+lXymy9HgP2P5CRbuKZdGbM
 2LhMWwbdkq6tiIShbJMCOWV08qCiNegXLZpUt7Bsq4edsoqdS3HhU4doCmpVoVv0/c
 b0ALlDrTh/G+sJu7C42/6B3JjacDVvsiMFQI59P4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035602epcas5p475adcdf4b6659ed51bd0cfa2dd161803~p8zqRl3xE0216002160epcas5p4V;
 Tue, 30 Sep 2025 03:56:02 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cbPNx28NJz6B9mN; Tue, 30 Sep
 2025 03:56:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035600epcas5p13782313e204588986f44514d005ccf70~p8zotN_7-1532115321epcas5p1D;
 Tue, 30 Sep 2025 03:56:00 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035558epsmtip1f59f65f14ef1374c26bd2a80caafd9ce~p8zmO2dKz2908429084epsmtip1r;
 Tue, 30 Sep 2025 03:55:57 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 10/29] =?UTF-8?q?media:=20mfc:=20Add=20buffer=E2=80=91queu?=
 =?UTF-8?q?e=20and=20IOVMM=20support?=
Date: Tue, 30 Sep 2025 09:33:29 +0530
Message-Id: <20250930040348.3702923-11-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035600epcas5p13782313e204588986f44514d005ccf70
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035600epcas5p13782313e204588986f44514d005ccf70
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035600epcas5p13782313e204588986f44514d005ccf70@epcas5p1.samsung.com>
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

- Implement full buffer queue and DPB management (mfc_queue).
- Extended mfc_common.h with runtime/boost macros and helper calls.
- Added IOVMM helpers ; DPB allocation now uses IOVMM.
- Introduced macros for MMCache timeout, boost timing,
  resolution thresholds, default runtime, and codec limits.
- Refined debug and error handling throughout.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |   1 +
 .../samsung/exynos-mfc/base/mfc_common.h      | 174 +++-
 .../samsung/exynos-mfc/base/mfc_mem.c         | 190 ++++
 .../samsung/exynos-mfc/base/mfc_mem.h         |  31 +
 .../samsung/exynos-mfc/base/mfc_queue.c       | 930 ++++++++++++++++++
 .../samsung/exynos-mfc/base/mfc_queue.h       | 156 +++
 .../samsung/exynos-mfc/base/mfc_utils.h       |  41 +
 7 files changed, 1522 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index bee95b16ac7c..5353289fa810 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -19,6 +19,7 @@ exynos_mfc-y += mfc_core_hw_reg_api.o mfc_core_reg_api.o
 #Plugin control layer
 #Plugin HW access layer
 #Common base layer
+exynos_mfc-y += base/mfc_queue.o
 exynos_mfc-y += base/mfc_buf.o base/mfc_mem.o
 #Tracing
 # exynos_mfc-y += trace/mfc_trace_points.o
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
index 4a1ec714fbb5..de22c28d1625 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
@@ -20,6 +20,7 @@
 #include <linux/cacheflush.h>
 #include "mfc_data_struct.h"
 #include "mfc_regs.h"
+#include "mfc_macros.h"
 #include "mfc_debug.h"
 #include "mfc_media.h"
 
@@ -51,9 +52,20 @@
 #define MFC_HWLOCK_TIMEOUT	12000
 /* Busy wait timeout */
 #define MFC_BW_TIMEOUT		500
-
+/* MMCache invalidation timeout */
+#define MMCACHE_INVAL_TIMEOUT	1000
 /* Interrupt timeout count*/
 #define MFC_INT_TIMEOUT_CNT	3
+/* The initial skip frame for boost */
+#define MFC_INITIAL_SKIP_FRAME	60
+/* The MAX I frame interval for boosting is 2000ms(2sec) */
+#define MFC_BOOST_TIME			(2000)
+/* The boost mode is maintained at least 20msec */
+#define MFC_BOOST_OFF_TIME		((MFC_BOOST_TIME * NSEC_PER_MSEC) - (20 * NSEC_PER_MSEC))
+/* The boost speed is multiplied by the framerate */
+#define MFC_BOOST_SPEED		(8)
+
+#define MFC_DEFAULT_RUNTIME	(33000)
 
 /*
  * This value guarantees 299.4msec ~ 2.25sec according to MFC clock (668MHz ~ 89MHz)
@@ -63,6 +75,10 @@
 /* 250ms is the mfc firmware timeout value*/
 #define MFC_TIMEOUT_VALUE_IN_MSEC 250
 
+#define NUM_MPEG4_LF_BUF	2
+
+#define FRAME_RATE_RESOLUTION	10000
+
 #define DEFAULT_TAG		(0xE05)
 #define IGNORE_TAG		(0xD5C) /* ex) encoder DRC */
 #define HEADER_TAG		(0xC5D)
@@ -70,6 +86,11 @@
 
 #define MFC_NO_INSTANCE_SET	-1
 
+#define MFC_ENC_CAP_PLANE_COUNT	1
+#define MFC_ENC_OUT_PLANE_COUNT	2
+
+#define MFC_NAME_LEN		16
+
 #define STUFF_BYTE		4
 #define MFC_EXTRA_DPB		5
 #define MFC_ALL_AVAILABLE_DPB	0xffffffffffffffff
@@ -82,12 +103,30 @@
 #define mfc_get_warn(x)		(((x) >> MFC_REG_WARN_STATUS_SHIFT)	\
 						& MFC_REG_WARN_STATUS_MASK)
 
+/* MFC conceal color is black */
+#define MFC_CONCEAL_COLOR	0x8020000
+
 #define vb_to_mfc_buf(x)		\
 	container_of(x, struct mfc_buf, vb.vb2_buf)
 
 #define fh_to_mfc_ctx(x)		\
 	container_of(x, struct mfc_ctx, fh)
 
+#define call_bop(ctx, op, args...)	({				\
+	typeof(ctx) _ctx = (ctx);					\
+	((_ctx->b_ops->op) ? (_ctx->b_ops->op(args)) : 0);		\
+})
+
+#define call_cop(ctx, op, args...)	({				\
+	typeof(ctx) _ctx = (ctx);					\
+	((_ctx->c_ops->op) ? (_ctx->c_ops->op(args)) : 0);		\
+})
+
+#define	MFC_CTRL_TYPE_GET	(MFC_CTRL_TYPE_GET_SRC | MFC_CTRL_TYPE_GET_DST)
+#define	MFC_CTRL_TYPE_SET	(MFC_CTRL_TYPE_SET_SRC | MFC_CTRL_TYPE_SET_DST)
+#define	MFC_CTRL_TYPE_SRC	(MFC_CTRL_TYPE_SET_SRC | MFC_CTRL_TYPE_GET_SRC)
+#define	MFC_CTRL_TYPE_DST	(MFC_CTRL_TYPE_SET_DST | MFC_CTRL_TYPE_GET_DST)
+
 #define MFC_FMT_STREAM		BIT(0)
 #define MFC_FMT_FRAME		BIT(1)
 #define MFC_FMT_10BIT		BIT(2)
@@ -112,6 +151,132 @@
 	 (_n == EXYNOS_VIDEONODE_MFC_ENC_OTF_DRM));					\
 })
 
+/* Decoder codec mode check */
+#define IS_H264_DEC(ctx)	((ctx)->codec_mode == MFC_REG_CODEC_H264_DEC)
+
+#define ON_RES_CHANGE(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	((_ctx->state >= MFCINST_RES_CHANGE_INIT) &&					\
+	 (_ctx->state < MFCINST_RES_CHANGE_END));					\
+})
+#define ON_RUNNING(ctx)		((ctx)->state == MFCINST_RUNNING)
+#define NEED_TO_DPB_FLUSH(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	((_ctx->state == MFCINST_FINISHING) || (_ctx->state == MFCINST_RUNNING) ||	\
+	 (_ctx->state == MFCINST_RES_CHANGE_END));					\
+})
+#define NEED_TO_WAIT_NAL_ABORT(ctx)	((ctx)->state == MFCINST_ABORT_INST)
+#define NEED_TO_GET_CROP(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	((_ctx->state == MFCINST_HEAD_PARSED) || (_ctx->state == MFCINST_RUNNING) ||	\
+	 (_ctx->state == MFCINST_FINISHING));						\
+})
+#define IS_NO_ERROR(err)	({							\
+	typeof(err) _err = (err);							\
+	(_err == 0 || (mfc_get_warn(_err) == MFC_REG_ERR_SYNC_POINT_NOT_RECEIVED));	\
+})
+#define CODEC_HAS_IDR(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);							\
+	(IS_H264_DEC(_ctx));		\
+})
+
+/*
+ * levels with maximum property values
+ * level	Maximum frame size in MB (MB width x MB height)
+ * LV5		22,080
+ * LV5.1		36,864
+ * LV6		139,264
+ */
+
+#define LV51_MB_MIN		(22080)
+#define LV51_MB_MAX		(36864)
+#define LV60_MB_MAX		(139264)
+
+#define IS_LV51_MB(mb)	({							\
+	typeof(mb) _mb	= (mb);							\
+	((_mb > LV51_MB_MIN) && (_mb <= LV51_MB_MAX));				\
+})
+#define IS_LV60_MB(mb) ({							\
+	typeof(mb) _mb = (mb);							\
+	((_mb > LV51_MB_MAX)	&& (_mb <= LV60_MB_MAX));			\
+})
+
+/* 8K resolution */
+#define MFC_8K_RES		(7680 * 4320)
+#define IS_8K_RES(ctx)	({							\
+	typeof(ctx) _ctx = (ctx);						\
+	((_ctx->crop_width * _ctx->crop_height) >= MFC_8K_RES);			\
+})
+/* For max h/w performance */
+#define IS_8K_PERF(ctx)	({							\
+	typeof(ctx) __ctx = (ctx);						\
+	((__ctx->crop_width * __ctx->crop_height) >= (MFC_8K_RES / 2));		\
+})
+#define UNDER_8K_RES(ctx)	({						\
+	typeof(ctx) _ctx = (ctx);						\
+	((_ctx->crop_width * _ctx->crop_height) < MFC_8K_RES);			\
+})
+
+/* 4K resolution */
+/* VP9 needs 64 alignment because of min MB(64x64) */
+#define MFC_4K_RES		(4096 * 2160)
+#define MFC_4K_RES_64ALIGN	(4096 * 2176)
+#define UNDER_4K_RES(ctx)	({						\
+	typeof(ctx) __ctx = (ctx);						\
+	((__ctx->crop_width * __ctx->crop_height) <	MFC_4K_RES_64ALIGN);	\
+})
+#define IS_MULTI_MODE_RES(ctx)	({						\
+	typeof(ctx) __ctx = (ctx);						\
+	((__ctx->img_width * __ctx->img_height) >= (2 * MFC_4K_RES));		\
+})
+
+/* UHD resolution */
+#define MFC_UHD_RES		(3840 * 2160)
+#define	OVER_UHD_RES(ctx)	({						\
+	typeof(ctx) __ctx = (ctx);						\
+	((__ctx->crop_width * __ctx->crop_height) >= MFC_UHD_RES);		\
+})
+#define	UNDER_UHD_RES(ctx)	({						\
+	typeof(ctx) _ctx = (ctx);						\
+	((_ctx->crop_width * _ctx->crop_height) <= MFC_4K_RES_64ALIGN);		\
+})
+
+/* FHD resolution */
+#define MFC_FHD_RES		(1920 * 1088)
+#define MFC_1080P_RES		(1920 * 1080)
+#define MFC_FHD_RES_MB		(((1920 + 15) / 16) * ((1088 + 15) / 16))
+#define UNDER_FHD_RES(ctx)	({						\
+	typeof(ctx) _ctx = (ctx);						\
+	((_ctx->crop_width * _ctx->crop_height) <= MFC_FHD_RES);		\
+})
+#define UNDER_1080P_RES(ctx)	({						\
+		typeof(ctx) __ctx = (ctx);					\
+		(((__ctx)->crop_width *	(__ctx)->crop_height) <	MFC_1080P_RES);	\
+})
+
+/* HD resolution */
+#define MFC_HD_RES_MB		(((1280 + 15) / 16) * ((720 + 15) / 16))
+
+/*
+ * If it is a resolution that requires max performance,
+ * the performance degradation option is not available.
+ * (2-ref, B frame)
+ */
+#define IS_MFC_MAX_PERF(ctx, fps)	({					\
+	typeof(ctx) _ctx = (ctx);						\
+	(IS_8K_PERF(_ctx) || (OVER_UHD_RES(_ctx) && ((fps) > 60)));		\
+})
+#define IS_MFC_HEAVY_PERF(ctx, fps)	({					\
+	typeof(ctx) _ctx = (ctx);						\
+	typeof(fps) _fps = (fps);						\
+	(IS_8K_PERF(_ctx) || (OVER_UHD_RES(_ctx) && (_fps >= 60)) ||	\
+	 (_fps >= 240));							\
+})
+
+#define IS_BLACKBAR_OFF(ctx)	((ctx)->crop_height > 2160)
+
+#define IS_SINGLE_FD(ctx, fmt)	((!(ctx)->rgb_bpp) && ((fmt)->mem_planes == 1))
+
 #define IS_MULTI_CORE_DEVICE(dev)	((dev)->num_core > 1)
 #define IS_SINGLE_MODE(ctx)	   ((ctx)->op_mode == MFC_OP_SINGLE)
 #define IS_TWO_MODE1(ctx)	   ((ctx)->op_mode == MFC_OP_TWO_MODE1)
@@ -134,6 +299,13 @@
 	 (_ctx->op_mode == MFC_OP_SWITCH_BUT_MODE2));				\
 })
 
+#define IS_MODE_SWITCHING(ctx)	   ((ctx)->op_mode == MFC_OP_SWITCHING)
+
+#define IS_NO_INFOLOG(ctx)	({						\
+	typeof(ctx) _ctx = (ctx);						\
+	(_ctx->dec_priv && _ctx->dec_priv->is_multiframe);			\
+})
+
 /* Extra information for Decoder */
 #define DEC_SET_DUAL_DPB		BIT(0)
 #define DEC_SET_DYNAMIC_DPB		BIT(1)
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
index dfb58ddcbd5d..17cc1d793cbc 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
@@ -334,6 +334,196 @@ void mfc_mem_special_buf_free(struct mfc_dev *dev, struct mfc_special_buf *speci
 	}
 }
 
+void mfc_put_iovmm(struct mfc_ctx *ctx, struct dpb_table *dpb, int num_planes, int index)
+{
+	int i;
+
+	MFC_TRACE_CTX("DPB[%d] fd: %d addr: %#llx put(%d)\n",
+		      index, dpb[index].fd[0], dpb[index].addr[0], dpb[index].mapcnt);
+
+	for (i = 0; i < num_planes; i++) {
+		if (dpb[index].addr[i])
+			mfc_ctx_debug(2, "[IOVMM] index %d buf[%d] fd: %d addr: %#llx\n",
+				      index, i, dpb[index].fd[i], dpb[index].addr[i]);
+		if (dpb[index].sgt[i])
+			dma_buf_unmap_attachment_unlocked(dpb[index].attach[i], dpb[index].sgt[i],
+							  DMA_BIDIRECTIONAL);
+		if (dpb[index].attach[i])
+			dma_buf_detach(dpb[index].dmabufs[i], dpb[index].attach[i]);
+		if (dpb[index].dmabufs[i])
+			dma_buf_put(dpb[index].dmabufs[i]);
+
+		dpb[index].fd[i] = -1;
+		dpb[index].addr[i] = 0;
+		dpb[index].attach[i] = NULL;
+		dpb[index].dmabufs[i] = NULL;
+		dpb[index].sgt[i] = NULL;
+	}
+
+	dpb[index].new_fd = -1;
+	dpb[index].mapcnt--;
+	mfc_ctx_debug(2, "[IOVMM] index %d mapcnt %d\n", index, dpb[index].mapcnt);
+
+	if (dpb[index].mapcnt != 0) {
+		mfc_ctx_err("[IOVMM] DPB[%d] %#llx invalid mapcnt %d\n",
+			    index, dpb[index].addr[0], dpb[index].mapcnt);
+		dpb[index].mapcnt = 0;
+	}
+}
+
+void mfc_get_iovmm(struct mfc_ctx *ctx, struct vb2_buffer *vb, struct dpb_table *dpb)
+{
+	struct mfc_dev *dev = ctx->dev;
+	int i, mem_get_count = 0;
+	struct mfc_buf *mfc_buf = vb_to_mfc_buf(vb);
+	int index = mfc_buf->dpb_index;
+	int sub_view_index, offset;
+
+	if (dpb[index].mapcnt != 0)
+		mfc_ctx_err("[IOVMM] DPB[%d] %#llx invalid mapcnt %d\n",
+			    index, dpb[index].addr[0], dpb[index].mapcnt);
+
+	for (i = 0; i < ctx->dst_fmt->mem_planes; i++) {
+		mem_get_count++;
+
+		dpb[index].fd[i] = vb->planes[i].m.fd;
+
+		dpb[index].dmabufs[i] = dma_buf_get(vb->planes[i].m.fd);
+		if (IS_ERR(dpb[index].dmabufs[i])) {
+			mfc_ctx_err("[IOVMM] Failed to dma_buf_get (err %ld)\n",
+				    PTR_ERR(dpb[index].dmabufs[i]));
+			dpb[index].dmabufs[i] = NULL;
+			goto err_iovmm;
+		}
+
+		dpb[index].attach[i] = dma_buf_attach(dpb[index].dmabufs[i], dev->device);
+		if (IS_ERR(dpb[index].attach[i])) {
+			mfc_ctx_err("[IOVMM] Failed to get dma_buf_attach (err %ld)\n",
+				    PTR_ERR(dpb[index].attach[i]));
+			dpb[index].attach[i] = NULL;
+			goto err_iovmm;
+		}
+
+		dpb[index].sgt[i] =
+			dma_buf_map_attachment_unlocked(dpb[index].attach[i],
+							DMA_BIDIRECTIONAL);
+		if (IS_ERR(dpb[index].sgt[i])) {
+			mfc_ctx_err("[IOVMM] Failed to get sgt (err %ld)\n",
+				    PTR_ERR(dpb[index].sgt[i]));
+			dpb[index].sgt[i] = NULL;
+			goto err_iovmm;
+		}
+
+		dpb[index].addr[i] = sg_dma_address(dpb[index].sgt[i]->sgl);
+		if (IS_ERR_VALUE(dpb[index].addr[i])) {
+			mfc_ctx_err("[IOVMM] Failed to get iova (err 0x%p)\n",
+				    &dpb[index].addr[i]);
+			dpb[index].addr[i] = 0;
+			goto err_iovmm;
+		}
+
+		mfc_ctx_debug(2, "[IOVMM] index %d buf[%d] fd: %d addr: %#llx\n",
+			      index, i, dpb[index].fd[i], dpb[index].addr[i]);
+	}
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+	dpb[index].paddr = page_to_phys(sg_page(dpb[index].sgt[0]->sgl));
+#else
+	dpb[index].paddr = dpb[index].sgt[0]->sgl->dma_address;
+#endif
+	mfc_ctx_debug(2, "[DPB] dpb index [%d][%d] paddr %#llx daddr %#llx\n",
+		      mfc_buf->vb.vb2_buf.index,
+		      index, dpb[index].paddr, dpb[index].addr[0]);
+
+	dpb[index].mapcnt++;
+	mfc_ctx_debug(2, "[IOVMM] index %d mapcnt %d\n", index, dpb[index].mapcnt);
+	MFC_TRACE_CTX("DPB[%d] fd: %d addr: %#llx get(%d)\n",
+		      index, dpb[index].fd[0], dpb[index].addr[0], dpb[index].mapcnt);
+
+	/* In multi_view_enable, sub_view should be mapped together.
+	 * Lower 32 bits are used for main_view. Upper 32 bits are used for sub_view.
+	 */
+	if (ctx->multi_view_enable) {
+		sub_view_index = index + MFC_MAX_DPBS / 2;
+		if (dpb[sub_view_index].mapcnt != 0)
+			mfc_ctx_err("[IOVMM] DPB[%d] %#llx invalid mapcnt %d\n",
+				    sub_view_index, dpb[sub_view_index].addr[0],
+				    dpb[sub_view_index].mapcnt);
+
+		offset = ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1].offset;
+		for (i = 0; i < ctx->dst_fmt->mem_planes; i++) {
+			mem_get_count++;
+
+			dpb[sub_view_index].fd[i] = vb->planes[offset + i].m.fd;
+
+			dpb[sub_view_index].dmabufs[i] = dma_buf_get(vb->planes[offset + i].m.fd);
+			if (IS_ERR(dpb[sub_view_index].dmabufs[i])) {
+				mfc_ctx_err("[IOVMM] Failed to dma_buf_get (err %ld)\n",
+					    PTR_ERR(dpb[sub_view_index].dmabufs[i]));
+				dpb[sub_view_index].dmabufs[i] = NULL;
+				goto err_iovmm_sub;
+			}
+
+			dpb[sub_view_index].attach[i] =
+				dma_buf_attach(dpb[sub_view_index].dmabufs[i], dev->device);
+			if (IS_ERR(dpb[sub_view_index].attach[i])) {
+				mfc_ctx_err("[IOVMM] Failed to get dma_buf_attach (err %ld)\n",
+					    PTR_ERR(dpb[sub_view_index].attach[i]));
+				dpb[sub_view_index].attach[i] = NULL;
+				goto err_iovmm_sub;
+			}
+
+			dpb[sub_view_index].sgt[i] =
+				dma_buf_map_attachment_unlocked(dpb[sub_view_index].attach[i],
+								DMA_BIDIRECTIONAL);
+			if (IS_ERR(dpb[sub_view_index].sgt[i])) {
+				mfc_ctx_err("[IOVMM] Failed to get sgt (err %ld)\n",
+					    PTR_ERR(dpb[sub_view_index].sgt[i]));
+				dpb[sub_view_index].sgt[i] = NULL;
+				goto err_iovmm_sub;
+			}
+
+			dpb[sub_view_index].addr[i] =
+				sg_dma_address(dpb[sub_view_index].sgt[i]->sgl);
+			if (IS_ERR_VALUE(dpb[sub_view_index].addr[i])) {
+				mfc_ctx_err("[IOVMM] Failed to get iova (err 0x%p)\n",
+					    &dpb[sub_view_index].addr[i]);
+				dpb[sub_view_index].addr[i] = 0;
+				goto err_iovmm_sub;
+			}
+
+			mfc_ctx_debug(2, "[IOVMM] sub_view_index %d buf[%d] fd: %d addr: %#llx\n",
+				      sub_view_index, i, dpb[sub_view_index].fd[i],
+				      dpb[sub_view_index].addr[i]);
+		}
+#if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
+		dpb[sub_view_index].paddr = page_to_phys(sg_page(dpb[sub_view_index].sgt[0]->sgl));
+#else
+		dpb[sub_view_index].paddr = dpb[sub_view_index].sgt[0]->sgl->dma_address;
+#endif
+		mfc_ctx_debug(2, "[DPB] dpb index [%d][%d] paddr %#llx daddr %#llx\n",
+			      mfc_buf->vb.vb2_buf.index,
+			      sub_view_index, dpb[sub_view_index].paddr,
+			      dpb[sub_view_index].addr[0]);
+
+		dpb[sub_view_index].mapcnt++;
+		mfc_ctx_debug(2, "[IOVMM] index %d mapcnt %d\n", index, dpb[sub_view_index].mapcnt);
+		MFC_TRACE_CTX("DPB[%d] fd: %d addr: %#llx get(%d)\n",
+			      sub_view_index, dpb[sub_view_index].fd[0],
+			      dpb[sub_view_index].addr[0], dpb[sub_view_index].mapcnt);
+	}
+
+	return;
+
+err_iovmm:
+	dpb[index].mapcnt++;
+	mfc_put_iovmm(ctx, dpb, mem_get_count, index);
+	return;
+err_iovmm_sub:
+	dpb[sub_view_index].mapcnt++;
+	mfc_put_iovmm(ctx, dpb, mem_get_count, index);
+	mfc_put_iovmm(ctx, dpb, mem_get_count, sub_view_index);
+}
+
 void mfc_iova_pool_free(struct mfc_dev *dev, struct mfc_special_buf *buf)
 {
 	/* Project that do not support iova reservation */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
index 7b37e5fedbf2..3deeb0d611a0 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
@@ -66,9 +66,40 @@ static inline size_t mfc_mem_get_sg_length(struct mfc_dev *dev, struct sg_table
 	return size;
 }
 
+static inline void mfc_print_dpb_table(struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *mfc_buf = NULL;
+	unsigned long flags;
+	int i, found = 0;
+
+	mfc_ctx_debug(3, "[DPB] dynamic_used: %#lx, queued: %#lx, table_used: %#lx\n",
+		      dec->dynamic_used, dec->queued_dpb, dec->dpb_table_used);
+	for (i = 0; i < MFC_MAX_DPBS; i++) {
+		found = 0;
+		spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+		list_for_each_entry(mfc_buf, &ctx->dst_buf_queue.head, list) {
+			if (i == mfc_buf->dpb_index) {
+				found = 1;
+				break;
+			}
+		}
+
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		mfc_ctx_debug(3, "[%d] dpb [%d] %#010llx %#010llx %#010llx fd %d(%d) (%s, %s, %s)\n",
+			      i, found ? mfc_buf->vb.vb2_buf.index : -1,
+				dec->dpb[i].addr[0], dec->dpb[i].addr[1],
+				dec->dpb[i].paddr, dec->dpb[i].fd[0], dec->dpb[i].new_fd,
+				dec->dpb[i].mapcnt ? "map" : "unmap",
+				dec->dpb[i].ref ? "ref" : "free",
+				dec->dpb[i].queued ? "Q" : "DQ");
+	}
+}
 int mfc_mem_special_buf_alloc(struct mfc_dev *dev, struct mfc_special_buf *special_buf);
 void mfc_mem_special_buf_free(struct mfc_dev *dev, struct mfc_special_buf *special_buf);
 
+void mfc_put_iovmm(struct mfc_ctx *ctx, struct dpb_table *dpb, int num_planes, int index);
+void mfc_get_iovmm(struct mfc_ctx *ctx, struct vb2_buffer *vb, struct dpb_table *dpb);
 void mfc_iova_pool_free(struct mfc_dev *dev, struct mfc_special_buf *buf);
 int mfc_iova_pool_alloc(struct mfc_dev *dev, struct mfc_special_buf *buf);
 int mfc_iova_pool_init(struct mfc_dev *dev);
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
new file mode 100644
index 000000000000..f56e800c55f0
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
@@ -0,0 +1,930 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_queue.c
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_queue.h"
+
+#include "mfc_utils.h"
+#include "mfc_mem.h"
+
+void mfc_add_tail_buf(struct mfc_ctx *ctx,
+		      struct mfc_buf_queue *queue,
+		      struct mfc_buf *mfc_buf)
+{
+	unsigned long flags;
+
+	if (!mfc_buf) {
+		mfc_ctx_err("mfc_buf is NULL!\n");
+		return;
+	}
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	mfc_buf->used = 0;
+	list_add_tail(&mfc_buf->list, &queue->head);
+	queue->count++;
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+}
+
+struct mfc_buf *mfc_get_buf_no_used(struct mfc_ctx *ctx,
+				    struct mfc_buf_queue *queue,
+				    enum mfc_queue_used_type used)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&queue->head)) {
+		mfc_ctx_debug(2, "queue is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return NULL;
+	}
+
+	list_for_each_entry(mfc_buf, &queue->head, list) {
+		if (mfc_buf->used)
+			continue;
+
+		if (used == MFC_BUF_RESET_USED || used == MFC_BUF_SET_USED)
+			mfc_buf->used = used;
+
+		mfc_ctx_debug(2, "addr[0]: 0x%08llx\n", mfc_buf->addr[0][0]);
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return mfc_buf;
+	}
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return NULL;
+}
+
+struct mfc_buf *mfc_get_buf(struct mfc_ctx *ctx,
+			    struct mfc_buf_queue *queue,
+			    enum mfc_queue_used_type used)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&queue->head)) {
+		mfc_ctx_debug(2, "queue is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return NULL;
+	}
+
+	mfc_buf = list_entry(queue->head.next, struct mfc_buf, list);
+
+	if (used == MFC_BUF_RESET_USED || used == MFC_BUF_SET_USED)
+		mfc_buf->used = used;
+
+	mfc_ctx_debug(2, "addr[0]: 0x%08llx\n", mfc_buf->addr[0][0]);
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return mfc_buf;
+}
+
+struct mfc_buf *mfc_get_del_buf(struct mfc_ctx *ctx,
+				struct mfc_buf_queue *queue,
+				enum mfc_queue_used_type used)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&queue->head)) {
+		mfc_ctx_debug(2, "queue is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return NULL;
+	}
+
+	mfc_buf = list_entry(queue->head.next, struct mfc_buf, list);
+
+	if (used == MFC_BUF_RESET_USED || used == MFC_BUF_SET_USED)
+		mfc_buf->used = used;
+
+	mfc_ctx_debug(2, "addr[0]: 0x%08llx\n", mfc_buf->addr[0][0]);
+
+	list_del(&mfc_buf->list);
+	queue->count--;
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return mfc_buf;
+}
+
+struct mfc_buf *mfc_get_del_if_consumed(struct mfc_ctx *ctx,
+					struct mfc_buf_queue *queue,
+					unsigned int consumed,
+					unsigned int min_bytes,
+					int error,
+					int *deleted)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+	unsigned int remained, strm_size;
+	bool exceed = false;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&queue->head)) {
+		mfc_ctx_debug(2, "queue is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return NULL;
+	}
+
+	mfc_buf = list_entry(queue->head.next, struct mfc_buf, list);
+
+	mfc_ctx_debug(2, "addr[0]: 0x%08llx\n", mfc_buf->addr[0][0]);
+
+	strm_size = mfc_dec_get_strm_size(ctx, mfc_buf);
+	if (strm_size >= consumed) {
+		remained = strm_size - consumed;
+	} else {
+		remained = 0;
+		exceed = true;
+		mfc_ctx_err("[MULTIFRAME] consumed (%d) exceeded the strm_size (%d)\n",
+			    consumed, strm_size);
+	}
+
+	if (consumed > 0 && remained > min_bytes &&
+	    IS_NO_ERROR(error) && !exceed) {
+		/* do not delete from queue */
+		*deleted = 0;
+	} else {
+		list_del(&mfc_buf->list);
+		queue->count--;
+
+		*deleted = 1;
+	}
+
+	mfc_ctx_debug(2, "[MULTIFRAME] strm %d, consumed %d, remained %d, deleted %d, error %d, exceed %d\n",
+		      strm_size, consumed, remained, *deleted, error, exceed);
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return mfc_buf;
+}
+
+struct mfc_buf *mfc_get_move_buf(struct mfc_ctx *ctx,
+				 struct mfc_buf_queue *to_queue,
+				 struct mfc_buf_queue *from_queue,
+				 enum mfc_queue_used_type used,
+				 enum mfc_queue_top_type top)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&from_queue->head)) {
+		mfc_ctx_debug(2, "from_queue is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return NULL;
+	}
+
+	mfc_buf = list_entry(from_queue->head.next, struct mfc_buf, list);
+
+	if (used == MFC_BUF_RESET_USED || used == MFC_BUF_SET_USED)
+		mfc_buf->used = used;
+
+	mfc_ctx_debug(2, "addr[0]: 0x%08llx\n", mfc_buf->addr[0][0]);
+
+	list_del(&mfc_buf->list);
+	from_queue->count--;
+
+	if (top == MFC_QUEUE_ADD_TOP)
+		list_add(&mfc_buf->list, &to_queue->head);
+	else
+		list_add_tail(&mfc_buf->list, &to_queue->head);
+
+	to_queue->count++;
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return mfc_buf;
+}
+
+struct mfc_buf *mfc_get_move_buf_used(struct mfc_ctx *ctx,
+				      struct mfc_buf_queue *to_queue,
+				      struct mfc_buf_queue *from_queue)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&from_queue->head)) {
+		mfc_ctx_debug(2, "from_queue is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return NULL;
+	}
+
+	mfc_buf = list_entry(from_queue->head.next, struct mfc_buf, list);
+
+	if (mfc_buf->used) {
+		mfc_ctx_debug(2, "addr[0]: 0x%08llx\n", mfc_buf->addr[0][0]);
+
+		list_del(&mfc_buf->list);
+		from_queue->count--;
+
+		list_add_tail(&mfc_buf->list, &to_queue->head);
+		to_queue->count++;
+
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return mfc_buf;
+	}
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return NULL;
+}
+
+struct mfc_buf *mfc_find_first_buf(struct mfc_ctx *ctx,
+				   struct mfc_buf_queue *queue,
+				   dma_addr_t addr)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+	dma_addr_t mb_addr;
+	int i;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&queue->head)) {
+		mfc_ctx_debug(2, "queue is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return mfc_buf;
+	}
+
+	mfc_ctx_debug(4, "Looking for this address: 0x%08llx\n", addr);
+	mfc_buf = list_entry(queue->head.next, struct mfc_buf, list);
+	if (mfc_buf->num_valid_bufs > 0) {
+		for (i = 0; i < mfc_buf->num_valid_bufs; i++) {
+			mb_addr = mfc_buf->addr[i][0];
+			mfc_ctx_debug(4, "[BUFCON] batch[%d] addr[0]: 0x%08llx\n", i, mb_addr);
+			if (addr == mb_addr) {
+				spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+				return mfc_buf;
+			}
+		}
+	} else {
+		mb_addr = mfc_buf->addr[0][0];
+		mfc_ctx_debug(4, "addr[0]: 0x%08llx\n", mb_addr);
+
+		if (addr == mb_addr) {
+			spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+			return mfc_buf;
+		}
+	}
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return NULL;
+}
+
+struct mfc_buf *mfc_find_buf(struct mfc_ctx *ctx, struct mfc_buf_queue *queue, dma_addr_t addr)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+	dma_addr_t mb_addr;
+	int i;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	mfc_ctx_debug(4, "Looking for this address: 0x%08llx\n", addr);
+	list_for_each_entry(mfc_buf, &queue->head, list) {
+		if (mfc_buf->num_valid_bufs > 0) {
+			for (i = 0; i < mfc_buf->num_valid_bufs; i++) {
+				mb_addr = mfc_buf->addr[i][0];
+				mfc_ctx_debug(4, "[BUFCON] batch[%d] addr[0]: 0x%08llx\n",
+					      i, mb_addr);
+				if (addr == mb_addr) {
+					spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+					return mfc_buf;
+				}
+			}
+		} else {
+			mb_addr = mfc_buf->addr[0][0];
+			mfc_ctx_debug(4, "addr[0]: 0x%08llx\n", mb_addr);
+
+			if (addr == mb_addr) {
+				spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+				return mfc_buf;
+			}
+		}
+	}
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return NULL;
+}
+
+struct mfc_buf *mfc_find_del_buf(struct mfc_ctx *ctx, struct mfc_buf_queue *queue, dma_addr_t addr)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+	dma_addr_t mb_addr;
+	int found = 0, i;
+	int index_view;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	mfc_ctx_debug(4, "Looking for this address: 0x%08llx\n", addr);
+	list_for_each_entry(mfc_buf, &queue->head, list) {
+		if (mfc_buf->num_valid_bufs > 0) {
+			for (i = 0; i < mfc_buf->num_valid_bufs; i++) {
+				mb_addr = mfc_buf->addr[i][0];
+				mfc_ctx_debug(4, "batch buf[%d] plane[0] addr: 0x%08llx\n",
+					      i, mb_addr);
+
+				if (addr == mb_addr) {
+					found = 1;
+					break;
+				}
+			}
+
+			if (found)
+				break;
+		} else {
+			/*
+			 * In case of not Multi-View, Main view will be selected always.
+			 */
+			if (ctx->type == MFCINST_DECODER)
+				index_view = ctx->select_view_irq == MFC_VIEW_ID_MAIN ?
+					MFC_MV_BUF_IDX_VIEW0 : MFC_MV_BUF_IDX_VIEW1;
+			else
+				index_view = ctx->select_view == MFC_VIEW_ID_MAIN ?
+					MFC_MV_BUF_IDX_VIEW0 : MFC_MV_BUF_IDX_VIEW1;
+			mb_addr = mfc_buf->addr[index_view][0];
+			mfc_ctx_debug(4, "addr[0]: 0x%08llx\n", mb_addr);
+
+			if (addr == mb_addr) {
+				found = 1;
+				break;
+			}
+		}
+	}
+
+	if (found == 1) {
+		list_del(&mfc_buf->list);
+		queue->count--;
+
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return mfc_buf;
+	}
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+	return NULL;
+}
+
+void mfc_move_buf_all(struct mfc_ctx *ctx, struct mfc_buf_queue *to_queue,
+		      struct mfc_buf_queue *from_queue, enum mfc_queue_top_type top)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (top == MFC_QUEUE_ADD_TOP) {
+		while (!list_empty(&from_queue->head)) {
+			mfc_buf = list_entry(from_queue->head.prev, struct mfc_buf, list);
+
+			list_del(&mfc_buf->list);
+			from_queue->count--;
+
+			list_add(&mfc_buf->list, &to_queue->head);
+			to_queue->count++;
+		}
+	} else {
+		while (!list_empty(&from_queue->head)) {
+			mfc_buf = list_entry(from_queue->head.next, struct mfc_buf, list);
+
+			list_del(&mfc_buf->list);
+			from_queue->count--;
+
+			list_add_tail(&mfc_buf->list, &to_queue->head);
+			to_queue->count++;
+		}
+	}
+
+	INIT_LIST_HEAD(&from_queue->head);
+	from_queue->count = 0;
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+}
+
+void mfc_return_buf_to_ready_queue(struct mfc_ctx *ctx,
+				   struct mfc_buf_queue *maincore_queue,
+				   struct mfc_buf_queue *subcore_queue)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_buf_queue *to_queue = &ctx->src_buf_ready_queue;
+	struct mfc_buf_queue *first_queue, *second_queue;
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+	int maincore_src_index = -1, subcore_src_index = -1;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (list_empty(&maincore_queue->head) && list_empty(&subcore_queue->head)) {
+		mfc_ctx_debug(2, "all src queue of core_ctx is empty\n");
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return;
+	}
+
+	/* Search the last distributed src index */
+	if (!list_empty(&maincore_queue->head)) {
+		mfc_buf = list_entry(maincore_queue->head.prev, struct mfc_buf, list);
+		maincore_src_index = mfc_buf->src_index;
+		mfc_ctx_debug(4, "maincore src last buf src index: %d\n", maincore_src_index);
+	}
+	if (!list_empty(&subcore_queue->head)) {
+		mfc_buf = list_entry(subcore_queue->head.prev, struct mfc_buf, list);
+		subcore_src_index = mfc_buf->src_index;
+		mfc_ctx_debug(4, "subcore src last buf src index: %d\n", subcore_src_index);
+	}
+
+	MFC_TRACE_RM("[c:%d] last src index maincore %d subcore %d\n",
+		     ctx->num, maincore_src_index, subcore_src_index);
+
+	/* Select the core_ctx->src_buf_queue to take out first */
+	if (maincore_src_index > subcore_src_index) {
+		first_queue = maincore_queue;
+		second_queue = subcore_queue;
+		mfc_ctx_debug(2, "last src index (maincore:%d, subcore:%d) move first maincore\n",
+			      maincore_src_index, subcore_src_index);
+	} else {
+		first_queue = subcore_queue;
+		second_queue = maincore_queue;
+		mfc_ctx_debug(2, "last src index (maincore:%d, subcore:%d) move first subcore\n",
+			      maincore_src_index, subcore_src_index);
+	}
+
+	/* Src index is sequentially returned to ready_queue */
+	while (1) {
+		if (!list_empty(&first_queue->head)) {
+			mfc_buf = list_entry(first_queue->head.prev, struct mfc_buf, list);
+
+			list_del(&mfc_buf->list);
+			first_queue->count--;
+
+			list_add(&mfc_buf->list, &to_queue->head);
+			to_queue->count++;
+			mfc_ctx_debug(2, "first queue src[%d] move\n", mfc_buf->src_index);
+			MFC_TRACE_RM("[c:%d] first queue src[%d] move\n", ctx->num,
+				     mfc_buf->src_index);
+		}
+
+		if (!list_empty(&second_queue->head)) {
+			mfc_buf = list_entry(second_queue->head.prev, struct mfc_buf, list);
+
+			list_del(&mfc_buf->list);
+			second_queue->count--;
+
+			list_add(&mfc_buf->list, &to_queue->head);
+			to_queue->count++;
+			mfc_ctx_debug(2, "second queue src[%d] move\n", mfc_buf->src_index);
+			MFC_TRACE_RM("[c:%d] second queue src[%d] move\n", ctx->num,
+				     mfc_buf->src_index);
+		}
+
+		if (list_empty(&first_queue->head) && list_empty(&second_queue->head)) {
+			mfc_ctx_debug(2, "all src of core_ctx return to ready_queue\n");
+			mfc_ctx_debug(2, "ready %d maincore %d subcore %d\n",
+				      to_queue->count, maincore_queue->count,
+				      subcore_queue->count);
+			MFC_TRACE_RM("[c:%d] all src return to ready\n", ctx->num);
+			MFC_TRACE_RM("[c:%d] ready %d maincore %d subcore %d\n", ctx->num,
+				     to_queue->count, maincore_queue->count,
+				     subcore_queue->count);
+			INIT_LIST_HEAD(&first_queue->head);
+			first_queue->count = 0;
+			INIT_LIST_HEAD(&second_queue->head);
+			second_queue->count = 0;
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+}
+
+void mfc_cleanup_queue(spinlock_t *plock, struct mfc_buf_queue *queue)
+{
+	unsigned long flags;
+	struct mfc_buf *mfc_buf = NULL;
+	int i;
+
+	spin_lock_irqsave(plock, flags);
+
+	while (!list_empty(&queue->head)) {
+		mfc_buf = list_entry(queue->head.next, struct mfc_buf, list);
+
+		for (i = 0; i < mfc_buf->vb.vb2_buf.num_planes; i++)
+			vb2_set_plane_payload(&mfc_buf->vb.vb2_buf, i, 0);
+
+		vb2_buffer_done(&mfc_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		list_del(&mfc_buf->list);
+		queue->count--;
+	}
+
+	INIT_LIST_HEAD(&queue->head);
+	queue->count = 0;
+
+	spin_unlock_irqrestore(plock, flags);
+}
+
+void mfc_print_dpb_queue(struct mfc_core_ctx *core_ctx, struct mfc_dec *dec)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_buf *mfc_buf = NULL;
+
+	mfc_debug(2, "[DPB] src: %d(ready: %d), dst %d, used %#lx, queued %#lx, set %#lx(dec: %#lx)\n",
+		  core_ctx->src_buf_queue.count,
+		  ctx->src_buf_ready_queue.count,
+		  ctx->dst_buf_queue.count,
+		  dec->dynamic_used, dec->queued_dpb,
+		  core_ctx->dynamic_set, dec->dynamic_set);
+
+	if (!list_empty(&ctx->dst_buf_queue.head))
+		list_for_each_entry(mfc_buf, &ctx->dst_buf_queue.head, list)
+			mfc_debug(2, "[DPB] dst[%d][%d] %#llx used: %d\n",
+				  mfc_buf->vb.vb2_buf.index,
+				  mfc_buf->dpb_index,
+				  mfc_buf->addr[0][0], mfc_buf->used);
+}
+
+void mfc_print_dpb_queue_with_lock(struct mfc_core_ctx *core_ctx, struct mfc_dec *dec)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+	mfc_print_dpb_queue(core_ctx, dec);
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+}
+
+int mfc_get_available_dpb_count(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_buf *mfc_buf = NULL;
+	unsigned long flags, used_flag_count;
+	int cnt = 0;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	if (ctx->dst_buf_queue.count == 0) {
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return 0;
+	}
+
+	list_for_each_entry(mfc_buf, &ctx->dst_buf_queue.head, list) {
+		if (IS_TWO_MODE2(ctx) && (dec->dynamic_set & (1UL << mfc_buf->dpb_index))) {
+			mfc_debug(2, "[DPB] dst index %d already set\n",
+				  mfc_buf->dpb_index);
+			continue;
+		}
+		if ((dec->dynamic_used & (1UL << mfc_buf->dpb_index)) == 0) {
+			mfc_debug(2, "[DPB] There is available dpb(index:%d, used:%#lx)\n",
+				  mfc_buf->dpb_index, dec->dynamic_used);
+			cnt++;
+		}
+	}
+
+	if (cnt) {
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return cnt;
+	}
+
+	used_flag_count = hweight64(dec->dynamic_used);
+	if (used_flag_count >= ctx->dpb_count) {
+		mfc_debug(2, "[DPB] All DPB(%ld) of min count are referencing\n",
+			  used_flag_count);
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return 1;
+	}
+
+	mfc_debug(2, "[DPB] There is no available DPB\n");
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+
+	return 0;
+}
+
+/* Try to search non-referenced DPB on dst-queue */
+struct mfc_buf *mfc_search_for_dpb(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned long flags, used_flag_count;
+	struct mfc_buf *mfc_buf = NULL;
+	int dpb_index;
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+	list_for_each_entry(mfc_buf, &ctx->dst_buf_queue.head, list) {
+		dpb_index = mfc_buf->dpb_index;
+		/* sub_view was mapped together(at qbuf).
+		 * At the time, dpb_index of sub_view is dpb_index of main_view + MFC_MAX_DPBS / 2
+		 */
+		if (ctx->multi_view_enable && ctx->select_view == MFC_VIEW_ID_SUB)
+			dpb_index += (MFC_MAX_DPBS / 2);
+		if (IS_TWO_MODE2(ctx) && (dec->dynamic_set & (1UL << dpb_index))) {
+			mfc_debug(2, "[DPB] dst index %d already set\n",
+				  dpb_index);
+			continue;
+		}
+		if ((dec->dynamic_used & (1UL << dpb_index)) == 0) {
+			mfc_buf->used = 1;
+			dec->dynamic_set = 1UL << dpb_index;
+			core_ctx->dynamic_set = 1UL << dpb_index;
+			spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+			return mfc_buf;
+		}
+	}
+
+	/*
+	 * Bumping process
+	 * In case of H.264/HEVC codec,
+	 * all of the queued buffers can be referenced by F/W.
+	 * At that time, we should set the any DPB to F/W,
+	 * F/W will returns display only buffer whether if reference or not.
+	 * In this way the reference can be released by circulating.
+	 */
+	used_flag_count = hweight64(dec->dynamic_used);
+	if (used_flag_count >= ctx->dpb_count) {
+		mfc_buf = list_entry(ctx->dst_buf_queue.head.next, struct mfc_buf, list);
+		mfc_buf->used = 1;
+		dpb_index = mfc_buf->dpb_index;
+		if (ctx->multi_view_enable && ctx->select_view == MFC_VIEW_ID_SUB)
+			dpb_index += (MFC_MAX_DPBS / 2);
+		mfc_debug(2, "[DPB] All DPB(%ld) of min count are referencing. select buf[%d][%d]\n",
+			  used_flag_count, mfc_buf->vb.vb2_buf.index, dpb_index);
+		dec->dynamic_set = 1UL << dpb_index;
+		core_ctx->dynamic_set = 1UL << dpb_index;
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return mfc_buf;
+	}
+
+	/*
+	 * 1) ctx->dst_buf_queue.count >= (ctx->dpb_count + MFC_EXTRA_DPB): All DPBs queued in DRV
+	 * 2) ctx->dst_buf_queue.count == 0: All DPBs dequeued to user
+	 * we will wait
+	 */
+	mfc_debug(2, "[DPB] All enqueued DPBs are referencing or there's no DPB in DRV (in %d/total %d)\n",
+		  ctx->dst_buf_queue.count, ctx->dpb_count + MFC_EXTRA_DPB);
+	if (!(dec->queued_dpb & ~dec->dynamic_used))
+		mfc_debug(2, "[DPB] All enqueued DPBs are referencing\n");
+
+	mfc_print_dpb_queue(core_ctx, dec);
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+
+	mutex_lock(&dec->dpb_mutex);
+	mfc_print_dpb_table(ctx);
+	mutex_unlock(&dec->dpb_mutex);
+
+	return NULL;
+}
+
+static int __mfc_assign_dpb_index(struct mfc_ctx *ctx, struct mfc_buf *mfc_buf)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned long used;
+	int index = -1;
+	int max_dpb = MFC_MAX_DPBS;
+	int i, dpb_table_used;
+
+	/* When multi_view_enable(MV-HEVC), driver has to limit assign dpb_index
+	 * as the half of MAX_DPB. Because, upper half is for sub_view
+	 */
+	if (ctx->multi_view_enable)
+		max_dpb = MFC_MAX_DPBS / 2;
+
+	/* case 1: dpb has same address with vb index */
+	if (mfc_buf->paddr == dec->dpb[mfc_buf->vb.vb2_buf.index].paddr && index < max_dpb) {
+		mfc_ctx_debug(2, "[DPB] vb index [%d] %#llx has same address\n",
+			      mfc_buf->vb.vb2_buf.index, mfc_buf->paddr);
+		index = mfc_buf->vb.vb2_buf.index;
+		return index;
+	}
+
+	/* case 2: dpb has same address with referenced buffer */
+	used = dec->dynamic_used;
+	if (used) {
+		for (i = __ffs(used); i < max_dpb;) {
+			if (mfc_buf->paddr == dec->dpb[i].paddr) {
+				mfc_ctx_debug(2, "[DPB] index [%d][%d] %#llx is referenced\n",
+					      mfc_buf->vb.vb2_buf.index, i, mfc_buf->paddr);
+				index = i;
+				return index;
+			}
+			used &= ~(1UL << i);
+			if (used == 0)
+				break;
+			i = __ffs(used);
+		}
+	}
+
+	/* case 3: allocate new dpb index */
+	dpb_table_used = dec->dpb_table_used;
+	/* When multi_view_enable(MV-HEVC), upper half bits should be 1 not to be assigned. */
+	if (ctx->multi_view_enable)
+		dpb_table_used = dec->dpb_table_used | 0xFFFFFFFF00000000;
+	if (dpb_table_used == ~0UL) {
+		mfc_ctx_err("[DPB] index is full\n");
+		return 0;
+	}
+	index = __ffs(~dpb_table_used);
+
+	return index;
+}
+
+static void __mfc_update_base_addr_dpb(struct mfc_ctx *ctx, struct mfc_buf *buf,
+				       int index)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_raw_info *raw;
+	size_t offset = 0;
+	int i;
+
+	if (ctx->dst_fmt->mem_planes == 1) {
+		raw = &ctx->raw_buf;
+		for (i = 0; i < ctx->dst_fmt->num_planes; i++) {
+			buf->addr[0][i] = dec->dpb[index].addr[0] + offset;
+			offset += raw->plane_size[i];
+		}
+	} else {
+		for (i = 0; i < ctx->dst_fmt->mem_planes; i++)
+			buf->addr[0][i] = dec->dpb[index].addr[i];
+	}
+
+	mfc_ctx_debug(2, "[DPB] index [%d] daddr plane[0] %#llx [1] %#llx [2] %#llx\n",
+		      index, buf->addr[0][0], buf->addr[0][1], buf->addr[0][2]);
+}
+
+static int __mfc_update_dpb_fd(struct mfc_ctx *ctx, struct vb2_buffer *vb, int index)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+
+	if (dec->dpb[index].queued) {
+		mfc_ctx_err("[REFINFO] DPB[%d] is already queued\n", index);
+		return -EINVAL;
+	}
+
+	if (dec->dpb[index].fd[0] == vb->planes[0].m.fd)
+		mfc_ctx_debug(3, "[REFINFO] same dma_buf has same fd\n");
+
+	if (dec->dpb[index].new_fd != -1) {
+		dec->ref_buf[dec->refcnt].fd[0] = dec->dpb[index].fd[0];
+		dec->refcnt++;
+		dec->dpb[index].fd[0] = dec->dpb[index].new_fd;
+	}
+
+	dec->dpb[index].new_fd = vb->planes[0].m.fd;
+	mfc_ctx_debug(3, "[REFINFO] index %d update fd: %d -> %d after release\n",
+		      vb->index, dec->dpb[index].fd[0],
+		      dec->dpb[index].new_fd);
+
+	return 0;
+}
+
+static void __mfc_store_dynamic_dpb(struct mfc_ctx *ctx, struct mfc_dec *dec, struct vb2_buffer *vb)
+{
+	struct mfc_buf *mfc_buf;
+	unsigned long flags;
+	int index, plane, ret = 0;
+
+	mfc_buf = vb_to_mfc_buf(vb);
+	mfc_buf->used = 0;
+
+	mutex_lock(&dec->dpb_mutex);
+	mfc_buf->dpb_index = __mfc_assign_dpb_index(ctx, mfc_buf);
+	mfc_ctx_debug(2, "[DPB] DPB vb_index %d -> dpb_index %d addr %#llx (used: %#lx)\n",
+		      vb->index, mfc_buf->dpb_index, mfc_buf->addr[0][0], dec->dynamic_used);
+
+	index = mfc_buf->dpb_index;
+	if (index > dec->last_dpb_max_index) {
+		mfc_ctx_debug(3, "[DPB] last dpb max index update %d -> %d\n",
+			      dec->last_dpb_max_index, index);
+		if (index > (dec->last_dpb_max_index + 1)) {
+			mfc_ctx_err("[DPB] wrong dpb max index: %d max: %d\n",
+				    index, dec->last_dpb_max_index);
+			MFC_TRACE_CTX("wrong dpb max index: %d max: %d\n",
+				      index, dec->last_dpb_max_index);
+		}
+		dec->last_dpb_max_index = index;
+	}
+
+	if (!dec->dpb[index].mapcnt) {
+		mfc_get_iovmm(ctx, vb, dec->dpb);
+	} else {
+		if (dec->dpb[index].paddr == mfc_buf->paddr) {
+			mfc_ctx_debug(2, "[DPB] DPB[%d] is same %#llx(used: %#lx)\n",
+				      index, dec->dpb[index].paddr, dec->dynamic_used);
+			ret = __mfc_update_dpb_fd(ctx, vb, index);
+		} else {
+			mfc_ctx_err("[DPB] wrong assign dpb index\n");
+		}
+	}
+
+	if (ret) {
+		/*
+		 * Handling exception case that
+		 * the queued buffer is same with already queued buffer's paddr.
+		 * Driver cannot use that buffer so moves it to err_buf_queue
+		 * and will dequeue in ISR.
+		 */
+		mutex_unlock(&dec->dpb_mutex);
+
+		spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+		list_add_tail(&mfc_buf->list, &ctx->err_buf_queue.head);
+		ctx->err_buf_queue.count++;
+		mfc_ctx_debug(2, "[DPB] DPB[%d][%d] fd: %d will be not used %#llx %s %s (%d)\n",
+			      mfc_buf->vb.vb2_buf.index, index,
+			      mfc_buf->vb.planes[0].m.fd, mfc_buf->addr[0][0],
+			      (dec->dynamic_used & (1UL << index)) ? "ref" : "no-ref",
+			      dec->dpb[index].queued ? "q" : "dq",
+			      ctx->err_buf_queue.count);
+		MFC_TRACE_CTX("unused DPB[%d][%d] fd: %d %#llx %s %s (%d)\n",
+			      mfc_buf->vb.vb2_buf.index, index,
+			      mfc_buf->vb.planes[0].m.fd, mfc_buf->addr[0][0],
+			      (dec->dynamic_used & (1UL << index)) ? "ref" : "no-ref",
+			      dec->dpb[index].queued ? "q" : "dq",
+			      ctx->err_buf_queue.count);
+
+		spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+		return;
+	}
+
+	__mfc_update_base_addr_dpb(ctx, mfc_buf, index);
+
+	dec->dpb[index].size = 0;
+	for (plane = 0; plane < vb->num_planes; ++plane)
+		dec->dpb[index].size += vb->planes[plane].length;
+
+	dec->dpb[index].queued = 1;
+	dec->dpb_table_used |= (1UL << index);
+	mutex_unlock(&dec->dpb_mutex);
+
+	spin_lock_irqsave(&ctx->buf_queue_lock, flags);
+
+	list_add_tail(&mfc_buf->list, &ctx->dst_buf_queue.head);
+	ctx->dst_buf_queue.count++;
+	set_bit(index, &dec->queued_dpb);
+
+	spin_unlock_irqrestore(&ctx->buf_queue_lock, flags);
+}
+
+/* Add dst buffer in dst_buf_queue */
+void mfc_store_dpb(struct mfc_ctx *ctx, struct vb2_buffer *vb)
+{
+	struct mfc_dec *dec;
+
+	dec = ctx->dec_priv;
+	if (!dec) {
+		mfc_ctx_err("[DPB] no mfc decoder to run\n");
+		return;
+	}
+
+	__mfc_store_dynamic_dpb(ctx, dec, vb);
+}
+
+void mfc_dec_drc_find_del_buf(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_buf *dst_mb;
+	int i;
+
+	if (!dec || dec->disp_drc.disp_res_change)
+		return;
+
+	dst_mb = mfc_get_del_buf(ctx, &ctx->dst_buf_queue, MFC_BUF_NO_TOUCH_USED);
+	if (!dst_mb)
+		return;
+
+	mfc_info("[DRC] already stopped and dqbuf with DRC\n");
+	i = dst_mb->vb.vb2_buf.index;
+	dst_mb->vb.flags |= V4L2_BUF_FLAG_PFRAME;
+
+	mfc_clear_mb_flag(dst_mb);
+	dst_mb->vb.flags &= ~(V4L2_BUF_FLAG_KEYFRAME |
+			V4L2_BUF_FLAG_PFRAME |
+			V4L2_BUF_FLAG_BFRAME |
+			V4L2_BUF_FLAG_ERROR);
+
+	if (call_bop(ctx, core_get_buf_ctrls, core, ctx, &ctx->dst_ctrls[i]) < 0)
+		mfc_err("[DRC] failed in core_get_buf_ctrls\n");
+
+	call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[i],
+		 V4L2_CID_MPEG_MFC51_VIDEO_DISPLAY_STATUS,
+		 MFC_REG_DEC_STATUS_DECODING_EMPTY);
+	call_cop(ctx, update_buf_val, ctx, &ctx->dst_ctrls[i],
+		 V4L2_CID_MPEG_MFC51_VIDEO_FRAME_TAG, UNUSED_TAG);
+
+	ctx->wait_state = WAIT_G_FMT | WAIT_STOP;
+	mfc_debug(2, "[DRC] Decoding waiting again! : %d\n", ctx->wait_state);
+	MFC_TRACE_CTX("[DRC] wait again\n");
+	vb2_buffer_done(&dst_mb->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h
new file mode 100644
index 000000000000..055e7a23a527
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h
@@ -0,0 +1,156 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_queue.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_QUEUE_H
+#define __MFC_QUEUE_H __FILE__
+
+#include  "mfc_common.h"
+
+/**
+ * enum mfc_queue_used_type
+ */
+enum mfc_queue_used_type {
+	MFC_BUF_NO_TOUCH_USED	= -1,
+	MFC_BUF_RESET_USED	= 0,
+	MFC_BUF_SET_USED	= 1,
+};
+
+/**
+ * enum mfc_queue_top_type
+ */
+enum mfc_queue_top_type {
+	MFC_QUEUE_ADD_BOTTOM	= 0,
+	MFC_QUEUE_ADD_TOP	= 1,
+};
+
+static inline unsigned int mfc_get_queue_count(spinlock_t *plock, struct mfc_buf_queue *queue)
+{
+	unsigned long flags;
+	unsigned int ret = 0;
+
+	spin_lock_irqsave(plock, flags);
+	ret = queue->count;
+	spin_unlock_irqrestore(plock, flags);
+
+	return ret;
+}
+
+static inline int mfc_is_queue_count_same(spinlock_t *plock,
+					  struct mfc_buf_queue *queue,
+					  unsigned int value)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(plock, flags);
+	if (queue->count == value)
+		ret = 1;
+	spin_unlock_irqrestore(plock, flags);
+
+	return ret;
+}
+
+static inline int mfc_is_queue_count_greater(spinlock_t *plock,
+					     struct mfc_buf_queue *queue,
+					     unsigned int value)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(plock, flags);
+	if (queue->count > value)
+		ret = 1;
+	spin_unlock_irqrestore(plock, flags);
+
+	return ret;
+}
+
+static inline void mfc_init_queue(struct mfc_buf_queue *queue)
+{
+	INIT_LIST_HEAD(&queue->head);
+	queue->count = 0;
+}
+
+static inline void mfc_create_queue(struct mfc_buf_queue *queue)
+{
+	mfc_init_queue(queue);
+}
+
+static inline void mfc_delete_queue(struct mfc_buf_queue *queue)
+{
+	mfc_init_queue(queue);
+}
+
+void mfc_add_tail_buf(struct mfc_ctx *ctx,
+		      struct mfc_buf_queue *queue,
+		      struct mfc_buf *mfc_buf);
+
+struct mfc_buf *mfc_get_buf(struct mfc_ctx *ctx,
+			    struct mfc_buf_queue *queue,
+			    enum mfc_queue_used_type used);
+
+struct mfc_buf *mfc_get_buf_no_used(struct mfc_ctx *ctx,
+				    struct mfc_buf_queue *queue,
+				    enum mfc_queue_used_type used);
+
+struct mfc_buf *mfc_get_del_buf(struct mfc_ctx *ctx,
+				struct mfc_buf_queue *queue,
+				enum mfc_queue_used_type used);
+
+struct mfc_buf *mfc_get_del_if_consumed(struct mfc_ctx *ctx,
+					struct mfc_buf_queue *queue,
+					unsigned int consumed,
+					unsigned int min_bytes,
+					int err,
+					int *deleted);
+
+struct mfc_buf *mfc_get_move_buf(struct mfc_ctx *ctx,
+				 struct mfc_buf_queue *to_queue,
+				 struct mfc_buf_queue *from_queue,
+				 enum mfc_queue_used_type used,
+				 enum mfc_queue_top_type top);
+
+struct mfc_buf *mfc_get_move_buf_used(struct mfc_ctx *ctx,
+				      struct mfc_buf_queue *to_queue,
+				      struct mfc_buf_queue *from_queue);
+
+struct mfc_buf *mfc_find_first_buf(struct mfc_ctx *ctx,
+				   struct mfc_buf_queue *queue,
+				   dma_addr_t addr);
+
+struct mfc_buf *mfc_find_buf(struct mfc_ctx *ctx,
+			     struct mfc_buf_queue *queue,
+			     dma_addr_t addr);
+
+struct mfc_buf *mfc_find_del_buf(struct mfc_ctx *ctx,
+				 struct mfc_buf_queue *queue,
+				 dma_addr_t addr);
+
+void mfc_move_buf_all(struct mfc_ctx *ctx,
+		      struct mfc_buf_queue *to_queue,
+		      struct mfc_buf_queue *from_queue,
+		      enum mfc_queue_top_type top);
+
+void mfc_return_buf_to_ready_queue(struct mfc_ctx *ctx,
+				   struct mfc_buf_queue *maincore_queue,
+				   struct mfc_buf_queue *subcore_queue);
+
+void mfc_cleanup_queue(spinlock_t *plock, struct mfc_buf_queue *queue);
+
+void mfc_print_dpb_queue(struct mfc_core_ctx *core_ctx, struct mfc_dec *dec);
+void mfc_print_dpb_queue_with_lock(struct mfc_core_ctx *core_ctx, struct mfc_dec *dec);
+int mfc_get_available_dpb_count(struct mfc_core_ctx *core_ctx);
+struct mfc_buf *mfc_search_for_dpb(struct mfc_core_ctx *core_ctx);
+
+void mfc_store_dpb(struct mfc_ctx *ctx, struct vb2_buffer *vb);
+
+void mfc_dec_drc_find_del_buf(struct mfc_core_ctx *core_ctx);
+#endif /* __MFC_QUEUE_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
index f965a2e440c0..320dc96a40ed 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
@@ -116,6 +116,47 @@ static inline int mfc_is_decoder_node(enum mfc_node_type node)
 	return 0;
 }
 
+static inline void mfc_clear_mb_flag(struct mfc_buf *mfc_buf)
+{
+	mfc_buf->flag = 0;
+}
+
+static inline u32 mfc_dec_get_strm_size(struct mfc_ctx *ctx, struct mfc_buf *src_mb)
+{
+	struct vb2_plane *vb_plane;
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned int strm_size;
+
+	/*
+	 * struct v4l2_plane data_offset is included in bytesused.
+	 * So the size of image is bytesused - data_offset from start of the plane.
+	 * And the dec->consumed is cumulate-decoded size.
+	 */
+	vb_plane = &src_mb->vb.vb2_buf.planes[0];
+	if (!vb_plane->bytesused) {
+		strm_size = 0;
+	} else if (vb_plane->bytesused > vb_plane->data_offset) {
+		strm_size = vb_plane->bytesused - vb_plane->data_offset;
+	} else {
+		strm_size = vb_plane->bytesused;
+		mfc_ctx_info("[STREAM] invalid offset (bytesused %d, data_offset: %d)\n",
+			     vb_plane->bytesused, vb_plane->data_offset);
+	}
+
+	if (dec->consumed) {
+		if (strm_size > dec->consumed) {
+			strm_size -= dec->consumed;
+		} else {
+			mfc_ctx_info("[STREAM] invalid consumed (strm_size: %d, consumed: %d)",
+				     strm_size, dec->consumed);
+		}
+	}
+
+	mfc_ctx_debug(2, "[STREAM] strm_size: %d (bytesused %d, data_offset %d, consumed %d)\n",
+		      strm_size, vb_plane->bytesused, vb_plane->data_offset, dec->consumed);
+
+	return strm_size;
+}
 /* Meerkat interval */
 #define MEERKAT_TICK_INTERVAL   1000
 /* After how many executions meerkat should assume lock up */
-- 
2.34.1

