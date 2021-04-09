Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C003591FE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 04:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5766E43A;
	Fri,  9 Apr 2021 02:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFA56E437
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 02:28:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617935334; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Wi+K/inh1KIMtodpuwzFHMqdnW0DiWGNrlnXoQcGQ84=;
 b=ccyOxFRGYi/ygRTpUgj+e9yz/MEuznBKcxi+4bG6pz3zONR7+i6b2e3QwLuFxVBz2RyxhU9l
 iGURKVfEowmBNrqnf+IFAg4zzm8qYVlpbAQcHkVMMEDQSFAzumf2Va7iLb+8FaKNyRf4HPvh
 LqOVpLxJcs4cLOMHnn888NH4SCo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 606fbbe603cfff3452c0bffe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 02:28:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 822C7C43462; Fri,  9 Apr 2021 02:28:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6580AC43468;
 Fri,  9 Apr 2021 02:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6580AC43468
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/msm/dpu: add support to dump dpu registers
Date: Thu,  8 Apr 2021 19:28:36 -0700
Message-Id: <1617935317-15571-3-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
References: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
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
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dpu_dbg module which adds supports to dump dpu registers
which can be used in case of error conditions.

changes in v3:
 - Get rid of registration mechanism for sub-modules and instead get
   this information from the dpu catalog itself
 - Get rid of global dpu_dbg struct and instead store it in dpu_kms
 - delegate the power management of the sub-modules to the resp drivers
 - refactor and remove the linked list logic and simplify it to have
   just an array

