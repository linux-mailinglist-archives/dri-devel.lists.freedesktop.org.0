Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E588655C93
	for <lists+dri-devel@lfdr.de>; Sun, 25 Dec 2022 08:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD35A10E11B;
	Sun, 25 Dec 2022 07:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF3A10E11B;
 Sun, 25 Dec 2022 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671954490; bh=aBta368pCzAXtdUGLmcTgKPtuQS+E+6V5AUDhc5bAYg=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=Yb4s9iD8tadJFgSm4v5UFdKvDkq10qjgFGfAIIPbyK+bxyf3nwKeqxyN7pdDwghwd
 Km/v/eEVcA7iSWFbDql4qNYLmQBQ0LlvqdRpSexEE3LFrIvFpOGXH0g2MjTLOC24ID
 cwoUsW3Y3AqB+wp2E0ME/ENz8kF0N+R0Xxfj7+mc=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 25 Dec 2022 08:48:10 +0100 (CET)
X-EA-Auth: NixFvOfkNIjC/V/jyidk3xF9ifjT9WgqJGK5iP0nd0HTff1Tpd/mTcntT0tjjTYLbIT+FAfQOfJhuMAHEzlVq6dnT+wDu5c9
Date: Sun, 25 Dec 2022 13:18:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/i915/selftests: Convert atomic_* API calls for
 i915_active.count refcount_*
Message-ID: <1cce7ada5c91f81f9b3d6b2d68eb7fda4dd9fbf7.1671952191.git.drv@mailo.com>
References: <cover.1671952191.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1671952191.git.drv@mailo.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle the struct i915_active member variable count transition from
atomic_t type to refcount_t type for selftest use cases. Transition the
atomic_*() API calls to their equivalent refcount_*() API calls.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Please note:
   1. Proposed changes are compile tested only.
   2. This patch 2/2 is required to be applied after patch 1/2 due to
      inter dependency.

Changes in v2:
   1. Patch added to patch series.
   2. Handle build issues Reported-by: kernel test robot <lkp@intel.com>
      Include changes for i915/selftests use cases for atomic_* to refcount_*
      transition.


 drivers/gpu/drm/i915/selftests/i915_active.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index b61fe850e924..f1eca59e0180 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -125,9 +125,9 @@ __live_active_setup(struct drm_i915_private *i915)
 		pr_err("i915_active retired before submission!\n");
 		err = -EINVAL;
 	}
-	if (atomic_read(&active->base.count) != count) {
+	if (refcount_read(&active->base.count) != count) {
 		pr_err("i915_active not tracking all requests, found %d, expected %d\n",
-		       atomic_read(&active->base.count), count);
+		       refcount_read(&active->base.count), count);
 		err = -EINVAL;
 	}

@@ -279,7 +279,7 @@ static struct intel_engine_cs *node_to_barrier(struct active_node *it)
 void i915_active_print(struct i915_active *ref, struct drm_printer *m)
 {
 	drm_printf(m, "active %ps:%ps\n", ref->active, ref->retire);
-	drm_printf(m, "\tcount: %d\n", atomic_read(&ref->count));
+	drm_printf(m, "\tcount: %d\n", refcount_read(&ref->count));
 	drm_printf(m, "\tpreallocated barriers? %s\n",
 		   str_yes_no(!llist_empty(&ref->preallocated_barriers)));

@@ -324,7 +324,7 @@ static void active_flush(struct i915_active *ref,
 	spin_lock_irq(fence->lock);
 	__list_del_entry(&active->cb.node);
 	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
-	atomic_dec(&ref->count);
+	refcount_dec(&ref->count);

 	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
 }
--
2.34.1



