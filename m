Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A8BAB7CF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F36210E4E1;
	Tue, 30 Sep 2025 05:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="IWEODGUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAFC10E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:11 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035643epoutp03209c4237ac21a98a1b2f4b6a991f712c~p80QxY05Y3249232492epoutp03C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035643epoutp03209c4237ac21a98a1b2f4b6a991f712c~p80QxY05Y3249232492epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204603;
 bh=2LJHR8Pp/KaBAKbAXiHh5qJSpNlaDlWuy6Su0DiB9iA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IWEODGUWahxQ4BmyB16jkxjsurPDVOoDvg/c/4mO8K2slu6d0XbRQhUFjcSbbv+dT
 uaodxIhCcr4Irb6qjbIOJhCR+ir0uhkuyOJz3jgNJig7hK/Q8ytTdkAL/ztWcdgjSq
 usT8CEfchQ0akaJlwS1YBOZorTHC+VQFd+n0RnEU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035642epcas5p42488fcfda56807f0716f5e4f09e59adf~p80QD-eu-2408224082epcas5p4I;
 Tue, 30 Sep 2025 03:56:42 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cbPPj5Kksz6B9m9; Tue, 30 Sep
 2025 03:56:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250930035641epcas5p4a5011f149b293c1b5aee60df0447666c~p80OTF8Hr1003510035epcas5p4k;
 Tue, 30 Sep 2025 03:56:41 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035638epsmtip1faa83375b843a9886c76548dab2615ae~p80LtZ3-t2908129081epsmtip1C;
 Tue, 30 Sep 2025 03:56:37 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 19/29] =?UTF-8?q?media:=20mfc:=20Add=20QoS,=20Butler=20wor?=
 =?UTF-8?q?kqueue,=20and=20priority=E2=80=91based=20scheduling?=
Date: Tue, 30 Sep 2025 09:33:38 +0530
Message-Id: <20250930040348.3702923-20-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035641epcas5p4a5011f149b293c1b5aee60df0447666c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035641epcas5p4a5011f149b293c1b5aee60df0447666c
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035641epcas5p4a5011f149b293c1b5aee60df0447666c@epcas5p4.samsung.com>
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

- Integrate QoS handling (core, ops, PM).
- Add Butler workqueue for core tasks (allocation, init, cleanup).
- Implement async QoS control workqueue using atomic counters
  and proper sync.
- Update probe to initialize workqueues, QoS structures,
  and improve logging.
- Modify PM to trigger QoS updates on clock changes and issue
  idle‑clock QoS when bus devfreq is active.
- Refactor scheduler for priority‑aware work handling
  via bit‑mask tracking.
- Extend ops table with extra instance and buffer management.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/mfc_core.c    | 145 +++++++
 .../samsung/exynos-mfc/mfc_core_ops.c         | 370 ++++++++++++++++++
 .../platform/samsung/exynos-mfc/mfc_core_pm.c |  25 ++
 .../samsung/exynos-mfc/mfc_core_sched_prio.c  | 331 ++++++++++++++++
 .../samsung/exynos-mfc/mfc_dec_v4l2.c         |  12 +-
 .../samsung/exynos-mfc/mfc_dec_v4l2.h         |  12 +-
 6 files changed, 881 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
index 4f5cf459c36f..af6fd088fad3 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core.c
@@ -28,6 +28,7 @@
 
 #include "mfc_core_ops.h"
 #include "mfc_core_isr.h"
+#include "mfc_dec_v4l2.h"
 #include "mfc_debugfs.h"
 
 #include "mfc_core_hwlock.h"
@@ -37,7 +38,9 @@
 
 #include "mfc_core_hw_reg_api.h"
 
+#include "base/mfc_qos.h"
 #include "base/mfc_sched.h"
+#include "base/mfc_queue.h"
 #include "base/mfc_buf.h"
 #include "base/mfc_mem.h"
 
@@ -45,6 +48,45 @@
 
 struct _mfc_trace_logging g_mfc_core_trace_logging[MFC_TRACE_LOG_COUNT_MAX];
 
