Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F87DFC96
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 23:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4EA10E18A;
	Thu,  2 Nov 2023 22:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653A10E189;
 Thu,  2 Nov 2023 22:47:10 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-77897c4ac1fso79631785a.3; 
 Thu, 02 Nov 2023 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698965229; x=1699570029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L5Y5aW8omcORKhmxQdekMLnw1i2rV+cg22g8TTJinRo=;
 b=SIyenaigc3RQHsC/Ewf6n+AK+HexLexuhKQZlXrs3moovNr3nT+pgBIiSmTWPAdkvq
 g1UX3OeuwMVgzqMMty5KMWYoyuh+D0GBnPuQF8II/nedmhvnn9luIlBJqrdukNzrNwEB
 F4C55NU3zoqGe1LF0XR7vyXmcE2WoSsSjKTDltA553/Cw3gwKRWrrh0sNsyVlkACFolB
 vhJapnRyVTMqrzQkT/trLR5a3P2AQh4oLZ8yoV7IrxQOp0mhxCzs+RoArvpK4Zj00VMg
 gTCk0/e2dhkIJ/sesvyrSrme+ayAUSF8EXeKco4WnTJlHKRXOkwKz28RCekdUHKv30Ak
 CA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965229; x=1699570029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L5Y5aW8omcORKhmxQdekMLnw1i2rV+cg22g8TTJinRo=;
 b=rcyKfP5WuFp2Ji9OMtAnvYUSToMA8YvebX7lTcnMjuG24mmtknffbuuzw+2h2YhPTR
 NcRlU+zCqryhiBecU+mb1JEtcbvcNcpd/KzhggV/a4RyZgTC1fSXApjqfTwCx6DyasOq
 kaGGLzfh9XsVGRKkollcc5zondDPuhu9kRh9LeoIENcvEqk6DLct0fJIh+P1+n0B4akg
 i+EIEQOrLBx2bpqZiuH6XAoaHLJKKqGmIuyHgmC38evUJu3pRWLNArYIacqYJ3V8I4GJ
 H6bWkOMMLHvlgGGPwJApolatW1tBscKwyYLRXjzNMTHUdtugBoMAlhdV2ZPkcQ5LKJCH
 2hrA==
X-Gm-Message-State: AOJu0Yzv7jOCLBwOWH4doXFTj1IJ2gyHZE9/nG9tH61uO5wEPwdDOcQQ
 vOvxun/kwKpTLEih/C3EbwU=
X-Google-Smtp-Source: AGHT+IF2gT2dryHgcp/tVuArhR4y5VTb6GX3t+JzzP1Gdu4P7JF0mV8eSp9SUS/+FA6QL+ezlfbrrQ==
X-Received: by 2002:a05:620a:640a:b0:778:9148:3c2c with SMTP id
 pz10-20020a05620a640a00b0077891483c2cmr19687618qkn.18.1698965229456; 
 Thu, 02 Nov 2023 15:47:09 -0700 (PDT)
Received: from localhost.localdomain ([74.15.198.235])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a05620a04e700b00765aa3ffa07sm169100qkh.98.2023.11.02.15.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:47:09 -0700 (PDT)
From: Luben Tuikov <ltuikov89@gmail.com>
To: tvrtko.ursulin@linux.intel.com
Subject: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
Date: Thu,  2 Nov 2023 18:46:54 -0400
Message-ID: <20231102224653.5785-2-ltuikov89@gmail.com>
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

Eliminate drm_sched_run_job_queue_if_ready() and instead just call
drm_sched_run_job_queue() in drm_sched_free_job_work(). The problem is that
the former function uses drm_sched_select_entity() to determine if the
scheduler had an entity ready in one of its run-queues, and in the case of the
Round-Robin (RR) scheduling, the function drm_sched_rq_select_entity_rr() does
just that, selects the _next_ entity which is ready, sets up the run-queue and
completion and returns that entity. The FIFO scheduling algorithm is unaffected.

Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
in the case of RR scheduling, that would result in calling select_entity()
twice, which may result in skipping a ready entity if more than one entity is
ready. This commit fixes this by eliminating the if_ready() variant.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 98b2ad54fc7071..05816e7cae8c8b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
-/**
- * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
- * @sched: scheduler instance
- */
-static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
-{
-	if (drm_sched_select_entity(sched))
-		drm_sched_run_job_queue(sched);
-}
-
 /**
  * drm_sched_free_job_work - worker to call free_job
  *
@@ -1069,7 +1059,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		sched->ops->free_job(cleanup_job);
 
 		drm_sched_free_job_queue_if_done(sched);
-		drm_sched_run_job_queue_if_ready(sched);
+		drm_sched_run_job_queue(sched);
 	}
 }
 
@@ -1127,7 +1117,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	}
 
 	wake_up(&sched->job_scheduled);
-	drm_sched_run_job_queue_if_ready(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**

base-commit: 6fd9487147c4f18ad77eea00bd8c9189eec74a3e
-- 
2.42.1

