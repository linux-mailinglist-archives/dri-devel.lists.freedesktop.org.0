Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA936B0330
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513E210E666;
	Wed,  8 Mar 2023 09:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4710E65D;
 Wed,  8 Mar 2023 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678268508; x=1709804508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5mAueEvCYsIdpOtXBu7XNYxjB/DF0hO9fYb8rap1jhE=;
 b=QBenbLe73oH+qQtF8TRg15d1W6SqkQUI1ZJkmArH9t6PRrNWTyPL/eAL
 vV9oerx5CIOMSeGISKzT6Y3u0WXjp45m9KRpTysqaVRNlK2ExceLpT4G5
 yFtHMEzPTyaFIw/1ZGoATGv2ptYHDmMq2pFPHIjQyBauQ/ypqjVuoHreX
 HnnvdoGd7PiysQP7bn85zImwxpvN1Lue5v/JMVn1WDFRN02NFeppYBdOu
 HrYaYepmQh1SVOrCLgFPg55VCNoPja5wi3K/aKDe0n+xV//BgQWwcngGC
 VenzftB+9Qa1fJucMZFVTKt5ZIlxbVdjoW/hDUEAm6zoD7MRusGhwFzd7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315772813"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="315772813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="709362507"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="709362507"
Received: from gbain-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.108])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:41:44 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v4 3/5] drm/i915: Create the locked version of the request
 create
Date: Wed,  8 Mar 2023 10:41:04 +0100
Message-Id: <20230308094106.203686-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308094106.203686-1-andi.shyti@linux.intel.com>
References: <20230308094106.203686-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make version of the request creation that doesn't hold any
lock.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
 drivers/gpu/drm/i915/i915_request.h |  2 ++
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 72aed544f8714..5ddb0e02b06b7 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1028,18 +1028,11 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	return ERR_PTR(ret);
 }
 
-struct i915_request *
-i915_request_create(struct intel_context *ce)
+static struct i915_request *
+__i915_request_create_locked(struct intel_context *ce)
 {
 	struct i915_request *rq;
-	struct intel_timeline *tl;
-
-	if (intel_context_throttle(ce))
-		return ERR_PTR(-EINTR);
-
-	tl = intel_context_timeline_lock(ce);
-	if (IS_ERR(tl))
-		return ERR_CAST(tl);
+	struct intel_timeline *tl = ce->timeline;
 
 	/* Move our oldest request to the slab-cache (if not in use!) */
 	rq = list_first_entry(&tl->requests, typeof(*rq), link);
@@ -1049,16 +1042,38 @@ i915_request_create(struct intel_context *ce)
 	intel_context_enter(ce);
 	rq = __i915_request_create(ce, GFP_KERNEL);
 	intel_context_exit(ce); /* active reference transferred to request */
-	if (IS_ERR(rq))
-		goto err_unlock;
 
 	/* Check that we do not interrupt ourselves with a new request */
 	rq->cookie = lockdep_pin_lock(&tl->mutex);
 
 	return rq;
+}
+
+struct i915_request *
+i915_request_create_locked(struct intel_context *ce)
+{
+	intel_context_assert_timeline_is_locked(ce->timeline);
+
+	if (intel_context_throttle(ce))
+		return ERR_PTR(-EINTR);
+
+	return __i915_request_create_locked(ce);
+}
+
+struct i915_request *
+i915_request_create(struct intel_context *ce)
+{
+	struct i915_request *rq;
+	struct intel_timeline *tl;
+
+	tl = intel_context_timeline_lock(ce);
+	if (IS_ERR(tl))
+		return ERR_CAST(tl);
+
+	rq = __i915_request_create_locked(ce);
+	if (IS_ERR(rq))
+		intel_context_timeline_unlock(tl);
 
-err_unlock:
-	intel_context_timeline_unlock(tl);
 	return rq;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index f5e1bb5e857aa..bb48bd4605c03 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -374,6 +374,8 @@ struct i915_request * __must_check
 __i915_request_create(struct intel_context *ce, gfp_t gfp);
 struct i915_request * __must_check
 i915_request_create(struct intel_context *ce);
+struct i915_request * __must_check
+i915_request_create_locked(struct intel_context *ce);
 
 void __i915_request_skip(struct i915_request *rq);
 bool i915_request_set_error_once(struct i915_request *rq, int error);
-- 
2.39.2

