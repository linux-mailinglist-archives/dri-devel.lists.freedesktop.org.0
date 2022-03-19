Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888A4DEA7B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E9910EE66;
	Sat, 19 Mar 2022 19:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA1E10EB71;
 Sat, 19 Mar 2022 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647718954; x=1679254954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OTxUHmQQY7cQoxWryXWv/oqAfUW2bcJG5Qgzx8iJkAo=;
 b=U/9BLl0U40ymNlw39NplLv/UgloEfN+uSPKLfFtFYuN5LDQnx7+6rlNL
 zU+pr7znbrAQQUmNFuKtRP4gpVdxlqyUfD1kAPxaA9kiJxartCgqL8I5b
 U+75yD+luXT+GqEaxCQE4XXc+Im0kHU+Xzkuk1W6FGRqi7TnHZHnitNcS
 /YZvKpgPLy/ToAJojzCTXvxfK+RZH+u87qjPEqbACcXTuzaF+eqLKUeZU
 E+ErNB7mBT200Ea5QTQcMlRptNo6hguS0AwE6VperG0dSuveieI7JnWTv
 +FwjjjMpTN0OA6TUknYgItscur1L4kAv00H/V+u6p3s2piJOYlngd6q5U g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="282145186"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="282145186"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="600019696"
Received: from jpulito-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.255.231.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:33 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/gt: Revert ggtt_resume to previous logic
Date: Sat, 19 Mar 2022 12:42:27 -0700
Message-Id: <20220319194227.297639-5-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220319194227.297639-1-michael.cheng@intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, thomas.hellstrom@linux.intel.com,
 michael.cheng@intel.com, wayne.boyer@intel.com, daniel.vetter@ffwll.ch,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To avoid having to call wbinvd_on_all_cpus, revert i915_ggtt_resume and
i915_ggtt_resume_vm to previous logic [1].

[1]. 64b95df91f44 drm/i915: Assume exclusive access to objects inside resume

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 17 ++++++-----------
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  2 +-
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 04191fe2ee34..811bfd9d8d80 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1305,10 +1305,9 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt)
  * Returns %true if restoring the mapping for any object that was in a write
  * domain before suspend.
  */
-bool i915_ggtt_resume_vm(struct i915_address_space *vm)
+void i915_ggtt_resume_vm(struct i915_address_space *vm)
 {
 	struct i915_vma *vma;
-	bool write_domain_objs = false;
 
 	drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
 
@@ -1325,28 +1324,24 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 		vma->ops->bind_vma(vm, NULL, vma->resource,
 				   obj ? obj->cache_level : 0,
 				   was_bound);
-		if (obj) { /* only used during resume => exclusive access */
-			write_domain_objs |= fetch_and_zero(&obj->write_domain);
-			obj->read_domains |= I915_GEM_DOMAIN_GTT;
+		if (obj) {
+			i915_gem_object_lock(obj, NULL);
+			WARN_ON(i915_gem_object_set_to_gtt_domain(obj, false));
+			i915_gem_object_unlock(obj);
 		}
 	}
 
-	return write_domain_objs;
 }
 
 void i915_ggtt_resume(struct i915_ggtt *ggtt)
 {
-	bool flush;
 
 	intel_gt_check_and_clear_faults(ggtt->vm.gt);
 
-	flush = i915_ggtt_resume_vm(&ggtt->vm);
+	i915_ggtt_resume_vm(&ggtt->vm);
 
 	ggtt->invalidate(ggtt);
 
-	if (flush)
-		wbinvd_on_all_cpus();
-
 	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
 		setup_private_pat(ggtt->vm.gt->uncore);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 4529b5e9f6e6..c86092054988 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -567,7 +567,7 @@ struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt,
 				     unsigned long lmem_pt_obj_flags);
 
 void i915_ggtt_suspend_vm(struct i915_address_space *vm);
-bool i915_ggtt_resume_vm(struct i915_address_space *vm);
+void i915_ggtt_resume_vm(struct i915_address_space *vm);
 void i915_ggtt_suspend(struct i915_ggtt *gtt);
 void i915_ggtt_resume(struct i915_ggtt *ggtt);
 
-- 
2.25.1

