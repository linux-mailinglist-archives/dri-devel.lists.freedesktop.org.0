Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D0DBFF127
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579C10E874;
	Thu, 23 Oct 2025 04:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JV8visnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B1C10E863;
 Thu, 23 Oct 2025 04:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192486; x=1792728486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GXAdVTjG2yJcescxkRZ6gK2f/H6F1nw8C+CWSnyy4yU=;
 b=JV8visnGUnAREXTyrCzJqqteboYR1Rt5jxUKcdNoGYunlC0G6xHfbC6n
 RmMAi3OY6dtI5o55xVGderAFK0S37TCRj8wuNwYuALeP4peNxYXaLfoD6
 9h9IJAY3ihcVTlDOYubcTYDBogV+HCxhXUriB+7U7f0azkUDBUtlZtXKA
 VFJQULWF9OCkWQg3YNdvG0OPfgu7BHunD1nXU8HlT0ILeYz3qRIEt64Fl
 j2E5zGVYkj6VpUXxdASKzXtKPdilsNowP4cnktsl3LVIrBCke0t2fMUdt
 dTNzlDlDfLDfEwhwI1j5OE5wY8A8pbp+ji9bbFlPuXeTtdSVRDrB5Wxzi A==;
X-CSE-ConnectionGUID: jSXEV+LnSQ2ugcPDdLm0XA==
X-CSE-MsgGUID: gSDKHJ5DTH65GIKSZcm00Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391281"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: tHp7YEj1Qimmd2sj9Y806g==
X-CSE-MsgGUID: IT4rJmKVTj6aZaHff2lKFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175752"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 04/14] dma-buf: detach fence ops on signal
Date: Wed, 22 Oct 2025 21:07:50 -0700
Message-Id: <20251023040800.970283-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023040800.970283-1-matthew.brost@intel.com>
References: <20251023040800.970283-1-matthew.brost@intel.com>
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

When neither a release nor a wait operation is specified it is possible
to let the dma_fence live on independent of the module who issued it.

This makes it possible to unload drivers and only wait for all their
fences to signal.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
 include/linux/dma-fence.h   |  4 ++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 982f2b2a62c0..39f73edf3a33 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return -EINVAL;
 
+	/*
+	 * When neither a release nor a wait operation is specified set the ops
+	 * pointer to NULL to allow the fence structure to become independent
+	 * who originally issued it.
+	 */
+	if (!fence->ops->release && !fence->ops->wait)
+		RCU_INIT_POINTER(fence->ops, NULL);
+
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
@@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
 	trace_dma_fence_wait_start(fence);
-	if (ops->wait) {
+	if (ops && ops->wait) {
 		/*
 		 * Implementing the wait ops is deprecated and not supported for
 		 * issuer independent fences, so it is ok to use the ops outside
@@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
 	}
 
 	ops = rcu_dereference(fence->ops);
-	if (ops->release)
+	if (ops && ops->release)
 		ops->release(fence);
 	else
 		dma_fence_free(fence);
@@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (!was_set && ops->enable_signaling) {
+	if (!was_set && ops && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
 		if (!ops->enable_signaling(fence)) {
@@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
 		ops->set_deadline(fence, deadline);
 	rcu_read_unlock();
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 38421a0c7c5b..e1ba1d53de88 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
@@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
-- 
2.34.1

