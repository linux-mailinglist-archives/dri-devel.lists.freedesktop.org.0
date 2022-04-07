Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C692B4F829F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F610EABC;
	Thu,  7 Apr 2022 15:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212410EAA4;
 Thu,  7 Apr 2022 15:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649344601; x=1680880601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lDiLvcciIOdC1NXP+sNVWvVR2nFuU7TF5JOpwHyxflc=;
 b=NN6jLNnJkldnvT+RB9jlvhpWC0ER0yVgW0Nh5ZL+0SOg5Myu0fHxoJ8K
 1cunkibxndoQxwDOb1mS87adSpTMJdeeQQX0EO0ultN7b9D93ptMZwbye
 QcQd99IZj6amDvjavRNwjosnoxdcPNhR/+7+4RL4IuvxNmz5TVBBvTDPy
 Znb7kaFvierJWqF3WkGzZlzn6u9zjE0sjBmwC8cqiEgGbQYK/56oAFzI+
 igfMDl7/OB0o7CW5dbvag7dntfqoVortrHwMg+W8vOLZ6uoP9fZUSPwE+
 MEJZrf9ZpMcmBn6ps9YRgD9B728pBxRxgd/RJOm/LOACSbH8xT1atDlxu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="324512350"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="324512350"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:16:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="524962800"
Received: from twsparks-mobl1.amr.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.212.41.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:16:40 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915: Inherit submitter nice when scheduling requests
Date: Thu,  7 Apr 2022 16:16:27 +0100
Message-Id: <20220407151627.3387655-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
References: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Inherit submitter nice at point of request submission to account for long
running processes getting either externally or self re-niced.

This accounts for the current processing landscape where computational
pipelines are composed of CPU and GPU parts working in tandem.

Nice value will only apply to requests which originate from user contexts
and have default context priority. This is to avoid disturbing any
application made choices of low and high (batch processing and latency
sensitive compositing). In this case nice value adjusts the effective
priority in the narrow band of -19 to +20 around
I915_CONTEXT_DEFAULT_PRIORITY.

This means that userspace using the context priority uapi directly has a
wider range of possible adjustments (in practice that only applies to
execlists platforms - with GuC there are only three priority buckets), but
in all cases nice adjustment has the expected effect: positive nice
lowering the scheduling priority and negative nice raising it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 582770360ad1..e5cfa073d8f0 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1811,8 +1811,17 @@ void i915_request_add(struct i915_request *rq)
 	/* XXX placeholder for selftests */
 	rcu_read_lock();
 	ctx = rcu_dereference(rq->context->gem_context);
-	if (ctx)
+	if (ctx) {
 		attr = ctx->sched;
+		/*
+		 * Inherit process nice when scheduling user contexts but only
+		 * if context has the default priority to avoid touching
+		 * contexts where GEM uapi has been used to explicitly lower
+		 * or elevate it.
+		 */
+		if (attr.priority == I915_CONTEXT_DEFAULT_PRIORITY)
+			attr.priority = -task_nice(current);
+	}
 	rcu_read_unlock();
 
 	__i915_request_queue(rq, &attr);
-- 
2.32.0

