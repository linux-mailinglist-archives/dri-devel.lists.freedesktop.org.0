Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BD293B998
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 01:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0734310E067;
	Wed, 24 Jul 2024 23:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQeUPTFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60E010E02C;
 Wed, 24 Jul 2024 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721864612; x=1753400612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+issbmYEhiGlATbSKaBJFYe3SQ2jl1QH65/RLRxyuJ4=;
 b=AQeUPTFJnxL7/G7FY2jFJqqsHUE/xHQMTd7GthKoQOwBX/OEmKk5HhgS
 Mtb9t++JaA7xmrbGtkW6xYFcUtVnaPkOZipTKhVkrvXZBSr+STF0HIPYw
 g0fascsQpTWNaVyuC171iclaYFrf/3CkyJCbivz1qos+1sAb1msjBJmqO
 8ugZxRjHvr8dUPSF4Gb1hV/GCmAHFAOF3AtEg3XPmI56hnlf54ace/n60
 rdr7UwNmEec3Gw+pIhLeobWZXXC/qM4sU4OBWajG3CkChx6BsNu4JewuM
 evgC+hGdu0cETrnsZ4cNaj03PvWTvV8zAP+Zqz+hhSUTJ1XY+oO90ZHoM w==;
X-CSE-ConnectionGUID: ibJ6UBefRfaY4R6HME4DPg==
X-CSE-MsgGUID: CTgBoBONRnWTB9nVm6Omag==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19711113"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19711113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 16:43:30 -0700
X-CSE-ConnectionGUID: w/p/RwSxTjmQahbfUd8puQ==
X-CSE-MsgGUID: pDpKBj9vREWnF9I27iurCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75968423"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 16:43:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch, felix.kuehling@amd.com
Subject: [PATCH] drm/sched: Only start TDR in drm_sched_job_begin on first job
Date: Wed, 24 Jul 2024 16:44:17 -0700
Message-Id: <20240724234417.1912357-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Only start in drm_sched_job_begin on first job being added to the
pending list as if pending list non-empty the TDR has already been
started. It is problematic to restart the TDR as it will extend TDR
period for an already running job, potentially leading to dma-fence
signaling for a very long period of with continous stream of jobs.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..feeeb9dbeb86 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -540,7 +540,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
-	drm_sched_start_timeout(sched);
+	if (list_is_singular(&sched->pending_list))
+		drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
-- 
2.34.1