Change-Id: Ide975ecf5d7952ae44daaa6eb611e27d09630be5
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/Makefile                   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c        | 221 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h        | 200 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c   | 257 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  86 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   5 +
 drivers/gpu/drm/msm/dp/dp_catalog.c            |  10 +
 drivers/gpu/drm/msm/dp/dp_catalog.h            |   5 +
 drivers/gpu/drm/msm/dp/dp_display.c            |  37 ++++
 drivers/gpu/drm/msm/dp/dp_display.h            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                  |   5 +
 drivers/gpu/drm/msm/dsi/dsi.h                  |   4 +
 drivers/gpu/drm/msm/dsi/dsi_host.c             |  25 +++
 drivers/gpu/drm/msm/msm_drv.c                  |  29 ++-
 drivers/gpu/drm/msm/msm_drv.h                  |   2 +
 16 files changed, 889 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 3cc9061..9166417 100644
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
index 0000000..9ec642e
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
+
+#include "dpu_dbg.h"
+#include "dpu_kms.h"
+#include "dpu_hw_catalog.h"
+
+#ifdef CONFIG_DEV_COREDUMP
+static ssize_t dpu_devcoredump_read(char *buffer, loff_t offset,
+		size_t count, void *data, size_t datalen)
+{
+	struct drm_print_iterator iter;
+	struct drm_printer p;
+	struct dpu_dbg_base *dpu_dbg;
+
+	dpu_dbg = data;
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
+	drm_printf(&p, "timestamp %lld\n", ktime_to_ns(dpu_dbg->timestamp));
+
+	dpu_dbg->dpu_dbg_printer = &p;
+
+	dpu_dbg_print_regs(dpu_dbg->drm_dev, DPU_DBG_DUMP_IN_COREDUMP);
+
+	drm_printf(&p, "===================dpu drm state================\n");
+
+	if (dpu_dbg->atomic_state)
+		drm_atomic_print_new_state(dpu_dbg->atomic_state,
+				&p);
+
+	return count - iter.remain;
+}
+
+static void dpu_devcoredump_free(void *data)
+{
+	struct dpu_dbg_base *dpu_dbg;
+
+	dpu_dbg = data;
+
+	if (dpu_dbg->atomic_state) {
+		drm_atomic_state_put(dpu_dbg->atomic_state);
+		dpu_dbg->atomic_state = NULL;
+	}
+
+	dpu_dbg_free_blk_mem(dpu_dbg->drm_dev);
+
+	dpu_dbg->coredump_pending = false;
+}
+
+static void dpu_devcoredump_capture_state(struct dpu_dbg_base *dpu_dbg)
+{
+	struct drm_device *ddev;
+	struct drm_modeset_acquire_ctx ctx;
+
+	dpu_dbg->timestamp = ktime_get();
+
+	ddev = dpu_dbg->drm_dev;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
+		drm_modeset_backoff(&ctx);
+
+	dpu_dbg->atomic_state = drm_atomic_helper_duplicate_state(ddev,
+			&ctx);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+#else
+static void dpu_devcoredump_capture_state(struct dpu_dbg_base *dpu_dbg)
+{
+}
+#endif /* CONFIG_DEV_COREDUMP */
+
+static void _dpu_dump_work(struct kthread_work *work)
+{
+	struct dpu_dbg_base *dpu_dbg = container_of(work, struct dpu_dbg_base, dump_work);
+	struct drm_printer p;
+
+	/* reset the reg_dump_method to IN_MEM before every dump */
+	dpu_dbg->reg_dump_method = DPU_DBG_DUMP_IN_MEM;
+
+	dpu_dbg_dump_blks(dpu_dbg);
+
+	dpu_devcoredump_capture_state(dpu_dbg);
+
+	if (DPU_DBG_DUMP_IN_CONSOLE) {
+		p = drm_info_printer(dpu_dbg->drm_dev->dev);
+		dpu_dbg->dpu_dbg_printer = &p;
+		dpu_dbg_print_regs(dpu_dbg->drm_dev, DPU_DBG_DUMP_IN_LOG);
+	}
+
+#ifdef CONFIG_DEV_COREDUMP
+	dev_coredumpm(dpu_dbg->dev, THIS_MODULE, dpu_dbg, 0, GFP_KERNEL,
+			dpu_devcoredump_read, dpu_devcoredump_free);
+	dpu_dbg->coredump_pending = true;
+#endif
+}
+
+void dpu_dbg_dump(struct drm_device *drm_dev, const char *name, ...)
+{
+	va_list args;
+	char *blk_name = NULL;
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_dbg_base *dpu_dbg;
+	int index = 0;
+
+	if (!drm_dev) {
+		DRM_ERROR("invalid params\n");
+		return;
+	}
+
+	priv = drm_dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+	dpu_dbg = dpu_kms->dpu_dbg;
+
+	if (!dpu_dbg) {
+		DRM_ERROR("invalid params\n");
+		return;
+	}
+
+	/*
+	 * if there is a coredump pending return immediately till dump
+	 * if read by userspace or timeout happens
+	 */
+	if (((dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM) ||
+		 (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_COREDUMP)) &&
+		dpu_dbg->coredump_pending) {
+		DRM_DEBUG("coredump is pending read\n");
+		return;
+	}
+
+	va_start(args, name);
+
+	while ((blk_name = va_arg(args, char*))) {
+
+		if (IS_ERR_OR_NULL(blk_name))
+			break;
+
+		if (index < DPU_DBG_BASE_MAX)
+			dpu_dbg->blk_names[index++] = blk_name;
+		else
+			DRM_ERROR("too many blk names\n");
+	}
+	va_end(args);
+
+	kthread_queue_work(dpu_dbg->dump_worker,
+			&dpu_dbg->dump_work);
+}
+
+int dpu_dbg_init(struct drm_device *drm_dev)
+{
+	struct dpu_kms *dpu_kms;
+	struct msm_drm_private *priv;
+	struct dpu_dbg_base *dpu_dbg;
+
+	if (!drm_dev) {
+		DRM_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	priv = drm_dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+
+	dpu_dbg = devm_kzalloc(drm_dev->dev, sizeof(struct dpu_dbg_base), GFP_KERNEL);
+
+	mutex_init(&dpu_dbg->mutex);
+
+	dpu_dbg->dev = drm_dev->dev;
+	dpu_dbg->drm_dev = drm_dev;
+
+	dpu_dbg->reg_dump_method = DEFAULT_REGDUMP;
+
+	dpu_dbg->dump_worker = kthread_create_worker(0, "%s", "dpu_dbg");
+	if (IS_ERR(dpu_dbg->dump_worker))
+		DRM_ERROR("failed to create dpu dbg task\n");
+
+	kthread_init_work(&dpu_dbg->dump_work, _dpu_dump_work);
+
+	dpu_kms->dpu_dbg = dpu_dbg;
+
+	dpu_dbg_init_blk_info(drm_dev);
+
+	return 0;
+}
+
+void dpu_dbg_destroy(struct drm_device *drm_dev)
+{
+	struct dpu_kms *dpu_kms;
+	struct msm_drm_private *priv;
+	struct dpu_dbg_base *dpu_dbg;
+
+	if (!drm_dev) {
+		DRM_ERROR("invalid params\n");
+		return;
+	}
+
+	priv = drm_dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+	dpu_dbg = dpu_kms->dpu_dbg;
+
+	if (dpu_dbg->dump_worker)
+		kthread_destroy_worker(dpu_dbg->dump_worker);
+
+	mutex_destroy(&dpu_dbg->mutex);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
new file mode 100644
index 0000000..302205a
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
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
+#include "dpu_hw_catalog.h"
+#include "dpu_kms.h"
+#include "dsi.h"
+
+#define DPU_DBG_DUMP_DATA_LIMITER (NULL)
+
+enum dpu_dbg_dump_flag {
+	DPU_DBG_DUMP_IN_LOG = BIT(0),
+	DPU_DBG_DUMP_IN_MEM = BIT(1),
+	DPU_DBG_DUMP_IN_COREDUMP = BIT(2),
+};
+
+#define DPU_DBG_BASE_MAX		10
+
+#define DEFAULT_PANIC		0
+#define DEFAULT_REGDUMP		DPU_DBG_DUMP_IN_MEM
+#define ROW_BYTES		16
+#define RANGE_NAME_LEN		40
+#define REG_BASE_NAME_LEN	80
+
+/* debug option to print the registers in logs */
+#define DPU_DBG_DUMP_IN_CONSOLE 0
+
+/* print debug ranges in groups of 4 u32s */
+#define REG_DUMP_ALIGN		16
+
+struct dpu_mdp_regs {
+	u32 **ctl;
+	u32 **sspp;
+	u32 *top;
+	u32 **pp;
+	u32 **intf;
+	u32 **dspp;
+};
+
+/**
+ * struct dpu_dbg_base - sde debug base structure
+ * @evtlog: event log instance
+ * @reg_base_list: list of register dumping regions
+ * @dev: device pointer
+ * @drm_dev: drm device pointer
+ * @mutex: mutex to serialize access to serialze dumps, debugfs access
+ * @dsi_ctrl_regs: array storing dsi controller registers
+ * @dp_ctrl_regs: array storing dp controller registers
+ * @mdp_regs: pointer to struct containing mdp register dump
+ * @reg_dump_method: whether to dump registers into memory, kernel log, or both
+ * @coredump_pending: coredump is pending read from userspace
+ * @atomic_state: atomic state duplicated at the time of the error
+ * @dump_worker: kworker thread which runs the dump work
+ * @dump_work: kwork which dumps the registers and drm state
+ * @timestamp: timestamp at which the coredump was captured
+ * @dpu_dbg_printer: drm printer handle used to take drm snapshot
+ */
+struct dpu_dbg_base {
+	struct device *dev;
+	struct drm_device *drm_dev;
+	struct mutex mutex;
+
+	u32 **dsi_ctrl_regs;
+
+	u32 *dp_ctrl_regs;
+
+	struct dpu_mdp_regs *mdp_regs;
+
+	char *blk_names[DPU_DBG_BASE_MAX];
+
+	u32 reg_dump_method;
+
+	bool coredump_pending;
+
+	struct drm_atomic_state *atomic_state;
+
+	struct kthread_worker *dump_worker;
+	struct kthread_work dump_work;
+	ktime_t timestamp;
+
+	struct drm_printer *dpu_dbg_printer;
+};
+
+/**
+ * DPU_DBG_DUMP - trigger dumping of all dpu_dbg facilities
+ * @va_args:	list of named register dump ranges and regions to dump
+ *              currently "mdp", "dsi" and "dp" are supported to dump
+ *              mdp, dsi and dp register space respectively
+ */
+#define DPU_DBG_DUMP(drm_dev, ...) dpu_dbg_dump(drm_dev, __func__, \
+		##__VA_ARGS__, DPU_DBG_DUMP_DATA_LIMITER)
+
+/**
+ * dpu_dbg_init - initialize global sde debug facilities: evtlog, regdump
+ * @dev:		device handle
+ * Returns:		0 or -ERROR
+ */
+int dpu_dbg_init(struct drm_device *drm_dev);
+
+/**
+ * dpu_dbg_destroy - destroy the global sde debug facilities
+ * Returns:	none
+ */
+void dpu_dbg_destroy(struct drm_device *drm_dev);
+
+/**
+ * dpu_dbg_dump - trigger dumping of all dpu_dbg facilities
+ * @name:	string indicating origin of dump
+ * @va_args:	list of named register dump ranges and regions to dump
+ *              currently "mdp", "dsi" and "dp" are supported to dump
+ *              mdp, dsi and dp register space respectively
+ *
+ * Returns:	none
+ */
+void dpu_dbg_dump(struct drm_device *drm_dev, const char *name, ...);
+
+/**
+ * dpu_dbg_dump_regs - utility to store the register dumps in the specified memory
+ * @reg:	memory where the registers need to be dumped
+ * @len:	size of the register space which needs to be dumped
+ * @base_addr:  base address of the module which needs to be dumped
+ * @dump_op: op specifying if the dump needs to be in memory, in log or in coredump
+ * @p: handle to drm_printer
+ * Returns:	none
+ */
+void dpu_dbg_dump_regs(u32 **reg, u32 len, void __iomem *base_addr,
+		u32 dump_op, struct drm_printer *p);
+
+/**
+ * dpu_dbg_get - get the handle to dpu_dbg struct from the drm device
+ * @drm:	    handle to drm device
+
+ * Returns:	handle to the dpu_dbg_base struct
+ */
+struct dpu_dbg_base *dpu_dbg_get(struct drm_device *drm);
+
+/**
+ * dpu_dbg_print_regs - print out the module registers to either log or drm printer
+ * @drm:	    handle to drm device
+
+ * Returns:	none
+ */
+void dpu_dbg_print_regs(struct drm_device *dev, u8 reg_dump_method);
+
+/**
+ * dpu_dbg_dump_blks - utility to dump out the registers as per their names
+ * @dpu_dbg:	    handle to dpu_dbg_base struct
+
+ * Returns:	none
+ */
+void dpu_dbg_dump_blks(struct dpu_dbg_base *dpu_dbg);
+
+/**
+ * dpu_dbg_init_blk_info - allocate memory for hw blocks based on hw catalog
+ * @drm:	    handle to drm device
+
+ * Returns:	none
+ */
+void dpu_dbg_init_blk_info(struct drm_device *dev);
+
+/**
+ * dpu_dbg_free_blk_mem - free the memory after the coredump has been read
+ * @drm:	    handle to drm device
+
+ * Returns: none
+ */
+void dpu_dbg_free_blk_mem(struct drm_device *drm_dev);
+
+/**
+ * dpu_dbg_is_drm_printer_needed - checks if a valid drm printer is needed for this dump type
+ * @dpu_dbg:	handle to the dpu_dbg_base struct
+ * Returns: none
+ */
+bool dpu_dbg_is_drm_printer_needed(struct dpu_dbg_base *dpu_dbg);
+
+#endif /* DPU_DBG_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c
new file mode 100644
index 0000000..36647bf
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
+
+#include "dpu_dbg.h"
+
+void dpu_dbg_dump_regs(u32 **reg, u32 len, void __iomem *base_addr,
+		u32 dump_op, struct drm_printer *p)
+{
+	u32 len_aligned, len_padded;
+	u32 x0, x4, x8, xc;
+	void __iomem *addr;
+	u32 *dump_addr = NULL;
+	void __iomem *end_addr;
+	int i;
+
+	len_aligned = (len + REG_DUMP_ALIGN - 1) / REG_DUMP_ALIGN;
+	len_padded = len_aligned * REG_DUMP_ALIGN;
+
+	addr = base_addr;
+	end_addr = base_addr + len;
+
+	if (dump_op == DPU_DBG_DUMP_IN_COREDUMP && !p) {
+		DRM_ERROR("invalid drm printer\n");
+		return;
+	}
+
+	if (dump_op == DPU_DBG_DUMP_IN_MEM && !(*reg))
+		*reg = kzalloc(len_padded, GFP_KERNEL);
+
+	if (*reg)
+		dump_addr = *reg;
+
+	for (i = 0; i < len_aligned; i++) {
+		if (dump_op == DPU_DBG_DUMP_IN_MEM) {
+			x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
+			x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr + 0x4) : 0;
+			x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr + 0x8) : 0;
+			xc = (addr + 0xc < end_addr) ? readl_relaxed(addr + 0xc) : 0;
+		}
+
+		if (dump_addr) {
+			if (dump_op == DPU_DBG_DUMP_IN_MEM) {
+				dump_addr[i * 4] = x0;
+				dump_addr[i * 4 + 1] = x4;
+				dump_addr[i * 4 + 2] = x8;
+				dump_addr[i * 4 + 3] = xc;
+			} else if (dump_op == DPU_DBG_DUMP_IN_COREDUMP) {
+				drm_printf(p, "0x%lx : %08x %08x %08x %08x\n",
+						(unsigned long)(addr - base_addr),
+						dump_addr[i * 4], dump_addr[i * 4 + 1],
+						dump_addr[i * 4 + 2], dump_addr[i * 4 + 3]);
+			}
+			pr_debug("0x%lx : %08x %08x %08x %08x\n",
+				(unsigned long)(addr - base_addr),
+				dump_addr[i * 4], dump_addr[i * 4 + 1],
+				dump_addr[i * 4 + 2], dump_addr[i * 4 + 3]);
+		}
+
+		addr += REG_DUMP_ALIGN;
+	}
+}
+
+struct dpu_dbg_base *dpu_dbg_get(struct drm_device *drm)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+
+	priv = drm->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+
+	return dpu_kms->dpu_dbg;
+}
+
+bool dpu_dbg_is_drm_printer_needed(struct dpu_dbg_base *dpu_dbg)
+{
+	if ((dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_COREDUMP) ||
+			(dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_LOG))
+		return true;
+	else
+		return false;
+}
+
+static void dpu_dbg_dump_dsi_regs(struct drm_device *dev)
+{
+	struct msm_drm_private *priv;
+	int i;
+
+	priv = dev->dev_private;
+
+	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+		if (!priv->dsi[i])
+			continue;
+
+		msm_dsi_dump_regs(priv->dsi[i]);
+	}
+}
+
+static void dpu_dbg_dump_dp_regs(struct drm_device *dev)
+{
+	struct msm_drm_private *priv;
+
+	priv = dev->dev_private;
+
+	if (priv->dp)
+		msm_dp_dump_regs(priv->dp);
+
+}
+
+static void dpu_dbg_dump_mdp_regs(struct drm_device *dev)
+{
+	dpu_kms_dump_mdp_regs(dev);
+}
+
+static void dpu_dbg_dump_all_regs(struct drm_device *dev)
+{
+	dpu_dbg_dump_mdp_regs(dev);
+	dpu_dbg_dump_dsi_regs(dev);
+	dpu_dbg_dump_dp_regs(dev);
+}
+
+void dpu_dbg_print_regs(struct drm_device *dev, u8 reg_dump_method)
+{
+	struct msm_drm_private *priv;
+	int i;
+	struct dpu_dbg_base *dpu_dbg;
+	struct drm_printer *p;
+
+	priv = dev->dev_private;
+	dpu_dbg = dpu_dbg_get(dev);
+	dpu_dbg->reg_dump_method = DPU_DBG_DUMP_IN_COREDUMP;
+
+	p = dpu_dbg->dpu_dbg_printer;
+
+	drm_printf(p, "===================mdp regs================\n");
+	dpu_kms_dump_mdp_regs(dev);
+
+	drm_printf(p, "===================dsi regs================\n");
+	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+		if (!priv->dsi[i])
+			continue;
+
+		msm_dsi_dump_regs(priv->dsi[i]);
+	}
+
+	drm_printf(p, "===================dp regs================\n");
+
+	if (priv->dp)
+		msm_dp_dump_regs(priv->dp);
+}
+
+void dpu_dbg_dump_blks(struct dpu_dbg_base *dpu_dbg)
+{
+	int i;
+
+	for (i = 0; i < DPU_DBG_BASE_MAX; i++) {
+		if (dpu_dbg->blk_names[i] != NULL) {
+			DRM_DEBUG("blk name is %s\n", dpu_dbg->blk_names[i]);
+			if (!strcmp(dpu_dbg->blk_names[i], "all")) {
+				dpu_dbg_dump_all_regs(dpu_dbg->drm_dev);
+				break;
+			} else if (!strcmp(dpu_dbg->blk_names[i], "mdp")) {
+				dpu_dbg_dump_mdp_regs(dpu_dbg->drm_dev);
+			} else if (!strcmp(dpu_dbg->blk_names[i], "dsi")) {
+				dpu_dbg_dump_dsi_regs(dpu_dbg->drm_dev);
+			} else if (!strcmp(dpu_dbg->blk_names[i], "dp")) {
+				dpu_dbg_dump_dp_regs(dpu_dbg->drm_dev);
+			} else {
+				DRM_ERROR("blk name not found %s\n", dpu_dbg->blk_names[i]);
+			}
+		}
+	}
+}
+
+void dpu_dbg_free_blk_mem(struct drm_device *drm_dev)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_mdss_cfg *cat;
+	struct dpu_hw_mdp *top;
+	struct dpu_dbg_base *dpu_dbg;
+	int i;
+
+	priv = drm_dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+	dpu_dbg = dpu_kms->dpu_dbg;
+
+	cat = dpu_kms->catalog;
+	top = dpu_kms->hw_mdp;
+
+	/* free CTL sub-blocks mem */
+	for (i = 0; i < cat->ctl_count; i++)
+		kfree(dpu_dbg->mdp_regs->ctl[i]);
+
+	/* free DSPP sub-blocks mem */
+	for (i = 0; i < cat->dspp_count; i++)
+		kfree(dpu_dbg->mdp_regs->dspp[i]);
+
+	/* free INTF sub-blocks mem */
+	for (i = 0; i < cat->intf_count; i++)
+		kfree(dpu_dbg->mdp_regs->intf[i]);
+
+	/* free INTF sub-blocks mem */
+	for (i = 0; i < cat->pingpong_count; i++)
+		kfree(dpu_dbg->mdp_regs->pp[i]);
+
+	/* free SSPP sub-blocks mem */
+	for (i = 0; i < cat->sspp_count; i++)
+		kfree(dpu_dbg->mdp_regs->sspp[i]);
+
+	/* free TOP sub-blocks mem */
+	kfree(dpu_dbg->mdp_regs->top);
+
+	/* free DSI regs mem */
+	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++)
+		kfree(dpu_dbg->dsi_ctrl_regs[i]);
+
+	/* free DP regs mem */
+	kfree(dpu_dbg->dp_ctrl_regs);
+}
+
+void dpu_dbg_init_blk_info(struct drm_device *drm_dev)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_mdss_cfg *cat;
+	struct dpu_hw_mdp *top;
+	struct dpu_dbg_base *dpu_dbg;
+
+	priv = drm_dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+
+	cat = dpu_kms->catalog;
+	top = dpu_kms->hw_mdp;
+	dpu_dbg = dpu_kms->dpu_dbg;
+
+	dpu_dbg->mdp_regs = devm_kzalloc(drm_dev->dev, sizeof(struct dpu_mdp_regs), GFP_KERNEL);
+
+	if (dpu_dbg->mdp_regs) {
+		dpu_dbg->mdp_regs->ctl = devm_kzalloc(drm_dev->dev,
+				cat->ctl_count * sizeof(u32 **), GFP_KERNEL);
+		dpu_dbg->mdp_regs->dspp = devm_kzalloc(drm_dev->dev,
+				cat->dspp_count * sizeof(u32 **), GFP_KERNEL);
+		dpu_dbg->mdp_regs->intf = devm_kzalloc(drm_dev->dev,
+				cat->intf_count * sizeof(u32 **), GFP_KERNEL);
+		dpu_dbg->mdp_regs->sspp = devm_kzalloc(drm_dev->dev,
+				cat->sspp_count * sizeof(u32 **), GFP_KERNEL);
+		dpu_dbg->mdp_regs->pp = devm_kzalloc(drm_dev->dev,
+				cat->pingpong_count * sizeof(u32 **), GFP_KERNEL);
+	}
+
+	dpu_dbg->dsi_ctrl_regs = devm_kzalloc(drm_dev->dev, ARRAY_SIZE(priv->dsi) *
+			sizeof(dpu_dbg->dsi_ctrl_regs), GFP_KERNEL);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ea4647d..d4893c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_CATALOG_H
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 17f7102..46eb9ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -797,6 +797,92 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 	dpu_core_irq_uninstall(dpu_kms);
 }
 
