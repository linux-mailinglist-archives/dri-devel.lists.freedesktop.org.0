Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02E585437
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 19:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D728E10E513;
	Fri, 29 Jul 2022 17:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329210E4F7;
 Fri, 29 Jul 2022 17:07:26 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso6130230pjq.4; 
 Fri, 29 Jul 2022 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mcGjaEjlp9E6N37UMib26cBF56AyQFK+2CInJ6FUTCo=;
 b=qHCdQY3WlD0nJ+rn80athOrlbowIL0rs8FhkpgPJ9TYkDkOSEweR4R8EDy0KurACP1
 n59UAWHzz6oBskR78bMIkTVPeug25bs4DvwgH6PBj6JwTR3BuZCKX4jZYxcJQRoTSsoB
 EO102Ezzrh4+I044jkXZiL02C9FLZRyslCHTMx1j1WtJYGMxqJIWdGY8gr6wHV6hs+T7
 1emmRtbUDGqpCaa7DIORSJRX219g92FvZ8cmIwneiVeIWpc4wZW2Z7p9R7lVfbzCTLBy
 8VhRaW2OrcTpPvbbwkahlviDe3eIT8o6pPpWjPeGvjaGn0HRkdBBpuWyjt1APQaq71VF
 sHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mcGjaEjlp9E6N37UMib26cBF56AyQFK+2CInJ6FUTCo=;
 b=Xg1y96Cux1eE0YX4EyDzlbkWwxbp0fkOOMKZGGCphxTBlZ4+wv/tJwtk9NROjTsHaP
 VTlyGzKSOXVUXzK7UE9PDRxfjVcYWJAozLTVfHoV+C6oMUXAQCBbXT1A+Xah64nhoSYK
 lA90O+BdZacbj+HxjFX1rQPzRdD4WKzDaXHjrs60BNs4fnsH/Eojesa3FBsP4t6SWugi
 Gy9eRGbTLIWeSX4i/wzX5dfB2QnImrt6rowpj19o7rggvm942iiqmSNAQZxqMK8UmxW+
 eXUESX1X97fXT4Wi+kzXrIhSoI3kwHijx37JdZ9MEIqTIa7wbK04ObjA39cJhEzka2z5
 pa2A==
X-Gm-Message-State: ACgBeo3E7kMxbji3ol3ZtYs3aZpe1+II9KI2MSIPQAlyr+tYdY2T8icL
 D5iwEzkKbsmtlpdDiLly8P7LIgvrGts=
X-Google-Smtp-Source: AA6agR7Ol2NVPUvGRtSIxjQvMtgte0Ibyz5jmLGwxyIAGSEGA6qUhCfnNE3RpvIl5YX2vO02JAWceg==
X-Received: by 2002:a17:90a:d155:b0:1f2:4741:3b74 with SMTP id
 t21-20020a17090ad15500b001f247413b74mr5710102pjw.201.1659114445182; 
 Fri, 29 Jul 2022 10:07:25 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a63fa52000000b0041a13b1d451sm2805355pgk.59.2022.07.29.10.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:07:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/prime: Add mmap_info support
Date: Fri, 29 Jul 2022 10:07:42 -0700
Message-Id: <20220729170744.1301044-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729170744.1301044-1-robdclark@gmail.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
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
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c       |  1 +
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem_prime.c | 11 +++++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1ca4a92ba96e..4979aa8187ec 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1044,6 +1044,7 @@ static const struct drm_driver msm_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 	.gem_prime_mmap     = msm_gem_prime_mmap,
+	.gem_prime_mmap_info= msm_gem_prime_mmap_info,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 7330d7b5de8e..b4ace34ec889 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -271,6 +271,7 @@ void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
 int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
+int msm_gem_prime_mmap_info(struct drm_gem_object *obj);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index c1d91863df05..2bacab7a1921 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <uapi/linux/dma-buf.h>
 
 #include <drm/drm_prime.h>
 
@@ -26,6 +27,16 @@ int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	return drm_gem_prime_mmap(obj, vma);
 }
 
+int msm_gem_prime_mmap_info(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	if (msm_obj->flags & MSM_BO_WC)
+		return DMA_BUF_VM_PROT_WC;
+
+	return DMA_BUF_VM_PROT_CACHED;
+}
+
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-- 
2.36.1

