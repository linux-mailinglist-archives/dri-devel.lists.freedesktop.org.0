Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D48586F3F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D411F8B8D5;
	Mon,  1 Aug 2022 17:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCE210FFBA;
 Mon,  1 Aug 2022 17:04:38 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id f65so10206169pgc.12;
 Mon, 01 Aug 2022 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mcGjaEjlp9E6N37UMib26cBF56AyQFK+2CInJ6FUTCo=;
 b=kyyjaNp7woKcXT7K+n3fQlDF5rurTZ1cFbBnUazT8LphCUB8Uunsdp08fL8++XY2um
 qb1LS7PccKyWz0vzjzjNpvlrRmU8E0YxTMjoBsqnK93APqh93yZiOi1E31OHdKCN2E5S
 2Bha/UZLOERNo8HHII25RrcN8NLrxzdPTQARsRVBoJCYd45cndns0/Iv/28i+nNkJjc0
 JpbO3XGDCiRSWLri0EY8pCKOQrtrOdxG0f9Mk0TciXDMpON3bZ6TEAdvHjlZ9l3Dfbsw
 D09IZeer2fLxvoLbGWAZZ0i30jGrtTQnx5m2C3Xhila4KMIUpX2NxB2ppfssLU6hWKhZ
 DxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mcGjaEjlp9E6N37UMib26cBF56AyQFK+2CInJ6FUTCo=;
 b=fy4iEqejKMdrfZY6uNoEn4lj0e8SK17kgTLDpUnIllGRHdbWoINNxm17QdSGpEZ+J3
 UYezEDV4zn7TrEwZ44J1QeTRPlJ+eEFSUE0EcMzYVy4NoiPx4XgRMQG3JGPcZRSJ+w3B
 6zY05JaELnd6+BdFtNPKoTl3YqrBeqhutc93+NKmrjgU26Dr68MD7/S9TZDpp8JoA2Z2
 jDjfdPN/jvXsoHXH8+5qhwkUqc2Jj9i+GDixG70Jm0HrP6kUQeThJPLe4/Ss748Ez+HK
 zkfdJLf5vYNxVWvf8KUryQ2uxlbjYL+5hgGmxWHu6EigjTlMXqk5hosppkab9HeGUk7q
 uBAA==
X-Gm-Message-State: ACgBeo1m2iJtRxVlHdvIXBNml+FpsaZgIt8Oji2FSAQ5+dFVZeL8YPSO
 nxL2T9CW0PNOGPKF/kTcsrcOwIqMO1Y=
X-Google-Smtp-Source: AA6agR7dVYfLrOR+qbczsM1EP90s8etc+W7B7ocadHOyqNO+TOxE1IUloB81XTDszRpVmSoiTlEyiA==
X-Received: by 2002:a05:6a00:996:b0:52d:170f:c7ca with SMTP id
 u22-20020a056a00099600b0052d170fc7camr11462141pfg.86.1659373476856; 
 Mon, 01 Aug 2022 10:04:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a17090a9f8800b001f2ef2f9c6fsm9041018pjp.56.2022.08.01.10.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:04:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/prime: Add mmap_info support
Date: Mon,  1 Aug 2022 10:04:57 -0700
Message-Id: <20220801170459.1593706-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220801170459.1593706-1-robdclark@gmail.com>
References: <20220801170459.1593706-1-robdclark@gmail.com>
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

