Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13B984036
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394C610E66A;
	Tue, 24 Sep 2024 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrNF5i+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3575010E663
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165915; x=1758701915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JTiODi+2FnGZwTvQxMnR57BX6vsOqjJZ8o+2LUWNv/k=;
 b=TrNF5i+tLDPlqVVPWmnwNBT5XHqD1q4Bg+J3S/uqriHkbIimUoc2/RdE
 xbOHKzCx2j3vb7ap6pIq2MI0TyY6yDB1zrBo9jmPtTo3sIVhZT2cGtnqX
 x6dZG44lNahVwZGldEcVQXsPJHkCACNmpakKF/951QMm7Hg1TCfpzM+i8
 rEkuttou/pQI3JqwsPPAVdqK6MmSGAq8DupEv7QXDu3WHaTvQt7e6eaBX
 y2NJBga3cVzMbjm0M5WjVyLQAIITpNvYIlGKYOZW2OXT6diRoqsefAhdm
 WpaeHNsB3TyCCA7Hga09iUgTq/6Lm38T621t0wai9aYXEg5Ng+rS01mol Q==;
X-CSE-ConnectionGUID: ieI8RmPtRmenP+g2uB0KXw==
X-CSE-MsgGUID: E43pkYTQRS2fErUatTa8fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506961"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:35 -0700
X-CSE-ConnectionGUID: QSBCvIxdR/afJn55Q7buhg==
X-CSE-MsgGUID: gMFu8CXtRw+Gl+4WFT+7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170709"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:33 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 14/29] accel/ivpu: Add auto selection logic for job scheduler
Date: Tue, 24 Sep 2024 10:17:39 +0200
Message-ID: <20240924081754.209728-15-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add ivpu_fw_sched_mode_select() function that can select scheduling mode
based on HW and FW versions. This prepares for a switch to HWS on
selected platforms.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     |  6 +++---
 drivers/accel/ivpu/ivpu_drv.h     |  2 ++
 drivers/accel/ivpu/ivpu_fw.c      | 17 ++++++++++++++---
 drivers/accel/ivpu/ivpu_fw.h      |  5 ++++-
 drivers/accel/ivpu/ivpu_hw.h      |  1 -
 drivers/accel/ivpu/ivpu_hw_btrs.c |  2 --
 drivers/accel/ivpu/ivpu_job.c     | 14 +++++++-------
 drivers/accel/ivpu/ivpu_sysfs.c   | 14 ++++++++++++++
 8 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 9fd371af5814c..fcf26e6d4e9c2 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -54,9 +54,9 @@ u8 ivpu_pll_max_ratio = U8_MAX;
 module_param_named(pll_max_ratio, ivpu_pll_max_ratio, byte, 0644);
 MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
 
-int ivpu_sched_mode;
+int ivpu_sched_mode = IVPU_SCHED_MODE_AUTO;
 module_param_named(sched_mode, ivpu_sched_mode, int, 0444);
-MODULE_PARM_DESC(sched_mode, "Scheduler mode: 0 - Default scheduler, 1 - Force HW scheduler");
+MODULE_PARM_DESC(sched_mode, "Scheduler mode: -1 - Use default scheduler, 0 - Use OS scheduler, 1 - Use HW scheduler");
 
 bool ivpu_disable_mmu_cont_pages;
 module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0444);
