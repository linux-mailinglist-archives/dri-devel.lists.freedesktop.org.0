Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF676BEC3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0723910E433;
	Tue,  1 Aug 2023 20:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C551310E41A;
 Tue,  1 Aug 2023 20:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690923073; x=1722459073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DQoIpnI1x5g9Tu0v4cJDT9GXQ8upQSDJsJaCp/suKlo=;
 b=HpQHtgpce/nSGG+LPkvNRnGRMX9czNYuUCGGuDFCFLmePYcWLwxADQov
 AptiELNjH/70e1GucD+gc6sCLsFRYiv7mUKOf2yASEjD5rEXBz+PoAR/E
 XpF8S7yNerP0Z/NBnBc98On76VFvMecAt4lTeiFnbvW0LAaZhl4FgaMF+
 Xm1uFXSuAyHLmWmhWARUo1PsCv34Hm0h5QinnCMFiyAY5Cu9gQDKfQz6c
 HU0q9bSunFOCKZLYcU7m+7BStQ3hQSedP1JzYFFnjJKn5U0cllQTi5a+U
 QoUtVwSIW9NmyCMOHXK8SzJuIMbilnSRi294KJO6+wpWlxEEbjWaFKY87 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373051769"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="373051769"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="872215419"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 7/8] drm/sched: Submit job before starting TDR
Date: Tue,  1 Aug 2023 13:51:02 -0700
Message-Id: <20230801205103.627779-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801205103.627779-1-matthew.brost@intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 lina@asahilina.net, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the TDR is set to a value, it can fire before a job is submitted in
drm_sched_main. The job should be always be submitted before the TDR
fires, fix this ordering.

v2:
  - Add to pending list before run_job, start TDR after (Luben, Boris)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2e404a6542ad..9573f13f8459 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -445,7 +445,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
-	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -1146,6 +1145,7 @@ static void drm_sched_main(struct work_struct *w)
 		fence = sched->ops->run_job(sched_job);
 		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence);
+		drm_sched_start_timeout_unlocked(sched);
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			drm_sched_fence_set_parent(s_fence, fence);
-- 
2.34.1

