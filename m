Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75155C245C9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB8B10EAF0;
	Fri, 31 Oct 2025 10:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="YwBV/mzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D9210EAED
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:09:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-475e01db75aso13625535e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761905378; x=1762510178; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geErPXIF4l5oKM4a83yW4A9ZMeZpPoF80B9UfR8ZKv0=;
 b=YwBV/mzbCr3sZKhVHYGD6AYA049YQ0DDRRyrLoGi/6/Y4u391fR/woM50eDqwQStSy
 tmvZFu2S9hExrzZ+wo2I6u5WGWQUfbdrwBic2grS24VyqjMmvmJpPhgZWFPf70nxWMsx
 kRLX4Ab0ucBpMn1mv8/x7VrOq8A1jdkxCI+Cd62eavY1PrYk5MnGX3AfBSFLM4xnXCbu
 4DtLySuMImUYkNuky4vWHh1syQvEQOGbcFHdrua8z/ZSrfJUrgIOJUWSAbh/HtfxeUGH
 mwh0g1egbXy+x9vA54W8gEx0aHCGex8OKsYJD06TxsFy/zhxEHvT5GPRiVT1cVXE35My
 2STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905378; x=1762510178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=geErPXIF4l5oKM4a83yW4A9ZMeZpPoF80B9UfR8ZKv0=;
 b=Zlc0tBvYRJzjWD9e0VUn+NKmIIjvzYsEqvsSizhqkNrjwyYxY5LJxf8GD3bi60kSAU
 mA9fi65KPnG1XnuJ/6DMYY9QjJ9+2gGAF1m4V/1LuY/aV9ph6rZpx07g3ZEqc4lhv5Lk
 g+fVVSqIP2BOYSpxF2U7GOFZkhelDaseC/iY+KoU2WZvS7FcByDc5v4ZupXYdknFNm4H
 YIFU+38CroNKebKAdYnKZtJUhpLVFLoEWPvow6xDesD7vjlf+CZMSsTyrbicHJp32+Xb
 UnV9iQPJfnffgMIF40KK8DvXUEd5vBcbeQfhiNzBy+icy4fgYKUqm+dsAdh4RkQan52w
 YfMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFt8Q/VAlvTR7qhGkb69vg3zZHO06iRxZzpIHslRWWbGJVM9+OTyZIMRCLy3cbAXvlGJtkT0l7eRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+ZWDUWyvKspuWPP730IHB4aAkWzuJNHGT5YATl621AY9yVXQ8
 SfnDdWs/R0k2bSg2EAvOVzK903R/KxsozD60n+xDZ12SWiZCf5pO4c6qKamy1/Upg9k=
X-Gm-Gg: ASbGncsh6hj0oNwRKuz/HXn3kA8Zt+EV5NsfiT2vv2r19cCfdIAkblAv5bRNI5xHSAy
 Fki7Oe58zVBhkqgluJwL/IgCg4SaPspu9i4BRNdtzJ5zeImPmb8zrXUiCIgtC2gQyGkHTIKyDxW
 FwhrHnPf1t+5qJ3fXo9irt2VwFbrJMeip7f65YgW9Yb7LnXJ6p8Apz5dJEmRxEKXlO8JreGFUaM
 fS3rWbpVn5zVBOD2MZ+KZvmTpOq9pkt+pLNw6ui93ZybSMYmJtcfLydmVvBWDFfbv7W6iSYV578
 vpNGg/7OWkKcaPguAW/zqB7hVjazIEZT/vTy1vS0Hh8lSDdY3JzSCo0k/IKloFsovqiVmevqODF
 kQSsfeICPMV3sPp7KhbaXen7o/Qeds1CkdDODTb5uKOnraVssQfQwojUV+lxabYKLyy86UHq6kX
 D3h6gKwc7TOnX57ApkWImTjrifw5STUv0YOPQ=
