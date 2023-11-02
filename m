Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC697DF0B3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC47210E853;
	Thu,  2 Nov 2023 10:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72F10E852
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698922566; x=1730458566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UbR84Pa49Ypr5YMTz7Mlp0VVHIsG8HXjmU4f5ag4r0c=;
 b=GNdedMPiCRfo/JQuWzL4NIaae6nGn7Tw1HhUZ7EATaKIeb5QMzHyXWkP
 sW3keRA5ujMrSjCXpSjJ4r6+0Q/V3OX0lrncRBy8GoOORJD6DZPq6FXbF
 9G/2Q/+H5dgDPvHO9tBIVhFrzd1dz62rvoiH3arAXDY/YTK1dJk7OJjM/
 pqkgK+sFLXiibgvbE6HJTXpnnros66sybCNrqC9rOMYjDKa2jlKzGo9RU
 WMe39IrlEkrJqIPn8pB6VdVQwPx/+WcVKvwVHDIyeJXJBS0WaCWFHJWDM
 qJ+sMZTG4w29xcCbivKzAsuPSI0wRKuVP+aSK9bwhxDNokMYqHrruXRjR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452988706"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="452988706"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764875951"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="764875951"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 03:55:46 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/sched: Move free worker re-queuing out of the if block
Date: Thu,  2 Nov 2023 10:55:35 +0000
Message-Id: <20231102105538.391648-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Whether or not there are more jobs to clean up does not depend on the
existance of the current job, given both drm_sched_get_finished_job and
drm_sched_free_job_queue_if_done take and drop the job list lock.
Therefore it is confusing to make it read like there is a dependency.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index fb64b35451f5..e1658030613f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1065,12 +1065,11 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		return;
 
 	job = drm_sched_get_finished_job(sched);
-	if (job) {
+	if (job)
 		sched->ops->free_job(job);
 
-		drm_sched_free_job_queue_if_done(sched);
-		drm_sched_run_job_queue_if_ready(sched);
-	}
+	drm_sched_free_job_queue_if_done(sched);
+	drm_sched_run_job_queue_if_ready(sched);
 }
 
 /**
-- 
2.39.2

