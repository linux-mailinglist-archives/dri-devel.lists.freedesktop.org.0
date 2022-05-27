Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE73536687
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 19:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47DB10E090;
	Fri, 27 May 2022 17:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4027C10E090;
 Fri, 27 May 2022 17:23:37 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 cs3-20020a17090af50300b001e0808b5838so4919950pjb.1; 
 Fri, 27 May 2022 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YY3IoyZFp/BwhNMVSMZRFp4gxgsaRvLLtyLrygtSwvg=;
 b=LMEqIzPhVuILqTqSu/V53/iwh7+emAhi6EP4B9inXZnH/3WjlMrUgFDTNerBCFGv9e
 o9nTy/6Y0Jl2qpbuieyBiP5y/Cb5WYdvIIsiIBbECuLoh+U8UUrNY2fCy2f6Y/+8ER1b
 fw0X6xnUEFjkLbhkAS0CIe5OCHQmhtTOgkJG8U9whDOB83yqKfVmIY/gGioZRz8wzN0l
 FlnWZsoYjzLAdxfaKQhQNOK43H5Fi5pYllg937TZCcHvDjsxdiELWSB2THbVv2frcz6p
 ce3kWVz4HlsRZXfk3lxKU0ix4rlFZcRy+yKefQHHmChxSu0VJgMH7/zHM9gk75crBFm1
 Vt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YY3IoyZFp/BwhNMVSMZRFp4gxgsaRvLLtyLrygtSwvg=;
 b=J+Llrb6QyxITS+ENas0DLWqRc5+O2Y/2o0x0uVemAWcfQ/AF27Zd7sw+LIR8X5GUaT
 P4hd1bFSSLbv+nHK3VgYaRZjgVDpzBnau85fsfKUpHSwqSp5BUdUdCNBLxP0LNf7vCG4
 xSc66REOZC7CQAsbHhy0Qg9/Ou35mzU1OzV4FgIbb6HyrCgU4scz7qwEoAgs8wuwUNqN
 YuK8mOxBU8Sus4vUOZD6cJWJzOrya+oyHqLmfbze5liyn7ByKtCvNkSAu3ArimeFBh/l
 nIsYxNlH5lewbgDTmR7s3QLYxkQcBEf5sB78aOwZ368OOmofcfIKUGgm3DfWWYPK613m
 NWFQ==
X-Gm-Message-State: AOAM532KdSECNUcq0N757vA4m5sjUo6Bpjw8lFwh+nN8vxKDPK3ZukQs
 POiYdlXqv5gz820kBEkS/ageuIdjyRw=
X-Google-Smtp-Source: ABdhPJznCAfmZY0ixAj2Yu27xibqHyPKUZxaLE82O0xTZYrZ6uR+EoCqezINMy7TQGOtvSaEluItnw==
X-Received: by 2002:a17:90a:c90e:b0:1df:53ff:e149 with SMTP id
 v14-20020a17090ac90e00b001df53ffe149mr9303665pjt.210.1653672215967; 
 Fri, 27 May 2022 10:23:35 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 be3-20020a170902aa0300b001621cdf7172sm4076520plb.58.2022.05.27.10.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 10:23:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gem: Separate object and vma unpin
Date: Fri, 27 May 2022 10:23:40 -0700
Message-Id: <20220527172341.2151005-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.3
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Previously the BO_PINNED state in the submit was tracking two related
but different things: (1) that the buffer object was pinned, and (2)
that the vma (mapping within a set of pagetables) was pinned.  But with
fenced vma unpin (needed so that userspace couldn't race with retire
path for releasing a vma) these two were decoupled.  The fact that the
BO_PINNED flag was already cleared meant that we leaked the bo pin count
which should have been dropped when the submit was retired.

So split this state into BO_OBJ_PINNED and BO_VMA_PINNED, so they can be
dropped independently.

Fixes: 95d1deb02a9c ("drm/msm/gem: Add fenced vma unpin")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c        |  7 +++----
 drivers/gpu/drm/msm/msm_gem.h        | 11 ++++++-----
 drivers/gpu/drm/msm/msm_gem_submit.c | 18 ++++++++++++------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 52fe6428a341..916e7f418fe1 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -439,14 +439,12 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 	return ret;
 }
 
