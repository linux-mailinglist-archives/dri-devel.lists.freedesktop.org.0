Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545F7F225D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 01:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F1D10E215;
	Tue, 21 Nov 2023 00:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADDC10E202;
 Tue, 21 Nov 2023 00:40:06 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3b2df2fb611so3620890b6e.0; 
 Mon, 20 Nov 2023 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700527205; x=1701132005; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jJiNmIhW71Zn4Fc0nq68KcS1kEb54hrII7uSxSemAM=;
 b=JELfwEwzNk4p3W6ASU4kSLWUT0L+00w8X5HOhd1rkvgEXyRtoqwR9Ll102mzxoFg/S
 u6XqI0SOLoPAOv9VeNSHgvz3tszKTc/OOi+M/PfZhPEQvh7kkGvfdoMNj0EzFpnfdn2h
 2LiQ337LwHiHSueLQiieKhaBwf+XVgAze5b2sg3CSAvwVMUi49NiacTi0odiEczlJqAD
 XROcn1Vhuj1fCbp15OD6rEor85Q+wJS3rekmcLZty555NxrH1lcu7nfynKzGZLMpbqAh
 Dw+VdblnLJAhPOYwaArfk36SP/YtM0S049wPlYkL9WOMAXaGiMGtVRns513nil+OTdLL
 0SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700527205; x=1701132005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jJiNmIhW71Zn4Fc0nq68KcS1kEb54hrII7uSxSemAM=;
 b=eRycvj9e3xWd+YpXpBS4EDvtV+spRURzy+xdDb9Tjjx5/8NAhA3a0HP499y8IIDtdj
 ggo7fEXHyRJWJjkTi2SqJ8lzD+OnO+G/NrVv9LJoNuAQpQABhbJcyO1sSzg67mM7pKxB
 0N1cTmkk6uYGEhqG2RDfOdp6DfeH8cIY726flqJ9cGIh9phpNfYMVhgPtVYmXpEPGvxW
 ZB1Xcpth2eNXMoJ1KgOhdmXXP5lYIYvqpOYoV815n71TdzniC+CpltexnVwWm51QanLc
 23tt2iRXbVuMBMMPxK2SzPMs/eBXkefXfuKGmNR9ZioM46b+lvyYgxDMlYbj6r7UtApo
 wvJw==
X-Gm-Message-State: AOJu0Yyx9DIhzLV2x2mPxX0mzUHJkgECi5JW5p1/Rdklco8Piu1JBUwH
 8yU4f+04RKs+ma5xVrOdERe9gO8r2jc=
X-Google-Smtp-Source: AGHT+IHcGK1NJmg8WEvF1E/QUfwop36BTwpUAa5h3H7ELtuDNLXxZzI9udncaGpBHWzB0HNrN1hbMg==
X-Received: by 2002:a05:6808:114b:b0:3ae:170f:a39b with SMTP id
 u11-20020a056808114b00b003ae170fa39bmr12467395oiu.17.1700527204827; 
 Mon, 20 Nov 2023 16:40:04 -0800 (PST)
Received: from localhost ([47.215.232.245]) by smtp.gmail.com with ESMTPSA id
 r1-20020a6560c1000000b005ab281d0777sm5665374pgv.20.2023.11.20.16.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 16:40:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/msm/gem: Remove "valid" tracking
Date: Mon, 20 Nov 2023 16:38:45 -0800
Message-ID: <20231121003935.5868-2-robdclark@gmail.com>
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

