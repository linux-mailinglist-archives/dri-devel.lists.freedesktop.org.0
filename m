Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5E9A717B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 19:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC5C10E578;
	Mon, 21 Oct 2024 17:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EK/0Vhr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7801710E530;
 Mon, 21 Oct 2024 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729533401; x=1761069401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BEpvO3t2m99UVkHhQrCHDrpw/InTD5Sb67NybmHf3NY=;
 b=EK/0Vhr7Aenvnf0Bg0o47E4+RFeuPlpMSMQucUs95AN8Y8Bq+PYetadB
 VAe57z7itCSOY8FJ+URqhSP2LkePrBv7CFcLCwXU6bx9wFZnpT7aWfU2c
 A1nDhCm+ksTPIKYiIIeleL5p3rVyfDpg5xDtAJrX7BZ76yIpqrZUp3huj
 gGAG6A3FSjf7vKE608dFt9voLNcYMwh5LXICVGcD7Ma6UfYTifzBqDt60
 wIIJ2+EWIQYjeCzQoa5pc8PXHMyw40HFU1Iyz6HxfRpZoQGnuz54ctChs
 tTStBPgowVpHoM45KLOnNdMX/eQw5gC9+1XbAoqxRG5DL/Og28iYqc9pq w==;
X-CSE-ConnectionGUID: +nKhqrYiQPe99qjgVP+Nuw==
X-CSE-MsgGUID: kEghi6sfS9yY/FCCeiFTFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28910171"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="28910171"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:40 -0700
X-CSE-ConnectionGUID: C5KXyN3IS1SsapU/RrGumg==
X-CSE-MsgGUID: b5sZibLrQXaON4zCNRvdnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79680263"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	pstanner@redhat.com
Subject: [PATCH 1/4] drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
Date: Mon, 21 Oct 2024 10:57:02 -0700
Message-Id: <20241021175705.1584521-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021175705.1584521-1-matthew.brost@intel.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
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

DRM scheduler work queues are used to submit jobs, jobs are in the path
or dma-fences, and dma-fences are in the path of reclaim. Mark scheduler
work queues with WQ_MEM_RECLAIM so these work queues can continue to
make forward progress during reclaim.

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6e4d004d09ce..567811957c0f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1275,10 +1275,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->own_submit_wq = false;
 	} else {
 #ifdef CONFIG_LOCKDEP
-		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
+		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, WQ_MEM_RECLAIM,
 								       &drm_sched_lockdep_map);
 #else
-		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+		sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
 #endif
 		if (!sched->submit_wq)
 			return -ENOMEM;
-- 
2.34.1

