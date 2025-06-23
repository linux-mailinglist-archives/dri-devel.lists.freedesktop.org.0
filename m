Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B78AE4013
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30AE10E384;
	Mon, 23 Jun 2025 12:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e7HarAHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3DE10E362;
 Mon, 23 Jun 2025 12:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VG81JNVxUPRgc6eOVhVwFH3j8ZHRi8LMmXM9LsVniV8=; b=e7HarAHcghx8JrsQ0XSvK037cm
 IubD3aifRXuB4QkVfk0BLDeCSKBa89jjoBlX9VdsQDVIwWFpotVOvSmURbFVd2S+3VpL61CATe7sO
 EolB13TtugLy48pPrcNMQmUA2DmFP1SVvyQ5+swWF6OBpXAQ9o2DckLXRsHS7VCrOvrCELHkpbmsp
 RQNngu/um6u3w4W/iQzi1LApe0vFevxZpMZyE4lwqiphF1Lr3aPQgQJlZKigqMqmOocxcmKtB0yMt
 tJnXLrI82EEnt45H7tRKuJtKmIFaRJ3YHfLl46igqVbe57bjX5AMcR7g6WD3GAuVL9GA9c/3Cuu/9
 SPKjdaTw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uTgHD-007U2g-6K; Mon, 23 Jun 2025 14:27:55 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 03/16] drm/sched: De-clutter drm_sched_init
Date: Mon, 23 Jun 2025 13:27:33 +0100
Message-ID: <20250623122746.46478-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
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

Move work queue allocation into a helper for a more streamlined function
body.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 33 ++++++++++++++++----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a1b445c3b4db..1f077782ec12 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -84,12 +84,6 @@
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
-#ifdef CONFIG_LOCKDEP
-static struct lockdep_map drm_sched_lockdep_map = {
-	.name = "drm_sched_lockdep_map"
-};
-#endif
-
 int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
@@ -1263,6 +1257,25 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	drm_sched_run_job_queue(sched);
 }
 
+static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
+{
+#if (IS_ENABLED(CONFIG_LOCKDEP))
+	static struct lockdep_map map = {
+		.name = "drm_sched_lockdep_map"
+	};
+
+	/*
+	 * Avoid leaking a lockdep map on each drm sched creation and
+	 * destruction by using a single lockdep map for all drm sched
+	 * allocated submit_wq.
+	 */
+
+	return alloc_ordered_workqueue_lockdep_map(name, WQ_MEM_RECLAIM, &map);
+#else
+	return alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
+#endif
+}
+
 /**
  * drm_sched_init - Init a gpu scheduler instance
  *
@@ -1303,13 +1316,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 		sched->submit_wq = args->submit_wq;
 		sched->own_submit_wq = false;
 	} else {
-#ifdef CONFIG_LOCKDEP
-		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(args->name,
-								       WQ_MEM_RECLAIM,
-								       &drm_sched_lockdep_map);
-#else
-		sched->submit_wq = alloc_ordered_workqueue(args->name, WQ_MEM_RECLAIM);
-#endif
+		sched->submit_wq = drm_sched_alloc_wq(args->name);
 		if (!sched->submit_wq)
 			return -ENOMEM;
 
-- 
2.48.0

