Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEC7D9E57
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD6F10EA1D;
	Fri, 27 Oct 2023 16:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B3910E141;
 Fri, 27 Oct 2023 16:59:23 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c5cd27b1acso20718035ad.2; 
 Fri, 27 Oct 2023 09:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425963; x=1699030763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjlFqD57WfpyH15rLpP1GN1DPt5ddZpCcGr9BQH7/rg=;
 b=TPCKdjLf/qPr+kPCDQ3U6MPhzNMm+HKahvkhNXpzfy8sV8SktPugA8bOz85TFwIqlA
 IpcOXM0jUXADaCim9kjauJs7nxO6ww4b7oR2V8Llo+mFizDSqD5jXA9tzO7vyxMiBe2x
 88MudDcXLnXyCQzkSYFf9oUxFdEyMnKPhBMX1cdmb8rBhLjCW8fTsJfMYfTKN9Hf00uu
 /nQic+vkjCVvSIs7tfSKQZ5ZGILUFnMfR53fehy4YCZeyvZmEaKapor1CkqtZHx4oBMf
 bk61oY4yxULqTDR3hzsZwyGMgguXYENlDb9IRG5HhH2vPiIriWDg/6+/8Pf2M6wZmyPv
 uY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425963; x=1699030763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjlFqD57WfpyH15rLpP1GN1DPt5ddZpCcGr9BQH7/rg=;
 b=pzvnZKPRHE3F+jlXYtk+294rTdyX0q8JzZuBzaAC+sUO2HLoFPLaA0teAPSzFNqULZ
 hwKBEdh0ippwsNtmYPE3VMOcVs/yuHxYlVBO/pBvV8XUbOC/454s+IuUZCIuMU5HVbvm
 HYeMfQb2aIB6ab74RbNJxvaitz6QHnOej7OVnIlLtsnq0QbSg4S38WkGIqDDDIbEk7UE
 U0E1WI69WCsCKputHhABOQN88EBMjDtTjNRq1HYdUjVx6ssTdF1F885bKi9x1sMpoIAt
 DsTvMsI9q2vl0+28tTRqR1FiFJIIXW9JESb9nlgE4tX13n24Cel+IiCBqCWMkqIYb+Mv
 GzcA==
X-Gm-Message-State: AOJu0YwZzqyLAXAsjFTQOcph8bAgMYF4dIzKLnUul/+cd41PpPxZ5Jjk
 JAmWIY2KfDrLMrcV5kauw6tNZcbgi30=
X-Google-Smtp-Source: AGHT+IGPy24qVA2bmVsf4hNeMCi1FeUtZRRCpcB1pe5z5inrUzOFQz1HOi4HLF/CMbxMpJNP96x7oA==
X-Received: by 2002:a17:902:f54c:b0:1c9:cc88:5029 with SMTP id
 h12-20020a170902f54c00b001c9cc885029mr3772962plf.32.1698425962797; 
 Fri, 27 Oct 2023 09:59:22 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a170902db1200b001bde6fa0a39sm1800366plx.167.2023.10.27.09.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/msm/gem: Split out submit_unpin_objects() helper
Date: Fri, 27 Oct 2023 09:58:38 -0700
Message-ID: <20231027165859.395638-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027165859.395638-1-robdclark@gmail.com>
References: <20231027165859.395638-1-robdclark@gmail.com>
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
index 9d6e2e10d25a..7ea5eca118eb 100644
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
2.41.0

