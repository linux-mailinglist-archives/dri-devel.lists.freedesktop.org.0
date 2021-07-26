Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E717B3D5C62
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A85F6FBC0;
	Mon, 26 Jul 2021 14:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043B16E81F;
 Mon, 26 Jul 2021 14:56:47 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso11682194pjq.2; 
 Mon, 26 Jul 2021 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=U7csDx7myT7ZEpfOQWHAX021iKmpEkjKFYRgPfZgvKRBYy8LewJELViR3KSW8aeSq3
 S/5wnut7LOrYdI+sIC09WfQ/gPdSbi+7Xv2bziM63HyhVuv36dcqSmFEcng/xuGG8Scx
 6b/PBSEDgRON5lc+pMtOeGcRpamcn+uJ71pQYdZtyiB98EByuDMfnvr1RCfrQQBDe3yH
 pjtLbqQgjNDWgSgMMNUK+b2Px275M8XnQIZCHPcJXNK3akAhID3lg3R5N2O+GXozPD+P
 tpnuNpM6Cg5VdGPAadmE2wUEMHFv1wmJVuUXF1VdmUGpyEVeNxtGJkeWJxqB7Qly6RuS
 +4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=XcpqVTnzKfwExqVE7uFX11hUAc2FfZ0a15xNjI2SdjeQcg2y3yjmz5CDcYy7swD59s
 +X5+r8ylcBke6xXlDGQVxXOPKolK11i2Ml2bqyORUX//BEdN10p6QpY0zM9RBP2rRtpH
 otnVg+TdNrUAiqt6zfyhTA2rVXx4byu1uJPNnLsKWVNwNv2TEDowrVUdAQ1Ck/f8KZLF
 b2uN7jswP9oLsIQF6jf89dPz854Q+/gA2L1Ikv0Al4ATwJAShc9W5r8aCHJEDdS86OWV
 6Mf4TpND5vG9LIp0zRAYelbCJQVycYW9e2h7RDI24Y2Jzov+QV8vYFlN5TZ3KcAC6tEe
 /cMw==
X-Gm-Message-State: AOAM532c4/U17v+0jFDErqhQMDOQCg70oe5Sy3hjpLmh7Gl3C69eLBuO
 eeI5n7mH9cRzEWAOjIRmR8Xr7GWD2pFDOQ==
X-Google-Smtp-Source: ABdhPJwdeAVDE6ImTV58soarxRWvWOKUps/Kw+CEPEV7+viSnP4dluE7gXh3J6JGkb9liNBgRGiCog==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr9162113pjb.122.1627311405833; 
 Mon, 26 Jul 2021 07:56:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w23sm9425588pjn.16.2021.07.26.07.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/12] drm/msm/submit: Simplify out-fence-fd handling
Date: Mon, 26 Jul 2021 08:00:19 -0700
Message-Id: <20210726150038.2187631-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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

