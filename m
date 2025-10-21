Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8EABF8F48
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685CE10E353;
	Tue, 21 Oct 2025 21:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEm+NBnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AE310E34F;
 Tue, 21 Oct 2025 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761082796; x=1792618796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c96y7LtRhZ9y5IbVNkHX5Ncnp0OQYwuRsGhEKLGrjmE=;
 b=YEm+NBnN25r5YmHhuxj163+lY2GuKaBUHjcZGxdqzUxKh8B/kgcGNKKv
 KMUgV1qv4HAwmgyzTzCzAd5DmlGzG4OP1npVvk8al4/KEDfepoR9kiF4C
 Kc1NHINsZGe3I8UcrnwwECAUkOpC5w75njY3BV7a0Wc+TE5ka/89xuFhs
 RK98C6HDdB8KmJx+mAaTccsr/i4YgnMnsCP+xV9HvQotqDn//YJEl897o
 rAiXWCieW0zXdyC8oUFr+K/fKDCna2Ub5D0E0d7iJ/BRHs91YPPa4EQUk
 P5nWYilBfFFwFiVN5QmRb2m1PIZQA8Dqc8W5yrvEKCr7icRuq+dOlbQEu A==;
X-CSE-ConnectionGUID: lg42Dh6gQB6ComSRHx81oQ==
X-CSE-MsgGUID: lf0KP6wGQQCxeNcqS9vf5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63131558"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63131558"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:39:56 -0700
X-CSE-ConnectionGUID: WL9FFkjsRwqdpdy6HecLjA==
X-CSE-MsgGUID: 4aAAcozCRvqXMAPSuq535A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184099257"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 14:39:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch,
 christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: [RFC PATCH 3/3] drm/sched: Prevent adding dependencies to an armed job
Date: Tue, 21 Oct 2025 14:39:52 -0700
Message-Id: <20251021213952.746900-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021213952.746900-1-matthew.brost@intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
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

According to the DMA scheduler documentation, once a job is armed, it
must be pushed. Drivers should avoid calling the failing code path that
attempts to add dependencies after a job has been armed. This change
enforces that rule.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 676484dd3ea3..436cb2844161 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -873,7 +873,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
  * @job: scheduler job to add the dependencies to
  * @fence: the dma_fence to add to the list of dependencies.
  *
- * Note that @fence is consumed in both the success and error cases.
+ * Note that @fence is consumed in both the success and error cases. This
+ * function cannot be called if the job is armed.
  *
  * Returns:
  * 0 on success, or an error on failing to expand the array.
@@ -886,6 +887,10 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	u32 id = 0;
 	int ret;
 
+	/* Do not allow additional dependencies when job is armed */
+	if (WARN_ON_ONCE(job->sched))
+		return -EINVAL;
+
 	if (!fence)
 		return 0;
 
-- 
2.34.1

