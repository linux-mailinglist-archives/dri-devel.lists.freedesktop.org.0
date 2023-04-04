Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8946D557B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62CC10E048;
	Tue,  4 Apr 2023 00:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7068C10E05F;
 Tue,  4 Apr 2023 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567744; x=1712103744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S1slQD3OeKnMaC9hsbtA7WJFpQywRZAU0l5Iq4exbig=;
 b=FY5Z2nrvyO4exbKTVCIVPpxt7Gp383dR8YkPc5ZPU6qmp6beBSJ/gxO+
 LQNyqyZ2+0ZhwAkXDZbXJmUz9rF2cRyKSzcbeodb3ULrPgiTa9pnjCM9X
 ssSDja8szzWZX715Sr6koxpZQPTiaitPNDVTtatJh5A2tMstl0lI7VVg0
 DlUWrMWYw3dfJD8nhTyjoBwend/rsURNkCHd68LwC2D+6Uh9GUSz5WTMA
 /Mtsu9Iy5W1kqqXKhX822dId4gd0CInEIdzhvlsjoSJ8ehEu5d7CyQ6zc
 jT0FGM3QUy47Auum9EncpUQTQrTlLLGM+5n1LceTDlV0MOsyTEevfg4S9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810527"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810527"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460306"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460306"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 06/10] drm/sched: Submit job before starting TDR
Date: Mon,  3 Apr 2023 17:22:07 -0700
Message-Id: <20230404002211.3611376-7-matthew.brost@intel.com>
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

If the TDR is set to a value, it can fire before a job is submitted in
drm_sched_main. The job should be always be submitted before the TDR
fires, fix this ordering.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6ae710017024..4eac02d212c1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1150,10 +1150,10 @@ static void drm_sched_main(struct work_struct *w)
 		s_fence = sched_job->s_fence;
 
 		atomic_inc(&sched->hw_rq_count);
-		drm_sched_job_begin(sched_job);
 
 		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
+		drm_sched_job_begin(sched_job);
 		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence);
 
-- 
2.34.1

