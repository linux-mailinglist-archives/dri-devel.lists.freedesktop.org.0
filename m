Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C13654869
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9901E10E5A9;
	Thu, 22 Dec 2022 22:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0B410E59C;
 Thu, 22 Dec 2022 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748120; x=1703284120;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MqKBr8/mNu++7cS1FR4zn2oCl9vWAu77enHSGIGOIvg=;
 b=NEmiWtyE6jFP+IZFwOvyFL2v0PUhR8ys2bxhhyfSmkZNcdncGu2d+wHX
 fXFeloNToIsO9fb15eaNKG1eif1Mnxftm1aH3UCCUHEyAWkdeZA77xJ9K
 GjD34CdnJ5Dpz9GqfHBvqhtruXqc/nCIqI/kBSKgHWaTrCJM5qOBPJgTo
 coNz5jiWgal7KZPNGN6bPQp3FspG/t5cZuu8ERh/MT7YS4ElICB/I4qEz
 KK/lkvj7UbhH7vLBEqE0rm4AFMHSX+QpcHxJ/1Zb5bL7AhlIJrhS+2GOo
 pFkDtNrWV5lrXS3AQa5tN9a8rJ2kgEMF8MM3yXJ5N/NfN9WVGdCHHEXNk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472851"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412313"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412313"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 06/20] drm/sched: Start run wq before TDR in
 drm_sched_start
Date: Thu, 22 Dec 2022 14:21:13 -0800
Message-Id: <20221222222127.34560-7-matthew.brost@intel.com>
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

If the TDR is set to a very small value it can fire before the run wq is
started in the function drm_sched_start. The run wq is expected to
running when the TDR fires, fix this ordering so this expectation is
always met.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8e688c2fc482..f39fdc01c37b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -586,13 +586,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
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
2.37.3

