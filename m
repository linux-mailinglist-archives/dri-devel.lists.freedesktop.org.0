Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2C3CC621
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4D76EACE;
	Sat, 17 Jul 2021 20:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C886EAC4;
 Sat, 17 Jul 2021 20:25:37 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id m83so12454896pfd.0;
 Sat, 17 Jul 2021 13:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gmuykjEPKDqTuNvlNMK4nEJJv2DOZACTKUl13m6imU=;
 b=vgGelrggP7hv02LjbY6rkPLS7Zy/Vh80xhC2sLr/AAFsiC+5BC4CE6X7n/dcfGlAxq
 nN/nCVRthT0BX2R19SA7Gj6DJFPqoKz6XiiAxlsh7gkN7Fw1Mar7gDf9gaLdiys5JDzz
 yw71SFb3exs4b8p0/SP/Fe5OjiZAyp1KPiWWxJrR86eSRLiVA4wfdkUqKS604NK5du83
 gPl4aVi360zvPFDPh8bXayTAt9owPb3iQdjGvPi8lJLkXxhFsAoylASSAePCmRRY7LrM
 x5/ikKJuLcew6JG5Tf+Fa+mi5nRIuR0WAJvGQLU2J+XDC74vQZL/c9auNjIsnmfDdxaU
 usQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gmuykjEPKDqTuNvlNMK4nEJJv2DOZACTKUl13m6imU=;
 b=ZPNQK6j/E3CrUZY6Q4n2/96tYD4vjd2WSYQi6N8CEOvCOOXnDj7jz2V49XenE414vO
 RVg7cZN1OeabPvlGAd0873ttQV1ZVTjV5igglXZXyPXjqZkoy87kIRJb1xSAYULE2bnG
 5GA4mVAY0Zr90+momOuQc6ZEkptLiqp72MvspuNkLY8kuJpKiqg3/55MRN96ISU2Vj1b
 jg/n2ppbNTGIZ5B5nrHWMTL+nh2T3HSfcfL7pW08Q0aWywlDwTuJ3Qcl0l0WUz1DPQsv
 kGWWjHvuJLNkwFq5OgkAAMo6VLuTJplLJDTBSralGJz1Qc7w4gR4bBbYSg9OrhF7i+14
 cs3g==
X-Gm-Message-State: AOAM532QAxnnGT7pVfi5qOpXWaDC62CYu39xknJxgimqaNYmJzwquSzE
 4sIq80Lvx3Df4wZ9RsN3Jl5W5IbMFzGs4Q==
X-Google-Smtp-Source: ABdhPJw6oESDC4zy/M+5LFccYFBswnhh9eNEod8Gejd/Q9XDyWIz30frNTaMSPj+BylQYcUMtmdasA==
X-Received: by 2002:a63:cf02:: with SMTP id j2mr16508180pgg.411.1626553536314; 
 Sat, 17 Jul 2021 13:25:36 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b19sm11760137pjh.29.2021.07.17.13.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/11] drm/msm/submit: Simplify out-fence-fd handling
Date: Sat, 17 Jul 2021 13:29:07 -0700
Message-Id: <20210717202924.987514-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No need for this to be split in two parts.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e789f68d5be1..8abd743adfb0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -645,7 +645,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_file_private *ctx = file->driver_priv;
 	struct msm_gem_submit *submit;
 	struct msm_gpu *gpu = priv->gpu;
-	struct sync_file *sync_file = NULL;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
@@ -824,22 +823,19 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		sync_file = sync_file_create(submit->fence);
+		struct sync_file *sync_file = sync_file_create(submit->fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 			goto out;
 		}
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	msm_gpu_submit(gpu, submit);
 
 	args->fence = submit->fence->seqno;
 
-	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		fd_install(out_fence_fd, sync_file->file);
-		args->fence_fd = out_fence_fd;
-	}
-
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
 	                      submit->fence);
-- 
2.31.1

