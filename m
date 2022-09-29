Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E45EF64D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4507C10EA5E;
	Thu, 29 Sep 2022 13:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A0410E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:40 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id rk17so2787753ejb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+703B+ecEWc5RD4rB/fwdJkcq6GMHMBl7UdtMi4NdSs=;
 b=pvhfUt/XQ4E73xa/5hwHegqbJGGqodQrHqoYHHe4qFllKuQHB+i9kwE47sUZdwa9w9
 HRmDjiT2kElpOgyog0itFxguuj5Mw1DQjfaDuUq7GCDQ8j57Oht91tHIsZ30uV12OQ6v
 Lh9QYgFBMp1L4ExvRdr81Tq6nNvwNYk1dsHMyVD/CNAXvHxhe+RdGuRufT0JwE8gBy2r
 l2uGFhyuRZUXqH06GKCf8VA20dP9ioKAgV0475u+XfA9PaO4O+vyYu2X6MkKJLcNLzMF
 uthWPz5FQF0iYEQeaCYxI4ktaKZhyoaWGy48q/aaCA0dMObNHt1H2S1Lnjn6/SGaJWPS
 s56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+703B+ecEWc5RD4rB/fwdJkcq6GMHMBl7UdtMi4NdSs=;
 b=ID7EKcA+2TMBhuw9Yuv+XVnWm5YztsTXxR3bdqwbB1434SaRaU8AHiZr+fadzIlEis
 QHhNtSh+j1tZFhmgen3D9OEFda2i5QwMV6qvhMWa9sUfz0njBh76Qs4n0f6ZR3NMyCaW
 8wS6TjI+gvMLXzDtP735bMhs6805LbGq+pbRWP4008gEyrz68eKug1hna14Xrc3cMBHC
 jvrILBLzfFvXRwz0VUQWyxHZorJLvE/YKFw/CBxiJYIK17JKm6uESPoX2iXvhDeIt4qY
 lKxyeQoSBEbk3JILkXyG3Q1oFhivTCqHfI2C1/BAhGofkbXv6VWRlLDyDW3grviqqRHh
 FMtQ==
X-Gm-Message-State: ACrzQf1BOa7OnF3ya6kV2gq3O5HqW+PnLmZNtWEOzpOBwGBs54u3uT4n
 zhIWSRrpgtWq0Ctmv9VoYYzKmPeN8nU=
X-Google-Smtp-Source: AMsMyM58ttEjFNOah7LawsQQOoX1yGS6MECjBYfxaN+/rQuvd8AhwlRYEv9waLRL2xaHHhpYGRen0w==
X-Received: by 2002:a17:907:2e02:b0:77c:405e:e740 with SMTP id
 ig2-20020a1709072e0200b0077c405ee740mr2682986ejc.139.1664457699309; 
 Thu, 29 Sep 2022 06:21:39 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/13] drm/scheduler: add drm_sched_job_add_resv_dependencies
Date: Thu, 29 Sep 2022 15:21:25 +0200
Message-Id: <20220929132136.1715-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
References: <20220929132136.1715-1-christian.koenig@amd.com>
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
Cc: shansheng.wang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new function to update job dependencies from a resv obj.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 49 ++++++++++++++++++--------
 include/drm/gpu_scheduler.h            |  5 +++
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e0ab14e0fb6b..6e2cd0f906b2 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -685,32 +685,28 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
 /**
- * drm_sched_job_add_implicit_dependencies - adds implicit dependencies as job
- *   dependencies
+ * drm_sched_job_add_resv_dependencies - add all fences from the resv to the job
  * @job: scheduler job to add the dependencies to
- * @obj: the gem object to add new dependencies from.
- * @write: whether the job might write the object (so we need to depend on
- * shared fences in the reservation object).
+ * @resv: the dma_resv object to get the fences from
+ * @usage: the dma_resv_usage to use to filter the fences
  *
- * This should be called after drm_gem_lock_reservations() on your array of
- * GEM objects used in the job but before updating the reservations with your
- * own fences.
+ * This adds all fences matching the given usage from @resv to @job.
+ * Must be called with the @resv lock held.
  *
  * Returns:
  * 0 on success, or an error on failing to expand the array.
  */
-int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
-					    struct drm_gem_object *obj,
-					    bool write)
+int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
+					struct dma_resv *resv,
+					enum dma_resv_usage usage)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	int ret;
 
-	dma_resv_assert_held(obj->resv);
+	dma_resv_assert_held(resv);
 
-	dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(write),
-				fence) {
+	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
 		/* Make sure to grab an additional ref on the added fence */
 		dma_fence_get(fence);
 		ret = drm_sched_job_add_dependency(job, fence);
@@ -721,8 +717,31 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 	}
 	return 0;
 }
-EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
+EXPORT_SYMBOL(drm_sched_job_add_resv_dependencies);
 
+/**
+ * drm_sched_job_add_implicit_dependencies - adds implicit dependencies as job
+ *   dependencies
+ * @job: scheduler job to add the dependencies to
+ * @obj: the gem object to add new dependencies from.
+ * @write: whether the job might write the object (so we need to depend on
+ * shared fences in the reservation object).
+ *
+ * This should be called after drm_gem_lock_reservations() on your array of
+ * GEM objects used in the job but before updating the reservations with your
+ * own fences.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
+					    struct drm_gem_object *obj,
+					    bool write)
+{
+	return drm_sched_job_add_resv_dependencies(job, obj->resv,
+						   dma_resv_usage_rw(write));
+}
+EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
 /**
  * drm_sched_job_cleanup - clean up scheduler job resources
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 0fca8f38bee4..3315e5be7791 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -32,6 +32,8 @@
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
+enum dma_resv_usage;
+struct dma_resv;
 struct drm_gem_object;
 
 struct drm_gpu_scheduler;
@@ -474,6 +476,9 @@ int drm_sched_job_init(struct drm_sched_job *job,
 void drm_sched_job_arm(struct drm_sched_job *job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
+int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
+					struct dma_resv *resv,
+					enum dma_resv_usage usage);
 int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write);
-- 
2.25.1

