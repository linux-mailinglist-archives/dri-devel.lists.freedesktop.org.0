Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF198A2C22
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 12:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F8610E1E4;
	Fri, 12 Apr 2024 10:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWp/FyDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC6D10E1E4;
 Fri, 12 Apr 2024 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712917140; x=1744453140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/BNmY8XLnIE9ZLQjwWFSOPhzNj2EmThxaXuG8cnD7PA=;
 b=XWp/FyDu1zf1ycQy/h4PSv+Ta3uN8BPoDEtqYUYL60srN5UyLvwsoaEI
 1zKvrsuab55VPvtOp2CtCbNQqwlmq9FQ/ZNWlJyx8wY4pEEol7cCi0FH6
 gKA3wmadYOx8i45Nh+DpwhaDnZtxGflElGuUgmqu6i3L4QwOf7v6RcChl
 fkLaDhYkvi+JGf7mhIEzYPqWe8+XNaqBN8clODXeEu7pAZACqj78kjN09
 l3JN6VmXuQdZ0XxqVpMhaRb8dgfQv723H5X5N8obZzPZ1pvxgL8aprQ1m
 62OXkwdDDtY6UM9aqisfOJwrgC6mfbaR0jnnEYs81N0tb/vJTx6v2GyA9 g==;
X-CSE-ConnectionGUID: dm4YDnUWR72RgAo78HiSUg==
X-CSE-MsgGUID: ou2YW6XiQ96ZAFi0cNnRjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19788400"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19788400"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 03:19:00 -0700
X-CSE-ConnectionGUID: IfVim6WjRPqzY4j84Reo5w==
X-CSE-MsgGUID: Uzc+ao14S+qGshYi46qAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21244704"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.19.168])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 03:18:56 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/vma: Fix UAF on reopen vs destroy race
Date: Fri, 12 Apr 2024 12:17:17 +0200
Message-ID: <20240412101840.329836-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

We defer actually closing, unbinding and destroying a VMA until next idle
point, or until the object is freed in the meantime.  By postponing the
unbind, we allow for the VMA to be reopened by the client, avoiding the
work required to rebind the VMA.

It was assumed that as long as a GT is held idle, no VMA would be reopened
while we destroy them.  That assumption is no longer true in multi-GT
configurations, where a VMA we reopen may be handled by a GT different
from the one that we already keep active via its engine while we set up
an execbuf request.

