Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A07F225B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 01:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9868310E212;
	Tue, 21 Nov 2023 00:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C310E20A;
 Tue, 21 Nov 2023 00:40:12 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6c4eb5fda3cso5133288b3a.2; 
 Mon, 20 Nov 2023 16:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700527211; x=1701132011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnzaG3cRB/5KtTAgWIPYSsCuZh/1GIRool8/2X9sJOM=;
 b=bZZZYjVrsIc1yMnhiQsqLg+25iqiFVvRFgA4mxKYPtY1XT8ms4Gg3wE87EeDfsO+AV
 f+IHRZLboaQq2NGlV82Su/2phJuEyZ8V9D/i7aQXIwZ+0jeK7QqeyomIj09g/kb/tNC3
 m+Z9BjLwMCmOwqisEEbNVh9r8EvExajYOA3SzqadiBzkmhjudBjPJGoj1ld2g8dzSVB0
 LJPFzGE+euhasbCMaDJ3sQ2GeYR/44DbumnLzNF6nbq631O3IGgqIrZQSQjNwvEraQ4h
 zMkE50gVsRi1CthIJ12tfdu6BRHugJCeINNLPyzwOLJLP5G1EysjqTlrqblLQGSdvEP/
 IIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700527211; x=1701132011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnzaG3cRB/5KtTAgWIPYSsCuZh/1GIRool8/2X9sJOM=;
 b=l3KLJAeB8ODxMyADNpGNpc5kgO+eYtDEaa+TrxrxiyUicxg4KNptF6pLCkqProdoZZ
 V9sZlGyP8s31qt4F3fH8WzYNqzaspSbeF0NjhfZLHopf29N0XtvW0nxG3VCIePzqCz/4
 l24Tl+wKsNegJi5IJsq2Myiwf6M7HFbBn5mHC5sGzJVVAyiZ59qNiHxG3l8/pTbVqO3X
 XxEnootTI1VpExyvtuGHJhy5RhS5L6l8NkTbu+AoeQ7iOQuUMNgZWw2FVJB3xzNKWljw
 /1YU/hOUq/NpeWgQvksebl0UrzlAc37YFmyvtalCrCi4YOqvQN2C0k4FnawoH2+QyMP9
 6pUQ==
X-Gm-Message-State: AOJu0YyXxYsSa28gAT+V2um9ZHoItUwLA6gUKgUVsgOxQEwxgToar27d
 D8qOZ1n02RX6G/qDk0jmT85S/gEUMUs=
X-Google-Smtp-Source: AGHT+IG1isb1TbK4AsFr2wNlBOCAqhnBPr8l88VoAujtJFwJqdLXIp97aij0oyvwB6O8AZUjc054fg==
X-Received: by 2002:aa7:8885:0:b0:6cb:a2f7:83d with SMTP id
 z5-20020aa78885000000b006cba2f7083dmr5072996pfe.19.1700527211308; 
 Mon, 20 Nov 2023 16:40:11 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 u19-20020a056a00099300b006cb75e0eb02sm3554641pfg.152.2023.11.20.16.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 16:40:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/msm/gem: Split out submit_unpin_objects() helper
Date: Mon, 20 Nov 2023 16:38:48 -0800
Message-ID: <20231121003935.5868-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
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

Untangle unpinning from unlock/unref loop.  The unpin only happens in
error paths so it is easier to decouple from the normal unlock path.

Since we never have an intermediate state where a subset of buffers
are pinned (ie. we never bail out of the pin or unpin loops) we can
replace the bo state flag bit with a global flag in the submit.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |  6 +++---
 drivers/gpu/drm/msm/msm_gem_submit.c | 22 +++++++++++++++++-----
 drivers/gpu/drm/msm/msm_ringbuffer.c |  3 ++-
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c36c1c1fa222..af884ced7a0d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -270,8 +270,9 @@ struct msm_gem_submit {
 	int fence_id;       /* key into queue->fence_idr */
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
-	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
-	bool in_rb;         /* "sudo" mode, copy cmds into RB */
+	bool bos_pinned : 1;
+	bool fault_dumped:1;/* Limit devcoredump dumping to one per submit */
+	bool in_rb : 1;     /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
 	unsigned int nr_cmds;
 	unsigned int nr_bos;
@@ -288,7 +289,6 @@ struct msm_gem_submit {
 	struct {
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
 #define BO_LOCKED	0x4000	/* obj lock is held */
-#define BO_PINNED	0x2000	/* obj (pages) is pinned and on active list */
 		uint32_t flags;
 		union {
 			struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 786b48a55309..d001bf286606 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -265,9 +265,6 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	 */
 	submit->bos[i].flags &= ~cleanup_flags;
 
-	if (flags & BO_PINNED)
-		msm_gem_unpin_locked(obj);
-
 	if (flags & BO_LOCKED)
 		dma_resv_unlock(obj->resv);
 }
@@ -407,13 +404,28 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	mutex_lock(&priv->lru.lock);
 	for (i = 0; i < submit->nr_bos; i++) {
 		msm_gem_pin_obj_locked(submit->bos[i].obj);
-		submit->bos[i].flags |= BO_PINNED;
 	}
 	mutex_unlock(&priv->lru.lock);
 
+	submit->bos_pinned = true;
+
 	return ret;
 }
 
+static void submit_unpin_objects(struct msm_gem_submit *submit)
+{
+	if (!submit->bos_pinned)
+		return;
+
+	for (int i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+
+		msm_gem_unpin_locked(obj);
+	}
+
+	submit->bos_pinned = false;
+}
+
 static void submit_attach_object_fences(struct msm_gem_submit *submit)
 {
 	int i;
@@ -525,7 +537,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_PINNED;
+		submit_unpin_objects(submit);
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 929df7243792..bd125ca4d230 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -29,9 +29,10 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		msm_gem_unpin_active(obj);
-		submit->bos[i].flags &= ~BO_PINNED;
 	}
 
+	submit->bos_pinned = false;
+
 	mutex_unlock(&priv->lru.lock);
 
 	msm_gpu_submit(gpu, submit);
-- 
2.42.0

