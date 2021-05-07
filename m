Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFF8376227
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 10:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DB16EDEE;
	Fri,  7 May 2021 08:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3736EDE7;
 Fri,  7 May 2021 08:35:30 +0000 (UTC)
IronPort-SDR: p3xbws7TGKOiciBOTRKnAirz16+Y9xB52l2cwhUsATlGqeWlAgVYb3PacTbuXiPYBxR0RVd3+X
 +lCsBYQRlOlQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="178922486"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="178922486"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 01:35:30 -0700
IronPort-SDR: w+rMWRsWjiCUpl8bTnE4mDObbVv+/2ciduwdVP3kodd2jgoA0uxowkjcOp8En60i2kR4/zF69k
 YXQA3yAqJquQ==
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="533394481"
Received: from ddselkir-mobl2.amr.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.244.245])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 01:35:28 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Stop propagating fence errors by default
Date: Fri,  7 May 2021 09:35:21 +0100
Message-Id: <20210507083521.2406201-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marcin Slusarz <marcin.slusarz@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This is an alternative proposed fix for the below references bug report
where dma fence error propagation is causing undesirable change in
behaviour post GPU hang/reset.

Approach in this patch is to simply stop propagating all dma fence errors
by default since that seems to be the upstream ask.

To handle the case where i915 needs error propagation for security, I add
a new dma fence flag DMA_FENCE_FLAG_PROPAGATE_ERROR and make use of it in
the command parsing chain only.

It sounds a plausible argument that fence propagation could be useful in
which case a core flag to enable opt-in should be universally useful.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
Reported-by: Miroslav Bendik
References: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
References: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
Cc: Jason Ekstrand <jason.ekstrand@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
 drivers/gpu/drm/i915/i915_sw_fence.c           | 8 ++++----
 drivers/gpu/drm/i915/i915_sw_fence.h           | 8 ++++++++
 include/linux/dma-fence.h                      | 1 +
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99..6a516d1261d0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2522,6 +2522,8 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
 	}
 
 	dma_fence_work_init(&pw->base, &eb_parse_ops);
+	/* Propagate errors for security. */
+	__set_bit(DMA_FENCE_FLAG_PROPAGATE_ERROR, &pw->base.dma.flags);
 
 	pw->engine = eb->engine;
 	pw->batch = eb->batch->vma;
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 2744558f3050..2ee917932ccf 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -449,7 +449,7 @@ static void dma_i915_sw_fence_wake_timer(struct dma_fence *dma,
 
 	fence = xchg(&cb->base.fence, NULL);
 	if (fence) {
-		i915_sw_fence_set_error_once(fence, dma->error);
+		i915_sw_fence_propagate_dma_fence_error(fence, dma);
 		i915_sw_fence_complete(fence);
 	}
 
@@ -480,7 +480,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
 	if (dma_fence_is_signaled(dma)) {
-		i915_sw_fence_set_error_once(fence, dma->error);
+		i915_sw_fence_propagate_dma_fence_error(fence, dma);
 		return 0;
 	}
 
@@ -496,7 +496,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 		if (ret)
 			return ret;
 
-		i915_sw_fence_set_error_once(fence, dma->error);
+		i915_sw_fence_propagate_dma_fence_error(fence, dma);
 		return 0;
 	}
 
@@ -548,7 +548,7 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 	debug_fence_assert(fence);
 
 	if (dma_fence_is_signaled(dma)) {
-		i915_sw_fence_set_error_once(fence, dma->error);
+		i915_sw_fence_propagate_dma_fence_error(fence, dma);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index 30a863353ee6..872ef80ebd10 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -116,4 +116,12 @@ i915_sw_fence_set_error_once(struct i915_sw_fence *fence, int error)
 		cmpxchg(&fence->error, 0, error);
 }
 
+static inline void
+i915_sw_fence_propagate_dma_fence_error(struct i915_sw_fence *fence,
+					struct dma_fence *dma)
+{
+	if (unlikely(test_bit(DMA_FENCE_FLAG_PROPAGATE_ERROR, &dma->flags)))
+		i915_sw_fence_set_error_once(fence, dma->error);
+}
+
 #endif /* _I915_SW_FENCE_H_ */
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..8dabe1650f11 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_PROPAGATE_ERROR,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
-- 
2.30.2

