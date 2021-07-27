Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5C3D7BAC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1D66EB50;
	Tue, 27 Jul 2021 17:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BB06EC04;
 Tue, 27 Jul 2021 17:07:53 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id i10so13405259pla.3;
 Tue, 27 Jul 2021 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=qM+kZpi9SzpMlfF5XdH/NMi6DyzaUdUHpl9sco5xUba+VFcS4KYci7YRRaOqcQN+h3
 uonT/YAn1exFX6ZjvUxuD6gmHNd7b+di0IFVmdCvqjIQI+9uSq2zZONFXwWUx7A2muOv
 CpHES18u/KTRchuAdinBBat33dh4PM6SuAveBlBv26fb5hvx2xkDn2iOX3TDFEu5Wkm9
 T0JwxlGCR9pMu3cRdSIhfA9DnzTeiW6ykCudJJ9wTAF0KSCGzw5QKf3Pv+ebTlp2B+v8
 UBvcpVzXJHuEEKxc42k8/K70NePsigKVJY3UkRN7WJ7xXpi4doAlOK3klM1k3aQc05IP
 S3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=FiuNaNsT7UlwEIO2bi5eLJrotv/5hI9C+1LHNZqds42RRkIRnMh4RHFuJL9ieMk7MH
 uRqbjClAp7auLao0L/iWZOIdqsrqrLT/PdHZJJqyi+8XoG64a0mPwOuJuIYER0JTvkQa
 45bflU/NrvVx0V0A0273TkPlkq0NVO6Edehd0YQN3bTW0E/rHdFlYAGLCGyBNVl7yZVu
 6Ahje3oumNXPT2VVsxtjaLssp8Vn7lwKqKY+wYGsI2emRn93dIJvXIQuNw2McBVy/9Xe
 UhqGHRUndWT+54sd3ghjNzesNc0CVRMuw6ckHdIfYRhlDwiLxJeaGD/Ju01TAk8P62fq
 H6SQ==
X-Gm-Message-State: AOAM531Py6T0FCsC3mnlRTRns3VW3D50wo4Klglb3DwUkf5Kfa56QOW6
 N+2hmy6DUVLuNCQpkS4xZhacMTskEklSEQ==
X-Google-Smtp-Source: ABdhPJxNgDmPhZv3Hv7xiNtgu3We5vnTCWwGPRckpJYr1C26pBGwzER7vvYTjXDnRFWp5ihgMkcQGg==
X-Received: by 2002:a17:902:9a41:b029:12b:8e55:d2b1 with SMTP id
 x1-20020a1709029a41b029012b8e55d2b1mr19549699plv.78.1627405672080; 
 Tue, 27 Jul 2021 10:07:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id a4sm4517227pfk.5.2021.07.27.10.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/13] drm/msm/submit: Simplify out-fence-fd handling
Date: Tue, 27 Jul 2021 10:11:21 -0700
Message-Id: <20210727171143.2549475-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No need for this to be split in two parts.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
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

