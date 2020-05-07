Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5A1C940E
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2BD6EA14;
	Thu,  7 May 2020 15:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EDF6EA11
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y24so7259390wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MYRgMh7HCgvRYtD4X7j4P8mByLwMEZ047odea/PArN8=;
 b=rJhul2Tu8e79svpmplsHmhIZVERkNcWRiC11Y6ah2baNag0j8/yjZC8P0PE2D9bKd9
 jEwWLDhIohK6xR9ydttGYVA5+IivLW6JPvorSHS3enVJ68wDbLvum9XDB0rKzIhPwahD
 QbvkPC66lw2xhYvuvXfvZsNz7w4swuXmMCEg7a18OxDNliNTskkdmWTl2QQ/QTihxk8x
 EIWkQGElkS/oBMKjcHukwMUJLYen5yJaagcHKve5kjGwO38dzH6xhlCAnsR3yikL1+TR
 R+IlS1/9+YWc1bRH5AAGlKDox9tQVSbMzXC7JF4vYOpg+ntfpj5m/YuVlkN7USEENLnY
 EcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MYRgMh7HCgvRYtD4X7j4P8mByLwMEZ047odea/PArN8=;
 b=h5WW98os7llkT1PcoCwCP5y5hTQd6axOefLZ5ENYRGf04g8GKCRPUjOKHbeQpCzjvF
 2gNeNJNdX+q52P8L8q2OqKYjAX10XppOxiDwGvbmDdVIkcbQdxMk2Hkn0r3ZFD+U2hBo
 hnaIlk4n57SajZWZa8fhs4bLrz4lyn32dtq/V+BtaSiYboeaDvQEe4YyHYTx3NfjR+35
 qVf7f51rVw37cjvYwp37+xpajWu1eSGIS8xFMtbdWuM9/FITkHQTmWv8jqe32fPzb8Cd
 idaukBTLf2Gfpf3rtv7DjPGu41/neWE2xVWQO0KyC/QeIh1oL9+SfrN4evC1VM+TkcDl
 8pVw==
X-Gm-Message-State: AGi0PuaYGnTpDN2bDQXp17SVMSMHyHeTWPbKqlwrCNkdBEka1hqEKIZh
 HLHnUJy2ahp4U/9qnEfGAZeH176E
X-Google-Smtp-Source: APiQypIyF7gW5uiocbO1KnmnTzfNh8tsYZNQWv5HHCJrK+more1xVLc9slJggj/TFVcXsimfhxR5ew==
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr10255171wmj.113.1588864287262; 
 Thu, 07 May 2020 08:11:27 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:26 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/36] drm/panfrost: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:11 +0100
Message-Id: <20200507150822.114464-26-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>
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

Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 10 +++++-----
 drivers/gpu/drm/panfrost/panfrost_gem.c     |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_job.c     |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c     |  2 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 882fecc33fdb..ada51df9a7a3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -99,7 +99,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 
 	mapping = panfrost_gem_mapping_get(bo, priv);
 	if (!mapping) {
-		drm_gem_object_put_unlocked(&bo->base.base);
+		drm_gem_object_put(&bo->base.base);
 		return -EINVAL;
 	}
 
@@ -317,7 +317,7 @@ panfrost_ioctl_wait_bo(struct drm_device *dev, void *data,
 	if (!ret)
 		ret = timeout ? -ETIMEDOUT : -EBUSY;
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	return ret;
 }
@@ -351,7 +351,7 @@ static int panfrost_ioctl_mmap_bo(struct drm_device *dev, void *data,
 		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
 
 out:
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 	return ret;
 }
 
@@ -372,7 +372,7 @@ static int panfrost_ioctl_get_bo_offset(struct drm_device *dev, void *data,
 	bo = to_panfrost_bo(gem_obj);
 
 	mapping = panfrost_gem_mapping_get(bo, priv);
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	if (!mapping)
 		return -EINVAL;
@@ -438,7 +438,7 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 	mutex_unlock(&bo->mappings.lock);
 	mutex_unlock(&pfdev->shrinker_lock);
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 17b654e1eb94..ac5d0aa80276 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -93,7 +93,7 @@ static void panfrost_gem_mapping_release(struct kref *kref)
 	mapping = container_of(kref, struct panfrost_gem_mapping, refcount);
 
 	panfrost_gem_teardown_mapping(mapping);
-	drm_gem_object_put_unlocked(&mapping->obj->base.base);
+	drm_gem_object_put(&mapping->obj->base.base);
 	kfree(mapping);
 }
 
@@ -261,7 +261,7 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
 	 */
 	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put_unlocked(&shmem->base);
+	drm_gem_object_put(&shmem->base);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7914b1570841..b2f09c038d35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -281,7 +281,7 @@ static void panfrost_job_cleanup(struct kref *ref)
 
 	if (job->bos) {
 		for (i = 0; i < job->bo_count; i++)
-			drm_gem_object_put_unlocked(job->bos[i]);
+			drm_gem_object_put(job->bos[i]);
 
 		kvfree(job->bos);
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index ed28aeba6d59..0a339c6fbfaa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -538,7 +538,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 err_pages:
 	drm_gem_shmem_put_pages(&bo->base);
 err_bo:
-	drm_gem_object_put_unlocked(&bo->base.base);
+	drm_gem_object_put(&bo->base.base);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 6913578d5aa7..ec4695cf3caf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -156,7 +156,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0xffffffff);
 
 	/* The BO ref is retained by the mapping. */
-	drm_gem_object_put_unlocked(&bo->base);
+	drm_gem_object_put(&bo->base);
 
 	return 0;
 
@@ -167,7 +167,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 err_close_bo:
 	panfrost_gem_close(&bo->base, file_priv);
 err_put_bo:
-	drm_gem_object_put_unlocked(&bo->base);
+	drm_gem_object_put(&bo->base);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
