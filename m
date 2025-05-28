Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA83AC72E1
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 23:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF54C10E6CC;
	Wed, 28 May 2025 21:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJs1yvac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0729B10E1F6;
 Wed, 28 May 2025 21:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748468553; x=1780004553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ERCkpntKtSipzKUzUnr20lqYWXO9v1zgISAS2+tY3s=;
 b=UJs1yvacwv6cITz/Mt9KrKhmBnWlJWjLldiMQ6s3GtCu+Z0dfB0ds0ue
 5eHRv487hvnFffw681onRnO9x7LsVYzAvYysXJEVqBPVOQzfgo33ariP8
 2ApPp/x3ch0Hzu2gEvCu0YWG9odEeE5X7Qo4eQJ5kAOYxb17cUY7euc9p
 iKKlfoW4OEcaC44CSOPW13N1Mb9eQa5+yVfXaMgAk06HZJEmpNJMeANMc
 Mn2hwDk7sTvuRKskvdRAXW2sXdbiSEchS8PhvoiJxYBhvV9fhD9VycPhk
 Y8Fmrse9W4uPUmA05ZCZLCLd79h+mGLtinJvE7OybcEq72O6ZxRZN1ukH A==;
X-CSE-ConnectionGUID: X1MFAvcKT5+2gtbj5p2cNg==
X-CSE-MsgGUID: sMAt/Z+MToyZI/gNTNZ+8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67930727"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="67930727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:42:32 -0700
X-CSE-ConnectionGUID: UR5zHsRXQM25A+8hcnvaOw==
X-CSE-MsgGUID: KdPwpf06TiGbu/gW69Vnow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148657203"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:42:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/xe: Fix NPD when saving default context
Date: Wed, 28 May 2025 14:42:22 -0700
Message-ID: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250528-fix-sched-52730be6a163
X-Mailer: b4 0.15-dev-d9694
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

xef is only valid if it's a job from userspace.  For in-kernel jobs it
causes a NPD like below:

        <4> [] RIP: 0010:xe_sched_job_create+0xbd/0x390 [xe]
	...
        <4> [] Call Trace:
        <4> []  <TASK>
        <4> []  __xe_bb_create_job+0xa2/0x240 [xe]
        <4> []  ? find_held_lock+0x31/0x90
        <4> []  ? xa_find_after+0x12c/0x250
        <4> []  xe_bb_create_job+0x6e/0x380 [xe]
        <4> []  ? xa_find_after+0x136/0x250
        <4> []  ? __drm_dev_dbg+0x7d/0xb0
        <4> []  xe_gt_record_default_lrcs+0x542/0xb00 [xe]

Since drm_file starts with 1 for the unique id, just use 0 for the
in-kernel jobs.

Fixes: 2956554823ce ("drm/sched: Store the drm client_id in drm_sched_fence")
Cc: Christian König <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 5921293b25db3..d21bf8f269640 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -114,7 +114,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	xe_exec_queue_get(job->q);
 
 	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
-				 q->xef->drm->client_id);
+				 q->xef ? q->xef->drm->client_id : 0);
 	if (err)
 		goto err_free;
 



