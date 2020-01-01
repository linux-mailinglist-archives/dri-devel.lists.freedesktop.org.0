Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7657812DE8B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 11:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED7589B11;
	Wed,  1 Jan 2020 10:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB92C89B11;
 Wed,  1 Jan 2020 10:39:31 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r11so20518682pgf.1;
 Wed, 01 Jan 2020 02:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IKUnwiZiyGhS0sEDG6jt8naamqO43MC5eCJVVvWFUqg=;
 b=U0W/W1MfwkfQcT6FvZtHiG6iyEfkSzEyahs8KffFCh2KBKXnn8h7ODzN/Ir0YLLQ7Z
 Ba/RlaCNnAapgRaIeD9XdQ7mo2ll+GrTHU69LPPel26buDwd9lrPw2+ZEvUI3769RZpn
 xuQ/fFC+Rupi5rqsVoZM7KN3cTafBc5lUahaxZjOhFwaeQkLYqlufMrMJhE51qG4efnZ
 A/IcTfjwZfUgvNLOZFmNozxWo2Al5FIme6FbkTxOihShaEUtAVC5Z5AkFTHoIDIBcoLm
 2V1+C7+Xl3rI8JK5ET2JjplbQPyYjPbzWnjz5UF6kzbrH6EpHo2MV8l+DrIhup+KAnFB
 jIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IKUnwiZiyGhS0sEDG6jt8naamqO43MC5eCJVVvWFUqg=;
 b=Rz6wF/TkrvNzwVJHfQKze6W0cxFd6zJWSG5xSH+GiJkO+i3PNWc1J97uQ75BFSJw0w
 B/GrlNOGSvYZyMoi2ssa8eiYPmqFVx+v4hmwdPKULLHTfa+Nlr7S59XDRi6u6pdk6/j3
 DKdAeIOotZbZ8PBu99pPrm8CBhTqFJELjJHCmlR7LgRv8CJ0qiaBtYse/Gl5Bnsq202b
 LDMX2GBBzuK4/6hMeuMV4U4f1B4QxhgbpEFRE6cvp/Nzmp8g0kf1jY+uBiDQD3d+2eWn
 MvGdWDcBMeLPOtMD7pJmlAaf3biTDpUs1p5TTNamI304kZb2V+HOSlM7NO4PyULu2Kn8
 6PLQ==
X-Gm-Message-State: APjAAAWF4mwXxZk8uRXpJS7xLStGkqUGc4+GsjkpqopdOM1p7tT627Y3
 U6JU6kNuTBCnyPfJpyvnWVM/lQsMgMI=
X-Google-Smtp-Source: APXvYqzbv1uZUQIDSR0j4ZjkNqiQNa5aiFfKigylLrD0oyaQF0WMAKHETcKjuN13MKsPY25FqHzIZw==
X-Received: by 2002:a63:770c:: with SMTP id s12mr86527833pgc.25.1577875171181; 
 Wed, 01 Jan 2020 02:39:31 -0800 (PST)
Received: from yuq-Aspire-4738G.lan (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 h126sm35196071pfe.19.2020.01.01.02.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 02:39:30 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/lima: use drm_sched_fault for error task handling
Date: Wed,  1 Jan 2020 18:38:31 +0800
Message-Id: <20200101103831.22429-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_job_timedout works with drm_sched_stop as a pair,
so we'd better use the drm_sched_fault helper to make the
error and timeout handling go the same path.

This also fixes application hang when task error.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 35 ++++++++-----------------------
 drivers/gpu/drm/lima/lima_sched.h |  2 --
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index f522c5f99729..a31a90c380b6 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -255,13 +255,17 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	return task->fence;
 }
 
-static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
-					 struct lima_sched_task *task)
+static void lima_sched_timedout_job(struct drm_sched_job *job)
 {
+	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
+	struct lima_sched_task *task = to_lima_task(job);
+
+	if (!pipe->error)
+		DRM_ERROR("lima job timeout\n");
+
 	drm_sched_stop(&pipe->base, &task->base);
 
-	if (task)
-		drm_sched_increase_karma(&task->base);
+	drm_sched_increase_karma(&task->base);
 
 	pipe->task_error(pipe);
 
@@ -284,16 +288,6 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
 	drm_sched_start(&pipe->base, true);
 }
 
-static void lima_sched_timedout_job(struct drm_sched_job *job)
-{
-	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
-	struct lima_sched_task *task = to_lima_task(job);
-
-	DRM_ERROR("lima job timeout\n");
-
-	lima_sched_handle_error_task(pipe, task);
-}
-
 static void lima_sched_free_job(struct drm_sched_job *job)
 {
 	struct lima_sched_task *task = to_lima_task(job);
@@ -318,15 +312,6 @@ static const struct drm_sched_backend_ops lima_sched_ops = {
 	.free_job = lima_sched_free_job,
 };
 
-static void lima_sched_error_work(struct work_struct *work)
-{
-	struct lima_sched_pipe *pipe =
-		container_of(work, struct lima_sched_pipe, error_work);
-	struct lima_sched_task *task = pipe->current_task;
-
-	lima_sched_handle_error_task(pipe, task);
-}
-
 int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 {
 	unsigned int timeout = lima_sched_timeout_ms > 0 ?
@@ -335,8 +320,6 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	pipe->fence_context = dma_fence_context_alloc(1);
 	spin_lock_init(&pipe->fence_lock);
 
-	INIT_WORK(&pipe->error_work, lima_sched_error_work);
-
 	return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
 			      msecs_to_jiffies(timeout), name);
 }
@@ -349,7 +332,7 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
 void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
 {
 	if (pipe->error)
-		schedule_work(&pipe->error_work);
+		drm_sched_fault(&pipe->base);
 	else {
 		struct lima_sched_task *task = pipe->current_task;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 928af91c1118..1d814fecbcc0 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -68,8 +68,6 @@ struct lima_sched_pipe {
 	void (*task_fini)(struct lima_sched_pipe *pipe);
 	void (*task_error)(struct lima_sched_pipe *pipe);
 	void (*task_mmu_error)(struct lima_sched_pipe *pipe);
-
-	struct work_struct error_work;
 };
 
 int lima_sched_task_init(struct lima_sched_task *task,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
