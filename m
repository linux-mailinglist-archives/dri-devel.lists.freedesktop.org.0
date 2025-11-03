Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406EC2D590
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261FB10E44F;
	Mon,  3 Nov 2025 17:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="aVwcBHhz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9098610E44A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:06:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4771b03267bso31238825e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762189577; x=1762794377; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0GOfKt62NngZqZbp/cL7xKq9Fj6qCjeL7NUgIdEHh5M=;
 b=aVwcBHhzOcWU8wMY6tCFFIYxmsAwPUvqKlbzzU0dTwHyU5HtONhkyjoLgjO8zhZFC0
 24ULTbeAVde164KHEd3K6qauM/+yMwzLQT4o6tCgkGtePFmeYCXKSrWZ09C4deV5s4Go
 IZicZgtgQc4U7JdIpQcs3GYaid7pSdgYntuzUZ07cRGkN5hr1/e47HfFFyAcoU7IRGi8
 Kbl1UHEv4WfETX7rO38q/QINbHm0yGGVhBU+tpNEF+JxO+I+nxYgW4StMkMnFuk29WLg
 Fk4vXU1juRIDKC8BEacxwnRUpt6F/P4SHETeis0cDJnGWbd1kF1JaK/W7382FqCGyl92
 3IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762189577; x=1762794377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0GOfKt62NngZqZbp/cL7xKq9Fj6qCjeL7NUgIdEHh5M=;
 b=tA/xyIQVg4PFReM0bGNVU6OSBqFR6fYOdeU3rPz7LvyJ35+U7FOWLgclUL53hTpc7m
 8/dB47znZqjAYmrqSycEq0o7XYxX1PW4RJpd4yymTrv3vJARdkP/Pz8TrB1Lpd0i5fI0
 jMJwPSEaJ7TK6Dssdhmm6y9U4lKETq3ZtjhB8WWQVvqbRl8sbP7pWZUdKjztEKTDOyBz
 m0VtrDAiMk99mGso+CT1mfH52vfWpXrbB0wC633upOioOXbtmAyf0NOHcKmg4JZtWgL6
 TGqd96ivase28aT29aDEAPrGS07Z/eQz4pGNuxt0sgG8ms2v1qqOqHcG3mJmGQo/o6Z3
 BvYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWabgSwmPDURhJXAm5pI0ZRNbEOMG0HB8mVCs0AoKEPqiKoBE4XKD5JmueFWxbB8nsenHqDSnro7BM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuTjRsfIW6s7CYhsfxii87Wo6N2NJfjzBmZnU2UhuImnx+OxEC
 M4qRGZveCNQ4mR0jzER4wDpU3tJ8MCylWE9q4l7UcPcFtJaoBumTTT24zfaqscvqy9w=
X-Gm-Gg: ASbGncvdJK9UTGTjK7l3Hh2yNHeXD+CKTJFdcQlWOJnXt65+PS44lD4lT1VlEBGu0ZE
 1z20XgTyWEpi25xepKBgTP0UWKsp0IgHVweBuj6QOAlW/rpjfy2HseVU89byfaDVNLBf40/Tuuc
 3DIqlmSBvikJvEPpcc67Mm1p6Esz/QHYeWtZDIrvO0p1VQLhTc3HszzP47QIhAjjiYr8adT+Kiy
 4jDyz5FlZqiRpTBc3DiFDqdvOlgp+SWhTHvxqVyyVlgR2OMP73g/eFDQUFJVIerMrMv0xnXcEIi
 vrztYo4gH2Qluwb/WmF4cyaPW8rwc0K5bWQvJycFPFyk5U9mdXG76Pl36N+ui4xJ3HGX7T0kQ+o
 nloSFBhqmf15R3mT5mzzlav3WRrhNNZSccmMDufcBotfMiwhvah1+P9JEaTjpcknp5CMKZ90n8o
 oYb1i25QybqZ5mw+nP9dEPYJhg84DaHvH40cpNVcg9KS0C0Q==
X-Google-Smtp-Source: AGHT+IHS8Qrqk4wb0RBUS4KE1K98X0engVur3nZE1XsUogokU8LVC28F9cBYglCJbJ9kw5feZmAX1g==
X-Received: by 2002:a05:600d:8399:b0:477:1709:1f2f with SMTP id
 5b1f17b1804b1-477328727d7mr77486185e9.5.1762189577025; 
 Mon, 03 Nov 2025 09:06:17 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fc524ddsm89799895e9.7.2025.11.03.09.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 09:06:16 -0800 (PST)
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
Subject: [PATCH v2 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Date: Mon,  3 Nov 2025 18:06:03 +0100
Message-ID: <20251103170604.310895-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103170604.310895-1-marco.crivellari@suse.com>
References: <20251103170604.310895-1-marco.crivellari@suse.com>
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

The above change to the Workqueue API has been introduced by:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

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
index 63c65e3d207b..d3a0e0231cd1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1064,7 +1064,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1823,7 +1823,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(system_dfl_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.51.1

