Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD724DBBC3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621A210EAC5;
	Thu, 17 Mar 2022 00:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E9110EAC7;
 Thu, 17 Mar 2022 00:29:12 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id c11so1404451pgu.11;
 Wed, 16 Mar 2022 17:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKSIvXkqxKLFm6MnEgEDHDzqzUeFog6pmD8CweFsghI=;
 b=fK5C0D6wt92zw/V7ISzNnKi4SqjYgu4ZQdD090gSE0mlYaTHhCaEsvuPel6xmJE9OH
 QVSgyOYMF1lmGUjny0cY+z0vrS9kJoAmZvh9Xdj7mnVa9Vztg/Dk3dKUAz8NhGYC8DEn
 kmYi3JmbRN9ervwY3YqJ/KVs77YAWBWzZ4JwmLaT0c+FudlB/mIiBxzwHuIk3sYpanc9
 IRWMgSsBJQ1/qHDtkmog8Em9FGbNrYy90X5Xiu2GtnZaN0s+NDDyE+xYsTS44CDU4Abf
 nIqe+aAeIhOuZ0oaB3AwWsZWpNDsFHj+uzwo04C6A9IycBw5S/haN8LFzKnlJ/dlZsPK
 as7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKSIvXkqxKLFm6MnEgEDHDzqzUeFog6pmD8CweFsghI=;
 b=TSCTh5JVHXZxk7B2NM4Pv1qddi3gKGMQN2g4z1vnizULacXJVKSd3IER+vAThy44Yi
 8sL4n0JXZABuVwlca48H9sZxTNkDGAiPgyjfhyzIwFwn2hSLy9QwGxAhMRn002ocPX2s
 R5myZ5+hTzCoQYCYLP3MPbtboOA4CcNTl1C+sCfk9/oDHLYxLPxdZv4vXRMPRqnfz0TS
 kzVf5ViZCHf5FRiX+8a+7KfYWtIxqO6f1VaqYwPTznKv48K/EdYDd+k5Us97/zriPads
 aUXhXuxwDsnfqL7pXDi70m5xgRKB/IrS5X8xe2myqSsctDRGh3eVsNdCAMrW0rGLO8Mb
 lK9w==
X-Gm-Message-State: AOAM530Cs3wj0392Y4AGDR0lA3A7hCdl7SNteXI1dvMg8tvqkk1L1jIV
 Vg6mRJNvfiFtMTT6z19ISMYWKK9J41g=
X-Google-Smtp-Source: ABdhPJws2yciiCk0JB+zECpgQIpT79AGYFUcJramWhAX+xOChjfaW3HF+RJ5Cg/C8zb0jJ4t0EcUNA==
X-Received: by 2002:a05:6a00:c93:b0:4f7:c76:921f with SMTP id
 a19-20020a056a000c9300b004f70c76921fmr1780365pfv.73.1647476951441; 
 Wed, 16 Mar 2022 17:29:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a056a0021c700b004f7916d44bcsm4523879pfj.220.2022.03.16.17.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 17:29:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm: Split out helper to get comm/cmdline
Date: Wed, 16 Mar 2022 17:29:44 -0700
Message-Id: <20220317002950.193449-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317002950.193449-1-robdclark@gmail.com>
References: <20220317002950.193449-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Deduplicate this from fault_worker and recover_worker.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8fe4aee96aa9..4ec62b601adc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -362,6 +362,20 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 
 static void retire_submits(struct msm_gpu *gpu);
 
+static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
+{
+	struct task_struct *task;
+
+	task = get_pid_task(submit->pid, PIDTYPE_PID);
+	if (!task)
+		return;
+
+	*comm = kstrdup(task->comm, GFP_KERNEL);
+	*cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
+
+	put_task_struct(task);
+}
+
 static void recover_worker(struct kthread_work *work)
 {
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, recover_work);
@@ -378,18 +392,11 @@ static void recover_worker(struct kthread_work *work)
 
 	submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
 	if (submit) {
-		struct task_struct *task;
-
 		/* Increment the fault counts */
 		submit->queue->faults++;
 		submit->aspace->faults++;
 
-		task = get_pid_task(submit->pid, PIDTYPE_PID);
-		if (task) {
-			comm = kstrdup(task->comm, GFP_KERNEL);
-			cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
-			put_task_struct(task);
-		}
+		get_comm_cmdline(submit, &comm, &cmd);
 
 		if (comm && cmd) {
 			DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
@@ -478,14 +485,7 @@ static void fault_worker(struct kthread_work *work)
 		goto resume_smmu;
 
 	if (submit) {
-		struct task_struct *task;
-
-		task = get_pid_task(submit->pid, PIDTYPE_PID);
-		if (task) {
-			comm = kstrdup(task->comm, GFP_KERNEL);
-			cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
-			put_task_struct(task);
-		}
+		get_comm_cmdline(submit, &comm, &cmd);
 
 		/*
 		 * When we get GPU iova faults, we can get 1000s of them,
-- 
2.35.1

