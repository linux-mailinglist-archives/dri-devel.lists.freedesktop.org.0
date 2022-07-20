Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDC57B459
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 12:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73D611A831;
	Wed, 20 Jul 2022 10:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982B311A831;
 Wed, 20 Jul 2022 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658312239; x=1689848239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kbIA9F2nesf8cCzHMeeWiZJ3SXBcx+oFl6bHtEenIGE=;
 b=P3LSwuF7n1LCcCqertIGfhrD6dTEkiyazcj9wIsmuwZ0zrxb0QhyOks1
 /xLvd0hubCIovSeB7VDJqoozCjKKqMU0Bjo4hd1RCz7oKnd5uk/ySp8r6
 8kHLL1spQafGQG/dGUf3AJ6frCYIV1rWRfzjJu+sxOfJyjWpJOGo0rmSm
 4GPWNROlBaec9HNU5UJjcorVNrvvndfhSm+jXl8j1y6Zr82Lc0WlaGqOr
 Wz6DfqrA8QlECqDhY2x8LhjSMq0EM0DOn+PVc1jaJirjp8VkPs2cTxBJ0
 TLTsOqgNLzo/TOxIL1wYOZVqIZOOgaGWdriQHo9O1s/ji0pig7ertWBTH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="269764425"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="269764425"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 03:17:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="625604475"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.21.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 03:17:14 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gem: Avoid taking runtime-pm under the shrinker
Date: Wed, 20 Jul 2022 12:16:51 +0200
Message-Id: <20220720101652.93293-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Inside the shrinker, we cannot wake the device as that may cause
recursion into fs-reclaim, so instead we only unbind vma if the device
is currently awake. (In order to provide reclaim while asleep, we do
wake the device up during kswapd -- we probably want to limit that wake
up if we have anything to shrink though!)

To avoid the same fs_reclaim recursion potential during
i915_gem_object_unbind, we acquire a wakeref there, see commit
3e817471a34c ("drm/i915/gem: Take runtime-pm wakeref prior to unbinding").
However, we use i915_gem_object_unbind from the shrinker path to make the
object available for shrinking and so we must make the wakeref acquisition
here conditional.

