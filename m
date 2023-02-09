Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A5690D61
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3830B10EB3A;
	Thu,  9 Feb 2023 15:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CCC10E213;
 Thu,  9 Feb 2023 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675957413; x=1707493413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGRFM/BbKAw2CIFEGVHlyresbS5s3aUWJeKxqVMf1J0=;
 b=DwWSaljqo5ztV/EW8J6n7h+5Ob5F06GZsBsFmGWcfBdaeIXmP5clMwf3
 GhDzxnUgbVSFJRuGAeOPRnV+UL4rdrxWrDkAsadinGn3IGTFjI281s0an
 CeZdCT1k0bMbQHU3VIzYQ1t7gA9SrOk0cEqAcyiwFmLfI2l/ScKOiKZUa
 aGM6aZXRhcKWhyI3iVilvikJg2qp+XDbhKFXb3SD0xZzkMQ+aFmOnEr/s
 L9jKMx72Bqaq1FmsRlWTULFz4dZm2O4lTfzTSYn8yE+WvtVSLIVAMU8A0
 X0zBRdaNEhZDW9fNRREbL2mdfG3HF0Fkzxxi/rm7pF+w1m7oBEXzlTXTt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="331440718"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="331440718"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="645308799"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="645308799"
Received: from jptoner-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.192.123])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:43:31 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 3/3] drm/i915: Waitboost external waits
Date: Thu,  9 Feb 2023 15:43:15 +0000
Message-Id: <20230209154315.468682-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209154315.468682-1-tvrtko.ursulin@linux.intel.com>
References: <20230209154315.468682-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Userspace waits coming via the drm_syncobj route have so far been
bypassing the waitboost mechanism.

Use the previously added dma-fence wait tracking API and apply the
same waitboosting logic which applies to other entry points.

This should fix the perfomance regressions experience by clvk and
similar userspace which relies on drm_syncobj.

At the same time, but for documentation purposes only, use the new
dma-fence API from i915_request_wait too.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 7503dcb9043b..e24fac5c1567 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -94,7 +94,12 @@ static bool i915_fence_signaled(struct dma_fence *fence)
 
 static bool i915_fence_enable_signaling(struct dma_fence *fence)
 {
-	return i915_request_enable_breadcrumb(to_request(fence));
+	struct i915_request *rq = to_request(fence);
+
+	if (dma_fence_wait_count(&rq->fence) && !i915_request_started(rq))
+		intel_rps_boost(rq);
+
+	return i915_request_enable_breadcrumb(rq);
 }
 
 static signed long i915_fence_wait(struct dma_fence *fence,
@@ -2037,11 +2042,13 @@ long i915_request_wait_timeout(struct i915_request *rq,
 	 * but at a cost of spending more power processing the workload
 	 * (bad for battery).
 	 */
-	if (flags & I915_WAIT_PRIORITY && !i915_request_started(rq))
+	if (((flags & I915_WAIT_PRIORITY) || dma_fence_wait_count(&rq->fence))
+	    && !i915_request_started(rq))
 		intel_rps_boost(rq);
 
 	wait.tsk = current;
-	if (dma_fence_add_callback(&rq->fence, &wait.cb, request_wait_wake))
+	if (dma_fence_add_wait_callback(&rq->fence, &wait.cb,
+					request_wait_wake))
 		goto out;
 
 	/*
-- 
2.34.1

