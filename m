Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DAFA6DB9B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBED10E418;
	Mon, 24 Mar 2025 13:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/67rIR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C91910E417;
 Mon, 24 Mar 2025 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823109; x=1774359109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeLz/XchHAbw0hNN6fJDVTMPfBUgq6Y9ga9vEaBEsVs=;
 b=G/67rIR6Fhn7NEY6M/4NNS7vZ002Euv+z28eQHbRIovUayzPxniChht8
 JIWxlS9691B0fQc3P1MrUc0WO8xLoTbwrJRn9Z5jVP2T3SY5MBS9e0d+j
 nu4H7wwBoVvZfv5B2RxaGfiSoLbKSu8j3kCANIB9TDZGMiChv8Y5Q/GK7
 fkDtTKkm9B8SZM1cVMdBJB3t7QS46RgeJvt3EQAEK+N5BeA4vNGi603bS
 LLTFxjT3X9jyVy3bYnnltQ8CipjK+cGS3DovD9Vai6dEIix9SBz5Kg0X/
 rV2067ZbJ+48Mnxi3GKfcohQFBRQXJ5bp3ixtAoxS9ynLGM8C9Txd/SAc Q==;
X-CSE-ConnectionGUID: a2f3SlL/RAGytUstH2A3xw==
X-CSE-MsgGUID: 4adrt1qFSeuxbOsaaX8bTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="66493452"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="66493452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:48 -0700
X-CSE-ConnectionGUID: R9teW9FSRNukGDiQvkGV2w==
X-CSE-MsgGUID: sjY5y0Y1SLq3jeE+0pwDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="123847260"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:44 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 13/15] drm/i915/gt: Isolate single sysfs engine file
 creation
Date: Mon, 24 Mar 2025 14:29:49 +0100
Message-ID: <20250324132952.1075209-14-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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

In preparation for upcoming patches, we need the ability to
create and remove individual sysfs files. To facilitate this,
extract from the intel_engines_add_sysfs() function the creation
of individual files.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/sysfs_engines.c | 75 ++++++++++++++++---------
 drivers/gpu/drm/i915/gt/sysfs_engines.h |  2 +
 2 files changed, 49 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index d3d3c67edf34..ef2eda72ac7f 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -9,6 +9,7 @@
 #include "i915_drv.h"
 #include "intel_engine.h"
 #include "intel_engine_heartbeat.h"
+#include "intel_gt_print.h"
 #include "sysfs_engines.h"
 
 struct kobj_engine {
@@ -481,7 +482,7 @@ static void add_defaults(struct kobj_engine *parent)
 		return;
 }
 
-void intel_engines_add_sysfs(struct drm_i915_private *i915)
+int intel_engine_add_single_sysfs(struct intel_engine_cs *engine)
 {
 	static const struct attribute * const files[] = {
 		&name_attr.attr,
@@ -497,7 +498,48 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 #endif
 		NULL
 	};
+	struct kobject *dir = engine->i915->sysfs_engine;
+	struct kobject *kobj = engine->kobj;
+	int err;
+
+	kobj = kobj_engine(dir, engine);
+	if (!kobj) {
+		err = -EFAULT;
+		goto err_engine;
+	}
+
+	err = sysfs_create_files(kobj, files);
+	if (err)
+		goto err_object;
+
+	if (intel_engine_has_timeslices(engine)) {
+		err = sysfs_create_file(kobj, &timeslice_duration_attr.attr);
+		if (err)
+			goto err_object;
+	}
 
+	if (intel_engine_has_preempt_reset(engine)) {
+		err = sysfs_create_file(kobj, &preempt_timeout_attr.attr);
+		if (err)
+			goto err_object;
+	}
+
+	add_defaults(container_of(kobj, struct kobj_engine, base));
+
+	engine->kobj = kobj;
+
+	return 0;
+
+err_object:
+	kobject_put(kobj);
+err_engine:
+	gt_warn(engine->gt, "Failed to add sysfs engine '%s'\n", engine->name);
+
+	return err;
+}
+
+void intel_engines_add_sysfs(struct drm_i915_private *i915)
+{
 	struct device *kdev = i915->drm.primary->kdev;
 	struct intel_engine_cs *engine;
 	struct kobject *dir;
@@ -514,33 +556,10 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 	 * uabi_engines access list with the mutex.
 	 */
 	for_each_uabi_engine(engine, i915) {
-		struct kobject *kobj;
-
-		kobj = kobj_engine(dir, engine);
-		if (!kobj)
-			goto err_engine;
-
-		if (sysfs_create_files(kobj, files))
-			goto err_object;
+		int err;
 
-		if (intel_engine_has_timeslices(engine) &&
-		    sysfs_create_file(kobj, &timeslice_duration_attr.attr))
-			goto err_engine;
-
-		if (intel_engine_has_preempt_reset(engine) &&
-		    sysfs_create_file(kobj, &preempt_timeout_attr.attr))
-			goto err_engine;
-
-		add_defaults(container_of(kobj, struct kobj_engine, base));
-
-		engine->kobj = kobj;
-
-		if (0) {
-err_object:
-			kobject_put(kobj);
-err_engine:
-			dev_warn(kdev, "Failed to add sysfs engine '%s'\n",
-				 engine->name);
-		}
+		err = intel_engine_add_single_sysfs(engine);
+		if (err)
+			break;
 	}
 }
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.h b/drivers/gpu/drm/i915/gt/sysfs_engines.h
index 9546fffe03a7..2e3ec2df14a9 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.h
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.h
@@ -7,7 +7,9 @@
 #define INTEL_ENGINE_SYSFS_H
 
 struct drm_i915_private;
+struct intel_engine_cs;
 
 void intel_engines_add_sysfs(struct drm_i915_private *i915);
+int intel_engine_add_single_sysfs(struct intel_engine_cs *engine);
 
 #endif /* INTEL_ENGINE_SYSFS_H */
-- 
2.47.2

