Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69A6A50F4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 03:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D6210E475;
	Tue, 28 Feb 2023 02:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6F310E475;
 Tue, 28 Feb 2023 02:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677550325; x=1709086325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FIenfPmcj9m43p8FWplwCkugQtdS7DimsqqZbxg0K1I=;
 b=NzFJQukKPoGvNURnRI4F8QL8WYJridIedZTOnahH7+48jctQQ+pa/EW1
 y+DCULDwq/RzhKltjv0d7cFCbDeqWEiX8dqMhYsywaXqxlUEV9iH/bwNe
 TB+G2+Q5oWak7rndssRmNwbOFfnzthehfpijjQL9P+dGyvz1SKWPa6pSG
 2lAxY4m1lvXR9agNyNPMcqFeMrwzqFJ4Z8XibDx6wIvniNU/a4HOI2MDC
 K/Un7DeFd0N9bXOrdaa3axaFRaps4oj/I3K3utIjXWsFFBAt6fwjnh8mL
 i77mGkgoEHiubl8HavbosJCwJ0qob2kHbC1H1y2bZtLZ5GSrv6++SKxfl Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322274010"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="322274010"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 18:12:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="816905928"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="816905928"
Received: from gsavorni-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.82])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 18:12:00 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v3 1/2] drm/i915: Throttle for ringspace prior to taking the
 timeline mutex
Date: Tue, 28 Feb 2023 03:11:41 +0100
Message-Id: <20230228021142.1905349-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228021142.1905349-1-andi.shyti@linux.intel.com>
References: <20230228021142.1905349-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi@etezian.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Before taking exclusive ownership of the ring for emitting the request,
wait for space in the ring to become available. This allows others to
take the timeline->mutex to make forward progresses while userspace is
blocked.

In particular, this allows regular clients to issue requests on the
kernel context, potentially filling the ring, but allow the higher
priority heartbeats and pulses to still be submitted without being
blocked by the less critical work.

Fixes: cf586021642d80 ("drm/i915/gt: Pipelined page migration")
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

I'm not sure I need to add the Fixes tag here as this is more
preparatory for the next patch. Together, though, patch 1 and 2
make the fix with proper locking mechanism.

Andi

 drivers/gpu/drm/i915/gt/intel_context.c | 41 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_context.h |  2 ++
 drivers/gpu/drm/i915/i915_request.c     |  3 ++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 2aa63ec521b89..59cd612a23561 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -626,6 +626,47 @@ bool intel_context_revoke(struct intel_context *ce)
 	return ret;
 }
 
+int intel_context_throttle(const struct intel_context *ce)
+{
+	const struct intel_ring *ring = ce->ring;
+	const struct intel_timeline *tl = ce->timeline;
+	struct i915_request *rq;
+	int err = 0;
+
+	if (READ_ONCE(ring->space) >= SZ_1K)
+		return 0;
+
+	rcu_read_lock();
+	list_for_each_entry_reverse(rq, &tl->requests, link) {
+		if (__i915_request_is_complete(rq))
+			break;
+
+		if (rq->ring != ring)
+			continue;
+
+		/* Wait until there will be enough space following that rq */
+		if (__intel_ring_space(rq->postfix,
+				       ring->emit,
+				       ring->size) < ring->size / 2) {
+			if (i915_request_get_rcu(rq)) {
+				rcu_read_unlock();
+
+				if (i915_request_wait(rq,
+						      I915_WAIT_INTERRUPTIBLE,
+						      MAX_SCHEDULE_TIMEOUT) < 0)
+					err = -EINTR;
+
+				rcu_read_lock();
+				i915_request_put(rq);
+			}
+			break;
+		}
+	}
+	rcu_read_unlock();
+
+	return err;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_context.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 0a8d553da3f43..f919a66cebf5b 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -226,6 +226,8 @@ static inline void intel_context_exit(struct intel_context *ce)
 		ce->ops->exit(ce);
 }
 
+int intel_context_throttle(const struct intel_context *ce);
+
 static inline struct intel_context *intel_context_get(struct intel_context *ce)
 {
 	kref_get(&ce->ref);
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 7503dcb9043bb..a1741c4a8cffd 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1035,6 +1035,9 @@ i915_request_create(struct intel_context *ce)
 	struct i915_request *rq;
 	struct intel_timeline *tl;
 
+	if (intel_context_throttle(ce))
+		return ERR_PTR(-EINTR);
+
 	tl = intel_context_timeline_lock(ce);
 	if (IS_ERR(tl))
 		return ERR_CAST(tl);
-- 
2.39.1

