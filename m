Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EEBAB79E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEE110E4C7;
	Tue, 30 Sep 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="nLz0+MWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEBD10E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:12 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035612epoutp03ef405a8cfdcf05efd717433cad44d1bc~p8z0IVNPK3045830458epoutp033
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035612epoutp03ef405a8cfdcf05efd717433cad44d1bc~p8z0IVNPK3045830458epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204572;
 bh=k5Q0yXYyvjizI5MAYaxFlS+olIR1FX8bEG0KWGhdOAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nLz0+MWjceufWaCbJDYDIsVvVMBlJfcXGvrvX/GyXbdKjZczrOjN4fgjNPSE4whfz
 UXqWLr4oiM595ru8i11pTRWsbntr81MugoM3i10ArkjVqot1SJkERgvN9OnQONQ4qH
 b8YG5HryqxGW67bakqoEN9h/mG08eaDLQpQ2jX2s=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250930035612epcas5p395f3424e6367daa128cb17808d991aca~p8zzm0-q20522705227epcas5p3W;
 Tue, 30 Sep 2025 03:56:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cbPP71m43z3hhTJ; Tue, 30 Sep
 2025 03:56:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250930035610epcas5p3c64bccc78b92b0bb907a73615103ebd3~p8zxyLcX01490114901epcas5p3F;
 Tue, 30 Sep 2025 03:56:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035606epsmtip1933618e1ab88f050fecc7e60fc752e3c~p8zuGQuZe2938429384epsmtip14;
 Tue, 30 Sep 2025 03:56:06 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 12/29] media: mfc: Introduce QoS support and instance
 context handling
Date: Tue, 30 Sep 2025 09:33:31 +0530
Message-Id: <20250930040348.3702923-13-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035610epcas5p3c64bccc78b92b0bb907a73615103ebd3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035610epcas5p3c64bccc78b92b0bb907a73615103ebd3
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035610epcas5p3c64bccc78b92b0bb907a73615103ebd3@epcas5p3.samsung.com>
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

- Implement QoS support (load estimation, dynamic level adjustment,
PM‑QoS & idle‑mode handling)
- Add mfc_qos.c/h and integrate it into the Makefile
- Introduce instance‑context allocation/release APIs
(mfc_alloc_instance_context, mfc_release_instance_context)
- Update driver code to use the new APIs and add debugging/trace hooks
- Provide documentation/comments for the new functionality

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |   1 +
 .../samsung/exynos-mfc/base/mfc_buf.c         | 207 ++++
 .../samsung/exynos-mfc/base/mfc_buf.h         |   8 +
 .../samsung/exynos-mfc/base/mfc_qos.c         | 965 ++++++++++++++++++
 .../samsung/exynos-mfc/base/mfc_qos.h         |  99 ++
 5 files changed, 1280 insertions(+)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.h

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index bd5f80953bab..9def2686cd4e 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -21,5 +21,6 @@ exynos_mfc-y += mfc_core_hw_reg_api.o mfc_core_reg_api.o
 #Common base layer
 exynos_mfc-y += base/mfc_rate_calculate.o base/mfc_queue.o base/mfc_utils.o
 exynos_mfc-y += base/mfc_buf.o base/mfc_mem.o
+exynos_mfc-y += base/mfc_qos.o
 #Tracing
 # exynos_mfc-y += trace/mfc_trace_points.o
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
index b8b140824aab..bd1baf34e0b0 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
@@ -88,6 +88,213 @@ int mfc_alloc_common_context(struct mfc_core *core)
 	return ret;
 }
 
