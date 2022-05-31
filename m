Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C95397C7
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0B010E0FD;
	Tue, 31 May 2022 20:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A5910E00C;
 Tue, 31 May 2022 20:08:50 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so3323444pjt.4; 
 Tue, 31 May 2022 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIlTvNQCOLyj5QYBgLjFuJKAi3jXSDwMPRUpJqRAlyI=;
 b=V47/nwt1rg0trFoHkq1rcjJntJUe53RkSjuHjspR9T338P3kjd1OIeyyLjqMMUuo3Q
 iPzDz6rIP1uHRlbwK6q2C4Faj4tCr7BmFFc5zJFq6Ihp87BiZ7TCfgL6NUpaYCnz5mBC
 FfbI/rm0VTDhHVfBHCDOyqgEnUetYgsW320wmS621UQ7IjegQhqSzzv0t0ody3l4/RCc
 +2G8wYqR9UAsB6J8TGIoGcHvui7lLaLiChc1DyqKtNtYDCOsGao1iI7Ja5UrzHXCPZR3
 DqL25Zn+axwwRSC/eJCH7IQu3sTWz4rPgUIMas5x39g3DbYY5MGt8pAvZBV2VCryM4Bb
 yNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIlTvNQCOLyj5QYBgLjFuJKAi3jXSDwMPRUpJqRAlyI=;
 b=2hL1GciT7VFHfkaXAUsrEq0pl+WJ5B/CV/Gy196g7UIDjx3v/CnJN+TXvYKxyLCLTd
 EX7jtvn3hqDFMgEO3WHPRv3TMhnpMxUB8yuTsInOG+iBxcvefeocKJ9J9DbKNGTnzt4B
 //Sl7x3RUFpc97URLrZqa0okwVtElhzPVH3Gud56zx661MbwklOThWoW5wfHKzhex3Ik
 9LdCZnkmlmOnI0/yWqJFx/DlDHr5B4LKk6J2Pu4zCsqe2io+f1xOx+Nc/iiUCP+k7dLj
 YyGhMbaTljHAJmW3BN5qPpY5IxVWgzVnfO0kqrWgu1F77hxZJAVmURqXgdlwgUjdaP54
 CJAw==
X-Gm-Message-State: AOAM532x+IaNSj4T25KoPSSrfjmSEBaKgrrOLB12ncYodDu6IMAavamM
 FLTPehnZsuituH3VSKU7M8RlkmlX1PA=
X-Google-Smtp-Source: ABdhPJzstetsR+Bwh6vbo+RGs7C4Ljt6yWFL0Fym5keJ831UNf5WjeyP55xY+H/RquR5Wk7AiL/zdg==
X-Received: by 2002:a17:902:f789:b0:163:935d:aa69 with SMTP id
 q9-20020a170902f78900b00163935daa69mr22475063pln.165.1654027729564; 
 Tue, 31 May 2022 13:08:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa785d1000000b005184c9c46dbsm11162319pfn.81.2022.05.31.13.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 13:08:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Ensure mmap offset is initialized
Date: Tue, 31 May 2022 13:08:56 -0700
Message-Id: <20220531200857.136547-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If a GEM object is allocated, and then exported as a dma-buf fd which is
mmap'd before or without the GEM buffer being directly mmap'd, the
vma_node could be unitialized.  This leads to a situation where the CPU
mapping is not correctly torn down in drm_vma_node_unmap().

Fixes: e5516553999f ("drm: call drm_gem_object_funcs.mmap with fake offset")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c       |  2 +-
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..14ab9a627d8b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -964,7 +964,7 @@ static const struct drm_driver msm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-	.gem_prime_mmap     = drm_gem_prime_mmap,
+	.gem_prime_mmap     = msm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index bb052071b16d..090b8074fec7 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -275,6 +275,7 @@ unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_t
 void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
+int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 94ab705e9b8a..dcc8a573bc76 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -11,6 +11,21 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 
+int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	int ret;
+
+	/* Ensure the mmap offset is initialized.  We lazily initialize it,
+	 * so if it has not been first mmap'd directly as a GEM object, the
+	 * mmap offset will not be already initialized.
+	 */
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		return ret;
+
+	return drm_gem_prime_mmap(obj, vma);
+}
+
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-- 
2.36.1

