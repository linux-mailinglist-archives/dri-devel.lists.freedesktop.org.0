Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509304F9E50
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 22:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876BA10E141;
	Fri,  8 Apr 2022 20:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FA810E1C7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 20:46:25 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id s21so4226243pgv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KV0BRlHqQ/ANMNgO0tH9JzJ0NhpLZsaFQ9kSDeHV65g=;
 b=OET9nFS0fKsGnYx7JwsGncZ1FYdQuvS3MakA5pRMsgktDKQ0If/VIdEVg9xZZhu9BU
 hrgXyImimJNshMC1dVoaBQd5UCqNb/ZoBoc0APWut31ErhGq9ydzSdAT/ud52N7qe7G0
 G/R46RBL9ux70GLLzRYAS5R1NPBTYWRxFQ07pqg0h3hOU0XekYQgaOZD/+m4BdYqwqTO
 JrZawqOj7yFV9nUa9HM55NdzwjotwgytVFXrAjHTRVxl9d9JTrltTRMFQw75BFTmge/P
 mbTAR3hjWlqXiwF/gUeiX/lChhvQh4bSGv8T+49Bf6k3DCYMtGHTyEGdLzwO26jatva0
 RPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KV0BRlHqQ/ANMNgO0tH9JzJ0NhpLZsaFQ9kSDeHV65g=;
 b=Laa2lmzrH8wGk4ZkAPkaHRRquvtpxOQkmthtXtZSRwvpV765BOkLnLw94tv4kcvkBe
 04RwJFXLYUL8DvqU4l4s+Di1z30MPDVrfP4qETeK21Vyd9VPzVNTlhc4vLVbYVIhMW5m
 pPN90LWmhPzMfZ578421xx5V4LXsZs9n9Vkp38QaHUyHfRDY88Ax0EUwhrwpgGpa0kb8
 lMvsadzY5OT+9bXKd1K8qA5bRBxICQlYYQamKMzApm9DwDVBvmskBmwU2jidVc+PRxwe
 dQ9CPcS8y8QMvVDlNFAjpFdkS8wMNxKbXbx6uTTtTA3wTmwybJxO641QL2qdG4Ta23ST
 9apA==
X-Gm-Message-State: AOAM533E6mwoKM11+9HQmoIvwfUINGfIFjm97ISJ/s5zyQlqqtCPvJvL
 FZOAgIJmiEM+MEOyJQ+GrRcIGgupvm8=
X-Google-Smtp-Source: ABdhPJwGyU+N4G9xWjIdW3luwCXPb+kKJrCQQ3FPEhlCIFA3e63LvtSbEfmtEZT5v8Gx0y8RWGDZRA==
X-Received: by 2002:a65:6d15:0:b0:382:4e6d:dd0d with SMTP id
 bf21-20020a656d15000000b003824e6ddd0dmr16800025pgb.333.1649450784451; 
 Fri, 08 Apr 2022 13:46:24 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:c6d0:c747:3e11:b8e3])
 by smtp.gmail.com with ESMTPSA id
 y30-20020a056a001c9e00b004fa9246adcbsm25683013pfw.144.2022.04.08.13.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 13:46:23 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/sched: use DECLARE_EVENT_CLASS
Date: Fri,  8 Apr 2022 13:46:11 -0700
Message-Id: <20220408204612.596597-1-olvaffe@gmail.com>
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

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 31 +++++--------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 877ce9b127f1..2e6eda920fe1 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -32,7 +32,7 @@
 #define TRACE_SYSTEM gpu_scheduler
 #define TRACE_INCLUDE_FILE gpu_scheduler_trace
 
-TRACE_EVENT(drm_sched_job,
+DECLARE_EVENT_CLASS(drm_sched_job_entity,
 	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
 	    TP_ARGS(sched_job, entity),
 	    TP_STRUCT__entry(
@@ -59,31 +59,14 @@ TRACE_EVENT(drm_sched_job,
 		      __entry->job_count, __entry->hw_job_count)
 );
 
-TRACE_EVENT(drm_run_job,
+DEFINE_EVENT(drm_sched_job_entity, drm_sched_job,
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
+DEFINE_EVENT(drm_sched_job_entity, drm_run_job,
+	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
+	    TP_ARGS(sched_job, entity)
 );
 
 TRACE_EVENT(drm_sched_process_job,
-- 
2.35.1.1178.g4f1659d476-goog

