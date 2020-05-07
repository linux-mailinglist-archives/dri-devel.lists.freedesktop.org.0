Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F291C940C
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91436EA0D;
	Thu,  7 May 2020 15:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEDD6EA0D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k1so6840485wrx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gNjSY24X/SoA2F6hirc9OY8ljk1h49sPzHEbhfzjTFM=;
 b=DDAh1SeydXLyltRwbrzBhcEHZagbQwy18byrhO16fCbFjAq1y38hhT+gC7Okg7cbsG
 1fGYI64qJVd6ig6JGe4GfDqjg/4qImsSli/nLdZPQHqK7/cdi7ZeA6PJK9zftJB0l04S
 foJTqeD/knVIXg1DEHUJDwX+2V+cg/fqL0T8vDH4/5r+mBK4zpsSUJBCnha2Dn7oehSb
 XPT/KNmmgCJrqT3F91tay73IrQXZeSUyXsP9S2tPyudn2M6v4I9KuD72CmydaUxMs/F5
 uPlqCuH6j4NU/gQx4p0/vztOYeAjNHl4vXKK9XuR+EPS0ZQys+3Vk+xFGZwZtL1kjiNe
 A7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gNjSY24X/SoA2F6hirc9OY8ljk1h49sPzHEbhfzjTFM=;
 b=TA7rNtg5NCUD8DZE/0jwSNkKxQo+tkzJvCtbZZGfMxMTgWFke+m7jhcL6CcFNrLQBE
 qrWcYMDjM5UA/DXIA9pqeqQpclDlwMN2h5eXHCvKBj3ID2SopqX6SE7APBZGri7qoUs9
 DMFs1QZ5ic1e/E71cnl3CAceF+RDZJFendBQ2OJ5KsS+QnfWadjzOOBBSlYDG8Q+1GW3
 eCu1vySYwH68BfQBDKRR6TPfzGDcExIFXejMvA5EKBbTSjUR9QsxI8FhfpwlC89AXi0r
 urhY5p+PvhFum2WeKo1z+5/XKVIGI30kT5rveWYg8r+1AJgRdEw017q/nBh9A/BlexfZ
 L+dw==
X-Gm-Message-State: AGi0PuaRDKovfeUaVLZGUudGuggZb+Dskkmx2s8lcSZDpPLNFtrZhXHB
 6HH+s03H3TaqpkPGKX7Qeg2X4+DM
X-Google-Smtp-Source: APiQypLfKWD9C9Dg7cYunqFewbeGefSltyJvXZ9I9lNWEcXFFkg10OMiMIhq/nfvpUHd3FWygB7cGg==
X-Received: by 2002:adf:fac4:: with SMTP id a4mr15071405wrs.134.1588864283091; 
 Thu, 07 May 2020 08:11:23 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:22 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 22/36] drm/msm: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:08 +0100
