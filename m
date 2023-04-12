Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B846DF3C8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4856010E7A2;
	Wed, 12 Apr 2023 11:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCF110E7A1;
 Wed, 12 Apr 2023 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681299259; x=1712835259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uq8gJA7UF9zY+Rnq5ZWEjTGMW1EI9UDFtX1lsG58moA=;
 b=TA36sqO+50GYMt/fAaitZDwUMmoeXOwuURuVfgA1X5w5+WMGygHeWaKh
 UtQt7yg4tldNawC34zdPKlrp87GcnKLP8Agj10wMXcAO7iZ/jFfmIsKTe
 lRd75Qy5ziwfM1U41edcKzwzfEiaWRYvoircH0g2WgstzQuFl56pMDp57
 NwM3lJkxTbZJQeSVIpQ96icjS/SMXULVyg+NilD4lSJzkd79Pfo1O64T9
 SAyxUMKDxYAmzQ6USjleBcB4v0EwUswiE2Ue0A2KnkJ4fSFcyyRazyCUZ
 pwJSZA6X0I2Tm59mT05AzfEiqVYUrWGhVHzjcNHTcHI2a0CpbZkmlJWW8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327978279"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="327978279"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="778268846"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="778268846"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:34:14 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v5 3/5] drm/i915: Create the locked version of the request add
Date: Wed, 12 Apr 2023 13:33:06 +0200
Message-Id: <20230412113308.812468-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412113308.812468-1-andi.shyti@linux.intel.com>
References: <20230412113308.812468-1-andi.shyti@linux.intel.com>
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_request_add() assumes that the timeline is locked whtn the
function is called. Before exiting it releases the lock. But in
the next commit we have one case where releasing the timeline
mutex is not necessary and we don't want that.

Make a new i915_request_add_locked() version of the function
where the lock is not released.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/i915/i915_request.c | 14 +++++++++++---
 drivers/gpu/drm/i915/i915_request.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 58662360ac34e..21032b3b9d330 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1852,13 +1852,13 @@ void __i915_request_queue(struct i915_request *rq,
 	local_bh_enable(); /* kick tasklets */
 }
 
-void i915_request_add(struct i915_request *rq)
+void i915_request_add_locked(struct i915_request *rq)
 {
 	struct intel_timeline * const tl = i915_request_timeline(rq);
 	struct i915_sched_attr attr = {};
 	struct i915_gem_context *ctx;
 
-	lockdep_assert_held(&tl->mutex);
+	intel_context_assert_timeline_is_locked(tl);
 	lockdep_unpin_lock(&tl->mutex, rq->cookie);
 
 	trace_i915_request_add(rq);
@@ -1873,7 +1873,15 @@ void i915_request_add(struct i915_request *rq)
 
 	__i915_request_queue(rq, &attr);
 
-	mutex_unlock(&tl->mutex);
+}
+
+void i915_request_add(struct i915_request *rq)
+{
+	struct intel_timeline * const tl = i915_request_timeline(rq);
+
+	i915_request_add_locked(rq);
+
+	intel_context_timeline_unlock(tl);
 }
 
 static unsigned long local_clock_ns(unsigned int *cpu)
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index bb48bd4605c03..29e3a37c300a7 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -425,6 +425,7 @@ int i915_request_await_deps(struct i915_request *rq, const struct i915_deps *dep
 int i915_request_await_execution(struct i915_request *rq,
 				 struct dma_fence *fence);
 
+void i915_request_add_locked(struct i915_request *rq);
 void i915_request_add(struct i915_request *rq);
 
 bool __i915_request_submit(struct i915_request *request);
-- 
2.39.2

