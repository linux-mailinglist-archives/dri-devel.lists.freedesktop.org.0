Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F417E346C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 05:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496E510E127;
	Tue,  7 Nov 2023 04:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C160A10E122;
 Tue,  7 Nov 2023 04:10:41 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-77896da2118so335037685a.1; 
 Mon, 06 Nov 2023 20:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699330241; x=1699935041; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/P0OY5KjRlEetyyFk6tsKAYYf0m6UzdxSS8Il0/u778=;
 b=Ui45bxUoV8CiEDt/8dDof4kYbNXbMPh0aSa/oopia2K/ne+rQaDZls95ZMlWV/Rf9L
 P+A6PvTmidO30Q5nugX0p1HUleVuELiNmjBD/hV0X+8PPhoDBgxX12CLvZgnhutJjknA
 NW0FFtXHwMhvO4dEpqp6+NBwCQ9hKQzYWSA91XggXMh6mdmMEl2GA7YoS2Ffonpj3tXM
 xyyYvL+RauYGTxVDlaQnCjb6qMJYgZkAfvdVET7wywJhsaGA0f6osDvR2AObN6q2uu7H
 NZ0CIFexMp5l0eIIA83/V8kVwOpuWNJjqPUO0b/gdcfmThdK8o81LHQtJGeuN+7jcmzw
 +92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699330241; x=1699935041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/P0OY5KjRlEetyyFk6tsKAYYf0m6UzdxSS8Il0/u778=;
 b=WY5dIZ5ZnBz+RT7pl/2y9xRkZmQDC5daEotyRR//uZ/OyHSfDDW11cxCNzohWXEF1u
 NQoVquorpC8Ip2SLmeZV3xJxjXeEtVMItAbpeKkz3qUu2wc+K8KrOceBKSXymdYYdm8G
 RswcHM6RmpIFmVD5E2lZIlX82eKw3VTHQbiSIl3sYArGPXseviWF1I09lSSTEoarRyal
 Gx+CcpYqME3QkVZCN0q4Tp7r1c2dEnMUng9B+HZquwkkKhT4XmrX/ADDmfIc2ePkD6PW
 sjvahW7VcTQClcZ6be2SyeQyzdFmkWePWQynFPozUamErZHDfR1f+7mHC24zVbq8b2eM
 o2Qw==
X-Gm-Message-State: AOJu0YzvutqCvOcwrCz6vb7dX/WhNf/m5/X8i3cS25T6X9KzhAisb7yn
 iQONCeQ671k9UZ+ZLViGhGE=
X-Google-Smtp-Source: AGHT+IFF1aM/gP/lwR4UnFzRbBg9tI4+DsBbngTPDSWOnkwh56NW0zfN2lbglD69bDalu4ruPlSTTg==
X-Received: by 2002:a05:620a:10a7:b0:778:8f98:96a with SMTP id
 h7-20020a05620a10a700b007788f98096amr30535470qkk.21.1699330240752; 
 Mon, 06 Nov 2023 20:10:40 -0800 (PST)
Received: from localhost.localdomain ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a05620a0b4100b0076d6a08ac98sm3888003qkg.76.2023.11.06.20.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 20:10:40 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: tvrtko.ursulin@linux.intel.com
Subject: [PATCH] drm/sched: Don't disturb the entity when in RR-mode scheduling
Date: Mon,  6 Nov 2023 23:10:21 -0500
Message-ID: <20231107041020.10035-2-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ltuikov@yahoo.com, Luben Tuikov <ltuikov89@gmail.com>, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
it do just that, schedule the work item for execution.

The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
to determine if the scheduler has an entity ready in one of its run-queues,
and in the case of the Round-Robin (RR) scheduling, the function
drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
which is ready, sets up the run-queue and completion and returns that
entity. The FIFO scheduling algorithm is unaffected.

Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
in the case of RR scheduling, that would result in drm_sched_select_entity()
having been called twice, which may result in skipping a ready entity if more
than one entity is ready. This commit fixes this by eliminating the call to
drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
in drm_sched_run_job_work().

v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
    Add fixes-tag. (Tvrtko)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 27843e37d9b769..cd0dc3f81d05f0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * __drm_sched_run_job_queue - enqueue run-job work
+ * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
  */
-static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_run_job);
@@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		__drm_sched_run_job_queue(sched);
+		drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
-/**
- * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
- * @sched: scheduler instance
- */
-static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
-{
-	if (drm_sched_select_entity(sched))
-		__drm_sched_run_job_queue(sched);
-}
-
 /**
  * drm_sched_free_job_work - worker to call free_job
  *

base-commit: 27d9620e9a9a6bc27a646b464b85860d91e21af3
-- 
2.42.1

