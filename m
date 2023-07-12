Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0457508A1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FC810E515;
	Wed, 12 Jul 2023 12:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659A10E515
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:47:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3142ee41fd2so6968867f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689166032; x=1691758032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePLEbc/ip+tHkl2r/nCDyk54NfZldvlti6WJpwpMVEQ=;
 b=Dh4H23dLQ6v1YH3/pcmhuKB2+1/xqdSxBgP11YhaBEfTOa6ALMT+CJsdzxWBw6MWpK
 cn4kFuvTHNfOYZaaY/BvAeV3OGhCCVDjRO/ihRn7zbl4MQwduI2Y+w+ONKCn0VSUNKv1
 D7fIIMAXjwHJf2iAbYsziSoW6cECIYJN5eyFw/5OVOKfslRKxv9B+Cp3iJla7uTSVI0L
 tfjfjSkqHw6XpDq6pohlmf8UJRLmPB1hod5n8/OHLCspoUREiBE0rUrESsIKZfmt+CpH
 YGiV9gQSITncV+17BODfG8puF1nxl5lS0/9WMYlBEj2k2U/EaaQ9VdmSC7n8nfnV6ItI
 Y+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166032; x=1691758032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePLEbc/ip+tHkl2r/nCDyk54NfZldvlti6WJpwpMVEQ=;
 b=YsFpRJOEhk32drcvrKm+wVu/+Z6tibivHHhVyuS5PIJncKVvBwepdPt/JekwJ+CbDI
 XQKu+hBB1KiqrrxJZoy4xeUDfrXSqK10etJmGQhYv+IaiUUS0mdocSZqfnm1446NdnSv
 95Jvw77mUB/9CasVkn+9M56SYr6wwQLlgtKTwfTkf1zmp9JlvAmK2ezF0CfjcWmIAMXS
 Z2mf1dObOvGKQ89bUEAORJbq6vXSGaIxR+KlFM1MD0uXgiGtlc17g5lYx/bKuXq/1X6/
 WUmgHynRDySuIPoshnrSFJ7tkm5at5o2G2Cn3d12udGtOQB2e8uDPTlMBH0R5uOWoYoK
 Bemg==
X-Gm-Message-State: ABy/qLYxhGbMx6ukX3QQwCFmiX2fPrBZBGSqO18PxhdbJuhz/7P/E7To
 dx1MvmDD3UmhirVBTuRoWhR7xxmWBtQ=
X-Google-Smtp-Source: APBJJlG6yA8cFjNOOPSisTLCh2181pgZ6/RyhhxTF+uCD9d4uyz0ZszfxsXI6vh7iMY5suH3uMzvyA==
X-Received: by 2002:adf:cc83:0:b0:313:e12d:b245 with SMTP id
 p3-20020adfcc83000000b00313e12db245mr17873659wrj.29.1689166031961; 
 Wed, 12 Jul 2023 05:47:11 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:4100:d4c4:2bb7:77d6:6d86])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0031424950a99sm4989225wrm.81.2023.07.12.05.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:47:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/v3d: switch to using drm_exec
Date: Wed, 12 Jul 2023 14:47:03 +0200
Message-Id: <20230712124704.333004-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712124704.333004-1-christian.koenig@amd.com>
References: <20230712124704.333004-1-christian.koenig@amd.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 44 ++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 2e94ce788c71..190e2a9f64a4 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -10,6 +10,7 @@
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/v3d_drm.h>
@@ -249,20 +250,17 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
  * to v3d, so we don't attach dma-buf fences to them.
  */
 static int
