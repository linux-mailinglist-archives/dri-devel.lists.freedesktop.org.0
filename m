Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D34FE99E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD19410E512;
	Tue, 12 Apr 2022 20:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C09110E512
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 20:48:41 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id bg24so7179734pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urlXTPABvBzroXiuItmppiPjWQeuvhtzk1FniGFCu20=;
 b=JlA8k1/yduTDEqbimNzsA8BSgcuT1BfKNkVOj/ouFlHMpjqgV6TcC1kk7MltuacGZK
 CuWYo2w53+iLnqz46nODFUslukSmcdO6KSYekHPhjj4yrNlZsIddMGhrap81xH+A9ERW
 IgITWj5bOxuT8mhPi9//07F838m2HHN2pFYH4Wk1h1pQN4GzkyYhQ7q214hajzooTec1
 IPYrO7reTwHkUFq5mwjWlXwlr6I+DbQCIWbh03QdoBQQVCtq59lBlOPXR/9yohl28KGO
 lxrYgf5vfTmS5WLW5Yi+8avurzCg9bt8hefz+LyXTDTzfwdYHno51dDSq5UMqdq7XJJ0
 35Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urlXTPABvBzroXiuItmppiPjWQeuvhtzk1FniGFCu20=;
 b=3yJluY5bZf5wE/tmcqhDwzUrzx0pnDkn/Rao7Ylimak8wTEsJCe55ZyuRhmFhO7L5t
 bR9M05Zl8L/Sc5PfDSbeTMTiocfT8NFXh/rIhxUk7JQiHTzR7Ex2frK9EMdv6rjqUaSD
 MraakS8GktpoN3KDu3ncQ//qf3bZmNKdgOxtFfO1qcjoF4FlopBdyt9wxMvyUZCE58/+
 3fvnuvsW+WVLW6GlrSWSGY5axz/n6H/sVREw6EJUffy9nxtOSbTYDO6RtC4nHL3rvZou
 /9p7tom0wUQi+9ibPvP5X0t5hmtWPFfIdWe5wgrOoV9d/hngToC6bG0AKPAFpmukJIpi
 ZvfQ==
X-Gm-Message-State: AOAM531MkvytchGS2OB9sVTs8Yen/G1zygfBtNhDZVQgH7N5rRWJQ0FM
 TRTwi6Z+uXgPSYli0yj24QseQTusCk4=
X-Google-Smtp-Source: ABdhPJwHerIMQHF6OUwleCv1knH5ZhMLmo2a8u41izWsmFygBBCUuxOGn6rpjJgfrY1mZ8nlJyLbmw==
X-Received: by 2002:a17:90b:3b86:b0:1cb:c243:aed3 with SMTP id
 pc6-20020a17090b3b8600b001cbc243aed3mr6284731pjb.202.1649796520835; 
 Tue, 12 Apr 2022 13:48:40 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:1661:f107:58eb:51b7])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a17090a454a00b001c96a912aa0sm413548pjm.3.2022.04.12.13.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:48:40 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/sched: use DECLARE_EVENT_CLASS
Date: Tue, 12 Apr 2022 13:48:08 -0700
Message-Id: <20220412204809.824491-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
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
Cc: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_job and drm_run_job have the same prototype.

v2: rename the class from drm_sched_job_entity to drm_sched_job (Andrey)

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 31 +++++--------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 877ce9b127f1..188ae2105d57 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -32,7 +32,7 @@
 #define TRACE_SYSTEM gpu_scheduler
 #define TRACE_INCLUDE_FILE gpu_scheduler_trace
 
-TRACE_EVENT(drm_sched_job,
+DECLARE_EVENT_CLASS(drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
@@ -59,31 +59,14 @@ TRACE_EVENT(drm_sched_job,
 		      __entry->job_count, __entry->hw_job_count)
 );
 
-TRACE_EVENT(drm_run_job,
+DEFINE_EVENT(drm_sched_job, drm_sched_job,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
-	    TP_ARGS(sched_job, entity),
-	    TP_STRUCT__entry(
-			     __field(struct drm_sched_entity *, entity)
-			     __field(struct dma_fence *, fence)
-			     __field(const char *, name)
-			     __field(uint64_t, id)
-			     __field(u32, job_count)
-			     __field(int, hw_job_count)
-			     ),
+	    TP_ARGS(sched_job, entity)
+);
 
-	    TP_fast_assign(
-			   __entry->entity = entity;
-			   __entry->id = sched_job->id;
-			   __entry->fence = &sched_job->s_fence->finished;
-			   __entry->name = sched_job->sched->name;
-			   __entry->job_count = spsc_queue_count(&entity->job_queue);
-			   __entry->hw_job_count = atomic_read(
-				   &sched_job->sched->hw_rq_count);
-			   ),
-	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
-		      __entry->entity, __entry->id,
-		      __entry->fence, __entry->name,
-		      __entry->job_count, __entry->hw_job_count)
+DEFINE_EVENT(drm_sched_job, drm_run_job,
+	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
+	    TP_ARGS(sched_job, entity)
 );
 
 TRACE_EVENT(drm_sched_process_job,
-- 
2.35.1.1178.g4f1659d476-goog

