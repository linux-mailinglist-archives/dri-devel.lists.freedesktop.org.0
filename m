Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF8C24A94
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 12:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B4310EB35;
	Fri, 31 Oct 2025 11:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KYdLJHoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABF710EB35
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:59:55 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so1277616f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761908394; x=1762513194; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=meReBaQ99dOF1c+7jSgsU4KTZxApPi6bDuZ+XPUjUx4=;
 b=KYdLJHoJh3ktdgT9emDn5nWorwevNpOC4vOtduHizzb9D72/MlBw6PoJwFoIw4iSoG
 77/t7MxZJUml+I6GY7dyZc4ACS2wYhmkxOQVp3+N+9duLn6rOdbOx2UfzSUKMTOlrMUV
 OJr2mC7KvAeeRM1GOTsrBFMzZXXl73FTTOxqzPENOIXsxpr5awDTD3v98YcUBMNTOd5H
 bpSPfkXztZFazVnuH8WTQzZbeaPE+0x0isBhM9A3rnFe4JOwe9r4sK+yvBJvDrIP+t22
 OmIWNew5BBZwC3lLdCDLx3m4fy+6yOApTEZWH14xPFJiD8ucNJveboSuI+jG2FXhMpkX
 zw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761908394; x=1762513194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meReBaQ99dOF1c+7jSgsU4KTZxApPi6bDuZ+XPUjUx4=;
 b=JGVK/4bQt+X99aT4iUJc6AoCREhYgo6Cu08oo5y+VlCa1PpKqCUSEVMSyulOCw0THL
 TR/OMhXjNWq8imQOOb8ZCaHGv19/nEX9c+Z4y4XlxaoT2J1xZ9lT+JpMpfQmehnrcuW2
 IP8hbzeEFyVSuMgE39BlP3m4Qd9T+hyat4Q2u5YGmmY1rBX5dpCjvQLbWkTPJEt+SKcV
 TyrpHgLMv03PolXibpVYS5uGPZaQzeEEcoy8h2vcJN14nyriAkzzTdUaELkZSeqDx2Bc
 LDljmgYxD54VFQAwdwZpAcI9kC7ZBG22kBWg7YU3nd4OIiEVAXvmDk165ph9RgWU8Qha
 jirw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnFj9CXlEhK/mfowhwLI5Zl3h5cIyT2sf61cVMZW0CFTjfbIamZCudCgRDKdKnU6oqCpUyQ4GD2Fs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVx0xvXwnr/lfTl83RCjlIzyEy/qnuDe3K59y13nAcJY2LTTp1
 Lty5tWWxbCFMWjq4hIQw5HV/CWDBl5NzPJ/kxrl8DZcmyNsFKand9tW0o9wBwNBkwlM=
X-Gm-Gg: ASbGncsC5iEBCb/XsnXQsty/kZ8LZPXNBpF3HKr482Vcgid4jf4bmkQtftzeIEvqzYL
 dHJdOmP/rXCt4bjzf/Rl2xVkmzlfqtOLcVEjnK6eekAMMDk4+HCIoFqQBA3aUz9riThIkVSvmVO
 LZ6zhLI17j+Yea7emE8Ede2kdUFd9I1UMnXgTu11xA4S/9zYTK1duNo5eqfMWshFWK6WLSyXtjg
 Tc36P3OoWml3Fb+6bwoM/Ou17+HpD/d1PBY7HqwRw+pn0Fpo9mTizsiemM+0g3KCjNrN3vwGMGh
 QIbCy2UNRHg+Ewpyi9fylEKkrrUh/c6pwFZ0uDIDdclb76TxuPLms/uSSgBZdYV3kvOXbwT72Gq
 Fv6cJkVRwhaPkMdd6JK4LVb6gt/Df8jowNbvs10YHeCsyTKsOo2esqRzxCUea9GRiYkcLv2UiDy
 +c0AnggefbT+lH/1yF9zciN4WQ
X-Google-Smtp-Source: AGHT+IFdGTxG3bZ9hI1ZvBKqkA/ZCyuorhXgGNfQCxf182NXCKhTyNIAS3xqjvn2tp4aiso7n8hemw==
X-Received: by 2002:a05:6000:40ca:b0:426:d820:a3f9 with SMTP id
 ffacd0b85a97d-429bd5eea69mr2252061f8f.0.1761908393997; 
 Fri, 31 Oct 2025 03:59:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110035esm2965528f8f.6.2025.10.31.03.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:59:53 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Date: Fri, 31 Oct 2025 11:59:38 +0100
Message-ID: <20251031105939.129200-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031105939.129200-1-marco.crivellari@suse.com>
References: <20251031105939.129200-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 2 +-
 drivers/gpu/drm/xe/xe_execlist.c    | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      | 4 ++--
 drivers/gpu/drm/xe/xe_oa.c          | 2 +-
 drivers/gpu/drm/xe/xe_vm.c          | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 203e3038cc81..806335487021 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -362,7 +362,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	xe_engine_snapshot_capture_for_queue(q);
 
-	queue_work(system_unbound_wq, &ss->work);
+	queue_work(system_dfl_wq, &ss->work);
 
 	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f83d421ac9d3..99010709f0d2 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -422,7 +422,7 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
-	queue_work(system_unbound_wq, &q->execlist->destroy_async);
+	queue_work(system_dfl_wq, &q->execlist->destroy_async);
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 18f6327bf552..bc2ec3603e7b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -543,7 +543,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	spin_lock_irq(&ct->dead.lock);
 	if (ct->dead.reason) {
 		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
-		queue_work(system_unbound_wq, &ct->dead.worker);
+		queue_work(system_dfl_wq, &ct->dead.worker);
 	}
 	spin_unlock_irq(&ct->dead.lock);
 #endif
@@ -2186,7 +2186,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
 	spin_unlock_irqrestore(&ct->dead.lock, flags);
 
-	queue_work(system_unbound_wq, &(ct)->dead.worker);
+	queue_work(system_dfl_wq, &(ct)->dead.worker);
 }
 
 static void ct_dead_print(struct xe_dead_ct *dead)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a4894eb0d7f3..4e362cd43d51 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -967,7 +967,7 @@ static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
 
 	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
-	queue_delayed_work(system_unbound_wq, &ofence->work,
+	queue_delayed_work(system_dfl_wq, &ofence->work,
 			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
 	dma_fence_put(fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 027e6ce648c5..94827ca4b7dc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1073,7 +1073,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1832,7 +1832,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(system_dfl_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.51.0

