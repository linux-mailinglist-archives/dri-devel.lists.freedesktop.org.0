Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DB56ADC60
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE31D10E4A3;
	Tue,  7 Mar 2023 10:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5039910E4A0;
 Tue,  7 Mar 2023 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186134; x=1709722134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rsTLryc6IfUvnPWE7k7B9yi3VVtvOkjvjdiIRVAT6H8=;
 b=KKGwCJg+YZAZ9uo7JCsQUhVUuPDvpxXg1aEAFUqSs2ER/E7wToH9C22R
 7mJyZYvDGOuy9rYvoKGEDNjr838acUP54I8CSBPNqifZPuCn6CDwx3Mhk
 D3QuxI0MV4PPa9tLe9V5J4wLBHoPvLsrcjHNpqqgpPhhh8MULe9zwKiuY
 yq81v40+aM1T6bKzJL5SwMpUMlcgvFqMtMp1vOWaoHTaY3ytXVeC59SjF
 AmwDgY2zKu+Ltv6Zp3QPatbSCnk42ztxZSVqIEr2g/s9jhkivkcqmtvZV
 PIoPSZ2s2DhRIfyo+HbREFh5PF/Lz1x4zdxUR6s5WyGwKXPMtMdxewjbi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643513"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712976"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712976"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:51 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 12/12] drm/i915: Wait boost requests waited upon by others
Date: Tue,  7 Mar 2023 10:48:24 +0000
Message-Id: <20230307104824.231094-13-tvrtko.ursulin@linux.intel.com>
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

Use the newly added dma-fence API to apply waitboost not only requests
which have been marked with I915_WAIT_PRIORITY by i915, but which may be
waited upon by others (such as for instance buffer sharing in multi-GPU
scenarios).

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index dd8a9045086a..c4adf34016d0 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2041,7 +2041,8 @@ long i915_request_wait_timeout(struct i915_request *rq,
 	 * but at a cost of spending more power processing the workload
 	 * (bad for battery).
 	 */
-	if (flags & I915_WAIT_PRIORITY && !i915_request_started(rq))
+	if (((flags & I915_WAIT_PRIORITY) || dma_fence_wait_count(&rq->fence))
+	    && !i915_request_started(rq))
 		intel_rps_boost(rq);
 
 	wait.tsk = current;
-- 
2.37.2