@@ -347,7 +347,7 @@ static int ivpu_hw_sched_init(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
-	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW) {
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
 		ret = ivpu_jsm_hws_setup_priority_bands(vdev);
 		if (ret) {
 			ivpu_err(vdev, "Failed to enable hw scheduler: %d", ret);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 471478281021d..c4bd8757f8ded 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -56,6 +56,8 @@
 #define IVPU_PLATFORM_FPGA    3
 #define IVPU_PLATFORM_INVALID 8
 
+#define IVPU_SCHED_MODE_AUTO -1
+
 #define IVPU_DBG_REG	 BIT(0)
 #define IVPU_DBG_IRQ	 BIT(1)
 #define IVPU_DBG_MMU	 BIT(2)
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 95ea9ff7eb256..4513000a06601 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -134,6 +134,15 @@ static bool is_within_range(u64 addr, size_t size, u64 range_start, size_t range
 	return true;
 }
 
+static u32
+ivpu_fw_sched_mode_select(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr)
+{
+	if (ivpu_sched_mode != IVPU_SCHED_MODE_AUTO)
+		return ivpu_sched_mode;
+
+	return VPU_SCHEDULING_MODE_OS;
+}
+
 static int ivpu_fw_parse(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
@@ -190,7 +199,7 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
 		 fw_hdr->header_version, fw_hdr->image_format);
 
-	ivpu_info(vdev, "Firmware: %s, version: %s", fw->name,
+	ivpu_info(vdev, "Firmware: %s, version: %s\n", fw->name,
 		  (const char *)fw_hdr + VPU_FW_HEADER_SIZE);
 
 	if (IVPU_FW_CHECK_API_COMPAT(vdev, fw_hdr, BOOT, 3))
@@ -213,8 +222,10 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 
 	fw->dvfs_mode = 0;
 
+	fw->sched_mode = ivpu_fw_sched_mode_select(vdev, fw_hdr);
 	fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
 	fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
+	ivpu_info(vdev, "Scheduler mode: %s\n", fw->sched_mode ? "HW" : "OS");
 
 	if (fw_hdr->ro_section_start_address && !is_within_range(fw_hdr->ro_section_start_address,
 								 fw_hdr->ro_section_size,
@@ -603,8 +614,8 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->punit_telemetry_sram_base = ivpu_hw_telemetry_offset_get(vdev);
 	boot_params->punit_telemetry_sram_size = ivpu_hw_telemetry_size_get(vdev);
 	boot_params->vpu_telemetry_enable = ivpu_hw_telemetry_enable_get(vdev);
-	boot_params->vpu_scheduling_mode = vdev->hw->sched_mode;
-	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW)
+	boot_params->vpu_scheduling_mode = vdev->fw->sched_mode;
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
 		boot_params->vpu_focus_present_timer_ms = IVPU_FOCUS_PRESENT_TIMER_MS;
 	boot_params->dvfs_mode = vdev->fw->dvfs_mode;
 	if (!IVPU_WA(disable_d0i3_msg))
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 5941150d4aa50..ead600c333cf4 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -1,11 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_FW_H__
 #define __IVPU_FW_H__
 
+#include "vpu_jsm_api.h"
+
 #define FW_VERSION_HEADER_SIZE	SZ_4K
 
 struct ivpu_device;
@@ -34,6 +36,7 @@ struct ivpu_fw_info {
 	u32 secondary_preempt_buf_size;
 	u64 read_only_addr;
 	u32 read_only_size;
+	u32 sched_mode;
 };
 
 int ivpu_fw_init(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index 1c0c98e3afb88..dc5518248c405 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -46,7 +46,6 @@ struct ivpu_hw_info {
 		u32 profiling_freq;
 	} pll;
 	u32 tile_fuse;
-	u32 sched_mode;
 	u32 sku;
 	u16 config;
 	int dma_bits;
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index cad2ce7f2e244..7dc8e333dcec2 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -163,7 +163,6 @@ static int info_init_mtl(struct ivpu_device *vdev)
 	hw->tile_fuse = BTRS_MTL_TILE_FUSE_ENABLE_BOTH;
 	hw->sku = BTRS_MTL_TILE_SKU_BOTH;
 	hw->config = BTRS_MTL_WP_CONFIG_2_TILE_4_3_RATIO;
-	hw->sched_mode = ivpu_sched_mode;
 
 	return 0;
 }
@@ -178,7 +177,6 @@ static int info_init_lnl(struct ivpu_device *vdev)
 	if (ret)
 		return ret;
 
-	hw->sched_mode = ivpu_sched_mode;
 	hw->tile_fuse = tile_fuse_config;
 	hw->pll.profiling_freq = PLL_PROFILING_FREQ_DEFAULT;
 
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index b00634af8bc34..b1abdca5891cd 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -37,7 +37,7 @@ static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 	u64 secondary_size = ALIGN(vdev->fw->secondary_preempt_buf_size, PAGE_SIZE);
 	struct ivpu_addr_range range;
 
-	if (vdev->hw->sched_mode != VPU_SCHEDULING_MODE_HW)
+	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
 		return 0;
 
 	range.start = vdev->hw->ranges.user.end - (primary_size * IVPU_NUM_CMDQS_PER_CTX);
@@ -68,7 +68,7 @@ static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
 					 struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq)
 {
-	if (vdev->hw->sched_mode != VPU_SCHEDULING_MODE_HW)
+	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
 		return;
 
 	drm_WARN_ON(&vdev->drm, !cmdq->primary_preempt_buf);
@@ -149,7 +149,7 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
 	struct ivpu_device *vdev = file_priv->vdev;
 	int ret;
 
-	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW)
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
 		ret = ivpu_jsm_hws_register_db(vdev, file_priv->ctx.id, cmdq->db_id, cmdq->db_id,
 					       cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
 	else
@@ -184,7 +184,7 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
 	jobq_header->tail = 0;
 	wmb(); /* Flush WC buffer for jobq->header */
 
-	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW) {
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
 		ret = ivpu_hws_cmdq_init(file_priv, cmdq, engine, priority);
 		if (ret)
 			return ret;
@@ -211,7 +211,7 @@ static int ivpu_cmdq_fini(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cm
 
 	cmdq->db_registered = false;
 
-	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW) {
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
 		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->db_id);
 		if (!ret)
 			ivpu_dbg(vdev, JOB, "Command queue %d destroyed\n", cmdq->db_id);
@@ -335,7 +335,7 @@ void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
 
 	ivpu_cmdq_fini_all(file_priv);
 
-	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_OS)
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_OS)
 		ivpu_jsm_context_release(vdev, file_priv->ctx.id);
 }
 
@@ -361,7 +361,7 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 	if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_SUBMISSION))
 		entry->flags = VPU_JOB_FLAGS_NULL_SUBMISSION_MASK;
 
