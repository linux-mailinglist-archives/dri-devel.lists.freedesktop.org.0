Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5FA839FC8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0602A10F5D6;
	Wed, 24 Jan 2024 03:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE24910F5D4;
 Wed, 24 Jan 2024 03:01:14 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40eb2f392f0so17771315e9.1; 
 Tue, 23 Jan 2024 19:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065213; x=1706670013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opZYreiEG2AcFzWD38eEu/SQH9nltnXulQyDLOx9jXo=;
 b=FByo0PL15usCHPNOTtIqCCLliQgH8wKqdYO/Mj4kgVOE85wTEki0u7hQTTd/xKyIe4
 mpOSP2qtdiLzfdnzjM643UMkOdEfM1/emiBFbpRXSecKTMh5zxgmFepqd0DknBukJSFG
 otnk+xC81EaCf+c4O5WJKvSfx/sE9kWVA1/BQEC8w3viS6BfelHFAl/DI5JSrh2CjMOk
 L74BsyZKIW2pBDK9klccnNRuZlZOgfp4N9OJVdknMNgp2qqzsvuL1n6SDft+aQBo7EfO
 LCvUDUQSIjnnDc3LUy31teHmyzMT0zIneEheeiw37yysa17C/n2z5kCXUV9qLekx7qov
 VKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065213; x=1706670013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opZYreiEG2AcFzWD38eEu/SQH9nltnXulQyDLOx9jXo=;
 b=JTlEBC7G27IxOKjYR5vYBkNrUL6ccVlQHVbJ/BmEEVg15I1s6EW5o5EE9R2qQjX+9l
 2xALtAhlO4HImfomkmpjcjWiSLxeS5Rp+o4bBTdYsbTnQOiE2FkRIMkYXeV2uBkozH6G
 bOAUJ9Y8/9458BII0NrnCuN93EAiqQdPGKfXJPdm/0jFpPlLA3eKJBem9UfSkDLH7WCG
 Zt17xzuJN0gmHaEhPJGRzlxdXbKy1U+aaDFEfCDlUrvfKq5I8MqIDG4nVijzNzo1UTKN
 pLdvdhVvAvPJRxeKXyDFL5JfFxopw7WGiI6152utGmTPRGPmqFZH5hvjktUHd7UMdZYU
 5XXg==
X-Gm-Message-State: AOJu0Yw7evwo9B/BD4Imh+QfGa2SK7EmrJ+AGd10kwjFSLFKpcdf//mY
 NDeUy/jyvlA5Mavx6oXnhdzEpwLT2cfGZChR7s5VjBc/zSStH0qWdQmE2p4Nm+E=
X-Google-Smtp-Source: AGHT+IFSHthVhbNG0Qfb0DDYrPsBvJwa1h3gBSGkCx5GOfjIWDgE++7W0fC/TiEr/1O0wANexbQlPQ==
X-Received: by 2002:a05:600c:1705:b0:40e:ab2a:25a0 with SMTP id
 c5-20020a05600c170500b0040eab2a25a0mr683615wmn.181.1706065213437; 
 Tue, 23 Jan 2024 19:00:13 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:12 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/lima: handle spurious timeouts due to high irq
 latency
Date: Wed, 24 Jan 2024 03:59:44 +0100
Message-ID: <20240124025947.2110659-6-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several unexplained and unreproduced cases of rendering
timeouts with lima, for which one theory is high IRQ latency coming from
somewhere else in the system.
This kind of occurrence may cause applications to trigger unnecessary
resets of the GPU or even applications to hang if it hits an issue in
the recovery path.
Panfrost already does some special handling to account for such
"spurious timeouts", it makes sense to have this in lima too to reduce
the chance that it hit users.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index c3bf8cda8498..814428564637 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
 
+#include <linux/hardirq.h>
 #include <linux/iosys-map.h>
 #include <linux/kthread.h>
 #include <linux/slab.h>
@@ -401,9 +402,35 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
 	struct lima_sched_task *task = to_lima_task(job);
 	struct lima_device *ldev = pipe->ldev;
+	struct lima_ip *ip = pipe->processor[0];
+	int i;
+
+	/*
+	 * If the GPU managed to complete this jobs fence, the timeout is
+	 * spurious. Bail out.
+	 */
+	if (dma_fence_is_signaled(task->fence)) {
+		DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+	}
+
+	/*
+	 * Lima IRQ handler may take a long time to process an interrupt
+	 * if there is another IRQ handler hogging the processing.
+	 * In order to catch such cases and not report spurious Lima job
+	 * timeouts, synchronize the IRQ handler and re-check the fence
+	 * status.
+	 */
+	for (i = 0; i < pipe->num_processor; i++)
+		synchronize_irq(pipe->processor[i]->irq);
+
+	if (dma_fence_is_signaled(task->fence)) {
+		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+	}
 
 	if (!pipe->error)
-		DRM_ERROR("lima job timeout\n");
+		DRM_ERROR("%s job timeout\n", lima_ip_name(ip));
 
 	drm_sched_stop(&pipe->base, &task->base);
 
@@ -417,8 +444,6 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	if (pipe->bcast_mmu)
 		lima_mmu_page_fault_resume(pipe->bcast_mmu);
 	else {
-		int i;
-
 		for (i = 0; i < pipe->num_mmu; i++)
 			lima_mmu_page_fault_resume(pipe->mmu[i]);
 	}
-- 
2.43.0

