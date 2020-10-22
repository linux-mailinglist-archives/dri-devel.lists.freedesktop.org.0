Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06929578B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 07:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14A6F3A3;
	Thu, 22 Oct 2020 05:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A8A6F3A6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 05:03:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603343000; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=FZDazsIO9rVQ4xSTWOy5Dx72zcbwIyQpYhLg5xzcAN0=;
 b=uqD1x17zVCkGI+tV4W8AuRS26unL6HbWOMUh7uPg89gJpcPcMnTDNKZ+HLHp5piEPc1IZwsL
 yCrVvwNzGJ2W2DjLqJBLgm68YLSskBEDjHqohPNI5h5T6as1WUfMpXM+nrUyhTkRMvmOThS/
 Aq3ewdc2Vm7ZOhuAhTGSjYtt0vE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f91124d0764f13b0073506a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 05:02:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CFDE7C433FF; Thu, 22 Oct 2020 05:02:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 885CAC433CB;
 Thu, 22 Oct 2020 05:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 885CAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] disp/msm/dpu: add support to dump dpu registers
Date: Wed, 21 Oct 2020 22:01:46 -0700
Message-Id: <20201022050148.27105-3-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201022050148.27105-1-abhinavk@codeaurora.org>
References: <20201022050148.27105-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dpu_dbg module which adds supports to dump dpu registers
which can be used in case of error conditions.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/Makefile                  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c       | 316 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h       | 273 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c  | 313 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 +-
 drivers/gpu/drm/msm/msm_drv.c                 |   6 +-
 6 files changed, 912 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 340682cd0f32..96bd1398edac 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -54,6 +54,8 @@ msm-y := \
 	disp/dpu1/dpu_core_irq.o \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
+	disp/dpu1/dpu_dbg.o \
+	disp/dpu1/dpu_dbg_util.o \
 	disp/dpu1/dpu_encoder.o \
 	disp/dpu1/dpu_encoder_phys_cmd.o \
 	disp/dpu1/dpu_encoder_phys_vid.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
