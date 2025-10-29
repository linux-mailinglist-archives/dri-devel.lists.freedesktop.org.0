Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF24C1F112
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAF210E918;
	Thu, 30 Oct 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="H3JKlJbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C1B10E201
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:56:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-475dbb524e4so358035e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761757017; x=1762361817; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3fwimJIAawa0pjVoXec35/1jofr54T3nJPQIURfOc0=;
 b=H3JKlJbWRk62G0RBwGkBb3LnGvPCKvdLeb/HXzU6y5inr90i6iNqipPgj+MzcjUmoK
 hDoobBfFvgjR0zy90HKZ3lZYNoedPHhWLEytt1ohyEo2IlSinHNeVH7KQrTwrLP309qA
 WuD3CSAzPJFqTyB9vTg7C7WX0DZZQilL+Fa7a539TVBRfYUnrp9keOQZzGm2w022Vud6
 xFCw9/eOho9NFa7zYEPOuWp6FXzINLgq8TcT0mDyMUXv2tb1Yz8nfD6tKSe5qJuDLJiY
 6MSuoV7hM2k445RxUm4mhfQWKzEHuQFpUDLH87NOXjwtii/8nseGiO0yOhd5n2rbnyUN
 UDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761757017; x=1762361817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3fwimJIAawa0pjVoXec35/1jofr54T3nJPQIURfOc0=;
 b=OKgQ2LiaQ+y8uMAiBj8YeJlRjedFSQ9EFl+8TQxCSu4QgMmru0vtzJwpcNjiXgjPYG
 XYtpEj/KMmU77MbyfcHQwghXXaIGU/NutxiUYY+6ekAuGOInS3PuC1RbaOJNrmnguJTf
 ITNDyvG8vd4Bx13dMekGqawXxp6iDpkbsCS8cBEGsL8q14sXUs5cC9k3fWxownUkAlr5
 vY9Xl2RasFevvod35ltpqUr8ubOnzWB44ZREMmbdoDECZo6rj6hrbX+ZwbnsSb6x61by
 zCVVRYVswNXHmnSkilYn6vlRwDy5hLT/cfaXxBvOvl7j/hY7rsaReOKEe6BH/kgP3YxA
 BMrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzTJUnHxu9Bv7QmYs7VrV9FxAi2FkiZrguAxJZ4111htaaQ1+JJx1Tb1jRV/entxg3XUFCYBlWK3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx01AmRp4NXx49FLy/4NZlcONbzVSwuJzZn8xc75DsUQKoi2xgg
 uLwgleBOogNbjbXMLpmTUL0n93p8ItZVFmUgTaz1Pl4y5P+KGSVD70yn5e/Fw8Xh9j8=
X-Gm-Gg: ASbGncv2gpEIcY3garSux0y0XAMXCdx/2+R1B6nA4E7cTFEiF18elO/fZScio4FyXDG
 gTtrG4g5dPsSVv33nn+g6AeCZCXpdcroODVIcSkmTAnwpPd1gB09znFcM8Nz36CZ0edcIzlqReM
 6G0KJWYi8x2Sv0ap6sZOibR6Q+R0Ssm4YBGb3ZrUuqlkW2k2VHAXGqtk8TJXo4+AKlgvTI9eNjT
 dVBppRK/UA1cen6sZM9y+187abMyM0te7atmTINeeKl3RSSYmsjHHsEIxSumUtXjhw4Lc+xgkF6
 b8a8dw0FtUJH7uuf3/ekgrX+F2gjOmXzw3zS+IPXKavC/Q69bLTeKkFMEQF20J/QSZeH2mZWi3b
 GXifMKH0kViM3F+267nDVx4gbNd7qCAJjaXD0Li9c/4K1IjGpn+Jm2c/qtudfC11Hq78PP+Q4b5
 fbZbEQ89I0riL5MDQ=
X-Google-Smtp-Source: AGHT+IGlBdH3KaL6DIZZtMv4E8cuqpaFJbIPOQcIbg0DFvQj0ChGVMMLIYHLgSHaNIaXDylAVv6IJA==
X-Received: by 2002:a05:600c:190e:b0:471:1337:7220 with SMTP id
 5b1f17b1804b1-4771e165a18mr34957175e9.3.1761757016715; 
 Wed, 29 Oct 2025 09:56:56 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718fc0335sm48393845e9.2.2025.10.29.09.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 09:56:56 -0700 (PDT)
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
Subject: [PATCH v2 2/2] accel/ivpu: replace use of system_wq with
 system_percpu_wq
Date: Wed, 29 Oct 2025 17:56:42 +0100
Message-ID: <20251029165642.364488-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029165642.364488-1-marco.crivellari@suse.com>
References: <20251029165642.364488-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:47 +0000
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
 drivers/accel/ivpu/ivpu_pm.c      | 3 ++-
 5 files changed, 6 insertions(+), 5 deletions(-)

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
index ffa2ba7cafe2..9ecba05ce7db 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -226,7 +226,8 @@ void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
 	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
 
 	/* No-op if already queued */
-	queue_delayed_work(system_wq, &vdev->pm->job_timeout_work, msecs_to_jiffies(timeout_ms));
+	queue_delayed_work(system_percpu_wq, &vdev->pm->job_timeout_work,
+			   msecs_to_jiffies(timeout_ms));
 }
 
 void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev)
-- 
2.51.0

