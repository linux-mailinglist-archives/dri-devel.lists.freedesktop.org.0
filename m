Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23089520FAA
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 10:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008710F3D4;
	Tue, 10 May 2022 08:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9B410F3CF;
 Tue, 10 May 2022 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652171058; x=1683707058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZOg0Y5cUcy5gp07l4H0IN65dZHCl9qF1/pDmdGpMyCQ=;
 b=KUNXdGG3KnY2i2MHBrzmYr0CRc2tUiW84VDDu92nQOuvq2dFxT2bZYBe
 E+mGWwo/JOugriJVeFWQlI0uLMIMMVvZkNVLEAzmF49B0Gth5cACoSnPz
 VHvVFUcIhvXfkE3/uMV5UAP0rgyCtwW6HBPIxH84L1zBy5IX9qdiYr55U
 tJZV9WCSaDdXZSxH0adhpppwsWNeypgWN5xTLjgQg/J3xmsljYXPrpt/g
 Tx2fhoOQV6apkJqxB5tw/px69+CAoINA5dicl6H3sdBdXEzqs72xUurg2
 uuDV1mL336w7XjWTWa8lDOh+AG17TDOobf6Xc8uCx0R1PIgjjVcC7c6c4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269441472"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="269441472"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 01:24:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="593381270"
Received: from rcpalaku-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 01:24:15 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: amd-gfx@lists.freedesktop.org
Subject: [RFC] drm/amdgpu: Convert to common fdinfo format
Date: Tue, 10 May 2022 09:23:15 +0100
Message-Id: <20220510082315.992296-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: David M Nieto <David.Nieto@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Convert fdinfo format to one documented in drm-usage-stats.rst.

Opens/TODO:
 * Does someone from AMD want to take over this patch?
    (I have no access to amdgpu hardware so won't be able to test
     any hypothetical gputop work.)
 * What are the semantics of AMD engine utilisation reported in percents?
    * Can it align with what i915 does (same what msm will do) or need
      to document the alternative in the specification document? Both
      option are workable with instantaneous percent only needing support
      to be added to vendor agnostic gputop.
 * Can amdgpu expose drm-client-id? Without it gputop will not work.
 * drm-engine-capacity - does the concept translate etc.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: David M Nieto <David.Nieto@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/amdgpu/usage-stats.rst   | 28 ++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst      |  7 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 18 ++++++++++----
 3 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/usage-stats.rst

diff --git a/Documentation/gpu/amdgpu/usage-stats.rst b/Documentation/gpu/amdgpu/usage-stats.rst
new file mode 100644
index 000000000000..8be5009bd1a9
--- /dev/null
+++ b/Documentation/gpu/amdgpu/usage-stats.rst
@@ -0,0 +1,28 @@
+.. _amdgpu-usage-stats:
+
+============================================
+AMDGPU DRM client usage stats implementation
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
+      drm-pdev:   0000:03:00.0
+      drm-memory-vram: 0 KiB
+      drm-memory-gtt: 0 KiB
+      drm-memory-cpu: 0 KiB
+      drm-engine-...: 0 %
+                 ...
+
+Possible `drm-memory-` key names are: `vram`, `gtt`, `cpu`.
+
+Possible `drm-engine-` key names are: ``.
diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 6c9f166a8d6f..2d0ff6f2cc74 100644
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
 - drm-engine-capacity-<str>: <uint>
 
 Engine identifier string must be the same as the one specified in the
@@ -110,3 +113,5 @@ Driver specific implementations
 ===============================
 
 :ref:`i915-usage-stats`
+
+:ref:`amdgpu-usage-stats`
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 5a6857c44bb6..8cbae61f1b3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -32,6 +32,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_vm.h"
@@ -83,11 +84,18 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
 	amdgpu_bo_unreserve(root);
 	amdgpu_bo_unref(&root);
 
-	seq_printf(m, "pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, bus,
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
@@ -103,7 +111,7 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct file *f)
 			perc = div64_u64(10000 * total, min);
 			frac = perc % 100;
 
-			seq_printf(m, "%s%d:\t%d.%d%%\n",
+			seq_printf(m, "drm-engine-%s%d:\t%d.%d %%\n",
 					amdgpu_ip_name[i],
 					idx, perc/100, frac);
 		}
-- 
2.32.0