+/* Release instance buffer */
+void mfc_release_instance_context(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+
+	mfc_debug_enter();
+
+	mfc_iova_pool_free(core->dev, &core_ctx->instance_ctx_buf);
+
+	mfc_mem_special_buf_free(core->dev, &core_ctx->instance_ctx_buf);
+
+	mfc_debug_leave();
+}
+
+/* Allocate memory for instance data buffer */
+int mfc_alloc_instance_context(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dev *dev = ctx->dev;
+	struct mfc_ctx_buf_size *buf_size;
+
+	mfc_debug_enter();
+
+	buf_size = dev->variant->buf_size->ctx_buf;
+
+	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_H264_DEC:
+	case MFC_REG_CODEC_H264_MVC_DEC:
+		core_ctx->instance_ctx_buf.size = buf_size->h264_dec_ctx;
+		break;
+	default:
+		core_ctx->instance_ctx_buf.size = 0;
+		mfc_err("Codec type(%d) should be checked!\n", ctx->codec_mode);
+		return -ENOMEM;
+	}
+
+	core_ctx->instance_ctx_buf.buftype = MFCBUF_NORMAL;
+
+	snprintf(core_ctx->instance_ctx_buf.name,
+		 MFC_NUM_SPECIAL_BUF_NAME,
+		 "MFC%d ctx%d instance",
+		 core_ctx->core->id,
+		 core_ctx->num);
+	if (mfc_mem_special_buf_alloc(dev, &core_ctx->instance_ctx_buf)) {
+		mfc_err("Allocating context buffer failed\n");
+		return -ENOMEM;
+	}
+
+	if (mfc_iova_pool_alloc(dev, &core_ctx->instance_ctx_buf)) {
+		mfc_err("[POOL] failed to get iova\n");
+		mfc_release_instance_context(core_ctx);
+		return -ENOMEM;
+	}
+
+	mfc_debug_leave();
+
+	return 0;
+}
+
+static void __mfc_dec_calc_codec_buffer_size(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct mfc_dec *dec = ctx->dec_priv;
+
+	/* Codecs have different memory requirements */
+	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_H264_DEC:
+		ctx->scratch_buf_size = ALIGN(ctx->scratch_buf_size, SZ_256);
+		core_ctx->codec_buf.size = ctx->scratch_buf_size;
+		ctx->mv_buf.size = dec->mv_count * ctx->mv_size;
+		break;
+	default:
+		core_ctx->codec_buf.size = 0;
+		mfc_err("invalid codec type: %d\n", ctx->codec_mode);
+		break;
+	}
+
+	mfc_debug(2,
+		  "[MEMINFO] scratch: %zu, MV: %zu x count %d\n",
+		  ctx->scratch_buf_size,
+		  ctx->mv_size,
+		  dec->mv_count);
+	if (dec->loop_filter_mpeg4)
+		mfc_debug(2,
+			  "[MEMINFO] (loopfilter luma: %zu, chroma: %zu) x count %d\n",
+			  ctx->loopfilter_luma_size,
+			  ctx->loopfilter_chroma_size,
+			  NUM_MPEG4_LF_BUF);
+}
+
+/* Allocate codec buffers */
+int mfc_alloc_codec_buffers(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_dev *dev = core->dev;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+
+	mfc_debug_enter();
+
+	if (ctx->type == MFCINST_DECODER) {
+		__mfc_dec_calc_codec_buffer_size(core_ctx);
+	} else {
+		mfc_err("invalid type: %d\n", ctx->type);
+		return -EINVAL;
+	}
+
+	core_ctx->codec_buf.buftype = MFCBUF_NORMAL;
+	ctx->mv_buf.buftype = MFCBUF_NORMAL;
+
+	if (core_ctx->codec_buf.size > 0) {
+		snprintf(core_ctx->codec_buf.name,
+			 MFC_NUM_SPECIAL_BUF_NAME,
+			 "MFC%d ctx%d codec",
+			 core->id,
+			 core_ctx->num);
+		if (mfc_mem_special_buf_alloc(dev, &core_ctx->codec_buf)) {
+			mfc_err("Allocating codec buffer failed\n");
+			return -ENOMEM;
+		}
+		core_ctx->codec_buffer_allocated = 1;
+	} else if (ctx->codec_mode == MFC_REG_CODEC_MPEG2_DEC) {
+		core_ctx->codec_buffer_allocated = 1;
+	}
+
+	if (!ctx->mv_buffer_allocated && ctx->mv_buf.size > 0) {
+		snprintf(ctx->mv_buf.name,
+			 MFC_NUM_SPECIAL_BUF_NAME,
+			 "MFC%d ctx%d MV",
+			 core->id,
+			 ctx->num);
+		if (mfc_mem_special_buf_alloc(dev, &ctx->mv_buf)) {
+			mfc_err("Allocating MV buffer failed\n");
+			return -ENOMEM;
+		}
+		ctx->mv_buffer_allocated = 1;
+	}
+
+	mfc_debug_leave();
+
+	return 0;
+}
+
+/* Release buffers allocated for codec */
+void mfc_release_codec_buffers(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+
+	if (core_ctx->codec_buffer_allocated) {
+		mfc_mem_special_buf_free(ctx->dev, &core_ctx->codec_buf);
+		core_ctx->codec_buffer_allocated = 0;
+	}
+
+	if (ctx->mv_buffer_allocated) {
+		mfc_mem_special_buf_free(ctx->dev, &ctx->mv_buf);
+		ctx->mv_buffer_allocated = 0;
+	}
+
+	mfc_release_scratch_buffer(core_ctx);
+}
+
+int mfc_alloc_scratch_buffer(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	struct mfc_dev *dev = core->dev;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+
+	mfc_debug_enter();
+
+	if (core_ctx->scratch_buffer_allocated) {
+		mfc_mem_special_buf_free(dev, &core_ctx->scratch_buf);
+		core_ctx->scratch_buffer_allocated = 0;
+		mfc_debug(2, "[MEMINFO] Release the scratch buffer ctx[%d]\n", core_ctx->num);
+	}
+
+	core_ctx->scratch_buf.buftype = MFCBUF_NORMAL;
+
+	core_ctx->scratch_buf.size =  ALIGN(ctx->scratch_buf_size, SZ_256);
+	if (core_ctx->scratch_buf.size > 0) {
+		snprintf(core_ctx->scratch_buf.name,
+			 MFC_NUM_SPECIAL_BUF_NAME,
+			 "MFC%d ctx%d scratch",
+			 core->id,
+			 core_ctx->num);
+		if (mfc_mem_special_buf_alloc(dev, &core_ctx->scratch_buf)) {
+			mfc_err("Allocating scratch_buf buffer failed\n");
+			return -ENOMEM;
+		}
+		core_ctx->scratch_buffer_allocated = 1;
+	}
+
+	mfc_debug_leave();
+
+	return 0;
+}
+
+void mfc_release_scratch_buffer(struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+
+	mfc_debug_enter();
+	if (core_ctx->scratch_buffer_allocated) {
+		mfc_mem_special_buf_free(ctx->dev, &core_ctx->scratch_buf);
+		core_ctx->scratch_buffer_allocated = 0;
+	}
+	mfc_debug_leave();
+}
+
 /* Allocation buffer of debug infor memory for FW debugging */
 int mfc_alloc_dbg_info_buffer(struct mfc_core *core)
 {
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
index 8291e043b81a..6907cf6ac775 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
@@ -18,6 +18,14 @@
 void mfc_release_common_context(struct mfc_core *core);
 int mfc_alloc_common_context(struct mfc_core *core);
 
+void mfc_release_instance_context(struct mfc_core_ctx *core_ctx);
+int mfc_alloc_instance_context(struct mfc_core_ctx *core_ctx);
+
+int mfc_alloc_codec_buffers(struct mfc_core_ctx *core_ctx);
+void mfc_release_codec_buffers(struct mfc_core_ctx *core_ctx);
+int mfc_alloc_scratch_buffer(struct mfc_core_ctx *core_ctx);
+void mfc_release_scratch_buffer(struct mfc_core_ctx *core_ctx);
+
 int mfc_alloc_firmware(struct mfc_core *core);
 int mfc_load_firmware(struct mfc_core *core,
 		      struct mfc_special_buf *fw_buf,
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
new file mode 100644
index 000000000000..f6548543f07c
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
@@ -0,0 +1,965 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_qos.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/err.h>
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+#include <soc/samsung/freq-qos-tracer.h>
+#endif
+
+#include "mfc_qos.h"
+#include "mfc_utils.h"
+#include "mfc_queue.h"
+
+static inline int __mfc_core_get_qos_steps(struct mfc_core *core, int table_type)
+{
+	return core->core_pdata->num_default_qos_steps;
+}
+
+static inline struct mfc_qos *__mfc_core_get_qos_table(struct mfc_core *core, int table_type)
+{
+	return core->core_pdata->default_qos_table;
+}
+
+static inline unsigned long __mfc_qos_add_weight(struct mfc_ctx *ctx, unsigned long mb)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_qos_weight *qos_weight = &ctx->dev->pdata->qos_weight;
+	u32 num_planes = ctx->dst_fmt->num_planes;
+	int weight = 1000;
+	unsigned long weighted_mb;
+
+	switch (ctx->codec_mode) {
+	case MFC_REG_CODEC_H264_DEC:
+		weight = (weight * 100) / qos_weight->weight_h264_hevc;
+		mfc_ctx_debug(3, "[QoS] h264, hevc codec, weight: %d\n", weight / 10);
+		if (num_planes == 3) {
+			weight = (weight * 100) / qos_weight->weight_3plane;
+			mfc_ctx_debug(3, "[QoS] 3 plane, weight: %d\n", weight / 10);
+		}
+		break;
+	default:
+		mfc_ctx_err("[QoS] wrong codec_mode (%d), no weight\n", ctx->codec_mode);
+	}
+
+	if (dec) {
+		if (dec->num_of_tile_over_4) {
+			weight = (weight * 100) / qos_weight->weight_num_of_tile;
+			mfc_ctx_debug(3, "[QoS] num of tile >= 4, weight: %d\n", weight / 10);
+		}
+		if (dec->is_mbaff) {
+			weight = (weight * 100) / qos_weight->weight_mbaff;
+			mfc_ctx_debug(3, "[QoS] MBAFF, weight: %d\n", weight / 10);
+		}
+	}
+
+	weighted_mb = (mb * weight) / 1000;
+	mfc_ctx_debug(3, "%s %d, %s %d, %s %d, 422format: %d (mb: %ld)\n",
+		      "[QoS] weight:", weight / 10,
+		      "codec:", ctx->codec_mode,
+		      "num planes:", num_planes,
+		      ctx->is_422,
+		      weighted_mb);
+
+	return weighted_mb;
+}
+
+void mfc_qos_get_weighted_mb(struct mfc_ctx *ctx, enum mfc_real_time rt)
+{
+	unsigned long mb;
+	unsigned int max_mb = ctx->dev->core[MFC_DEC_DEFAULT_CORE]->core_pdata->max_mb;
+
+	ctx->mb_width = WIDTH_MB(ctx->img_width);
+	ctx->mb_height = HEIGHT_MB(ctx->img_height);
+	mb = ctx->mb_width * ctx->mb_height * (mfc_rate_get_rt_framerate(ctx, rt) / 1000);
+
+	/* Instance individual load regardless of operating in the multi core */
+	ctx->weighted_mb = __mfc_qos_add_weight(ctx, mb);
+	ctx->load = ctx->weighted_mb * 100 / max_mb;
+
+	mfc_ctx_debug(3, "[QoS] weighted_mb: %ld(load: %u)\n",
+		      ctx->weighted_mb, ctx->load);
+}
+
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+enum {
+	MFC_QOS_ADD = 0,
+	MFC_QOS_UPDATE,
+	MFC_QOS_REMOVE,
+	MFC_QOS_BW,
+};
+
+enum {
+	MFC_PERF_BOOST_DVFS	= BIT(0),
+	MFC_PERF_BOOST_MO	= BIT(1),
+	MFC_PERF_BOOST_CPU	= BIT(2),
+};
+
+void __mfc_qos_cpu_boost_enable(struct mfc_core *core)
+{
+	struct mfc_core_platdata *pdata = core->core_pdata;
+	struct mfc_qos_boost *qos_boost_table = pdata->qos_boost_table;
+	struct cpufreq_policy *policy;
+	int i;
+
+	for (i = 0; i < qos_boost_table->num_cluster; i++) {
+		policy = cpufreq_cpu_get(qos_boost_table->num_cpu[i]);
+		if (policy) {
+			freq_qos_tracer_add_request(&policy->constraints,
+						    &core->qos_req_cluster[i], FREQ_QOS_MIN,
+						    qos_boost_table->freq_cluster[i]);
+			mfc_core_debug(2, "[QoS][BOOST] CPU cluster[%d]: %d\n",
+				       i, qos_boost_table->freq_cluster[i]);
+		}
+	}
+
+	core->cpu_boost_enable = 1;
+}
+
+void __mfc_qos_cpu_boost_disable(struct mfc_core *core)
+{
+	struct mfc_core_platdata *pdata = core->core_pdata;
+	struct mfc_qos_boost *qos_boost_table = pdata->qos_boost_table;
+	int i;
+
+	for (i = 0; i < qos_boost_table->num_cluster; i++) {
+		freq_qos_tracer_remove_request(&core->qos_req_cluster[i]);
+		mfc_core_debug(2, "[QoS][BOOST] CPU cluster[%d] off\n", i);
+	}
+
+	core->cpu_boost_enable = 0;
+}
+
+void mfc_qos_set_portion(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	int idx;
+
+	/*
+	 * When only it is single instance,
+	 * there is an exact meaning in the qos portion.
+	 */
+	if (!ctx->mfc_qos_portion || core->num_inst > 1)
+		return;
+
+	idx = atomic_read(&core->qos_req_cur) - 1;
+	if (idx == -1)
+		return;
+
+	ctx->mfc_qos_portion[idx]++;
+}
+
+void mfc_qos_get_portion(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_qos *qos_table;
+	int num_qos_steps;
+	int i, sum = 0;
+	int table_type;
+
+	if (!ctx->mfc_qos_portion)
+		return;
+
+	table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
+
+	num_qos_steps = __mfc_core_get_qos_steps(core, table_type);
+	qos_table = __mfc_core_get_qos_table(core, table_type);
+
+	for (i = 0; i < num_qos_steps; i++) {
+		sum += ctx->mfc_qos_portion[i];
+		mfc_ctx_debug(2, "[QoS][portion] lv%d: %d frame, %d%% (type: %d, mfc: %d, int: %d, mif: %d, mo: %s)\n",
+			      i, ctx->mfc_qos_portion[i],
+			      ctx->mfc_qos_portion[i] * 100 / ctx->frame_cnt,
+			      core->last_table_type,
+			      qos_table[i].freq_mfc, qos_table[i].freq_int,
+			      qos_table[i].freq_mif, qos_table[i].name);
+	}
+	mfc_ctx_debug(2, "[QoS][portion] total %d frame (recorded %d)\n",
+		      ctx->frame_cnt, sum);
+}
+
+bool mfc_qos_mb_calculate(struct mfc_core *core, struct mfc_core_ctx *core_ctx,
+			  unsigned int processing_cycle, unsigned int frame_type)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	struct list_head *head = &core_ctx->mb_list;
+	struct mfc_mb_control *temp_mb;
+	struct mfc_mb_control *new_mb;
+	unsigned int avg_fps, need_fps, total_fps = 0;
+	unsigned long frame_time, drv_time, hw_mb, need_mb, avg_mb, margin_mb, total_mb = 0;
+	int table_type, num_qos_steps, cur_qos, count = 0, level_num;
+	bool update = false;
+
+	if (!core->dev->pdata->dynamic_weight ||
+	    (core->dev->debugfs.feature_option & MFC_OPTION_USE_FIXED_WEIGHT))
+		return update;
+
+	if (ctx->frame_cnt < (MFC_MIN_FPS / 1000) ||
+	    ctx->framerate > MFC_MAX_FPS ||
+	    core->dev->num_inst > 1) {
+		core_ctx->dynamic_weight_level = 0;
+		core_ctx->dynamic_weight_started = 0;
+		return update;
+	}
+
+	if (frame_type == 7) {
+		mfc_debug(4, "[QoS] Empty decoding\n");
+		return update;
+	}
+
+	mutex_lock(&core->qos_mutex);
+
+	if (!core_ctx->dynamic_weight_started) {
+		mfc_debug(4, "[QoS] Clear MB list\n");
+
+		while (!list_empty(head)) {
+			temp_mb = list_entry(head->next, struct mfc_mb_control, list);
+			list_del(&temp_mb->list);
+		}
+
+		core_ctx->mb_index = 0;
+		core_ctx->mb_is_full = 0;
+		core_ctx->mb_not_coded_time = 0;
+		core_ctx->dynamic_weight_level = 0;
+		core_ctx->dynamic_weight_started = 1;
+		core_ctx->mb_update_time = MFC_MAX_MB_TABLE;
+	}
+
+	new_mb = &core_ctx->mb_table[core_ctx->mb_index];
+
+	/* setup macroblock table list */
+	if (core_ctx->mb_is_full && !core_ctx->mb_not_coded_time) {
+		temp_mb = list_entry(head->next, struct mfc_mb_control, list);
+		list_del(&temp_mb->list);
+	}
+
+	hw_mb = ((ctx->crop_width + 15) / 16) * ((ctx->crop_height + 15) / 16);
+
+	if (IS_MULTI_STREAM(ctx))
+		drv_time = MFC_2CORE_DRV_TIME;
+	else if (ctx->type == MFCINST_DECODER)
+		drv_time = MFC_DRV_TIME;
+	else
+		drv_time = 0;
+
+	frame_time = processing_cycle / (core->last_mfc_freq / 1000) + drv_time;
+	if (core_ctx->mb_not_coded_time) {
+		mfc_debug(4, "[QoS] Add not coded time. %lu + %lu\n",
+			  frame_time, core_ctx->mb_not_coded_time);
+		frame_time += core_ctx->mb_not_coded_time;
+		core_ctx->mb_not_coded_time = 0;
+	} else {
+		list_add_tail(&new_mb->list, head);
+	}
+
+	if (frame_type == 0) {
+		mfc_debug(4, "[QoS] Not coded frame type. it accumulated to next frame\n");
+		if (frame_time)
+			core_ctx->mb_not_coded_time = frame_time;
+		else
+			core_ctx->mb_not_coded_time = 1;
+		goto qos_end;
+	}
+
+	if (frame_time) {
+		new_mb->mb_per_sec = (USEC_PER_SEC * hw_mb) / frame_time;
+		new_mb->fps = 1000000 / frame_time;
+	} else {
+		new_mb->mb_per_sec = 0;
+		new_mb->fps = 0;
+	}
+
+	mfc_debug(4, "[QoS] hw_mb: %ld, cycle: %d, t: %ld, mb: %ld, fps: %d, freq: %d\n",
+		  hw_mb, processing_cycle, frame_time, new_mb->mb_per_sec,
+		  new_mb->fps, core->last_mfc_freq);
+
+	mfc_debug(4, "[QoS] -------------- mb_table (MFC: %dKHz)\n", core->last_mfc_freq);
+	list_for_each_entry(temp_mb, head, list) {
+		mfc_debug(4, "[QoS][%d] %lu MB/sec, %u fps\n",
+			  count, temp_mb->mb_per_sec, temp_mb->fps);
+		total_mb += temp_mb->mb_per_sec;
+		total_fps += temp_mb->fps;
+		count++;
+	}
+
+	if (count == 0) {
+		mfc_err("[QoS] There is no list for MB\n");
+		goto qos_end;
+	}
+
+	core_ctx->mb_index++;
+	if (core_ctx->mb_index == MFC_MAX_MB_TABLE) {
+		core_ctx->mb_is_full = 1;
+		core_ctx->mb_index = 0;
+	}
+
+	/* Skip additional updates until the changed QoS is reflected */
+	if (core_ctx->mb_update_time)
+		core_ctx->mb_update_time--;
+
+	/* Calculate macroblock average */
+	if (ctx->disp_ratio)
+		need_fps = ((ctx->framerate / 1000) * ctx->disp_ratio) / 100;
+	else
+		need_fps = ctx->framerate / 1000;
+	if (IS_TWO_MODE2(ctx))
+		need_fps = need_fps / core->dev->num_core;
+	need_mb = hw_mb * need_fps;
+	avg_mb = total_mb / count;
+	avg_fps = total_fps / count;
+	core_ctx->avg_runtime = avg_fps ? (USEC_PER_SEC / avg_fps) : 0;
+
+	mfc_debug(2, "[QoS] MB/sec op: %lu, need: %lu, cur: %lu, fps op: %lu, need: %u cur: %u\n",
+		  hw_mb * ctx->framerate / 1000, need_mb, avg_mb,
+		  ctx->framerate / 1000, need_fps, avg_fps);
+
+	/* Calculate dynamic macroblock weight, it can be minus value */
+	if (ctx->type == MFCINST_DECODER)
+		margin_mb = MFC_DEC_MB_PER_TABLE;
+	else
+		margin_mb = MFC_ENC_MB_PER_TABLE;
+
+	if (need_mb < margin_mb)
+		margin_mb = need_mb / 2;
+	else if ((need_mb > core->core_pdata->max_mb) ||
+		 (IS_MULTI_STREAM(ctx) && IS_MFC_HEAVY_PERF(ctx, need_fps)))
+		margin_mb = margin_mb * core->dev->num_core;
+
+	if (ctx->type == MFCINST_DECODER)
+		table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
+
+	num_qos_steps = __mfc_core_get_qos_steps(core, table_type);
+
+	if (atomic_read(&core->qos_req_cur)) {
+		cur_qos = atomic_read(&core->qos_req_cur);
+		if (ctx->type == MFCINST_DECODER &&
+		    new_mb->mb_per_sec < need_mb &&
+		    cur_qos < num_qos_steps) {
+			level_num = ((need_mb - new_mb->mb_per_sec) + MFC_DEC_MB_PER_TABLE - 1) /
+				MFC_DEC_MB_PER_TABLE;
+			if (cur_qos + level_num <= num_qos_steps)
+				core_ctx->dynamic_weight_level =
+					core_ctx->dynamic_weight_level + level_num;
+			else
+				core_ctx->dynamic_weight_level = num_qos_steps - cur_qos;
+			mfc_debug(2, "[QoS] dec per frame perf is insufficient (weight level %d)\n",
+				  core_ctx->dynamic_weight_level);
+			update = true;
+		} else if ((avg_mb <= need_mb) &&
+			   (cur_qos < num_qos_steps) &&
+			   !core_ctx->mb_update_time) {
+			core_ctx->dynamic_weight_level++;
+			mfc_debug(2, "[QoS] avg perf is insufficient (weight level %d)\n",
+				  core_ctx->dynamic_weight_level);
+			update = true;
+		} else if ((avg_mb > need_mb + margin_mb) &&
+			   (cur_qos > 1) &&
+			   !core_ctx->mb_update_time) {
+			core_ctx->dynamic_weight_level--;
+			mfc_debug(2, "[QoS] perf is enough (weight level %d)\n",
+				  core_ctx->dynamic_weight_level);
+			update = true;
+		} else if (!core_ctx->mb_update_time) {
+			mfc_debug(2, "[QoS] perf is suitable\n");
+		}
+	}
+
+	if (update) {
+		while (!list_empty(head)) {
+			temp_mb = list_entry(head->next, struct mfc_mb_control, list);
+			list_del(&temp_mb->list);
+		}
+
+		core_ctx->mb_index = 0;
+		core_ctx->mb_is_full = 0;
+		core_ctx->mb_update_time = MFC_MAX_MB_TABLE;
+
+		mfc_debug(2, "[QoS] dynamic weight level: %d\n", core_ctx->dynamic_weight_level);
+	}
+
+qos_end:
+	mutex_unlock(&core->qos_mutex);
+
+	return update;
+}
+
+static void __mfc_qos_operate(struct mfc_core *core, int opr_type, int table_type, int idx)
+{
+	struct mfc_core_platdata *pdata = core->core_pdata;
+	struct mfc_qos *qos_table;
+	int freq_mfc;
+
+	qos_table = __mfc_core_get_qos_table(core, table_type);
+	/* When removing QoS, do not update because the table_type is not accurate. */
+	if (opr_type != MFC_QOS_REMOVE)
+		core->last_table_type = table_type;
+
+	if (core->mfc_freq_by_bps > qos_table[idx].freq_mfc)
+		freq_mfc = core->mfc_freq_by_bps;
+	else
+		freq_mfc = qos_table[idx].freq_mfc;
+
+	switch (opr_type) {
+	case MFC_QOS_ADD:
+		core->last_mfc_freq = freq_mfc;
+		if (pdata->mfc_freq_control)
+			exynos_pm_qos_add_request(&core->qos_req_mfc, pdata->pm_qos_id,
+						  freq_mfc);
+		exynos_pm_qos_add_request(&core->qos_req_int, PM_QOS_DEVICE_THROUGHPUT,
+					  qos_table[idx].freq_int);
+		exynos_pm_qos_add_request(&core->qos_req_mif, PM_QOS_BUS_THROUGHPUT,
+					  qos_table[idx].freq_mif);
+
+		atomic_set(&core->qos_req_cur, idx + 1);
+		mfc_core_debug(3, "[QoS] qos_req_cur: %d\n", atomic_read(&core->qos_req_cur) - 1);
+		MFC_TRACE_CORE("QoS add[%d] - mfc:%d(%s), int:%d, mif:%d\n",
+			       idx, freq_mfc, pdata->mfc_freq_control ? "used" : "un-used",
+			       qos_table[idx].freq_int, qos_table[idx].freq_mif);
+		mfc_core_debug(2, "[QoS] QoS add[%d] - mfc:%d(%s), int:%d, mif:%d\n",
+			       idx, freq_mfc, pdata->mfc_freq_control ? "used" : "un-used",
+			       qos_table[idx].freq_int, qos_table[idx].freq_mif);
+		break;
+	case MFC_QOS_UPDATE:
+		core->last_mfc_freq = freq_mfc;
+		if (pdata->mfc_freq_control)
+			exynos_pm_qos_update_request(&core->qos_req_mfc, freq_mfc);
+		exynos_pm_qos_update_request(&core->qos_req_int, qos_table[idx].freq_int);
+		exynos_pm_qos_update_request(&core->qos_req_mif, qos_table[idx].freq_mif);
+
+		atomic_set(&core->qos_req_cur, idx + 1);
+		mfc_core_debug(3, "[QoS] qos_req_cur: %d\n", atomic_read(&core->qos_req_cur) - 1);
+		MFC_TRACE_CORE("QoS update[%d] - mfc:%d(%s), int:%d, mif:%d\n",
+			       idx, freq_mfc, pdata->mfc_freq_control ? "used" : "un-used",
+			       qos_table[idx].freq_int, qos_table[idx].freq_mif);
+		mfc_core_debug(2, "[QoS] QoS update[%d] - mfc:%d(%s), int:%d, mif:%d\n",
+			       idx, freq_mfc, pdata->mfc_freq_control ? "used" : "un-used",
+			       qos_table[idx].freq_int, qos_table[idx].freq_mif);
+		break;
+	case MFC_QOS_REMOVE:
+		core->last_mfc_freq = 0;
+		if (atomic_read(&core->qos_req_cur) == 0) {
+			MFC_TRACE_CORE("QoS already removed\n");
+			mfc_core_debug(2, "[QoS] QoS already removed\n");
+			break;
+		}
+
+		mutex_lock(&core->pm_qos_mutex);
+		if (pdata->mfc_freq_control)
+			exynos_pm_qos_remove_request(&core->qos_req_mfc);
+		exynos_pm_qos_remove_request(&core->qos_req_int);
+		exynos_pm_qos_remove_request(&core->qos_req_mif);
+
+		atomic_set(&core->qos_req_cur, 0);
+		mfc_core_debug(3, "[QoS] qos_req_cur: %d\n", atomic_read(&core->qos_req_cur) - 1);
+		MFC_TRACE_CORE("QoS remove\n");
+		mfc_core_debug(2, "[QoS] QoS remove\n");
+		mutex_unlock(&core->pm_qos_mutex);
+		break;
+	case MFC_QOS_BW:
+		break;
+	default:
+		mfc_core_err("[QoS] Unknown request for opr [%d]\n", opr_type);
+		break;
+	}
+}
+
+static void __mfc_qos_set(struct mfc_core *core, struct mfc_ctx *ctx,
+			  int table_type, int i)
+{
+	struct mfc_core_platdata *pdata = core->core_pdata;
+	struct mfc_qos *qos_table;
+	int num_qos_steps;
+	int freq_mfc;
+
+	num_qos_steps = __mfc_core_get_qos_steps(core, table_type);
+	qos_table = __mfc_core_get_qos_table(core, table_type);
+
+	mfc_ctx_debug(2, "[QoS] %s table[%d] covered mb %d ~ %d (mfc: %d, int:%d, mif:%d)\n",
+		      table_type ? "enc" : "default", i, qos_table[i].threshold_mb,
+		      i == num_qos_steps - 1 ? pdata->max_mb : qos_table[i + 1].threshold_mb,
+		      qos_table[i].freq_mfc, qos_table[i].freq_int,
+		      qos_table[i].freq_mif);
+
+	mfc_core_debug(3, "[QoS] qos_req_cur: %d\n", atomic_read(&core->qos_req_cur) - 1);
+	if (atomic_read(&core->qos_req_cur) == 0) {
+		__mfc_qos_operate(core, MFC_QOS_ADD, table_type, i);
+	} else {
+		/*
+		 * 1) QoS level is changed
+		 * 2) MFC freq should be high regardless of QoS level
+		 */
+		if (atomic_read(&core->qos_req_cur) != (i + 1)) {
+			__mfc_qos_operate(core, MFC_QOS_UPDATE, table_type, i);
+		} else {
+			if (core->mfc_freq_by_bps > qos_table[i].freq_mfc)
+				freq_mfc = core->mfc_freq_by_bps;
+			else
+				freq_mfc = qos_table[i].freq_mfc;
+			if (freq_mfc != core->last_mfc_freq) {
+				mfc_ctx_debug(2, "[QoS] mfc freq changed (last: %d, by bps: %d, QoS table: %d)\n",
+					      core->last_mfc_freq,
+					      core->mfc_freq_by_bps,
+					      qos_table[i].freq_mfc);
+				__mfc_qos_operate(core, MFC_QOS_UPDATE, table_type, i);
+			}
+		}
+	}
+}
+
+static inline unsigned long __mfc_qos_get_mb_per_second(struct mfc_core *core,
+							struct mfc_core_ctx *core_ctx,
+							unsigned int max_mb)
+{
+	struct mfc_dev *dev = core->dev;
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	unsigned long mb_width, mb_height, fps, frame_mb, mb, qos_weighted_mb;
+
+	mb_width = (ctx->crop_width + 15) / 16;
+	mb_height = (ctx->crop_height + 15) / 16;
+	frame_mb = mb_width * mb_height;
+	if (IS_MULTI_MODE(ctx))
+		fps = ctx->framerate / 1000 / dev->num_core;
+	else
+		fps = ctx->framerate / 1000;
+
+	/* If decoder resolution is larger than HD and smaller than FHD, apply FHD for perf */
+	if (ctx->type == MFCINST_DECODER && frame_mb > MFC_HD_RES_MB &&
+	    frame_mb < MFC_FHD_RES_MB) {
+		mfc_debug(3, "[QoS] frame MB size is changed %lu -> %d (%dx%d)\n",
+			  frame_mb, MFC_FHD_RES_MB,
+			  ctx->crop_width, ctx->crop_height);
+		frame_mb = MFC_FHD_RES_MB;
+	}
+
+	mb = frame_mb * fps;
+	qos_weighted_mb = __mfc_qos_add_weight(ctx, mb);
+
+	mfc_debug(3, "[QoS] ctx[%d:%s] %d x %d @ %ld fps (mb: %ld), %dkbps\n",
+		  ctx->num, ctx->type == MFCINST_ENCODER ? "ENC" : "DEC",
+		  ctx->crop_width, ctx->crop_height, fps, mb, ctx->kbps);
+
+	if (ctx->update_framerate) {
+		core_ctx->dynamic_weight_level = 0;
+		core_ctx->dynamic_weight_started = 0;
+		mfc_debug(4, "[QoS] clear dynamic weight, update_framerate: %d\n",
+			  ctx->update_framerate);
+	}
+
+	mfc_debug(4, "[QoS] weight (hw_mb: %lu)\n", qos_weighted_mb);
+	return qos_weighted_mb;
+}
+
+void __mfc_qos_calculate(struct mfc_core *core, struct mfc_ctx *ctx, int delete)
+{
+	struct mfc_core_platdata *pdata = core->core_pdata;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	struct mfc_qos *qos_table;
+	struct mfc_ctx *qos_ctx;
+	struct mfc_core_ctx *qos_core_ctx;
+	unsigned long hw_mb = 0, total_mb = 0, total_fps = 0;
+	int total_bps = 0, mfc_freq_idx;
+	unsigned int fw_time, sw_time;
+	int i, qos_level, found = 0, dec_found = 0, heif_found = 0;
+	int table_type = MFC_QOS_TABLE_TYPE_DEFAULT, num_qos_steps;
+
+	/* get the hw macroblock */
+	list_for_each_entry(qos_core_ctx, &core->qos_queue, qos_list) {
+		if (delete && qos_core_ctx == core->core_ctx[ctx->num]) {
+			found = 1;
+			continue;
+		}
+
+		qos_ctx = qos_core_ctx->ctx;
+		if (qos_ctx->idle_mode == MFC_IDLE_MODE_IDLE) {
+			mfc_ctx_debug(3, "[QoS][MFCIDLE] skip idle ctx [%d]\n", qos_ctx->num);
+			continue;
+		}
+		if (qos_ctx->is_heif_mode)
+			heif_found += 1;
+
+		if (qos_ctx->type == MFCINST_DECODER)
+			dec_found += 1;
+		hw_mb += __mfc_qos_get_mb_per_second(core, qos_core_ctx, pdata->max_mb);
+		total_fps += (qos_ctx->framerate / 1000);
+		total_bps += qos_ctx->kbps;
+	}
+
+	if (found)
+		list_del(&core->core_ctx[ctx->num]->qos_list);
+
+	if (dec_found)
+		table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
+
+	num_qos_steps = __mfc_core_get_qos_steps(core, table_type);
+	qos_table = __mfc_core_get_qos_table(core, table_type);
+
+	/* search the suitable qos table */
+	for (i = num_qos_steps - 1; i >= 0; i--) {
+		fw_time = qos_table[i].time_fw;
+		sw_time = (MFC_DRV_TIME + fw_time);
+
+		if ((total_fps * sw_time) >= 1000000)
+			total_mb = pdata->max_mb;
+		else
+			total_mb = ((1000000 * hw_mb) / (1000000 - (total_fps * sw_time)));
+
+		mfc_ctx_debug(4, "%s %s %s[%d] %s %dus, %s %ld, %s %d, %s %ld, %s %ld\n",
+			      "[QoS]", table_type ? "enc" : "default",
+			      "table", i,
+			      "fw_time:", fw_time,
+			      "hw_mb:", hw_mb,
+			      "sw_time:", sw_time,
+			      "total_fps:", total_fps,
+			      "total_mb:", total_mb);
+
+		if (total_mb > qos_table[i].threshold_mb || total_mb == 0 || i == 0)
+			break;
+	}
+
+	if (total_mb > pdata->max_mb)
+		mfc_ctx_debug(4, "[QoS] overspec mb %ld > %d\n", total_mb, pdata->max_mb);
+
+	if (dec_found) {
+		/* search the suitable independent mfc freq using bps */
+		mfc_freq_idx = mfc_rate_get_bps_section_by_bps
+			(core->dev, total_bps, core->dev->max_kbps);
+		core->mfc_freq_by_bps = core->dev->pdata->mfc_freqs[mfc_freq_idx];
+	} else {
+		core->mfc_freq_by_bps = 0;
+	}
+
+	if (delete && (list_empty(&core->qos_queue) || total_mb == 0)) {
+		if (core->cpu_boost_enable)
+			__mfc_qos_cpu_boost_disable(core);
+		__mfc_qos_operate(core, MFC_QOS_REMOVE, table_type, 0);
+	} else {
+		if (heif_found) {
+			qos_level = num_qos_steps - 1;
+			mfc_ctx_debug(2, "[QoS][BOOST] use max level for HEIF\n");
+			if (!core->cpu_boost_enable)
+				__mfc_qos_cpu_boost_enable(core);
+		} else {
+			qos_level = i;
+			if (core_ctx->dynamic_weight_level) {
+				qos_level += core_ctx->dynamic_weight_level;
+				if (qos_level >= num_qos_steps)
+					qos_level = num_qos_steps - 1;
+				else if (qos_level < 0)
+					qos_level = 0;
+				mfc_ctx_debug(2, "[QoS] add dynamic weight level %d. table[%d]\n",
+					      core_ctx->dynamic_weight_level, qos_level);
+			}
+			if (core->cpu_boost_enable)
+				__mfc_qos_cpu_boost_disable(core);
+		}
+		__mfc_qos_set(core, ctx, table_type, qos_level);
+	}
+}
+
+void mfc_qos_on(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *qos_core_ctx;
+	int found = 0;
+
+	if (core->core_ctx[ctx->num] && core->core_ctx[ctx->num]->state == MFCINST_FREE) {
+		mfc_ctx_info("[QoS] instance not started yet\n");
+		return;
+	}
+
+	mutex_lock(&core->qos_mutex);
+	list_for_each_entry(qos_core_ctx, &core->qos_queue, qos_list)
+		if (qos_core_ctx == core->core_ctx[ctx->num])
+			found = 1;
+
+	if (!found)
+		list_add_tail(&core->core_ctx[ctx->num]->qos_list,
+			      &core->qos_queue);
+
+	__mfc_qos_calculate(core, ctx, MFC_QOS_ADD);
+
+	mutex_unlock(&core->qos_mutex);
+}
+
+void mfc_qos_off(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	int table_type = MFC_QOS_TABLE_TYPE_DEFAULT;
+
+	mutex_lock(&core->qos_mutex);
+
+	if (list_empty(&core->qos_queue)) {
+		if (atomic_read(&core->qos_req_cur) != 0) {
+			mfc_ctx_err("[QoS] MFC request count is wrong!\n");
+			if (core->cpu_boost_enable)
+				__mfc_qos_cpu_boost_disable(core);
+			__mfc_qos_operate(core, MFC_QOS_REMOVE, table_type, 0);
+		}
+		goto out;
+	}
+
+	if (ON_RES_CHANGE(core->core_ctx[ctx->num]))
+		goto out;
+
+	__mfc_qos_calculate(core, ctx, MFC_QOS_REMOVE);
+
+out:
+	mutex_unlock(&core->qos_mutex);
+}
+
+void mfc_qos_update(struct mfc_core *core, int on)
+{
+	struct mfc_platdata *pdata = core->dev->pdata;
+	struct mfc_platdata *dev_pdata = core->dev->pdata;
+	unsigned int mfc_freq;
+	int qos, i;
+
+	if (core->dev->debugfs.feature_option & MFC_OPTION_DYNAMIC_QOS_DISABLE)
+		return;
+
+	mfc_core_debug_enter();
+
+	mutex_lock(&core->qos_mutex);
+
+	if ((atomic_read(&core->qos_req_cur) <= 1) ||
+	    (atomic_read(&core->qos_req_cur) > (dev_pdata->qos_ctrl_level + 1)) ||
+	    core->last_table_type != MFC_QOS_TABLE_TYPE_DEFAULT) {
+		mutex_unlock(&core->qos_mutex);
+		return;
+	}
+
+	if (on) {
+		qos = atomic_read(&core->qos_req_cur) - 1;
+		mfc_freq = core->last_mfc_freq;
+		mfc_core_debug(3, "[QoS] ON: QoS update[%d], mfc freq %d\n",
+			       qos, mfc_freq);
+	} else {
+		qos = 0;
+		mfc_freq = pdata->mfc_freqs[0];
+		mfc_core_debug(3, "[QoS] OFF: QoS update[%d], mfc freq %d\n",
+			       qos, mfc_freq);
+	}
+
+	i = core->qos_ctrl_last_idx;
+	core->qos_ctrl[i].idx = qos;
+	core->qos_ctrl[i].table_type = core->last_table_type;
+	core->qos_ctrl[i].mfc_freq = mfc_freq;
+	core->qos_ctrl_last_idx++;
+	if (core->qos_ctrl_last_idx >= MAX_NUM_QOS_DYNAMIC)
+		core->qos_ctrl_last_idx = 0;
+
+	mutex_unlock(&core->qos_mutex);
+
+	queue_work(core->qos_ctrl_wq, &core->qos_ctrl_work);
+
+	mfc_core_debug_leave();
+}
+
+void mfc_qos_ctrl_worker(struct work_struct *work)
+{
+	struct mfc_core *core;
+	struct mfc_core_platdata *pdata;
+	struct mfc_platdata *dev_pdata;
+	struct mfc_qos *qos_table;
+	int idx, i;
+
+	core = container_of(work, struct mfc_core, qos_ctrl_work);
+	pdata = core->core_pdata;
+	dev_pdata = core->dev->pdata;
+
+	mutex_lock(&core->qos_mutex);
+
+	if (!core->qos_ctrl_last_idx) {
+		mutex_unlock(&core->qos_mutex);
+		return;
+	}
+
+	i = core->qos_ctrl_last_idx;
+	do {
+		core->qos_ctrl_last_idx = 0;
+
+		if ((atomic_read(&core->qos_req_cur) > (dev_pdata->qos_ctrl_level + 1)) ||
+		    atomic_read(&core->qos_req_cur) <= 1) {
+			mutex_unlock(&core->qos_mutex);
+			return;
+		}
+
+		i--;
+		idx = core->qos_ctrl[i].idx;
+		qos_table = __mfc_core_get_qos_table(core, core->qos_ctrl[i].table_type);
+
+		mutex_unlock(&core->qos_mutex);
+
+		/* use pm_qos_mutex to reduce pm_qos_update latency */
+		mutex_lock(&core->pm_qos_mutex);
+		if (atomic_read(&core->qos_req_cur) == 0) {
+			mutex_unlock(&core->pm_qos_mutex);
+			return;
+		}
+
+		if (pdata->mfc_freq_control)
+			exynos_pm_qos_update_request
+				(&core->qos_req_mfc, core->qos_ctrl[i].mfc_freq);
+
+		exynos_pm_qos_update_request(&core->qos_req_int, qos_table[idx].freq_int);
+		exynos_pm_qos_update_request(&core->qos_req_mif, qos_table[idx].freq_mif);
+		mfc_core_debug(3, "[QoS] WORKER: QoS update[%d], mfc freq %d\n",
+			       idx, core->qos_ctrl[i].mfc_freq);
+
+		mutex_unlock(&core->pm_qos_mutex);
+
+		mutex_lock(&core->qos_mutex);
+		i = core->qos_ctrl_last_idx;
+	} while (i);
+
+	mutex_unlock(&core->qos_mutex);
+}
+
+void __mfc_qos_on_idle(struct mfc_core *core)
+{
+	struct mfc_ctx *ctx;
+	int i;
+
+	mutex_lock(&core->dev->mfc_migrate_mutex);
+	if (!core->num_inst) {
+		mutex_unlock(&core->dev->mfc_migrate_mutex);
+		return;
+	}
+
+	for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+		if (core->core_ctx[i]) {
+			ctx = core->core_ctx[i]->ctx;
+			mfc_qos_on(core, ctx);
+			break;
+		}
+	}
+	mutex_unlock(&core->dev->mfc_migrate_mutex);
+}
+
+void __mfc_qos_off_all(struct mfc_core *core)
+{
+	struct mfc_core_ctx *qos_core_ctx, *tmp_core_ctx;
+
+	mutex_lock(&core->qos_mutex);
+	if (list_empty(&core->qos_queue)) {
+		mfc_core_err("[QoS][MFCIDLE] MFC QoS list already empty (%d)\n",
+			     atomic_read(&core->qos_req_cur));
+		mutex_unlock(&core->qos_mutex);
+		return;
+	}
+
+	/* Delete all of QoS list */
+	list_for_each_entry_safe(qos_core_ctx, tmp_core_ctx, &core->qos_queue, qos_list)
+		list_del(&qos_core_ctx->qos_list);
+
+	/* Select the opend ctx structure for QoS remove */
+	if (core->cpu_boost_enable)
+		__mfc_qos_cpu_boost_disable(core);
+	__mfc_qos_operate(core, MFC_QOS_REMOVE, MFC_QOS_TABLE_TYPE_DEFAULT, 0);
+	mutex_unlock(&core->qos_mutex);
+}
+#else
+bool mfc_qos_mb_calculate(struct mfc_core *core, struct mfc_core_ctx *core_ctx,
+			  unsigned int processing_cycle, unsigned int frame_type)
+{
+	return false;
+}
+#endif
+
+void mfc_qos_idle_worker(struct work_struct *work)
+{
+	struct mfc_core *core;
+	struct mfc_core_ctx *core_ctx;
+	struct mfc_ctx *ctx;
+	int is_idle = 0, qos_num_inst = 0;
+
+	core = container_of(work, struct mfc_core, mfc_idle_work);
+
+	mutex_lock(&core->dev->mfc_mutex);
+
+	mutex_lock(&core->idle_qos_mutex);
+
+	/* Check idle mode for all context */
+	mutex_lock(&core->qos_mutex);
+	list_for_each_entry(core_ctx, &core->qos_queue, qos_list) {
+		ctx = core_ctx->ctx;
+		qos_num_inst++;
+		if (((atomic_read(&core->hw_run_bits) & BIT(ctx->num)) == 0) &&
+		    ((atomic_read(&core->dev->queued_bits) & BIT(ctx->num)) == 0)) {
+			mfc_ctx_change_idle_mode(ctx, MFC_IDLE_MODE_IDLE);
+			mfc_debug(3, "[MFCIDLE] ctx[%d] is idle (hw %#x Q %#x)\n", ctx->num,
+				  atomic_read(&core->hw_run_bits),
+				  atomic_read(&core->dev->queued_bits));
+			is_idle = 1;
+		} else {
+			mfc_ctx_change_idle_mode(ctx, MFC_IDLE_MODE_NONE);
+		}
+	}
+	mutex_unlock(&core->qos_mutex);
+
+	if (core->idle_mode == MFC_IDLE_MODE_CANCEL) {
+		mfc_core_change_idle_mode(core, MFC_IDLE_MODE_NONE);
+		mfc_core_debug(2, "[QoS][MFCIDLE] idle mode is canceled\n");
+		goto ctx_idle;
+	} else if (core->idle_mode == MFC_IDLE_MODE_NONE) {
+		mfc_core_idle_checker_start_tick(core);
+		goto ctx_idle;
+	}
+
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+	__mfc_qos_off_all(core);
+#endif
+	if (qos_num_inst == 1) {
+		mfc_core_info("[QoS][MFCIDLE] go to idle mode (src %d(ready %d), dst %d, framecnt %d)\n",
+			      mfc_get_queue_count(&ctx->buf_queue_lock, &core_ctx->src_buf_queue),
+			      mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->src_buf_ready_queue),
+			      mfc_get_queue_count(&ctx->buf_queue_lock, &ctx->dst_buf_queue),
+			      ctx->frame_cnt);
+	} else {
+		mfc_core_info("[QoS][MFCIDLE] go to idle mode\n");
+	}
+
+	mfc_core_change_idle_mode(core, MFC_IDLE_MODE_IDLE);
+	mutex_unlock(&core->idle_qos_mutex);
+	mutex_unlock(&core->dev->mfc_mutex);
+	return;
+
+ctx_idle:
+	if (is_idle) {
+		mfc_core_debug(2, "[QoS][MFCIDLE] idle mode is for ctx\n");
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+		__mfc_qos_on_idle(core);
+#endif
+	}
+
+	mutex_unlock(&core->idle_qos_mutex);
+	mutex_unlock(&core->dev->mfc_mutex);
+}
+
+bool mfc_qos_idle_trigger(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	bool update_idle = false;
+
+	mutex_lock(&core->idle_qos_mutex);
+	if (core->idle_mode == MFC_IDLE_MODE_IDLE) {
+		mfc_ctx_debug(2, "[QoS][MFCIDLE] restart QoS control\n");
+		mfc_core_change_idle_mode(core, MFC_IDLE_MODE_NONE);
+		update_idle = true;
+	} else if (core->idle_mode == MFC_IDLE_MODE_RUNNING) {
+		mfc_ctx_debug(2, "[QoS][MFCIDLE] restart QoS control, cancel idle\n");
+		mfc_core_change_idle_mode(core, MFC_IDLE_MODE_CANCEL);
+		update_idle = true;
+	}
+
+	if (ctx->idle_mode == MFC_IDLE_MODE_IDLE) {
+		mfc_ctx_debug(2, "[QoS][MFCIDLE] restart QoS control for ctx\n");
+		mfc_ctx_change_idle_mode(ctx, MFC_IDLE_MODE_NONE);
+		update_idle = true;
+	}
+	mutex_unlock(&core->idle_qos_mutex);
+
+	return update_idle;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.h
new file mode 100644
index 000000000000..d9c0e2828bfa
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_qos.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_QOS_H
+#define __MFC_QOS_H __FILE__
+
+#include "mfc_common.h"
+
+#define MB_COUNT_PER_UHD_FRAME		32400
+#define MAX_FPS_PER_UHD_FRAME		120
+#define MIN_BW_PER_SEC			1
+
+#define MFC_2CORE_DRV_TIME			1500
+#define MFC_DRV_TIME			500
+#define MFC_DEC_MB_PER_TABLE		650000
+#define MFC_ENC_MB_PER_TABLE		400000
+
+/* It is the same value with ID_DEFAULT of exynos-bts.c */
+#define BTS_DEFAULT_SCEN_IDX	0
+
+enum {
+	MFC_QOS_TABLE_TYPE_DEFAULT	= 0,
+	MFC_QOS_TABLE_TYPE_ENCODER	= 1,
+};
+
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+void mfc_qos_on(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_qos_off(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_qos_update(struct mfc_core *core, int on);
+void mfc_qos_ctrl_worker(struct work_struct *work);
+void mfc_qos_set_portion(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_qos_get_portion(struct mfc_core *core, struct mfc_ctx *ctx);
+#else
+
+#define mfc_qos_on(core, ctx)  ({		\
+	(void)core; /* Not used */		\
+	(void)ctx; /* Not used */               \
+	do {} while (0);                        \
+})
+
+#define mfc_qos_off(core, ctx)	({		\
+	(void)core; /* Not used */		\
+	(void)ctx; /* Not used */		\
+	do {} while (0);			\
+})
+
+#define mfc_qos_update(core, on)  ({		\
+	(void)core; /* Not used */              \
+	(void)on; /* Not used */		\
+	do {} while (0);			\
+})
+
+#define mfc_qos_ctrl_worker(work)  ({		\
+	(void)work; /* Not used */		\
+	do {} while (0);			\
+})
+
+#define mfc_qos_set_portion(core, ctx)  ({      \
+	(void)core; /* Not used */              \
+	(void)ctx; /* Not used */               \
+	do {} while (0);			\
+})
+
+#define mfc_qos_get_portion(core, ctx)	({	\
+	(void)core; /* Not used */		\
+	(void)ctx; /* Not used */		\
+	do {} while (0);			\
+})
+#endif
+
+bool mfc_qos_mb_calculate(struct mfc_core *core,
+			  struct mfc_core_ctx *core_ctx,
+			  unsigned int processing_cycle,
+			  unsigned int frame_type);
+
+void mfc_qos_idle_worker(struct work_struct *work);
+bool mfc_qos_idle_trigger(struct mfc_core *core, struct mfc_ctx *ctx);
+void mfc_qos_get_weighted_mb(struct mfc_ctx *ctx, enum mfc_real_time rt);
+
+static inline void mfc_qos_get_disp_ratio(struct mfc_ctx *ctx, int dec_cnt, int disp_cnt)
+{
+	int delta;
+
+	delta = dec_cnt - disp_cnt;
+	ctx->disp_ratio = ((dec_cnt + delta) * 100) / disp_cnt;
+	if (ctx->disp_ratio > 100)
+		mfc_ctx_debug(2, "[QoS] need to more performance dec %d/disp %d, disp_ratio: x%d.%d\n",
+			      dec_cnt, disp_cnt,
+			      ctx->disp_ratio / 100, ctx->disp_ratio % 100);
+}
+#endif /* __MFC_QOS_H */
-- 
2.34.1