-	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_HW &&
+	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW &&
 	    (unlikely(!(ivpu_test_mode & IVPU_TEST_MODE_PREEMPTION_DISABLE)))) {
 		entry->primary_preempt_buf_addr = cmdq->primary_preempt_buf->vpu_addr;
 		entry->primary_preempt_buf_size = ivpu_bo_size(cmdq->primary_preempt_buf);
diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
index 913669f1786e8..fe87c445f9197 100644
--- a/drivers/accel/ivpu/ivpu_sysfs.c
+++ b/drivers/accel/ivpu/ivpu_sysfs.c
@@ -6,6 +6,8 @@
 #include <linux/device.h>
 #include <linux/err.h>
 
+#include "ivpu_drv.h"
+#include "ivpu_fw.h"
 #include "ivpu_hw.h"
 #include "ivpu_sysfs.h"
 
@@ -39,8 +41,20 @@ npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *b
 
 static DEVICE_ATTR_RO(npu_busy_time_us);
 
+static ssize_t
+sched_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ivpu_device *vdev = to_ivpu_device(drm);
+
+	return sysfs_emit(buf, "%s\n", vdev->fw->sched_mode ? "HW" : "OS");
+}
+
+static DEVICE_ATTR_RO(sched_mode);
+
 static struct attribute *ivpu_dev_attrs[] = {
 	&dev_attr_npu_busy_time_us.attr,
+	&dev_attr_sched_mode.attr,
 	NULL,
 };
 
-- 
2.45.1

