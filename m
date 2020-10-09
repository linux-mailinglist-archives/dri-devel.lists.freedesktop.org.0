Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407FE28909D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 20:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C63E6ED83;
	Fri,  9 Oct 2020 18:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30036ED7D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 18:12:05 +0000 (UTC)
IronPort-SDR: 4A0i/P6igbmF7sIsyvgSKu410Rn5lKa5Yn+hJLUumgFzPF3svZg76Bh3DSNA52m4ApWcvvG+V5
 OEyoKipAanDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165633820"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165633820"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 11:12:05 -0700
IronPort-SDR: EL25qh80W5rSGEAZi/E8d3ZVKwdfbCRYfKAbFbtR6SJqTBDjDOl/UpSVkAF5/+uWvWKypLY4c3
 gH11strII6WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="518774965"
Received: from kkang6-desktop.kssm.intel.com ([172.21.194.67])
 by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2020 11:12:04 -0700
From: kuhanh.murugasen.krishnan@intel.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/4] drm: hantro: Keem Bay VPU DRM decoder
Date: Fri,  9 Oct 2020 19:57:54 +0800
Message-Id: <1602244675-8785-4-git-send-email-kuhanh.murugasen.krishnan@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
References: <1602244675-8785-1-git-send-email-kuhanh.murugasen.krishnan@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Murugasen Krishnan, Kuhanh" <kuhanh.murugasen.krishnan@intel.com>

Hantro VC8000D allows 4K decoding with a minimal silicon single-core solution that
supports HEVC and H.264 video formats, key features:
* HEVC Main10 and Main Profiles up to Level 5.2
* HEVC Main Still Profile
* H.264 Main and High Profiles up to Level 5.2
* HEVC, H.264 and JPEG decoding up to 4K@60fps
* 8 channels 1080p@30fps decoding

Signed-off-by: Murugasen Krishnan, Kuhanh <kuhanh.murugasen.krishnan@intel.com>
---
 drivers/gpu/drm/hantro/hantro_dec.c      | 1441 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/hantro/hantro_dec.h      |   59 ++
 drivers/gpu/drm/hantro/hantro_dwl_defs.h |  101 +++
 3 files changed, 1601 insertions(+)
 create mode 100644 drivers/gpu/drm/hantro/hantro_dec.c
 create mode 100644 drivers/gpu/drm/hantro/hantro_dec.h
 create mode 100644 drivers/gpu/drm/hantro/hantro_dwl_defs.h