-v3d_lock_bo_reservations(struct v3d_job *job,
-			 struct ww_acquire_ctx *acquire_ctx)
+v3d_lock_bo_reservations(struct v3d_job *job, struct drm_exec *exec)
 {
 	int i, ret;
 
-	ret = drm_gem_lock_reservations(job->bo, job->bo_count, acquire_ctx);
+	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(exec)
+		ret = drm_exec_prepare_array(exec, job->bo, job->bo_count, 1);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < job->bo_count; i++) {
-		ret = dma_resv_reserve_fences(job->bo[i]->resv, 1);
-		if (ret)
-			goto fail;
-
 		ret = drm_sched_job_add_implicit_dependencies(&job->base,
 							      job->bo[i], true);
 		if (ret)
@@ -272,7 +270,7 @@ v3d_lock_bo_reservations(struct v3d_job *job,
 	return 0;
 
 fail:
-	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
+	drm_exec_fini(exec);
 	return ret;
 }
 
@@ -477,7 +475,7 @@ v3d_push_job(struct v3d_job *job)
 static void
 v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
 					 struct v3d_job *job,
-					 struct ww_acquire_ctx *acquire_ctx,
+					 struct drm_exec *exec,
 					 u32 out_sync,
 					 struct v3d_submit_ext *se,
 					 struct dma_fence *done_fence)
@@ -492,7 +490,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
 				   DMA_RESV_USAGE_WRITE);
 	}
 
-	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
+	drm_exec_fini(exec);
 
 	/* Update the return sync object for the job */
 	/* If it only supports a single signal semaphore*/
@@ -669,7 +667,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	struct v3d_render_job *render = NULL;
 	struct v3d_job *clean_job = NULL;
 	struct v3d_job *last_job;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret = 0;
 
 	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
@@ -731,7 +729,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto fail;
 
-	ret = v3d_lock_bo_reservations(last_job, &acquire_ctx);
+	ret = v3d_lock_bo_reservations(last_job, &exec);
 	if (ret)
 		goto fail;
 
@@ -775,7 +773,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
 						 last_job,
-						 &acquire_ctx,
+						 &exec,
 						 args->out_sync,
 						 &se,
 						 last_job->done_fence);
@@ -791,8 +789,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 fail_unreserve:
 	mutex_unlock(&v3d->sched_lock);
 fail_perfmon:
-	drm_gem_unlock_reservations(last_job->bo,
-				    last_job->bo_count, &acquire_ctx);
+	drm_exec_fini(&exec);
 fail:
 	v3d_job_cleanup((void *)bin);
 	v3d_job_cleanup((void *)render);
@@ -819,7 +816,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	struct drm_v3d_submit_tfu *args = data;
 	struct v3d_submit_ext se = {0};
 	struct v3d_tfu_job *job = NULL;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret = 0;
 
 	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
@@ -870,7 +867,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 		job->base.bo[job->base.bo_count] = bo;
 	}
 
-	ret = v3d_lock_bo_reservations(&job->base, &acquire_ctx);
+	ret = v3d_lock_bo_reservations(&job->base, &exec);
 	if (ret)
 		goto fail;
 
@@ -879,7 +876,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	mutex_unlock(&v3d->sched_lock);
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
-						 &job->base, &acquire_ctx,
+						 &job->base, &exec,
 						 args->out_sync,
 						 &se,
 						 job->base.done_fence);
@@ -914,7 +911,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	struct v3d_submit_ext se = {0};
 	struct v3d_csd_job *job = NULL;
 	struct v3d_job *clean_job = NULL;
-	struct ww_acquire_ctx acquire_ctx;
+	struct drm_exec exec;
 	int ret;
 
 	trace_v3d_submit_csd_ioctl(&v3d->drm, args->cfg[5], args->cfg[6]);
@@ -957,7 +954,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto fail;
 
-	ret = v3d_lock_bo_reservations(clean_job, &acquire_ctx);
+	ret = v3d_lock_bo_reservations(clean_job, &exec);
 	if (ret)
 		goto fail;
 
@@ -983,7 +980,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 
 	v3d_attach_fences_and_unlock_reservation(file_priv,
 						 clean_job,
-						 &acquire_ctx,
+						 &exec,
 						 args->out_sync,
 						 &se,
 						 clean_job->done_fence);
@@ -996,8 +993,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 fail_unreserve:
 	mutex_unlock(&v3d->sched_lock);
 fail_perfmon:
-	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
-				    &acquire_ctx);
+	drm_exec_fini(&exec);
 fail:
 	v3d_job_cleanup((void *)job);
 	v3d_job_cleanup(clean_job);
-- 
2.34.1

