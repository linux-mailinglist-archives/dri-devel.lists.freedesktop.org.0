Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8566ADC5B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8476E10E49D;
	Tue,  7 Mar 2023 10:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A6610E49C;
 Tue,  7 Mar 2023 10:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186130; x=1709722130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zSi9XMQjKhlDhU66P/HKW+kdwHFQnJ/1owjm47W+ojc=;
 b=Fz2dX1j4D9oix92smTJzapAjIPs3mFnoNxBgPtrfk5lRT60FR7eghoUq
 CRkcQnqK0bX1+QuqjnaAeuHMosMhl1EskLTG1fn5WIHo4mLJ1abhdqxAH
 SmnfkuL5vQx7rQyYpLsXRnzQUT2XxjrSvJ702ayB51YX8IbY9eCJ1uAxU
 AOL9Tvz2Gra/qnevqbGvLtQ1MofsGm1qKAqdjwy940TtFkV4EcR/ZCR2z
 BPoPjCGwsaOzn2Ll1lieHMmiSjwhKc14Jr4pk4Q1Ut8cEBKOhW8n5n5P5
 LrUDm7iPIfNXnfrSTxib61HQ0YPc0Qoq4UtNHUl6i1Y9OJCeAOrcrzO22 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643472"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643472"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712942"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712942"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:48 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 10/12] drm/i915: Waitboost external waits
Date: Tue,  7 Mar 2023 10:48:22 +0000
Message-Id: <20230307104824.231094-11-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
References: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Turner <mattst88@gmail.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
index 630a732aaecc..42b04cced6f0 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -93,7 +93,12 @@ static bool i915_fence_signaled(struct dma_fence *fence)
 
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
2.37.2

