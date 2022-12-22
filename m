Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BA9654879
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B5910E5A7;
	Thu, 22 Dec 2022 22:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3150710E59D;
 Thu, 22 Dec 2022 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748120; x=1703284120;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=y0GRqFTy4Y7dd+E5+/dK+CjrRyfodQ6AWBNk7sMSu+Y=;
 b=KRa320hZFI8qzZ7Y+Nx/VcV21kzuctRxhsWIYeUPpq/H2s0YA1UMg9WI
 W+1yJWSXKKDB6cWDrmDOpCzC4afNyD1KdPs32rGa3P2g3eKfqBRwcYwvU
 WMfegBihqP/J+FUMvXstvPSFaeNGuk8V0Xyeqg0s8I8Meax6qRF3CrVmw
 k/GEfQ6qpGMfvkGGFoQCaQyVPFJht4D95/xvG+nbUponpDupUu+WNfSzg
 KyMq8r6+8uUmLHnKXQFw2iIVqtomK4/hzsaMBmTtk4vnCoepL/xH57veg
 BVeReMPLBzScXwM+AabAEWiPC1oUVWYfTVEf5KfWY8bJJX/VT4sVR6K5X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472853"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412315"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412315"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 07/20] drm/sched: Submit job before starting TDR
Date: Thu, 22 Dec 2022 14:21:14 -0800
Message-Id: <20221222222127.34560-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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

If the TDR is set to a value, it can fire before a job is submitted in
drm_sched_main. The job should be always be submitted before the TDR
fires, fix this ordering.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f39fdc01c37b..fa25541bb477 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1082,10 +1082,10 @@ static void drm_sched_main(struct work_struct *w)
 		s_fence = sched_job->s_fence;
 
 		atomic_inc(&sched->hw_rq_count);
-		drm_sched_job_begin(sched_job);
 
 		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
+		drm_sched_job_begin(sched_job);
 		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence);
 
-- 
2.37.3