+void dpu_kms_dump_mdp_regs(struct drm_device *dev)
+{
+	int i;
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_mdss_cfg *cat;
+	struct dpu_hw_mdp *top;
+	struct dpu_dbg_base *dpu_dbg;
+	struct drm_printer *p;
+	bool in_drm_printer = false;
+
+	priv = dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+	dpu_dbg = dpu_kms->dpu_dbg;
+	p = dpu_dbg->dpu_dbg_printer;
+
+	cat = dpu_kms->catalog;
+	top = dpu_kms->hw_mdp;
+
+	in_drm_printer = dpu_dbg_is_drm_printer_needed(dpu_dbg);
+
+	if (in_drm_printer && !p) {
+		DRM_ERROR("invalid drm printer\n");
+		return;
+	}
+
+	if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
+		pm_runtime_get_sync(&dpu_kms->pdev->dev);
+
+	/* dump CTL sub-blocks HW regs info */
+	for (i = 0; i < cat->ctl_count; i++) {
+		if (in_drm_printer)
+			drm_printf(p, "===================ctl %d regs================\n", i);
+		dpu_dbg_dump_regs(&dpu_dbg->mdp_regs->ctl[i],
+			cat->ctl[i].len, dpu_kms->mmio + cat->ctl[i].base,
+			dpu_dbg->reg_dump_method, p);
+	}
+
+	/* dump DSPP sub-blocks HW regs info */
+	for (i = 0; i < cat->dspp_count; i++) {
+		if (in_drm_printer)
+			drm_printf(p, "===================dspp %d regs================\n", i);
+		dpu_dbg_dump_regs(&dpu_dbg->mdp_regs->dspp[i],
+			cat->dspp[i].len, dpu_kms->mmio + cat->dspp[i].base,
+			dpu_dbg->reg_dump_method, p);
+	}
+
+	/* dump INTF sub-blocks HW regs info */
+	for (i = 0; i < cat->intf_count; i++) {
+		if (in_drm_printer)
+			drm_printf(p, "===================intf %d regs================\n", i);
+		dpu_dbg_dump_regs(&dpu_dbg->mdp_regs->intf[i],
+			cat->intf[i].len, dpu_kms->mmio + cat->intf[i].base,
+			dpu_dbg->reg_dump_method, p);
+	}
+
+	/* dump PP sub-blocks HW regs info */
+	for (i = 0; i < cat->pingpong_count; i++) {
+		if (in_drm_printer)
+			drm_printf(p, "===================ping-pong %d regs================\n", i);
+		dpu_dbg_dump_regs(&dpu_dbg->mdp_regs->pp[i],
+			cat->pingpong[i].len, dpu_kms->mmio + cat->pingpong[i].base,
+			dpu_dbg->reg_dump_method, p);
+	}
+
+	/* dump SSPP sub-blocks HW regs info */
+	for (i = 0; i < cat->sspp_count; i++) {
+		if (in_drm_printer)
+			drm_printf(p, "===================sspp %d regs================\n", i);
+		dpu_dbg_dump_regs(&dpu_dbg->mdp_regs->sspp[i],
+			cat->sspp[i].len, dpu_kms->mmio + cat->sspp[i].base,
+			dpu_dbg->reg_dump_method, p);
+	}
+
+	if (in_drm_printer)
+		drm_printf(p, "===================mdp top regs================\n");
+
+	/* dump TOP sub-blocks HW regs info */
+	dpu_dbg_dump_regs(&dpu_dbg->mdp_regs->top,
+			top->hw.length, dpu_kms->mmio + top->hw.blk_off,
+			dpu_dbg->reg_dump_method, p);
+
+	if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
+		pm_runtime_put_sync(&dpu_kms->pdev->dev);
+}
+
 static const struct msm_kms_funcs kms_funcs = {
 	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_irq_preinstall,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6..e582bb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -24,6 +24,7 @@
 #include "dpu_io_util.h"
 #include "dpu_rm.h"
 #include "dpu_core_perf.h"
+#include "dpu_dbg.h"
 
 #define DRMID(x) ((x) ? (x)->base.id : -1)
 
@@ -132,6 +133,8 @@ struct dpu_kms {
 
 	struct opp_table *opp_table;
 
+	struct dpu_dbg_base *dpu_dbg;
+
 	struct dss_module_power mp;
 
 	/* reference count bandwidth requests, so we know when we can
@@ -265,4 +268,6 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder);
  */
 u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
 
+void dpu_kms_dump_mdp_regs(struct drm_device *dev);
+
 #endif /* __dpu_kms_H__ */
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b1a9b1b..1f0f6f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -62,6 +62,16 @@ struct dp_catalog_private {
 	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
 };
 
+void dp_catalog_dump_dbg_regs(struct dp_catalog *dp_catalog, u32 **regs, u8 reg_dump_method,
+		struct drm_printer *p)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+			struct dp_catalog_private, dp_catalog);
+
+	dpu_dbg_dump_regs(regs, catalog->io->dp_controller.len,
+			catalog->io->dp_controller.base, reg_dump_method, p);
+}
+
 static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
 {
 	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 176a902..4b0f77f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -9,6 +9,7 @@
 #include <drm/drm_modes.h>
 
 #include "dp_parser.h"
+#include "dpu_dbg.h"
 
 /* interrupts */
 #define DP_INTR_HPD		BIT(0)
@@ -71,6 +72,10 @@ struct dp_catalog {
 	u32 audio_data;
 };
 
+/* Debug module */
+void dp_catalog_dump_dbg_regs(struct dp_catalog *dp_catalog, u32 **regs, u8 reg_dump_method,
+		struct drm_printer *p);
+
 /* AUX APIs */
 u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6..b0edfbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1009,6 +1009,43 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 		dp_display->link->test_video.test_bit_depth);
 }
 
