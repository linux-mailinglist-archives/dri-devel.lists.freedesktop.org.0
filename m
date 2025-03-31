Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6EDA76F06
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B907B10E4A9;
	Mon, 31 Mar 2025 20:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f2Jids0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6257D10E48C;
 Mon, 31 Mar 2025 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A6avTzRhrfMhmIEmpLBmQgSjLYOVxJlrzMrRqL/r4Kc=; b=f2Jids0d/1EDkwlBA1O0jVpV8h
 Gvn3yb5oxpm9/J+2Z17RijHZ91dXdHldQZ7lMF1ZD5mh/w63KvNVJYbPMm33zC2PE5jsE+5FO0QGV
 XkCDuABcJ+ueR1KY2Jyhl5avRPy7gJD5RjaMkUgszs4jYMBtV/1XYvjW719AyFt9KW3V8RZWN54n4
 HDKBUDOW9qHoIgjEdO9fzq3e1R2mka8vb/PJN7AXwD8qVdJkQOWdPR3C42oGKhiDhyRS9t1Ck5PLQ
 0hwMNAaLMilFzv7RZnnn6ztJ34iO0Y8BRUXlMzi5CRWWKz1T/itLvg6+IUYdhzbuXpEfXFDs6I1l1
 PswsmNtg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZf-009M4M-M3; Mon, 31 Mar 2025 22:17:35 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v3 13/14] drm/sched: De-clutter drm_sched_init
Date: Mon, 31 Mar 2025 21:17:04 +0100
Message-ID: <20250331201705.60663-14-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/scheduler/sched_main.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4c52953a01a3..76eee43547a9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -83,12 +83,6 @@
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
-#ifdef CONFIG_LOCKDEP
-static struct lockdep_map drm_sched_lockdep_map = {
-	.name = "drm_sched_lockdep_map"
-};
-#endif
-
 static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 {
 	u32 credits;
@@ -984,6 +978,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		wake_up(&sched->job_scheduled);
 }
 
+static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
+{
+#if (IS_ENABLED(CONFIG_LOCKDEP))
+	static struct lockdep_map map = {
+		.name = "drm_sched_lockdep_map"
+	};
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
@@ -1007,16 +1014,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
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
-
 		sched->own_submit_wq = true;
 	}
 
-- 
2.48.0

