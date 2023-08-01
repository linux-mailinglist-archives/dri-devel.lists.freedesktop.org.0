Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB176BEC5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4631710E436;
	Tue,  1 Aug 2023 20:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803210E1E1;
 Tue,  1 Aug 2023 20:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690923073; x=1722459073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FdGRfPvC9A7+2edmXqNAAKQwJfk4O4+s/Hgwkl1xXh0=;
 b=gFv8S5iHzEdZuxC26hAZmEcrctYCusqzR/ID+lR7ZuDJOGvReAjoGmVn
 Agp1oVSUPGhq5VltfrJIhGTbaAq6hCJ6Ofq9gkoZFMCKATYk+WjxSDV9/
 qpZJFjZQ1z3mASJhBTuFMBkGuiJNSzk75tSSNVpO8PZDE6ZuZE+iUAegK
 UZXnr2Ivzwz2QkUD3zo6KDndjHHB+ITxcxGyyK4oYv00a2fJpwNiMYujT
 PmKvnmwZaSvPomb8Dnt4UJ3zR58Glsmwxf0xjYlrpx6Wy2rbE3BBl4+fK
 8UETqm7pVigJwpXtMaOLoQWxgV117ExiYKHOIjwGjwgsU+n+7kqVycxdb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373051759"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="373051759"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="872215414"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 6/8] drm/sched: Start run wq before TDR in drm_sched_start
Date: Tue,  1 Aug 2023 13:51:01 -0700
Message-Id: <20230801205103.627779-7-matthew.brost@intel.com>
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

If the TDR is set to a very small value it can fire before the run wq is
started in the function drm_sched_start. The run wq is expected to
running when the TDR fires, fix this ordering so this expectation is
always met.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index be963d68a733..2e404a6542ad 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -612,10 +612,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job);
 	}
 
+	drm_sched_run_wq_start(sched);
+
 	if (full_recovery)
 		drm_sched_start_timeout_unlocked(sched);
-
-	drm_sched_run_wq_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
-- 
2.34.1

