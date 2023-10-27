Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CB7D9E4E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F5910EA16;
	Fri, 27 Oct 2023 16:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409E510EA15;
 Fri, 27 Oct 2023 16:59:17 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5aa7fdd1420so1812304a12.3; 
 Fri, 27 Oct 2023 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425956; x=1699030756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5R6dnp6JYl9GTg3p8/cfLvJpZVQTPFVKn1Jc3rRbi2Y=;
 b=g8aKGrPBX9MLuavGoqS4sEY8t3BHNYYmEViVQl1VBp/+eUfCgJx2aLopzOSdL+j7A2
 462FalJS/VtE2MVFLujJzRXzZbdPdlCGrLXZvFgQS8TiQvjghwOP7neGgEUnBGnAjQqN
 XX5gGBETXEzO4GBvKylTL1kkRkLcHzDAq80VDVMoRdmPd97zaT52QvTzjjLFT9P0QkgX
 BHaI9aa+1upRj+HDjqfmNODBiewWCOu8VtDuE7LrmqVVenOx2kQwZY7EBtcUFhkt2AV1
 Pa/vra2F2azzUwmHa/jzNu1LVhsJmtgpUtL8vKrMnBBc4lRJ09MpWkf1+P8q3HePzZAp
 ovgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425956; x=1699030756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5R6dnp6JYl9GTg3p8/cfLvJpZVQTPFVKn1Jc3rRbi2Y=;
 b=VlXGDuSae4Au30+pE+Oy35lLB2xRKiiEsl8Q9pteG9MKKHIzORloQfYyTG00JviVXh
 iYZhokPgCphdQCyEGtgkYcRTKyRA3OQEOX7oaFDWZBKDcCxhl6zQGK9dafNnVnT/Ufs/
 KrxwjqajHD/Si1CWvf3G0UxKk3SiVxw732IgdNIOPvCy0dPLH0FoK10c7X9NX749IUoW
 W1m+U2PkusiF3/uquzrvpLs8y3gBZT1RtQUeK3KCubjKz+WZQ5ak1i6OshjO3ieIZ6m9
 YJ2gxD8e+QJNCrQFwwwPPmMIn4xSiKrXv4tiZln4qitq5hAY4k6zAO+3Y8KOg+dAZyMZ
 HEbA==
X-Gm-Message-State: AOJu0Yxuv5fYMw6L+p/iIoJV64xO2M6RJqYNZlbYSOcuiu03d3/TWigp
 0zQJNiZOIZ72D3LKhc5Z3cfpQQNag3U=
X-Google-Smtp-Source: AGHT+IGKn3WMc6OBc8kKe4JkxH8X2ZWrozRHWu6T+6S+ZBzTtDZM8a8mjcxLZWnStYmHSFiQ1ePvig==
X-Received: by 2002:a17:90b:3781:b0:27d:d36:763b with SMTP id
 mz1-20020a17090b378100b0027d0d36763bmr3013167pjb.31.1698425956153; 
 Fri, 27 Oct 2023 09:59:16 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 pj1-20020a17090b4f4100b00273744e6eccsm1446083pjb.12.2023.10.27.09.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/msm/gem: Remove "valid" tracking
Date: Fri, 27 Oct 2023 09:58:35 -0700
Message-ID: <20231027165859.395638-2-robdclark@gmail.com>
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
2.41.0

