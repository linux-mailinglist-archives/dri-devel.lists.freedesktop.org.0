Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772F427473
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 01:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E036E893;
	Fri,  8 Oct 2021 23:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A906E893
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 23:58:58 +0000 (UTC)
Received: from player157.ha.ovh.net (unknown [10.108.20.200])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 133F621C2F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 23:58:56 +0000 (UTC)
Received: from etezian.org (unknown [31.22.59.2])
 (Authenticated sender: andi@etezian.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 763CE230C3A8E;
 Fri,  8 Oct 2021 23:58:49 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00472c411d3-a15e-4448-bbcf-59f2e5d35f4e,
 96E6F0DCCDE64F4AA19C256DCD19BBCC8770B30E) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.59.2
From: Andi Shyti <andi@etezian.org>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Andi Shyti <andi@etezian.org>
Subject: [PATCH v4] drm/i915/gt: move remaining debugfs interfaces into gt
Date: Sat,  9 Oct 2021 01:58:46 +0200
Message-Id: <20211008235846.15482-1-andi@etezian.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15798627494819465738
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtuddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejheevgfetgfetudehudehgeefudeffeffieegvdduhefhleeghfdttdfggeevnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedtrddtrddtrddtpdefuddrvddvrdehledrvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Signed-off-by: Andi Shyti <andi.shyti@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
Changelog:
----------
v3 -> v4: https://patchwork.freedesktop.org/patch/458225/
 * remove the unnecessary interrupt_info_show() information. They
   were already removed here by Chris:

	cf977e18610e6 ("drm/i915/gem: Spring clean debugfs")

v2 -> v3: https://patchwork.freedesktop.org/patch/458108/
 * keep the original interfaces as they were (thanks Chris) but
   implement the functionality inside the gt. The upper level
   files will call the gt functions (thanks Lucas).

v1 -> v2: https://patchwork.freedesktop.org/patch/456652/
 * keep the original interfaces intact (thanks Chris).

 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    | 42 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    |  4 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 41 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h |  4 ++
 drivers/gpu/drm/i915/i915_debugfs.c           | 43 +++----------------
 5 files changed, 98 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index 1fe19ccd27942..f712670993b68 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -13,6 +13,46 @@
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
@@ -24,6 +64,8 @@ void intel_gt_debugfs_register(struct intel_gt *gt)
 	if (IS_ERR(root))
 		return;
 
+	gt_debugfs_register(gt, root);
+
 	intel_gt_engines_debugfs_register(gt, root);
 	intel_gt_pm_debugfs_register(gt, root);
 	intel_sseu_debugfs_register(gt, root);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
index 8b6fca09897ce..6bc4f044c23f3 100644
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
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 5f84ad6026423..712c91d588eb3 100644
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
index 2b824289582be..fe306412b996d 100644
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
index fdbd46ff59e0e..fd7f5bd5f304c 100644
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
2.33.0