X-Google-Smtp-Source: AGHT+IHeodxObcBBJn4QjePgORkM3nPGBaq2Yj+2iKThad3LaDctwhOITCPrMl3v8n0KUydBNlV4tw==
X-Received: by 2002:a05:600c:3511:b0:477:a9e:859b with SMTP id
 5b1f17b1804b1-4773089c496mr27121895e9.24.1761905377934; 
 Fri, 31 Oct 2025 03:09:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1c9esm2839171f8f.22.2025.10.31.03.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:09:37 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/3] drm/i915: replace use of system_unbound_wq with
 system_dfl_wq
Date: Fri, 31 Oct 2025 11:09:21 +0100
Message-ID: <20251031100923.85721-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031100923.85721-1-marco.crivellari@suse.com>
References: <20251031100923.85721-1-marco.crivellari@suse.com>
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
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 drivers/gpu/drm/i915/display/intel_tc.c            | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 6 +++---
 drivers/gpu/drm/i915/i915_active.c                 | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c          | 2 +-
 drivers/gpu/drm/i915/i915_vma_resource.c           | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           | 2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index da4babfd6bcb..002a7ba6f630 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -645,7 +645,7 @@ queue_async_put_domains_work(struct i915_power_domains *power_domains,
 						     power.domains);
 	drm_WARN_ON(display->drm, power_domains->async_put_wakeref);
 	power_domains->async_put_wakeref = wakeref;
