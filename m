Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF8ABC28E
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 17:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB8D10E237;
	Mon, 19 May 2025 15:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbY/dI15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8866210E237;
 Mon, 19 May 2025 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747668891; x=1779204891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KJLNGIq9l3qCAfwfZbpds0eKYSoRdhdiMtmFgkSvMbs=;
 b=gbY/dI158R/225KK0fwyvjAOxtcDIDMGm1CyA6j26d9HBJxd34JVGAHh
 J5QTgNyUVVabioh7smxxPYvGEUFx+6+PPHAoKnh0k57udffsf58carQdR
 f/9lCEmYn02u3WhtZZBwCwh7Uz3sYv7AklYf6jVv4u0H8yT51lYXFR/I3
 lQR7TKa9/jCG/3ijdLdQ03spXn9suOe48FEgCdAFt6RdBTy53dvK96/OX
 3ShleEFMBM94oEq3m2oBrzzclvZYNSzXMuDZAmBc3cfBkR4AZs01Vc5Dj
 Ne6sJawwLo7R0XScCNiGD6Vyu0bKwIIA40lbJn8gnrKpIMTuIGEAFu+tE Q==;
X-CSE-ConnectionGUID: hMXeRqmSRQSSz6jUYbeUpg==
X-CSE-MsgGUID: hIXFtXjZROiDTkwn16OywA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60605759"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60605759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:34:50 -0700
X-CSE-ConnectionGUID: EWc9/Wr3SeG9B3/mnpafNQ==
X-CSE-MsgGUID: ctfku+nSQfyprKiKZ4lMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139905887"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:34:47 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [RFC 1/2] drm/i915: Expose local memory information via sysfs
Date: Mon, 19 May 2025 17:34:15 +0200
Message-ID: <20250519153418.44543-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce sysfs entries regarding basic local memory information
(unallocated memory and total memory, for both the entire region and the
CPU visible part). This simplifies how external tools might read this
information, which at the point of writing this patch is only accessible
via the i915_query() ioctl.

This change exposes that information to users without CAP_PERFMON.

This change was requested in [1] by a developer of one such external
tool, with the sysfs idea surfacing in a corresponding request for xe [2].

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/i915/i915_sysfs.c          |   6 ++
 drivers/gpu/drm/i915/intel_memory_region.c | 106 +++++++++++++++++++++
 drivers/gpu/drm/i915/intel_memory_region.h |   3 +
 3 files changed, 115 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index f936e8f1f129..048d6da2f6db 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -35,6 +35,8 @@
 #include "gt/intel_rps.h"
 #include "gt/sysfs_engines.h"
 
+#include "intel_memory_region.h"
+
 #include "i915_drv.h"
 #include "i915_sysfs.h"
 
@@ -182,6 +184,8 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
 
 	i915_gpu_error_sysfs_setup(dev_priv);
 
+	intel_memory_region_setup_sysfs(dev_priv);
+
 	intel_engines_add_sysfs(dev_priv);
 }
 
@@ -189,6 +193,8 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
 {
 	struct device *kdev = dev_priv->drm.primary->kdev;
 
+	intel_memory_region_teardown_sysfs();
+
 	i915_gpu_error_sysfs_teardown(dev_priv);
 
 	device_remove_bin_file(kdev, &dpf_attrs_1);
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 59bd603e6deb..9558e300209b 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -3,14 +3,19 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <linux/kobject.h>
 #include <linux/prandom.h>
+#include <linux/sysfs.h>
 
 #include <uapi/drm/i915_drm.h>
 
 #include "intel_memory_region.h"
 #include "i915_drv.h"
+#include "i915_sysfs.h"
 #include "i915_ttm_buddy_manager.h"
 
+static struct kobject *memory_info_dir;
+
 static const struct {
 	u16 class;
 	u16 instance;
@@ -423,6 +428,107 @@ void intel_memory_regions_driver_release(struct drm_i915_private *i915)
 	}
 }
 
+static ssize_t
+vram_total_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj->parent);
+	struct intel_memory_region *mr;
+
+	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
+
+	return sysfs_emit(buf, "%llu\n", mr->total);
+}
+
+static const struct kobj_attribute vram_total_attr =
+__ATTR(vram_total, 0444, vram_total_show, NULL);
+
+static ssize_t
+vram_avail_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj->parent);
+	struct intel_memory_region *mr;
+	u64 unallocated_size;
+	u64 dummy;
+
+	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
+	intel_memory_region_avail(mr, &unallocated_size, &dummy);
+
+	return sysfs_emit(buf, "%llu\n", unallocated_size);
+}
+
+static const struct kobj_attribute vram_avail_attr =
+__ATTR(vram_available, 0444, vram_avail_show, NULL);
+
+
+static ssize_t
+vram_total_visible_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj->parent);
+	struct intel_memory_region *mr;
+
+	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
+
+	return sysfs_emit(buf, "%llu\n", resource_size(&mr->io));
+}
+
+static const struct kobj_attribute vram_total_visible_attr =
+__ATTR(vram_total_cpu_visible, 0444, vram_total_visible_show, NULL);
+
+static ssize_t
+vram_avail_visible_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj->parent);
+	struct intel_memory_region *mr;
+	u64 unallocated_cpu_visible_size;
+	u64 dummy;
+
+	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
+	intel_memory_region_avail(mr, &dummy, &unallocated_cpu_visible_size);
+
+	return sysfs_emit(buf, "%llu\n", unallocated_cpu_visible_size);
+}
+
+static const struct kobj_attribute vram_avail_visible_attr =
+__ATTR(vram_available_cpu_visible, 0444, vram_avail_visible_show, NULL);
+
+int intel_memory_region_setup_sysfs(struct drm_i915_private *i915)
+{
+	static const struct attribute *const files[] = {
+		&vram_total_attr.attr,
+		&vram_avail_attr.attr,
+		&vram_total_visible_attr.attr,
+		&vram_avail_visible_attr.attr,
+		NULL
+	};
+	struct device *kdev = i915->drm.primary->kdev;
+	int err;
+
+	/* Skip this function completely if the system does not support lmem */
+	if(!intel_memory_region_by_type(i915, INTEL_MEMORY_LOCAL))
+		return 0;
+
+	memory_info_dir = kobject_create_and_add("memory_info", &kdev->kobj);
+	if (!memory_info_dir) {
+		drm_warn(&i915->drm, "Failed to create memory_info sysfs directory\n");
+		return -EAGAIN;
+	}
+
+	err = sysfs_create_files(memory_info_dir, files);
+	if (err) {
+		drm_warn(&i915->drm, "Failed to create memory info sysfs files: %d\n", err);
+		kobject_put(memory_info_dir);
+		return err;
+	}
+
+	return 0;
+}
+
+int intel_memory_region_teardown_sysfs(void)
+{
+	kobject_put(memory_info_dir);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/intel_memory_region.c"
 #include "selftests/mock_region.c"
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index b3b75be9ced5..9838eca9344c 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -132,4 +132,7 @@ struct intel_memory_region *
 i915_gem_shmem_setup(struct drm_i915_private *i915,
 		     u16 type, u16 instance);
 
+int intel_memory_region_setup_sysfs(struct drm_i915_private *i915);
+int intel_memory_region_teardown_sysfs(void);
+
 #endif
-- 
2.45.2

