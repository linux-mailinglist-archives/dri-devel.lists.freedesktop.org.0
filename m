Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0AF4F39BA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB8210E120;
	Tue,  5 Apr 2022 14:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BF510E19A;
 Tue,  5 Apr 2022 14:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649170460; x=1680706460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oUkQbA5pN5V7a89ItbEKPba81WjVPT45OU0bMAv6p20=;
 b=OYi9+qduav0gtMUIBmxs8y3BULaGbxbPkH6W7fSMUfIXRAuPFEQI+4af
 e5Ptz+uZ1JCom0H/uxPuk8U8+KU3eAOpc5M2GoVmj1f58qyluiqh2uOWr
 bGP95RlMZZ8EXEKqPghRalXEuA18DBETo/ZmeuR6tllOSqJ7mEaj9UW2N
 Gt8YckhEe7Dl3w0FUq3NB79ZQHfEgPh1fM02f9LszDX445UYQp1YHPNOj
 hmvJQ9I1LWT4PFxZN2/SCpFBV//9KqOdf4aoDssuDgb/7lYWvXzgKcs59
 Wj2Y1h6DeCR0Hfy4OTSEDaBKybH2yrYjJrAlVNwxfqb5GxMo2Au4ft3VW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="241353412"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="241353412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="608470346"
Received: from pmulcahy-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.235.32])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:18 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Inherit submitter nice when scheduling requests
Date: Tue,  5 Apr 2022 15:53:45 +0100
Message-Id: <20220405145345.3284084-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405145345.3284084-1-tvrtko.ursulin@linux.intel.com>
References: <20220405145345.3284084-1-tvrtko.ursulin@linux.intel.com>
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

Inherit submitter nice at point of request submission to account for
long running processes getting either externally or self re-niced.

Nice value will only apply to requests which originate from user
contexts and have default context priority.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 960bfd517ff7..a777f14e4b87 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1811,8 +1811,11 @@ void i915_request_add(struct i915_request *rq)
 	/* XXX placeholder for selftests */
 	rcu_read_lock();
 	ctx = rcu_dereference(rq->context->gem_context);
-	if (ctx)
+	if (ctx) {
 		attr = ctx->sched;
+		if (attr.priority == I915_CONTEXT_DEFAULT_PRIORITY)
+			attr.nice = task_nice(current);
+	}
 	rcu_read_unlock();
 
 	__i915_request_queue(rq, &attr);
-- 
2.32.0