new file mode 100644
index 000000000000..6703e1555194
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2009-2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
+
+#include "dpu_dbg.h"
+#include "dpu_hw_catalog.h"
+
+/* global dpu debug base structure */
+static struct dpu_dbg_base dpu_dbg;
+
+
+#ifdef CONFIG_DEV_COREDUMP
+static ssize_t dpu_devcoredump_read(char *buffer, loff_t offset,
+		size_t count, void *data, size_t datalen)
+{
+	struct drm_print_iterator iter;
+	struct drm_printer p;
+
+	iter.data = buffer;
+	iter.offset = 0;
+	iter.start = offset;
+	iter.remain = count;
+
+	p = drm_coredump_printer(&iter);
+
+	drm_printf(&p, "---\n");
+
+	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+	drm_printf(&p, "dpu devcoredump\n");
+	drm_printf(&p, "timestamp %lld\n", ktime_to_ns(dpu_dbg.timestamp));
+
+	dpu_dbg.dpu_dbg_printer = &p;
+	dpu_dbg.enable_reg_dump = DPU_DBG_DUMP_IN_COREDUMP;
+
+	drm_printf(&p, "===================dpu regs================\n");
+
+	_dpu_dump_array(&dpu_dbg, dpu_dbg.req_dump_blks,
+		ARRAY_SIZE(dpu_dbg.req_dump_blks),
+		dpu_dbg.work_panic, "evtlog_workitem",
+		dpu_dbg.dump_all);
+
+	drm_printf(&p, "===================dpu drm state================\n");
+
+	if (dpu_dbg.atomic_state)
+		drm_atomic_print_state(dpu_dbg.atomic_state,
+				&p);
+
+	return count - iter.remain;
+}
+
+static void dpu_devcoredump_free(void *data)
+{
+	if (dpu_dbg.atomic_state) {
+		drm_atomic_state_put(dpu_dbg.atomic_state);
+		dpu_dbg.atomic_state = NULL;
+	}
+	dpu_dbg.coredump_pending = false;
+}
+
+static void dpu_devcoredump_capture_state(void)
+{
+	struct drm_device *ddev;
+	struct drm_modeset_acquire_ctx ctx;
+
+	dpu_dbg.timestamp = ktime_get();
+
+	ddev = dpu_dbg.drm_dev;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
+		drm_modeset_backoff(&ctx);
+
+	dpu_dbg.atomic_state = drm_atomic_helper_duplicate_state(ddev,
+			&ctx);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+#else
+static void dpu_devcoredump_capture_state(void)
+{
+}
+#endif /* CONFIG_DEV_COREDUMP */
+
+/**
+ * _dpu_dump_work - deferred dump work function
+ * @work: work structure
+ */
+static void _dpu_dump_work(struct kthread_work *work)
+{
+	/* reset the enable_reg_dump to default before every dump */
+	dpu_dbg.enable_reg_dump = DEFAULT_REGDUMP;
+
+	_dpu_dump_array(&dpu_dbg, dpu_dbg.req_dump_blks,
+		ARRAY_SIZE(dpu_dbg.req_dump_blks),
+		dpu_dbg.work_panic, "evtlog_workitem",
+		dpu_dbg.dump_all);
+
+	dpu_devcoredump_capture_state();
+
+#ifdef CONFIG_DEV_COREDUMP
+	if (dpu_dbg.enable_reg_dump & DPU_DBG_DUMP_IN_MEM) {
+		dev_coredumpm(dpu_dbg.dev, THIS_MODULE, &dpu_dbg, 0, GFP_KERNEL,
+				dpu_devcoredump_read, dpu_devcoredump_free);
+		dpu_dbg.coredump_pending = true;
+	}
+#endif
+}
+
+void dpu_dbg_dump(enum dpu_dbg_dump_context dump_mode, const char *name, ...)
+{
+	int i, index = 0;
+	bool do_panic = false;
+	bool dump_all = false;
+	va_list args;
+	char *blk_name = NULL;
+	struct dpu_dbg_reg_base *blk_base = NULL;
+	struct dpu_dbg_reg_base **blk_arr;
+	u32 blk_len;
+
+	/*
+	 * if there is a coredump pending return immediately till dump
+	 * if read by userspace or timeout happens
+	 */
+	if (((dpu_dbg.enable_reg_dump == DPU_DBG_DUMP_IN_MEM) ||
+		 (dpu_dbg.enable_reg_dump == DPU_DBG_DUMP_IN_COREDUMP)) &&
+		dpu_dbg.coredump_pending) {
+		pr_debug("coredump is pending read\n");
+		return;
+	}
+
+	blk_arr = &dpu_dbg.req_dump_blks[0];
+	blk_len = ARRAY_SIZE(dpu_dbg.req_dump_blks);
+
+	memset(dpu_dbg.req_dump_blks, 0,
+			sizeof(dpu_dbg.req_dump_blks));
+	dpu_dbg.dump_all = false;
+	dpu_dbg.dump_mode = dump_mode;
+
+	va_start(args, name);
+	i = 0;
+	while ((blk_name = va_arg(args, char*))) {
+
+		if (IS_ERR_OR_NULL(blk_name))
+			break;
+
+		blk_base = _dpu_dump_get_blk_addr(&dpu_dbg, blk_name);
+		if (blk_base) {
+			if (index < blk_len) {
+				blk_arr[index] = blk_base;
+				index++;
+			} else {
+				pr_err("insufficient space to dump %s\n",
+						blk_name);
+			}
+		}
+
+		if (!strcmp(blk_name, "all"))
+			dump_all = true;
+
+		if (!strcmp(blk_name, "panic"))
+			do_panic = true;
+
+	}
+	va_end(args);
+
+	dpu_dbg.work_panic = do_panic;
+	dpu_dbg.dump_all = dump_all;
+
+	kthread_queue_work(dpu_dbg.dump_worker,
+			&dpu_dbg.dump_work);
+
+}
+
+int dpu_dbg_init(struct device *dev)
+{
+	if (!dev) {
+		pr_err("invalid params\n");
+		return -EINVAL;
+	}
+
+	mutex_init(&dpu_dbg.mutex);
+	INIT_LIST_HEAD(&dpu_dbg.reg_base_list);
+	dpu_dbg.dev = dev;
+
+	dpu_dbg.work_panic = false;
+	dpu_dbg.enable_reg_dump = DEFAULT_REGDUMP;
+
+	dpu_dbg.dump_worker = kthread_create_worker(0, "%s", "dpu_dbg");
+	if (IS_ERR(dpu_dbg.dump_worker))
+		dev_err(dev, "failed to create dpu dbg task\n");
+
+	kthread_init_work(&dpu_dbg.dump_work, _dpu_dump_work);
+
+	pr_info("dump:%d\n", dpu_dbg.enable_reg_dump);
+
+	return 0;
+}
+
+void dpu_dbg_register_drm_dev(struct drm_device *ddev)
+{
+	dpu_dbg.drm_dev = ddev;
+}
+
+static void dpu_dbg_reg_base_destroy(void)
+{
+	struct dpu_dbg_reg_range *range_node, *range_tmp;
+	struct dpu_dbg_reg_base *blk_base, *blk_tmp;
+	struct dpu_dbg_base *dbg_base = &dpu_dbg;
+
+	/* if the dbg init failed or was never called */
+	if (!dbg_base || !dpu_dbg.dev)
+		return;
+
+	list_for_each_entry_safe(blk_base, blk_tmp, &dbg_base->reg_base_list,
+							reg_base_head) {
+		list_for_each_entry_safe(range_node, range_tmp,
+				&blk_base->sub_range_list, head) {
+			list_del(&range_node->head);
+			kfree(range_node);
+		}
+		list_del(&blk_base->reg_base_head);
+		kfree(blk_base);
+	}
+}
+
+/**
+ * dpu_dbg_destroy - destroy dpu debug facilities
+ */
+void dpu_dbg_destroy(void)
+{
+	if (dpu_dbg.dump_worker)
+		kthread_destroy_worker(dpu_dbg.dump_worker);
+	dpu_dbg_reg_base_destroy();
+	mutex_destroy(&dpu_dbg.mutex);
+}
+
+int dpu_dbg_reg_register_base(const char *name, void __iomem *base,
+		size_t max_offset)
+{
+	struct dpu_dbg_base *dbg_base = &dpu_dbg;
+	struct dpu_dbg_reg_base *reg_base;
+
+	if (!name || !strlen(name)) {
+		pr_err("no debug name provided\n");
+		return -EINVAL;
+	}
+
+	reg_base = kzalloc(sizeof(*reg_base), GFP_KERNEL);
+	if (!reg_base)
+		return -ENOMEM;
+
+	strlcpy(reg_base->name, name, sizeof(reg_base->name));
+	reg_base->base = base;
+	reg_base->max_offset = max_offset;
+	reg_base->off = 0;
+	reg_base->cnt = DEFAULT_BASE_REG_CNT;
+	reg_base->reg_dump = NULL;
+
+	/* Initialize list to make sure check for null list will be valid */
+	INIT_LIST_HEAD(&reg_base->sub_range_list);
+
+	pr_debug("%s base: %pK max_offset 0x%zX\n", reg_base->name,
+			reg_base->base, reg_base->max_offset);
+
+	list_add(&reg_base->reg_base_head, &dbg_base->reg_base_list);
+
+	return 0;
+}
+
+void dpu_dbg_reg_register_dump_range(const char *base_name,
+		const char *range_name, u32 offset_start, u32 offset_end,
+		uint32_t xin_id)
+{
+	struct dpu_dbg_reg_base *reg_base;
+	struct dpu_dbg_reg_range *range;
+
+	reg_base = _dpu_dump_get_blk_addr(&dpu_dbg, base_name);
+	if (!reg_base) {
+		pr_err("error: for range %s unable to locate base %s\n",
+				range_name, base_name);
+		return;
+	}
+
+	if (!range_name || strlen(range_name) == 0) {
+		pr_err("%pS: bad range name, base_name %s, offset_start 0x%X, end 0x%X\n",
+				__builtin_return_address(0), base_name,
+				offset_start, offset_end);
+		return;
+	}
+
+	if (offset_end - offset_start < REG_DUMP_ALIGN ||
+			offset_start > offset_end) {
+		pr_err("%pS: bad range, base_name %s, range_name %s, offset_start 0x%X, end 0x%X\n",
+				__builtin_return_address(0), base_name,
+				range_name, offset_start, offset_end);
+		return;
+	}
+
+	range = kzalloc(sizeof(*range), GFP_KERNEL);
+	if (!range)
+		return;
+
+	strlcpy(range->range_name, range_name, sizeof(range->range_name));
+	range->offset.start = offset_start;
+	range->offset.end = offset_end;
+	range->xin_id = xin_id;
+	list_add_tail(&range->head, &reg_base->sub_range_list);
+
+	pr_debug("base %s, range %s, start 0x%X, end 0x%X\n",
+			base_name, range->range_name,
+			range->offset.start, range->offset.end);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
new file mode 100644
index 000000000000..2cea13288cef
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
@@ -0,0 +1,273 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef DPU_DBG_H_
+#define DPU_DBG_H_
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_device.h>
+#include "../../../drm_crtc_internal.h"
+#include <drm/drm_print.h>
+#include <drm/drm_atomic.h>
+#include <linux/debugfs.h>
+#include <linux/list.h>
+#include <linux/delay.h>
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+#include <linux/debugfs.h>
+#include <linux/uaccess.h>
+#include <linux/dma-buf.h>
+#include <linux/slab.h>
+#include <linux/list_sort.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/kthread.h>
+#include <linux/devcoredump.h>
+#include <stdarg.h>
+
+#define DPU_DBG_DUMP_DATA_LIMITER (NULL)
+
+enum dpu_dbg_dump_flag {
+	DPU_DBG_DUMP_IN_LOG = BIT(0),
+	DPU_DBG_DUMP_IN_MEM = BIT(1),
+	DPU_DBG_DUMP_IN_COREDUMP = BIT(2),
+};
+
+enum dpu_dbg_dump_context {
+	DPU_DBG_DUMP_PROC_CTX,
+	DPU_DBG_DUMP_CLK_ENABLED_CTX,
+};
+
+#define DPU_DBG_BASE_MAX		10
+
+#define DEFAULT_PANIC		0
+#define DEFAULT_REGDUMP		DPU_DBG_DUMP_IN_MEM
+#define DEFAULT_BASE_REG_CNT	DEFAULT_MDSS_HW_BLOCK_SIZE
+#define ROW_BYTES		16
+#define RANGE_NAME_LEN		40
+#define REG_BASE_NAME_LEN	80
+
+/* print debug ranges in groups of 4 u32s */
+#define REG_DUMP_ALIGN		16
+
+/**
+ * struct dpu_dbg_reg_offset - tracking for start and end of region
+ * @start: start offset
+ * @start: end offset
+ */
+struct dpu_dbg_reg_offset {
+	u32 start;
+	u32 end;
+};
+
+/**
+ * struct dpu_dbg_reg_range - register dumping named sub-range
+ * @head: head of this node
+ * @reg_dump: address for the mem dump
+ * @range_name: name of this range
+ * @offset: offsets for range to dump
+ * @xin_id: client xin id
+ */
+struct dpu_dbg_reg_range {
+	struct list_head head;
+	u32 *reg_dump;
+	char range_name[RANGE_NAME_LEN];
+	struct dpu_dbg_reg_offset offset;
+	uint32_t xin_id;
+};
+
+/**
+ * struct dpu_dbg_reg_base - register region base.
+ *	may sub-ranges: sub-ranges are used for dumping
+ *	or may not have sub-ranges: dumping is base -> max_offset
+ * @reg_base_head: head of this node
+ * @sub_range_list: head to the list with dump ranges
+ * @name: register base name
+ * @base: base pointer
+ * @off: cached offset of region for manual register dumping
+ * @cnt: cached range of region for manual register dumping
+ * @max_offset: length of region
+ * @buf: buffer used for manual register dumping
+ * @buf_len:  buffer length used for manual register dumping
+ * @reg_dump: address for the mem dump if no ranges used
+ * @cb: callback for external dump function, null if not defined
+ * @cb_ptr: private pointer to callback function
+ */
+struct dpu_dbg_reg_base {
+	struct list_head reg_base_head;
+	struct list_head sub_range_list;
+	char name[REG_BASE_NAME_LEN];
+	void __iomem *base;
+	size_t off;
+	size_t cnt;
+	size_t max_offset;
+	char *buf;
+	size_t buf_len;
+	u32 *reg_dump;
+	void (*cb)(void *ptr);
+	void *cb_ptr;
+};
+
+/**
+ * struct dpu_dbg_base - global sde debug base structure
+ * @evtlog: event log instance
+ * @reg_base_list: list of register dumping regions
+ * @dev: device pointer
+ * @drm_dev: drm device pointer
+ * @mutex: mutex to serialize access to serialze dumps, debugfs access
+ * @req_dump_blks: list of blocks requested for dumping
+ * @work_panic: panic after dump if internal user passed "panic" special region
+ * @enable_reg_dump: whether to dump registers into memory, kernel log, or both
+ * @dump_all: dump all entries in register dump
+ * @coredump_pending: coredump is pending read from userspace
+ * @atomic_state: atomic state duplicated at the time of the error
+ * @dump_worker: kworker thread which runs the dump work
+ * @dump_work: kwork which dumps the registers and drm state
+ * @timestamp: timestamp at which the coredump was captured
+ * @dpu_dbg_printer: drm printer handle used to take drm snapshot
+ * @dump_mode: decides whether the data is dumped in memory or logs
+ */
+struct dpu_dbg_base {
+	struct list_head reg_base_list;
+	struct device *dev;
+	struct drm_device *drm_dev;
+	struct mutex mutex;
+
+	struct dpu_dbg_reg_base *req_dump_blks[DPU_DBG_BASE_MAX];
+
+	bool work_panic;
+	u32 enable_reg_dump;
+
+	bool dump_all;
+	bool coredump_pending;
+
+	struct drm_atomic_state *atomic_state;
+
+	struct kthread_worker *dump_worker;
+	struct kthread_work dump_work;
+	ktime_t timestamp;
+
+	struct drm_printer *dpu_dbg_printer;
+
+	enum dpu_dbg_dump_context dump_mode;
+};
+
+struct dpu_dbg_power_ctrl {
+	void *handle;
+	void *client;
+	int (*enable_fn)(void *handle, void *client, bool enable);
+};
+
+
+/**
+ * DPU_DBG_DUMP - trigger dumping of all dpu_dbg facilities
+ * @va_args:	list of named register dump ranges and regions to dump, as
+ *		registered previously through dpu_dbg_reg_register_base and
+ *		dpu_dbg_reg_register_dump_range.
+ *		Including the special name "panic" will trigger a panic after
+ *		the dumping work has completed.
+ */
+#define DPU_DBG_DUMP(...) dpu_dbg_dump(DPU_DBG_DUMP_PROC_CTX, __func__, \
+		##__VA_ARGS__, DPU_DBG_DUMP_DATA_LIMITER)
+
+/**
+ * DPU_DBG_DUMP_CLK_EN - trigger dumping of all dpu_dbg facilities, without clk
+ * @va_args:	list of named register dump ranges and regions to dump, as
+ *		registered previously through dpu_dbg_reg_register_base and
+ *		dpu_dbg_reg_register_dump_range.
+ *		Including the special name "panic" will trigger a panic after
+ *		the dumping work has completed.
+ */
+#define DPU_DBG_DUMP_CLK_EN(...) dpu_dbg_dump(DPU_DBG_DUMP_CLK_ENABLED_CTX, \
+		__func__, ##__VA_ARGS__, DPU_DBG_DUMP_DATA_LIMITER)
+
+/**
+ * dpu_dbg_init - initialize global sde debug facilities: evtlog, regdump
+ * @dev:		device handle
+ * Returns:		0 or -ERROR
+ */
+int dpu_dbg_init(struct device *dev);
+
+/**
+ * dpu_dbg_register_drm_dev - register a drm device with the dpu dbg module
+ * @ddev:		drm device hangle
+ * Returns:		void
+ */
+void dpu_dbg_register_drm_dev(struct drm_device *ddev);
+
+/**
+ * dpu_dbg_destroy - destroy the global sde debug facilities
+ * Returns:	none
+ */
+void dpu_dbg_destroy(void);
+
+/**
+ * dpu_dbg_dump - trigger dumping of all dpu_dbg facilities
+ * @queue_work:	whether to queue the dumping work to the work_struct
+ * @name:	string indicating origin of dump
+ * @va_args:	list of named register dump ranges and regions to dump, as
+ *		registered previously through dpu_dbg_reg_register_base and
+ *		dpu_dbg_reg_register_dump_range.
+ *		Including the special name "panic" will trigger a panic after
+ *		the dumping work has completed.
+ * Returns:	none
+ */
+void dpu_dbg_dump(enum dpu_dbg_dump_context mode, const char *name, ...);
+
+/**
+ * dpu_dbg_reg_register_base - register a hw register address section for later
+ *	dumping. call this before calling dpu_dbg_reg_register_dump_range
+ *	to be able to specify sub-ranges within the base hw range.
+ * @name:	name of base region
+ * @base:	base pointer of region
+ * @max_offset:	length of region
+ * Returns:	0 or -ERROR
+ */
+int dpu_dbg_reg_register_base(const char *name, void __iomem *base,
+		size_t max_offset);
+
+/**
+ * dpu_dbg_reg_register_dump_range - register a hw register sub-region for
+ *	later register dumping associated with base specified by
+ *	dpu_dbg_reg_register_base
+ * @base_name:		name of base region
+ * @range_name:		name of sub-range within base region
+ * @offset_start:	sub-range's start offset from base's base pointer
+ * @offset_end:		sub-range's end offset from base's base pointer
+ * @xin_id:		xin id
+ * Returns:		none
+ */
+void dpu_dbg_reg_register_dump_range(const char *base_name,
+		const char *range_name, u32 offset_start, u32 offset_end,
+		uint32_t xin_id);
+
+/**
+ * dpu_dbg_set_sde_top_offset - set the target specific offset from mdss base
+ *	address of the top registers. Used for accessing debug bus controls.
+ * @blk_off: offset from mdss base of the top block
+ */
+void dpu_dbg_set_sde_top_offset(u32 blk_off);
+
+/**
+ * _dpu_dump_array - dump array of register bases
+ * @blk_arr: array of register base pointers
+ * @len: length of blk_arr
+ * @do_panic: whether to trigger a panic after dumping
+ * @name: string indicating origin of dump
+ * @dump_all: dump all regs
+ */
+void _dpu_dump_array(struct dpu_dbg_base *dbg_base,
+		struct dpu_dbg_reg_base *blk_arr[],
+		u32 len, bool do_panic, const char *name, bool dump_all);
+
+/**
+ * _dpu_dump_get_blk_addr - retrieve register block address by name
+ * @blk_name: register blk name
+ * @Return: register blk base, or NULL
+ */
+struct dpu_dbg_reg_base *_dpu_dump_get_blk_addr(struct dpu_dbg_base *dbg_base,
+		const char *blk_name);
+
+#endif /* DPU_DBG_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c
new file mode 100644
index 000000000000..a54bea108020
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
+
+#include "dpu_dbg.h"
+#include "dpu_hw_catalog.h"
+
+/**
+ * _sde_power_check - check if power needs to enabled
+ * @dump_mode: to check if power need to be enabled
+ * Return: true if success; false otherwise
+ */
+static inline bool _dpu_power_check(enum dpu_dbg_dump_context dump_mode)
+{
+	return (dump_mode == DPU_DBG_DUMP_CLK_ENABLED_CTX) ? false : true;
+}
+
+/**
+ * _dpu_dump_reg - helper function for dumping rotator register set content
+ * @dump_name: register set name
+ * @reg_dump_flag: dumping flag controlling in-log/memory dump location
+ * @base_addr: starting address of io region for calculating offsets to print
+ * @addr: starting address offset for dumping
+ * @len_bytes: range of the register set
+ * @dump_mem: output buffer for memory dump location option
+ * @from_isr: whether being called from isr context
+ */
+static void _dpu_dump_reg(struct dpu_dbg_base *dbg_base,
+		const char *dump_name, u32 reg_dump_flag,
+		char *base_addr, char *addr, size_t len_bytes, u32 **dump_mem)
+{
+	u32 in_log, in_mem, len_align, len_padded, in_dump;
+	u32 *dump_addr = NULL;
+	char *end_addr;
+	int i;
+	int rc;
+
+	if (!len_bytes)
+		return;
+
+	in_log = (reg_dump_flag & DPU_DBG_DUMP_IN_LOG);
+	in_mem = (reg_dump_flag & DPU_DBG_DUMP_IN_MEM);
+	in_dump = (reg_dump_flag & DPU_DBG_DUMP_IN_COREDUMP);
+
+	pr_debug("%s: reg_dump_flag=%d in_log=%d in_mem=%d\n",
+		dump_name, reg_dump_flag, in_log, in_mem);
+
+	if (!in_log && !in_mem && !in_dump)
+		return;
+
+	if (in_log)
+		dev_info(dbg_base->dev, "%s: start_offset 0x%lx len 0x%zx\n",
+				dump_name, (unsigned long)(addr - base_addr),
+					len_bytes);
+
+	len_align = (len_bytes + REG_DUMP_ALIGN - 1) / REG_DUMP_ALIGN;
+	len_padded = len_align * REG_DUMP_ALIGN;
+	end_addr = addr + len_bytes;
+
+	if (in_mem || in_dump) {
+		if (dump_mem && !(*dump_mem))
+			*dump_mem = devm_kzalloc(dbg_base->dev, len_padded,
+					GFP_KERNEL);
+
+		if (dump_mem && *dump_mem) {
+			dump_addr = *dump_mem;
+			dev_info(dbg_base->dev,
+				"%s: start_addr:0x%pK len:0x%x reg_offset=0x%lx\n",
+				dump_name, dump_addr, len_padded,
+				(unsigned long)(addr - base_addr));
+			if (in_dump)
+				drm_printf(dbg_base->dpu_dbg_printer,
+						"%s: start_addr:0x%pK len:0x%x reg_offset=0x%lx\n",
+						dump_name, dump_addr,
+						len_padded,
+						(unsigned long)(addr -
+						base_addr));
+		} else {
+			in_mem = 0;
+			pr_err("dump_mem: kzalloc fails!\n");
+		}
+	}
+
+	if (_dpu_power_check(dbg_base->dump_mode)) {
+		rc = pm_runtime_get_sync(dbg_base->dev);
+		if (rc < 0) {
+			pr_err("failed to enable power %d\n", rc);
+			return;
+		}
+	}
+
+	for (i = 0; i < len_align; i++) {
+		u32 x0, x4, x8, xc;
+
+		if (in_log || in_mem) {
+			x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
+			x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr +
+					0x4) : 0;
+			x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr +
+					0x8) : 0;
+			xc = (addr + 0xc < end_addr) ? readl_relaxed(addr +
+					0xc) : 0;
+		}
+
+		if (in_log)
+			dev_info(dbg_base->dev,
+					"0x%lx : %08x %08x %08x %08x\n",
+					(unsigned long)(addr - base_addr),
+					x0, x4, x8, xc);
+
+		if (dump_addr && in_mem) {
+			dump_addr[i * 4] = x0;
+			dump_addr[i * 4 + 1] = x4;
+			dump_addr[i * 4 + 2] = x8;
+			dump_addr[i * 4 + 3] = xc;
+		}
+
+		if (in_dump) {
+			drm_printf(dbg_base->dpu_dbg_printer,
+					"0x%lx : %08x %08x %08x %08x\n",
+					(unsigned long)(addr - base_addr),
+					dump_addr[i * 4],
+					dump_addr[i * 4 + 1],
+					dump_addr[i * 4 + 2],
+					dump_addr[i * 4 + 3]);
+
+		}
+
+		addr += REG_DUMP_ALIGN;
+	}
+
+	if (_dpu_power_check(dbg_base->dump_mode))
+		pm_runtime_put_sync(dbg_base->dev);
+}
+
+/**
+ * _dpu_dbg_get_dump_range - helper to retrieve dump length for a range node
+ * @range_node: range node to dump
+ * @max_offset: max offset of the register base
+ * @Return: length
+ */
+static u32 _dpu_dbg_get_dump_range(struct dpu_dbg_reg_offset *range_node,
+		size_t max_offset)
+{
+	u32 length = 0;
+
+	if (range_node->start == 0 && range_node->end == 0) {
+		length = max_offset;
+	} else if (range_node->start < max_offset) {
+		if (range_node->end > max_offset)
+			length = max_offset - range_node->start;
+		else if (range_node->start < range_node->end)
+			length = range_node->end - range_node->start;
+	}
+
+	return length;
+}
+
+static int _dpu_dump_reg_range_cmp(void *priv, struct list_head *a,
+		struct list_head *b)
+{
+	struct dpu_dbg_reg_range *ar, *br;
+
+	if (!a || !b)
+		return 0;
+
+	ar = container_of(a, struct dpu_dbg_reg_range, head);
+	br = container_of(b, struct dpu_dbg_reg_range, head);
+
+	return ar->offset.start - br->offset.start;
+}
+
+/**
+ * _dpu_dump_reg_by_ranges - dump ranges or full range of the register blk base
+ * @dbg: register blk base structure
+ * @reg_dump_flag: dump target, memory, kernel log, or both
+ */
+static void _dpu_dump_reg_by_ranges(struct dpu_dbg_base *dbg_base,
+		struct dpu_dbg_reg_base *dbg,
+		u32 reg_dump_flag)
+{
+	char *addr;
+	size_t len;
+	struct dpu_dbg_reg_range *range_node;
+
+	if (!dbg || !(dbg->base || dbg->cb)) {
+		pr_err("dbg base is null!\n");
+		return;
+	}
+
+	dev_info(dbg_base->dev, "%s:=========%s DUMP=========\n", __func__,
+			dbg->name);
+
+	if (reg_dump_flag & DPU_DBG_DUMP_IN_COREDUMP)
+		drm_printf(dbg_base->dpu_dbg_printer,
+				"%s:=========%s DUMP=========\n",
+				__func__, dbg->name);
+
+	if (dbg->cb) {
+		dbg->cb(dbg->cb_ptr);
+	/* If there is a list to dump the registers by ranges, use the ranges */
+	} else if (!list_empty(&dbg->sub_range_list)) {
+		/* sort the list by start address first */
+		list_sort(NULL, &dbg->sub_range_list, _dpu_dump_reg_range_cmp);
+		list_for_each_entry(range_node, &dbg->sub_range_list, head) {
+			len = _dpu_dbg_get_dump_range(&range_node->offset,
+				dbg->max_offset);
+			addr = dbg->base + range_node->offset.start;
+
+			pr_debug("%s: range_base=0x%pK start=0x%x end=0x%x\n",
+				range_node->range_name,
+				addr, range_node->offset.start,
+				range_node->offset.end);
+
+			_dpu_dump_reg(dbg_base, range_node->range_name,
+					reg_dump_flag,
+					dbg->base, addr, len,
+					&range_node->reg_dump);
+		}
+	} else {
+		/* If there is no list to dump ranges, dump all registers */
+		dev_info(dbg_base->dev,
+				"Ranges not found, will dump full registers\n");
+		dev_info(dbg_base->dev, "base:0x%pK len:0x%zx\n", dbg->base,
+				dbg->max_offset);
+		addr = dbg->base;
+		len = dbg->max_offset;
+		_dpu_dump_reg(dbg_base, dbg->name, reg_dump_flag,
+				dbg->base, addr, len,
+				&dbg->reg_dump);
+	}
+}
+
+/**
+ * _dpu_dump_reg_by_blk - dump a named register base region
+ * @blk_name: register blk name
+ */
+static void _dpu_dump_reg_by_blk(struct dpu_dbg_base *dbg_base,
+		const char *blk_name)
+{
+	struct dpu_dbg_reg_base *blk_base;
+
+	if (!dbg_base)
+		return;
+
+	list_for_each_entry(blk_base, &dbg_base->reg_base_list, reg_base_head) {
+		if (strlen(blk_base->name) &&
+			!strcmp(blk_base->name, blk_name)) {
+			_dpu_dump_reg_by_ranges(dbg_base, blk_base,
+				dbg_base->enable_reg_dump);
+			break;
+		}
+	}
+}
+
+/**
+ * _dpu_dump_reg_all - dump all register regions
+ */
+static void _dpu_dump_reg_all(struct dpu_dbg_base *dbg_base)
+{
+	struct dpu_dbg_reg_base *blk_base;
+
+	if (!dbg_base)
+		return;
+
+	list_for_each_entry(blk_base, &dbg_base->reg_base_list, reg_base_head) {
+
+		if (!strlen(blk_base->name))
+			continue;
+
+		_dpu_dump_reg_by_blk(dbg_base, blk_base->name);
+	}
+}
+
+struct dpu_dbg_reg_base *_dpu_dump_get_blk_addr(struct dpu_dbg_base *dbg_base,
+		const char *blk_name)
+{
+	struct dpu_dbg_reg_base *blk_base;
+
+	list_for_each_entry(blk_base, &dbg_base->reg_base_list, reg_base_head)
+		if (strlen(blk_base->name) && !strcmp(blk_base->name, blk_name))
+			return blk_base;
+
+	return NULL;
+}
+
+void _dpu_dump_array(struct dpu_dbg_base *dbg_base,
+		struct dpu_dbg_reg_base *blk_arr[],
+		u32 len, bool do_panic, const char *name, bool dump_all)
+{
+	int i;
+
+	mutex_lock(&dbg_base->mutex);
+
+	if (dump_all || !blk_arr || !len) {
+		_dpu_dump_reg_all(dbg_base);
+	} else {
+		for (i = 0; i < len; i++) {
+			if (blk_arr[i] != NULL)
+				_dpu_dump_reg_by_ranges(dbg_base,
+						blk_arr[i],
+						dbg_base->enable_reg_dump);
+		}
+	}
+
+	if (do_panic)
+		panic(name);
+
+	mutex_unlock(&dbg_base->mutex);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3544af1a45c5..b2ab22be4c55 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_CATALOG_H
@@ -52,6 +52,8 @@
 
 
 #define DPU_HW_BLK_NAME_LEN	16
+/* default size of valid register space for MDSS_HW block (offset 0) */
+#define DEFAULT_MDSS_HW_BLOCK_SIZE 0x5C
 
 #define MAX_IMG_WIDTH 0x3fff
 #define MAX_IMG_HEIGHT 0x3fff
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49685571dc0e..f6fb0187388f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2018, 2020 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -17,6 +17,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_of.h>
 #include <drm/drm_vblank.h>
+#include "dpu_dbg.h"
 
 #include "msm_drv.h"
 #include "msm_debugfs.h"
@@ -268,6 +269,8 @@ static int msm_drm_uninit(struct device *dev)
 		msm_fbdev_free(ddev);
 #endif
 
+	dpu_dbg_destroy();
+
 	drm_mode_config_cleanup(ddev);
 
 	pm_runtime_get_sync(dev);
@@ -1303,6 +1306,7 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 fail:
 	of_platform_depopulate(&pdev->dev);
+	dpu_dbg_destroy();
 	return ret;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
