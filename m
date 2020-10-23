Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A872974F7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D416F8EC;
	Fri, 23 Oct 2020 16:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17806F8F3;
 Fri, 23 Oct 2020 16:50:27 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b26so1801226pff.3;
 Fri, 23 Oct 2020 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZu6hiAVgN2XwJXAlI42prVaoZpWSXPlbrarieNv0bY=;
 b=H3rot9Tjm3xnPq+iJ3qKb1IeEgZ0WgD08lHDxcJ/1YKPNcU8MmLQnB/UClAJJBaLfq
 gwYKDcOAA8E9dU0z98ca6Xpo0OFOKa+Rzx1jBOiI53IDhL6K2EpPHaObA5r9iY1Xu7WB
 Zq15jyv/RcbtpOgWbxWeP2kERL1mZvrBUaCobnRJ+e8XnaE6542EJ4D8UT94jFBzc4Ed
 aROR6iPyHo4+m9L5NlIP/VbSU86n73cSZ1QfycG206jeu7zswiBU5jyAR5+tQsNVHvlg
 oKgQLhvBQO4KdReVtNw7kef2tUp1vqFjk0smxOuMK0vWDslrvmQqdnWy7AoAVGk74i3v
 cTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZu6hiAVgN2XwJXAlI42prVaoZpWSXPlbrarieNv0bY=;
 b=HfzNght1ns9/iHGfDA6oBJ2K3RdwfMlvKxDYk4AJV3OS5z7p4u+EVkl5+XLjCKso5F
 2ui+QuBPyEgalmGpicNOqvaAPiKgBK2RbEMpfRDRdBHjXk3HzSvljqm8JI3AeKjEuCON
 SdVaEMg0EF3nqoax2XaufyU4/awYRKwFygTT93t6/me1tEGH7GS0lbnmb3m0uBvsC+pR
 qVwA/LsICnfD/ETE+JoznMMHfUk4PRoEdp4dg9zG+sAyWeE4zbY8+glUauHZ/5dV1GUt
 F7I4KIeebBp2KXR1P50zVf80fuNkrx2aqA4+19AW7p/B2e/g4fD98pEj7tIE4pAkGEIc
 /2GQ==
X-Gm-Message-State: AOAM530j+k2GBGHPURh/I+CjMRmPs0VtLqJ+kbBISD1AYIEjOIdU2Nt4
 866NNLG8RgVUVNmJ+hb2P8UGQyQGD4lt2A==
X-Google-Smtp-Source: ABdhPJwYLHql4P24xJwqIfFlVgCgMc3pr1awi+AXFM6XHohN9oAVKLfXvjEPi8MFhANN5IU9HWg2AA==
X-Received: by 2002:a63:845:: with SMTP id 66mr2718631pgi.318.1603471826626;
 Fri, 23 Oct 2020 09:50:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t10sm3012002pjr.37.2020.10.23.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/23] drm/msm/submit: Move copy_from_user ahead of locking
 bos
Date: Fri, 23 Oct 2020 09:51:08 -0700
Message-Id: <20201023165136.561680-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
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
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We cannot switch to using obj->resv for locking without first moving all
the copy_from_user() ahead of submit_lock_objects().  Otherwise in the
mm fault path we aquire mm->mmap_sem before obj lock, but in the submit
path the order is reversed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.h        |   3 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 127 +++++++++++++++++----------
 2 files changed, 82 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 766ce278c74a..1f4e5d871a23 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -240,7 +240,10 @@ struct msm_gem_submit {
 		uint32_t type;
 		uint32_t size;  /* in dwords */
 		uint64_t iova;
+		uint32_t offset;/* in dwords */
 		uint32_t idx;   /* cmdstream buffer idx in bos[] */
+		uint32_t nr_relocs;
+		struct drm_msm_gem_submit_reloc *relocs;
 	} *cmd;  /* array of size nr_cmds */
 	struct {
 		uint32_t flags;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index aa5c60a7132d..b6c258c89290 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -62,11 +62,16 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 void msm_gem_submit_free(struct msm_gem_submit *submit)
 {
+	unsigned i;
+
 	dma_fence_put(submit->fence);
 	list_del(&submit->node);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
+	for (i = 0; i < submit->nr_cmds; i++)
+		kfree(submit->cmd[i].relocs);
+
 	kfree(submit);
 }
 
@@ -150,6 +155,66 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 	return ret;
 }
 
