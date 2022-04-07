Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A004F8338
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CB810EB18;
	Thu,  7 Apr 2022 15:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A8389CCE;
 Thu,  7 Apr 2022 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649345297; x=1680881297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUbcOPaBch2WjGx/2zQb/KDRe7TQnVSLtYb7km7Sfqc=;
 b=Xmm0yAM/aYoy14jiXqjAqAEV4CQdXd9PlnWWDtJ3xC+mCIjC8MKXMSUV
 kuOQa8KPa7GVbxZtb4TLjmT4PCnF4Hb6WtdNy4IyankTE/gQh8ZAnQcLf
 F5kD1m4V9dBarBcNrURChnHoKZnl8p4oh/YpSVfcfTPk/cRwlk5BVQe/R
 zdSbs/kM+JqKq+zMgTvCOPtcZEQanljF+RGi+ys59M/aOuUgjKdQze54V
 7TmEa/Rvc+3ftg9QiO9IosT8ZZE6RnUb+onDHpuIO0b/qeAnLkiXHpx0h
 61cQKukMdksdB/vETNQTwnv55mmop6ho13182qEZ5p6V//pqH0rBb/xpS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261046708"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261046708"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:28:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="557412175"
Received: from twsparks-mobl1.amr.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.212.41.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:28:16 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915: Inherit submitter nice when scheduling requests
Date: Thu,  7 Apr 2022 16:28:06 +0100
Message-Id: <20220407152806.3387898-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407152806.3387898-1-tvrtko.ursulin@linux.intel.com>
References: <20220407152806.3387898-1-tvrtko.ursulin@linux.intel.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 50cbc8b4885b..2d5e71029d7c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3043,6 +3043,14 @@ static int eb_request_add(struct i915_execbuffer *eb, struct i915_request *rq,
 	/* Check that the context wasn't destroyed before submission */
 	if (likely(!intel_context_is_closed(eb->context))) {
 		attr = eb->gem_context->sched;
+		/*
+		 * Inherit process nice when scheduling user contexts but only
+		 * if context has the default priority to avoid touching
+		 * contexts where GEM uapi has been used to explicitly lower
+		 * or elevate it.
+		 */
+		if (attr.priority == I915_CONTEXT_DEFAULT_PRIORITY)
+			attr.priority = -task_nice(current);
 	} else {
 		/* Serialise with context_close via the add_to_timeline */
 		i915_request_set_error_once(rq, -ENOENT);
-- 
2.32.0

