Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C560EA35B59
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69110E2C3;
	Fri, 14 Feb 2025 10:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gVKb09nt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171B310EC34;
 Fri, 14 Feb 2025 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y5sn7H0j02hVNKAJKCv56CaA6r+YcXGnefV0a6qFRls=; b=gVKb09ntZFwGpybzanmUG9ocJK
 Pv8KEDiIq4athNoQr6+BG6eIRMMq8ePULmT4nUUizVx40dpFib64Y8taegjC+ACXdEeT0f0Sgmt5J
 dotKBExxI9VmhM0hGjZ9QfabJanSZA+CaEt7zSe8oeiNhy7CN4UaKirFiUbIl7LTxBBL4LTqerCD6
 D3I3whITtMoHfzqWDZi7owvMFiV8HfgRGRcyj4PAAW48LMaVkV6ooggQ7fa6R8pWYBe8YEQ7yxKAH
 Kx3O97e9YICsxPrZPk+cdMi6YFehwRcI3l2XUKJsWRWpu7sHJHKvsEJqjuqTrR5natOOAcFsxa9Lq
 8Ek7nYwg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tisnS-00HYlW-E1; Fri, 14 Feb 2025 11:19:52 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH v5 2/6] drm/amdgpu: Pop jobs from the queue more robustly
Date: Fri, 14 Feb 2025 10:19:40 +0000
Message-ID: <20250214101944.19390-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
References: <20250214101944.19390-1-tvrtko.ursulin@igalia.com>
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

Replace a copy of DRM scheduler's to_drm_sched_job with a copy of a newly
added drm_sched_entity_queue_pop.

This allows breaking the hidden dependency that queue_node has to be the
first element in struct drm_sched_job.

A comment is also added with a reference to the mailing list discussion
explaining the copied helper will be removed when the whole broken
amdgpu_job_stop_all_jobs_on_sched is removed.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 100f04475943..1899c601c95c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -411,8 +411,24 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 	return fence;
 }
 
-#define to_drm_sched_job(sched_job)		\
-		container_of((sched_job), struct drm_sched_job, queue_node)
+/*
+ * This is a duplicate function from DRM scheduler sched_internal.h.
+ * Plan is to remove it when amdgpu_job_stop_all_jobs_on_sched is removed, due
+ * latter being incorrect and racy.
+ *
+ * See https://lore.kernel.org/amd-gfx/44edde63-7181-44fb-a4f7-94e50514f539@amd.com/
+ */
+static struct drm_sched_job *
+drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
+{
+	struct spsc_node *node;
+
+	node = spsc_queue_pop(&entity->job_queue);
+	if (!node)
+		return NULL;
+
+	return container_of(node, struct drm_sched_job, queue_node);
+}
 
 void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 {
@@ -425,7 +441,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
-			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
+			while ((s_job = drm_sched_entity_queue_pop(s_entity))) {
 				struct drm_sched_fence *s_fence = s_job->s_fence;
 
 				dma_fence_signal(&s_fence->scheduled);
-- 
2.48.0

