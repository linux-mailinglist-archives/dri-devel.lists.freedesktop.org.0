Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E508419CF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 04:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C4C10EE05;
	Tue, 30 Jan 2024 03:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B7010E7B5;
 Tue, 30 Jan 2024 03:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706583813; x=1738119813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dnv+n5j8zXOC3hy/uzOy8wuemMQZ+zSOgZgoMHtEv8I=;
 b=TB3EaY7UxOH7DnEOxZOVmPMhBvBRXbZ6UzqgxabVpwIvkRbxraUL/2lO
 TTmgtU2LvzDpct+mzHUotQp1v+VtCikbXvFtm8Z1ryJk1+14GGHLKJxdy
 tM+A+vRiS993oGG3/tWf1IKAs36ox2DxTjaZmn/HvJmr4PQO+fXRtGX7f
 BDjjjxpxoz0QO1mcd9aoxcbZkrGJUbFqIBTqtfjlNWCQLejG/AGlN9BGW
 0Un6biEoflVWVVBh7Y3Gwv9bOJ/vFEliBNPMedi9iH82LWX/c/0J/UgXO
 BC3thj3baKJOnK8l6BVUOG3xYvw5WMfyyGBAVY22Hh+vMwJFOUyuEC/zB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16540326"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="16540326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 19:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3555623"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 19:03:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
Date: Mon, 29 Jan 2024 19:04:13 -0800
Message-Id: <20240130030413.2031009-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Matthew Brost <matthew.brost@intel.com>, airlied@gmail.com,
 christian.koenig@amd.com, ltuikov89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather then loop over entities until one with a ready job is found,
re-queue the run job worker when drm_sched_entity_pop_job() returns NULL.

Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8acbef7ae53d..7e90c9f95611 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	struct drm_sched_entity *entity;
 	struct dma_fence *fence;
 	struct drm_sched_fence *s_fence;
-	struct drm_sched_job *sched_job = NULL;
+	struct drm_sched_job *sched_job;
 	int r;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
 	/* Find entity with a ready job */
-	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
-		sched_job = drm_sched_entity_pop_job(entity);
-		if (!sched_job)
-			complete_all(&entity->entity_idle);
-	}
+	entity = drm_sched_select_entity(sched);
 	if (!entity)
 		return;	/* No more work */
 
+	sched_job = drm_sched_entity_pop_job(entity);
+	if (!sched_job) {
+		complete_all(&entity->entity_idle);
+		drm_sched_run_job_queue(sched);
+		return;
+	}
+
 	s_fence = sched_job->s_fence;
 
 	atomic_add(sched_job->credits, &sched->credit_count);
-- 
2.34.1