-	drm_WARN_ON(display->drm, !queue_delayed_work(system_unbound_wq,
+	drm_WARN_ON(display->drm, !queue_delayed_work(system_dfl_wq,
 						      &power_domains->async_put_work,
 						      msecs_to_jiffies(delay_ms)));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index c4a5601c5107..2677e25c42f2 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1838,7 +1838,7 @@ bool intel_tc_port_link_reset(struct intel_digital_port *dig_port)
 	if (!intel_tc_port_link_needs_reset(dig_port))
 		return false;
 
-	queue_delayed_work(system_unbound_wq,
+	queue_delayed_work(system_dfl_wq,
 			   &to_tc_port(dig_port)->link_reset_work,
 			   msecs_to_jiffies(2000));
 
@@ -1919,7 +1919,7 @@ void intel_tc_port_unlock(struct intel_digital_port *dig_port)
 	struct intel_tc_port *tc = to_tc_port(dig_port);
 
 	if (!tc->link_refcount && tc->mode != TC_PORT_DISCONNECTED)
-		queue_delayed_work(system_unbound_wq, &tc->disconnect_phy_work,
+		queue_delayed_work(system_dfl_wq, &tc->disconnect_phy_work,
 				   msecs_to_jiffies(1000));
 
 	mutex_unlock(&tc->lock);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 2f6b33edb9c9..008d5909a010 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -408,7 +408,7 @@ static void __memcpy_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 
 	if (unlikely(fence->error || I915_SELFTEST_ONLY(fail_gpu_migration))) {
 		INIT_WORK(&copy_work->work, __memcpy_work);
-		queue_work(system_unbound_wq, &copy_work->work);
+		queue_work(system_dfl_wq, &copy_work->work);
 	} else {
 		init_irq_work(&copy_work->irq_work, __memcpy_irq_work);
 		irq_work_queue(&copy_work->irq_work);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 52ec4421a211..1c2764440323 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -624,7 +624,7 @@ int intel_guc_crash_process_msg(struct intel_guc *guc, u32 action)
 	else
 		guc_err(guc, "Unknown crash notification: 0x%04X\n", action);
 
-	queue_work(system_unbound_wq, &guc->dead_guc_worker);
+	queue_work(system_dfl_wq, &guc->dead_guc_worker);
 
 	return 0;
 }
@@ -646,7 +646,7 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 		guc_err(guc, "Received early exception notification!\n");
 
 	if (msg & (INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED | INTEL_GUC_RECV_MSG_EXCEPTION))
-		queue_work(system_unbound_wq, &guc->dead_guc_worker);
+		queue_work(system_dfl_wq, &guc->dead_guc_worker);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 3e7e5badcc2b..9260bdd91f80 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -31,7 +31,7 @@ static void ct_dead_ct_worker_func(struct work_struct *w);
 	do { \
 		if (!(ct)->dead_ct_reported) { \
 			(ct)->dead_ct_reason |= 1 << CT_DEAD_##reason; \
-			queue_work(system_unbound_wq, &(ct)->dead_ct_worker); \
+			queue_work(system_dfl_wq, &(ct)->dead_ct_worker); \
 		} \
 	} while (0)
 #else
@@ -1241,7 +1241,7 @@ static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *requ
 	list_add_tail(&request->link, &ct->requests.incoming);
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
-	queue_work(system_unbound_wq, &ct->requests.worker);
+	queue_work(system_dfl_wq, &ct->requests.worker);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 68f2b8d363ac..364879a4d1d8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3385,7 +3385,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	} else if (!intel_context_is_closed(ce) && !guc_id_pressure(guc, ce) &&
 		   delay) {
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
-		mod_delayed_work(system_unbound_wq,
+		mod_delayed_work(system_dfl_wq,
 				 &ce->guc_state.sched_disable_delay_work,
 				 msecs_to_jiffies(delay));
 	} else {
@@ -3611,7 +3611,7 @@ static void guc_context_destroy(struct kref *kref)
 	 * take the GT PM for the first time which isn't allowed from an atomic
 	 * context.
 	 */
-	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
+	queue_work(system_dfl_wq, &guc->submission_state.destroyed_worker);
 }
 
 static int guc_context_alloc(struct intel_context *ce)
@@ -5382,7 +5382,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	 * A GT reset flushes this worker queue (G2H handler) so we must use
 	 * another worker to trigger a GT reset.
 	 */
-	queue_work(system_unbound_wq, &guc->submission_state.reset_fail_worker);
+	queue_work(system_dfl_wq, &guc->submission_state.reset_fail_worker);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 6b0c1162505a..582e5099e980 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -193,7 +193,7 @@ active_retire(struct i915_active *ref)
 		return;
 
 	if (ref->flags & I915_ACTIVE_RETIRE_SLEEPS) {
-		queue_work(system_unbound_wq, &ref->work);
+		queue_work(system_dfl_wq, &ref->work);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index d2e56b387993..366418108f78 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -38,7 +38,7 @@ fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 			if (test_bit(DMA_FENCE_WORK_IMM, &f->dma.flags))
 				fence_work(&f->work);
 			else
-				queue_work(system_unbound_wq, &f->work);
+				queue_work(system_dfl_wq, &f->work);
 		} else {
 			fence_complete(f);
 		}
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
index 53d619ef0c3d..a8f2112ce81f 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.c
+++ b/drivers/gpu/drm/i915/i915_vma_resource.c
@@ -202,7 +202,7 @@ i915_vma_resource_fence_notify(struct i915_sw_fence *fence,
 			i915_vma_resource_unbind_work(&vma_res->work);
 		} else {
 			INIT_WORK(&vma_res->work, i915_vma_resource_unbind_work);
-			queue_work(system_unbound_wq, &vma_res->work);
+			queue_work(system_dfl_wq, &vma_res->work);
 		}
 		break;
 	case FENCE_FREE:
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 27d545c4e6a5..b188c4deafb3 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -276,7 +276,7 @@ static void pxp_queue_termination(struct intel_pxp *pxp)
 	spin_lock_irq(gt->irq_lock);
 	intel_pxp_mark_termination_in_progress(pxp);
 	pxp->session_events |= PXP_TERMINATION_REQUEST;
-	queue_work(system_unbound_wq, &pxp->session_work);
+	queue_work(system_dfl_wq, &pxp->session_work);
 	spin_unlock_irq(gt->irq_lock);
 }
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index d81750b9bdda..735325e828bc 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -48,7 +48,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 		pxp->session_events |= PXP_TERMINATION_COMPLETE | PXP_EVENT_TYPE_IRQ;
 
 	if (pxp->session_events)
-		queue_work(system_unbound_wq, &pxp->session_work);
+		queue_work(system_dfl_wq, &pxp->session_work);
 }
 
 static inline void __pxp_set_interrupts(struct intel_gt *gt, u32 interrupts)
-- 
2.51.0

