Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E109789E0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 22:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55510ED8B;
	Fri, 13 Sep 2024 20:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EdtwOteQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FF310ED84
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 20:23:11 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2055136b612so32785075ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 13:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726258990; x=1726863790; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RGrbRu4UVUOtjQ0FjFvwXtnrS7aqfcokFl3QpnQ2GXE=;
 b=EdtwOteQrd1Rvkrt8oFER+Zr4vQuL208CXnat7qGe666X4tVTu3+GvY5JofhcAN1Ym
 Ppy10+nRoKZPxk69bOJ8xyOquANSDi5KXxMaoP3h2WvKrTV8077Wug+MwQMT8qeHdjN+
 IL2bOulrKhS7wfcm/xJq/yDTWGitR5QpSIpTi+Ha67HH1l51IyCpPaZISbfrXpsThrDQ
 qlHXL/WZcppTiTTob1uSvNofd20uKqC3w/uwNF4GkHPHFiqZYvbiHj9qmp+EZxlhkD6L
 UKtnj7n6T9CytlMhcqW+1aFmlHZMhvTK803uRSaG6GyE0GGpLxTmdNNmmAn9LpGdHEVd
 fZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726258990; x=1726863790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RGrbRu4UVUOtjQ0FjFvwXtnrS7aqfcokFl3QpnQ2GXE=;
 b=snhEjo9DcgatWB2D7GUWJoxoGRAdhOUg58vx7cVJx/6j1jUNmhdReEEGV3sDrojNPY
 +VLFwUrmDnLljOqnnrxz884nI7qrpA4J0b+16uuHaByCd9jLY4QHK5CyfvZNW/a0ytP8
 zDLueSolyro3HrS9fpLP4+/uunb1U6zfvzN0tBSKt0+y2ZNVGRR/nOdIhloAyuFbHg6c
 SHonGVPgyukcUOZmqS/RSwhT2RkMpCAN8J57vVZjE4bVnIN81EqxS78REhzNeVuYOh0n
 T5be04gOlRtn43pHIiYkHzoq5RuE7kV1tw5lMh/Zqr9cVbFy4B1LJis7l6K5fmNGq6lC
 AAIw==
X-Gm-Message-State: AOJu0YzlprXWiyh1bCNBSO0ds6Evcjb3+Y5FrpnVxomxIpI7vnGs7iW2
 ngRZBA52v2xS1Yt1BwAeaZUHdGfdUtxWo0by2lJW5baacr9WkEInWoEiZQ==
X-Google-Smtp-Source: AGHT+IFHJ41lFsckyz82yO3h+VuYR/uhhZQb1LPgxwsKBosoaojM8n5ejFt72vGXXggfzMb2Hq8hRQ==
X-Received: by 2002:a17:902:ccc8:b0:207:1709:dbe with SMTP id
 d9443c01a7336-2076e421fddmr131470595ad.50.1726258990386; 
 Fri, 13 Sep 2024 13:23:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20794730be0sm305315ad.264.2024.09.13.13.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 13:23:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Asahi Lina <lina@asahilina.net>,
 stable@vger.kernel.org, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/sched: Fix dynamic job-flow control race
Date: Fri, 13 Sep 2024 13:23:01 -0700
Message-ID: <20240913202301.16772-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes a race condition reported here: https://github.com/AsahiLinux/linux/issues/309#issuecomment-2238968609

The whole premise of lockless access to a single-producer-single-
consumer queue is that there is just a single producer and single
consumer.  That means we can't call drm_sched_can_queue() (which is
about queueing more work to the hw, not to the spsc queue) from
anywhere other than the consumer (wq).

This call in the producer is just an optimization to avoid scheduling
the consuming worker if it cannot yet queue more work to the hw.  It
is safe to drop this optimization to avoid the race condition.

Suggested-by: Asahi Lina <lina@asahilina.net>
Fixes: a78422e9dff3 ("drm/sched: implement dynamic job-flow control")
Closes: https://github.com/AsahiLinux/linux/issues/309
Cc: stable@vger.kernel.org
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 7 ++-----
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 58c8161289fe..567e5ace6d0c 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -380,7 +380,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched, entity);
+	drm_sched_wakeup(entity->rq->sched);
 }
 
 /**
@@ -612,7 +612,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched, entity);
+		drm_sched_wakeup(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..6f27cab0b76d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1013,15 +1013,12 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 /**
  * drm_sched_wakeup - Wake up the scheduler if it is ready to queue
  * @sched: scheduler instance
- * @entity: the scheduler entity
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
-		      struct drm_sched_entity *entity)
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
-	if (drm_sched_can_queue(sched, entity))
-		drm_sched_run_job_queue(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fe8edb917360..9c437a057e5d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -574,7 +574,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched, struct drm_sched_entity *entity);
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-- 
2.46.0

