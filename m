Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F930A67366
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4103110E180;
	Tue, 18 Mar 2025 12:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JcD5auGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F5B10E1F6;
 Tue, 18 Mar 2025 12:03:19 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso11934614a12.1; 
 Tue, 18 Mar 2025 05:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742299398; x=1742904198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qDQ3T3FQuW2vH6Fch3DBzFXqBXihstA0QbCtSAkM1Do=;
 b=JcD5auGIdPJltfIAm3In5u9EmYkFaIUAZxVQSlyglf8XS0IT6CRLVlW2jtFbRVaN2d
 NSRq9p1Y4YQQrWxA6tq6x77zOJMDL/QNU9pKSnSvAiEUaubskpy4M3tHr0zs7XzaZF3q
 V4J3hw36VIl0lKHHiH/5NRStqegGqsUfRBh8VrFD5YjS/BgGDAzU9FF4KAkBQboS41Xi
 aDNSmJtVixNJzaSG/OMXihsfZLMt98J2ZunSPtcpLM4NgfUFftOoMvNyDuoBvDRCQDRE
 bUXMA+9LV7IYt8SqLoyIRAv0Iq+hhRBDoQSQAXsvPRBVKWKfAAo5+kiiTNm19SR5z1UC
 xfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742299398; x=1742904198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qDQ3T3FQuW2vH6Fch3DBzFXqBXihstA0QbCtSAkM1Do=;
 b=mB05NH98fBvh+cA0AaLIG09O8bfZiIBrCBdZrlN8IbpFdW00YPIJ+o4epzzkD9AHSM
 JfjSvuc18zOqPbzmFZFQG3xRVTdkeOBW3ykBQtx+wIVWFocl4/w1tGq8hcEnF6UG7INo
 c+3IkUEu8S46sTOv2el7jfLIEgWKWVsJSxNp12mC5d4t1/Z7ZtxzEr/Wf7+glMxuZrcD
 LFYpJsPQjjSOyvpvm24EV2zujj+SzjkPneev5QwpSDYHyT+DEFW+cEqVXmemdit3jhlk
 7STihxu8tq92iG9pOBgXKwaWlugCqe9rVy+btBs4wtfyyM6C4hkYpyNVSCRLNZzwTJTB
 ZVIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV80bXtIV7EPhozkKkppgM3AXsgtKmXagMVW1+hlv5KLUKCBeFkbIzNpaASM0Jtk5UuXlc4OWhGyKJY@lists.freedesktop.org,
 AJvYcCXT/FymVbALEGDURwojKRvWIilm1JzoLN5tVXfp1c1y1TUQooHOEP5FQhA0tCQv0RLFbw786cEd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW02vGN7eUUwHpbvjOO8ymty7IEGwPQHWx6baybGvyK+ISCk1F
 X6x1wEnbESxfYpOs8rCY9n/xXHIRf4dQ3bB3bSwM9HjfUiobc7dR
X-Gm-Gg: ASbGncu8cHg23oCuWpqIH12D1b8xMaUSa2dRHDpZHsAAA4wKw2W8ZbKwM4CYcZeHNVR
 aq+v1H5Pnk3p6LqvLA7HB+mT++QdMSpsF+6RhAinUab8jTlR7iQjRG7h20yZkprjkyto9Fwqh5a
 3nFrAl8DuXzu4NqGCElemBTp7t8H0g4duFiWXYl+4kU4cV1deYb0bdEh3S1CAOnEvA1R6NLSIBQ
 jTFbGHAuvpVVcVmdE2mxz0C9taHEMfzVitTXy/J3NM+qVyG842ILJCnMExe7Cb7LTwQcYFAXjkX
 Ku1IED9LJsDCmAB22yj9A3+bFu5cSP/3uiWprXgQFZRheGlxuDDplukr6w==
X-Google-Smtp-Source: AGHT+IHOMu1YhSAD95J6yktmxiTxLEGWhBl37S8jDYFCMWbSGvDtYc1rUZLoW9gqo8xvzxslHpXk4Q==
X-Received: by 2002:a05:6402:5110:b0:5e0:8a27:cd36 with SMTP id
 4fb4d7f45d1cf-5eb1efff94amr3185329a12.8.1742299397596; 
 Tue, 18 Mar 2025 05:03:17 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1527:7100:c898:4de8:4301:2cfa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816afe1f6sm7433380a12.77.2025.03.18.05.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:03:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tvrtko.ursulin@igalia.com,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
Date: Tue, 18 Mar 2025 13:03:12 +0100
Message-Id: <20250318120313.19099-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318120313.19099-1-christian.koenig@amd.com>
References: <20250318120313.19099-1-christian.koenig@amd.com>
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

The problem is that drivers sometimes need to add dependencies without
allocating any memory.

Add a function which preallocates slots by inserting signaled stub fences
into the dependency array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 41 ++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h            |  2 ++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4d4219fbe49d..2085eea89513 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -852,6 +852,38 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
+/**
+ * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding dependencies
+ * @job: scheduler job where dependencies will be added
+ * @num_deps: number of dependencies to preallocate slots for
+ *
+ * Preallocate memory so that no ENOMEM can come later while adding
+ * dependencies.
+ *
+ * Return:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_deps)
+{
+	struct dma_fence *fence;
+	u32 id = 0;
+	int ret;
+
+	while (num_deps--) {
+		fence = dma_fence_get_stub();
+		ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
+			       GFP_KERNEL);
+		if (ret != 0) {
+			dma_fence_put(fence);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
+
 /**
  * drm_sched_job_add_dependency - adds the fence as a job dependency
  * @job: scheduler job to add the dependencies to
@@ -878,10 +910,12 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	 * engines involved, rather than the number of BOs.
 	 */
 	xa_for_each(&job->dependencies, index, entry) {
-		if (entry->context != fence->context)
+		bool signaled = dma_fence_is_signaled(entry);
+
+		if (!signaled && entry->context != fence->context)
 			continue;
 
-		if (dma_fence_is_later(fence, entry)) {
+		if (signaled || dma_fence_is_later(fence, entry)) {
 			dma_fence_put(entry);
 			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
 		} else {
@@ -890,7 +924,8 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 		return 0;
 	}
 
-	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
+	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
+		       GFP_KERNEL);
 	if (ret != 0)
 		dma_fence_put(fence);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1a7e377d4cbb..916e820b27ff 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
+					    unsigned int num_deps);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
 int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
-- 
2.34.1