diff --git a/drivers/gpu/drm/hantro/hantro_dec.c b/drivers/gpu/drm/hantro/hantro_dec.c
new file mode 100644
index 0000000..ac501f3
--- /dev/null
+++ b/drivers/gpu/drm/hantro/hantro_dec.c
@@ -0,0 +1,1441 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *    Hantro decoder hardware driver.
+ *
+ *    Copyright (c) 2017 - 2020, VeriSilicon Inc.
+ *    Copyright (c) 2020 Intel Corporation
+ */
+
+#include "hantro_dec.h"
+#include "hantro_dwl_defs.h"
+#include <linux/io.h>
+#include <linux/uaccess.h>
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+#include <linux/sched.h>
+#include <linux/semaphore.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/version.h>
+#include <linux/wait.h>
+#include <linux/timer.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/clk.h>
+
+static const int dec_hwid[] = {
+	0x8001 /* VDEC */
+};
+
+ulong multicorebase[HXDEC_MAX_CORES] = {
+	SOCLE_LOGIC_0_BASE,
+	SOCLE_LOGIC_1_BASE
+};
+
+int irq[HXDEC_MAX_CORES] = {
+	DEC_IRQ_0,
+	DEC_IRQ_1
+};
+
+unsigned int iosize[HXDEC_MAX_CORES] = {
+	DEC_IO_SIZE_0,
+	DEC_IO_SIZE_1
+};
+
+/* KMB page lookup table */
+static unsigned long page_lut_read = KMB_VC8000D_PAGE_LUT;
+static u8 *page_lut_regs_read;
+
+/*
+ * Because one core may contain multi-pipeline,
+ * so multicore base may be changed
+ */
+unsigned long multicorebase_actual[HXDEC_MAX_CORES];
+int elements = 2;
+static struct device *parent_dev;
+
+struct hantrodec_t {
+	char *buffer;
+	unsigned int iosize[HXDEC_MAX_CORES];
+	u8 *hwregs[HXDEC_MAX_CORES];
+	int irq[HXDEC_MAX_CORES];
+	int hw_id[HXDEC_MAX_CORES];
+	int cores;
+	struct fasync_struct *async_queue_dec;
+	struct fasync_struct *async_queue_pp;
+};
+
+struct core_cfg {
+	/* indicate the supported format */
+	u32 cfg[HXDEC_MAX_CORES];
+	/* back up of cfg */
+	u32 cfg_backup[HXDEC_MAX_CORES];
+	/* indicate if main core exist */
+	int its_main_core_id[HXDEC_MAX_CORES];
+	/* indicate if aux core exist */
+	int its_aux_core_id[HXDEC_MAX_CORES];
+};
+
+static struct hantrodec_t hantrodec_data;
+static int reserve_io(void);
+static void release_io(void);
+static void reset_asic(struct hantrodec_t *dev);
+
+#ifdef HANTRODEC_DEBUG
+static void dump_regs(struct hantrodec_t *dev);
+#endif
+
+/* IRQ handler */
+static irqreturn_t hantrodec_isr(int irq, void *dev_id);
+static u32 dec_regs[HXDEC_MAX_CORES][DEC_IO_SIZE_MAX / 4];
+struct semaphore dec_core_sem;
+struct semaphore pp_core_sem;
+static int dec_irq;
+static int pp_irq;
+
+atomic_t irq_rx = ATOMIC_INIT(0);
+atomic_t irq_tx = ATOMIC_INIT(0);
+
+static struct file *dec_owner[HXDEC_MAX_CORES];
+static struct file *pp_owner[HXDEC_MAX_CORES];
+static int core_has_format(const u32 *cfg, int core, u32 format);
+
+static DEFINE_SPINLOCK(owner_lock);
+static DECLARE_WAIT_QUEUE_HEAD(dec_wait_queue);
+static DECLARE_WAIT_QUEUE_HEAD(pp_wait_queue);
+static DECLARE_WAIT_QUEUE_HEAD(hw_queue);
+
+static struct core_cfg config;
+static u32 timeout;
+
+static struct clk *hantro_clk_xin_vdec;
+static struct clk *hantro_clk_vdec;
+
+static int hantro_clk_enable(void)
+{
+	clk_prepare_enable(hantro_clk_xin_vdec);
+	clk_prepare_enable(hantro_clk_vdec);
+
+	return 0;
+}
+
+static int hantro_clk_disable(void)
+{
+	if (hantro_clk_xin_vdec)
+		clk_disable_unprepare(hantro_clk_xin_vdec);
+
+	if (hantro_clk_vdec)
+		clk_disable_unprepare(hantro_clk_vdec);
+
+	return 0;
+}
+
+u32 hantrodec_readbandwidth(int is_read_bw)
+{
+	int i;
+	u32 bandwidth = 0;
+	struct hantrodec_t *dev = &hantrodec_data;
+
+	for (i = 0; i < hantrodec_data.cores; i++) {
+		if (is_read_bw)
+			bandwidth +=
+				ioread32((void *)(dev->hwregs[i] +
+						  HANTRO_VC8KD_REG_BWREAD * 4));
+		else
+			bandwidth += ioread32
+				((void *)(dev->hwregs[i] +
+					 HANTRO_VC8KD_REG_BWWRITE * 4));
+	}
+
+	return bandwidth * VC8KD_BURSTWIDTH;
+}
+
+static void read_core_config(struct hantrodec_t *dev)
+{
+	int c;
+	u32 reg, tmp, mask;
+
+	memset(config.cfg, 0, sizeof(config.cfg));
+
+	for (c = 0; c < dev->cores; c++) {
+		/* Decoder configuration */
+		if ((IS_VC8000D(dev->hw_id[c])) &&
+		    config.its_main_core_id[c] < 0) {
+			reg = ioread32((void *)(dev->hwregs[c] +
+						HANTRODEC_SYNTH_CFG * 4));
+
+			tmp = (reg >> DWL_H264_E) & 0x3U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has H264\n", c);
+			config.cfg[c] |=
+				tmp ? 1 << DWL_CLIENT_TYPE_H264_DEC : 0;
+
+			tmp = (reg >> DWL_JPEG_E) & 0x01U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has JPEG\n", c);
+			config.cfg[c] |=
+				tmp ? 1 << DWL_CLIENT_TYPE_JPEG_DEC : 0;
+
+			tmp = (reg >> DWL_MPEG4_E) & 0x3U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has MPEG4\n", c);
+			config.cfg[c] |=
+				tmp ? 1 << DWL_CLIENT_TYPE_MPEG4_DEC : 0;
+
+			tmp = (reg >> DWL_VC1_E) & 0x3U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has VC1\n", c);
+			config.cfg[c] |= tmp ? 1 << DWL_CLIENT_TYPE_VC1_DEC : 0;
+
+			tmp = (reg >> DWL_MPEG2_E) & 0x01U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has MPEG2\n", c);
+			config.cfg[c] |=
+				tmp ? 1 << DWL_CLIENT_TYPE_MPEG2_DEC : 0;
+
+			tmp = (reg >> DWL_VP6_E) & 0x01U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has VP6\n", c);
+			config.cfg[c] |= tmp ? 1 << DWL_CLIENT_TYPE_VP6_DEC : 0;
+
+			reg = ioread32((void *)(dev->hwregs[c] +
+						HANTRODEC_SYNTH_CFG_2 * 4));
+
+			/* VP7 and WEBP is part of VP8 */
+			mask = (1 << DWL_VP8_E) | (1 << DWL_VP7_E) |
+			       (1 << DWL_WEBP_E);
+			tmp = (reg & mask);
+			if (tmp & (1 << DWL_VP8_E))
+				pr_info("hantrodec: core[%d] has VP8\n", c);
+			if (tmp & (1 << DWL_VP7_E))
+				pr_info("hantrodec: core[%d] has VP7\n", c);
+			if (tmp & (1 << DWL_WEBP_E))
+				pr_info("hantrodec: core[%d] has WebP\n", c);
+			config.cfg[c] |= tmp ? 1 << DWL_CLIENT_TYPE_VP8_DEC : 0;
+
+			tmp = (reg >> DWL_AVS_E) & 0x01U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has AVS\n", c);
+			config.cfg[c] |= tmp ? 1 << DWL_CLIENT_TYPE_AVS_DEC : 0;
+
+			tmp = (reg >> DWL_RV_E) & 0x03U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has RV\n", c);
+			config.cfg[c] |= tmp ? 1 << DWL_CLIENT_TYPE_RV_DEC : 0;
+
+			reg = ioread32((void *)(dev->hwregs[c] +
+						HANTRODEC_SYNTH_CFG_3 * 4));
+
+			tmp = (reg >> DWL_HEVC_E) & 0x07U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has HEVC\n", c);
+			config.cfg[c] |=
+				tmp ? 1 << DWL_CLIENT_TYPE_HEVC_DEC : 0;
+
+			tmp = (reg >> DWL_VP9_E) & 0x07U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has VP9\n", c);
+			config.cfg[c] |= tmp ? 1 << DWL_CLIENT_TYPE_VP9_DEC : 0;
+
+			/* Post-processor configuration */
+			reg = ioread32((void *)(dev->hwregs[c] +
+						HANTRODECPP_CFG_STAT * 4));
+
+			tmp = (reg >> DWL_PP_E) & 0x01U;
+			if (tmp)
+				pr_info("hantrodec: core[%d] has PP\n", c);
+			config.cfg[c] |= tmp ? 1 << DWL_CLIENT_TYPE_PP : 0;
+
+			if (config.its_aux_core_id[c] >= 0) {
+				/* set main_core_id and aux_core_id */
+				reg = ioread32
+					((void *)(dev->hwregs[c] +
+						 HANTRODEC_SYNTH_CFG_2 * 4));
+
+				tmp = (reg >> DWL_H264_PIPELINE_E) & 0x01U;
+				if (tmp)
+					pr_info("hantrodec: core[%d] has pipeline H264\n",
+						c);
+				config.cfg[config.its_aux_core_id[c]] |=
+					tmp ? 1 << DWL_CLIENT_TYPE_H264_DEC : 0;
+
+				tmp = (reg >> DWL_JPEG_PIPELINE_E) & 0x01U;
+				if (tmp)
+					pr_info("hantrodec: core[%d] has pipeline JPEG\n",
+						c);
+				config.cfg[config.its_aux_core_id[c]] |=
+					tmp ? 1 << DWL_CLIENT_TYPE_JPEG_DEC : 0;
+			}
+		}
+	}
+	memcpy(config.cfg_backup, config.cfg, sizeof(config.cfg));
+}
+
+static int core_has_format(const u32 *cfg, int core, u32 format)
+{
+	return (cfg[core] & (1 << format)) ? 1 : 0;
+}
+
+static int get_dec_core(long core, struct hantrodec_t *dev, struct file *filp,
+			unsigned long format)
+{
+	int success = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&owner_lock, flags);
+	if (core_has_format(config.cfg, core, format) &&
+	    !dec_owner[core]) {
+		dec_owner[core] = filp;
+		success = 1;
+		/*
+		 * If one main core takes one format which doesn't supported
+		 * by aux core, set aux core's cfg to none video format support
+		 */
+		if (config.its_aux_core_id[core] >= 0) {
+			if (!core_has_format(config.cfg,
+					     config.its_aux_core_id[core],
+					     format))
+				config.cfg[config.its_aux_core_id[core]] = 0;
+			else
+				config.cfg[config.its_aux_core_id[core]] =
+					(1 << format);
+		}
+		/*
+		 * If one aux core takes one format,
+		 * set main core's cfg to aux core supported video format
+		 */
+		else if (config.its_main_core_id[core] >= 0)
+			config.cfg[config.its_main_core_id[core]] =
+				(1 << format);
+	}
+
+	spin_unlock_irqrestore(&owner_lock, flags);
+
+	return success;
+}
+
+static int get_dec_core_any(long *core, struct hantrodec_t *dev, struct file *filp,
+			    unsigned long format)
+{
+	int success = 0;
+	long c;
+
+	*core = -1;
+
+	for (c = 0; c < dev->cores; c++) {
+		/* a free core that has format */
+		if (get_dec_core(c, dev, filp, format)) {
+			success = 1;
+			*core = c;
+			break;
+		}
+	}
+
+	return success;
+}
+
+static int get_dec_coreid(struct hantrodec_t *dev, struct file *filp,
+			  unsigned long format)
+{
+	long c;
+	unsigned long flags;
+
+	int core_id = -1;
+
+	for (c = 0; c < dev->cores; c++) {
+		/* a core that has format */
+		spin_lock_irqsave(&owner_lock, flags);
+		if (core_has_format(config.cfg_backup, c, format)) {
+			core_id = c;
+			spin_unlock_irqrestore(&owner_lock, flags);
+			break;
+		}
+		spin_unlock_irqrestore(&owner_lock, flags);
+	}
+
+	return core_id;
+}
+
+static long reserve_decoder(struct hantrodec_t *dev, struct file *filp,
+			    unsigned long format)
+{
+	long core = -1;
+
+	/* reserve a core */
+	if (down_interruptible(&dec_core_sem))
+		return -ERESTARTSYS;
+
+	/* lock a core that has specific format */
+	if (wait_event_interruptible(hw_queue, get_dec_core_any(&core, dev, filp,
+								format) != 0))
+		return -ERESTARTSYS;
+	PDEBUG("reserve core %ld:%lx", core, (unsigned long)filp);
+
+	return core;
+}
+
+static void release_decoder(struct hantrodec_t *dev, long core)
+{
+	u32 status;
+	unsigned long flags;
+
+	status = ioread32
+			((void *)(dev->hwregs[core] +
+				  HANTRODEC_IRQ_STAT_DEC_OFF));
+
+	/* make sure HW is disabled */
+	if (status & HANTRODEC_DEC_E) {
+		PDEBUG("hantrodec: DEC[%li] still enabled -> reset\n", core);
+		/* abort decoder */
+		status |= HANTRODEC_DEC_ABORT | HANTRODEC_DEC_IRQ_DISABLE;
+		iowrite32(status, (void *)(dev->hwregs[core] +
+					   HANTRODEC_IRQ_STAT_DEC_OFF));
+	}
+
+	spin_lock_irqsave(&owner_lock, flags);
+	/* If aux core released, revert main core's config back */
+	if (config.its_main_core_id[core] >= 0)
+		config.cfg[config.its_main_core_id[core]] =
+			config.cfg_backup[config.its_main_core_id[core]];
+
+	/* If main core released, revert aux core's config back */
+	if (config.its_aux_core_id[core] >= 0)
+		config.cfg[config.its_aux_core_id[core]] =
+			config.cfg_backup[config.its_aux_core_id[core]];
+
+	dec_owner[core] = NULL;
+	spin_unlock_irqrestore(&owner_lock, flags);
+	up(&dec_core_sem);
+	wake_up_interruptible_all(&hw_queue);
+}
+
+static long reserve_post_processor(struct hantrodec_t *dev, struct file *filp)
+{
+	unsigned long flags;
+	long core = 0;
+
+	/* single core PP only */
+	if (down_interruptible(&pp_core_sem))
+		return -ERESTARTSYS;
+
+	spin_lock_irqsave(&owner_lock, flags);
+	pp_owner[core] = filp;
+	spin_unlock_irqrestore(&owner_lock, flags);
+
+	return core;
+}
+
+static void release_post_processor(struct hantrodec_t *dev, long core)
+{
+	unsigned long flags;
+
+	u32 status =
+		ioread32((void *)(dev->hwregs[core] + HANTRO_IRQ_STAT_PP_OFF));
+
+	/* make sure HW is disabled */
+	if (status & HANTRO_PP_E) {
+		PDEBUG("hantrodec: PP[%li] still enabled -> reset\n", core);
+		/* disable IRQ */
+		status |= HANTRO_PP_IRQ_DISABLE;
+		/* disable postprocessor */
+		status &= (~HANTRO_PP_E);
+		iowrite32(0x10,
+			  (void *)(dev->hwregs[core] + HANTRO_IRQ_STAT_PP_OFF));
+	}
+
+	spin_lock_irqsave(&owner_lock, flags);
+	pp_owner[core] = NULL;
+	spin_unlock_irqrestore(&owner_lock, flags);
+	up(&pp_core_sem);
+}
+
+long reserve_dec_pp(struct hantrodec_t *dev, struct file *filp,
+		    unsigned long format)
+{
+	/* reserve core 0, DEC+PP for pipeline */
+	unsigned long flags;
+	long core = 0;
+
+	/* check that core has the requested dec format */
+	if (!core_has_format(config.cfg, core, format))
+		return -EFAULT;
+
+	/* check that core has PP */
+	if (!core_has_format(config.cfg, core, DWL_CLIENT_TYPE_PP))
+		return -EFAULT;
+
+	/* reserve a core */
+	if (down_interruptible(&dec_core_sem))
+		return -ERESTARTSYS;
+
+	/* wait until the core is available */
+	if (wait_event_interruptible(hw_queue, get_dec_core(core, dev, filp,
+							    format) != 0)) {
+		up(&dec_core_sem);
+		return -ERESTARTSYS;
+	}
+
+	if (down_interruptible(&pp_core_sem)) {
+		release_decoder(dev, core);
+		return -ERESTARTSYS;
+	}
+
+	spin_lock_irqsave(&owner_lock, flags);
+	pp_owner[core] = filp;
+	spin_unlock_irqrestore(&owner_lock, flags);
+
+	return core;
+}
+
+static long dec_flush_regs(struct hantrodec_t *dev, struct core_desc *core)
+{
+	long ret = 0, i;
+
+	u32 id = core->id;
+
+	ret = copy_from_user(dec_regs[id], core->regs, HANTRO_VC8000D_REGS * 4);
+	if (ret) {
+		PDEBUG("copy_from_user failed, returned %li\n", ret);
+		return -EFAULT;
+	}
+	/* write all regs but the status reg[1] to hardware */
+	for (i = 2; i <= HANTRO_VC8000D_LAST_REG; i++)
+		iowrite32(dec_regs[id][i], (void *)(dev->hwregs[id] + i * 4));
+	/* write the status register, which may start the decoder */
+	iowrite32(dec_regs[id][1], (void *)(dev->hwregs[id] + 4));
+
+	PDEBUG("flushed registers on core %d\n", id);
+
+	return 0;
+}
+
+static long dec_refresh_regs(struct hantrodec_t *dev, struct core_desc *core)
+{
+	long ret, i;
+	u32 id = core->id;
+
+	for (i = 0; i <= HANTRO_VC8000D_LAST_REG; i++)
+		dec_regs[id][i] = ioread32((void *)(dev->hwregs[id] + i * 4));
+
+	ret = copy_to_user(core->regs, dec_regs[id],
+			   HANTRO_VC8000D_LAST_REG * 4);
+	if (ret) {
+		PDEBUG("copy_to_user failed, returned %li\n", ret);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int check_dec_irq(struct hantrodec_t *dev, int id)
+{
+	unsigned long flags;
+	int rdy = 0;
+	const u32 irq_mask = (1 << id);
+
+	spin_lock_irqsave(&owner_lock, flags);
+
+	if (dec_irq & irq_mask) {
+		/* reset the wait condition(s) */
+		dec_irq &= ~irq_mask;
+		rdy = 1;
+	}
+
+	spin_unlock_irqrestore(&owner_lock, flags);
+
+	return rdy;
+}
+
+static long wait_dec_ready_and_refresh_regs(struct hantrodec_t *dev,
+					    struct core_desc *core)
+{
+	u32 id = core->id;
+	long ret;
+
+	PDEBUG("wait_event_interruptible DEC[%d]\n", id);
+	ret = wait_event_interruptible_timeout
+		(dec_wait_queue, check_dec_irq(dev, id), msecs_to_jiffies(10));
+	if (ret == -ERESTARTSYS) {
+		pr_err("DEC[%d]  failed to wait_event_interruptible interrupted\n",
+		       id);
+		return -ERESTARTSYS;
+	} else if (ret == 0) {
+		pr_err("DEC[%d]  wait_event_interruptible timeout\n", id);
+		timeout = 1;
+		return -EBUSY;
+	}
+	atomic_inc(&irq_tx);
+
+	/* refresh registers */
+	return dec_refresh_regs(dev, core);
+}
+
+static long dec_write_regs(struct hantrodec_t *dev, struct core_desc *core)
+{
+	long ret = 0, i;
+	u32 id = core->id;
+
+	i = core->reg_id;
+	ret = copy_from_user(dec_regs[id] + core->reg_id,
+			     core->regs + core->reg_id, 4);
+	if (ret) {
+		PDEBUG("copy_from_user failed, returned %li\n", ret);
+		return -EFAULT;
+	}
+	iowrite32(dec_regs[id][i], (void *)dev->hwregs[id] + i * 4);
+
+	return 0;
+}
+
+u32 *hantrodec_get_reg_addr(u32 coreid, u32 regid)
+{
+	if (coreid >= hantrodec_data.cores)
+		return NULL;
+	if (regid * 4 >= hantrodec_data.iosize[coreid])
+		return NULL;
+
+	return (u32 *)(hantrodec_data.hwregs[coreid] + regid * 4);
+}
+
+static long dec_read_regs(struct hantrodec_t *dev, struct core_desc *core)
+{
+	long ret, i;
+	u32 id = core->id;
+
+	i = core->reg_id;
+
+	/* read specific registers from hardware */
+	i = core->reg_id;
+	dec_regs[id][i] = ioread32((void *)dev->hwregs[id] + i * 4);
+	/* put registers to user space*/
+	ret = copy_to_user(core->regs + core->reg_id,
+			   dec_regs[id] + core->reg_id, 4);
+	if (ret) {
+		PDEBUG("copy_to_user failed, returned %li\n", ret);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static long pp_flush_regs(struct hantrodec_t *dev, struct core_desc *core)
+{
+	long ret = 0;
+	u32 id = core->id;
+	u32 i;
+
+	/* copy original dec regs to kernel space */
+	ret = copy_from_user(dec_regs[id] + HANTRO_PP_ORG_FIRST_REG,
+			     core->regs + HANTRO_PP_ORG_FIRST_REG,
+			     HANTRO_PP_ORG_REGS * 4);
+	if (ret) {
+		pr_err("copy_from_user failed, returned %li\n", ret);
+		return -EFAULT;
+	}
+	/* write all regs but the status reg[1] to hardware */
+	/* both original and extended regs need to be written */
+	for (i = HANTRO_PP_ORG_FIRST_REG + 1; i <= HANTRO_PP_ORG_LAST_REG; i++)
+		iowrite32(dec_regs[id][i], (void *)dev->hwregs[id] + i * 4);
+	/* write the stat reg, which may start the PP */
+	iowrite32(dec_regs[id][HANTRO_PP_ORG_FIRST_REG],
+		  (void *)dev->hwregs[id] + HANTRO_PP_ORG_FIRST_REG * 4);
+
+	return 0;
+}
+
+static long pp_refresh_regs(struct hantrodec_t *dev, struct core_desc *core)
+{
+	long i, ret;
+	u32 id = core->id;
+	/* user has to know exactly what they are asking for */
+	if (core->size != (HANTRO_PP_ORG_REGS * 4))
+		return -EFAULT;
+	/* read all registers from hardware */
+	/* both original and extended regs need to be read */
+	for (i = HANTRO_PP_ORG_FIRST_REG; i <= HANTRO_PP_ORG_LAST_REG; i++)
+		dec_regs[id][i] = ioread32((void *)dev->hwregs[id] + i * 4);
+	/* put original registers to user space */
+	ret = copy_to_user(core->regs + HANTRO_PP_ORG_FIRST_REG,
+			   dec_regs[id] + HANTRO_PP_ORG_FIRST_REG,
+			   HANTRO_PP_ORG_REGS * 4);
+	if (ret) {
+		pr_err("copy_to_user failed, returned %li\n", ret);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int check_pp_irq(struct hantrodec_t *dev, int id)
+{
+	unsigned long flags;
+	int rdy = 0;
+	const u32 irq_mask = (1 << id);
+
+	spin_lock_irqsave(&owner_lock, flags);
+
+	if (pp_irq & irq_mask) {
+		/* reset the wait condition(s) */
+		pp_irq &= ~irq_mask;
+		rdy = 1;
+	}
+
+	spin_unlock_irqrestore(&owner_lock, flags);
+
+	return rdy;
+}
+
+static long wait_pp_ready_and_refresh_regs(struct hantrodec_t *dev,
+					   struct core_desc *core)
+{
+	u32 id = core->id;
+
+	PDEBUG("wait_event_interruptible PP[%d]\n", id);
+	if (wait_event_interruptible(pp_wait_queue, check_pp_irq(dev, id))) {
+		pr_err("PP[%d]  failed to wait_event_interruptible interrupted\n",
+		       id);
+		return -ERESTARTSYS;
+	}
+
+	atomic_inc(&irq_tx);
+
+	/* refresh registers */
+	return pp_refresh_regs(dev, core);
+}
+
+static int check_core_irq(struct hantrodec_t *dev, const struct file *filp,
+			  int *id)
+{
+	unsigned long flags;
+	int rdy = 0, n = 0;
+
+	do {
+		u32 irq_mask = (1 << n);
+
+		spin_lock_irqsave(&owner_lock, flags);
+
+		if (dec_irq & irq_mask) {
+			PDEBUG("%s get irq for core %d:%lx", __func__, n,
+			       (unsigned long)filp);
+			if (*id == n) {
+				/* we have an IRQ for our client */
+				/* reset the wait condition(s) */
+				dec_irq &= ~irq_mask;
+				/* signal ready core no. for our client */
+				*id = n;
+				rdy = 1;
+				spin_unlock_irqrestore(&owner_lock, flags);
+				break;
+			} else if (!dec_owner[n]) {
+				/* zombie IRQ */
+				PDEBUG("IRQ on core[%d], but no owner!\n", n);
+				/* reset the wait condition(s) */
+				dec_irq &= ~irq_mask;
+			}
+		}
+
+		spin_unlock_irqrestore(&owner_lock, flags);
+		n++; /* next core */
+	} while (n < dev->cores);
+
+	return rdy;
+}
+
+static long wait_core_ready(struct hantrodec_t *dev, const struct file *filp,
+			    int *id)
+{
+	PDEBUG("wait_event_interruptible CORE\n");
+
+	if (wait_event_interruptible(dec_wait_queue,
+				     check_core_irq(dev, filp, id))) {
+		pr_err("CORE  failed to wait_event_interruptible interrupted\n");
+		return -ERESTARTSYS;
+	}
+
+	atomic_inc(&irq_tx);
+
+	return 0;
+}
+
+/*-------------------------------------------------------------------------
+ * Function name   : hantrodec_ioctl
+ * Description     : communication method to/from the user space
+ *
+ * Return type     : long
+ *-------------------------------------------------------------------------
+ */
+long hantrodec_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	int err = 0;
+	u32 id;
+	long tmp;
+	struct core_desc core;
+
+	switch (_IOC_NR(cmd)) {
+	case _IOC_NR(HANTRODEC_IOC_CLI): {
+		id = arg;
+		if (id >= hantrodec_data.cores)
+			return -EFAULT;
+		disable_irq(hantrodec_data.irq[id]);
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOC_STI): {
+		id = arg;
+		if (id >= hantrodec_data.cores)
+			return -EFAULT;
+		enable_irq(hantrodec_data.irq[id]);
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOCGHWOFFSET): {
+		__get_user(id, (__u32 *)arg);
+		if (id >= hantrodec_data.cores)
+			return -EFAULT;
+
+		__put_user(multicorebase_actual[id], (unsigned long *)arg);
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOCGHWIOSIZE): {
+		__u32 io_size;
+
+		__get_user(id, (__u32 *)arg);
+		if (id >= hantrodec_data.cores)
+			return -EFAULT;
+		io_size = hantrodec_data.iosize[id];
+		__put_user(io_size, (u32 *)arg);
+
+		return 0;
+	}
+	case _IOC_NR(HANTRODEC_IOC_MC_OFFSETS): {
+		tmp = copy_to_user((unsigned long *)arg, multicorebase_actual,
+				   sizeof(multicorebase_actual));
+		if (err) {
+			pr_err("copy_to_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOC_MC_CORES):
+		__put_user(hantrodec_data.cores, (unsigned int *)arg);
+		PDEBUG("hantrodec_data.cores=%d\n", hantrodec_data.cores);
+		break;
+	case _IOC_NR(HANTRODEC_IOCS_DEC_PUSH_REG): {
+		struct core_desc core;
+
+		/* get registers from user space */
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			pr_err("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		dec_flush_regs(&hantrodec_data, &core);
+		break;
+	}
+
+	case _IOC_NR(HANTRODEC_IOCS_DEC_WRITE_REG): {
+		/* get registers from user space */
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			PDEBUG("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		dec_write_regs(&hantrodec_data, &core);
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOCS_PP_PUSH_REG): {
+		/* get registers from user space */
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			pr_err("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		pp_flush_regs(&hantrodec_data, &core);
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOCS_DEC_PULL_REG): {
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			pr_err("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		return dec_refresh_regs(&hantrodec_data, &core);
+	}
+	case _IOC_NR(HANTRODEC_IOCS_DEC_READ_REG): {
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			PDEBUG("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		return dec_read_regs(&hantrodec_data, &core);
+	}
+	case _IOC_NR(HANTRODEC_IOCS_PP_PULL_REG): {
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			pr_err("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		return pp_refresh_regs(&hantrodec_data, &core);
+	}
+	case _IOC_NR(HANTRODEC_IOCH_DEC_RESERVE): {
+		PDEBUG("Reserve DEC core, format = %li\n", arg);
+		return reserve_decoder(&hantrodec_data, filp, arg);
+	}
+	case _IOC_NR(HANTRODEC_IOCT_DEC_RELEASE): {
+		if (arg >= hantrodec_data.cores || dec_owner[arg] != filp) {
+			pr_err("bogus DEC release, core = %li\n", arg);
+			return -EFAULT;
+		}
+
+		PDEBUG("Release DEC, core = %li\n", arg);
+
+		release_decoder(&hantrodec_data, arg);
+
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOCQ_PP_RESERVE):
+		return reserve_post_processor(&hantrodec_data, filp);
+	case _IOC_NR(HANTRODEC_IOCT_PP_RELEASE): {
+		if (arg != 0 || pp_owner[arg] != filp) {
+			pr_err("bogus PP release %li\n", arg);
+			return -EFAULT;
+		}
+
+		release_post_processor(&hantrodec_data, arg);
+
+		break;
+	}
+	case _IOC_NR(HANTRODEC_IOCX_DEC_WAIT): {
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			pr_err("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		return wait_dec_ready_and_refresh_regs(&hantrodec_data, &core);
+	}
+	case _IOC_NR(HANTRODEC_IOCX_PP_WAIT): {
+		tmp = copy_from_user(&core, (void *)arg,
+				     sizeof(struct core_desc));
+		if (tmp) {
+			pr_err("copy_from_user failed, returned %li\n", tmp);
+			return -EFAULT;
+		}
+
+		return wait_pp_ready_and_refresh_regs(&hantrodec_data, &core);
+	}
+	case _IOC_NR(HANTRODEC_IOCG_CORE_WAIT): {
+		int id;
+
+		__get_user(id, (int *)arg);
+		tmp = wait_core_ready(&hantrodec_data, filp, &id);
+		__put_user(id, (int *)arg);
+		return tmp;
+	}
+	case _IOC_NR(HANTRODEC_IOX_ASIC_ID): {
+		__get_user(id, (u32 *)arg);
+		if (id >= hantrodec_data.cores)
+			return -EFAULT;
+		id = ioread32((void *)hantrodec_data.hwregs[id]);
+		__put_user(id, (u32 *)arg);
+		return 0;
+	}
+	case _IOC_NR(HANTRODEC_IOCG_CORE_ID): {
+		PDEBUG("Get DEC core_id, format = %li\n", arg);
+		tmp = get_dec_coreid(&hantrodec_data, filp, arg);
+		return tmp;
+	}
+	case _IOC_NR(HANTRODEC_DEBUG_STATUS): {
+		PDEBUG("hantrodec: dec_irq     = 0x%08x\n", dec_irq);
+		PDEBUG("hantrodec: pp_irq      = 0x%08x\n", pp_irq);
+
+		PDEBUG("hantrodec: IRQs received/sent2user = %d / %d\n",
+		       atomic_read(&irq_rx), atomic_read(&irq_tx));
+
+		for (tmp = 0; tmp < hantrodec_data.cores; tmp++) {
+			PDEBUG("hantrodec: dec_core[%li] %s\n", tmp,
+			       !dec_owner[tmp] ? "FREE" : "RESERVED");
+			PDEBUG("hantrodec: pp_core[%li]  %s\n", tmp,
+			       !pp_owner[tmp]  ? "FREE" : "RESERVED");
+		}
+		break;
+	}
+	default:
+		return -ENOTTY;
+	}
+
+	return 0;
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : hantrodec_release
+ *Description     : Release driver
+ *
+ *Return type     : int
+ *----------------------------------------------------------------------------
+ */
+int hantrodec_release(struct file *filp)
+{
+	int n;
+	struct hantrodec_t *dev = &hantrodec_data;
+
+	for (n = 0; n < dev->cores; n++) {
+		if (dec_owner[n] == filp) {
+			PDEBUG("releasing dec core %i lock\n", n);
+			release_decoder(dev, n);
+		}
+	}
+
+	for (n = 0; n < 1; n++) {
+		if (pp_owner[n] == filp) {
+			PDEBUG("releasing pp core %i lock\n", n);
+			release_post_processor(dev, n);
+		}
+	}
+
+	return 0;
+}
+
+int hantrodec_open(struct inode *inode, struct file *filp)
+{
+	return 0;
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : hantrodec_init
+ *Description     : Initialize the driver
+ *
+ *Return type     : int
+ *---------------------------------------------------------------------------
+ */
+int hantrodec_init(struct platform_device *pdev)
+{
+	int result = 0;
+	int irq_0;
+	int i;
+
+	dec_irq = 0;
+	pp_irq = 0;
+	parent_dev = &pdev->dev;
+	pr_info("hantrodec: Init multi core[0] at 0x%16lx\n"
+		"core[1] at 0x%16lx\n",
+		multicorebase[0], multicorebase[1]);
+
+	hantrodec_data.cores = 0;
+	hantrodec_data.iosize[0] = DEC_IO_SIZE_0;
+	hantrodec_data.irq[0] = -1;
+	hantrodec_data.iosize[1] = DEC_IO_SIZE_1;
+	hantrodec_data.irq[1] = -1;
+
+	for (i = 0; i < HXDEC_MAX_CORES; i++) {
+		hantrodec_data.hwregs[i] = 0;
+		/*
+		 * If user gave less core bases that we have by default,
+		 * invalidate default bases
+		 */
+		if (elements && i >= elements)
+			multicorebase[i] = -1;
+	}
+
+	hantrodec_data.async_queue_dec = NULL;
+	hantrodec_data.async_queue_pp = NULL;
+	/* Enable and set the VDEC clks */
+	hantro_clk_xin_vdec = clk_get(&pdev->dev, "clk_xin_vdec");
+	hantro_clk_vdec = clk_get(&pdev->dev, "clk_vdec");
+	hantro_clk_enable();
+	/* Set KMB CLK to 700 Mhz VDEC */
+	pr_info("hantrodec: Before setting any clocks: clk_xin_vdec: %ld | clk_vdec %ld\n",
+		clk_get_rate(hantro_clk_xin_vdec),
+		clk_get_rate(hantro_clk_vdec));
+	clk_set_rate(hantro_clk_xin_vdec, 700000000);
+	pr_info("hantrodec: Set clocks to 700Mhz: clk_xin_vdec: %ld | clk_vdec %ld\n",
+		clk_get_rate(hantro_clk_xin_vdec),
+		clk_get_rate(hantro_clk_vdec));
+
+	result = reserve_io();
+
+	if (result < 0)
+		goto err;
+
+	memset(dec_owner, 0, sizeof(dec_owner));
+	memset(pp_owner, 0, sizeof(pp_owner));
+	sema_init(&dec_core_sem, hantrodec_data.cores);
+	sema_init(&pp_core_sem, 1);
+
+	/* read configuration for all cores */
+	read_core_config(&hantrodec_data);
+	/* reset hardware */
+	reset_asic(&hantrodec_data);
+
+	/* Dynamic AXI ID and Page LUT routines */
+	/* Register and set the page lookup table for read */
+	if (!request_mem_region(page_lut_read, hantrodec_data.iosize[0],
+				"hantrodec_pagelut_read")) {
+		pr_info("hantrodec: failed to reserve page lookup table registers\n");
+		return -EBUSY;
+	}
+	page_lut_regs_read =
+		(u8 *)ioremap(page_lut_read, hantrodec_data.iosize[0]);
+	if (!page_lut_regs_read)
+		pr_info("hantrodec: failed to ioremap page lookup table registers\n");
+
+	/* Set VDEC RD Page LUT AXI ID 0-15 to 0x4 */
+	iowrite32(0x04040404, (void *)page_lut_regs_read);
+	pr_info("hantrodec: RD AXI ID 3:0 = %x\n",
+		ioread32((void *)page_lut_regs_read));
+	iowrite32(0x04040404, (void *)page_lut_regs_read + 0x4);
+	pr_info("hantrodec: RD AXI ID 7:4 = %x\n",
+		ioread32((void *)page_lut_regs_read + 0x4));
+	iowrite32(0x04040404, (void *)page_lut_regs_read + 0x8);
+	pr_info("hantrodec: RD AXI ID 11:8 = %x\n",
+		ioread32((void *)page_lut_regs_read + 0x8));
+	iowrite32(0x04040404, (void *)page_lut_regs_read + 0xc);
+	pr_info("hantrodec: RD AXI ID 15:12 = %x\n",
+		ioread32((void *)page_lut_regs_read + 0xc));
+
+	/* dynamic WR AXI ID */
+	/* Set sw_dec_axi_wr_id_e to 1 */
+	iowrite32(1 << 13, (void *)hantrodec_data.hwregs[0] + 0xE8);
+	pr_info("hantrodec: sw_dec_axi_wr_id_e  = %x\n",
+		ioread32((void *)hantrodec_data.hwregs[0] + 0xE8));
+	/*
+	 * Set WR Page LUT AXI ID 0-3, 6-15 to 0x4 and
+	 * WR Page LUT AXI ID 4,5 to 0x0
+	 */
+	iowrite32(0x04040404, (void *)page_lut_regs_read + 0x10);
+	pr_info("hantrodec: page_lut_regs WR AXI ID 3:0= %x\n",
+		ioread32((void *)page_lut_regs_read + 0x10));
+	iowrite32(0x04040000, (void *)page_lut_regs_read + 0x14);
+	pr_info("hantrodec: page_lut_regs WR AXI ID 7:4= %x\n",
+		ioread32((void *)page_lut_regs_read + 0x14));
+	iowrite32(0x04040404, (void *)page_lut_regs_read + 0x18);
+	pr_info("hantrodec: page_lut_regs WR AXI ID 11:8= %x\n",
+		ioread32((void *)page_lut_regs_read + 0x18));
+	iowrite32(0x04040404, (void *)page_lut_regs_read + 0x1c);
+	pr_info("hantrodec: page_lut_regs WR AXI ID 15:12= %x\n",
+		ioread32((void *)page_lut_regs_read + 0x1c));
+
+	/* register irq for each core */
+	irq_0 = irq[0];
+	if (irq_0 > 0) {
+		PDEBUG("irq_0 platform_get_irq\n");
+		irq_0 = platform_get_irq_byname(pdev, "irq_hantro_decoder");
+		result = request_irq(irq_0, hantrodec_isr, IRQF_SHARED,
+				     "irq_hantro_decoder",
+				     (void *)&hantrodec_data);
+		if (result != 0) {
+			PDEBUG("can't reserve irq0\n");
+			goto err0;
+		}
+		PDEBUG("reserve irq0 success with irq0 = %d\n", irq_0);
+		hantrodec_data.irq[0] = irq_0;
+	} else {
+		PDEBUG("can't get irq0 and irq0 value = %d\n", irq_0);
+		result = -EINVAL;
+		goto err0;
+	}
+
+	pr_info("hantrodec: module inserted.\n");
+
+	return 0;
+err0:
+	release_io();
+
+err:
+	return result;
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : hantrodec_cleanup
+ *Description     : clean up
+ *
+ *Return type     : int
+ *---------------------------------------------------------------------------
+ */
+void hantrodec_cleanup(void)
+{
+	struct hantrodec_t *dev = &hantrodec_data;
+	int n = 0;
+	/* reset hardware */
+	reset_asic(dev);
+
+	/* free the IRQ */
+	for (n = 0; n < dev->cores; n++) {
+		if (dev->irq[n] != -1)
+			free_irq(dev->irq[n], (void *)dev);
+	}
+
+	release_io();
+	hantro_clk_disable();
+	pr_info("hantrodec: module removed\n");
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : check_hw_id
+ *Return type     : int
+ *---------------------------------------------------------------------------
+ */
+static int check_hw_id(struct hantrodec_t *dev)
+{
+	long hwid;
+	int i;
+	size_t num_hw = sizeof(dec_hwid) / sizeof(*dec_hwid);
+
+	int found = 0;
+
+	for (i = 0; i < dev->cores; i++) {
+		if (dev->hwregs[i]) {
+			hwid = readl(dev->hwregs[i]);
+			PDEBUG("hantrodec: core %d HW ID=0x%16lx\n", i, hwid);
+			hwid = (hwid >> 16) & 0xFFFF;
+
+			while (num_hw--) {
+				if (hwid == dec_hwid[num_hw]) {
+					PDEBUG("hantrodec: Supported HW found at 0x%16lx\n",
+					       multicorebase_actual[i]);
+					found++;
+					dev->hw_id[i] = hwid;
+					break;
+				}
+			}
+			if (!found) {
+				PDEBUG("hantrodec: Unknown HW found at 0x%16lx\n",
+				       multicorebase_actual[i]);
+				return 0;
+			}
+			found = 0;
+			num_hw = sizeof(dec_hwid) / sizeof(*dec_hwid);
+		}
+	}
+
+	return 1;
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : reserve_io
+ *Description     : IO reserve
+ *
+ *Return type     : int
+ *---------------------------------------------------------------------------
+ */
+static int reserve_io(void)
+{
+	int i;
+	long hwid;
+	u32 reg;
+
+	memcpy(multicorebase_actual, multicorebase,
+	       HXDEC_MAX_CORES * sizeof(unsigned long));
+	memcpy((unsigned int *)(hantrodec_data.iosize), iosize,
+	       HXDEC_MAX_CORES * sizeof(unsigned int));
+	memcpy((unsigned int *)hantrodec_data.irq, irq,
+	       HXDEC_MAX_CORES * sizeof(int));
+
+	for (i = 0; i < HXDEC_MAX_CORES; i++) {
+		if (multicorebase_actual[i] != -1) {
+			if (!request_mem_region(multicorebase_actual[i],
+						hantrodec_data.iosize[i],
+						"hantrodec0")) {
+				PDEBUG("hantrodec: failed to reserve HW regs\n");
+				return -EBUSY;
+			}
+
+			hantrodec_data.hwregs[i] =
+				(u8 *)ioremap(multicorebase_actual[i],
+						      hantrodec_data.iosize[i]);
+
+			if (!hantrodec_data.hwregs[i]) {
+				PDEBUG("hantrodec: failed to ioremap HW regs\n");
+				release_io();
+				return -EBUSY;
+			}
+
+			hantrodec_data.cores++;
+			config.its_main_core_id[i] = -1;
+			config.its_aux_core_id[i] = -1;
+			hwid = ((readl(hantrodec_data.hwregs[i])) >> 16) &
+			       0xFFFF;
+
+			if (IS_VC8000D(hwid)) {
+				reg = readl(hantrodec_data.hwregs[i] +
+					    HANTRODEC_SYNTH_CFG_2_OFF);
+				if (((reg >> DWL_H264_PIPELINE_E) & 0x01U) ||
+				    ((reg >> DWL_JPEG_PIPELINE_E) & 0x01U)) {
+					i++;
+					config.its_aux_core_id[i - 1] = i;
+					config.its_main_core_id[i] = i - 1;
+					config.its_aux_core_id[i] = -1;
+					multicorebase_actual[i] =
+						multicorebase_actual[i - 1] +
+						0x800;
+					hantrodec_data.iosize[i] =
+						hantrodec_data.iosize[i - 1];
+					memcpy(multicorebase_actual + i + 1,
+					       multicorebase + i,
+					       (HXDEC_MAX_CORES - i - 1) *
+						       sizeof(unsigned long));
+					memcpy((unsigned int *)(hantrodec_data
+									.iosize +
+								i + 1),
+					       iosize + i,
+					       (HXDEC_MAX_CORES - i - 1) *
+						       sizeof(unsigned int));
+					if (!request_mem_region
+					    (multicorebase_actual[i],
+					     hantrodec_data.iosize[i],
+						    "hantrodec0")) {
+						PDEBUG("hantrodec: failed to reserve HW regs\n");
+						return -EBUSY;
+					}
+
+					hantrodec_data.hwregs[i] =
+						(u8 *)ioremap
+							(multicorebase_actual[i],
+							 hantrodec_data
+								.iosize[i]);
+
+					if (!hantrodec_data.hwregs[i]) {
+						PDEBUG("hantrodec: failed to ioremap HW regs\n");
+						release_io();
+						return -EBUSY;
+					}
+					hantrodec_data.cores++;
+				}
+			}
+		}
+	}
+
+	/* check for correct HW */
+	if (!check_hw_id(&hantrodec_data)) {
+		release_io();
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : release_io
+ *Description     : release
+ *
+ *Return type     : void
+ *---------------------------------------------------------------------------
+ */
+static void release_io(void)
+{
+	int i;
+
+	for (i = 0; i < hantrodec_data.cores; i++) {
+		if (hantrodec_data.hwregs[i])
+			iounmap((void *)hantrodec_data.hwregs[i]);
+		release_mem_region(multicorebase_actual[i],
+				   hantrodec_data.iosize[i]);
+	}
+
+	iounmap((void *)page_lut_regs_read);
+	release_mem_region(page_lut_read, hantrodec_data.iosize[0]);
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : hantrodec_isr
+ *Description     : interrupt handler
+ *
+ *Return type     : irqreturn_t
+ *---------------------------------------------------------------------------
+ */
+static irqreturn_t hantrodec_isr(int irq, void *dev_id)
+{
+	unsigned long flags;
+	unsigned int handled = 0;
+	int i;
+
+	u8 *hwregs;
+	struct hantrodec_t *dev;
+	u32 irq_status_dec;
+
+	dev = (struct hantrodec_t *)dev_id;
+	spin_lock_irqsave(&owner_lock, flags);
+
+	for (i = 0; i < dev->cores; i++) {
+		u8 *hwregs = dev->hwregs[i];
+
+		/* interrupt status register read */
+		irq_status_dec =
+			ioread32((void *)hwregs + HANTRODEC_IRQ_STAT_DEC_OFF);
+		PDEBUG("%d core irq = %x\n", i, irq_status_dec);
+		if (irq_status_dec & HANTRODEC_DEC_IRQ) {
+			/* clear dec IRQ */
+			irq_status_dec &= (~HANTRODEC_DEC_IRQ);
+			iowrite32(irq_status_dec,
+				  (void *)hwregs + HANTRODEC_IRQ_STAT_DEC_OFF);
+
+			PDEBUG("decoder IRQ received! core %d\n", i);
+
+			atomic_inc(&irq_rx);
+
+			dec_irq |= (1 << i);
+
+			wake_up_interruptible_all(&dec_wait_queue);
+			handled++;
+		}
+	}
+
+	spin_unlock_irqrestore(&owner_lock, flags);
+	if (!handled)
+		PDEBUG("IRQ received, but not hantrodec's!\n");
+	(void)hwregs;
+
+	return IRQ_RETVAL(handled);
+}
+
+/*---------------------------------------------------------------------------
+ *Function name   : reset_asic
+ *Description     : reset asic
+ *
+ *Return type     :
+ *---------------------------------------------------------------------------
+ */
+static void reset_asic(struct hantrodec_t *dev)
+{
+	int i, j;
+	u32 status;
+
+	for (j = 0; j < dev->cores; j++) {
+		status = ioread32((void *)dev->hwregs[j] +
+				  HANTRODEC_IRQ_STAT_DEC_OFF);
+
+		if (status & HANTRODEC_DEC_E) {
+			/* abort with IRQ disabled */
+			status =
+				HANTRODEC_DEC_ABORT | HANTRODEC_DEC_IRQ_DISABLE;
+			iowrite32(status, (void *)dev->hwregs[j] +
+						  HANTRODEC_IRQ_STAT_DEC_OFF);
+		}
+
+		for (i = 4; i < dev->iosize[j]; i += 4)
+			iowrite32(0, (void *)dev->hwregs[j] + i);
+	}
+}
diff --git a/drivers/gpu/drm/hantro/hantro_dec.h b/drivers/gpu/drm/hantro/hantro_dec.h
new file mode 100644
index 0000000..c0f7573
--- /dev/null
+++ b/drivers/gpu/drm/hantro/hantro_dec.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *    Hantro decoder hardware driver header file.
+ *
+ *    Copyright (c) 2017 - 2020, VeriSilicon Inc.
+ *    Copyright (c) 2020 Intel Corporation
+ */
+
+#ifndef _HANTRODEC_H_
+#define _HANTRODEC_H_
+#include <linux/ioctl.h>
+#include <linux/types.h>
+#include "hantro_drm.h"
+
+#undef PDEBUG
+#ifdef HANTRODEC_DEBUG
+#ifdef __KERNEL__
+#define PDEBUG(fmt, args...) pr_info("hantrodec: " fmt, ##args)
+#else
+#define PDEBUG(fmt, args...) fprintf(stderr, fmt, ##args)
+#endif
+#else
+#define PDEBUG(fmt, args...)
+#endif
+
+/* hantro PP regs */
+#define HANTRO_PP_ORG_REGS              41
+#define HANTRO_PP_ORG_FIRST_REG         60
+#define HANTRO_PP_ORG_LAST_REG          100
+#define HANTRO_PP_EXT_FIRST_REG         146
+#define HANTRO_PP_EXT_LAST_REG          154
+
+/* hantro VC8000D reg config */
+#define HANTRO_VC8000D_REGS             342 /* VC8000D total regs */
+#define HANTRO_VC8000D_FIRST_REG        0
+#define HANTRO_VC8000D_LAST_REG         (HANTRO_VC8000D_REGS - 1)
+#define HANTRO_VC8KD_REG_BWREAD         300
+#define HANTRO_VC8KD_REG_BWWRITE        301
+#define VC8KD_BURSTWIDTH                16
+#define DEC_IO_SIZE_MAX                 (HANTRO_VC8000D_REGS * 4)
+#define HXDEC_MAX_CORES                 2
+
+/* Logic module base address */
+#define SOCLE_LOGIC_0_BASE              0x20888000
+#define SOCLE_LOGIC_1_BASE              0x20888800
+#define DEC_IO_SIZE_0                   DEC_IO_SIZE_MAX /* bytes */
+#define DEC_IO_SIZE_1                   DEC_IO_SIZE_MAX /* bytes */
+#define DEC_IRQ_0                       138
+#define DEC_IRQ_1                       138
+#define KMB_VC8000D_PAGE_LUT            0x20889000
+#define IS_VC8000D(hw_id)               (((hw_id) == 0x8001) ? 1 : 0)
+
+int hantrodec_init(struct platform_device *pdev);
+void hantrodec_cleanup(void);
+long hantrodec_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
+u32 *hantrodec_get_reg_addr(u32 coreid, u32 regid);
+int hantrodec_open(struct inode *inode, struct file *filp);
+u32 hantrodec_readbandwidth(int is_read_bw);
+#endif /* !_HANTRODEC_H_ */
diff --git a/drivers/gpu/drm/hantro/hantro_dwl_defs.h b/drivers/gpu/drm/hantro/hantro_dwl_defs.h
new file mode 100644
index 0000000..4411c62
--- /dev/null
+++ b/drivers/gpu/drm/hantro/hantro_dwl_defs.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *    Hantro driver hardware register definition.
+ *
+ *    Copyright (c) 2017 - 2020, VeriSilicon Inc.
+ *    Copyright (c) 2020 Intel Corporation
+ */
+
+#ifndef SOFTWARE_LINUX_DWL_DWL_DEFS_H_
+#define SOFTWARE_LINUX_DWL_DWL_DEFS_H_
+
+#define DWL_CLIENT_TYPE_H264_DEC        1U
+#define DWL_CLIENT_TYPE_MPEG4_DEC       2U
+#define DWL_CLIENT_TYPE_JPEG_DEC        3U
+#define DWL_CLIENT_TYPE_PP              4U
+#define DWL_CLIENT_TYPE_VC1_DEC         5U
+#define DWL_CLIENT_TYPE_MPEG2_DEC       6U
+#define DWL_CLIENT_TYPE_VP6_DEC         7U
+#define DWL_CLIENT_TYPE_AVS_DEC         8U
+#define DWL_CLIENT_TYPE_RV_DEC          9U
+#define DWL_CLIENT_TYPE_VP8_DEC         10U
+#define DWL_CLIENT_TYPE_VP9_DEC         11U
+#define DWL_CLIENT_TYPE_HEVC_DEC        12U
+
+#define DWL_MPEG2_E			31 /* 1 bit  */
+#define DWL_VC1_E			29 /* 2 bits */
+#define DWL_JPEG_E			28 /* 1 bit  */
+#define DWL_MPEG4_E			26 /* 2 bits */
+#define DWL_H264_E			24 /* 2 bits */
+#define DWL_VP6_E			23 /* 1 bit  */
+#define DWL_RV_E			26 /* 2 bits */
+#define DWL_VP8_E			23 /* 1 bit  */
+#define DWL_VP7_E			24 /* 1 bit  */
+#define DWL_WEBP_E			19 /* 1 bit  */
+#define DWL_AVS_E			22 /* 1 bit  */
+#define DWL_G1_PP_E			16 /* 1 bit  */
+#define DWL_G2_PP_E			31 /* 1 bit  */
+#define DWL_PP_E			31 /* 1 bit  */
+#define DWL_HEVC_E			26 /* 3 bits */
+#define DWL_VP9_E			29 /* 3 bits */
+
+#define DWL_H264_PIPELINE_E		31 /* 1 bit */
+#define DWL_JPEG_PIPELINE_E		30 /* 1 bit */
+
+#define DWL_G2_HEVC_E			0 /* 1 bits */
+#define DWL_G2_VP9_E			1 /* 1 bits */
+#define DWL_G2_RFC_E			2 /* 1 bits */
+#define DWL_RFC_E			17 /* 2 bits */
+#define DWL_G2_DS_E			3 /* 1 bits */
+#define DWL_DS_E			28 /* 3 bits */
+#define DWL_HEVC_VER			8 /* 4 bits */
+#define DWL_VP9_PROFILE			12 /* 3 bits */
+#define DWL_RING_E			16 /* 1 bits */
+
+#define HANTRODEC_IRQ_STAT_DEC		1
+#define HANTRODEC_IRQ_STAT_DEC_OFF	(HANTRODEC_IRQ_STAT_DEC * 4)
+
+#define HANTRODECPP_SYNTH_CFG		60
+#define HANTRODECPP_SYNTH_CFG_OFF	(HANTRODECPP_SYNTH_CFG * 4)
+#define HANTRODEC_SYNTH_CFG		50
+#define HANTRODEC_SYNTH_CFG_OFF		(HANTRODEC_SYNTH_CFG * 4)
+#define HANTRODEC_SYNTH_CFG_2		54
+#define HANTRODEC_SYNTH_CFG_2_OFF	(HANTRODEC_SYNTH_CFG_2 * 4)
+#define HANTRODEC_SYNTH_CFG_3		56
+#define HANTRODEC_SYNTH_CFG_3_OFF	(HANTRODEC_SYNTH_CFG_3 * 4)
+#define HANTRODEC_CFG_STAT		23
+#define HANTRODEC_CFG_STAT_OFF		(HANTRODEC_CFG_STAT * 4)
+#define HANTRODECPP_CFG_STAT		260
+#define HANTRODECPP_CFG_STAT_OFF	(HANTRODECPP_CFG_STAT * 4)
+/* VC8000D HW build id */
+#define HANTRODEC_HW_BUILD_ID		309
+#define HANTRODEC_HW_BUILD_ID_OFF	(HANTRODEC_HW_BUILD_ID * 4)
+
+#define HANTRODEC_DEC_E			0x01
+#define HANTRODEC_PP_E			0x01
+#define HANTRODEC_DEC_ABORT		0x20
+#define HANTRODEC_DEC_IRQ_DISABLE	0x10
+#define HANTRODEC_DEC_IRQ		0x100
+
+/* Legacy from G1 */
+#define HANTRO_IRQ_STAT_DEC		1
+#define HANTRO_IRQ_STAT_DEC_OFF		(HANTRO_IRQ_STAT_DEC * 4)
+#define HANTRO_IRQ_STAT_PP		60
+#define HANTRO_IRQ_STAT_PP_OFF		(HANTRO_IRQ_STAT_PP * 4)
+
+#define HANTROPP_SYNTH_CFG		100
+#define HANTROPP_SYNTH_CFG_OFF		(HANTROPP_SYNTH_CFG * 4)
+#define HANTRODEC_SYNTH_CFG		50
+#define HANTRODEC_SYNTH_CFG_OFF		(HANTRODEC_SYNTH_CFG * 4)
+#define HANTRODEC_SYNTH_CFG_2		54
+#define HANTRODEC_SYNTH_CFG_2_OFF	(HANTRODEC_SYNTH_CFG_2 * 4)
+
+#define HANTRO_DEC_E			0x01
+#define HANTRO_PP_E			0x01
+#define HANTRO_DEC_ABORT		0x20
+#define HANTRO_DEC_IRQ_DISABLE		0x10
+#define HANTRO_PP_IRQ_DISABLE		0x10
+#define HANTRO_DEC_IRQ			0x100
+#define HANTRO_PP_IRQ			0x100
+
+#endif /* SOFTWARE_LINUX_DWL_DWL_DEFS_H_ */
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
