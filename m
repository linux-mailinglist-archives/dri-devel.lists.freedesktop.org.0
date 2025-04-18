Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CEAA93B30
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADCC8911F;
	Fri, 18 Apr 2025 16:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U2ootM8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3641910E22F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cWxwvIIWqCojnUclfaKh7T3eJvv/ymtwwLVEViBjWVk=; b=U2ootM8W9sE1F5+2uCj6BF9HdD
 nniqUWnngPODNt9UA/c4Do91LeJfrUOY16feWbKogHLaT29eMPStBYY42dqYWsh2EX4c/ofpvtAL2
 k7WXui81qp7dUngT1iFnt5G1Eto70k4IUq9q9DiaZ1xxkigeiBn8CvO22dXpHFAkgCkFcPawvap1I
 uDn7bqTTrtVVwGkhXGkM4Mcu/Fxce0U6Q4haClVNjfVBG+CRkuC0l5byVUARLedDSV1gYPeuQp0JY
 cKxg8LeOwcmzkvt/5U2QrGnrVkZLzJv8odSgtCmzjc7mN3JlXCl6XN9W5nFens/sS5/ELpfrrDdMJ
 nChP0ElA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u5onp-001Hc3-Ef; Fri, 18 Apr 2025 18:42:57 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 3/4] drm/sched: Keep module reference while there are active
 fences
Date: Fri, 18 Apr 2025 17:42:45 +0100
Message-ID: <20250418164246.72426-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
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

Continuing the theme from previous patches. This time round we deal with
the problem that it is possible to unbind the driver from the PCI device
with an active sync file fence.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..178077f03e44 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -115,8 +115,10 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
 void drm_sched_fence_free(struct drm_sched_fence *fence)
 {
 	/* This function should not be called if the fence has been initialized. */
-	if (!WARN_ON_ONCE(fence->sched))
+	if (!WARN_ON_ONCE(fence->sched)) {
 		kmem_cache_free(sched_fence_slab, fence);
+		module_put(THIS_MODULE);
+	}
 }
 
 /**
@@ -133,6 +135,7 @@ static void drm_sched_fence_release_scheduled(struct dma_fence *f)
 
 	dma_fence_put(fence->parent);
 	call_rcu(&fence->finished.rcu, drm_sched_fence_free_rcu);
+	module_put(THIS_MODULE);
 }
 
 /**
@@ -210,9 +213,14 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 {
 	struct drm_sched_fence *fence = NULL;
 
+	if (!try_module_get(THIS_MODULE))
+		return NULL;
+
 	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
-	if (fence == NULL)
+	if (!fence) {
+		module_put(THIS_MODULE);
 		return NULL;
+	}
 
 	fence->owner = owner;
 	spin_lock_init(&fence->lock);
-- 
2.48.0

