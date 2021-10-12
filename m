Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BDE42AFDD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586CC89A59;
	Tue, 12 Oct 2021 22:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1200 seconds by postgrey-1.36 at gabe;
 Tue, 12 Oct 2021 22:55:36 UTC
Received: from 12.mo550.mail-out.ovh.net (12.mo550.mail-out.ovh.net
 [87.98.162.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769A6899F3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 22:55:36 +0000 (UTC)
Received: from player693.ha.ovh.net (unknown [10.110.115.143])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 9B97022B49
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 22:18:06 +0000 (UTC)
Received: from etezian.org (unknown [31.22.55.47])
 (Authenticated sender: andi@etezian.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id E264B231C89BC;
 Tue, 12 Oct 2021 22:17:58 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0042857b523-8a3c-40ca-81be-617759a4ae64,
 C786CB9E79FC7D8AF81679FEBE5E79C8CF9BC842) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.55.47
From: Andi Shyti <andi@etezian.org>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Subject: [PATCH v5] drm/i915/gt: move remaining debugfs interfaces into gt
Date: Wed, 13 Oct 2021 00:17:38 +0200
Message-Id: <20211012221738.16029-1-andi@etezian.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 692991392904055306
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtledgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnhepieetffeigfetkeehgefftedtgefhuddtuedtgfehtdfhueefffetgeeuhffgtddunecukfhppedtrddtrddtrddtpdefuddrvddvrdehhedrgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

From: Andi Shyti <andi.shyti@linux.intel.com>

The following interfaces:

  i915_wedged
  i915_forcewake_user

are dependent on gt values. Put them inside gt/ and drop the
"i915_" prefix name. This would be the new structure:

  dri/0/gt
  |
  +-- forcewake_user
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

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    | 55 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    |  4 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 41 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h |  4 ++
 drivers/gpu/drm/i915/i915_debugfs.c           | 43 +++------------
 5 files changed, 111 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index 1fe19ccd2794..f103664b71d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -13,6 +13,59 @@
 #include "pxp/intel_pxp_debugfs.h"
 #include "uc/intel_uc_debugfs.h"
 
+int intel_gt_debugfs_reset_show(struct intel_gt *gt, u64 *val)
+{
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
+int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val)
+{
+	/* Flush any previous reset before applying for a new one */
+	wait_event(gt->reset.queue,
+		   !test_bit(I915_RESET_BACKOFF, &gt->reset.flags));
+
+	intel_gt_handle_error(gt, val, I915_ERROR_CAPTURE,
+			      "Manually reset engine mask to %llx", val);
+	return 0;
+}
+
+/*
+ * keep the interface clean where the first parameter
+ * is a 'struct intel_gt *' instead of 'void *'
+ */
+static int __intel_gt_debugfs_reset_show(void *data, u64 *val)
+{
+	return intel_gt_debugfs_reset_show(data, val);
+}
+
+static int __intel_gt_debugfs_reset_store(void *data, u64 val)
+{
+	return intel_gt_debugfs_reset_store(data, val);
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(reset_fops, __intel_gt_debugfs_reset_show,
+			__intel_gt_debugfs_reset_store, "%llu\n");
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
@@ -24,6 +77,8 @@ void intel_gt_debugfs_register(struct intel_gt *gt)
 	if (IS_ERR(root))
 		return;
 
+	gt_debugfs_register(gt, root);
+
 	intel_gt_engines_debugfs_register(gt, root);
 	intel_gt_pm_debugfs_register(gt, root);
 	intel_sseu_debugfs_register(gt, root);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
index 8b6fca09897c..e307ceb99031 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
@@ -35,4 +35,8 @@ void intel_gt_debugfs_register_files(struct dentry *root,
 				     const struct intel_gt_debugfs_file *files,
 				     unsigned long count, void *data);
 
+/* functions that need to be accessed by the upper level non-gt interfaces */
+int intel_gt_debugfs_reset_show(struct intel_gt *gt, u64 *val);
+int intel_gt_debugfs_reset_store(struct intel_gt *gt, u64 val);
+
 #endif /* INTEL_GT_DEBUGFS_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 5f84ad602642..0bc1454f38dd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -19,6 +19,46 @@
 #include "intel_sideband.h"
 #include "intel_uncore.h"
 
+int intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt)
+{
+	atomic_inc(&gt->user_wakeref);
+	intel_gt_pm_get(gt);
+	if (GRAPHICS_VER(gt->i915) >= 6)
+		intel_uncore_forcewake_user_get(gt->uncore);
+
+	return 0;
+}
+
+int intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt)
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
+	return intel_gt_pm_debugfs_forcewake_user_open(gt);
+}
+
+static int forcewake_user_release(struct inode *inode, struct file *file)
+{
+	struct intel_gt *gt = inode->i_private;
+
+	return intel_gt_pm_debugfs_forcewake_user_release(gt);
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
index 2b824289582b..a8457887ec65 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
@@ -13,4 +13,8 @@ struct drm_printer;
 void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root);
 void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *m);
 
+/* functions that need to be accessed by the upper level non-gt interfaces */
+int intel_gt_pm_debugfs_forcewake_user_open(struct intel_gt *gt);
+int intel_gt_pm_debugfs_forcewake_user_release(struct intel_gt *gt);
+
 #endif /* INTEL_GT_PM_DEBUGFS_H */
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index fdbd46ff59e0..636cc3cf88be 100644
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
+	return intel_gt_debugfs_reset_show(&i915->gt, val);
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
+	return intel_gt_debugfs_reset_store(&i915->gt, val);
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
+	return intel_gt_pm_debugfs_forcewake_user_open(&i915->gt);
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
+	return intel_gt_pm_debugfs_forcewake_user_release(&i915->gt);
 }
 
 static const struct file_operations i915_forcewake_fops = {
-- 
2.27.0

