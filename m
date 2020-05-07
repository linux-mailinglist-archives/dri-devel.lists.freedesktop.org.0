Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5021C9406
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE61C6EA08;
	Thu,  7 May 2020 15:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F022E6EA05
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g13so6817736wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qj0fciDKm4BgS9H+keoJPPJB0rWTQCvkiCgAsmiMHo8=;
 b=vWmKYhMCXSt5OB7tdHDNCbhAHtmMxq7KdhSHQ/7WVpDtN3Aj3fxq8GXkzzB6wi48oX
 b1fV2gvm+i4PsY5sskuCVhFlh0uGehTvrZbMYe6X+d16aZNTAXICs+Mca9S/CcOeyoe4
 y2Su6zht1rxwiqecgP9QV8vKvfxizLxh/7eREZplLFO9lObRGWvpZ3JK52iMBgEvp/XZ
 50xLzQurcgPoRJZrh1xiHF7kH1KMADmVekQfTXAi3K+dRohjcMULA01YhxVSz/uGYFwj
 Dzq9/BvUZ7zzDrJDsCXkVneVunCKs0gzVjfBgHKqdcFZxEbD37NZbEJJ10slKgxZrlVb
 AS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qj0fciDKm4BgS9H+keoJPPJB0rWTQCvkiCgAsmiMHo8=;
 b=L4KcSmUKkJjcPutuJDj2UowfavdgCwBesVfkksXQV/NVQmLmVQz2szcY1OycPBsVPT
 15vTM4BkfCpPBX3JwNW+460EKDGcklm4tKnGGkLUuvQ+IqG8e5LdzP9Wibm1YGnE20Ns
 jdHcTfGANsq5hxkfhxnrS0PZ+UOU3Q31E7S+neYiY6AiQGEKPbPxtlPjwRBkxNgCbnGe
 h3c/5HYITEnT7h1dNUdqgoCVYzOPGsU/K0838PMU6QI5hp90VUu/L1PQnk2TMO4pZsWp
 zVZVck58K6Ovo39IvH5OMiZBW2VhjM7h8t6E2wBSZ8yQmXpG8B2pe3LUT1DsyUqQJ1SJ
 Yr9Q==
X-Gm-Message-State: AGi0PuYgG4sIIGITebWbdOMhxdIs7K7oMTrb1QcMXUStbDmg7V28/3/U
 BJSGeRiuiDMmm5/mkUK2P5t0WN1/
X-Google-Smtp-Source: APiQypJAHgeGz0ygl2V55XgZSftdih0CmQKYb04vMwGkRiiNddcyWEXXeK+wKa3Y6yb4Br6QYkipnQ==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr14982385wrs.94.1588864274362; 
 Thu, 07 May 2020 08:11:14 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:13 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/36] drm/exynos: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:02 +0100
Message-Id: <20200507150822.114464-17-emil.l.velikov@gmail.com>
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
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, emil.l.velikov@gmail.com,
 Joonyoung Shim <jy0922.shim@samsung.com>
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

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_gem.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index d734d9d51762..642a276e869b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -139,7 +139,7 @@ static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
 	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "gem handle = 0x%x\n", *handle);
 
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return 0;
 }
@@ -333,7 +333,7 @@ int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 	args->flags = exynos_gem->flags;
 	args->size = exynos_gem->size;
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 42ec67bc262d..0e8d2306c08a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -86,7 +86,7 @@ struct exynos_drm_gem *exynos_drm_gem_get(struct drm_file *filp,
  */
 static inline void exynos_drm_gem_put(struct exynos_drm_gem *exynos_gem)
 {
-	drm_gem_object_put_unlocked(&exynos_gem->base);
+	drm_gem_object_put(&exynos_gem->base);
 }
 
 /* get buffer information to memory region allocated by gem. */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
