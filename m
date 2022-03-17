Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE70B4DCBBC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF8010E045;
	Thu, 17 Mar 2022 16:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FD210E040;
 Thu, 17 Mar 2022 16:51:16 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id a5so7318993pfv.2;
 Thu, 17 Mar 2022 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKSIvXkqxKLFm6MnEgEDHDzqzUeFog6pmD8CweFsghI=;
 b=bUGk2Wp+U7vNMRDQf8jdXaKMmj/UyBkl6QWCzCJeio9r9gAN+TQGqAVsWKT/hb0awj
 rPgPl1CbtTcSQJUk1xm2/RaUqJhFJj1TgduuN+wp4/PpmRWYouaJZSvyZGUxvivjVecf
 hZcjtHDt8QRRLK7gs/9tgMz41L9vCTOHw75Bo2ptMcdzUD0WiSJWVFWcKQtveTG3o9QT
 hM46O9AT68fo/Y5AlvlaKYNP5+q4xk/uqZBMDtMJ/fbbEXHFmHx/IMKq4WHUbumvMurm
 jxbO/lVPfDT7DKtSBeYENQAghy5PT5d8ygaVSo3/Mq7xQul2lHKdZAPOwGDjUhXNNqBT
 hkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKSIvXkqxKLFm6MnEgEDHDzqzUeFog6pmD8CweFsghI=;
 b=7YFVLCIZRC6PUuCKhoNPQRn20jqTjTzb/sGFysmXelmbPD6aaa/1QE/CZrd+xdn2ki
 /BF+YPNxJ3PAA0QK7Q7YZhW6bzF1TXsYM42KN9I8R8ciiBlMrxm7Of10HkT/6zVlzwLd
 Eyg/PkF+y59KmCzHTtKhjBxL3EX93VwznY7qWV8ay7H/K2Un0jk4HDetEDfXFSX1vfhN
 A9xyJ+zQPfSXqKpR99opARO9/jDIdf6wt/CmSl7xjLNN1vRcJstP8tJeAezntMlcY7Hn
 xPz1J1Jg96D5T+FZy9aISQXueJ8Xc3p37D2vJrlEqg7MSseo4S22ySOTu/RLvsQ+Kp55
 eRuQ==
X-Gm-Message-State: AOAM533WYllzYsojaFtVc7QLUx+Jc7XPYXsvXU+dopTtxjplNKVMnVFr
 xNTbRG+Nq7o7RRarDUCUa8q1fUt88gE=
X-Google-Smtp-Source: ABdhPJxSo7vijSrAXyA9Xt6LaQJ3VguWil2NyOTQvpUudA2xCjPQHwFiQKBx4wdZad9KFOfWTZnJLA==
X-Received: by 2002:a63:f00e:0:b0:373:9fdb:ce03 with SMTP id
 k14-20020a63f00e000000b003739fdbce03mr4476237pgh.518.1647535875515; 
 Thu, 17 Mar 2022 09:51:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 t71-20020a63784a000000b00380a9f7367asm6048611pgc.77.2022.03.17.09.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:51:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm: Split out helper to get comm/cmdline
Date: Thu, 17 Mar 2022 09:51:39 -0700
Message-Id: <20220317165144.222101-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317165144.222101-1-robdclark@gmail.com>
References: <20220317165144.222101-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
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

