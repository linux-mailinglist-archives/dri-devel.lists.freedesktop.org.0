Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC85C0A088
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 00:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DBE10E0CD;
	Sat, 25 Oct 2025 22:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="VBG59XiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415610EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:52:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4298a028de6so1153399f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761299538; x=1761904338; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dL6t4wl66/AcShNCdZ7n7LoevEBAIZyasNbsi4B8v3s=;
 b=VBG59XiKoQkM0rSPp39V30GGDpkzuWYn1Cy3sE9HafcZcSehX6tioJ7hafD62d74oA
 QplnJ1Tj10R4IlKB5+qGKRNrnvkUHYPazTI+ruHgNJ4GpqhUNnKU0R5e6kTJpU/3SXAs
 w7AUPoATiyS17iFOofGgktn1UVxwRsOZoXlb1szHV7qmO+ZXO+Xm9mkElatpA/er8a4f
 pCRTCQ2bcc6GiHwRFMHeMpuWYTn4QNDC6qpoKeYwXcYqI+dvHNkPnRh1sPiey9kdBRIf
 J7JiCdLf6WPC9OoAjjhI4afi1bmxdRZMD/1MsLKgUl4qFzC0znd6+8mCbMvW31UXyPDQ
 C+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761299538; x=1761904338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dL6t4wl66/AcShNCdZ7n7LoevEBAIZyasNbsi4B8v3s=;
 b=tEnC5BwaXxpLvYkIwHJWfZrWJl5P60L4PhdygcTpRoblgtqpWKZRZFS1HWZVC2S+xM
 vdFx1xS8yKPjPP8KX10OYFaDBr1/9/0vFfAvxnUkpvzU2kMSixs7mIbtdzR3Dtwx+Eu+
 VgWNl03rNlzAAa8WqpU5GD4uz6RrQnRgqsmZGR2ErhtqGkh8f/z3EBX7s4N6KCrWH9Jn
 uGgJBch3NtH3J/k+Tnxvz+ox9wntWrCHoALlm7Q2GER/ptkbIAI+Gu/Rqn7HNVONBrhe
 Pxd5bDZn5odzBdAjkI0mGbApt4F+A3kUkIjeQ6scjJMp53e/XnLL8FFO8Zpx3NXuMKDe
 g6KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzUrHnyBYxjdu8SvIm4mgdGDT0AKdOESrCvPFJMFcZ7c0ckDLPiI4cACJ59iaq9r7zgyGgDxixlg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQG3T+D0V88pE60QojnqkxhsPOafGWQlFxCze/5tV56K3JFFUX
 Miz24qubUyR8+WXpXGgWzx57ASYZpVCQCuuhz/4AwSOEqnmYmoU+9PgKq0BdUd8UvCM=
X-Gm-Gg: ASbGnctCAJH1797JLgmu9Pr2YOe62XCBqnjsdwzrwCgr2zEklaw4/npb8AOZQexS+wp
 6gUsjNERlqpL/yNIKx0xnzd3+2AuW52m8B1HzJgiGK/rNnLgkJ1EYgrAR4f4ZXG26a+dp4KtuDL
 hKzLk8XIP7SDdDHfaRkkw+wRgNqLMsnWeVhttdzDRo05KhYciX6QqmXOed5lFHfJo4OBikQrzHS
 Q3BSjvViCVA6GBFBtAT5N4Y/j782LRpHPDdJbytl9cnkS8zcTQSSi8ev6yrRYQXWEMwXoFs4nmS
 KtuQj0pbtqru8dFT1Q+hXHu/RWjwvAzhJDFrV7Lk0YCtDpFK4Zge6Fea9gv+e+UxbtiCFo+HC9j
 2s4vkaaz5GiEXFYeEhSsbs+Ngd5BrCOaZLs3QiTongsChXyHqshWddkcnYK+xwZM16B294My5XJ
 aVME/ktnmLFFJsPjVAp42/U/90
X-Google-Smtp-Source: AGHT+IFQ9F5xlltb7vARep/Fm2WMuyxTknf+tJucO4GujtQcq6ALeTqrvlnlEwRyCUiBHpuH8ccDvw==
X-Received: by 2002:a05:6000:2dc6:b0:3df:9ba8:21a3 with SMTP id
 ffacd0b85a97d-4298f563076mr1617789f8f.18.1761299538086; 
 Fri, 24 Oct 2025 02:52:18 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57b7sm8402376f8f.16.2025.10.24.02.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:52:17 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 2/2] accel/ivpu: replace use of system_wq with system_percpu_wq
Date: Fri, 24 Oct 2025 11:52:05 +0200
Message-ID: <20251024095205.123123-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024095205.123123-1-marco.crivellari@suse.com>
References: <20251024095205.123123-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 25 Oct 2025 22:07:05 +0000
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

This lack of consistentcy cannot be addressed without refactoring the API.

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c | 2 +-
 drivers/accel/ivpu/ivpu_ipc.c     | 2 +-
 drivers/accel/ivpu/ivpu_job.c     | 2 +-
 drivers/accel/ivpu/ivpu_mmu.c     | 2 +-
 drivers/accel/ivpu/ivpu_pm.c      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index afdb3b2aa72a..27a345f3befe 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -673,7 +673,7 @@ bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq)
 
 	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, SURV_ERR, status)) {
 		ivpu_dbg(vdev, IRQ, "Survivability IRQ\n");
-		queue_work(system_wq, &vdev->irq_dct_work);
+		queue_work(system_percpu_wq, &vdev->irq_dct_work);
 	}
 
 	if (REG_TEST_FLD(VPU_HW_BTRS_LNL_INTERRUPT_STAT, FREQ_CHANGE, status)) {
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 5f00809d448a..1f13bf95b2b3 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -459,7 +459,7 @@ void ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 		}
 	}
 
-	queue_work(system_wq, &vdev->irq_ipc_work);
+	queue_work(system_percpu_wq, &vdev->irq_ipc_work);
 }
 
 void ivpu_ipc_irq_work_fn(struct work_struct *work)
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 060f1fc031d3..7a1f78b84b09 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -574,7 +574,7 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 		 * status and ensure both are handled in the same way
 		 */
 		job->file_priv->has_mmu_faults = true;
-		queue_work(system_wq, &vdev->context_abort_work);
+		queue_work(system_percpu_wq, &vdev->context_abort_work);
 		return 0;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 5ea010568faa..e1baf6b64935 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -970,7 +970,7 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 		}
 	}
 
-	queue_work(system_wq, &vdev->context_abort_work);
+	queue_work(system_percpu_wq, &vdev->context_abort_work);
 }
 
 void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index ffa2ba7cafe2..0cff8f808429 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -226,7 +226,7 @@ void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
 	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
 
 	/* No-op if already queued */
-	queue_delayed_work(system_wq, &vdev->pm->job_timeout_work, msecs_to_jiffies(timeout_ms));
+	queue_delayed_work(system_percpu_wq, &vdev->pm->job_timeout_work, msecs_to_jiffies(timeout_ms));
 }
 
 void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev)
-- 
2.51.0