-void msm_gem_unpin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
+void msm_gem_unpin_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
-	msm_gem_unpin_vma(vma);
-
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
 
@@ -586,7 +584,8 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj,
 	msm_gem_lock(obj);
 	vma = lookup_vma(obj, aspace);
 	if (!GEM_WARN_ON(!vma)) {
-		msm_gem_unpin_vma_locked(obj, vma);
+		msm_gem_unpin_vma(vma);
+		msm_gem_unpin_locked(obj);
 	}
 	msm_gem_unlock(obj);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c75d3b879a53..6b7d5bb3b575 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -145,7 +145,7 @@ struct msm_gem_object {
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
-void msm_gem_unpin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma);
+void msm_gem_unpin_locked(struct drm_gem_object *obj);
 struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
 					   struct msm_gem_address_space *aspace);
 int msm_gem_get_iova(struct drm_gem_object *obj,
@@ -377,10 +377,11 @@ struct msm_gem_submit {
 	} *cmd;  /* array of size nr_cmds */
 	struct {
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
-#define BO_VALID    0x8000   /* is current addr in cmdstream correct/valid? */
-#define BO_LOCKED   0x4000   /* obj lock is held */
-#define BO_ACTIVE   0x2000   /* active refcnt is held */
-#define BO_PINNED   0x1000   /* obj is pinned and on active list */
+#define BO_VALID	0x8000	/* is current addr in cmdstream correct/valid? */
+#define BO_LOCKED	0x4000	/* obj lock is held */
+#define BO_ACTIVE	0x2000	/* active refcnt is held */
+#define BO_OBJ_PINNED	0x1000	/* obj (pages) is pinned and on active list */
+#define BO_VMA_PINNED	0x0800	/* vma (virtual address) is pinned */
 		uint32_t flags;
 		union {
 			struct msm_gem_object *obj;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9cd8c8708990..286124008445 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -232,8 +232,11 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 	 */
 	submit->bos[i].flags &= ~cleanup_flags;
 
-	if (flags & BO_PINNED)
-		msm_gem_unpin_vma_locked(obj, submit->bos[i].vma);
+	if (flags & BO_VMA_PINNED)
+		msm_gem_unpin_vma(submit->bos[i].vma);
+
+	if (flags & BO_OBJ_PINNED)
+		msm_gem_unpin_locked(obj);
 
 	if (flags & BO_ACTIVE)
 		msm_gem_active_put(obj);
@@ -244,7 +247,9 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
-	submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE | BO_LOCKED);
+	unsigned cleanup_flags = BO_VMA_PINNED | BO_OBJ_PINNED |
+				 BO_ACTIVE | BO_LOCKED;
+	submit_cleanup_bo(submit, i, cleanup_flags);
 
 	if (!(submit->bos[i].flags & BO_VALID))
 		submit->bos[i].iova = 0;
@@ -377,7 +382,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		submit->bos[i].flags |= BO_PINNED;
+		submit->bos[i].flags |= BO_OBJ_PINNED | BO_VMA_PINNED;
 		submit->bos[i].vma = vma;
 
 		if (vma->iova == submit->bos[i].iova) {
@@ -511,7 +516,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_PINNED | BO_ACTIVE;
+		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED | BO_ACTIVE;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -529,7 +534,8 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
 		msm_gem_lock(obj);
-		submit_cleanup_bo(submit, i, BO_PINNED | BO_ACTIVE);
+		/* Note, VMA already fence-unpinned before submit: */
+		submit_cleanup_bo(submit, i, BO_OBJ_PINNED | BO_ACTIVE);
 		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 43066320ff8c..56eecb4a72dc 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -25,7 +25,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 		msm_gem_lock(obj);
 		msm_gem_unpin_vma_fenced(submit->bos[i].vma, fctx);
-		submit->bos[i].flags &= ~BO_PINNED;
+		submit->bos[i].flags &= ~BO_VMA_PINNED;
 		msm_gem_unlock(obj);
 	}
 
-- 
2.35.3

