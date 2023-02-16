Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A569928B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CFB10ED44;
	Thu, 16 Feb 2023 10:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDFF10ED3B;
 Thu, 16 Feb 2023 10:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676545178; x=1708081178;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fBvOEzsEUpuULwaHPJM994RuIgwkgHj0Lxh3VNlA7mU=;
 b=ei/zzFZAh5heFGAl5qo1K8UxFCG3YyO9kKGVsVFNhT4AD3oeS9kjQPX4
 pAY7lPzOcrCLooHB/j9CPOOYsU4X12f+CtxiqYW5MBulxkFwqU36+OcL4
 vjfocTPMrKpYH/TqT78aoPD1VJQT5jsTiLGPBBXtiPttSNH4rt9LAnH+I
 I1+DFRzuhGR7s9/xFtykY9m+mry/3BDwZgmrSoGDDr7acDFSncUWnxqZ7
 oGlUzuwBjmzIT14lhl1CHVNqA3zLErm4qsneGC5c8MoJu4E2iNiqNqXpU
 shVJrSKgb6o36bek8mtMBuE6uYh2oyLwH9twNi7tl0p+QjxBIq2hufGXw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311317617"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311317617"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812917923"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="812917923"
Received: from murrayal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.229.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:36 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 8/9] drm/i915: Mark waits as explicit
Date: Thu, 16 Feb 2023 10:59:20 +0000
Message-Id: <20230216105921.624960-9-tvrtko.ursulin@linux.intel.com>
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

Use the previously added dma-fence API to mark the direct i915 waits as
explicit. This has no significant effect apart from following the new
pattern.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 8989f62a7fba..488b180f8821 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2046,7 +2046,8 @@ long i915_request_wait_timeout(struct i915_request *rq,
 		intel_rps_boost(rq);
 
 	wait.tsk = current;
-	if (dma_fence_add_callback(&rq->fence, &wait.cb, request_wait_wake))
+	if (dma_fence_add_wait_callback(&rq->fence, &wait.cb,
+					request_wait_wake))
 		goto out;
 
 	/*
-- 
2.34.1

