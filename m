Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC636426A66
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 14:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADB46F496;
	Fri,  8 Oct 2021 12:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1800 seconds by postgrey-1.36 at gabe;
 Fri, 08 Oct 2021 12:07:13 UTC
Received: from 11.mo584.mail-out.ovh.net (11.mo584.mail-out.ovh.net
 [46.105.34.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065F96F496
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 12:07:13 +0000 (UTC)
Received: from player763.ha.ovh.net (unknown [10.108.1.170])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 76A9F21457
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 11:27:54 +0000 (UTC)
Received: from etezian.org (unknown [31.22.59.2])
 (Authenticated sender: andi@etezian.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id D17C72307428E;
 Fri,  8 Oct 2021 11:27:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00563029a52-872d-4e65-8f25-722cc7596db7,
 8790DCEDFF6AD8C831A06EBEA49B55E03DAFB6BE) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.59.2
From: Andi Shyti <andi@etezian.org>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Andi Shyti <andi@etezian.org>
Subject: [PATCH v3] drm/i915/gt: move remaining debugfs interfaces into gt
Date: Fri,  8 Oct 2021 13:27:33 +0200
Message-Id: <20211008112733.3600-1-andi@etezian.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3114802096292432394
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpefghfffffejuefggeeujeevfeejueegudekgfduudeihfekvddtveelfefgkeevffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkpheptddrtddrtddrtddpfedurddvvddrheelrddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeifedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

From: Andi Shyti <andi.shyti@intel.com>

The following interfaces:

  i915_wedged
  i915_forcewake_user
  i915_gem_interrupt

are dependent on gt values. Put them inside gt/ and drop the
"i915_" prefix name. This would be the new structure:

  dri/0/gt
  |
  +-- forcewake_user
  |
  +-- interrupt_info
  |
  \-- reset

For backwards compatibility with existing igt (and the slight
semantic difference between operating on the i915 abi entry
points and the deep gt info):

  dri/0
  |
  +-- i915_wedged
  |
  \-- i915_forcewake_user

remain at the top level.

Signed-off-by: Andi Shyti <andi.shyti@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
Hi Lucas and Chris,

this third version tries to remove duplicated code, but roughly
the amount of code removed is equal to the amount of code added.
In my opinion it doesn't improve much the code. Amongst the three
versions I still prefer the v2.

Changelog:
----------
v2 -> v3: https://patchwork.freedesktop.org/patch/458108/
 * keep the original interfaces as they were (thanks Chris) but
   implement the functionality inside the gt. The upper level
   files will call the gt functions (thanks Lucas).

v1 -> v2: https://patchwork.freedesktop.org/patch/456652/
 * keep the original interfaces intact (thanks Chris).


 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |  47 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    |   4 +
 .../gpu/drm/i915/gt/intel_gt_irq_debugfs.c    | 178 ++++++++++++++++++
 .../gpu/drm/i915/gt/intel_gt_irq_debugfs.h    |  15 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  41 ++++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h |   4 +
 drivers/gpu/drm/i915/i915_debugfs.c           |  43 +----
 8 files changed, 296 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index cdc244bbbfc1..e92984954ba8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -98,6 +98,7 @@ gt-y += \
 	gt/intel_gt_debugfs.o \
 	gt/intel_gt_engines_debugfs.o \
 	gt/intel_gt_irq.o \
+	gt/intel_gt_irq_debugfs.o \
 	gt/intel_gt_pm.o \
 	gt/intel_gt_pm_debugfs.o \
 	gt/intel_gt_pm_irq.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index 1fe19ccd2794..0d651c33110d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -8,11 +8,54 @@
 #include "i915_drv.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_engines_debugfs.h"
+#include "intel_gt_irq_debugfs.h"
+#include "intel_gt_pm.h"
 #include "intel_gt_pm_debugfs.h"
+#include "intel_gt_requests.h"
 #include "intel_sseu_debugfs.h"
 #include "pxp/intel_pxp_debugfs.h"
 #include "uc/intel_uc_debugfs.h"
 
+int reset_show(void *data, u64 *val)
+{
+	struct intel_gt *gt = data;
+	int ret = intel_gt_terminally_wedged(gt);
+
+	switch (ret) {
+	case -EIO:
+		*val = 1;
+		return 0;
+	case 0:
+		*val = 0;
+		return 0;
+	default:
+		return ret;
+	}
+}
+
+int reset_store(void *data, u64 val)
+{
+	struct intel_gt *gt = data;
+
+	/* Flush any previous reset before applying for a new one */
+	wait_event(gt->reset.queue,
+		   !test_bit(I915_RESET_BACKOFF, &gt->reset.flags));
+
+	intel_gt_handle_error(gt, val, I915_ERROR_CAPTURE,
+			      "Manually reset engine mask to %llx", val);
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(reset_fops, reset_show, reset_store, "%llu\n");
+
+static void gt_debugfs_register(struct intel_gt *gt, struct dentry *root)
+{
+	static const struct intel_gt_debugfs_file files[] = {
+		{ "reset", &reset_fops, NULL },
+	};
+
+	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
+}
+
 void intel_gt_debugfs_register(struct intel_gt *gt)
 {
 	struct dentry *root;
@@ -24,10 +67,12 @@ void intel_gt_debugfs_register(struct intel_gt *gt)
 	if (IS_ERR(root))
 		return;
 
+	gt_debugfs_register(gt, root);
+
 	intel_gt_engines_debugfs_register(gt, root);
 	intel_gt_pm_debugfs_register(gt, root);
+	intel_gt_irq_debugfs_register(gt, root);
 	intel_sseu_debugfs_register(gt, root);
-
 	intel_uc_debugfs_register(&gt->uc, root);
 	intel_pxp_debugfs_register(&gt->pxp, root);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
index 8b6fca09897c..6bc4f044c23f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
@@ -35,4 +35,8 @@ void intel_gt_debugfs_register_files(struct dentry *root,
 				     const struct intel_gt_debugfs_file *files,
 				     unsigned long count, void *data);
 
+/* functions that need to be accessed by the upper level non-gt interfaces */
+int reset_show(void *data, u64 *val);
+int reset_store(void *data, u64 val);
+
 #endif /* INTEL_GT_DEBUGFS_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.c
new file mode 100644
index 000000000000..3cf9ae8437e5
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: MIT
+
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#include "i915_drv.h"
+#include "intel_gt_debugfs.h"
+#include "intel_gt_irq_debugfs.h"
+
+static int interrupt_info_show(struct seq_file *m, void *data)
+{
+	struct intel_gt *gt = m->private;
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_uncore *uncore = gt->uncore;
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	intel_wakeref_t wakeref;
+	int i;
+
+	wakeref = intel_runtime_pm_get(uncore->rpm);
+
+	if (IS_CHERRYVIEW(i915)) {
+		seq_printf(m, "Master Interrupt Control:\t%08x\n",
+			   intel_uncore_read(uncore, GEN8_MASTER_IRQ));
+
+		for (i = 0; i < 4; i++) {
+			seq_printf(m, "GT Interrupt IMR %d:\t%08x\n",
+				   i, intel_uncore_read(uncore,
+							GEN8_GT_IMR(i)));
+			seq_printf(m, "GT Interrupt IIR %d:\t%08x\n",
+				   i, intel_uncore_read(uncore,
+							GEN8_GT_IIR(i)));
+			seq_printf(m, "GT Interrupt IER %d:\t%08x\n",
+				   i, intel_uncore_read(uncore,
+							GEN8_GT_IER(i)));
+		}
+
+	} else if (GRAPHICS_VER(i915) >= 11) {
+		seq_printf(m, "Master Interrupt Control:  %08x\n",
+			   intel_uncore_read(uncore, GEN11_GFX_MSTR_IRQ));
+
+		seq_printf(m, "Render/Copy Intr Enable:   %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_RENDER_COPY_INTR_ENABLE));
+		seq_printf(m, "VCS/VECS Intr Enable:      %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_VCS_VECS_INTR_ENABLE));
+		seq_printf(m, "GUC/SG Intr Enable:\t   %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_GUC_SG_INTR_ENABLE));
+		seq_printf(m, "GPM/WGBOXPERF Intr Enable: %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_GPM_WGBOXPERF_INTR_ENABLE));
+		seq_printf(m, "Crypto Intr Enable:\t   %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_CRYPTO_RSVD_INTR_ENABLE));
+		seq_printf(m, "GUnit/CSME Intr Enable:\t   %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_GUNIT_CSME_INTR_ENABLE));
+
+	} else if (GRAPHICS_VER(i915) >= 8) {
+		seq_printf(m, "Master Interrupt Control:\t%08x\n",
+			   intel_uncore_read(uncore, GEN8_MASTER_IRQ));
+
+		for (i = 0; i < 4; i++) {
+			seq_printf(m, "GT Interrupt IMR %d:\t%08x\n",
+				   i, intel_uncore_read(uncore,
+							GEN8_GT_IMR(i)));
+			seq_printf(m, "GT Interrupt IIR %d:\t%08x\n",
+				   i, intel_uncore_read(uncore,
+							GEN8_GT_IIR(i)));
+			seq_printf(m, "GT Interrupt IER %d:\t%08x\n",
+				   i, intel_uncore_read(uncore,
+							GEN8_GT_IER(i)));
+		}
+
+	} else if (IS_VALLEYVIEW(i915)) {
+		seq_printf(m, "Master IER:\t%08x\n",
+			   intel_uncore_read(uncore, VLV_MASTER_IER));
+
+		seq_printf(m, "Render IER:\t%08x\n",
+			   intel_uncore_read(uncore, GTIER));
+		seq_printf(m, "Render IIR:\t%08x\n",
+			   intel_uncore_read(uncore, GTIIR));
+		seq_printf(m, "Render IMR:\t%08x\n",
+			   intel_uncore_read(uncore, GTIMR));
+
+		seq_printf(m, "PM IER:\t\t%08x\n",
+			   intel_uncore_read(uncore, GEN6_PMIER));
+		seq_printf(m, "PM IIR:\t\t%08x\n",
+			   intel_uncore_read(uncore, GEN6_PMIIR));
+		seq_printf(m, "PM IMR:\t\t%08x\n",
+			   intel_uncore_read(uncore, GEN6_PMIMR));
+
+	} else if (!HAS_PCH_SPLIT(i915)) {
+		seq_printf(m, "Interrupt enable:    %08x\n",
+			   intel_uncore_read(uncore, GEN2_IER));
+		seq_printf(m, "Interrupt identity:  %08x\n",
+			   intel_uncore_read(uncore, GEN2_IIR));
+		seq_printf(m, "Interrupt mask:      %08x\n",
+			   intel_uncore_read(uncore, GEN2_IMR));
+	} else {
+		seq_printf(m, "Graphics Interrupt enable:		%08x\n",
+			   intel_uncore_read(uncore, GTIER));
+		seq_printf(m, "Graphics Interrupt identity:		%08x\n",
+			   intel_uncore_read(uncore, GTIIR));
+		seq_printf(m, "Graphics Interrupt mask:		%08x\n",
+			   intel_uncore_read(uncore, GTIMR));
+	}
+
+	if (GRAPHICS_VER(i915) >= 11) {
+		seq_printf(m, "RCS Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_RCS0_RSVD_INTR_MASK));
+		seq_printf(m, "BCS Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_BCS_RSVD_INTR_MASK));
+		seq_printf(m, "VCS0/VCS1 Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_VCS0_VCS1_INTR_MASK));
+		seq_printf(m, "VCS2/VCS3 Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_VCS2_VCS3_INTR_MASK));
+
+		if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
+			seq_printf(m, "VCS4/VCS5 Intr Mask:\t %08x\n",
+				   intel_uncore_read(uncore,
+						GEN12_VCS4_VCS5_INTR_MASK));
+		if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
+			seq_printf(m, "VCS6/VCS7 Intr Mask:\t %08x\n",
+				   intel_uncore_read(uncore,
+						GEN12_VCS6_VCS7_INTR_MASK));
+
+		seq_printf(m, "VECS0/VECS1 Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_VECS0_VECS1_INTR_MASK));
+
+		if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
+			seq_printf(m, "VECS2/VECS3 Intr Mask:\t %08x\n",
+				   intel_uncore_read(uncore,
+						GEN12_VECS2_VECS3_INTR_MASK));
+
+		seq_printf(m, "GUC/SG Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_GUC_SG_INTR_MASK));
+		seq_printf(m, "GPM/WGBOXPERF Intr Mask: %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_GPM_WGBOXPERF_INTR_MASK));
+		seq_printf(m, "Crypto Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_CRYPTO_RSVD_INTR_MASK));
+		seq_printf(m, "Gunit/CSME Intr Mask:\t %08x\n",
+			   intel_uncore_read(uncore,
+					     GEN11_GUNIT_CSME_INTR_MASK));
+
+	} else if (GRAPHICS_VER(i915) >= 6) {
+		for_each_engine(engine, gt, id) {
+			seq_printf(m,
+				   "Graphics Interrupt mask (%s):	%08x\n",
+				   engine->name, ENGINE_READ(engine, RING_IMR));
+		}
+	}
+
+	intel_runtime_pm_put(uncore->rpm, wakeref);
+
+	return 0;
+}
+DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(interrupt_info);
+
+void intel_gt_irq_debugfs_register(struct intel_gt *gt, struct dentry *root)
+{
+	static const struct intel_gt_debugfs_file files[] = {
+		{ "interrupt_info", &interrupt_info_fops, NULL },
+	};
+
+	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.h
new file mode 100644
index 000000000000..95e519705001
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq_debugfs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef INTEL_GT_IRQ_DEBUGFS_H
+#define INTEL_GT_IRQ_DEBUGFS_H
+
+struct intel_gt;
+struct dentry;
+
+void intel_gt_irq_debugfs_register(struct intel_gt *gt, struct dentry *root);
+
+#endif /* INTEL_GT_IRQ_DEBUGFS_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 5f84ad602642..712c91d588eb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -19,6 +19,46 @@
 #include "intel_sideband.h"
 #include "intel_uncore.h"
 
+int __forcewake_user_open(struct intel_gt *gt)
+{
+	atomic_inc(&gt->user_wakeref);
+	intel_gt_pm_get(gt);
+	if (GRAPHICS_VER(gt->i915) >= 6)
+		intel_uncore_forcewake_user_get(gt->uncore);
+
+	return 0;
+}
+
+int __forcewake_user_release(struct intel_gt *gt)
+{
+	if (GRAPHICS_VER(gt->i915) >= 6)
+		intel_uncore_forcewake_user_put(gt->uncore);
+	intel_gt_pm_put(gt);
+	atomic_dec(&gt->user_wakeref);
+
+	return 0;
+}
+
+static int forcewake_user_open(struct inode *inode, struct file *file)
+{
+	struct intel_gt *gt = inode->i_private;
+
+	return __forcewake_user_open(gt);
+}
+
+static int forcewake_user_release(struct inode *inode, struct file *file)
+{
+	struct intel_gt *gt = inode->i_private;
+
+	return __forcewake_user_release(gt);
+}
+
+static const struct file_operations forcewake_user_fops = {
+	.owner = THIS_MODULE,
+	.open = forcewake_user_open,
+	.release = forcewake_user_release,
+};
+
 static int fw_domains_show(struct seq_file *m, void *data)
 {
 	struct intel_gt *gt = m->private;
@@ -627,6 +667,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
 		{ "drpc", &drpc_fops, NULL },
 		{ "frequency", &frequency_fops, NULL },
 		{ "forcewake", &fw_domains_fops, NULL },
+		{ "forcewake_user", &forcewake_user_fops, NULL},
 		{ "llc", &llc_fops, llc_eval },
 		{ "rps_boost", &rps_boost_fops, rps_eval },
 	};
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
index 2b824289582b..fe306412b996 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
@@ -13,4 +13,8 @@ struct drm_printer;
 void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root);
 void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *m);
 
+/* functions that need to be accessed by the upper level non-gt interfaces */
+int __forcewake_user_open(struct intel_gt *gt);
+int __forcewake_user_release(struct intel_gt *gt);
+
 #endif /* INTEL_GT_PM_DEBUGFS_H */
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index fdbd46ff59e0..fd7f5bd5f304 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -35,6 +35,7 @@
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_buffer_pool.h"
 #include "gt/intel_gt_clock_utils.h"
+#include "gt/intel_gt_debugfs.h"
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_gt_pm_debugfs.h"
 #include "gt/intel_gt_requests.h"
@@ -554,36 +555,18 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static int
-i915_wedged_get(void *data, u64 *val)
+static int i915_wedged_get(void *data, u64 *val)
 {
 	struct drm_i915_private *i915 = data;
-	int ret = intel_gt_terminally_wedged(&i915->gt);
 
-	switch (ret) {
-	case -EIO:
-		*val = 1;
-		return 0;
-	case 0:
-		*val = 0;
-		return 0;
-	default:
-		return ret;
-	}
+	return reset_show(&i915->gt, val);
 }
 
-static int
-i915_wedged_set(void *data, u64 val)
+static int i915_wedged_set(void *data, u64 val)
 {
 	struct drm_i915_private *i915 = data;
 
-	/* Flush any previous reset before applying for a new one */
-	wait_event(i915->gt.reset.queue,
-		   !test_bit(I915_RESET_BACKOFF, &i915->gt.reset.flags));
-
-	intel_gt_handle_error(&i915->gt, val, I915_ERROR_CAPTURE,
-			      "Manually set wedged engine mask = %llx", val);
-	return 0;
+	return reset_store(&i915->gt, val);
 }
 
 DEFINE_SIMPLE_ATTRIBUTE(i915_wedged_fops,
@@ -728,27 +711,15 @@ static int i915_sseu_status(struct seq_file *m, void *unused)
 static int i915_forcewake_open(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
-	struct intel_gt *gt = &i915->gt;
-
-	atomic_inc(&gt->user_wakeref);
-	intel_gt_pm_get(gt);
-	if (GRAPHICS_VER(i915) >= 6)
-		intel_uncore_forcewake_user_get(gt->uncore);
 
-	return 0;
+	return __forcewake_user_open(&i915->gt);
 }
 
 static int i915_forcewake_release(struct inode *inode, struct file *file)
 {
 	struct drm_i915_private *i915 = inode->i_private;
-	struct intel_gt *gt = &i915->gt;
 
-	if (GRAPHICS_VER(i915) >= 6)
-		intel_uncore_forcewake_user_put(&i915->uncore);
-	intel_gt_pm_put(gt);
-	atomic_dec(&gt->user_wakeref);
-
-	return 0;
+	return __forcewake_user_release(&i915->gt);
 }
 
 static const struct file_operations i915_forcewake_fops = {
-- 
2.27.0

