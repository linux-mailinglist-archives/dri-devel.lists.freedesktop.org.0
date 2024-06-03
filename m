Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729A8D8A95
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 21:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6E710E3D0;
	Mon,  3 Jun 2024 19:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juMM0IPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01F610E399;
 Mon,  3 Jun 2024 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717444514; x=1748980514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VtzBH+yJM2O/lxtVkC3ZhYqHpxjS65fMtREaKLXaoA4=;
 b=juMM0IPp+XJ1WbttfUY0fqBNq5OU04op62+ctA0YnZaiJuIu1C6LYY5F
 eCRis/VVxolWCPdvHxkMC+GsuAhQNpfgsfabQHyl4quPestWwj29S2OIb
 VrlvztDbKddAWJ2HBUDKvxCKxLhRlA3npN/CtV+kRPTzI/IqOfHjMWN8Y
 41zHiTPN2H9d+k/GT23kKzdQfCGUw/Ah0kOsqx7Xc2yrBXnbKDDKE6vOp
 fDuBGTBiW0BrQhH9Oj+Ee2jIyW6KrN3ZMVHsmE6tsC6FrDdjKz36ei+BY
 ZJpGkYHxLs1ek7dVtrQUHwJbOcJC3nc6DTUi5rQYVbDFFxj1Hu/DLeszB A==;
X-CSE-ConnectionGUID: wsng5wfbSQu04i/XnOYptw==
X-CSE-MsgGUID: YEVmSJCpR9GCXqoquQ0AQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13797739"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="13797739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:55:01 -0700
X-CSE-ConnectionGUID: nVUARkNuSKORaVFZsbMinA==
X-CSE-MsgGUID: gNeT4g6+Reymh1mwZ8lOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41919699"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.249.37.25])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:54:57 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/gt: Fix potential UAF by revoke of fence registers
Date: Mon,  3 Jun 2024 21:54:45 +0200
Message-ID: <20240603195446.297690-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

CI has been sporadically reporting the following issue triggered by
igt@i915_selftest@live@hangcheck on ADL-P and similar machines:

<6> [414.049203] i915: Running intel_hangcheck_live_selftests/igt_reset_evict_fence
...
<6> [414.068804] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
<6> [414.068812] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
<3> [414.070354] Unable to pin Y-tiled fence; err:-4
<3> [414.071282] i915_vma_revoke_fence:301 GEM_BUG_ON(!i915_active_is_idle(&fence->active))
...
<4>[  609.603992] ------------[ cut here ]------------
<2>[  609.603995] kernel BUG at drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c:301!
<4>[  609.604003] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
<4>[  609.604006] CPU: 0 PID: 268 Comm: kworker/u64:3 Tainted: G     U  W          6.9.0-CI_DRM_14785-g1ba62f8cea9c+ #1
<4>[  609.604008] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
<4>[  609.604010] Workqueue: i915 __i915_gem_free_work [i915]
<4>[  609.604149] RIP: 0010:i915_vma_revoke_fence+0x187/0x1f0 [i915]
...
<4>[  609.604271] Call Trace:
<4>[  609.604273]  <TASK>
...
<4>[  609.604716]  __i915_vma_evict+0x2e9/0x550 [i915]
<4>[  609.604852]  __i915_vma_unbind+0x7c/0x160 [i915]
<4>[  609.604977]  force_unbind+0x24/0xa0 [i915]
<4>[  609.605098]  i915_vma_destroy+0x2f/0xa0 [i915]
<4>[  609.605210]  __i915_gem_object_pages_fini+0x51/0x2f0 [i915]
<4>[  609.605330]  __i915_gem_free_objects.isra.0+0x6a/0xc0 [i915]
<4>[  609.605440]  process_scheduled_works+0x351/0x690
...

In the past, there were similar failures reported by CI from other IGT
tests, observed on other platforms.

Before commit 63baf4f3d587 ("drm/i915/gt: Only wait for GPU activity
before unbinding a GGTT fence"), i915_vma_revoke_fence() was waiting for
idleness of vma->active via fence_update().   That commit introduced
vma->fence->active in order for the fence_update() to be able to wait
selectively on that one instead of vma->active since only idleness of
fence registers was needed.  But then, another commit 0d86ee35097a
("drm/i915/gt: Make fence revocation unequivocal") replaced the call to
fence_update() in i915_vma_revoke_fence() with only fence_write(), and
also added that GEM_BUG_ON(!i915_active_is_idle(&fence->active)) in front.
No justification was provided on why we might then expect idleness of
vma->fence->active without first waiting on it.

The issue can be potentially caused by a race among revocation of fence
registers on one side and sequential execution of signal callbacks invoked
on completion of a request that was using them on the other, still
processed in parallel to revocation of those fence registers.  Fix it by
waiting for idleness of vma->fence->active in i915_vma_revoke_fence().

Fixes: 0d86ee35097a ("drm/i915/gt: Make fence revocation unequivocal")
Closes: https://gitlab.freedesktop.org/drm/intel/issues/10021
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.8+
---
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 40371b8a9bbbd..93bc1cc1ee7e6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -298,6 +298,7 @@ void i915_vma_revoke_fence(struct i915_vma *vma)
 		return;
 
 	GEM_BUG_ON(fence->vma != vma);
+	i915_active_wait(&fence->active);
 	GEM_BUG_ON(!i915_active_is_idle(&fence->active));
 	GEM_BUG_ON(atomic_read(&fence->pin_count));
 
-- 
2.45.1

