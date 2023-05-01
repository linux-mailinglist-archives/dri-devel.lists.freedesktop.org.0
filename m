Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351556F3398
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 18:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BB310E0BB;
	Mon,  1 May 2023 16:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EE610E0BB;
 Mon,  1 May 2023 16:37:47 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aad55244b7so17505785ad.2; 
 Mon, 01 May 2023 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682959067; x=1685551067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wrKAgdmLOJyxcGM4fHJIExIcPdILMv9Wxsqdb+XbK0o=;
 b=lajon+PLfTqBK9Rp20x2MnUwb7SWY0dOp+b/oNKOeIzHg6ROUzBVY0YZZnsmn15dPF
 LOLkyaOHxrOCa6QgmaDu5t1d0knJDmZIoB40teLmie4OpAoiYvnarsAt3g/FOD4SsSN1
 fxBQIN1M+sD+wv+R1xW5EqudhJDD+Cn3aiqUcuJJAUSp/lMH9kLFl+foD7GkkeGd26JC
 E9nMaDv1hSgMJbYu7TMFA1Ejiu+YMCb488SrV0Bc/Kfh8iuwJXByW6ZP/cFL4cdVGm1W
 osE3S9EGLrmU7g3l51OMkFpNJhnIMxSvydUixvAHpIG0TjrtoXT/73sQgwMoMA3D+mKF
 X6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682959067; x=1685551067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wrKAgdmLOJyxcGM4fHJIExIcPdILMv9Wxsqdb+XbK0o=;
 b=OrMcB0ha9vvJQZvSKltI0jeApumMY6/dpLvo2CexywRGekUC6bPv49LvdlQ7VCAPdF
 UN7Ag9QBn3LlH08ET0qy1sGsZjuN8Ao6QrsjNuo0EdK+8TQaS4lNmzHH+jf/+g/y4jCU
 vZvbOqlBOSSxajflzWgnE86H1WeGhsmywVCFT0HTmpGEinY4KSafCunbT4Zmn3SnasS1
 cUztg/bfZJ4GNbNf0zS5eqCUpXSDgd0LoRojU+81ZSd5vLLQOn86kHF5ABIpU3pQSapN
 G6gd/DuK0CxXDvHgh11mt3ZcDSPKL3hkJw1chlxsBo7GAFG7xtzFXdt1VU7PeBLwKWMj
 5Lrg==
X-Gm-Message-State: AC+VfDy/P5hSBbZiphc5YkiSJk5L6atIuBbV4cHPGITIB9PEY2wYoj0/
 aaFyk5DKDTIGFKenYHyZ3GevHUa6Yjo=
X-Google-Smtp-Source: ACHHUZ5QP9sT1qh1d4aBp7RgMIgDyOGAk7FUHJNl89muDSUAiUfpQJy+p/f3pRgH/baCQCVFZ1NPDg==
X-Received: by 2002:a17:902:7b94:b0:1a6:7ed8:84f7 with SMTP id
 w20-20020a1709027b9400b001a67ed884f7mr15518527pll.20.1682959066600; 
 Mon, 01 May 2023 09:37:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170902988200b0019a7d58e595sm17988796plp.143.2023.05.01.09.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 09:37:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix submit error-path leaks
Date: Mon,  1 May 2023 09:37:35 -0700
Message-Id: <20230501163736.1599381-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
 open list <linux-kernel@vger.kernel.org>, pinkperfect2021@gmail.com,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For errors after msm_submitqueue_get(), we need to drop the submitqueue
reference.  Additionally after get_unused_fd() we need to drop the fd.
The ordering for dropping the queue lock and put_unused_fd() is not
important, so just move this all into out_post_unlock.

Reported-by: pinkperfect2021@gmail.com
Fixes: f0de40a131d9 drm/msm: ("Reorder lock vs submit alloc")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6c6aefaa72be..728983959ed5 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -767,27 +767,29 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
 
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			ret = out_fence_fd;
-			return ret;
+			goto out_post_unlock;
 		}
 	}
 
 	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
-	if (IS_ERR(submit))
-		return PTR_ERR(submit);
+	if (IS_ERR(submit)) {
+		ret = PTR_ERR(submit);
+		goto out_post_unlock;
+	}
 
 	trace_msm_gpu_submit(pid_nr(submit->pid), ring->id, submit->ident,
 		args->nr_bos, args->nr_cmds);
 
 	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		goto out_post_unlock;
 
 	if (args->flags & MSM_SUBMIT_SUDO)
 		submit->in_rb = true;
@@ -962,25 +964,27 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
 	                      submit->user_fence);
 
 
 out:
 	submit_cleanup(submit, !!ret);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
 out_unlock:
-	if (ret && (out_fence_fd >= 0))
-		put_unused_fd(out_fence_fd);
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	msm_gem_submit_put(submit);
+	if (ret && (out_fence_fd >= 0))
+		put_unused_fd(out_fence_fd);
+	if (submit)
+		msm_gem_submit_put(submit);
+	msm_submitqueue_put(queue);
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
 			kfree(post_deps[i].chain);
 			drm_syncobj_put(post_deps[i].syncobj);
 		}
 		kfree(post_deps);
 	}
 
 	if (!IS_ERR_OR_NULL(syncobjs_to_reset)) {
 		for (i = 0; i < args->nr_in_syncobjs; ++i) {
-- 
2.39.2

