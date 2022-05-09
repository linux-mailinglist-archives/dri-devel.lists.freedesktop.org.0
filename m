Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08C51FD9A
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3279710F18F;
	Mon,  9 May 2022 13:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C308010F175
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:09:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b19so19372146wrh.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8R40cOPvMPMZYsuXVKC3tvSzxBJxpU4HfejzWEcU2zU=;
 b=epZxXjJEvsOdo0mOtztsA+krD+qYyEDK+1NAqvb9eV36Sat5Fos7lYV3u+1EdEjh4e
 zhn689cWIl83UCvX8V3jz08YG4OFzrOgO6/L9t4VRAy6xGBOklXU1YnyUzS5Ne5M+0x5
 309obf4U9EZ6g0GG0v+1ME7XKUmyVZmIoJnROaePXtad0YCU4RzS/4u+z0ygpE4ndhHD
 +wsb4yyOZL6T100NS3bupGQWIFmgbip4omh2VXD6605BlrOsN1r3JML+OBcwrDFl4vTQ
 69EGaPmoBQdy5sX5+Xq5kNpbZ7aYd66fZ0qXTA5JqJ9RR3h+cRIMH95OrpBnFoL0xqKY
 MJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8R40cOPvMPMZYsuXVKC3tvSzxBJxpU4HfejzWEcU2zU=;
 b=FX+KJtFF4pX2LImF2CdVCi5GNFOs8JhbF2O0UNdDNh0+pXwG/vRJhdbKkdroIL8Bf9
 XXwqY1/BCWBPWDLe50zmAhRVwU2kAwdTPcNpAfSotuUlziGfD/e0p56T22UNnOeT0+LJ
 BVDbXJgPTyDAFODlav1rEJS0zvgqhWzKzgruuyGFEHIiivrAs1pANiFPq3Z9l6yjWsoL
 EkkDQSfuxezPI8nok82KL0Y1kb75jv4tNsOy6B3ZAUWbRZwNH4tuneu1Z6QccWx0xXAc
 t0naUTrmf3a6+vYIzeU6E6gDFCeffLvomqzDj+fThDGLkoLvLVWreME0HdZ3ADUG5N9g
 RvSQ==
X-Gm-Message-State: AOAM530nXvioopC3DGqPlHJGxJg6QA1ZBCoxxO0a6ZotRAnO/9bY/NT6
 AjhFcd/LzdsNptcnCVzC/1dSw/ssrRc=
X-Google-Smtp-Source: ABdhPJwcQTMexIxHeYVCiyrGCj3K+T4W0N8xrz1P+9tamUDwSYNXl01yBkamIlgU6eAHqiCKUZFCSQ==
X-Received: by 2002:adf:e891:0:b0:20a:d653:7cd2 with SMTP id
 d17-20020adfe891000000b0020ad6537cd2mr13918611wrm.195.1652101796227; 
 Mon, 09 May 2022 06:09:56 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:09:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 01/11] drm/radeon: switch over to ttm_bo_init_reserved
Date: Mon,  9 May 2022 15:09:41 +0200
Message-Id: <20220509130951.486344-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new interface instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 6c4a6802ca96..1d414ff4ab0c 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -133,9 +133,12 @@ int radeon_bo_create(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     struct radeon_bo **bo_ptr)
 {
-	struct radeon_bo *bo;
-	enum ttm_bo_type type;
 	unsigned long page_align = roundup(byte_align, PAGE_SIZE) >> PAGE_SHIFT;
+
+	/* Kernel allocation are uninterruptible */
+	struct ttm_operation_ctx ctx = { !kernel, false };
+	enum ttm_bo_type type;
+	struct radeon_bo *bo;
 	int r;
 
 	size = ALIGN(size, PAGE_SIZE);
@@ -200,11 +203,13 @@ int radeon_bo_create(struct radeon_device *rdev,
 #endif
 
 	radeon_ttm_placement_from_domain(bo, domain);
-	/* Kernel allocation are uninterruptible */
 	down_read(&rdev->pm.mclk_lock);
-	r = ttm_bo_init(&rdev->mman.bdev, &bo->tbo, size, type,
-			&bo->placement, page_align, !kernel, sg, resv,
-			&radeon_ttm_bo_destroy);
+	r = ttm_bo_init_reserved(&rdev->mman.bdev, &bo->tbo, size, type,
+				 &bo->placement, page_align, &ctx, sg, resv,
+				 &radeon_ttm_bo_destroy);
+        if (!r)
+		ttm_bo_unreserve(&bo->tbo);
+
 	up_read(&rdev->pm.mclk_lock);
 	if (unlikely(r != 0)) {
 		return r;
-- 
2.25.1