+void msm_dp_dump_regs(struct msm_dp *dp)
+{
+	struct dp_display_private *dp_display;
+	struct drm_device *drm;
+	struct dpu_dbg_base *dpu_dbg;
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	drm = dp->drm_dev;
+	dpu_dbg = dpu_dbg_get(drm);
+
+	/*
+	 * if we are reading registers we need the link clocks to be on
+	 * however till DP cable is connected this will not happen as we
+	 * do not know the resolution to power up with. Hence check the
+	 * power_on status before dumping DP registers to avoid crash due
+	 * to unclocked access
+	 */
+	if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM) {
+		mutex_lock(&dp_display->event_mutex);
+		if (!dp->power_on) {
+			mutex_unlock(&dp_display->event_mutex);
+			return;
+		}
+	}
+
+	if (dpu_dbg_is_drm_printer_needed(dpu_dbg) && !dpu_dbg->dpu_dbg_printer) {
+		pr_err("invalid drm printer\n");
+		return;
+	}
+
+	dp_catalog_dump_dbg_regs(dp_display->catalog, &dpu_dbg->dp_ctrl_regs,
+			dpu_dbg->reg_dump_method, dpu_dbg->dpu_dbg_printer);
+
+	if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
+		mutex_unlock(&dp_display->event_mutex);
+}
+
 static void dp_display_config_hpd(struct dp_display_private *dp)
 {
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6092ba1..aa66c3d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -8,6 +8,7 @@
 
 #include "dp_panel.h"
 #include <sound/hdmi-codec.h>
+#include "dpu_dbg.h"
 
 struct msm_dp {
 	struct drm_device *drm_dev;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 62704885..9a86f5e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -266,3 +266,8 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	return ret;
 }
 
+void msm_dsi_dump_regs(struct msm_dsi *msm_dsi)
+{
+	msm_dsi_host_dump_regs(msm_dsi->host);
+}
+
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 78ef5d4..c9fccc4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -15,6 +15,7 @@
 #include <drm/drm_panel.h>
 
 #include "msm_drv.h"
+#include "dpu_dbg.h"
 
 #define DSI_0	0
 #define DSI_1	1
@@ -102,6 +103,8 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 	return msm_dsi->panel || msm_dsi->external_bridge;
 }
 
