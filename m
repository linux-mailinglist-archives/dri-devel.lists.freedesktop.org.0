Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299677E7592
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8883110E235;
	Fri, 10 Nov 2023 00:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFCB10E38C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:01:31 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-41b7fd8f458so9363631cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699574490; x=1700179290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iAO1m6eq+Mi5ICCmnFWSJOu4+yTsu2zOLJ9kLqo6NVM=;
 b=HZKDD5j81aK9o80cuXNxzyv0f5DTFdXbSuGl/5ArcGjl60gp+Xz4wfM3ZiJueRD4Y3
 qWoDEIzvJw2fSha+T4QsgvdVXP1UzHq68nCBsOvIDEJ8BYh8hiwUlxaQKQNjYOtREbUm
 A46HlznIzg01Iy6GhQ6cr8ormmC2khJwUvTCHygSzNT40fe4gFoPOsMJ5sA2YyAPRfD2
 gaFuVmNAyoZEIx8DoAGMg+GrGtUNEXgbIWileHw+p3jAafFybuTXRLC+fNZ5QpHTJbG9
 xWU7M0n/VhUmJQj8sNTvJ1j/nWA20autdmw05S8hQov1FJcUJD8DpUHlq7lE7E9FkA1d
 oRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699574490; x=1700179290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iAO1m6eq+Mi5ICCmnFWSJOu4+yTsu2zOLJ9kLqo6NVM=;
 b=wGVPptzffGPfoU+ftJlQJnwvkuuOl+PT61kwJwRm/wQUy8wFc8A0M8lZPDyF+4SG7b
 Zi25YHAn8Vqr/XKN7jkIVxZ50XkF+sq8oB9iXpZNuWgngvcdapU2SX+Uz5qpi8R2LY5+
 tpHAy17rA69lkLSo+zqAlqxd8Nt+aUVOQCmBVs1L0EEq9lxqqx8iiuJ8Ad7JToQHKeo/
 tD1YbP6fcFdwK3EbpWMqjSDj1Fa4a5vfBHry+EQ1fH61lilWsHPrpH2WZ+r9ZPRjNusi
 DsE0P1oM/snjU0rDez1ylXkos8ffvppDXKMKbCvKqFdotqbmWTLBWDhnM4XxF8s3KATi
 P2bQ==
X-Gm-Message-State: AOJu0Yy91QCk4oCYQQdmw6QFC3GzpERGXgjLn0eTv2UXg3PXIXIEjd/r
 zDQEk3l81X9RiimN7IFkGUCo4A1dvdQskJ5IE3s=
X-Google-Smtp-Source: AGHT+IFZTDoKr0t+gVQCQQKN8GrAAnIp/cSz7abPqW2HVn084A49Vywtvtuvm8oodi+lbK79McvsUQ==
X-Received: by 2002:ac8:5dd4:0:b0:41c:c3ad:922f with SMTP id
 e20-20020ac85dd4000000b0041cc3ad922fmr7222058qtx.42.1699574490395; 
 Thu, 09 Nov 2023 16:01:30 -0800 (PST)
Received: from localhost.localdomain
 (bras-base-toroon0964w-grc-76-76-65-20-140.dsl.bell.ca. [76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 cj17-20020a05622a259100b004196a813639sm2389063qtb.17.2023.11.09.16.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 16:01:29 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()
Date: Thu,  9 Nov 2023 19:01:24 -0500
Message-ID: <20231110000123.72565-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
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
Cc: Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't "wake up" the GPU scheduler unless the entity is ready, as well as we
can queue to the scheduler, i.e. there is no point in waking up the scheduler
for the entity unless the entity is ready.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 8 +++++---
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f1db63cc819812..4d42b1e4daa67f 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup(entity->rq->sched, entity);
 }
 
 /**
@@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup(entity->rq->sched, entity);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cd0dc3f81d05f0..8f5e466bd58239 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -925,10 +925,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
+		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_can_queue(sched))
-		drm_sched_run_job_queue(sched);
+	if (drm_sched_entity_is_ready(entity))
+		if (drm_sched_can_queue(sched))
+			drm_sched_run_job_queue(sched);
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 754fd2217334e5..09916c84703f59 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -559,7 +559,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched, struct drm_sched_entity *entity);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);

base-commit: f415a6078f640ab15bae34d3c6a1d8e6071363de
-- 
2.42.1

