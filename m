Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21184988720
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4106910EC6C;
	Fri, 27 Sep 2024 14:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lueZNpqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4758910EC53
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 14:28:01 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42cb9a0c300so18647945e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727447279; x=1728052079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vDlr/22kiZgOVq04AVr3qbPI+AtwcDD0GIxtAYzjnGg=;
 b=lueZNpqV9BCjTOazpnQP8YUOguuaU/y5ACOYSxrZA1bVFf1FiLQvYXUFgZJD3e4/cR
 p+fZEXJrKzcJKoOXEolwDU8EKwUTfpD8ugsJbNVemevAkY7D35qwSdewEcPgv9P3yTwj
 5xiqqHXFE+zEl08q9gLiAnMQJEoBSGptkgvf+KrcYO4nL3r+LRYoNeX9+0IsMrNJZp/b
 j4pT0RxNfgbQBtOrX1LpvoQv2cvswA/Hrw4MOOQtQIs63ZpkJygcSv+PQ4OvbBCJbyaA
 akL0ztII7ZilENbQ3bzdMXwSXeU30hu7owvoYN2jWKACOAyxYthNZlkPtO9SF706Ixqz
 mhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727447279; x=1728052079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDlr/22kiZgOVq04AVr3qbPI+AtwcDD0GIxtAYzjnGg=;
 b=dzdotsj6UKJ4opn6sb8skn4n4s111QuKdSInp05cr5UGbIRpNVre4nv52VBch8yWA/
 MHe919wY8HbRNuygRwq0vkcCTg7zac25z+X+Nzcv8zOQucsy3O3NF/d9Ggv3hSaOapmV
 WqsQUyJWgsDL/r+0JPM/yeMD/zGOxGHlOGC2FVW5gHGjeG4J+xeq/VVLNTDD21lUIkJ+
 0w7DCp62GR4lCztlaiRORrTXntPJFYlvSxw3MfCBmrYZYUvArggU6RS2rh1KkqYfki/t
 /wfGQHfTVfnMvmEQjn4fX6Sovb1fMN4crzfKnoVqZ0xDQtcPhBlzMatDibeNpj7hauZI
 IByQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo5mfzjJee9kpQdTgTtQHBJuQOyLoYeiYD8G0+kSoJOAOTZ6HnQH3NMB0VGzYvhHV4/nxilGiJ9Og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw29GriSIaNPmSr+FSeJW6Ax87JB45kUjNOdy/npGas49kPwotk
 UXNeIHvfc4zTDFk+LQH9kvgIeCTgSPnGw87Yb5QZ6G0OJZBFhSnll00JjKlb
X-Google-Smtp-Source: AGHT+IGWDi46nCLGTlxwJwR0pgy9OaW3QKvpHW+cQ7kjSH3TeS2uAVQozB43VkdwGksGQzDcMYfZ5A==
X-Received: by 2002:adf:e504:0:b0:37c:cec9:284c with SMTP id
 ffacd0b85a97d-37cd5ae0728mr2056107f8f.37.1727447279447; 
 Fri, 27 Sep 2024 07:27:59 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1515:2900:6181:3f3e:a0cc:be1a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a36705sm76944445e9.33.2024.09.27.07.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 07:27:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: pstanner@redhat.com, dakr@kernel.org, ltuikov89@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/sched: document drm_sched_fini requirements v2
Date: Fri, 27 Sep 2024 16:27:54 +0200
Message-Id: <20240927142755.103076-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927142755.103076-1-christian.koenig@amd.com>
References: <20240927142755.103076-1-christian.koenig@amd.com>
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

Document the necessary steps which needs to be done before calling
drm_sched_fini().

Tearing down the scheduler with jobs still on the pending list can
lead to use after free issues. Add a warning if drivers try to
destroy a scheduler which still has work pushed to the HW.

When there are still entities with jobs the situation is even worse
since the dma_fences for those jobs can never signal we can just
choose between potentially locking up core memory management and
random memory corruption. When drivers really mess it up that well
let them run into a BUG() to prevent further damage.

v2: Use drm_WARN_ON() as suggested by Jani, add documentation what
drivers need to do before calling drm_sched_fini.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 31 ++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f093616fe53c..5510f04788d1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1324,7 +1324,16 @@ EXPORT_SYMBOL(drm_sched_init);
  *
  * @sched: scheduler instance
  *
- * Tears down and cleans up the scheduler.
+ * Before calling this function all entities which potentially used this
+ * scheduler instance should be forced idle using drm_sched_entity_flush() and
+ * detached from their scheduler using drm_entity_fini().
+ *
+ * Special care must be taken if drivers allocate scheduler instances
+ * dynamically. Since the dma_fence signaling doesn't guarantee any processing
+ * order of callbacks it is possible that the scheduler is still cleaning up
+ * when fences have already signaled. The easiest way to avoid that is to keep a
+ * reference from the job to the scheduler and tear down the scheduler from a
+ * work item after the last job was cleaned up.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
@@ -1333,17 +1342,35 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
+	/*
+	 * Tearing down the scheduler wile there are still unprocessed jobs can
+	 * lead to use after free issues in the scheduler fence.
+	 */
+	drm_WARN_ON(sched, !list_empty(&sched->pending_list));
+
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
+		drm_WARN_ON(sched, !list_empty(&rq->entities));
+		list_for_each_entry(s_entity, &rq->entities, list) {
+			/*
+			 * The justification for this BUG_ON() is that tearing
+			 * down the scheduler while jobs are pending leaves
+			 * dma_fences unsignaled. Since we have dependencies
+			 * from the core memory management to eventually signal
+			 * dma_fences this can lead to a system wide stop
+			 * because of a locked up memory management.
+			 */
+			BUG_ON(spsc_queue_count(&s_entity->job_queue));
+
 			/*
 			 * Prevents reinsertion and marks job_queue as idle,
 			 * it will removed from rq in drm_sched_entity_fini
 			 * eventually
 			 */
 			s_entity->stopped = true;
+		}
 		spin_unlock(&rq->lock);
 		kfree(sched->sched_rq[i]);
 	}
-- 
2.34.1

