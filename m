Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA877856F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 04:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F138010E636;
	Fri, 11 Aug 2023 02:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5EF10E627;
 Fri, 11 Aug 2023 02:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691721103; x=1723257103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cFrSbP44yEQ6+Q0dReeUFBOCkM4J4jR3u4//cL0MRSw=;
 b=jbI7EjkcpacBvqbpCZoOxofJ7IielHIhvitob5wP1RCMivHTwm7Lh/Xs
 +jBDqICNbpn6JO9XgpZW0CvBxF2J3UmyvqWHAi3p8eyWnJ5IR9+Kgjfig
 u6t2mhtH2dHBuuBYAgc5J0GBpkawJyqCg/QQ4sKYSe6pW/yAJYu3RRebM
 +kQnmLb2giCB1QO+toZyjAOx0zhjbURPl8MNidQkBfxsADbkxH4fQc8zz
 3WbPvkYiRZlu5LGqTyfA2bxYZvzzFfFa+Emus/0qBeYpDVBaihD0i0U8m
 nA8ly6o8QzHtwEsdudbkmHCLAf2Uu9O3AY+4dlpGMNbkEKi7Oo9z0XgQy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361714857"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="361714857"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797838416"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="797838416"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/sched: Submit job before starting TDR
Date: Thu, 10 Aug 2023 19:31:36 -0700
Message-Id: <20230811023137.659037-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811023137.659037-1-matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
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
index 0e7d9e227a6a..6aa3a35f55dc 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -498,7 +498,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
-	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -1231,6 +1230,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		fence = sched->ops->run_job(sched_job);
 		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence, fence);
+		drm_sched_start_timeout_unlocked(sched);
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			/* Drop for original kref_init of the fence */
-- 
2.34.1

