Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA191C9415
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC416EA19;
	Thu,  7 May 2020 15:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692996EA19
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z6so7251684wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aen5FWFPyQJCvyQUSIS41OAgv9vVWFBBpjB/BMydBlU=;
 b=E+uZB8BwKgOM2hjQrhAlAZ/lAnh5woZJ3NaCXXi8jguCwAx3cKqxaiv7dnSzf20g39
 qlwSPr0AjFi4igSa1RGPO0e0IhaT4Og0RY/YIO7s7RtrYV/q4UXil86b/KRAa0PGC/mL
 RLZYwzZVjriIXipK6Isq8LJNE52DxME/ZGAhUmXOSkBnt1op/tBq/uL0Qyi0NjhvQRkW
 0a16OH0lqRGurad3LPfM9nrwpO4/dcA4HeDmv2b5cbonHxq5aEvVmbwiaUgVB2ga0sj5
 8sGdqFyM/qO9yrnlmKtEJh+YAm5Klc5K3/+bBtMP6KvIz6OegAnaanCrv5MrxFW/IQic
 E1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aen5FWFPyQJCvyQUSIS41OAgv9vVWFBBpjB/BMydBlU=;
 b=H2RAdYhixAph/555JAieHULMrslhipiGu/4/5czMFJwnTAwduSMEXzZ1XdsCfp6wxJ
 Z/bx0S3Qej6E5qhfigdaF01c452gAXhMT5tm95UylKVISGzfjxu1U+Gk0sPHgnIIJCFl
 e9EEkWDzBxU4SQ6GSKXD/wtzSGTnUChvCNUlsHO1l0JJMEVEkkDrV0Yy5VzAuJpRPkGT
 ePm0+wPWeivP2BLPDAH8QHUx76gxZp+lQqGasZd8bvJXac3SiOpYVmYSaz7EkBAIDGEe
 5fyIBh1IzGUgtlwNswJ3MMpNpWRIvj1B8sF5Z9a1dFMEPQ8Iy9aZXLgc5vi1pWcw1hHa
 7yGg==
X-Gm-Message-State: AGi0PuYwK8c3OsJD9n+o48TML4R8rxyDgqbnFtBc23tkIt2LBdkZ3DB5
 9cx36sP+PsYekqgGoQNA9FmTMqmo
X-Google-Smtp-Source: APiQypKUmCDqoUigquPhoVWY+tlV6fzkgo6hoLoPQbQQTNAXnYRPgbAoPNt5ftqSMEtRWQzKXKWDkA==
X-Received: by 2002:a05:600c:2945:: with SMTP id
 n5mr10738472wmd.148.1588864295425; 
 Thu, 07 May 2020 08:11:35 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:34 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 32/36] drm/vgem: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:18 +0100
Message-Id: <20200507150822.114464-33-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Emil Velikov <emil.velikov@collabora.com>
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

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c   | 6 +++---
 drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index ec1a8ebb6f1b..e4dc7b267a0b 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -198,7 +198,7 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
 
 	ret = drm_gem_handle_create(file, &obj->base, handle);
 	if (ret) {
-		drm_gem_object_put_unlocked(&obj->base);
+		drm_gem_object_put(&obj->base);
 		return ERR_PTR(ret);
 	}
 
@@ -223,7 +223,7 @@ static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	args->size = gem_object->size;
 	args->pitch = pitch;
 
-	drm_gem_object_put_unlocked(gem_object);
+	drm_gem_object_put(gem_object);
 
 	DRM_DEBUG("Created object of size %llu\n", args->size);
 
@@ -251,7 +251,7 @@ static int vgem_gem_dumb_map(struct drm_file *file, struct drm_device *dev,
 
 	*offset = drm_vma_node_offset_addr(&obj->vma_node);
 unref:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 9268f6fc3f66..17f32f550dd9 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -182,7 +182,7 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 		dma_fence_put(fence);
 	}
 err:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
