Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE01691F88
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 14:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E23010E259;
	Fri, 10 Feb 2023 13:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ABD10E1D1;
 Fri, 10 Feb 2023 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676034421; x=1707570421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q9YTKJ3u8YMMvKwr50O9Cd1SSM69KoIu6lzAW0teqGY=;
 b=BJrUR0dwoXrBRKCBz0eVkPCL9hPw1x6E4CATHZ/sCKZ+XPnWB2LPyFVf
 OqQ0HoFuyln4/sci4p+QLomLnS9tqW6n3H+RlQTSL5qqU0PG1IaXH1gcM
 biRIOyc74UeHQwJehwziKa26x+k4fA2pJ4sEElovDQZfDWLnnaCuWLI4i
 dEUz/hmK8wCgc0uOJR3h4yPRHePdwOnU/4zVp2DvNjn0CAksweowC7lO6
 oeP5+aAlrAhXRVaSM/ZaNulvvUN5I+YpWSlji2EMpEgG31ePEWOvpgfFs
 RWcVI9ZxyNQxFvrOKWFdKBbjabNRcqU1ZoKGDz/JafNfyUMcpgL0o1ifb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="329045881"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="329045881"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 05:07:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="731711289"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="731711289"
Received: from athornbe-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.209.249])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 05:07:00 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 3/5] drm/i915: Waitboost external waits
Date: Fri, 10 Feb 2023 13:06:45 +0000
Message-Id: <20230210130647.580135-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 7503dcb9043b..8989f62a7fba 100644
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
-- 
2.34.1

