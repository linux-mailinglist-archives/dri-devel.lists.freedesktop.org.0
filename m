Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2FA69928F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6748110ED48;
	Thu, 16 Feb 2023 10:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805310ED3B;
 Thu, 16 Feb 2023 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676545176; x=1708081176;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q9YTKJ3u8YMMvKwr50O9Cd1SSM69KoIu6lzAW0teqGY=;
 b=QRNy8kzY0/WKisNzeQ+dlVwtYfVCaJXGfs6vhFKhqHIXnyjULX9opGZI
 mvUwspOhEa4O+5+YdHr+X4Tx3IPxc9Gda32J62+RUkici4bT0+RWgtDXz
 2nEtKFZMqcckedoUmpseeP9l88QRTdkK/TfolMIKJ+50nTNxgDsXnpDzd
 aVH+KeRln3URBSXinot94uqNzfOaREcxba/V7/pzRJP9gNJ/U90fTWP3O
 dxK7epZ0HtS++5twudETrJyXKVH+vLsolKH0Wx27MWzpPpuOGQkgayfkg
 UX6cB1xkKrwYKNcBTva8KWUDnRlCCIdCI0aGd+7zQ7IKUoF3HLW+L5915 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311317612"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311317612"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812917920"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="812917920"
Received: from murrayal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.229.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:35 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 7/9] drm/i915: Waitboost external waits
Date: Thu, 16 Feb 2023 10:59:19 +0000
Message-Id: <20230216105921.624960-8-tvrtko.ursulin@linux.intel.com>
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