+static void mfc_core_butler_worker(struct work_struct *work)
+{
+	struct mfc_core *core;
+
+	core = container_of(work, struct mfc_core, butler_work);
+
+	mfc_core_try_run(core);
+}
+
+static int __mfc_core_parse_mfc_qos_platdata(struct device_node *np,
+					     char *node_name,
+					     struct mfc_qos *qosdata,
+					     struct mfc_core *core)
+{
+	struct device_node *np_qos;
+
+	np_qos = of_find_node_by_name(NULL, node_name);
+	if (!np_qos) {
+		dev_err(core->device,
+			"%s: could not find mfc_qos_platdata node\n",
+			node_name);
+		return -EINVAL;
+	}
+
+	of_property_read_u32(np_qos, "thrd_mb", &qosdata->threshold_mb);
+	of_property_read_u32(np_qos, "freq_mfc", &qosdata->freq_mfc);
+	of_property_read_u32(np_qos, "freq_int", &qosdata->freq_int);
+	of_property_read_u32(np_qos, "freq_mif", &qosdata->freq_mif);
+	of_property_read_u32(np_qos, "mo_value", &qosdata->mo_value);
+	of_property_read_u32(np_qos, "time_fw", &qosdata->time_fw);
+
+	of_property_read_string(np_qos, "bts_scen", &qosdata->name);
+	if (!qosdata->name) {
+		mfc_pr_err("[QoS] bts_scen is missing in '%s' node", node_name);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 #if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
 static int mfc_core_sysmmu_fault_handler(struct iommu_domain *domain,
 					 struct device *dev, unsigned long iova,
@@ -140,6 +182,9 @@ static int mfc_core_sysmmu_fault_handler(struct iommu_domain *domain,
 static int __mfc_core_parse_dt(struct device_node *np, struct mfc_core *core)
 {
 	struct mfc_core_platdata *pdata = core->core_pdata;
+	struct device_node *np_qos;
+	char node_name[50];
+	int i;
 
 	if (!np) {
 		mfc_pr_err("there is no device node\n");
@@ -164,6 +209,61 @@ static int __mfc_core_parse_dt(struct device_node *np, struct mfc_core *core)
 	of_property_read_u32(np, "masterid_mask", &pdata->masterid_mask);
 	of_property_read_u32(np, "tsmux_masterid", &pdata->tsmux_masterid);
 
+	/* QoS */
+	of_property_read_u32(np, "num_default_qos_steps",
+			     &pdata->num_default_qos_steps);
+	of_property_read_u32(np, "max_mb", &pdata->max_mb);
+	of_property_read_u32(np, "max_hw_mb", &pdata->max_hw_mb);
+	of_property_read_u32(np, "mfc_freq_control", &pdata->mfc_freq_control);
+	of_property_read_u32(np, "mo_control", &pdata->mo_control);
+	of_property_read_u32(np, "bw_control", &pdata->bw_control);
+	of_property_read_u32(np, "pm_qos_id", &pdata->pm_qos_id);
+
+	pdata->default_qos_table = devm_kzalloc(core->device,
+						sizeof(struct mfc_qos) *
+						pdata->num_default_qos_steps,
+						GFP_KERNEL);
+	for (i = 0; i < pdata->num_default_qos_steps; i++) {
+		snprintf(node_name, sizeof(node_name), "mfc_d_qos_variant_%d",
+			 i);
+		__mfc_core_parse_mfc_qos_platdata(np, node_name,
+						  &pdata->default_qos_table[i],
+						  core);
+	}
+
+	/* performance boost mode */
+	pdata->qos_boost_table = devm_kzalloc(core->device,
+					      sizeof(struct mfc_qos_boost),
+					      GFP_KERNEL);
+	np_qos = of_find_node_by_name(np, "mfc_perf_boost_table");
+	if (!np_qos) {
+		dev_err(core->device,
+			"[QoS][BOOST] could not find mfc_perf_boost_table node\n");
+		return -EINVAL;
+	}
+	of_property_read_u32(np_qos, "num_cluster",
+			     &pdata->qos_boost_table->num_cluster);
+	of_property_read_u32_array(np_qos, "num_cpu",
+				   &pdata->qos_boost_table->num_cpu[0],
+				   pdata->qos_boost_table->num_cluster);
+	of_property_read_u32(np_qos, "freq_mfc",
+			     &pdata->qos_boost_table->freq_mfc);
+	of_property_read_u32(np_qos, "freq_int",
+			     &pdata->qos_boost_table->freq_int);
+	of_property_read_u32(np_qos, "freq_mif",
+			     &pdata->qos_boost_table->freq_mif);
+	of_property_read_u32_array(np_qos, "freq_cluster",
+				   &pdata->qos_boost_table->freq_cluster[0],
+				   pdata->qos_boost_table->num_cluster);
+
+	of_property_read_string(np_qos, "bts_scen",
+				&pdata->qos_boost_table->name);
+	if (!pdata->qos_boost_table->name) {
+		mfc_pr_err
+		    ("[QoS][BOOST] bts_scen is missing in qos_boost node");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -274,6 +374,7 @@ static int mfc_core_probe(struct platform_device *pdev)
 	struct mfc_core *core;
 	struct mfc_dev *dev;
 	int ret = -ENOENT;
+	int i;
 
 	dev_info(&pdev->dev, "%s is called\n", __func__);
 
@@ -325,6 +426,44 @@ static int mfc_core_probe(struct platform_device *pdev)
 
 	spin_lock_init(&core->batch_lock);
 
+	/* core butler worker */
+	core->butler_wq = alloc_workqueue("mfc_core/butler", WQ_UNBOUND
+					  | WQ_MEM_RECLAIM | WQ_HIGHPRI, 1);
+	if (!core->butler_wq) {
+		dev_err(&pdev->dev, "failed to create workqueue for butler\n");
+		goto err_butler_wq;
+	}
+	INIT_WORK(&core->butler_work, mfc_core_butler_worker);
+
+	/* core QoS control worker */
+	core->qos_ctrl_wq = alloc_workqueue("mfc_core/qos_ctrl", WQ_UNBOUND
+					    | WQ_MEM_RECLAIM | WQ_HIGHPRI, 1);
+	if (!core->qos_ctrl_wq) {
+		dev_err(&pdev->dev,
+			"failed to create workqueue for QoS control\n");
+		goto err_qos_ctrl_wq;
+	}
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+	INIT_WORK(&core->qos_ctrl_work, mfc_qos_ctrl_worker);
+#endif
+
+	atomic_set(&core->qos_req_cur, 0);
+	mutex_init(&core->qos_mutex);
+	mutex_init(&core->pm_qos_mutex);
+
+	mfc_core_info("[QoS] control: mfc_freq(%d), mo(%d), bw(%d)\n",
+		      core->core_pdata->mfc_freq_control,
+		      core->core_pdata->mo_control,
+		      core->core_pdata->bw_control);
+	mfc_core_info("[QoS]-------------------Default table\n");
+	for (i = 0; i < core->core_pdata->num_default_qos_steps; i++)
+		mfc_core_info
+		    ("[QoS] table[%d] mfc: %d, int: %d, mif: %d, bts_scen: %s(%d)\n",
+		     i, core->core_pdata->default_qos_table[i].freq_mfc,
+		     core->core_pdata->default_qos_table[i].freq_int,
+		     core->core_pdata->default_qos_table[i].freq_mif,
+		     core->core_pdata->default_qos_table[i].name,
+		     core->core_pdata->default_qos_table[i].bts_scen_idx);
 #if IS_ENABLED(CONFIG_SAMSUNG_IOMMU)
 	ret = samsung_iommu_register_fault_handler(core->device,
 						   mfc_core_sysmmu_fault_handler,
@@ -365,6 +504,10 @@ static int mfc_core_probe(struct platform_device *pdev)
 	samsung_iommu_unregister_fault_handler(&pdev->dev);
  err_sysmmu_fault_handler:
 #endif
+	destroy_workqueue(core->qos_ctrl_wq);
+ err_qos_ctrl_wq:
+	destroy_workqueue(core->butler_wq);
+ err_butler_wq:
 	if (core->has_2sysmmu)
 		iounmap(core->sysmmu1_base);
 	iounmap(core->sysmmu0_base);
@@ -388,6 +531,8 @@ static void mfc_core_remove(struct platform_device *pdev)
 #if IS_ENABLED(CONFIG_SAMSUNG_IOMMU)
 	samsung_iommu_unregister_fault_handler(&pdev->dev);
 #endif
+	flush_workqueue(core->butler_wq);
+	destroy_workqueue(core->butler_wq);
 	mfc_core_destroy_listable_wq_core(core);
 
 	mfc_release_common_context(core);
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
index d9200bba1bb5..f8a27548b218 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
@@ -19,8 +19,10 @@
 #include "mfc_core_hw_reg_api.h"
 
 #include "base/mfc_sched.h"
+#include "base/mfc_qos.h"
 #include "base/mfc_buf.h"
 #include "base/mfc_utils.h"
+#include "base/mfc_queue.h"
 #include "base/mfc_mem.h"
 
 static void __mfc_core_init(struct mfc_core *core, struct mfc_ctx *ctx)
@@ -109,6 +111,8 @@ static int __mfc_core_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
 	if (core->num_inst == 0) {
 		mfc_core_run_deinit_hw(core);
 
+		flush_workqueue(core->butler_wq);
+
 		mfc_debug(2, "power off\n");
 		mfc_core_pm_power_off(core);
 
@@ -121,6 +125,40 @@ static int __mfc_core_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
 		}
 	}
 
+	mfc_qos_off(core, ctx);
+
+	return 0;
+}
+
+static int __mfc_force_close_inst(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	enum mfc_inst_state prev_state;
+
+	if (core_ctx->state == MFCINST_FREE)
+		return 0;
+
+	prev_state = core_ctx->state;
+	mfc_change_state(core_ctx, MFCINST_RETURN_INST);
+	mfc_change_op_mode(ctx, MFC_OP_SINGLE);
+	core->sched->set_work(core, core_ctx);
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	if (mfc_core_just_run(core, ctx->num)) {
+		mfc_err("Failed to run MFC\n");
+		mfc_change_state(core_ctx, prev_state);
+		return -EIO;
+	}
+
+	/* Wait until instance is returned or timeout occurred */
+	if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_CLOSE_INSTANCE_RET)) {
+		mfc_err("Waiting for CLOSE_INSTANCE timed out\n");
+		mfc_change_state(core_ctx, prev_state);
+		return -EIO;
+	}
+
+	/* Free resources */
+	mfc_release_instance_context(core_ctx);
+
 	return 0;
 }
 
@@ -153,7 +191,12 @@ static int __mfc_core_instance_init(struct mfc_core *core, struct mfc_ctx *ctx)
 
 	init_waitqueue_head(&core_ctx->cmd_wq);
 	mfc_core_init_listable_wq_ctx(core_ctx);
+	spin_lock_init(&core_ctx->buf_queue_lock);
 	core->sched->clear_work(core, core_ctx);
+	INIT_LIST_HEAD(&core_ctx->qos_list);
+	INIT_LIST_HEAD(&core_ctx->mb_list);
+
+	mfc_create_queue(&core_ctx->src_buf_queue);
 
 	if (core->num_inst == 1) {
 		mfc_debug(2, "it is first instance in to core-%d\n", core->id);
@@ -252,6 +295,14 @@ static int mfc_core_instance_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
 
 	core->sched->clear_work(core, core_ctx);
 
+	/* If a H/W operation is in progress, wait for it complete */
+	if (NEED_TO_WAIT_NAL_ABORT(core_ctx)) {
+		if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_NAL_ABORT_RET)) {
+			mfc_err("Failed to wait nal abort\n");
+			core->sched->yield_work(core, core_ctx);
+		}
+	}
+
 	ret = mfc_core_get_hwlock_ctx(core_ctx);
 	if (ret < 0) {
 		mfc_err("Failed to get hwlock\n");
@@ -265,9 +316,14 @@ static int mfc_core_instance_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
 	if (ret)
 		goto err_release_try;
 
+	mfc_release_codec_buffers(core_ctx);
+	mfc_release_instance_context(core_ctx);
+
 	mfc_core_release_hwlock_ctx(core_ctx);
 	mfc_core_destroy_listable_wq_ctx(core_ctx);
 
+	mfc_delete_queue(&core_ctx->src_buf_queue);
+
 	core->core_ctx[core_ctx->num] = 0;
 	kfree(core_ctx);
 
@@ -275,12 +331,326 @@ static int mfc_core_instance_deinit(struct mfc_core *core, struct mfc_ctx *ctx)
 
 err_release_try:
 	mfc_core_release_hwlock_ctx(core_ctx);
+	core->sched->yield_work(core, core_ctx);
+	return ret;
+}
+
+static int __mfc_core_instance_open_dec(struct mfc_ctx *ctx,
+					struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_core *core = core_ctx->core;
+	int ret = 0;
+
+	/* In case of calling s_fmt twice or more */
+	ret = __mfc_force_close_inst(core, ctx);
+	if (ret) {
+		mfc_err("Failed to close already opening instance\n");
+		mfc_core_release_hwlock_ctx(core_ctx);
+		core->sched->yield_work(core, core_ctx);
+		return -EIO;
+	}
+
+	ret = mfc_alloc_instance_context(core_ctx);
+	if (ret) {
+		mfc_err("Failed to allocate dec instance[%d] buffers\n",
+			ctx->num);
+		mfc_core_release_hwlock_ctx(core_ctx);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int mfc_core_instance_open(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret = 0;
+
+	if (!core_ctx) {
+		mfc_core_err("There is no instance\n");
+		return -EINVAL;
+	}
+
+	ret = mfc_core_get_hwlock_ctx(core_ctx);
+	if (ret < 0) {
+		mfc_err("Failed to get hwlock\n");
+		return ret;
+	}
+
+	if (ctx->type == MFCINST_DECODER) {
+		if (__mfc_core_instance_open_dec(ctx, core_ctx))
+			return -EAGAIN;
+	} else {
+		mfc_err("invalid codec type: %d\n", ctx->type);
+		return -EINVAL;
+	}
+
+	mfc_change_state(core_ctx, MFCINST_INIT);
+	core->sched->set_work(core, core_ctx);
+	ret = mfc_core_just_run(core, ctx->num);
+	if (ret) {
+		mfc_err("Failed to run MFC\n");
+		goto err_open;
+	}
+
+	if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_OPEN_INSTANCE_RET)) {
+		mfc_err("failed to wait OPEN_INSTANCE\n");
+		mfc_change_state(core_ctx, MFCINST_FREE);
+		ret = -EIO;
+		goto err_open;
+	}
+
+	mfc_core_release_hwlock_ctx(core_ctx);
+
+	mfc_debug(2, "Got instance number inst_no: %d\n", core_ctx->inst_no);
+
+	core->sched->enqueue_work(core, core_ctx);
+	if (core->sched->is_work(core))
+		core->sched->queue_work(core);
+
+	return ret;
+
+err_open:
+	mfc_core_release_hwlock_ctx(core_ctx);
+	core->sched->yield_work(core, core_ctx);
+	mfc_release_instance_context(core_ctx);
+
+	return ret;
+}
+
+static void mfc_core_instance_cache_flush(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	if (core->state == MFCCORE_ERROR) {
+		mfc_core_info("[MSR] Couldn't cache flush. It's Error state\n");
+		return;
+	}
+
+	core->curr_core_ctx = ctx->num;
+
+	mfc_core_pm_clock_on(core, 0);
+	mfc_core_run_cache_flush
+		(core,
+		core->last_cmd_has_cache_flush ? MFC_NO_CACHEFLUSH : MFC_CACHEFLUSH,
+		0);
+	mfc_core_pm_clock_off(core, 0);
+}
+
+static int mfc_core_instance_move_to(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	int ret = 0;
+
+	ret = __mfc_core_instance_init(core, ctx);
+	if (ret) {
+		mfc_core_err("Failed to core instance init\n");
+		return ret;
+	}
+
+	if (core->num_inst > 1) {
+		mfc_ctx_debug(2, "to core-%d already working, send cache_flush only\n", core->id);
+		mfc_core_instance_cache_flush(core, ctx);
+	}
+
+	mfc_ctx_info("to core-%d is ready to move\n", core->id);
+
+	return 0;
+}
+
+static int mfc_core_instance_move_from(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int ret = 0;
+	int inst_no;
+
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	core->sched->set_work(core, core_ctx);
+
+	ret = mfc_core_just_run(core, ctx->num);
+	if (ret) {
+		mfc_err("Failed to run MFC\n");
+		return ret;
+	}
+
+	if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_MOVE_INSTANCE_RET)) {
+		mfc_err("time out during move instance\n");
+		core->logging_data->cause |= BIT(MFC_CAUSE_FAIL_MOVE_INST);
+		return -EFAULT;
+	}
+	inst_no = mfc_core_get_inst_no();
+
+	ret = __mfc_core_deinit(core, ctx);
+	if (ret) {
+		mfc_err("Failed to close instance\n");
+		return ret;
+	}
+
+	mfc_info("inst_no.%d will be changed to no.%d\n", core_ctx->inst_no, inst_no);
+	core_ctx->inst_no = inst_no;
+
 	return ret;
 }
 
+static void mfc_core_instance_dpb_flush(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+	int index = 0, i, ret;
+	int prev_state;
+
+	if (core->state == MFCCORE_ERROR || core_ctx->state == MFCINST_ERROR)
+		goto cleanup;
+
+	ret = mfc_core_get_hwlock_ctx(core_ctx);
+	if (ret < 0) {
+		mfc_err("Failed to get hwlock\n");
+		MFC_TRACE_CTX_LT("[ERR][Release] failed to get hwlock (shutdown: %d)\n",
+				 core->shutdown);
+		if (core->shutdown)
+			goto cleanup;
+		return;
+	}
+
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->dst_buf_queue);
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->err_buf_queue);
+
+	mutex_lock(&dec->dpb_mutex);
+	for (i = 0; i < MFC_MAX_DPBS; i++)
+		dec->dpb[i].queued = 0;
+	mutex_unlock(&dec->dpb_mutex);
+
+	dec->queued_dpb = 0;
+	ctx->is_dpb_realloc = 0;
+	dec->last_dpb_max_index = 0;
+
+	if (!dec->inter_res_change) {
+		dec->dpb_table_used = 0;
+		dec->dynamic_used = 0;
+		if (dec->is_dynamic_dpb) {
+			mfc_cleanup_iovmm(ctx);
+			dec->dynamic_set = 0;
+			core_ctx->dynamic_set = 0;
+		} else {
+			dec->dynamic_set = MFC_ALL_AVAILABLE_DPB;
+		}
+	} else {
+		mfc_cleanup_iovmm_except_used(ctx);
+		mfc_print_dpb_table(ctx);
+	}
+
+	while (index < MFC_MAX_BUFFERS) {
+		index = find_next_bit(ctx->dst_ctrls_avail, MFC_MAX_BUFFERS, index);
+		if (index < MFC_MAX_BUFFERS)
+			call_cop(ctx, reset_buf_ctrls, &ctx->dst_ctrls[index]);
+		index++;
+	}
+
+	mutex_lock(&ctx->drc_wait_mutex);
+	if (ctx->wait_state & WAIT_STOP) {
+		ctx->wait_state &= ~(WAIT_STOP);
+		mfc_debug(2, "clear WAIT_STOP %d\n", ctx->wait_state);
+		MFC_TRACE_CORE_CTX("** DEC clear WAIT_STOP(wait_state %d)\n",
+				   ctx->wait_state);
+
+		if (ctx->ready_to_be_multi_view_enable) {
+			ctx->ready_to_be_multi_view_enable = 0;
+			ctx->multi_view_enable = 1;
+			mfc_debug(3, "[MV-HEVC] enabled\n");
+		}
+	}
+	mutex_unlock(&ctx->drc_wait_mutex);
+
+	if (core_ctx->state == MFCINST_FINISHING)
+		mfc_change_state(core_ctx, MFCINST_RUNNING);
+
+	if (NEED_TO_DPB_FLUSH(core_ctx) && !ctx->dec_priv->inter_res_change) {
+		prev_state = core_ctx->state;
+		mfc_change_state(core_ctx, MFCINST_DPB_FLUSHING);
+		core->sched->set_work(core, core_ctx);
+		mfc_clean_core_ctx_int_flags(core_ctx);
+		mfc_info("try to DPB flush\n");
+		ret = mfc_core_just_run(core, ctx->num);
+		if (ret) {
+			mfc_err("Failed to run MFC\n");
+			mfc_core_release_hwlock_ctx(core_ctx);
+			core->sched->yield_work(core, core_ctx);
+			return;
+		}
+
+		if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_DPB_FLUSH_RET)) {
+			mfc_err("time out during DPB flush\n");
+			core->logging_data->cause |= BIT(MFC_CAUSE_FAIL_DPB_FLUSH);
+		}
+
+		mfc_change_state(core_ctx, prev_state);
+	}
+
+	mfc_debug(2, "decoder destination stop sequence done\n");
+
+	core->sched->clear_work(core, core_ctx);
+	mfc_core_release_hwlock_ctx(core_ctx);
+
+	core->sched->enqueue_work(core, core_ctx);
+	if (core->sched->is_work(core))
+		core->sched->queue_work(core);
+
+	return;
+
+cleanup:
+	mfc_core_info("[MSR] Cleanup dst buffers. It's Error state\n");
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->dst_buf_queue);
+	mfc_cleanup_queue(&ctx->buf_queue_lock, &ctx->err_buf_queue);
+}
+
+static int mfc_core_instance_init_buf(struct mfc_core *core, struct mfc_ctx *ctx)
+{
+	struct mfc_core_ctx *core_ctx = core->core_ctx[ctx->num];
+
+	core->sched->set_work(core, core_ctx);
+	mfc_clean_core_ctx_int_flags(core_ctx);
+	if (mfc_core_just_run(core, ctx->num)) {
+		mfc_err("Failed to run MFC\n");
+		return -EIO;
+	}
+
+	if (mfc_wait_for_done_core_ctx(core_ctx, MFC_REG_R2H_CMD_INIT_BUFFERS_RET)) {
+		mfc_err("[RM] init buffer timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int mfc_core_request_work(struct mfc_core *core,
+				 enum mfc_request_work work,
+				 struct mfc_ctx *ctx)
+{
+	switch (work) {
+	case MFC_WORK_BUTLER:
+		mfc_core_debug(3, "request_work: butler\n");
+		if (core->sched->is_work(core))
+			core->sched->queue_work(core);
+		break;
+	case MFC_WORK_TRY:
+		mfc_core_debug(3, "request_work: try_run\n");
+		mfc_core_try_run(core);
+		break;
+	default:
+		mfc_core_err("not supported request work type: %#x\n", work);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct mfc_core_ops mfc_core_ops = {
 	.instance_init = mfc_core_instance_init,
 	.instance_deinit = mfc_core_instance_deinit,
+	.instance_open = mfc_core_instance_open,
+	.instance_cache_flush = mfc_core_instance_cache_flush,
+	.instance_move_to = mfc_core_instance_move_to,
+	.instance_move_from = mfc_core_instance_move_from,
+	.instance_dpb_flush = mfc_core_instance_dpb_flush,
+	.instance_init_buf = mfc_core_instance_init_buf,
+	.request_work = mfc_core_request_work,
 };
 
 const struct mfc_core_ops *mfc_get_core_ops(void)
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c
index def7ac2a2007..a70b2b472c06 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c
@@ -16,6 +16,8 @@
 
 #include "mfc_core_hw_reg_api.h"
 
+#include "base/mfc_qos.h"
+
 void mfc_core_pm_init(struct mfc_core *core)
 {
 	spin_lock_init(&core->pm.clklock);
@@ -78,6 +80,9 @@ int mfc_core_pm_clock_on(struct mfc_core *core, bool qos_update)
 	mfc_core_debug(2, "clk_ref = %d\n", state);
 	MFC_TRACE_LOG_CORE("clk_ref = %d", state);
 
+	if (qos_update && state == 1)
+		mfc_qos_update(core, 1);
+
 	return 0;
 }
 
@@ -113,6 +118,9 @@ void mfc_core_pm_clock_off(struct mfc_core *core, bool qos_update)
 
 	mfc_core_debug(2, "clk_ref = %d\n", state);
 	MFC_TRACE_LOG_CORE("clk_ref = %d", state);
+
+	if (qos_update && state == 0)
+		mfc_qos_update(core, 0);
 }
 
 int mfc_core_pm_power_on(struct mfc_core *core)
@@ -126,6 +134,15 @@ int mfc_core_pm_power_on(struct mfc_core *core)
 		goto err_power_on;
 	}
 
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+	if (core->dev->pdata->idle_clk_ctrl) {
+		mfc_core_debug(2, "request mfc idle clk OFF\n");
+		exynos_pm_qos_add_request(&core->qos_req_mfc_noidle,
+					  core->core_pdata->pm_qos_id,
+					  core->dev->pdata->mfc_freqs[0]);
+	}
+#endif
+
 #if (IS_ENABLED(CONFIG_COMMON_CLK_SAMSUNG))
 	core->pm.clock = clk_get(core->device, "aclk_mfc");
 	if (IS_ERR(core->pm.clock)) {
@@ -167,6 +184,14 @@ int mfc_core_pm_power_off(struct mfc_core *core)
 		clk_unprepare(core->pm.clock);
 		clk_put(core->pm.clock);
 	}
+
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+	if (core->dev->pdata->idle_clk_ctrl) {
+		exynos_pm_qos_remove_request(&core->qos_req_mfc_noidle);
+		mfc_core_debug(2, "request mfc idle clk ON\n");
+	}
+#endif
+
 	mfc_core_mfc_always_off(core);
 
 	ret = pm_runtime_put_sync(core->pm.device);
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c
index a2f69a064d3d..34731229338d 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c
@@ -13,6 +13,7 @@
 #include "mfc_core_sync.h"
 
 #include "base/mfc_sched.h"
+#include "base/mfc_qos.h"
 #include "base/mfc_utils.h"
 
 static inline void __mfc_print_workbits(struct mfc_core *core, int prio, int num)
@@ -36,6 +37,42 @@ static inline void __mfc_clear_all_prio_bits(struct mfc_core *core)
 	spin_unlock_irqrestore(&core->prio_work_lock, flags);
 }
 
+static int __mfc_ctx_ready_set_bit_prio(struct mfc_core_ctx *core_ctx, bool set)
+
+{
+	struct mfc_core *core;
+	struct mfc_ctx *ctx;
+	unsigned long flags;
+	int p, is_ready = 0;
+
+	if (!core_ctx) {
+		mfc_pr_err("no mfc core_ctx device to run\n");
+		return is_ready;
+	}
+
+	core = core_ctx->core;
+	if (!core) {
+		mfc_err("no mfc core device to run\n");
+		return is_ready;
+	}
+
+	ctx = core_ctx->ctx;
+	if (!ctx) {
+		mfc_err("no mfc ctx device to run\n");
+		return is_ready;
+	}
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+
+	p = mfc_get_prio(core, ctx->rt, ctx->prio);
+	is_ready = mfc_ctx_ready_set_bit_raw(core_ctx, &core->prio_work_bits[p], set);
+	__mfc_print_workbits(core, p, core_ctx->num);
+
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+
+	return is_ready;
+}
+
 static void mfc_create_work_prio(struct mfc_core *core)
 {
 	int num_prio = core->dev->pdata->pbs_num_prio;
@@ -61,6 +98,27 @@ static void mfc_clear_all_work_prio(struct mfc_core *core)
 	__mfc_clear_all_prio_bits(core);
 }
 
+static int mfc_is_work_prio(struct mfc_core *core)
+{
+	unsigned long flags;
+	int i, ret = 0;
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+	for (i = 0; i < core->total_num_prio; i++) {
+		if (core->prio_work_bits[i]) {
+			ret = 1;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+	return ret;
+}
+
+static void mfc_queue_work_prio(struct mfc_core *core)
+{
+	queue_work(core->butler_wq, &core->butler_work);
+}
+
 static void mfc_set_work_prio(struct mfc_core *core, struct mfc_core_ctx *core_ctx)
 {
 	struct mfc_ctx *ctx = core_ctx->ctx;
@@ -91,10 +149,283 @@ static void mfc_clear_work_prio(struct mfc_core *core, struct mfc_core_ctx *core
 	spin_unlock_irqrestore(&core->prio_work_lock, flags);
 }
 
+static int mfc_enqueue_work_prio(struct mfc_core *core, struct mfc_core_ctx *core_ctx)
+{
+	return __mfc_ctx_ready_set_bit_prio(core_ctx, true);
+}
+
+static int mfc_dequeue_work_prio(struct mfc_core *core, struct mfc_core_ctx *core_ctx)
+{
+	return __mfc_ctx_ready_set_bit_prio(core_ctx, false);
+}
+
+static void mfc_yield_work_prio(struct mfc_core *core, struct mfc_core_ctx *core_ctx)
+{
+	struct mfc_ctx *ctx = core_ctx->ctx;
+	unsigned long flags;
+	int p;
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+
+	p = mfc_get_prio(core, ctx->rt, ctx->prio);
+	__clear_bit(core_ctx->num, &core->prio_work_bits[p]);
+	__mfc_print_workbits(core, p, core_ctx->num);
+
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+
+	mfc_core_try_run(core);
+}
+
+static unsigned long __mfc_check_lower_prio_inst(struct mfc_core *core, int prio)
+{
+	unsigned long sum = 0;
+	int i;
+
+	for (i = prio + 1; i < core->total_num_prio; i++)
+		sum |= core->prio_work_bits[i];
+
+	return sum;
+}
+
+static void __mfc_update_max_runtime(struct mfc_core *core, unsigned long bits)
+{
+	struct mfc_core_ctx *core_ctx;
+	int max_runtime = 0, runtime;
+	int i, num;
+
+	if (core->dev->debugfs.sched_perf_disable)
+		return;
+
+	for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+		if (test_bit(i, &bits)) {
+			core_ctx = core->core_ctx[i];
+			if (!core_ctx)
+				continue;
+			/* if runtime is 0, use default 30fps (33msec) */
+			runtime = core_ctx->avg_runtime ? core_ctx->avg_runtime :
+				MFC_DEFAULT_RUNTIME;
+			if (runtime > max_runtime) {
+				max_runtime = runtime;
+				num = i;
+			}
+		}
+	}
+
+	if (max_runtime)
+		mfc_core_debug(2, "[PRIO][c:%d] max runtime is %d usec\n", num, max_runtime);
+
+	core->max_runtime = max_runtime;
+}
+
+static int __mfc_core_get_new_ctx_prio(struct mfc_core *core, int prio, int *highest,
+				       bool predict)
+{
+	struct mfc_core_ctx *core_ctx;
+	unsigned long bits = 0;
+	int new_ctx_index;
+	int i, perf = 0, skip_curr;
+
+	new_ctx_index = (core->last_core_ctx[prio] + 1) % MFC_NUM_CONTEXTS;
+
+	for (i = 0; i < MFC_NUM_CONTEXTS; i++) {
+		if (test_bit(new_ctx_index, &core->prio_work_bits[prio])) {
+			if (*highest < 0)
+				*highest = new_ctx_index;
+
+			/* If predict, do not get curr ctx */
+			skip_curr = 0;
+			if (predict && new_ctx_index == core->curr_core_ctx) {
+				mfc_core_debug(2, "[PRIO][PREDICT](%d) skip curr ctx %d\n",
+					       prio, new_ctx_index);
+				skip_curr = 1;
+			}
+
+			/* If the performance is insufficient, run this */
+			core_ctx = core->core_ctx[new_ctx_index];
+			perf = mfc_rate_check_perf_ctx(core_ctx->ctx, core->max_runtime);
+			if (!perf && !skip_curr) {
+				mfc_core_debug(2, "[PRIO]%s(%d) perf insufficient: %d\n",
+					       (predict ? "[PREDICT]" : ""),
+					       prio, new_ctx_index);
+				return new_ctx_index;
+			}
+
+			/* If the perf of all instances is satisfied, run the highest */
+			bits |= BIT(new_ctx_index);
+			if (((core->prio_work_bits[prio] & ~(bits)) == 0) &&
+			    !__mfc_check_lower_prio_inst(core, prio)) {
+				mfc_core_debug(2, "[PRIO]%s(%d) the highest priority %d\n",
+					       (predict ? "[PREDICT]" : ""),
+					       prio, *highest);
+				return *highest;
+			}
+		}
+		/* If there is no ready context in prio, return */
+		if ((core->prio_work_bits[prio] & ~(bits)) == 0)
+			return -1;
+
+		new_ctx_index = (new_ctx_index + 1) % MFC_NUM_CONTEXTS;
+	}
+
+	return -1;
+}
+
+/* This should be called with prio_work_lock */
+static int __mfc_core_get_new_ctx(struct mfc_core *core, bool predict)
+{
+	int new_ctx_index = 0, highest = -1;
+	int i;
+
+	for (i = 0; i < core->total_num_prio; i++) {
+		if (!core->prio_work_bits[i])
+			continue;
+
+		mfc_core_debug(2, "[PRIO]%s(%d) Previous context: %d (bits %08lx)\n",
+			       (predict ? "[PREDICT]" : ""),
+			       i, core->last_core_ctx[i], core->prio_work_bits[i]);
+
+		new_ctx_index = __mfc_core_get_new_ctx_prio(core, i, &highest, predict);
+		if (new_ctx_index >= 0) {
+			mfc_core_debug(2, "[PRIO]%s(%d) get new_ctx %d\n",
+				       (predict ? "[PREDICT]" : ""), i, new_ctx_index);
+			return new_ctx_index;
+		}
+	}
+
+	return -1;
+}
+
+static int mfc_pick_next_work_prio(struct mfc_core *core)
+{
+	unsigned long flags, work_bits, hweight;
+	int new_ctx_index = -1;
+
+	if (!mfc_is_work_prio(core)) {
+		mfc_core_debug(2, "[PRIO] No ctx to run\n");
+		return -EAGAIN;
+	}
+
+	if (core->preempt_core_ctx > MFC_NO_INSTANCE_SET) {
+		new_ctx_index = core->preempt_core_ctx;
+		mfc_core_debug(2, "[PRIO] preempt_core_ctx %d\n", new_ctx_index);
+		return new_ctx_index;
+	}
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+
+	work_bits = __mfc_check_lower_prio_inst(core, -1);
+	mfc_core_debug(2, "[PRIO] all work_bits %#lx\n", work_bits);
+
+	/* if single instance is ready, run it */
+	hweight = hweight64(work_bits);
+	if (hweight == 1) {
+		new_ctx_index = __ffs(work_bits);
+		mfc_core_debug(2, "[PRIO] new_ctx_idx %d (single)\n", new_ctx_index);
+		spin_unlock_irqrestore(&core->prio_work_lock, flags);
+		return new_ctx_index;
+	}
+
+	__mfc_update_max_runtime(core, work_bits);
+
+	/* if there is predicted next ctx, run it */
+	if (core->next_ctx_idx >= 0 && test_bit(core->next_ctx_idx, &work_bits)) {
+		new_ctx_index = core->next_ctx_idx;
+		mfc_core_debug(2, "[PRIO] new_ctx_idx %d (predict)\n", new_ctx_index);
+		spin_unlock_irqrestore(&core->prio_work_lock, flags);
+		return new_ctx_index;
+	}
+
+	new_ctx_index = __mfc_core_get_new_ctx(core, 0);
+	mfc_core_debug(2, "[PRIO] new_ctx_idx %d\n", new_ctx_index);
+
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+
+	return new_ctx_index;
+}
+
+static int mfc_get_next_work_prio(struct mfc_core *core)
+{
+	unsigned long flags, work_bits, hweight;
+	int new_ctx_index;
+
+	if (core->dev->num_inst)
+		return -1;
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+
+	work_bits = __mfc_check_lower_prio_inst(core, -1);
+	hweight = hweight64(work_bits);
+	/* Nothing to predict because only one instance is ready */
+	if (hweight <= 1) {
+		spin_unlock_irqrestore(&core->prio_work_lock, flags);
+		return -1;
+	}
+
+	new_ctx_index = __mfc_core_get_new_ctx(core, 1);
+	core->next_ctx_idx = new_ctx_index;
+	mfc_core_debug(2, "[PRIO][PREDICT] new_ctx_idx %d\n", new_ctx_index);
+
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+
+	return new_ctx_index;
+}
+
+static int mfc_change_prio_work_prio(struct mfc_core *core, struct mfc_ctx *ctx,
+				     int cur_rt, int cur_prio, int new_rt, int new_prio)
+{
+	unsigned long flags;
+	int cur_p, new_p;
+
+	spin_lock_irqsave(&core->prio_work_lock, flags);
+
+	if (new_prio > core->num_prio)
+		new_prio = core->num_prio;
+
+	/* Check current priority's work_bit */
+	cur_p = mfc_get_prio(core, cur_rt, cur_prio);
+	new_p = mfc_get_prio(core, new_rt, new_prio);
+	if (cur_p == new_p) {
+		ctx->prio = new_prio;
+		ctx->rt = new_rt;
+		spin_unlock_irqrestore(&core->prio_work_lock, flags);
+		return 0;
+	}
+
+	mfc_core_debug(2, "[PRIO] cur_p %d -> new_p %d is changed (%d %d -> %d %d)\n",
+		       cur_p, new_p, cur_rt, cur_prio, new_rt, new_prio);
+
+	if (test_bit(ctx->num, &core->prio_work_bits[cur_p])) {
+		__clear_bit(ctx->num, &core->prio_work_bits[cur_p]);
+		mfc_core_debug(2, "[PRIO][c:%d] prio change from %d (bits %08lx)\n",
+			       ctx->num, cur_p, core->prio_work_bits[cur_p]);
+
+		/* Update current priority's work_bit */
+		__set_bit(ctx->num, &core->prio_work_bits[new_p]);
+		mfc_core_debug(2, "[PRIO][c:%d] prio change to %d (bits %08lx)\n",
+			       ctx->num, new_p, core->prio_work_bits[new_p]);
+	}
+
+	/* These must be updated within the spin_lock for synchronization. */
+	ctx->prio = new_prio;
+	ctx->rt = new_rt;
+
+	spin_unlock_irqrestore(&core->prio_work_lock, flags);
+
+	return 0;
+}
+
 struct mfc_sched_class mfc_sched_prio = {
 	.create_work		= mfc_create_work_prio,
 	.init_work		= mfc_init_work_prio,
 	.clear_all_work		= mfc_clear_all_work_prio,
+	.queue_work		= mfc_queue_work_prio,
+	.is_work		= mfc_is_work_prio,
+	.pick_next_work		= mfc_pick_next_work_prio,
+	.get_next_work		= mfc_get_next_work_prio,
 	.set_work		= mfc_set_work_prio,
 	.clear_work		= mfc_clear_work_prio,
+	.enqueue_work		= mfc_enqueue_work_prio,
+	.dequeue_work		= mfc_dequeue_work_prio,
+	.yield_work		= mfc_yield_work_prio,
+	.change_prio_work	= mfc_change_prio_work_prio,
 };
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c
index dd59dc352e34..8eb68294c0b1 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c
@@ -1,14 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * mfc_dec_v4l2.c
- *
- * Copyright (c) 2016 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
+ * mfc_dec_v4l2.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
  */
 
 #include <linux/vmalloc.h>
diff --git a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h
index 04652a71cd23..08fe4ed5cf3f 100644
--- a/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h
+++ b/drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h
@@ -1,14 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later
  *
- * mfc_dec_v4l2.h
- *
- * Copyright (c) 2016 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
+ * mfc_dec_v4l2.h file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
  */
 
 #ifndef __MFC_DEC_V4L2_H
-- 
2.34.1

