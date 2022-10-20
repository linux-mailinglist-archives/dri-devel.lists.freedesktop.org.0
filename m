Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F86070EF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24B10E5D4;
	Fri, 21 Oct 2022 07:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E14310E031
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288655; x=1697824655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XKDssaDxAL772R8vc4lzCXmyyC6/InbgQeeYS52ixi4=;
 b=K88DLWuMT27REBEBTMIkuXWjE8nQPcWSknoASomYYQLI57ayuIc0LAtH
 vWknPZdNLGDz0lBu644Iq/a8qh1nq+3iUjUXKCot/eW7LGvOFb+7v/4BQ
 qYd51j64+UFrN8NUlRUuCxgkoc7hfaDGzu/5X8w/aSpdnnauUM+HI5gd+
 DbeDZLqrrl9gwdP9LVGEvnCmfv1/CDYmLQ2oN5e6qei+jhSu6l3ntWylw
 HpT30TnzjgTRLF/sLfpL1c6UR69Q9zILCsa6fkXIFAHvOBQwFHqSSbGhQ
 l6wqTnpBHUtY05I+TkuVM0hPeFn821+VQX5ZtN0qxo6k4LGBuZelGxjP4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528638"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772517052"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772517052"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:30 -0700
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v5 08/10] gna: add GNA_WAIT ioctl
Date: Thu, 20 Oct 2022 19:53:32 +0200
Message-Id: <20221020175334.1820519-9-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: linux-doc@vger.kernel.org,
 Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>,
 dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

Although the patch adds GNA_WAIT ioctl, it's main purpose is to provide FIFO
work-queue logic, which offloads each score operation in sequence to GNA
accelerator. When it's done, process(es) WAITing for score to be finished are
woken up.

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
Signed-off-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/Kbuild        |   2 +-
 drivers/gpu/drm/gna/gna_device.c  |  26 +++-
 drivers/gpu/drm/gna/gna_device.h  |  18 ++-
 drivers/gpu/drm/gna/gna_gem.h     |   3 +
 drivers/gpu/drm/gna/gna_hw.c      | 110 +++++++++++++++
 drivers/gpu/drm/gna/gna_hw.h      |  30 ++++
 drivers/gpu/drm/gna/gna_ioctl.c   |  93 +++++++++++++
 drivers/gpu/drm/gna/gna_mem.c     | 128 +++++++++++++++++
 drivers/gpu/drm/gna/gna_mem.h     |   6 +
 drivers/gpu/drm/gna/gna_pci.c     |  34 ++++-
 drivers/gpu/drm/gna/gna_request.c |  88 ++++++++++++
 drivers/gpu/drm/gna/gna_request.h |  17 +++
 drivers/gpu/drm/gna/gna_score.c   | 222 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_score.h   |  11 ++
 include/uapi/drm/gna_drm.h        |  49 +++++++
 15 files changed, 833 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/gna/gna_hw.c
 create mode 100644 drivers/gpu/drm/gna/gna_score.c
 create mode 100644 drivers/gpu/drm/gna/gna_score.h