This was a small optimization for pre-soft-pin userspace.  But mesa
switched to soft-pin nearly 5yrs ago.  So lets drop the optimization
and simplify the code.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |  2 --
 drivers/gpu/drm/msm/msm_gem_submit.c | 44 +++++-----------------------
 2 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8ddef5443140..c36c1c1fa222 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -271,7 +271,6 @@ struct msm_gem_submit {
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
 	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
-	bool valid;         /* true if no cmdstream patching needed */
 	bool in_rb;         /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
 	unsigned int nr_cmds;
@@ -288,7 +287,6 @@ struct msm_gem_submit {
 	} *cmd;  /* array of size nr_cmds */
 	struct {
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
-#define BO_VALID	0x8000	/* is current addr in cmdstream correct/valid? */
 #define BO_LOCKED	0x4000	/* obj lock is held */
 #define BO_PINNED	0x2000	/* obj (pages) is pinned and on active list */
 		uint32_t flags;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6d8ec1337e8b..996274ef32a6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -150,8 +150,6 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		submit->bos[i].handle = submit_bo.handle;
 		submit->bos[i].flags = submit_bo.flags;
-		/* in validate_objects() we figure out if this is true: */
-		submit->bos[i].iova  = submit_bo.presumed;
 	}
 
 	spin_lock(&file->table_lock);
@@ -278,9 +276,6 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
 	unsigned cleanup_flags = BO_PINNED | BO_LOCKED;
 	submit_cleanup_bo(submit, i, cleanup_flags);
-
-	if (!(submit->bos[i].flags & BO_VALID))
-		submit->bos[i].iova = 0;
 }
 
 /* This is where we make sure all the bo's are reserved and pin'd: */
@@ -390,8 +385,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	struct msm_drm_private *priv = submit->dev->dev_private;
 	int i, ret = 0;
 
-	submit->valid = true;
-
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct msm_gem_vma *vma;
@@ -407,14 +400,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		if (vma->iova == submit->bos[i].iova) {
-			submit->bos[i].flags |= BO_VALID;
-		} else {
-			submit->bos[i].iova = vma->iova;
-			/* iova changed, so address in cmdstream is not valid: */
-			submit->bos[i].flags &= ~BO_VALID;
-			submit->valid = false;
-		}
+		submit->bos[i].iova = vma->iova;
 	}
 
 	/*
@@ -451,7 +437,7 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
-		struct drm_gem_object **obj, uint64_t *iova, bool *valid)
+		struct drm_gem_object **obj, uint64_t *iova)
 {
 	if (idx >= submit->nr_bos) {
 		SUBMIT_ERROR(submit, "invalid buffer index: %u (out of %u)\n",
@@ -463,8 +449,6 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 		*obj = submit->bos[idx].obj;
 	if (iova)
 		*iova = submit->bos[idx].iova;
-	if (valid)
-		*valid = !!(submit->bos[idx].flags & BO_VALID);
 
 	return 0;
 }
@@ -477,9 +461,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 	uint32_t *ptr;
 	int ret = 0;
 
-	if (!nr_relocs)
-		return 0;
-
 	if (offset % 4) {
 		SUBMIT_ERROR(submit, "non-aligned cmdstream buffer: %u\n", offset);
 		return -EINVAL;
@@ -500,7 +481,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 		struct drm_msm_gem_submit_reloc submit_reloc = relocs[i];
 		uint32_t off;
 		uint64_t iova;
-		bool valid;
 
 		if (submit_reloc.submit_offset % 4) {
 			SUBMIT_ERROR(submit, "non-aligned reloc offset: %u\n",
@@ -519,13 +499,10 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 			goto out;
 		}
 
-		ret = submit_bo(submit, submit_reloc.reloc_idx, NULL, &iova, &valid);
+		ret = submit_bo(submit, submit_reloc.reloc_idx, NULL, &iova);
 		if (ret)
 			goto out;
 
-		if (valid)
-			continue;
-
 		iova += submit_reloc.reloc_offset;
 
 		if (submit_reloc.shift < 0)
@@ -879,8 +856,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_gem_object *obj;
 		uint64_t iova;
 
-		ret = submit_bo(submit, submit->cmd[i].idx,
-				&obj, &iova, NULL);
+		ret = submit_bo(submit, submit->cmd[i].idx, &obj, &iova);
 		if (ret)
 			goto out;
 
@@ -894,17 +870,13 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 		submit->cmd[i].iova = iova + (submit->cmd[i].offset * 4);
 
-		if (submit->valid)
+		if (likely(!submit->cmd[i].nr_relocs))
 			continue;
 
 		if (!gpu->allow_relocs) {
-			if (submit->cmd[i].nr_relocs) {
-				SUBMIT_ERROR(submit, "relocs not allowed\n");
-				ret = -EINVAL;
-				goto out;
-			}
-
-			continue;
+			SUBMIT_ERROR(submit, "relocs not allowed\n");
+			ret = -EINVAL;
+			goto out;
 		}
 
 		ret = submit_reloc(submit, obj, submit->cmd[i].offset * 4,
-- 
2.42.0

