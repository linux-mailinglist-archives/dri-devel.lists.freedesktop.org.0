Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AA6C1511
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EE610E1D0;
	Mon, 20 Mar 2023 14:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9014A10E1EC;
 Mon, 20 Mar 2023 14:44:33 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso16598112pjb.3; 
 Mon, 20 Mar 2023 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iNjAC1W4XZsf7RJ1ht9dOafT/e4zZ1svNLwVwT9eWII=;
 b=QL9SfnfKe7vTCJV52lAJ686yvUOxF/rLlremOL5Qb6MW7Zsh0KJ/GgqaYK8pebbydx
 vF1Lc+1gbXAStMSGtRkkkxah0yQu08ARfmQ94EXGPMrGCKMXRcTABiOs+lt/zkfTgL6f
 yLZfQaUJ1YJ59CTS72s0zdYI2Ebb1olYHarl6C66ZoBfakQ7yhKUbvS/1L0qKqIqOlg+
 CJoi9k7HRW9wu7NvxyMnKJMYuNe5z0JzuR7ie0oxF6v+Al0H1P7flXjQDbziH1WFm8/r
 rBDRjHjPEz0rRFxmiGI8wqKQGiAXJg/O2qadKGBij1YrgtkZullrMuktIvJH0ILPOAU+
 JkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNjAC1W4XZsf7RJ1ht9dOafT/e4zZ1svNLwVwT9eWII=;
 b=pH+TZ9WFt8pOIbJV38CtJInWG6roT5ZIUFjz8TsWGqazFA1hTtIz3StJRmfBJ5kJiX
 UNceMlOSFu/6j20pMTey/UH5l7Fvar6huux7vLbX3iw39qv4nyfa6e5IvAR17Vr9yVXA
 rAaC63vVyHS0DhzTasQ888cSgkKnpTHsVraFXGu17PhaXD2BVEtyC8BzIK6xvnVjOtFK
 0XnAOIcLUwHRZUCVEX42KkliDHGKnMCGhENOD11l787qnTNX6UDBpJw8JVeQL1H9Y6cL
 7OxaWyKMvGCkjQzzjDbxhFIcMKSkEEER931YWLINQt5a7FciD30r3orRqSkLJKLj9yDM
 iANQ==
X-Gm-Message-State: AO0yUKVuxtCrYLPRFYDhDYOUSrcU+04S1sso1StEOgSMMfIdEOfVNM5K
 LjYC27UXDdpEPswyIdl6yVGQMkLYXH8=
X-Google-Smtp-Source: AK7set88CXDkILKcokVTNL34lJkgh03yV1DadcHHZqKAL59RTe92k7k4c3vIOtp3mC5f+zQfkcU19w==
X-Received: by 2002:a05:6a20:2098:b0:d9:dd69:47e3 with SMTP id
 b24-20020a056a20209800b000d9dd6947e3mr1884104pza.23.1679323472839; 
 Mon, 20 Mar 2023 07:44:32 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 m26-20020aa78a1a000000b005a8a5be96b2sm3028068pfa.104.2023.03.20.07.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/23] drm/msm: Pre-allocate hw_fence
Date: Mon, 20 Mar 2023 07:43:23 -0700
Message-Id: <20230320144356.803762-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Avoid allocating memory in job_run() by pre-allocating the hw_fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c      | 12 +++++++++---
 drivers/gpu/drm/msm/msm_fence.h      |  3 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c |  7 +++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 56641408ea74..bab3d84f1686 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -99,7 +99,7 @@ static const struct dma_fence_ops msm_fence_ops = {
 };
 
 struct dma_fence *
-msm_fence_alloc(struct msm_fence_context *fctx)
+msm_fence_alloc(void)
 {
 	struct msm_fence *f;
 
@@ -107,10 +107,16 @@ msm_fence_alloc(struct msm_fence_context *fctx)
 	if (!f)
 		return ERR_PTR(-ENOMEM);
 
+	return &f->base;
+}
+
+void
+msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+
 	f->fctx = fctx;
 
 	dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
 		       fctx->context, ++fctx->last_fence);
-
-	return &f->base;
 }
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 7f1798c54cd1..f913fa22d8fe 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -61,7 +61,8 @@ void msm_fence_context_free(struct msm_fence_context *fctx);
 bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
-struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
+struct dma_fence * msm_fence_alloc(void);
+void msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx);
 
 static inline bool
 fence_before(uint32_t a, uint32_t b)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index be4bf77103cd..2570c018b0cb 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -41,6 +41,13 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
 
+	submit->hw_fence = msm_fence_alloc();
+	if (IS_ERR(submit->hw_fence)) {
+		ret = PTR_ERR(submit->hw_fence);
+		kfree(submit);
+		return ERR_PTR(ret);
+	}
+
 	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
 	if (ret) {
 		kfree(submit);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 57a8e9564540..a62b45e5a8c3 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -18,7 +18,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_gpu *gpu = submit->gpu;
 	int i;
 
-	submit->hw_fence = msm_fence_alloc(fctx);
+	msm_fence_init(submit->hw_fence, fctx);
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
-- 
2.39.2

