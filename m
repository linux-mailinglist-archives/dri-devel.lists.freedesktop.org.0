Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD851BD9D
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553E210F777;
	Thu,  5 May 2022 11:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9947E10F708;
 Thu,  5 May 2022 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651748416; x=1683284416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sfaPUxVPiZI+0NrpA7Sy/6WvT/nxfNAHwxTokGinySQ=;
 b=N31fdSjFDz1unlC1FJroHjfI2vtt1vYo7jRPNEO1kNR03gaoT60fFSX2
 fb+jocGnEICgWLyGEdMCfMgo9LYPRoJKSEWoDY0qPVffSPU1UkaI+5UJc
 iB7iUbCnMq1bbCIdJJUMQ59U6mL4bXm4419mbsbEqZvzZ8tcwhOxDJVq7
 L6wDSmqsu2+ZuUe10S5Nf/KoAagpwAxgGs3YhRYpU3Utc73mHAXeEmuH4
 w9CqJ4sTHcaculm2QVleWgyAfet+5NP8QccC5Xy0od7fY5zxBh4KnjHdG
 tgOO+Qey7m5Wf1GKPqcevBofvHiNiscUHGnhXxfTKWx+dp7RXvaoHP+t7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="268224328"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="268224328"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:00:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="563189040"
Received: from mrbroom-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.206.41])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:00:15 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI 2/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for ring unexpectedly
 not idle
Date: Thu,  5 May 2022 12:00:07 +0100
Message-Id: <20220505110007.943449-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505110007.943449-1-tvrtko.ursulin@linux.intel.com>
References: <20220505110007.943449-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
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
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
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

