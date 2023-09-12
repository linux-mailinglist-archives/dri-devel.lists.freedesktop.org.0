Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C19479C290
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ABD10E31F;
	Tue, 12 Sep 2023 02:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFE910E268;
 Tue, 12 Sep 2023 02:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485041; x=1726021041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kCtFrfQZtgiO6zyrfqGvTpwOfV64mHohmbZIs9WFT4=;
 b=Sd8420WdJf5OaltLFSrl5PLJUyNl99nTZvEjU+wEHaipUgyHLDTz/gkw
 WM8X+yPtYzEjeHxZWA8EpIDKuINDv1JnTr7PVeb1tMsQrE3o0DBufrMks
 55wlWdvSt9I1UIuaoo+frUUdtmIcbyBeDPFLk8qBuhyHeWrBfmAHDNN+2
 w2+8MqrzPIcyXYW5z3i+FA6zb7T4haTKSCXiTI2X8QiGwoXjlQPBjXMsE
 uUdGXP+9oE0CyDt9uu/sGPWmyHwJOTmkawddqOdd26rI7LK63oIRXvDPf
 HyLcuF/YPsgNsFe1J7tbuRMN4pft3HwC6LVa/z+gTc6WIx8WDW8OZvKvH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172586"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172586"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255581"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255581"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 09/13] drm/sched: Submit job before starting TDR
Date: Mon, 11 Sep 2023 19:16:11 -0700
Message-Id: <20230912021615.2086698-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
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
 ketil.johnsen@arm.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
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
index c627d3e6494a..9dbfab7be2c6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -498,7 +498,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
-	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -1234,6 +1233,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		fence = sched->ops->run_job(sched_job);
 		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence, fence);
+		drm_sched_start_timeout_unlocked(sched);
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			/* Drop for original kref_init of the fence */
-- 
2.34.1