+static int submit_lookup_cmds(struct msm_gem_submit *submit,
+		struct drm_msm_gem_submit *args, struct drm_file *file)
+{
+	unsigned i, sz;
+	int ret = 0;
+
+	for (i = 0; i < args->nr_cmds; i++) {
+		struct drm_msm_gem_submit_cmd submit_cmd;
+		void __user *userptr =
+			u64_to_user_ptr(args->cmds + (i * sizeof(submit_cmd)));
+
+		ret = copy_from_user(&submit_cmd, userptr, sizeof(submit_cmd));
+		if (ret) {
+			ret = -EFAULT;
+			goto out;
+		}
+
+		/* validate input from userspace: */
+		switch (submit_cmd.type) {
+		case MSM_SUBMIT_CMD_BUF:
+		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
+		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
+			break;
+		default:
+			DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
+			return -EINVAL;
+		}
+
+		if (submit_cmd.size % 4) {
+			DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
+					submit_cmd.size);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		submit->cmd[i].type = submit_cmd.type;
+		submit->cmd[i].size = submit_cmd.size / 4;
+		submit->cmd[i].offset = submit_cmd.submit_offset / 4;
+		submit->cmd[i].idx  = submit_cmd.submit_idx;
+		submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
+
+		sz = array_size(submit_cmd.nr_relocs,
+				sizeof(struct drm_msm_gem_submit_reloc));
+		/* check for overflow: */
+		if (sz == SIZE_MAX) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL);
+		ret = copy_from_user(submit->cmd[i].relocs, userptr, sz);
+		if (ret) {
+			ret = -EFAULT;
+			goto out;
+		}
+	}
+
+out:
+	return ret;
+}
+
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
 		int i, bool backoff)
 {
@@ -301,7 +366,7 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 
 /* process the reloc's and patch up the cmdstream as needed: */
 static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *obj,
-		uint32_t offset, uint32_t nr_relocs, uint64_t relocs)
+		uint32_t offset, uint32_t nr_relocs, struct drm_msm_gem_submit_reloc *relocs)
 {
 	uint32_t i, last_offset = 0;
 	uint32_t *ptr;
@@ -327,18 +392,11 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 	}
 
 	for (i = 0; i < nr_relocs; i++) {
-		struct drm_msm_gem_submit_reloc submit_reloc;
-		void __user *userptr =
-			u64_to_user_ptr(relocs + (i * sizeof(submit_reloc)));
+		struct drm_msm_gem_submit_reloc submit_reloc = relocs[i];
 		uint32_t off;
 		uint64_t iova;
 		bool valid;
 
-		if (copy_from_user(&submit_reloc, userptr, sizeof(submit_reloc))) {
-			ret = -EFAULT;
-			goto out;
-		}
-
 		if (submit_reloc.submit_offset % 4) {
 			DRM_ERROR("non-aligned reloc offset: %u\n",
 					submit_reloc.submit_offset);
@@ -694,6 +752,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
+	ret = submit_lookup_cmds(submit, args, file);
+	if (ret)
+		goto out;
+
 	/* copy_*_user while holding a ww ticket upsets lockdep */
 	ww_acquire_init(&submit->ticket, &reservation_ww_class);
 	has_ww_ticket = true;
@@ -710,60 +772,29 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out;
 
 	for (i = 0; i < args->nr_cmds; i++) {
-		struct drm_msm_gem_submit_cmd submit_cmd;
-		void __user *userptr =
-			u64_to_user_ptr(args->cmds + (i * sizeof(submit_cmd)));
 		struct msm_gem_object *msm_obj;
 		uint64_t iova;
 
-		ret = copy_from_user(&submit_cmd, userptr, sizeof(submit_cmd));
-		if (ret) {
-			ret = -EFAULT;
-			goto out;
-		}
-
-		/* validate input from userspace: */
-		switch (submit_cmd.type) {
-		case MSM_SUBMIT_CMD_BUF:
-		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
-		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			break;
-		default:
-			DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
-			ret = -EINVAL;
-			goto out;
-		}
-
-		ret = submit_bo(submit, submit_cmd.submit_idx,
+		ret = submit_bo(submit, submit->cmd[i].idx,
 				&msm_obj, &iova, NULL);
 		if (ret)
 			goto out;
 
-		if (submit_cmd.size % 4) {
-			DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
-					submit_cmd.size);
+		if (!submit->cmd[i].size ||
+			((submit->cmd[i].size + submit->cmd[i].offset) >
+				msm_obj->base.size / 4)) {
+			DRM_ERROR("invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
 			ret = -EINVAL;
 			goto out;
 		}
 
-		if (!submit_cmd.size ||
-			((submit_cmd.size + submit_cmd.submit_offset) >
-				msm_obj->base.size)) {
-			DRM_ERROR("invalid cmdstream size: %u\n", submit_cmd.size);
-			ret = -EINVAL;
-			goto out;
-		}
-
-		submit->cmd[i].type = submit_cmd.type;
-		submit->cmd[i].size = submit_cmd.size / 4;
-		submit->cmd[i].iova = iova + submit_cmd.submit_offset;
-		submit->cmd[i].idx  = submit_cmd.submit_idx;
+		submit->cmd[i].iova = iova + (submit->cmd[i].offset * 4);
 
 		if (submit->valid)
 			continue;
 
-		ret = submit_reloc(submit, msm_obj, submit_cmd.submit_offset,
-				submit_cmd.nr_relocs, submit_cmd.relocs);
+		ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
+				submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
 		if (ret)
 			goto out;
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
