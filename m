Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B5587F54
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3D19048F;
	Tue,  2 Aug 2022 15:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F18090430;
 Tue,  2 Aug 2022 15:51:22 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id r186so12684565pgr.2;
 Tue, 02 Aug 2022 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=QhffYyjcWnjYLPwBjsriZPzqgu1BVBqKuCmvl6T++1mJy47oPOFf0+O+nUMsJcr7k+
 iv6xi+pVebH6fO1Co6ZrG26mIE/wFc//uVYI3wTapnnRB0zoKv3giOauEVcR68HIDs6O
 iQZjnfU+B+MdeNbAT/HlqplnYniHOFBw1Dp3dwcG9dq/G9ig3u1AgaBDBA94SJoze+CU
 0Rbwl1sM+VC7Mo2Vz+ybyPmKzSok4oDvyGR+wYYEYd7IMdx+3/Vj8Nb2pbRO0/iD/0AX
 bWDjNV89jF6M2fU4zFsEeH6UaXCPfUKymx2zedVyMfylgaFlofvwUC3b5oMS+ryBIn0i
 +9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=5fFK+jT+Pf2+NY12W+jghu3UrZJw+0Cp5gVlsN7sQYdeOzYPul8urRrlmo5rNH0Lov
 yhDUI4rTN4DNGPriReR70o0avWDMHiNgVIceoSQeJgxTUl8FSEII9yyN0wfKEs4tK7x0
 P1a043gsdSTIjqTelgPvRBjYR4P0oErAr9+HuSKcsnoQvdxDVGsa6Cj+zpbNLzemENM3
 rZ4q7YBhcLnAtAASYtGuaCg7EK00gQPEg2rb6jCVlJXueSzy5CW8eOvkpthGR7Sd7iNy
 KrKz8ckNsgzyBk5Ciz9prAhM3VaAmNOdvkGD4oeQmI2KA7xvcrk7lQ6rR4s3QsPxqmfq
 7NkQ==
X-Gm-Message-State: ACgBeo1GVYTOn9JWo1S8RwdoiYfVefxqlxBbPtkUzX0xMKHsIddeT7mr
 wv3M8lMkEnrDOfgaRU6k6jmrBRxPr8I=
X-Google-Smtp-Source: AA6agR6rcDJDhvHJ166iKlgdxWV6djHRkq1yorJlZyS1sgkkWqCGcAl4IEbOloIhRp46PbcH+Fn4mQ==
X-Received: by 2002:a63:83c1:0:b0:41c:192e:68f2 with SMTP id
 h184-20020a6383c1000000b0041c192e68f2mr8179318pge.606.1659455481019; 
 Tue, 02 Aug 2022 08:51:21 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a17090a165000b001f334aa9170sm9537315pje.48.2022.08.02.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 01/15] drm/msm: Reorder lock vs submit alloc
Date: Tue,  2 Aug 2022 08:51:34 -0700
Message-Id: <20220802155152.1727594-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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

