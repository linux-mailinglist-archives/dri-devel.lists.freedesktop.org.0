Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107C519EEE
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB4510E7E8;
	Wed,  4 May 2022 12:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1870C10E504;
 Wed,  4 May 2022 12:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651666046; x=1683202046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ls4UJiHxXQ/mgV/gf1ness9dRnHLG43SWX6OfTqbmbw=;
 b=Dc8vCg9w2fOnGO8VGsP89VZm1RvmpViSfVxgLXemJGVqJlwsc32mRuOk
 9g33OPXSrSwCJfr6UUQBnQoptdlvI1TBc457xxoLo5m9vXoe+LtC8/dSD
 4Ke+VlOUAaMpEnRbWcovY8SBs3AgNBTdE4fPsXALqIifDLy7EXoICvNkq
 yS4Aq1GV3nfCDokkjlvLfeNB3tBWkBpPePe1YFlRNeY4VtlzwyEGE8GhP
 qKN2QoRb9IbNFc77pqWXqcb7z5qdDkUvzPxItYRXyV42mm9TMV9QyPt9V
 2afJm3eq9vnB7qcHvqVrX1wcarF8txIEU8qZ1tL/tOo2r1gZeO8AWWh/F w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267343600"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="267343600"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 05:07:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="693884095"
Received: from gidaly-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.236.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 05:07:24 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for ring
 unexpectedly not idle
Date: Wed,  4 May 2022 13:07:15 +0100
Message-Id: <20220504120715.911045-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
References: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
to exercise a certain code path, so in case of values coming from MMIO
reads we cannot be sure CI will have all the possible SKUs and parts, or
that it will catch all possible error conditions. Use drm_warn instead.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 5423bfd301ad..f8f279a195c0 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -117,7 +117,9 @@ static void flush_cs_tlb(struct intel_engine_cs *engine)
 		return;
 
 	/* ring should be idle before issuing a sync flush*/
-	GEM_DEBUG_WARN_ON((ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0);
+	if ((ENGINE_READ(engine, RING_MI_MODE) & MODE_IDLE) == 0)
+		drm_warn(&engine->i915->drm, "%s not idle before sync flush!\n",
+			 engine->name);
 
 	ENGINE_WRITE_FW(engine, RING_INSTPM,
 			_MASKED_BIT_ENABLE(INSTPM_TLB_INVALIDATE |
-- 
2.32.0

