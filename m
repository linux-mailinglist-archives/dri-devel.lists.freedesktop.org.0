Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F12715818E7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1419E963AE;
	Tue, 26 Jul 2022 17:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDC89639C;
 Tue, 26 Jul 2022 17:50:18 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id x1so12239127plb.3;
 Tue, 26 Jul 2022 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=qKzbaVbj2FqDQNpoZXlQDXFmYvzhQt9kBkAgNM5HpdZcgiFRDhU0/4Qj7uc9AbTFzm
 LpCGdtiKh31TqhbhfY8oNi1QybojWeRNFmGtMP6QIMwLXqzlpFsCe1BrG5qPfoncZKJm
 FnWc7dWSDJpS4S1ulnwyyhO5mhakPmTr7k5oPC+ERKTlerG6uZ2yZzSsjxH4+YgytEAW
 zbF1LxjqA4Bu9u+OxhYGOpedTE4qXRHrzjgNt082tSsWNcCq1RE6R5qrLespsop+ifF+
 CN40MpZ4Cvh3bPohGU4kswtdTihEhHPKJENdXb1bhcyqMOadR3ND5J19VZCAFdJwTeq5
 pCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sMFYlUXA/wvNrdz6yghIiBT/tIS2Mu/kejgpgcpcUk=;
 b=MRqhnz+C0heww190TTsEgvaVVLeYYKqxskaRYEuqKEG97+1+CeeRiHm0g/ZYTIB648
 zXRUwc8x9E4anC1dh6+/B4nhOj2gffyXL+BVeZYX/MdMVwsESoFfLh7LrPj5YGus0OQb
 C1y9tK5Y4bJmTz14CELwN/a59b8u4+jbbMfduLRJdtR8HcEV9VaTvb3Ua798OEB2lUGj
 nMCkyhEzUG+fJUKkxID7+Np39Bnj1uxfxHGM0HoBw/ia64TfwnLcu2E6oMrvCnf5YgO6
 BhOy30p7wxocWW9fmjwPI4EvUtstEa4xcabSuN64n13UjFs9fdu15CYH2vNH1mqq05ng
 k1Eg==
X-Gm-Message-State: AJIora+IgoYh3WEz5WaWhLCLsf9XDC2hEcgtkzxquDBCnY13KgeGMtsT
 KaZ53s22bSZCL2+nckJsWrp9x3vUz80=
X-Google-Smtp-Source: AGRyM1sZDbuBr9wwnSiGFXCobcSa90BEIVqoUlk917vKZ8OD+txMCJFw3yYMZvIZ7BBOke9bm4mE4A==
X-Received: by 2002:a17:90b:3a8d:b0:1f2:bda7:da0d with SMTP id
 om13-20020a17090b3a8d00b001f2bda7da0dmr347806pjb.102.1658857817633; 
 Tue, 26 Jul 2022 10:50:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 lp6-20020a17090b4a8600b001f2173d897asm371289pjb.43.2022.07.26.10.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/15] drm/msm: Reorder lock vs submit alloc
Date: Tue, 26 Jul 2022 10:50:25 -0700
Message-Id: <20220726175043.1027731-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
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

