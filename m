Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D47E959C3D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC12710E8FF;
	Wed, 21 Aug 2024 12:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWAU/a0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156D310E8FF;
 Wed, 21 Aug 2024 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244328; x=1755780328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=avMTXjpHBEsLWS+hqfPrimZ0qbyak1ZnLZqsVuT/rJE=;
 b=HWAU/a0D7Hw7QIq2hi7sO1zMRMFEzWYsIF1CwpJGuMsa21/sawfpXmxq
 O7T6Kip7AuCdJJ0C9puOJMrF+jPjcYp2qNiKkfCMMW2uClfV7YOejCrQI
 o6VUnoq4ngVYsA7DgHqWZf1BtqjrqPxD2sVr04n/gvlb5e6KHvwz/DmQk
 QdUDFBZssr+rPC8sw0YQMSWUFsaEb/C9t3/HTnAtNHpKcUKPbrhJZqedw
 whP+SevN62f4zkLp1kN8WlAhq+SDKVVVZIgm6Eds0TlyuEjFeLKera1kO
 aomsZzuTkUc0ehNmQ9gEQJlK3qAbuGraClcPQSwtFhlUXvMu9dGm5sroy A==;
X-CSE-ConnectionGUID: RTaeU6cTQhyuiJ/uiiqWKA==
X-CSE-MsgGUID: I436D8ZnQheEE125oMHIZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40059762"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40059762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:27 -0700
X-CSE-ConnectionGUID: JezM4A/7SYKIpHXyZ/2ZZQ==
X-CSE-MsgGUID: QwTZ2GVyShKsHnsix5l8oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61052295"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:27 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 12/14] drm/i915/gt: Isolate single sysfs engine file
 creation
Date: Wed, 21 Aug 2024 14:43:47 +0200
Message-ID: <20240821124349.295259-13-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gt/sysfs_engines.c | 76 ++++++++++++++++---------
 drivers/gpu/drm/i915/gt/sysfs_engines.h |  2 +
 2 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index f67f76df1cfe..fd1685f81505 100644
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
@@ -497,7 +498,50 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 #endif
 		NULL
 	};
+	struct kobject *dir = engine->i915->sysfs_engine;
+	struct kobject *kobj = engine->kobj;
+	int err;
+
+	if (!kobj) {
+		kobj = kobj_engine(dir, engine);
+		if (!kobj) {
+			err = -EFAULT;
+			goto err_engine;
+		}
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
@@ -509,34 +553,10 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 	i915->sysfs_engine = dir;
 
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

