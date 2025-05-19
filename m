Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DE7ABC290
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFB110E375;
	Mon, 19 May 2025 15:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRHkAExK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E5510E37C;
 Mon, 19 May 2025 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747668897; x=1779204897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MjApHTG+AxHYdEaATDt+6Lis2rHyUAaSKv6o+xGk0BU=;
 b=PRHkAExKHyl3XLNe+XJXTXkAI2aJiTlNE5BaVlb9JysXjH1IcVOj/AgC
 Y9nhmYwzoSB1mPl51Rhbb42tcy+yRP6onsN1yFTqzZTAxV8S3r7THGgTv
 oqG2I++hFE0Po/Q0SGlpYWIx2Ung1s1JI4g2xpBYV9OJGH0ioJJjTxY4S
 ArwzQK/m/kDzL6MWDx3oq+TIIHMWDSj7F7ArUMcdTtpPmmwGUy2ymPkd3
 SWailWzomQsPiBG1RHHBRodORs6KAIEvD3y3O4BEkhPCoic1kLbPz3ETH
 tEHW1ZRKkOgWN/wlEphuFSn/VywInkm2lotHHp6KUIU2594Lf69ORVrVY Q==;
X-CSE-ConnectionGUID: 2/zK7e+cT/6EOPBGt7Z8ng==
X-CSE-MsgGUID: bDBye/nnRhCK97g4ZLRWNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60605765"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60605765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:34:57 -0700
X-CSE-ConnectionGUID: nyNYRCW4RTOP3ABGcJfdMA==
X-CSE-MsgGUID: bemS1eH6TR+kZaxW0ThUow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139905922"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:34:54 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [RFC 2/2] drm/i915: Add protections to sysfs local memory information
Date: Mon, 19 May 2025 17:34:16 +0200
Message-ID: <20250519153418.44543-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
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

Introduce a CAP_PERFMON check when accessing sysfs entries related to
local memory information. Also introduce a intel_memory_info_paranoid
sysctl parameter, which allows the administrator to control whether the
check is enforced.

Exposing local memory information via sysfs, while convenient for users,
is stricly speaking an info leak. Ideally such information should be
guarded behind a capability check. In practice, this might be cumbersome
to deal with, especially on systems where root access is not a problem,
but for some reason applications don't want to be run as root (e.g.
gaming overlays)[1].

Adding a CAP_PERFMON check by default with a way to disable it should be
a nice compromise; this should prevent a full info leak, while a
conscious administrator might go for the convenience instead if a "leak"
is not really a problem on their system.

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 9558e300209b..4e39f76278fb 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -14,7 +14,10 @@
 #include "i915_sysfs.h"
 #include "i915_ttm_buddy_manager.h"
 
+static u32 intel_memory_info_paranoid = 1;
+
 static struct kobject *memory_info_dir;
+static struct ctl_table_header *memory_info_header;
 
 static const struct {
 	u16 class;
@@ -428,6 +431,18 @@ void intel_memory_regions_driver_release(struct drm_i915_private *i915)
 	}
 }
 
+static const struct ctl_table intel_memory_info_table[] = {
+	{
+		.procname	= "memory_info_paranoid",
+		.data		= &intel_memory_info_paranoid,
+		.maxlen		= sizeof(intel_memory_info_paranoid),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+};
+
 static ssize_t
 vram_total_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
@@ -436,7 +451,10 @@ vram_total_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 
 	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
 
-	return sysfs_emit(buf, "%llu\n", mr->total);
+	if (perfmon_capable() || !intel_memory_info_paranoid)
+		return sysfs_emit(buf, "%llu\n", mr->total);
+
+	return sysfs_emit(buf, "0\n");
 }
 
 static const struct kobj_attribute vram_total_attr =
@@ -453,7 +471,10 @@ vram_avail_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
 	intel_memory_region_avail(mr, &unallocated_size, &dummy);
 
-	return sysfs_emit(buf, "%llu\n", unallocated_size);
+	if (perfmon_capable() || !intel_memory_info_paranoid)
+		return sysfs_emit(buf, "%llu\n", unallocated_size);
+
+	return sysfs_emit(buf, "0\n");
 }
 
 static const struct kobj_attribute vram_avail_attr =
@@ -468,7 +489,10 @@ vram_total_visible_show(struct kobject *kobj, struct kobj_attribute *attr, char
 
 	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
 
-	return sysfs_emit(buf, "%llu\n", resource_size(&mr->io));
+	if (perfmon_capable() || !intel_memory_info_paranoid)
+		return sysfs_emit(buf, "%llu\n", resource_size(&mr->io));
+
+	return sysfs_emit(buf, "0\n");
 }
 
 static const struct kobj_attribute vram_total_visible_attr =
@@ -485,7 +509,10 @@ vram_avail_visible_show(struct kobject *kobj, struct kobj_attribute *attr, char
 	mr = intel_memory_region_by_type(kdev_minor_to_i915(dev), INTEL_MEMORY_LOCAL);
 	intel_memory_region_avail(mr, &dummy, &unallocated_cpu_visible_size);
 
-	return sysfs_emit(buf, "%llu\n", unallocated_cpu_visible_size);
+	if (perfmon_capable() || !intel_memory_info_paranoid)
+		return sysfs_emit(buf, "%llu\n", unallocated_cpu_visible_size);
+
+	return sysfs_emit(buf, "0\n");
 }
 
 static const struct kobj_attribute vram_avail_visible_attr =
@@ -507,6 +534,8 @@ int intel_memory_region_setup_sysfs(struct drm_i915_private *i915)
 	if(!intel_memory_region_by_type(i915, INTEL_MEMORY_LOCAL))
 		return 0;
 
+	memory_info_header = register_sysctl("dev/i915", intel_memory_info_table);
+
 	memory_info_dir = kobject_create_and_add("memory_info", &kdev->kobj);
 	if (!memory_info_dir) {
 		drm_warn(&i915->drm, "Failed to create memory_info sysfs directory\n");
@@ -526,6 +555,7 @@ int intel_memory_region_setup_sysfs(struct drm_i915_private *i915)
 int intel_memory_region_teardown_sysfs(void)
 {
 	kobject_put(memory_info_dir);
+	unregister_sysctl_table(memory_info_header);
 	return 0;
 }
 
-- 
2.45.2

