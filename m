Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4A751382
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF2E10E00D;
	Wed, 12 Jul 2023 22:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDB710E00D;
 Wed, 12 Jul 2023 22:25:29 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666e64e97e2so72351b3a.1; 
 Wed, 12 Jul 2023 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689200728; x=1691792728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p16HJUeFjh0Up2EuZ/dd2QVMrO3mMIhcqelMbrELgUs=;
 b=AS3vGV8GaYrFYrEl8H7hKOjmb4Es0czMAC6TL+m1BtL8qPw1sXJihYI42F4fQzasCr
 9C/y54pmvfVY9HMvfXgQdtw4Dg9mHXrMPvs5VDa9hXep9esXb/RyZvxjNfMvsYcmnTMJ
 ocpZaEc7VznJX4Es9MCc/gosChAkNclEWfsQ1LzguTrGQsuHe8ivx1aoV4U52w3gRZd1
 qZsRONMzbiDqyWR73A3DZ3K7r1Was6iNreseQs4VmEeXtoGKGC18Wefn0FQ+w4mhF049
 sjq6dTthUjmgvqR6YZ9s3TqubH7fPlMeM6m33OUtbuIclNjP+ZtOTBA0A25zi/fln4hk
 NM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689200728; x=1691792728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p16HJUeFjh0Up2EuZ/dd2QVMrO3mMIhcqelMbrELgUs=;
 b=Fs7DeJoMBD5hQx9Gqy62n4hmqIA7HbHC0Orv89iLa2Nb29nwtnoW3iUIlid0jxYN13
 gS/hKKt85PGrIOjNTXKYp6T/NUYj/GV25AHelHA7TqK7B9WwNgjCqtB1QMlTeYK8CP+g
 NeP3LxAHlQkWBp7Yl+ywbNy0m/VYqjEbt4iQCWLTGUTCEVLaFKlbcDsttFtbn4JhHQq/
 DAyYnApcbjlhGjQhK3QVmobiCVlZjpmFXGPfxUYqfzzcWVI3Wcq0NECz2rK+g9ZHPFFd
 t8eNPlHk4Yic1pk45iV4IRopYeJQdEzdsxo93EZz/LNup5oBWWfKimfZBSoZnWg5r2dd
 z9Cw==
X-Gm-Message-State: ABy/qLYzfrb29SEdYmWw0R3cy+lXC6KLHlN5/dVM+Wr/vrswQe3ZMX6B
 Bf/SHef+wKDed4skgOmXmVXJFZtxN3A=
X-Google-Smtp-Source: APBJJlG3beF7ERt/uLgX1UHxkuEN/pg8U+e7c3SJSiwKs5FaMN/c4UXTKiygCxqrZPeQl6oKY+i78g==
X-Received: by 2002:a05:6a00:23ca:b0:668:8596:7524 with SMTP id
 g10-20020a056a0023ca00b0066885967524mr21229199pfc.20.1689200727294; 
 Wed, 12 Jul 2023 15:25:27 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 i23-20020aa78b57000000b00662610cf7a8sm4174893pfd.172.2023.07.12.15.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:25:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix hw_fence error path cleanup
Date: Wed, 12 Jul 2023 15:25:23 -0700
Message-ID: <20230712222523.7404-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In an error path where the submit is free'd without the job being run,
the hw_fence pointer is simply a kzalloc'd block of memory.  In this
case we should just kfree() it, rather than trying to decrement it's
reference count.  Fortunately we can tell that this is the case by
checking for a zero refcount, since if the job was run, the submit would
be holding a reference to the hw_fence.

Fixes: f94e6a51e17c ("drm/msm: Pre-allocate hw_fence")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c      |  6 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 96599ec3eb78..1a5d4f1c8b42 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -191,6 +191,12 @@ msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
 
 	f->fctx = fctx;
 
+	/*
+	 * Until this point, the fence was just some pre-allocated memory,
+	 * no-one should have taken a reference to it yet.
+	 */
+	WARN_ON(kref_read(&fence->refcount));
+
 	dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
 		       fctx->context, ++fctx->last_fence);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3f1aa4de3b87..9d66498cdc04 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -86,7 +86,19 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	}
 
 	dma_fence_put(submit->user_fence);
-	dma_fence_put(submit->hw_fence);
+
+	/*
+	 * If the submit is freed before msm_job_run(), then hw_fence is
+	 * just some pre-allocated memory, not a reference counted fence.
+	 * Once the job runs and the hw_fence is initialized, it will
+	 * have a refcount of at least one, since the submit holds a ref
+	 * to the hw_fence.
+	 */
+	if (kref_read(&submit->hw_fence->refcount) == 0) {
+		kfree(submit->hw_fence);
+	} else {
+		dma_fence_put(submit->hw_fence);
+	}
 
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
-- 
2.41.0