diff --git a/drivers/gpu/drm/gna/Kbuild b/drivers/gpu/drm/gna/Kbuild
index 15c5e4fe7e4d..d799c9530f79 100644
--- a/drivers/gpu/drm/gna/Kbuild
+++ b/drivers/gpu/drm/gna/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-gna-y := gna_device.o gna_ioctl.o gna_mem.o gna_pci.o gna_request.o
+gna-y := gna_device.o gna_hw.o gna_ioctl.o gna_mem.o gna_pci.o gna_request.o gna_score.o
 
 obj-$(CONFIG_DRM_GNA) += gna.o
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index 0f8ec5a9dde4..2ef5be16dc9a 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
@@ -28,6 +29,7 @@ static const struct drm_ioctl_desc gna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(GNA_GEM_NEW, gna_gem_new_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(GNA_GEM_FREE, gna_gem_free_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(GNA_COMPUTE, gna_score_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(GNA_WAIT, gna_wait_ioctl, DRM_RENDER_ALLOW),
 };
 
 
@@ -47,6 +49,16 @@ static int gna_drm_dev_init(struct drm_device *dev)
 	return drmm_add_action_or_reset(dev, gna_drm_dev_fini, NULL);
 }
 
+static irqreturn_t gna_interrupt(int irq, void *priv)
+{
+	struct gna_device *gna_priv;
+
+	gna_priv = (struct gna_device *)priv;
+	gna_priv->dev_busy = false;
+	wake_up(&gna_priv->dev_busy_waitq);
+	return IRQ_HANDLED;
+}
+
 static void gna_workqueue_fini(struct drm_device *drm, void *data)
 {
 	struct workqueue_struct *request_wq = data;
@@ -96,7 +108,7 @@ static const struct drm_driver gna_drm_driver = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
 
-int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase)
+int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase, int irq)
 {
 	struct gna_device *gna_priv;
 	struct drm_device *drm_dev;
@@ -130,15 +142,27 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 
 	dev_dbg(parent, "maximum memory size %llu num pd %d\n",
 		gna_priv->info.max_hw_mem, gna_priv->info.num_pagetables);
+	dev_dbg(parent, "desc rsvd size %d mmu vamax size %d\n",
+		gna_priv->info.desc_info.rsvd_size,
+		gna_priv->info.desc_info.mmu_info.vamax_size);
+
+	mutex_init(&gna_priv->mmu_lock);
+
 	atomic_set(&gna_priv->request_count, 0);
 
 	mutex_init(&gna_priv->reqlist_lock);
 	INIT_LIST_HEAD(&gna_priv->request_list);
 
+	init_waitqueue_head(&gna_priv->dev_busy_waitq);
+
 	err = gna_workqueue_init(gna_priv);
 	if (err)
 		return err;
 
+	err = devm_request_irq(parent, irq, gna_interrupt,
+			IRQF_SHARED, gna_name(gna_priv), gna_priv);
+	if (err)
+		return err;
 
 	dev_set_drvdata(parent, drm_dev);
 
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index b628ffa9970f..ffdc3d1d1f87 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -35,12 +35,20 @@ struct gna_device {
 
 	int recovery_timeout_jiffies;
 
+	/* hardware status set by interrupt handler */
+	u32 hw_status;
+
 	/* device related resources */
 	void __iomem *iobase;
 	struct gna_dev_info info;
 	struct gna_hw_info hw_info;
 
 	struct gna_mmu_object mmu;
+	struct mutex mmu_lock;
+
+	/* if true, then gna device is processing */
+	bool dev_busy;
+	struct wait_queue_head dev_busy_waitq;
 
 	struct list_head request_list;
 	/* protects request_list */
@@ -52,7 +60,7 @@ struct gna_device {
 	atomic_t enqueued_requests;
 };
 
-int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
+int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase, int irq);
 int gna_getparam(struct gna_device *gna_priv, union gna_parameter *param);
 
 int gna_getparam_ioctl(struct drm_device *dev, void *data,
@@ -67,11 +75,19 @@ int gna_gem_free_ioctl(struct drm_device *dev, void *data,
 int gna_score_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
+int gna_wait_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file);
+
 static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
 {
 	return readl(gna_priv->iobase + reg);
 }
 
+static inline void gna_reg_write(struct gna_device *gna_priv, u32 reg, u32 val)
+{
+	writel(val, gna_priv->iobase + reg);
+}
+
 static inline const char *gna_name(struct gna_device *gna_priv)
 {
 	return gna_priv->drm.unique;
diff --git a/drivers/gpu/drm/gna/gna_gem.h b/drivers/gpu/drm/gna/gna_gem.h
index 18ffa8245380..92372fc93718 100644
--- a/drivers/gpu/drm/gna/gna_gem.h
+++ b/drivers/gpu/drm/gna/gna_gem.h
@@ -6,6 +6,7 @@
 
 #include <drm/drm_gem_shmem_helper.h>
 
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 struct gna_gem_object {
@@ -14,6 +15,8 @@ struct gna_gem_object {
 	uint32_t handle;
 
 	struct work_struct work;
+
+	struct wait_queue_head waitq;
 };
 
 #endif /* __GNA_GEM_H__ */
diff --git a/drivers/gpu/drm/gna/gna_hw.c b/drivers/gpu/drm/gna/gna_hw.c
new file mode 100644
index 000000000000..dff7c6b3edea
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_hw.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2017-2022 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/iopoll.h>
+
+#include <uapi/drm/gna_drm.h>
+
+#include "gna_device.h"
+#include "gna_hw.h"
+
+int gna_parse_hw_status(struct gna_device *gna_priv, u32 hw_status)
+{
+	if (hw_status & GNA_ERROR) {
+		dev_dbg(gna_dev(gna_priv), "GNA completed with errors: %#x\n", hw_status);
+		return -EIO;
+	}
+
+	if (hw_status & GNA_STS_SCORE_COMPLETED) {
+		dev_dbg(gna_dev(gna_priv), "GNA completed successfully: %#x\n", hw_status);
+		return 0;
+	}
+
+	dev_dbg(gna_dev(gna_priv), "GNA not completed, status: %#x\n", hw_status);
+	return -ENODATA;
+}
+
+void gna_print_error_status(struct gna_device *gna_priv, u32 hw_status)
+{
+	if (hw_status & GNA_STS_PARAM_OOR)
+		dev_dbg(gna_dev(gna_priv), "GNA error: Param Out Range Error\n");
+
+	if (hw_status & GNA_STS_VA_OOR)
+		dev_dbg(gna_dev(gna_priv), "GNA error: VA Out of Range Error\n");
+
+	if (hw_status & GNA_STS_PCI_MMU_ERR)
+		dev_dbg(gna_dev(gna_priv), "GNA error: PCI MMU Error\n");
+
+	if (hw_status & GNA_STS_PCI_DMA_ERR)
+		dev_dbg(gna_dev(gna_priv), "GNA error: PCI MMU Error\n");
+
+	if (hw_status & GNA_STS_PCI_UNEXCOMPL_ERR)
+		dev_dbg(gna_dev(gna_priv), "GNA error: PCI Unexpected Completion Error\n");
+
+	if (hw_status & GNA_STS_SATURATE)
+		dev_dbg(gna_dev(gna_priv), "GNA error: Saturation Reached !\n");
+}
+
+bool gna_hw_perf_enabled(struct gna_device *gna_priv)
+{
+	u32 ctrl = gna_reg_read(gna_priv, GNA_MMIO_CTRL);
+
+	return !!FIELD_GET(GNA_CTRL_COMP_STATS_EN, ctrl);
+}
+
+void gna_start_scoring(struct gna_device *gna_priv,
+		       struct gna_compute_cfg *compute_cfg)
+{
+	u32 ctrl = gna_reg_read(gna_priv, GNA_MMIO_CTRL);
+
+	ctrl |= GNA_CTRL_START_ACCEL | GNA_CTRL_COMP_INT_EN | GNA_CTRL_ERR_INT_EN;
+
+	ctrl &= ~GNA_CTRL_COMP_STATS_EN;
+	ctrl |= FIELD_PREP(GNA_CTRL_COMP_STATS_EN,
+			compute_cfg->hw_perf_encoding & FIELD_MAX(GNA_CTRL_COMP_STATS_EN));
+
+	ctrl &= ~GNA_CTRL_ACTIVE_LIST_EN;
+	ctrl |= FIELD_PREP(GNA_CTRL_ACTIVE_LIST_EN,
+			compute_cfg->active_list_on & FIELD_MAX(GNA_CTRL_ACTIVE_LIST_EN));
+
+	ctrl &= ~GNA_CTRL_OP_MODE;
+	ctrl |= FIELD_PREP(GNA_CTRL_OP_MODE,
+			compute_cfg->gna_mode & FIELD_MAX(GNA_CTRL_OP_MODE));
+
+	gna_reg_write(gna_priv, GNA_MMIO_CTRL, ctrl);
+}
+
+static void gna_clear_saturation(struct gna_device *gna_priv)
+{
+	u32 val;
+
+	val = gna_reg_read(gna_priv, GNA_MMIO_STS);
+	if (val & GNA_STS_SATURATE) {
+		dev_dbg(gna_dev(gna_priv), "status (saturation): %#x\n", val);
+
+		val = val & GNA_STS_SATURATE;
+		gna_reg_write(gna_priv, GNA_MMIO_STS, val);
+	}
+}
+
+int gna_abort_hw(struct gna_device *gna_priv)
+{
+	u32 val;
+
+	/* saturation bit in the GNA status register needs
+	 * to be explicitly cleared.
+	 */
+	gna_clear_saturation(gna_priv);
+
+	val = gna_reg_read(gna_priv, GNA_MMIO_STS);
+	dev_dbg(gna_dev(gna_priv), "status (before abort): %#x\n", val);
+
+	val = gna_reg_read(gna_priv, GNA_MMIO_CTRL);
+	val |= GNA_CTRL_ABORT_CLR_ACCEL;
+	gna_reg_write(gna_priv, GNA_MMIO_CTRL, val);
+
+	return readl_poll_timeout(gna_priv->iobase + GNA_MMIO_STS, val,
+				!(val & 0x1),
+				0, 1000);
+}
diff --git a/drivers/gpu/drm/gna/gna_hw.h b/drivers/gpu/drm/gna/gna_hw.h
index 514166a87c4d..97338e1be3b6 100644
--- a/drivers/gpu/drm/gna/gna_hw.h
+++ b/drivers/gpu/drm/gna/gna_hw.h
@@ -4,8 +4,12 @@
 #ifndef __GNA_HW_H__
 #define __GNA_HW_H__
 
+#include <linux/bits.h>
 #include <linux/mm_types.h>
 
+struct gna_compute_cfg;
+struct gna_device;
+
 #define GNA_FEATURES						\
 	.max_hw_mem = 256 * 1024 * 1024,			\
 		.num_pagetables = 64,				\
@@ -42,11 +46,30 @@
 #define GNA_DEV_HWID_MTL	0x7E4C
 
 /* GNA MMIO registers */
+#define GNA_MMIO_STS		0x80
+#define GNA_MMIO_CTRL		0x84
+#define GNA_MMIO_PTC		0x8C
+#define GNA_MMIO_PSC		0x90
+#define GNA_MMIO_D0I3C		0xA8
+#define GNA_MMIO_DESBASE	0xB0
 #define GNA_MMIO_IBUFFS		0xB4
 
+#define GNA_PT_ENTRY_SIZE		4
+/* there are up to 1024 32-bit pointers in one page in Page Table (L1) */
+#define GNA_PT_LENGTH           (PAGE_SIZE / GNA_PT_ENTRY_SIZE)
+
 #define GNA_PGDIRN_LEN			64
+#define GNA_PGDIR_ENTRIES		1024 /* 32-bit page addresses */
 #define GNA_PGDIR_INVALID		1
 
+#define GNA_CTRL_START_ACCEL		BIT(0)
+#define GNA_CTRL_ACTIVE_LIST_EN		BIT(1)
+#define GNA_CTRL_ABORT_CLR_ACCEL	BIT(2)
+#define GNA_CTRL_OP_MODE		GENMASK(6, 5)
+#define GNA_CTRL_COMP_INT_EN		BIT(8)
+#define GNA_CTRL_ERR_INT_EN		BIT(10)
+#define GNA_CTRL_COMP_STATS_EN		GENMASK(15, 12)
+
 struct gna_mmu_info {
 	u32 vamax_size;
 	u32 rsvd_size;
@@ -74,4 +97,11 @@ struct gna_dev_info {
 	struct gna_desc_info desc_info;
 };
 
+int gna_abort_hw(struct gna_device *gna_priv);
+bool gna_hw_perf_enabled(struct gna_device *gna_priv);
+int gna_parse_hw_status(struct gna_device *gna_priv, u32 hw_status);
+void gna_print_error_status(struct gna_device *gna_priv, u32 hw_status);
+void gna_start_scoring(struct gna_device *gna_priv,
+		struct gna_compute_cfg *compute_cfg);
+
 #endif // __GNA_HW_H__
diff --git a/drivers/gpu/drm/gna/gna_ioctl.c b/drivers/gpu/drm/gna/gna_ioctl.c
index ab3a2b789589..f3c805e946ee 100644
--- a/drivers/gpu/drm/gna/gna_ioctl.c
+++ b/drivers/gpu/drm/gna/gna_ioctl.c
@@ -5,6 +5,11 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_file.h>
 
+#include <linux/jiffies.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 #include <uapi/drm/gna_drm.h>
@@ -33,6 +38,86 @@ int gna_score_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
+static struct gna_request *gna_find_request_by_id(u64 req_id, struct gna_device *gna_priv)
+{
+	struct gna_request *req, *found_req;
+	struct list_head *reqs_list;
+
+	mutex_lock(&gna_priv->reqlist_lock);
+
+	reqs_list = &gna_priv->request_list;
+	found_req = NULL;
+	if (!list_empty(reqs_list)) {
+		list_for_each_entry(req, reqs_list, node) {
+			if (req_id == req->request_id) {
+				found_req = req;
+				kref_get(&found_req->refcount);
+				break;
+			}
+		}
+	}
+
+	mutex_unlock(&gna_priv->reqlist_lock);
+
+	return found_req;
+}
+
+int gna_wait_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct gna_device *gna_priv = to_gna_device(dev);
+	union gna_wait *wait_data = data;
+	struct gna_request *score_request;
+	u64 request_id;
+	u32 timeout;
+	int ret = 0;
+
+	request_id = wait_data->in.request_id;
+	timeout = wait_data->in.timeout;
+
+	score_request = gna_find_request_by_id(request_id, gna_priv);
+
+	if (!score_request) {
+		dev_dbg(gna_dev(gna_priv), "could not find request, id: %llu\n", request_id);
+		return -EINVAL;
+	}
+
+	if (score_request->drm_f != file) {
+		dev_dbg(gna_dev(gna_priv), "illegal file_priv: %p != %p\n", score_request->drm_f, file);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = wait_event_interruptible_timeout(score_request->waitq, score_request->state == DONE,
+					       msecs_to_jiffies(timeout));
+	if (ret == 0 || ret == -ERESTARTSYS) {
+		dev_dbg(gna_dev(gna_priv), "request timed out, id: %llu\n", request_id);
+		ret = -EBUSY;
+		goto out;
+	}
+
+	wait_data->out.hw_perf = score_request->hw_perf;
+	wait_data->out.drv_perf = score_request->drv_perf;
+	wait_data->out.hw_status = score_request->hw_status;
+
+	ret = score_request->status;
+
+	dev_dbg(gna_dev(gna_priv), "request status: %d, hw status: %#x\n",
+		score_request->status, score_request->hw_status);
+
+	cancel_work_sync(&score_request->work);
+	mutex_lock(&gna_priv->reqlist_lock);
+	if (!list_empty(&score_request->node)) {
+		list_del_init(&score_request->node);
+		kref_put(&score_request->refcount, gna_request_release); // due to gna_priv->request_list removal!
+	}
+	mutex_unlock(&gna_priv->reqlist_lock);
+
+out:
+	kref_put(&score_request->refcount, gna_request_release);
+	return ret;
+}
+
 int gna_gem_free_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -49,10 +134,16 @@ int gna_gem_free_ioctl(struct drm_device *dev, void *data,
 	gnagemo = to_gna_gem_obj(to_drm_gem_shmem_obj(drmgemo));
 
 	queue_work(gna_priv->request_wq, &gnagemo->work);
+	if (wait_event_interruptible(gnagemo->waitq, true)) {
+		ret = -ERESTARTSYS;
+		goto out;
+	}
+
 	cancel_work_sync(&gnagemo->work);
 
 	ret = drm_gem_handle_delete(file, args->handle);
 
+out:
 	drm_gem_object_put(drmgemo);
 	return ret;
 }
@@ -111,5 +202,7 @@ int gna_gem_new_ioctl(struct drm_device *dev, void *data,
 	gnagemo->handle = args->out.handle;
 
 	INIT_WORK(&gnagemo->work, gna_gem_obj_release_work);
+	init_waitqueue_head(&gnagemo->waitq);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/gna/gna_mem.c b/drivers/gpu/drm/gna/gna_mem.c
index 54c5a4d68d06..8719c3195fce 100644
--- a/drivers/gpu/drm/gna/gna_mem.c
+++ b/drivers/gpu/drm/gna/gna_mem.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2017-2022 Intel Corporation
 
+#include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 
@@ -12,6 +13,10 @@
 #include <linux/math.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 #include "gna_device.h"
@@ -85,6 +90,127 @@ int gna_mmu_init(struct gna_device *gna_priv)
 	return 0;
 }
 
+static struct scatterlist *gna_iterate_sgl(u64 sg_elems, struct scatterlist *sgl, dma_addr_t *sg_page,
+					int *sg_page_len, int *sg_pages)
+{
+	while (sg_elems-- > 0) {
+		(*sg_page) += PAGE_SIZE;
+		(*sg_pages)++;
+		if (*sg_pages == *sg_page_len) {
+			sgl = sg_next(sgl);
+			if (!sgl)
+				break;
+
+			*sg_page = sg_dma_address(sgl);
+			*sg_page_len =
+				round_up(sg_dma_len(sgl), PAGE_SIZE)
+				>> PAGE_SHIFT;
+			*sg_pages = 0;
+		}
+	}
+
+	return sgl;
+}
+
+
+void gna_mmu_add(struct gna_device *gna_priv, struct drm_gem_shmem_object *drmshmemo)
+{
+	struct gna_mmu_object *mmu;
+	struct scatterlist *sgl;
+	dma_addr_t sg_page;
+	int sg_page_len;
+	u32 *pagetable;
+	u32 mmu_page;
+	int sg_pages;
+	int i;
+	int j;
+
+	mmu = &gna_priv->mmu;
+	mutex_lock(&gna_priv->mmu_lock);
+
+	j = mmu->filled_pages;
+	sgl = drmshmemo->sgt->sgl;
+
+	if (!sgl) {
+		dev_warn(gna_dev(gna_priv), "empty scatter list in memory object\n");
+		goto warn_empty_sgl;
+	}
+	sg_page = sg_dma_address(sgl);
+	sg_page_len = round_up(sg_dma_len(sgl), PAGE_SIZE) >> PAGE_SHIFT;
+	sg_pages = 0;
+
+	for (i = mmu->filled_pts; i < mmu->num_pagetables; i++) {
+		if (!sgl)
+			break;
+
+		pagetable = mmu->pagetables[i];
+
+		for (j = mmu->filled_pages; j < GNA_PT_LENGTH; j++) {
+			mmu_page = sg_page >> PAGE_SHIFT;
+			pagetable[j] = mmu_page;
+
+			mmu->filled_pages++;
+
+			sgl = gna_iterate_sgl(1, sgl, &sg_page, &sg_page_len,
+					&sg_pages);
+			if (!sgl)
+				break;
+		}
+
+		if (j == GNA_PT_LENGTH) {
+			mmu->filled_pages = 0;
+			mmu->filled_pts++;
+		}
+	}
+
+	mmu->hwdesc->mmu.vamaxaddr =
+		(mmu->filled_pts * PAGE_SIZE * GNA_PGDIR_ENTRIES) +
+		(mmu->filled_pages * PAGE_SIZE) - 1;
+	dev_dbg(gna_dev(gna_priv), "vamaxaddr: %u\n", mmu->hwdesc->mmu.vamaxaddr);
+
+warn_empty_sgl:
+	mutex_unlock(&gna_priv->mmu_lock);
+}
+
+void gna_mmu_clear(struct gna_device *gna_priv)
+{
+	struct gna_mmu_object *mmu;
+	int i;
+
+	mmu = &gna_priv->mmu;
+	mutex_lock(&gna_priv->mmu_lock);
+
+	for (i = 0; i < mmu->filled_pts; i++)
+		memset(mmu->pagetables[i], 0, PAGE_SIZE);
+
+	if (mmu->filled_pages > 0)
+		memset(mmu->pagetables[mmu->filled_pts], 0, mmu->filled_pages * GNA_PT_ENTRY_SIZE);
+
+	mmu->filled_pts = 0;
+	mmu->filled_pages = 0;
+	mmu->hwdesc->mmu.vamaxaddr = 0;
+
+	mutex_unlock(&gna_priv->mmu_lock);
+}
+
+bool gna_gem_object_put_pages_sgt(struct gna_gem_object *gnagemo)
+{
+	struct drm_gem_shmem_object *shmem = &gnagemo->base;
+	struct drm_gem_object *drmgemo = &shmem->base;
+
+	if (!mutex_trylock(&shmem->pages_lock))
+		return false;
+	dma_unmap_sgtable(drmgemo->dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(shmem->sgt);
+	kfree(shmem->sgt);
+	shmem->sgt = NULL;
+	mutex_unlock(&shmem->pages_lock);
+
+	drm_gem_shmem_put_pages(shmem);
+
+	return true;
+}
+
 static void gna_delete_score_requests(u32 handle, struct gna_device *gna_priv)
 {
 	struct gna_request *req, *temp_req;
@@ -118,4 +244,6 @@ void gna_gem_obj_release_work(struct work_struct *work)
 	gnagemo = container_of(work, struct gna_gem_object, work);
 
 	gna_delete_score_requests(gnagemo->handle, to_gna_device(gnagemo->base.base.dev));
+
+	wake_up_interruptible(&gnagemo->waitq);
 }
diff --git a/drivers/gpu/drm/gna/gna_mem.h b/drivers/gpu/drm/gna/gna_mem.h
index 9d8251900231..92193f9d608d 100644
--- a/drivers/gpu/drm/gna/gna_mem.h
+++ b/drivers/gpu/drm/gna/gna_mem.h
@@ -47,6 +47,12 @@ struct gna_mmu_object {
 
 int gna_mmu_init(struct gna_device *gna_priv);
 
+void gna_mmu_add(struct gna_device *gna_priv, struct drm_gem_shmem_object *drmshmemo);
+
+void gna_mmu_clear(struct gna_device *gna_priv);
+
+bool gna_gem_object_put_pages_sgt(struct gna_gem_object *gna_obj);
+
 void gna_gem_obj_release_work(struct work_struct *work);
 
 #endif // __GNA_MEM_H__
diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
index 9a6c82362e32..034554b417a8 100644
--- a/drivers/gpu/drm/gna/gna_pci.c
+++ b/drivers/gpu/drm/gna/gna_pci.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2017-2022 Intel Corporation
 
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 
@@ -75,10 +76,33 @@ static const struct pci_device_id gna_pci_ids[] = {
 	{ }
 };
 
+static void gna_irq_vectors_fini(void *data)
+{
+	struct pci_dev *pcidev = data;
+
+	pci_free_irq_vectors(pcidev);
+}
+
+static int gna_irq_vectors_init(struct pci_dev *pcidev)
+{
+	int ret;
+
+	ret = pci_alloc_irq_vectors(pcidev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_add_action(&pcidev->dev, gna_irq_vectors_fini, pcidev);
+	if (ret)
+		gna_irq_vectors_fini(pcidev);
+
+	return ret;
+}
+
 int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 {
 	struct gna_dev_info *dev_info;
 	void __iomem *iobase;
+	int irq;
 	int err;
 
 	err = pcim_enable_device(pcidev);
@@ -93,9 +117,17 @@ int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 
 	pci_set_master(pcidev);
 
+	err = gna_irq_vectors_init(pcidev);
+	if (err < 0)
+		return err;
+
+	irq = pci_irq_vector(pcidev, 0);
+	if (irq < 0)
+		return irq;
+
 	dev_info = (struct gna_dev_info *)pci_id->driver_data;
 
-	err = gna_probe(&pcidev->dev, dev_info, iobase);
+	err = gna_probe(&pcidev->dev, dev_info, iobase, irq);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/gna/gna_request.c b/drivers/gpu/drm/gna/gna_request.c
index 7151d7c2b353..9efaea61ac68 100644
--- a/drivers/gpu/drm/gna/gna_request.c
+++ b/drivers/gpu/drm/gna/gna_request.c
@@ -12,10 +12,14 @@
 #include <linux/math.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/timekeeping.h>
 #include <linux/uaccess.h>
 
 #include "gna_device.h"
+#include "gna_hw.h"
+#include "gna_mem.h"
 #include "gna_request.h"
+#include "gna_score.h"
 
 int gna_validate_score_config(struct gna_compute_cfg *compute_cfg,
 			struct gna_device *gna_priv)
@@ -45,6 +49,38 @@ int gna_validate_score_config(struct gna_compute_cfg *compute_cfg,
 	return 0;
 }
 
+static void gna_request_update_status(struct gna_request *score_request)
+{
+	struct gna_device *gna_priv = to_gna_device(score_request->drm_f->minor->dev);
+	/* The gna_priv's hw_status should be updated first */
+	u32 hw_status = gna_priv->hw_status;
+	u32 stall_cycles;
+	u32 total_cycles;
+
+	/* Technically, the time stamp can be a bit later than
+	 * when the hw actually completed scoring. Here we just
+	 * do our best in a deferred work, unless we want to
+	 * tax isr for a more accurate record.
+	 */
+	score_request->drv_perf.hw_completed = ktime_get_ns();
+
+	score_request->hw_status = hw_status;
+
+	score_request->status = gna_parse_hw_status(gna_priv, hw_status);
+
+	if (gna_hw_perf_enabled(gna_priv)) {
+		if (hw_status & GNA_STS_STATISTICS_VALID) {
+			total_cycles = gna_reg_read(gna_priv, GNA_MMIO_PTC);
+			stall_cycles = gna_reg_read(gna_priv, GNA_MMIO_PSC);
+			score_request->hw_perf.total = total_cycles;
+			score_request->hw_perf.stall = stall_cycles;
+		} else
+			dev_warn(gna_dev(gna_priv), "GNA statistics missing\n");
+	}
+	if (unlikely(hw_status & GNA_ERROR))
+		gna_print_error_status(gna_priv, hw_status);
+}
+
 static void gna_request_make_zombie(struct gna_request *score_request)
 {
 	int i;
@@ -60,15 +96,64 @@ static void gna_request_make_zombie(struct gna_request *score_request)
 
 static void gna_request_process(struct work_struct *work)
 {
+	struct gna_buffer_with_object *buffer;
 	struct gna_request *score_request;
 	struct gna_device *gna_priv;
+	unsigned long hw_timeout;
+	int ret;
+	u64 i;
 
 	score_request = container_of(work, struct gna_request, work);
 	gna_priv = to_gna_device(score_request->drm_f->minor->dev);
 
+	score_request->state = ACTIVE;
+
+	score_request->drv_perf.pre_processing = ktime_get_ns();
+
+	/* Set busy flag before kicking off HW. The isr will clear it and wake up us. There is
+	 * no difference if isr is missed in a timeout situation of the last request. We just
+	 * always set it busy and let the wait_event_timeout check the reset.
+	 * wq:  X -> true
+	 * isr: X -> false
+	 */
+	gna_priv->dev_busy = true;
+
+	ret = gna_score(score_request);
+	if (ret) {
+		score_request->status = ret;
+		goto tail;
+	}
+
+	score_request->drv_perf.processing = ktime_get_ns();
+
+	hw_timeout = gna_priv->recovery_timeout_jiffies;
+
+	hw_timeout = wait_event_timeout(gna_priv->dev_busy_waitq,
+			!gna_priv->dev_busy, hw_timeout);
+
+	if (!hw_timeout)
+		dev_warn(gna_dev(gna_priv), "hardware timeout occurred\n");
+
+	gna_priv->hw_status = gna_reg_read(gna_priv, GNA_MMIO_STS);
+
+	gna_request_update_status(score_request);
+
+	ret = gna_abort_hw(gna_priv);
+	if (ret < 0 && score_request->status == 0)
+		score_request->status = ret; // -ETIMEDOUT
+
+	gna_mmu_clear(gna_priv);
+
+	for (i = 0, buffer = score_request->buffer_list; i < score_request->buffer_count; i++, buffer++)
+		gna_gem_object_put_pages_sgt(buffer->gem);
+
+tail:
+	score_request->drv_perf.completion = ktime_get_ns();
+	score_request->state = DONE;
 	gna_request_make_zombie(score_request);
 
 	atomic_dec(&gna_priv->enqueued_requests);
+	wake_up_interruptible_all(&score_request->waitq);
 }
 
 static struct gna_request *gna_request_create(struct drm_file *file,
@@ -92,6 +177,8 @@ static struct gna_request *gna_request_create(struct drm_file *file,
 	score_request->request_id = atomic_inc_return(&gna_priv->request_count);
 	score_request->compute_cfg = *compute_cfg;
 	score_request->drm_f = file;
+	score_request->state = NEW;
+	init_waitqueue_head(&score_request->waitq);
 	INIT_WORK(&score_request->work, gna_request_process);
 	INIT_LIST_HEAD(&score_request->node);
 
@@ -334,5 +421,6 @@ void gna_request_release(struct kref *ref)
 	struct gna_request *score_request =
 		container_of(ref, struct gna_request, refcount);
 	gna_request_make_zombie(score_request);
+	wake_up_interruptible_all(&score_request->waitq);
 	kfree(score_request);
 }
diff --git a/drivers/gpu/drm/gna/gna_request.h b/drivers/gpu/drm/gna/gna_request.h
index 432c30863e7e..d056e70fb369 100644
--- a/drivers/gpu/drm/gna/gna_request.h
+++ b/drivers/gpu/drm/gna/gna_request.h
@@ -6,6 +6,7 @@
 
 #include <linux/kref.h>
 #include <linux/types.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 #include <uapi/drm/gna_drm.h>
@@ -14,6 +15,12 @@ struct gna_device;
 struct gna_gem_object;
 struct drm_file;
 
+enum gna_request_state {
+	NEW,
+	ACTIVE,
+	DONE,
+};
+
 struct gna_buffer_with_object {
 	struct gna_buffer gna;
 	struct gna_gem_object *gem;
@@ -26,6 +33,15 @@ struct gna_request {
 
 	struct drm_file *drm_f;
 
+	u32 hw_status;
+
+	enum gna_request_state state;
+
+	int status;
+
+	struct gna_hw_perf hw_perf;
+	struct gna_drv_perf drv_perf;
+
 	struct list_head node;
 
 	struct gna_compute_cfg compute_cfg;
@@ -34,6 +50,7 @@ struct gna_request {
 	u64 buffer_count;
 
 	struct work_struct work;
+	struct wait_queue_head waitq;
 };
 
 int gna_validate_score_config(struct gna_compute_cfg *compute_cfg,
diff --git a/drivers/gpu/drm/gna/gna_score.c b/drivers/gpu/drm/gna/gna_score.c
new file mode 100644
index 000000000000..529270657a83
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_score.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2017-2022 Intel Corporation
+
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/math.h>
+#include <linux/mm.h>
+#include <linux/scatterlist.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include <uapi/drm/gna_drm.h>
+
+#include "../drm_internal.h"
+
+#include "gna_device.h"
+#include "gna_gem.h"
+#include "gna_hw.h"
+#include "gna_mem.h"
+#include "gna_request.h"
+#include "gna_score.h"
+
+static int gna_do_patch_memory(struct gna_device *gna_priv,
+			       struct gna_memory_patch *patch, void *vaddr)
+{
+	size_t size;
+	void *dest;
+	u64 value;
+
+	value = patch->value;
+	size = patch->size;
+	dest = (u8 *)vaddr + patch->offset;
+
+	switch (size) {
+	case 0:
+		return -EFAULT;
+	case sizeof(u8):
+		*((u8 *)dest) = (u8)value;
+		break;
+	case sizeof(u16):
+		*((u16 *)dest) = (u16)value;
+		break;
+	case sizeof(u32):
+		*((u32 *)dest) = (u32)value;
+		break;
+	case sizeof(u64):
+		*((u64 *)dest) = (u64)value;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gna_patch_memory(struct gna_device *gna_priv, struct gna_buffer_with_object *buffer)
+{
+	struct drm_gem_shmem_object *drmshmemo = &buffer->gem->base;
+	struct gna_gem_object *gnagemo = buffer->gem;
+	struct gna_buffer *gnab = &buffer->gna;
+	struct gna_memory_patch *patch;
+	struct iosys_map vmap;
+	struct sg_table *sgt;
+	int ret = 0;
+	u32 i;
+
+	dev_dbg(gna_dev(gna_priv), "handle: %u, patch_count, %llu\n",
+		gnab->handle, gnab->patch_count);
+
+	sgt = drm_gem_shmem_get_pages_sgt(drmshmemo);
+
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err;
+	}
+
+	if (gnab->patch_count) {
+		ret = drm_gem_vmap(&drmshmemo->base, &vmap);
+
+		if (ret)
+			goto err_pages_sgt;
+
+		patch = (struct gna_memory_patch *)(uintptr_t)gnab->patches_ptr;
+		for (i = 0; i < gnab->patch_count; i++, patch++) {
+			ret = gna_do_patch_memory(gna_priv, patch, vmap.vaddr);
+			if (ret)
+				break;
+		}
+
+		kvfree((void *)(uintptr_t)gnab->patches_ptr);
+		gnab->patches_ptr = 0;
+		drm_gem_vunmap(&drmshmemo->base, &vmap);
+		if (ret) // ret from gna_do_patch_memory
+			goto err_pages_sgt;
+	}
+
+	gna_mmu_add(gna_priv, drmshmemo);
+
+	return 0;
+
+err_pages_sgt:
+	gna_gem_object_put_pages_sgt(gnagemo);
+err:
+	return ret;
+}
+
+static struct gna_buffer_with_object *gna_find_buffer(struct gna_buffer_with_object *buffer_list,
+						u32 buffer_count, u32 mmu_offset, u32 *memory_offset)
+{
+	struct gna_buffer_with_object *buffer;
+	u32 memory_size;
+	u32 offset;
+	u32 i;
+
+	offset = 0;
+	for (i = 0; i < buffer_count; i++) {
+		buffer = buffer_list + i;
+		memory_size = round_up(buffer->gna.size, PAGE_SIZE);
+		if (mmu_offset < offset + memory_size) {
+			*memory_offset = offset;
+			return buffer;
+		}
+		offset += memory_size;
+	}
+
+	return NULL;
+}
+
+static int gna_copy_gmm_config(struct gna_device *gna_priv,
+			struct gna_buffer_with_object *buffer_list,
+			u32 buffer_count, u32 mmu_offset)
+{
+	struct gna_buffer_with_object *buffer;
+	struct gna_hw_descriptor *hwdesc;
+	struct drm_gem_object *drmgemo;
+	struct gna_mmu_object *mmu;
+	struct iosys_map vmap;
+	u32 memory_offset;
+	u8 *gmm_desc;
+	int ret = 0;
+
+	mmu = &gna_priv->mmu;
+	hwdesc = mmu->hwdesc;
+
+	buffer = gna_find_buffer(buffer_list, buffer_count, mmu_offset, &memory_offset);
+	if (!buffer)
+		return -EINVAL;
+
+	drmgemo = &buffer->gem->base.base;
+
+	ret = drm_gem_vmap(drmgemo, &vmap);
+
+	if (!ret) {
+		ret = -ENOMEM;
+		return ret;
+	}
+
+	gmm_desc = (u8 *)vmap.vaddr + (mmu_offset - memory_offset);
+	memcpy(&hwdesc->xnn_config, gmm_desc, sizeof(struct gna_xnn_descriptor));
+	drm_gem_vunmap(drmgemo, &vmap);
+
+	return 0;
+}
+
+int gna_score(struct gna_request *score_request)
+{
+	struct gna_buffer_with_object *buffer;
+	struct gna_xnn_descriptor *xnn_config;
+	struct gna_compute_cfg *compute_cfg;
+	struct gna_device *gna_priv;
+	struct gna_mmu_object *mmu;
+	u64 buffer_count;
+	u32 desc_base;
+	int ret;
+	u64 i;
+
+	ret = 0;
+
+	gna_priv = to_gna_device(score_request->drm_f->minor->dev);
+
+	mmu = &gna_priv->mmu;
+	xnn_config = &mmu->hwdesc->xnn_config;
+	compute_cfg = &score_request->compute_cfg;
+
+	buffer_count = score_request->buffer_count;
+
+	for (i = 0, buffer = score_request->buffer_list; i < buffer_count; i++, buffer++) {
+		ret = gna_patch_memory(gna_priv, buffer);
+		if (ret)
+			goto err;
+	}
+
+	switch (compute_cfg->gna_mode) {
+	case GNA_MODE_XNN:
+		dev_dbg(gna_dev(gna_priv), "xNN mode; labase: %d, lacount: %d\n",
+			compute_cfg->layer_base, compute_cfg->layer_count);
+		xnn_config->labase = compute_cfg->layer_base;
+		xnn_config->lacount = compute_cfg->layer_count;
+		break;
+	case GNA_MODE_GMM:
+		dev_dbg(gna_dev(gna_priv), "GMM mode; offset: %d\n", compute_cfg->layer_base);
+		ret = gna_copy_gmm_config(gna_priv, score_request->buffer_list,
+					buffer_count, compute_cfg->layer_base);
+		if (ret)
+			goto err;
+		break;
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+	desc_base = (u32)(mmu->hwdesc_dma >> PAGE_SHIFT);
+	gna_reg_write(gna_priv, GNA_MMIO_DESBASE, desc_base);
+
+	gna_start_scoring(gna_priv, compute_cfg);
+
+err:
+	return ret;
+}
diff --git a/drivers/gpu/drm/gna/gna_score.h b/drivers/gpu/drm/gna/gna_score.h
new file mode 100644
index 000000000000..5b154d3623e0
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_score.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_SCORE_H__
+#define __GNA_SCORE_H__
+
+struct gna_request;
+
+int gna_score(struct gna_request *score_request);
+
+#endif // __GNA_SCORE_H__
diff --git a/include/uapi/drm/gna_drm.h b/include/uapi/drm/gna_drm.h
index aaae9a46dec5..677343d88987 100644
--- a/include/uapi/drm/gna_drm.h
+++ b/include/uapi/drm/gna_drm.h
@@ -20,6 +20,22 @@
 #define GNA_PARAM_INPUT_BUFFER_S	3
 #define GNA_PARAM_DDI_VERSION		4
 
+#define GNA_STS_SCORE_COMPLETED		_BITUL(0)
+#define GNA_STS_STATISTICS_VALID	_BITUL(3)
+#define GNA_STS_PCI_MMU_ERR		_BITUL(4)
+#define GNA_STS_PCI_DMA_ERR		_BITUL(5)
+#define GNA_STS_PCI_UNEXCOMPL_ERR	_BITUL(6)
+#define GNA_STS_VA_OOR			_BITUL(7)
+#define GNA_STS_PARAM_OOR		_BITUL(8)
+#define GNA_STS_SATURATE		_BITUL(17)
+
+#define GNA_ERROR			\
+	(GNA_STS_PCI_DMA_ERR		|\
+	 GNA_STS_PCI_MMU_ERR		|\
+	 GNA_STS_PCI_UNEXCOMPL_ERR	|\
+	 GNA_STS_PARAM_OOR		|\
+	 GNA_STS_VA_OOR)
+
 #define GNA_DEV_TYPE_0_9	0x09
 #define GNA_DEV_TYPE_1_0	0x10
 #define GNA_DEV_TYPE_2_0	0x20
@@ -50,6 +66,22 @@ struct gna_buffer {
 	__u64 patches_ptr;
 };
 
+/*
+ * Driver performance timestamps in nanoseconds.
+ * Values regard system boot time, but do not count during suspend.
+ */
+struct gna_drv_perf {
+	__u64 pre_processing;	/* driver starts pre-processing */
+	__u64 processing;	/* hw starts processing */
+	__u64 hw_completed;	/* hw finishes processing */
+	__u64 completion;	/* driver finishes post-processing */
+};
+
+struct gna_hw_perf {
+	__u64 total;
+	__u64 stall;
+};
+
 struct gna_compute_cfg {
 	__u32 layer_base;
 	__u32 layer_count;
@@ -88,6 +120,21 @@ union gna_compute {
 	} out;
 };
 
+union gna_wait {
+	struct {
+		__u64 request_id;
+		__u32 timeout;
+		__u32 pad;
+	} in;
+
+	struct {
+		__u32 hw_status;
+		__u32 pad;
+		struct gna_drv_perf drv_perf;
+		struct gna_hw_perf hw_perf;
+	} out;
+};
+
 struct gna_mem_id {
 	__u32 handle;
 	__u32 pad;
@@ -111,10 +158,12 @@ struct gna_gem_free {
 #define DRM_GNA_GEM_NEW			0x01
 #define DRM_GNA_GEM_FREE		0x02
 #define DRM_GNA_COMPUTE			0x03
+#define DRM_GNA_WAIT			0x04
 
 #define DRM_IOCTL_GNA_GET_PARAMETER	DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GET_PARAMETER, union gna_parameter)
 #define DRM_IOCTL_GNA_GEM_NEW		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GEM_NEW, union gna_gem_new)
 #define DRM_IOCTL_GNA_GEM_FREE		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GEM_FREE, struct gna_gem_free)
 #define DRM_IOCTL_GNA_COMPUTE		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_COMPUTE, union gna_compute)
+#define DRM_IOCTL_GNA_WAIT		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_WAIT, union gna_wait)
 
 #endif /* _GNA_DRM_H_ */
-- 
2.25.1