+void msm_dsi_dump_regs(struct msm_dsi *msm_dsi);
+
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
 /* dsi pll */
@@ -197,6 +200,7 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
+void msm_dsi_host_dump_regs(struct mipi_dsi_host *host);
 
 /* dsi phy */
 struct msm_dsi_phy;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ab281cb..d1675ee 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2489,3 +2489,28 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
 
 	return of_drm_find_bridge(msm_host->device_node);
 }
+
+void msm_dsi_host_dump_regs(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	struct drm_device *dev = msm_host->dev;
+	struct dpu_dbg_base *dpu_dbg;
+
+	dpu_dbg = dpu_dbg_get(dev);
+
+	if (dpu_dbg_is_drm_printer_needed(dpu_dbg) &&
+			!dpu_dbg->dpu_dbg_printer) {
+		pr_err("invalid drm printer\n");
+		return;
+	}
+
+	if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
+		pm_runtime_get_sync(&msm_host->pdev->dev);
+
+	dpu_dbg_dump_regs(&dpu_dbg->dsi_ctrl_regs[msm_host->id],
+			msm_iomap_size(msm_host->pdev, "dsi_ctrl"), msm_host->ctrl_base,
+			dpu_dbg->reg_dump_method, dpu_dbg->dpu_dbg_printer);
+
+	if (dpu_dbg->reg_dump_method == DPU_DBG_DUMP_IN_MEM)
+		pm_runtime_put_sync(&msm_host->pdev->dev);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 898e6d0..c4405b6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -19,6 +19,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_vblank.h>
 
+#include "dpu_dbg.h"
 #include "msm_drv.h"
 #include "msm_debugfs.h"
 #include "msm_fence.h"
@@ -166,6 +167,24 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 	return _msm_ioremap(pdev, name, dbgname, true);
 }
 
