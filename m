Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF282FF2F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EBB10E612;
	Wed, 17 Jan 2024 03:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462F10E60C;
 Wed, 17 Jan 2024 03:13:24 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so131424131fa.0; 
 Tue, 16 Jan 2024 19:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705461143; x=1706065943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wbzi3EnFlPT7VHx8X0cPGf7wGavBuju6JI8nYElqQU=;
 b=UUYFuQl1cb9nn4bmVa0QlBbh8NBl7Ms/MEG4WzH9TsvWY/l6nQUbyOud+LyiGQCss1
 +5uVsHllTtAUu1AjEXxuGVchr9IbPOWFv0YjM1YYL2GLmHOeVhfu59Erz+mJnLzonLbb
 XtA+NsCZTawZiPAi1XupcS5uzhHHmumXuyGytCKklFj6zvAF4+vLKf/EotlN3QpAbLdH
 J5gryyBPEdhfC0att8+Bh0q9sjCO6rXOKBgQwcEmHje4NEs1Ddns98SdY7/yDBRGTO/h
 TF8uXO4VtTc9eIxOWMKogTmXbdSJZaiHncL2kcoHxxa8TVo8s1LLS1dyQ8ISlx6KOFVH
 blTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461143; x=1706065943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wbzi3EnFlPT7VHx8X0cPGf7wGavBuju6JI8nYElqQU=;
 b=Ea/a7iiEOEuRtgq5osAIoIe74u02ssWhmXnR+avQYYYrp9GddOTzs3lTabrZnDRW9t
 o42hVlnCR7Qe5n8X7tVNMtQHhvk4aMU24oL8sk0bLVaCFIqErBJnBOKsxr/QMgYkvroy
 wDjhNi3hHfjpoir4VIspm1jgyDH24W7YY1yEEw23/xZugggw363TwtncHoZhiKKK/Qti
 08EaI3Uog1MLBS4p0VaZm3pVwrB0tEnq8BEz6bJFytKyFbakdLZ95+R+sWndpZd44SKa
 JwTtEoNZsOfRlNEMzsklJkkg015bGCSF0+JDFrP0kbEtKXWH5L6mO96v5DrzGZg4DKGf
 sRyw==
X-Gm-Message-State: AOJu0YzOI/NLb6EPf7GJocIf+FKrVjURyj4i+/XrtLcW9xsEeekFVU8M
 JbfOwQOtrLXbuiUCdB3W9XA=
X-Google-Smtp-Source: AGHT+IELPdudRcRB5rbBm58TIPpk4jrqXQSMiUsaBUYpCfikolg1o0C7SeNXHZ8nFtI+R+1PiVTd0g==
X-Received: by 2002:a2e:978a:0:b0:2cd:2838:78d with SMTP id
 y10-20020a2e978a000000b002cd2838078dmr3639516lji.63.1705461143092; 
 Tue, 16 Jan 2024 19:12:23 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05640204cd00b0055971af7a23sm2258418edw.95.2024.01.16.19.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 19:12:22 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
 latency
Date: Wed, 17 Jan 2024 04:12:10 +0100
Message-ID: <20240117031212.1104034-5-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117031212.1104034-1-nunes.erico@gmail.com>
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
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
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 anarsoul@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
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
 drivers/gpu/drm/lima/lima_sched.c | 32 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/lima/lima_sched.h |  2 ++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 66317296d831..9449b81bcd5b 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
 
+#include <linux/hardirq.h>
 #include <linux/iosys-map.h>
 #include <linux/kthread.h>
 #include <linux/slab.h>
@@ -223,10 +224,7 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
 
 	task->fence = &fence->base;
 
-	/* for caller usage of the fence, otherwise irq handler
-	 * may consume the fence before caller use it
-	 */
-	dma_fence_get(task->fence);
+	task->done_fence = dma_fence_get(task->fence);
 
 	pipe->current_task = task;
 
@@ -401,9 +399,33 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	struct lima_sched_pipe *pipe = to_lima_pipe(job->sched);
 	struct lima_sched_task *task = to_lima_task(job);
 	struct lima_device *ldev = pipe->ldev;
+	struct lima_ip *ip = pipe->processor[0];
+
+	/*
+	 * If the GPU managed to complete this jobs fence, the timeout is
+	 * spurious. Bail out.
+	 */
+	if (dma_fence_is_signaled(task->done_fence)) {
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
+	synchronize_irq(ip->irq);
+
+	if (dma_fence_is_signaled(task->done_fence)) {
+		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+	}
 
 	if (!pipe->error)
-		DRM_ERROR("lima job timeout\n");
+		DRM_ERROR("%s lima job timeout\n", lima_ip_name(ip));
 
 	drm_sched_stop(&pipe->base, &task->base);
 
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 6a11764d87b3..34050facb110 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -29,6 +29,8 @@ struct lima_sched_task {
 	bool recoverable;
 	struct lima_bo *heap;
 
+	struct dma_fence *done_fence;
+
 	/* pipe fence */
 	struct dma_fence *fence;
 };
-- 
2.43.0