<4> [260.290809] ------------[ cut here ]------------
<4> [260.290988] list_del corruption. prev->next should be ffff888118c5d990, but was ffff888118c5a510. (prev=ffff888118c5a510)
<4> [260.291004] WARNING: CPU: 2 PID: 1143 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xb7/0xe0
..
<4> [260.291055] CPU: 2 PID: 1143 Comm: kms_plane Not tainted 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
<4> [260.291058] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
<4> [260.291060] RIP: 0010:__list_del_entry_valid_or_report+0xb7/0xe0
...
<4> [260.291087] Call Trace:
<4> [260.291089]  <TASK>
<4> [260.291124]  i915_vma_reopen+0x43/0x80 [i915]
<4> [260.291298]  eb_lookup_vmas+0x9cb/0xcc0 [i915]
<4> [260.291579]  i915_gem_do_execbuffer+0xc9a/0x26d0 [i915]
<4> [260.291883]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
...
<4> [260.292301]  </TASK>
...
<4> [260.292506] ---[ end trace 0000000000000000 ]---
<4> [260.292782] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6ca3: 0000 [#1] PREEMPT SMP NOPTI
<4> [260.303575] CPU: 2 PID: 1143 Comm: kms_plane Tainted: G        W          6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
<4> [260.313851] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
<4> [260.326359] RIP: 0010:eb_validate_vmas+0x114/0xd80 [i915]
...
<4> [260.428756] Call Trace:
<4> [260.431192]  <TASK>
<4> [639.283393]  i915_gem_do_execbuffer+0xd05/0x26d0 [i915]
<4> [639.305245]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
...
<4> [639.411134]  </TASK>
...
<4> [639.449979] ---[ end trace 0000000000000000 ]---

Aso soon as we start unbinding and destroing a VMA, marked it as parked,
and also keep it marked as closed for the rest of its life.  When a VMA
to be opened occurs closed, reopen it only if not yet parked.

Fixes: b0647a5e79b1 ("drm/i915: Avoid live-lock with i915_vma_parked()")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10608
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: stable@vger.kernel.org # v6.0+
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 +++++--
 drivers/gpu/drm/i915/i915_vma.c               | 29 +++++++++++++++----
 drivers/gpu/drm/i915/i915_vma.h               |  2 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  3 ++
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 42619fc05de48..97e014f94002e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -847,9 +847,12 @@ static int __eb_add_lut(struct i915_execbuffer *eb,
 	if (unlikely(!lut))
 		return -ENOMEM;
 
+	if (!i915_vma_open(vma)) {
+		err = -EEXIST;	/* let eb_vma_lookup() retry */
+		goto err_lut_free;
+	}
+
 	i915_vma_get(vma);
-	if (!atomic_fetch_inc(&vma->open_count))
-		i915_vma_reopen(vma);
 	lut->handle = handle;
 	lut->ctx = ctx;
 
@@ -880,8 +883,9 @@ static int __eb_add_lut(struct i915_execbuffer *eb,
 	return 0;
 
 err:
-	i915_vma_close(vma);
 	i915_vma_put(vma);
+	i915_vma_close(vma);
+err_lut_free:
 	i915_lut_handle_free(lut);
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index d2f064d2525cc..f9588e039ae1e 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1735,14 +1735,33 @@ static void __i915_vma_remove_closed(struct i915_vma *vma)
 	list_del_init(&vma->closed_link);
 }
 
-void i915_vma_reopen(struct i915_vma *vma)
+static struct i915_vma *i915_vma_reopen(struct i915_vma *vma)
+{
+	if (atomic_read(&vma->flags) & I915_VMA_PARKED)
+		return NULL;
+
+	__i915_vma_remove_closed(vma);
+	return vma;
+}
+
+struct i915_vma *i915_vma_open(struct i915_vma *vma)
 {
 	struct intel_gt *gt = vma->vm->gt;
 
+	if (atomic_inc_not_zero(&vma->open_count))
+		return vma;
+
 	spin_lock_irq(&gt->closed_lock);
-	if (i915_vma_is_closed(vma))
-		__i915_vma_remove_closed(vma);
+	if (!atomic_inc_not_zero(&vma->open_count)) {
+		if (i915_vma_is_closed(vma))
+			vma = i915_vma_reopen(vma);
+
+		if (vma)
+			atomic_inc(&vma->open_count);
+	}
 	spin_unlock_irq(&gt->closed_lock);
+
+	return vma;
 }
 
 static void force_unbind(struct i915_vma *vma)
@@ -1854,22 +1873,22 @@ void i915_vma_parked(struct intel_gt *gt)
 		}
 
 		list_move(&vma->closed_link, &closed);
+		atomic_or(I915_VMA_PARKED, &vma->flags);
 	}
 	spin_unlock_irq(&gt->closed_lock);
 
-	/* As the GT is held idle, no vma can be reopened as we destroy them */
 	list_for_each_entry_safe(vma, next, &closed, closed_link) {
 		struct drm_i915_gem_object *obj = vma->obj;
 		struct i915_address_space *vm = vma->vm;
 
 		if (i915_gem_object_trylock(obj, NULL)) {
-			INIT_LIST_HEAD(&vma->closed_link);
 			i915_vma_destroy(vma);
 			i915_gem_object_unlock(obj);
 		} else {
 			/* back you go.. */
 			spin_lock_irq(&gt->closed_lock);
 			list_add(&vma->closed_link, &gt->closed_vma);
+			atomic_andnot(I915_VMA_PARKED, &vma->flags);
 			spin_unlock_irq(&gt->closed_lock);
 		}
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index e356dfb883d34..331d19672c764 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -268,7 +268,7 @@ int __must_check i915_vma_unbind_async(struct i915_vma *vma, bool trylock_vm);
 int __must_check i915_vma_unbind_unlocked(struct i915_vma *vma);
 void i915_vma_unlink_ctx(struct i915_vma *vma);
 void i915_vma_close(struct i915_vma *vma);
-void i915_vma_reopen(struct i915_vma *vma);
+struct i915_vma *i915_vma_open(struct i915_vma *vma);
 
 void i915_vma_destroy_locked(struct i915_vma *vma);
 void i915_vma_destroy(struct i915_vma *vma);
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 559de74d0b114..41784c3025349 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -263,6 +263,9 @@ struct i915_vma {
 #define I915_VMA_SCANOUT_BIT	17
 #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
 
+#define I915_VMA_PARKED_BIT	18
+#define I915_VMA_PARKED		((int)BIT(I915_VMA_PARKED_BIT))
+
 	struct i915_active active;
 
 #define I915_VMA_PAGES_BIAS 24
-- 
2.44.0