Message-Id: <20200507150822.114464-23-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  4 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c        |  2 +-
 drivers/gpu/drm/msm/msm_drv.c             |  6 +++---
 drivers/gpu/drm/msm/msm_fb.c              |  4 ++--
 drivers/gpu/drm/msm/msm_gem.c             | 12 ++++++------
 9 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 724024a2243a..ad41ff023a1a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -804,17 +804,17 @@ static void a5xx_destroy(struct msm_gpu *gpu)
 
 	if (a5xx_gpu->pm4_bo) {
 		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
-		drm_gem_object_put_unlocked(a5xx_gpu->pm4_bo);
+		drm_gem_object_put(a5xx_gpu->pm4_bo);
 	}
 
 	if (a5xx_gpu->pfp_bo) {
 		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
-		drm_gem_object_put_unlocked(a5xx_gpu->pfp_bo);
+		drm_gem_object_put(a5xx_gpu->pfp_bo);
 	}
 
 	if (a5xx_gpu->gpmu_bo) {
 		msm_gem_unpin_iova(a5xx_gpu->gpmu_bo, gpu->aspace);
-		drm_gem_object_put_unlocked(a5xx_gpu->gpmu_bo);
+		drm_gem_object_put(a5xx_gpu->gpmu_bo);
 	}
 
 	adreno_gpu_cleanup(adreno_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 68af24150de5..34b85aaec747 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -795,7 +795,7 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 
 	if (a6xx_gpu->sqe_bo) {
 		msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
-		drm_gem_object_put_unlocked(a6xx_gpu->sqe_bo);
+		drm_gem_object_put(a6xx_gpu->sqe_bo);
 	}
 
 	a6xx_gmu_remove(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index c9239b07fe4f..a0253297bc76 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -119,7 +119,7 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	struct msm_kms *kms = &mdp4_kms->base.base;
 
 	msm_gem_unpin_iova(val, kms->aspace);
-	drm_gem_object_put_unlocked(val);
+	drm_gem_object_put(val);
 }
 
 static void mdp4_crtc_destroy(struct drm_crtc *crtc)
@@ -452,7 +452,7 @@ static int mdp4_crtc_cursor_set(struct drm_crtc *crtc,
 	return 0;
 
 fail:
-	drm_gem_object_put_unlocked(cursor_bo);
+	drm_gem_object_put(cursor_bo);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index dda05436f716..243584d4b1d7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -165,7 +165,7 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 	if (mdp4_kms->blank_cursor_iova)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->aspace);
-	drm_gem_object_put_unlocked(mdp4_kms->blank_cursor_bo);
+	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
 	if (aspace) {
 		aspace->mmu->funcs->detach(aspace->mmu);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 998bef1190a3..ca3368c828d0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -166,7 +166,7 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	struct msm_kms *kms = &mdp5_kms->base.base;
 
 	msm_gem_unpin_iova(val, kms->aspace);
-	drm_gem_object_put_unlocked(val);
+	drm_gem_object_put(val);
 }
 
 static void mdp5_crtc_destroy(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 11ae5b8444c3..66ca0c009cfa 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1132,7 +1132,7 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
 		msm_gem_unpin_iova(msm_host->tx_gem_obj, priv->kms->aspace);
-		drm_gem_object_put_unlocked(msm_host->tx_gem_obj);
+		drm_gem_object_put(msm_host->tx_gem_obj);
 		msm_host->tx_gem_obj = NULL;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6baed5b43ea3..bc28df4eedeb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -757,7 +757,7 @@ static int msm_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
 
 	ret = msm_gem_cpu_prep(obj, args->op, &timeout);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -775,7 +775,7 @@ static int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
 
 	ret = msm_gem_cpu_fini(obj);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -867,7 +867,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		break;
 	}
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 37674e886e99..d42f0665359a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -123,7 +123,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 
 out_unref:
 	for (i = 0; i < n; i++)
-		drm_gem_object_put_unlocked(bos[i]);
+		drm_gem_object_put(bos[i]);
 	return ERR_PTR(ret);
 }
 
@@ -238,7 +238,7 @@ msm_alloc_stolen_fb(struct drm_device *dev, int w, int h, int p, uint32_t format
 		/* note: if fb creation failed, we can't rely on fb destroy
 		 * to unref the bo:
 		 */
-		drm_gem_object_put_unlocked(bo);
+		drm_gem_object_put(bo);
 		return ERR_CAST(fb);
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 8696c405f709..46e78993b69c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -543,7 +543,7 @@ int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 
 	*offset = msm_gem_mmap_offset(obj);
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 fail:
 	return ret;
@@ -970,7 +970,7 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
@@ -1089,7 +1089,7 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return ERR_PTR(ret);
 }
 
@@ -1149,7 +1149,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return ERR_PTR(ret);
 }
 
@@ -1185,7 +1185,7 @@ static void *_msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
 	if (locked)
 		drm_gem_object_put_locked(obj);
 	else
-		drm_gem_object_put_unlocked(obj);
+		drm_gem_object_put(obj);
 
 	return ERR_PTR(ret);
 
@@ -1217,7 +1217,7 @@ void msm_gem_kernel_put(struct drm_gem_object *bo,
 	if (locked)
 		drm_gem_object_put_locked(bo);
 	else
-		drm_gem_object_put_unlocked(bo);
+		drm_gem_object_put(bo);
 }
 
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
