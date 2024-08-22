Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9834F95BD43
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141B510EB9C;
	Thu, 22 Aug 2024 17:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ce9psKNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E349A10EB9C;
 Thu, 22 Aug 2024 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347802; x=1755883802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zChBJbVARlBEXMuJLmxWf6k0vvRpBU5MnnxeObctUSw=;
 b=ce9psKNNt+20+a09Op63xclUbEWXNcKhOVcZVj9DGt6bdZ95UBefDGHT
 awIE7G8B+EGDS78ENxBaePd4jCkYU/G4qmFvH4FOxmtRGwCnvrFf8SdWf
 A7QG39J9BHvHl9yBGFSNR/ukdCEakAG1Mgiwk+kOvdTpzU7FMLXUJqqz4
 ZPVfU1nIl7PA/3PS9yZdeT71xefSJHNAXU22hCxAArRVM/EXZvxZQm4uy
 LnAIdCJ7TAO8ZCzMUPjuAYuaf8qHCkDS8egtjKME6hZhj0FZXM6zHqMq5
 WtDnMjvgkBArPPK6mnklyebPwZlVz9drW6WIMuFx/4uOoDF9R8SmgXKQ2 w==;
X-CSE-ConnectionGUID: ch9fE9yETheZdLZCN7r0pg==
X-CSE-MsgGUID: eueDJKSkR2W0LiX5VAcBhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34164058"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="34164058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:54 -0700
X-CSE-ConnectionGUID: xa+bEQ+QTiuh6U3CMAmeKw==
X-CSE-MsgGUID: 2WBpY0o3R+2WDYs5o2Qd8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="62225847"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:52 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 13/15] drm/i915/gt: Isolate single sysfs engine file
 creation
Date: Thu, 22 Aug 2024 19:28:30 +0200
Message-ID: <20240822172832.494994-14-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gt/sysfs_engines.c | 74 +++++++++++++++----------
 drivers/gpu/drm/i915/gt/sysfs_engines.h |  2 +
 2 files changed, 48 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index c1cc0981c8fb..ef2eda72ac7f 100644
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
+
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
 
+void intel_engines_add_sysfs(struct drm_i915_private *i915)
+{
 	struct device *kdev = i915->drm.primary->kdev;
 	struct intel_engine_cs *engine;
 	struct kobject *dir;
@@ -514,34 +556,10 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
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
-
-		if (intel_engine_has_timeslices(engine) &&
-		    sysfs_create_file(kobj, &timeslice_duration_attr.attr))
-			goto err_engine;
-
-		if (intel_engine_has_preempt_reset(engine) &&
-		    sysfs_create_file(kobj, &preempt_timeout_attr.attr))
-			goto err_engine;
-
-		add_defaults(container_of(kobj, struct kobj_engine, base));
+		int err;
 
-		engine->kobj = kobj;
-
-		if (0) {
-err_object:
-			kobject_put(kobj);
-err_engine:
-			dev_err(kdev, "Failed to add sysfs engine '%s'\n",
-				engine->name);
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

