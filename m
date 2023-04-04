Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A46D5583
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A242910E1CA;
	Tue,  4 Apr 2023 00:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0598210E05F;
 Tue,  4 Apr 2023 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567744; x=1712103744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pM87jfqrMf8vXEWTm6fPP8Tl1MKGUh+f7ud0diOflQc=;
 b=fMhJYgOWm7uIGMUOp/2WvKGkyo1U3K411nA3kCUWXpfHOpOCkNjH6uJE
 9LgmVoIttkWB/ehqnobpklL3ZZtEDs5napqQCAZeud1Ru65dB1zo3zhmz
 VFR9qJvZgWF6d5fQUam6Mx939FpyfOKufIG78iNG4jdGqz7ri++g1RYL9
 t9C6T8epLEpvx3TLC6GorPeN7vejMkTrLdJdd93CWYZqQzVFztLxjEty2
 JB+QFK8jw6xBzBuDpq0fOKNYNkc2wX2FII06gdc5X8HCjBkVB4lelzV9a
 fhEfsxZnv+JgINeLW9rxPNaxC25dZ2Zm9FV5WL8F5/3hI4rdjIbDrdkxk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810517"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810517"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460303"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460303"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 05/10] drm/sched: Start run wq before TDR in
 drm_sched_start
Date: Mon,  3 Apr 2023 17:22:06 -0700
Message-Id: <20230404002211.3611376-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com,
 Matthew Brost <matthew.brost@intel.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the TDR is set to a very small value it can fire before the run wq is
started in the function drm_sched_start. The run wq is expected to
running when the TDR fires, fix this ordering so this expectation is
always met.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9dc3378e9c5e..6ae710017024 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -611,13 +611,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job);
 	}
 
+	drm_sched_run_wq_start(sched);
+
 	if (full_recovery) {
 		spin_lock(&sched->job_list_lock);
 		drm_sched_start_timeout(sched);
 		spin_unlock(&sched->job_list_lock);
 	}
-
-	drm_sched_run_wq_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
-- 
2.34.1