<4> [437.542172] ======================================================
<4> [437.542174] WARNING: possible circular locking dependency detected
<4> [437.542176] 5.19.0-rc6-CI_DRM_11876-g2305e0d00665+ #1 Tainted: G     U
<4> [437.542179] ------------------------------------------------------
<4> [437.542181] kswapd0/93 is trying to acquire lock:
<4> [437.542183] ffffffff827a7608 (acpi_wakeup_lock){+.+.}-{3:3}, at: acpi_device_wakeup_disable+0x12/0x50
<4> [437.542191]
but task is already holding lock:
<4> [437.542194] ffffffff8275d360 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x91/0x5c0
<4> [437.542199]
which lock already depends on the new lock.
<4> [437.542202]
the existing dependency chain (in reverse order) is:
<4> [437.542204]
-> #2 (fs_reclaim){+.+.}-{0:0}:
<4> [437.542207]        fs_reclaim_acquire+0x9d/0xd0
<4> [437.542211]        kmem_cache_alloc_trace+0x2a/0x250
<4> [437.542214]        __acpi_device_add+0x263/0x3a0
<4> [437.542217]        acpi_add_single_object+0x3ea/0x710
<4> [437.542220]        acpi_bus_check_add+0xf7/0x240
<4> [437.542222]        acpi_bus_scan+0x34/0xf0
<4> [437.542224]        acpi_scan_init+0xf5/0x241
<4> [437.542228]        acpi_init+0x449/0x4aa
<4> [437.542230]        do_one_initcall+0x53/0x2e0
<4> [437.542233]        kernel_init_freeable+0x18f/0x1dd
<4> [437.542236]        kernel_init+0x11/0x110
<4> [437.542239]        ret_from_fork+0x1f/0x30
<4> [437.542241]
-> #1 (acpi_device_lock){+.+.}-{3:3}:
<4> [437.542245]        __mutex_lock+0x97/0xf20
<4> [437.542246]        acpi_enable_wakeup_device_power+0x30/0xf0
<4> [437.542249]        __acpi_device_wakeup_enable+0x31/0x110
<4> [437.542252]        acpi_pm_set_device_wakeup+0x55/0x100
<4> [437.542254]        __pci_enable_wake+0x5e/0xa0
<4> [437.542257]        pci_finish_runtime_suspend+0x32/0x70
<4> [437.542259]        pci_pm_runtime_suspend+0xa3/0x160
<4> [437.542262]        __rpm_callback+0x3d/0x110
<4> [437.542265]        rpm_callback+0x54/0x60
<4> [437.542268]        rpm_suspend.part.10+0x105/0x5a0
<4> [437.542270]        pm_runtime_work+0x7d/0x1e0
<4> [437.542273]        process_one_work+0x272/0x5c0
<4> [437.542276]        worker_thread+0x37/0x370
<4> [437.542278]        kthread+0xed/0x120
<4> [437.542280]        ret_from_fork+0x1f/0x30
<4> [437.542282]
-> #0 (acpi_wakeup_lock){+.+.}-{3:3}:
<4> [437.542285]        __lock_acquire+0x15ad/0x2940
<4> [437.542288]        lock_acquire+0xd3/0x310
<4> [437.542291]        __mutex_lock+0x97/0xf20
<4> [437.542293]        acpi_device_wakeup_disable+0x12/0x50
<4> [437.542295]        acpi_pm_set_device_wakeup+0x6e/0x100
<4> [437.542297]        __pci_enable_wake+0x73/0xa0
<4> [437.542300]        pci_pm_runtime_resume+0x45/0x90
<4> [437.542302]        __rpm_callback+0x3d/0x110
<4> [437.542304]        rpm_callback+0x54/0x60
<4> [437.542307]        rpm_resume+0x54f/0x750
<4> [437.542309]        __pm_runtime_resume+0x42/0x80
<4> [437.542311]        __intel_runtime_pm_get+0x19/0x80 [i915]
<4> [437.542386]        i915_gem_object_unbind+0x8f/0x3b0 [i915]
<4> [437.542487]        i915_gem_shrink+0x634/0x850 [i915]
<4> [437.542584]        i915_gem_shrinker_scan+0x3a/0xc0 [i915]
<4> [437.542679]        shrink_slab.constprop.97+0x1a4/0x4f0
<4> [437.542684]        shrink_node+0x21e/0x420
<4> [437.542687]        balance_pgdat+0x241/0x5c0
<4> [437.542690]        kswapd+0x229/0x4f0
<4> [437.542694]        kthread+0xed/0x120
<4> [437.542697]        ret_from_fork+0x1f/0x30
<4> [437.542701]
other info that might help us debug this:
<4> [437.542705] Chain exists of:
  acpi_wakeup_lock --> acpi_device_lock --> fs_reclaim
<4> [437.542713]  Possible unsafe locking scenario:
<4> [437.542716]        CPU0                    CPU1
<4> [437.542719]        ----                    ----
<4> [437.542721]   lock(fs_reclaim);
<4> [437.542725]                                lock(acpi_device_lock);
<4> [437.542728]                                lock(fs_reclaim);
<4> [437.542732]   lock(acpi_wakeup_lock);
<4> [437.542736]
 *** DEADLOCK ***

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6449
Fixes: 3e817471a34c ("drm/i915/gem: Take runtime-pm wakeref prior to unbinding")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v5.6+
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 702e5b89be22..910a6fde5726 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -119,8 +119,8 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 {
 	struct intel_runtime_pm *rpm = &to_i915(obj->base.dev)->runtime_pm;
 	bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
+	intel_wakeref_t wakeref = 0;
 	LIST_HEAD(still_in_list);
-	intel_wakeref_t wakeref;
 	struct i915_vma *vma;
 	int ret;
 
@@ -135,7 +135,8 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 	 * as they are required by the shrinker. Ergo, we wake the device up
 	 * first just in case.
 	 */
-	wakeref = intel_runtime_pm_get(rpm);
+	if (!(flags & I915_GEM_OBJECT_UNBIND_TEST))
+		wakeref = intel_runtime_pm_get(rpm);
 
 try_again:
 	ret = 0;
@@ -200,7 +201,8 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 		goto try_again;
 	}
 
-	intel_runtime_pm_put(rpm, wakeref);
+	if (wakeref)
+		intel_runtime_pm_put(rpm, wakeref);
 
 	return ret;
 }
-- 
2.25.1

