Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3C3F49CA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 13:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396A689DA9;
	Mon, 23 Aug 2021 11:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061D389D9B;
 Mon, 23 Aug 2021 11:29:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="197331612"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="197331612"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 04:29:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="525910335"
Received: from mhartley-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.253.18])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 04:29:22 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 David M Nieto <David.Nieto@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC 8/8] drm/amdgpu: Convert to common fdinfo format
Date: Mon, 23 Aug 2021 12:28:59 +0100
Message-Id: <20210823112859.103561-9-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823112859.103561-1-tvrtko.ursulin@linux.intel.com>
References: <20210823112859.103561-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Convert fdinfo format to one documented in drm-usage-stats.rst.

Opens:
 * Does it work for AMD?
 * What are the semantics of AMD engine utilisation reported in percents?
   Can it align with what i915 does or needs to document the alternative
   in the specification document?

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: David M Nieto <David.Nieto@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/amdgpu.rst               | 26 ++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst      |  7 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 19 +++++++++++-----
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
index 364680cdad2e..b9b79c810f28 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu.rst
@@ -322,3 +322,29 @@ smartshift_bias
 
 .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: smartshift_bias
+
+.. _amdgpu-usage-stats:
+
+amdgpu DRM client usage stats implementation
+============================================
+
+The amdgpu driver implements the DRM client usage stats specification as
+documented in :ref:`drm-client-usage-stats`.
+
+Example of the output showing the implemented key value pairs and entirety of
+the currenly possible format options:
+
+::
+
+      pos:    0
+      flags:  0100002
+      mnt_id: 21
+      drm-driver: amdgpu
+      drm-pdev:   0000:00:02.0
+      drm-client-id:      7
+      drm-engine-... TODO
+      drm-memory-... TODO
+
+Possible `drm-engine-` key names are: ``,... TODO.
+
+Possible `drm-memory-` key names are: ``,... TODO.
diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 6952f8389d07..f02a51130cba 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -69,7 +69,7 @@ scope of each device, in which case `drm-pdev` shall be present as well.
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
-- drm-engine-<str>: <uint> ns
+- drm-engine-<str>: <uint> [ns|%]
 
 GPUs usually contain multiple execution engines. Each shall be given a stable
 and unique name (str), with possible values documented in the driver specific
@@ -84,6 +84,9 @@ larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
 value until a monotonic update is seen.
 
+Where time unit is given as a percentage...[AMD folks to fill the semantics
+and interpretation of that]...
+
 - drm-memory-<str>: <uint> [KiB|MiB]
 
 Each possible memory type which can be used to store buffer objects by the
@@ -101,3 +104,5 @@ Driver specific implementations
 ===============================
 
 :ref:`i915-usage-stats`
+
+:ref:`amdgpu-usage-stats`
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index d94c5419ec25..2023a9a6bb47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -32,6 +32,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_vm.h"
@@ -76,11 +77,19 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
 	}
 	amdgpu_vm_get_memory(&fpriv->vm, &vram_mem, &gtt_mem, &cpu_mem);
 	amdgpu_bo_unreserve(fpriv->vm.root.bo);
-	seq_printf(m, "pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, bus,
+
+	/*
+	 * ******************************************************************
+	 * For text output format description please see drm-usage-stats.rst!
+	 * ******************************************************************
+	 */
+
+	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
+	seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, bus,
 			dev, fn, fpriv->vm.pasid);
-	seq_printf(m, "vram mem:\t%llu kB\n", vram_mem/1024UL);
-	seq_printf(m, "gtt mem:\t%llu kB\n", gtt_mem/1024UL);
-	seq_printf(m, "cpu mem:\t%llu kB\n", cpu_mem/1024UL);
+	seq_printf(m, "drm-memory-vram:\t%llu KiB\n", vram_mem/1024UL);
+	seq_printf(m, "drm-memory-gtt:\t%llu KiB\n", gtt_mem/1024UL);
+	seq_printf(m, "drm-memory-cpu:\t%llu KiB\n", cpu_mem/1024UL);
 	for (i = 0; i < AMDGPU_HW_IP_NUM; i++) {
 		uint32_t count = amdgpu_ctx_num_entities[i];
 		int idx = 0;
@@ -96,7 +105,7 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
 			perc = div64_u64(10000 * total, min);
 			frac = perc % 100;
 
-			seq_printf(m, "%s%d:\t%d.%d%%\n",
+			seq_printf(m, "drm-engine-%s%d:\t%d.%d %%\n",
 					amdgpu_ip_name[i],
 					idx, perc/100, frac);
 		}
-- 
2.30.2

