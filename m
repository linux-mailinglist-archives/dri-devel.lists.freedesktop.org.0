Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF31B281E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9BF6E968;
	Tue, 21 Apr 2020 13:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73AE6E968;
 Tue, 21 Apr 2020 13:37:36 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id r14so6611206pfg.2;
 Tue, 21 Apr 2020 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lsQwOx5F/yu8+yr8Rd+a/KS/hBbRD/lrzAH/QpIb0zA=;
 b=rY4jhHeQYFLJXRotZ50VZQcgiMfy7emGgJux7mCcmkrtrkNKhwqWDU9TXED8PI+cds
 wQWoIo5BVH1/Z4XUbIi0plsBo8Gmg1mlgM0dVlKIHgu6kngqVHhiZ2ZNrOlZmsIAmE4a
 Y8wbnL6H+alcG+oJBtR33I9QEGqYf2asw5/K8DDgitFjji+llb+BXOreDfeAYeQVV+ir
 h4TM173ehv1G+0UkjR4sIfrKvmETEroXgaGnSDIQDgvi1IK4SOSDSE/kfxXwQlhXEhaa
 Y4+7t9YdfvkDJIR9b9WESWKopbhY5FRktpEIX0orRJS/93HFVD6lTxgB0m6mLEW4Wr59
 GM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lsQwOx5F/yu8+yr8Rd+a/KS/hBbRD/lrzAH/QpIb0zA=;
 b=KRomjT8v9L36fpJErl+0LsQUG8ZBnoPrUpQZWup7Wkgtddu5/jwGQipzdapQ40kbQS
 wVG6C/nTKie+UHY2euDhUE3Uyrlb2YW5FEIimlkxSPlTsvcveDtQ90u511E4nPyisqhk
 SAJuAS1JYu0UNTZKwhSgq550PfDYkPc8wVCgaZcf0r+Fe573x4NoILEF/KZGuS6/bA8i
 Pvsn0QYlfeoMB9+OJr3PFrWZYCv2Y0tQJ5b4Kkd2IJ1nSZPH8Ui/Brq96debBXzrTYqp
 Ggb4HZg/DCOYWZkb0JcrLf/wO5FIvOpmnJs+VGhywfOoxX3S7LwAfcueswZ0suZvI+m6
 4N4A==
X-Gm-Message-State: AGi0PuZGkAUVCwOthF9M+t3O3DKnBego1UyMeCPLklxtd0OjWA33e4QT
 ekZEEePyseaNOWWXKqTq6bMRW1hIXaGzfg==
X-Google-Smtp-Source: APiQypK1eAZSlaYTIar6CSUyG7sSP5YyOgT9vk5hQqlk9z6PcCn9jqo22hCn745kyX9MuxKPI3w0Wg==
X-Received: by 2002:a63:dd0a:: with SMTP id t10mr20929080pgg.50.1587476256051; 
 Tue, 21 Apr 2020 06:37:36 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:35 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/10] drm/lima: always set page directory when switch vm
Date: Tue, 21 Apr 2020 21:35:45 +0800
Message-Id: <20200421133551.31481-5-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to flush TLB anyway before every task start, and the
page directory will be set to empty vm after suspend/resume,
so always set it to the task vm even no ctx switch happens.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_mmu.c   |  3 +--
 drivers/gpu/drm/lima/lima_sched.c | 14 ++++----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_mmu.c b/drivers/gpu/drm/lima/lima_mmu.c
index f79d2af427e7..c26b751b0f9d 100644
--- a/drivers/gpu/drm/lima/lima_mmu.c
+++ b/drivers/gpu/drm/lima/lima_mmu.c
@@ -113,8 +113,7 @@ void lima_mmu_switch_vm(struct lima_ip *ip, struct lima_vm *vm)
 			      LIMA_MMU_STATUS, v,
 			      v & LIMA_MMU_STATUS_STALL_ACTIVE);
 
-	if (vm)
-		mmu_write(LIMA_MMU_DTE_ADDR, vm->pd.dma);
+	mmu_write(LIMA_MMU_DTE_ADDR, vm->pd.dma);
 
 	/* flush the TLB */
 	mmu_write(LIMA_MMU_COMMAND, LIMA_MMU_COMMAND_ZAP_CACHE);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 3ac5797e31fc..eb46db0717cd 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -200,7 +200,6 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
 	struct lima_fence *fence;
 	struct dma_fence *ret;
-	struct lima_vm *vm = NULL, *last_vm = NULL;
 	int i;
 
 	/* after GPU reset */
@@ -239,21 +238,16 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 	for (i = 0; i < pipe->num_l2_cache; i++)
 		lima_l2_cache_flush(pipe->l2_cache[i]);
 
-	if (task->vm != pipe->current_vm) {
-		vm = lima_vm_get(task->vm);
-		last_vm = pipe->current_vm;
-		pipe->current_vm = task->vm;
-	}
+	lima_vm_put(pipe->current_vm);
+	pipe->current_vm = lima_vm_get(task->vm);
 
 	if (pipe->bcast_mmu)
-		lima_mmu_switch_vm(pipe->bcast_mmu, vm);
+		lima_mmu_switch_vm(pipe->bcast_mmu, pipe->current_vm);
 	else {
 		for (i = 0; i < pipe->num_mmu; i++)
-			lima_mmu_switch_vm(pipe->mmu[i], vm);
+			lima_mmu_switch_vm(pipe->mmu[i], pipe->current_vm);
 	}
 
-	lima_vm_put(last_vm);
-
 	trace_lima_task_run(task);
 
 	pipe->error = false;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
