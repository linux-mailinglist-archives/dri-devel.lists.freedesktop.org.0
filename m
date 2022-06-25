Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC455AD0E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD85310E480;
	Sat, 25 Jun 2022 22:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C0010E480;
 Sat, 25 Jun 2022 22:55:06 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id d14so5949476pjs.3;
 Sat, 25 Jun 2022 15:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=GQt6oqpuPd7BalfkhrFIglCcDVmBgoM6XHzayugipkCTfvQjl515fBlP39DiLFsur3
 myq2zbGCo76BxFBgnhNNAWh9mHReWt6+gRLJOGDl0qyn4cC22OPU/0ukSuEbdcCERIvU
 pcD+ozk7aOV683I80mko7pd+PgiPACsq69uFzBKmzjRDow6YdubYoI4OsfzmkFDbn2eg
 agBI1QNF1bpSGY6Im7LSONGB4a2NXBbWeCGLQ4et26B+ebhYghMLgduwJn+mqMkHkHO0
 J5mRSVf+bxzEFll7zA65xg6QVsR0eH43woejDQZu9mxDM2AtR5oNMeFCvG+h2Tj2KMZ5
 pQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=5DAMStQEr8chvmriUu23Yv5DOo3AGmqMGRw1XOY4Y01fX9/pE7QY1dwejIt3UJJG22
 3easoilZwEZX3vSYmV5BpbpAtBf8NrstslAyzknB5dohwWDLXzJLi1tyVzDjFKXVYUR2
 1sQsJ+lU/jIxKvY/FbHjiUuwzPYtL13lI0IXHlvNthvl4SjNUI64qL+ghHvtKeoFSQik
 w01ygTnN02iI6ILCZZJ6m54AQKJFXko3CrsykcPnVcWXLjyPq/8l0uE/OVxuWkeftk+f
 0gEkninzK6zbrUe8WzpKeNNN9ujnwjjkdujrSj8QZdjBiW3OIuyjhPz20UUgUErMlz98
 3eMg==
X-Gm-Message-State: AJIora+uZ0YMxsIjW8W5Q+rdCuiZZkILzYyzkn2vby0FvqV3Nr95z8El
 3xoGp+XBaOeoTKAUUD8VHX+qEfkFIQs=
X-Google-Smtp-Source: AGRyM1uZjrPT7IbukdgxEedllvo2flhBCmo451rTjSu6KE4nw1gjSM+UMs5lCcNWhxWhTir9koR+wQ==
X-Received: by 2002:a17:90b:1805:b0:1ed:1391:c8b7 with SMTP id
 lw5-20020a17090b180500b001ed1391c8b7mr12364162pjb.193.1656197705225; 
 Sat, 25 Jun 2022 15:55:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 w30-20020aa79a1e000000b005253bf1e4d0sm4152412pfj.24.2022.06.25.15.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/15] drm/msm: Reorder lock vs submit alloc
Date: Sat, 25 Jun 2022 15:54:38 -0700
Message-Id: <20220625225454.81039-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
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

This lets us drop the NORETRY.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c9e4aeb14f4a..b7c61a99d274 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -36,7 +36,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (sz > SIZE_MAX)
 		return ERR_PTR(-ENOMEM);
 
-	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	submit = kzalloc(sz, GFP_KERNEL);
 	if (!submit)
 		return ERR_PTR(-ENOMEM);
 
@@ -771,25 +771,21 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	ret = mutex_lock_interruptible(&queue->lock);
-	if (ret)
-		goto out_post_unlock;
-
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			ret = out_fence_fd;
-			goto out_unlock;
+			return ret;
 		}
 	}
 
-	submit = submit_create(dev, gpu, queue, args->nr_bos,
-		args->nr_cmds);
-	if (IS_ERR(submit)) {
-		ret = PTR_ERR(submit);
-		submit = NULL;
-		goto out_unlock;
-	}
+	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
+	if (IS_ERR(submit))
+		return PTR_ERR(submit);
+
+	ret = mutex_lock_interruptible(&queue->lock);
+	if (ret)
+		goto out_post_unlock;
 
 	submit->pid = pid;
 	submit->ident = submitid;
@@ -965,9 +961,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
 	mutex_unlock(&queue->lock);
+out_post_unlock:
 	if (submit)
 		msm_gem_submit_put(submit);
-out_post_unlock:
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
 			kfree(post_deps[i].chain);
-- 
2.36.1

