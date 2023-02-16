Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69B69927F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE71510ED2F;
	Thu, 16 Feb 2023 10:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A9C10ED19;
 Thu, 16 Feb 2023 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676545172; x=1708081172;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uk/GmpuW79W2EydXmlCYOB17kdJavbWT9XM7VhTE0PY=;
 b=JofHkxif2i9xyNTbwcZKleb+uDHYaKiN75D4lnuu+AyCd/Kj/Kj+1+Mg
 AUUZSGEf+OFPYGOs64DwPeX47hCplhJKmTno7snu2tAmM8giGiafYNg22
 J7dzwVGmT25bZMMZaX4hzHjecWFSJHRaLJR3KRib3vhgaWSMnXJjRJzE6
 nPTNWy1+WjcNmpVne9Tj4yeXVNAUkZlHksWryGesyxr2TWqxOR72eL+/j
 tEnfO8HhBAIPlMOFqE5c3Z7gKiQjzkulLCF7D77wOvUj+BxVzPf2BdhvG
 PZOW2IvwLY6+SBugV6DaW131qVhgIFCFmjhcctZ9D6OK4EnyFjJyERbH5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311317601"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311317601"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812917912"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="812917912"
Received: from murrayal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.229.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:30 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 3/9] drm/i915: Use fence callback initialization helper
Date: Thu, 16 Feb 2023 10:59:15 +0000
Message-Id: <20230216105921.624960-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the previously added initialization helper to ensure correct operation
of the common code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_active.c | 2 +-
 drivers/gpu/drm/i915/i915_active.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 7412abf166a8..a9483aadb0ff 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -887,7 +887,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 				goto unwind;
 
 			RCU_INIT_POINTER(node->base.fence, NULL);
-			node->base.cb.func = node_retire;
+			__dma_fence_cb_init(&node->base.cb, node_retire);
 			node->timeline = idx;
 			node->ref = ref;
 		}
diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
index 7eb44132183a..da0c5b917cb1 100644
--- a/drivers/gpu/drm/i915/i915_active.h
+++ b/drivers/gpu/drm/i915/i915_active.h
@@ -65,7 +65,7 @@ __i915_active_fence_init(struct i915_active_fence *active,
 			 dma_fence_func_t fn)
 {
 	RCU_INIT_POINTER(active->fence, fence);
-	active->cb.func = fn ?: i915_active_noop;
+	__dma_fence_cb_init(&active->cb, fn ?: i915_active_noop);
 }
 
 #define INIT_ACTIVE_FENCE(A) \
-- 
2.34.1

