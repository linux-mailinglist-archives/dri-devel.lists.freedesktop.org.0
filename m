Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A63F849F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58786E59D;
	Thu, 26 Aug 2021 09:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7846E598
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:33:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id g138so1406223wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JJwF0PYPmqolDQLzp/yyP0Yq0kNRDALRe2iRCTul0qQ=;
 b=SH0mRD4lFXjf5zfnArdRmdr/H92IkTiRG83+lu46nthRk6g7hsBLFtgm+PlV987nZb
 8qS0NSbfSQEVvJHrd9UuRQQZyRYMk9Om3DXftZgrjCWaMM58LLL7moZvaOPhHV2P6OQY
 zlQ0dHofnwILHwlhcoYEc4vFcvIjxdR6txsQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JJwF0PYPmqolDQLzp/yyP0Yq0kNRDALRe2iRCTul0qQ=;
 b=RvBEYoTmwY1vKjMKlEqg+dMLsQkNUDMXDIaCOK7nYnTvRkcCYfzB+nYhF8Rj+lRDCN
 hwzH4e7pqwsN5tycjY9AwAfMat2WmLp3lbytk5WcIObDQ4MuEOZSnszTz4smdvJUFsQC
 YCcsSR71LaAI0UbCnng7KNS7FMNNqkyKZZcXtEFFJ0SiNe2UoRvIEHgH3Cf10uo0pvZx
 qjuEFYMGPuRtvr4DvcnIpduTZqBACQt913Zp2BOKtl6pWdaA8d3UP5mcTSyjEhY4xL6d
 IMi9HKgKMFAuQ0aEeXnC+NV7Jg1AIWwEvmrDeLZD04TWlEWt83jult7IrOF+rDm3TKRH
 z3iA==
X-Gm-Message-State: AOAM532az9uGNe4FBmxesW46lG8iux++xgnUTw0NqQiU0LApF9vEDd8X
 oJpqND5njZTiVb2V+loYA7G2OZqnVnmCpg==
X-Google-Smtp-Source: ABdhPJzc23DuJoTC8nNJ25VQNbiKhhUYQ5XEsHa4ESe0XB/c1un0JqfR7O83A2HYXCq/etCBggdOqg==
X-Received: by 2002:a05:600c:1d27:: with SMTP id
 l39mr2677127wms.146.1629970420205; 
 Thu, 26 Aug 2021 02:33:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm2088220wmp.1.2021.08.26.02.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:33:39 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Improve drm/sched point of no return rules
Date: Thu, 26 Aug 2021 11:33:34 +0200
Message-Id: <20210826093334.1117944-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817085308.3557257-1-daniel.vetter@ffwll.ch>
References: <20210817085308.3557257-1-daniel.vetter@ffwll.ch>
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
drivers really should submit a job. I've split that up, which allows
us to fix this issue pretty easily.

Only thing we have to take care of is to not skip to error paths after
that. Other drivers do this the same for out-fence and similar things.

v2: It's not really a bugfix, just an improvement, since all
drm_sched_job_arm does is reserve the fence number. And gaps should be
fine, as long as the drm_sched_job doesn't escape anywhere at all.

For robustness it's still better to align with other drivers here and
not bail out after job_arm().

v3: I misplaced drm_sched_job_arm by _one_ line! Thanks to Rob for
testing and debug help.

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
 drivers/gpu/drm/msm/msm_gem_submit.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 4d1c4d5f6a2a..71b8c8f752a3 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	drm_sched_job_arm(&job->base);
-
 	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
 
 	kref_init(&submit->ref);
@@ -880,6 +878,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->nr_cmds = i;
 
+	drm_sched_job_arm(&submit->base);
+
 	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
 
 	/*
@@ -891,17 +891,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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

