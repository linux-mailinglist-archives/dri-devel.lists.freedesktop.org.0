Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9EBAF93A1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9B810EA35;
	Fri,  4 Jul 2025 13:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G+K0kgEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209AA10EA35
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3HzDGKu2JGYgGROPP0/npLX+sCLI3VFoqTfdv1eoJsQ=; b=G+K0kgEcv9NsFWCbuwwTh6qp3c
 Xpv235G8cjrLpcyaE+SjGbc1RX+YqRoV7q1K0doq8HDId1ddDYYOWks6Yk8VAbw3WZDmFcSTy47HB
 Ao+AcOSskX2CbszUGV9JpdEBqDCYeDbaQvYjXHe2r4/FkyWJBYFR+cjBqpNPYcsS1CgkhzBzmIapk
 dIo6Zm2/JyTKxXZdJwH791t0q2tMxClpp7Wcaokm7K7sqMd0eXXg5I0Qg4TW0WLC9VaUqfkhxYlYr
 DCpd3GNr3epCZ/KCw0CPD5GVc4AYjgO3H/5V68hLJVPeWTScpm8SqG5UsERaQaC61Qap2r0DkG+Td
 uvYYUmJg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uXg8y-00CR7a-UX; Fri, 04 Jul 2025 15:07:57 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/sched: De-clutter drm_sched_init
Date: Fri,  4 Jul 2025 14:07:53 +0100
Message-ID: <20250704130754.89935-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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
index c63543132f9d..648b5d2feff8 100644
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
@@ -1261,6 +1255,25 @@ static void drm_sched_run_job_work(struct work_struct *w)
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
@@ -1301,13 +1314,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
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