+unsigned long msm_iomap_size(struct platform_device *pdev, const char *name)
+{
+	struct resource *res;
+
+	if (name)
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	else
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
+				name);
+		return 0;
+	}
+
+	return resource_size(res);
+}
+
 void msm_writel(u32 data, void __iomem *addr)
 {
 	if (reglog)
@@ -277,6 +296,8 @@ static int msm_drm_uninit(struct device *dev)
 		msm_fbdev_free(ddev);
 #endif
 
+	dpu_dbg_destroy(ddev);
+
 	drm_mode_config_cleanup(ddev);
 
 	pm_runtime_get_sync(dev);
@@ -549,6 +570,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
+	if (get_mdp_ver(pdev) == KMS_DPU) {
+		ret = dpu_dbg_init(ddev);
+		if (ret)
+			DRM_DEV_ERROR(dev, "dpu_dbg_init failed ret = %d\n", ret);
+	}
+
 	drm_mode_config_reset(ddev);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6a42cdf..b8de6f3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -362,6 +362,7 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
+void msm_dp_dump_regs(struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
 
@@ -445,6 +446,7 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 		const char *dbgname);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 		const char *dbgname);
+unsigned long msm_iomap_size(struct platform_device *pdev, const char *name);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
 void msm_rmw(void __iomem *addr, u32 mask, u32 or);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
