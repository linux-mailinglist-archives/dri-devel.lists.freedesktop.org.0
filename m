Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DB25FEAE0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7188B10EAAF;
	Fri, 14 Oct 2022 08:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847BA10E176;
 Fri, 14 Oct 2022 08:46:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id y14so8977540ejd.9;
 Fri, 14 Oct 2022 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJu5g8g5ZXo6kLGlAuCc+AqMnXU0FrsFLdgzWJloogc=;
 b=X5lIkd/m3FUx5vyGr6hH6/wkK40cwWTZ4ipXZTQMy0pcDErxuUr0xhjKfEIcsff3Gr
 ODcihDnJNsOZ5H+J5ILX0iZNZm3hwHqgas+YGrR3WQdwYGQ56vqgSQQyUewq1lSeaTI7
 SGLhcZLnewekkjZ+LJNPKtcvUtJ9g84xJ+vilTN06WuHlXzYpptyV0jSyw84fXDattuU
 51zddMT/CEGlkWPjQbamiKrdIP6s/+/Q3uxvWVuN5zs9GvhVBCOVG7DWQJB3Dl7hUu6Q
 +z8Z+AsVF0Z6EjMWBkRzOipADsu1DuktaFvi/jCRxJ9O/dyWrp6Ti1DuZUUKjG09Wu20
 LbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJu5g8g5ZXo6kLGlAuCc+AqMnXU0FrsFLdgzWJloogc=;
 b=H65hTYgt3jfjaX9AWPrWx7YqLYN/Hsb0V8lNX+H/UaVWX0PdyKrN4F1Hg6NtL0C4EG
 5Ij8GAN7Y6vOtpmXgUkAuO0GgSrE/PJIxkK6gNLPqJ4VQsuWRK17n1wDEd+6oU000Pud
 uDp+1Aij0/fz8Ho9cFYqYEpKoEkI5L39obEF8U77XkEvfnb47CB/JYiYOVsheiJ+cZYZ
 CS7BLvRmbnCB7QKPgYImEQ2U4jLHudqEUpmNe/auuzii4BsPkNkRZfaGvC9p2xmwGPS3
 4CdoIDQ8eJ3JlczqbYfCiVnrl9TSezbdYU9D0zpbFLZJECF7QNMv34WZQvNHSzvikuw2
 rh0Q==
X-Gm-Message-State: ACrzQf2eEx+Ni1bB645wMcoESyhbyII/g5tEbZfx6VMVVDa6+eip0jbM
 niBtO1YKfNE73RtOpcWR4wQ=
X-Google-Smtp-Source: AMsMyM7oX9jms2V643udyhrONtzoOjzRZ53kGq44KZXj6ySqgbKTnK9XVVGFlNRoVMX5IrpZpd+ZWw==
X-Received: by 2002:a17:906:9b87:b0:733:1795:2855 with SMTP id
 dd7-20020a1709069b8700b0073317952855mr2785461ejc.156.1665737207066; 
 Fri, 14 Oct 2022 01:46:47 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/13] drm/scheduler: add drm_sched_job_add_resv_dependencies
Date: Fri, 14 Oct 2022 10:46:30 +0200
Message-Id: <20221014084641.128280-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
index f01d14b231ed..2a6e261ea01e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -41,6 +41,8 @@
  */
 #define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
 
+enum dma_resv_usage;
+struct dma_resv;
 struct drm_gem_object;
 
 struct drm_gpu_scheduler;
@@ -483,6 +485,9 @@ int drm_sched_job_init(struct drm_sched_job *job,
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

