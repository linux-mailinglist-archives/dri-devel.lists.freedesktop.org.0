Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE023E1304
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238E06E7DD;
	Thu,  5 Aug 2021 10:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B63889CAA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id u3so8836719ejz.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fC/EAmoj6YexJw+zPVjashZb7GDaw/COXBU45GjF9Ac=;
 b=MN7pbspksKz10+81FOE3trN/U5sKbSIBPH7em0ZCBOj/Y1FzkXL1oYP/m8hSgC/132
 stq2YNlrRF41DaZysPl4dRPUjIH16W2Kl3Uyc6cwU3DrqbIjIVP7HlacdsCVVWN1XWLw
 YgbImO5uWh3ZFshuZvS6R/f3wVt87ST5bsQpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fC/EAmoj6YexJw+zPVjashZb7GDaw/COXBU45GjF9Ac=;
 b=gfVHl+V/2yOIeeG3f0Ks5+fBZZaDoz68vtQqPaHh18L03ic+8FKXKSqmTnkv3mO+L2
 4Qn3xV2UlQfa0zY5Z0+Rs0obC772nSqMtcOR9+6G+wwvypqm2auKE4fioSUCHScLXWlW
 NVjoByLNp+GqBcSSBZF/xxGBOiWDMLpNMfgp/E1kuq9wkIFCY/KKdrE0rSI5ckTvMiwV
 ub/Uo8SQ8qx+DsmhdlwZFy2lEmAWvr/SUOixxC98PJ7ZyBTqG9NpNTGm9HJhVDVhc0Z8
 JIKVuyzyQjC+DFiNWRbpfmPm+Pz7s26ahpikPqCvpJdVhwqEc0TGtVxgc9ci+abBQNlq
 Ry+w==
X-Gm-Message-State: AOAM532ddKRCRyGXx14KvIJSj88+Ec0mtecBCLd4oZH/7LuVf9Sps0BE
 ZwcntTspZoxAnqQfHJpuFyKG0TvD4Pbeyw==
X-Google-Smtp-Source: ABdhPJz9+W0Fd6alFYJWyAtXBHgsmGsOmeCTZqJWknvhpiCuNjZkNlKXpji5qpwaK4jjI6WcoH07RA==
X-Received: by 2002:a17:906:e24d:: with SMTP id
 gq13mr4168565ejb.466.1628160432643; 
 Thu, 05 Aug 2021 03:47:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
Date: Thu,  5 Aug 2021 12:46:47 +0200
Message-Id: <20210805104705.862416-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally drm_sched_job_init was the point of no return, after which
drivers must submit a job. I've split that up, which allows us to fix
this issue pretty easily.

Only thing we have to take care of is to not skip to error paths after
that. Other drivers do this the same for out-fence and similar things.

Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6d6c44f0e1f3..d0ed4ddc509e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	/* FIXME: this is way too early */
-	drm_sched_job_arm(&job->base);
-
 	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
 
 	kref_init(&submit->ref);
@@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
+	/* point of no return, we _have_ to submit no matter what */
+	drm_sched_job_arm(&submit->base);
+
 	/*
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
 	 * to the underlying fence.
@@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
-		goto out;
 	}
 
-	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
+	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		struct sync_file *sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
-			goto out;
+		} else {
+			fd_install(out_fence_fd, sync_file->file);
+			args->fence_fd = out_fence_fd;
 		}
-		fd_install(out_fence_fd, sync_file->file);
-		args->fence_fd = out_fence_fd;
 	}
 
 	submit_attach_object_fences(submit);
-- 
2.32.0

