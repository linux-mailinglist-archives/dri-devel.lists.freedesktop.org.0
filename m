Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1937F6BB2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 06:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B4410E33F;
	Fri, 24 Nov 2023 05:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680C010E134;
 Fri, 24 Nov 2023 05:28:12 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-41e58a33ec9so7820791cf.1; 
 Thu, 23 Nov 2023 21:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700803691; x=1701408491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEd37+CS0g7W2kV0CM4B4vaKMhhE6SvNFqz9yzetcmY=;
 b=Nj0eAcpQxzJc/3f0kbodWnuCoPEUBHm37G33HpSWPoOjXaIW8MXsTkoXubbhkxaqnh
 kg7UvLYCMl2gIxIXHKCAo1icIoDBkacNXXMbVe5BT9gl6Y0GJMfrriF4uo0KHwl/6egP
 weXLIkOWb23OMt5X9FNu/om0Uol9Cuxi5XNSPm0Leh7IKGUGwbW2dJ9xPAD8gmXRM73t
 BcpVyaQhOxNmBk7iS4qK9S3s9DG+N64FOg1dljuKQUEM2wjlCauJLpadG7O2a/v93bDV
 IOYyA8b55F7b0GTiyyXnlqxycAXugkw7XmnQ+2YTXGXScajFbmXE8+y4V2045uLdk6gJ
 yj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700803691; x=1701408491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEd37+CS0g7W2kV0CM4B4vaKMhhE6SvNFqz9yzetcmY=;
 b=wiq0VABG0TZtMWlsqjV3EVcHIfjIDUXM9mlpfaOVMNhyYqFAOVtndyB2AWMI0v/EM2
 +x931+iiouu8Zbvd6JcoTXhTKC9/2EJy8nCwhfwcmp/5SDEe76Hl3jIIepRaKxO4OCb7
 Xxc5dMRyvP8NxwTxxE1bM+23ymwprwP3mIMlA3HERIirTnq9i94mjy8nLJupXXWTkERb
 YCrZ9htFVw9dniCr3VeSqmVkCOk7EzeIlDY8oyUXylJNGnJ3j061aXhMPYKzS5g2aWgj
 XBHIpv/gACSWVLeqd9DIuhS2zTCJWUf58EK3Y6eV9aMslSWJ49UnNYMlMoLdKruZ4EDw
 QuXA==
X-Gm-Message-State: AOJu0Yx1wd0RySS9Wpc5KldwHbHh1BSEoOBjs14Kdjgu7IlMKlpda30K
 En59/pcSWYrDUrvfNU2+DAWgr7LJdw8GVA==
X-Google-Smtp-Source: AGHT+IHu6/lP+pf5+jiv8agN8Uc2o5gGxzEud+66NSdFFbDySiTp4WwIJz2IT2AG9g6lyeFBvxWX+A==
X-Received: by 2002:a05:622a:150:b0:423:7d92:ddba with SMTP id
 v16-20020a05622a015000b004237d92ddbamr2218061qtw.5.1700803691086; 
 Thu, 23 Nov 2023 21:28:11 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 g11-20020ac842cb000000b004181c32dcc3sm1017819qtm.16.2023.11.23.21.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 21:28:10 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
Date: Fri, 24 Nov 2023 00:27:55 -0500
Message-ID: <20231124052752.6915-6-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124052752.6915-4-ltuikov89@gmail.com>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reverse run-queue priority enumeration such that the higest priority is now 0,
and for each consecutive integer the prioirty diminishes.

Run-queues correspond to priorities. To an external observer a scheduler
created with a single run-queue, and another created with
DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedule
sched->sched_rq[0] with the same "priority", as that index run-queue exists in
both schedulers, i.e. a scheduler with one run-queue or many. This patch makes
it so.

In other words, the "priority" of sched->sched_rq[n], n >= 0, is the same for
any scheduler created with any allowable number of run-queues (priorities), 0
to DRM_SCHED_PRIORITY_COUNT.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
 drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
 include/drm/gpu_scheduler.h              |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1a25931607c514..71a5cf37b472d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index eb0c97433e5f8a..2bfcb222e35338 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cb7445be3cbb4e..6e2b02e45e3a32 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -81,14 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-		/* The "priority" of an entity cannot exceed the number
-		 * of run-queues of a scheduler.
+		/* The "priority" of an entity cannot exceed the number of
+		 * run-queues of a scheduler. Choose the lowest priority
+		 * available.
 		 */
 		if (entity->priority >= sched_list[0]->num_rqs) {
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_LOW);
+						 (s32) DRM_SCHED_PRIORITY_KERNEL);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b6d7bc49ff6ef4..682aebe96db781 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1051,8 +1051,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	/* Start with the highest priority.
+	 */
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1292,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1313,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,9 +1391,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_LOW;
-		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
-		     i++) {
+		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d8e2d84d9223e3..5acc64954a8830 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,10 +63,10 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_LOW,
-	DRM_SCHED_PRIORITY_NORMAL,
-	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
+	DRM_SCHED_PRIORITY_HIGH,
+	DRM_SCHED_PRIORITY_NORMAL,
+	DRM_SCHED_PRIORITY_LOW,
 
 	DRM_SCHED_PRIORITY_COUNT
 };
-- 
2.43.0

