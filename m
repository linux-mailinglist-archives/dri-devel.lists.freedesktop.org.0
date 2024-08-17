Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B049559C2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C87D10E10B;
	Sat, 17 Aug 2024 21:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JleP4JL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB4B10E10B;
 Sat, 17 Aug 2024 21:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928505; x=1755464505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q5PxyC1tnw8apAtefvtXAp7XORqkFfgrpqmzyOQHLDY=;
 b=JleP4JL6crAqR7sB9r22ea/6Pk540dy+KzzadQzbJZ6y2r3C2WFEcNa5
 2v6NQ5KcjdBEEH+Sp9peTarINnr2LVb0CwpjkxZ9/ziQftaBG0MAJIsSV
 yfehWvturgbKQiMkXc0uI92QNMLb/89T5MzMZTBi7hgSnAJti7oJOE8B/
 ol0MxfnbkvWtZuKlU5gv1TZQb0+eA4jGUaycUqc9YvxeL+Yr1BFtJ2exN
 D14W39RYoFJHggtexczBvkfQ7qAiXjIPs8Ip5RTfqMmSs3h0EcPrhBGPG
 lWQzu4qGtqPSmtWplcv6BFF28v2lUPuGlYtbFhOXI72hgBqA475kx5lre A==;
X-CSE-ConnectionGUID: LdBBZb4PRjiuk7k/RgMIkQ==
X-CSE-MsgGUID: nfIuOn8TS8yAc904KHcs6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32775447"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="32775447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:45 -0700
X-CSE-ConnectionGUID: D2FKMOTPT8CYAmgBb1lIyQ==
X-CSE-MsgGUID: LL4BF6CER+6bHr+FvUa4Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64382576"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:42 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 09/11] drm/i915/gt: Isolate single sysfs engine file
 creation
Date: Sat, 17 Aug 2024 23:00:24 +0200
Message-ID: <20240817210026.310645-10-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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
index d0bb2aa561ed..3356fadce327 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -9,6 +9,7 @@
 #include "i915_drv.h"
 #include "intel_engine.h"
 #include "intel_engine_heartbeat.h"
+#include "intel_gt_print.h"
 #include "sysfs_engines.h"
 
 struct kobj_engine {
@@ -483,7 +484,7 @@ static void add_defaults(struct kobj_engine *parent)
 	parent->engine->kobj_defaults = &ke->base;
 }
 
-void intel_engines_add_sysfs(struct drm_i915_private *i915)
+int intel_engine_add_single_sysfs(struct intel_engine_cs *engine)
 {
 	static const struct attribute * const files[] = {
 		&name_attr.attr,
@@ -499,46 +500,64 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 #endif
 		NULL
 	};
+	struct kobject *dir = engine->i915->sysfs_engine;
+	struct kobject *kobj = engine->kobj;
+	int err;
 
-	struct device *kdev = i915->drm.primary->kdev;
-	struct intel_engine_cs *engine;
-	struct kobject *dir;
-
-	dir = kobject_create_and_add("engine", &kdev->kobj);
-	if (!dir)
-		return;
-
-	i915->sysfs_engine = dir;
-
-	for_each_uabi_engine(engine, i915) {
-		struct kobject *kobj;
-
+	if (!kobj) {
 		kobj = kobj_engine(dir, engine);
 		if (!kobj)
 			goto err_engine;
+	}
 
-		if (sysfs_create_files(kobj, files))
+	err = sysfs_create_files(kobj, files);
+	if (err)
+		goto err_object;
+
+	if (intel_engine_has_timeslices(engine)) {
+		err = sysfs_create_file(kobj, &timeslice_duration_attr.attr);
+		if (err)
 			goto err_object;
+	}
 
-		if (intel_engine_has_timeslices(engine) &&
-		    sysfs_create_file(kobj, &timeslice_duration_attr.attr))
-			goto err_engine;
+	if (intel_engine_has_preempt_reset(engine)) {
+		err = sysfs_create_file(kobj, &preempt_timeout_attr.attr);
+		if (err)
+			goto err_object;
+	}
 
-		if (intel_engine_has_preempt_reset(engine) &&
-		    sysfs_create_file(kobj, &preempt_timeout_attr.attr))
-			goto err_engine;
+	add_defaults(container_of(kobj, struct kobj_engine, base));
 
-		add_defaults(container_of(kobj, struct kobj_engine, base));
+	engine->kobj = kobj;
 
-		engine->kobj = kobj;
+	return 0;
 
-		if (0) {
 err_object:
-			kobject_put(kobj);
+	kobject_put(kobj);
 err_engine:
-			dev_err(kdev, "Failed to add sysfs engine '%s'\n",
-				engine->name);
+	gt_err(engine->gt, "Failed to add sysfs engine '%s'\n",
+		engine->name);
+
+	return err;
+}
+
+void intel_engines_add_sysfs(struct drm_i915_private *i915)
+{
+	struct device *kdev = i915->drm.primary->kdev;
+	struct intel_engine_cs *engine;
+	struct kobject *dir;
+
+	dir = kobject_create_and_add("engine", &kdev->kobj);
+	if (!dir)
+		return;
+
+	i915->sysfs_engine = dir;
+
+	for_each_uabi_engine(engine, i915) {
+		int err;
+
+		err = intel_engine_add_single_sysfs(engine);
+		if (err)
 			break;
-		}
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
2.45.2

