Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5985876DAB8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 00:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF5210E479;
	Wed,  2 Aug 2023 22:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C5110E074;
 Wed,  2 Aug 2023 22:22:35 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-686e0213c0bso228976b3a.1; 
 Wed, 02 Aug 2023 15:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691014954; x=1691619754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZNKuTKrcBgRO6bXVxaTsNFykZlM8LhlqXHhRV9iIMg=;
 b=ZeNQnTSw63gUqdIOiPmnXIl0jX9pddEHQZXlodZ5XGlcKEU4VI8DVud5T5Sncrvzm+
 sTi+cCt4G2gmYZc96sOEumuGVzZWP/n53luobPPCLPUM/VQfz2zzqFfn1BSrgqlqwgTb
 cMmaAox48K2vOi/m46kqcc7Xnw0Rp/BCKPcUwitEPj/r11H3GdM0NUN7SwCwBl5d2B5T
 tBqqXP4ChvxDYQKfXVv138ks9WbvfPU/dOdNf+TeqwYVZmfl7INc8xDCyHFcSxfS4ViK
 Uwbw+eDR5leGqPeVH/qqdomg8yavyTPpjAeG7H9gIb9mxy+vUghACbc05ID5RPpMLmSm
 9lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691014954; x=1691619754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZNKuTKrcBgRO6bXVxaTsNFykZlM8LhlqXHhRV9iIMg=;
 b=dz6iOvQTBu2KB8iSCpezEUcVB3vk2DUaVsbGT2yZsAxflkoFWtd3hyxQLchdjKRjwl
 w1aIDw3z5F39ILCL6+ie1KXB53HkUW+pyAgxlL1/Fu7EmcJH9KsNRz/n2ESEUu1bLyk1
 IJtiL0Za8Wf46KhakAFOez1+vOFret+f38S9+snHtYvVTqNL43U1hM13AOb/pQevP947
 4td8feKxWUyFZ3MS00ZffhGlp8s5DNvw3dNxzGSVNhAo1fjCYb02TEgoRXGBo7V/J+On
 Ex6M7steeGqEulDq4FazUwVZWNkJweubxY8GeRzF4CPQQbh0VoACy2O8V5c4vs8PvHg3
 RTMw==
X-Gm-Message-State: ABy/qLYGwDLMoMztBAfH9ClSVsduvJVdIR3bZb97/mclPK9fiX4WJ6to
 WPO7s/2Pj9Ci+7lVXohcqYM8yz37gGY=
X-Google-Smtp-Source: APBJJlG+Tf4GmWBUQWIaN/BFbth8eef9yEFZAVMQd4BC1XPs2NLxeysSzwbkRAkCpLiBfaDWCJ+XGA==
X-Received: by 2002:a05:6a20:840b:b0:137:514a:9835 with SMTP id
 c11-20020a056a20840b00b00137514a9835mr20526626pzd.9.1691014953945; 
 Wed, 02 Aug 2023 15:22:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:33de:aac3:fe1d:788])
 by smtp.gmail.com with ESMTPSA id
 y16-20020aa78550000000b0066a6059d399sm11558227pfn.116.2023.08.02.15.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 15:22:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm: Take lru lock once per job_run
Date: Wed,  2 Aug 2023 15:21:49 -0700
Message-ID: <20230802222158.11838-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802222158.11838-1-robdclark@gmail.com>
References: <20230802222158.11838-1-robdclark@gmail.com>
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

Rather than acquiring it and dropping it for each individual obj.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        | 3 ---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 20cfd86d2b32..6d1dbffc3905 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -509,14 +509,11 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
  */
 void msm_gem_unpin_active(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	mutex_lock(&priv->lru.lock);
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
 	update_lru_active(obj);
-	mutex_unlock(&priv->lru.lock);
 }
 
 struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index b60199184409..8b8353dcde9f 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -16,10 +16,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_gem_submit *submit = to_msm_submit(job);
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
+	struct msm_drm_private *priv = gpu->dev->dev_private;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
 
+	mutex_lock(&priv->lru.lock);
+
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
@@ -28,6 +31,8 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 		submit->bos[i].flags &= ~(BO_VMA_PINNED | BO_OBJ_PINNED);
 	}
 
+	mutex_unlock(&priv->lru.lock);
+
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
-- 
2.41.0

