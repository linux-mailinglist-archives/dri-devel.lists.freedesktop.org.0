Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E111D4A10
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5710D6EC50;
	Fri, 15 May 2020 09:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B1E6EC48
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h17so2775417wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NuyLRSf69UU50l4L98gC8To1wJQExKPi2eBLW+xIT7s=;
 b=RTFVJyxxJxnBsntgxFy/oa5MBo28yn0LCcKEzEODESN6A9Lw9PWXdQ6iIlMQ5YV+NE
 j2Bg+ptHdhvpFFfHnMe7t/SZFUGmd4Zb4le75Q8FpwXiNArFrSa23yIEqZ90tUxTP9Ym
 VZ/cTbW8eA9Slr2GzuUGcpQTi/N/GLIn1/Rw2g5IBZDCFa2awoUlYYfh3CFRD1YdC+Pk
 rOpkdplGqguJKMfUpMczNZk4GBmMaOPTKwAIbnIyCFUzcMwII2XDbnIYyiJPoBTPihxy
 BTVtRqXN6K+xeCGMB5ciISnAsTJqFt/JEjsPNpAzHShahDZ9Ai6nnzCCCgjAwHUvtwJ6
 V5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NuyLRSf69UU50l4L98gC8To1wJQExKPi2eBLW+xIT7s=;
 b=M4iYp8CxjnOrEiZH2jfexIv7BF3pQ6fIvVssxoQePXaOtad0qd8CoBm82dyWrdEmgE
 ltDSKyy2tacKrXyLLUx/iShRSYLcRMcosW9/81P16vzH0ap12BI5u+/xML4prCmjQO15
 r2BkpXt4wo6tiqyhUnUtAdMofuCE3vF3vzk+LZnwm44i90P67r7/RDMmZQ3HWYI/XLuL
 uEtic5cIREOAOLJYeFAgDjsfUIRI14Pe+U2n323hKpS11KPczjEbmV0yxK9+8uk7jqX3
 8EWpuo3LZuIpO/EMCzvLVtV5WZw+aKicHQM+pfL1n8HJ1fHLGih90YgVnCRkzs67Bwfj
 zz+A==
X-Gm-Message-State: AOAM5322fSlBcADhUR90X9RX9GSTRcsWTAm/nCOP+wcxe9mVZfH8wqUF
 sjNPIx5x0mk7zg4271H8c2RSrSkt
X-Google-Smtp-Source: ABdhPJyS0dmJKKbNtpVmKANzosmTZy5GMs+XmXVeUDB5m3fmVupuGCjTskEOOM3NMKiu9IwRQAulSQ==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr3293354wrv.15.1589536473102; 
 Fri, 15 May 2020 02:54:33 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:32 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 27/38] drm/panfrost: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:07 +0100
Message-Id: <20200515095118.2743122-28-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
