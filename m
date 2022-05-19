Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD9B52CFDC
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78F811B323;
	Thu, 19 May 2022 09:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4427311B323;
 Thu, 19 May 2022 09:55:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id fd25so6345248edb.3;
 Thu, 19 May 2022 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8R40cOPvMPMZYsuXVKC3tvSzxBJxpU4HfejzWEcU2zU=;
 b=oUIogAySYA7T/2pLHotJv6RdNzthH49GrSW4T5LiNzinsE+AFx+4VsdNS/Jqrgg3LA
 6SGuSkbTLVmGaDAdKk6uIqhBPHqqBTMyMxccoEesgI/6Y0lC8MR8UCMefCKO06nhlxG5
 7pGHJ4dflEraoVvFR5WN5zUVXljs7HJMwo3Mx2bGTdL+CcrKeRjwj9lW9ofXTEF1s/aE
 Ww3RXWHzFeQfIseeDBPs8JQOJjdQKqyvDIoCMpMGGe0mAigid99ZJ09mPrV+287th3+q
 g22En8dvO4i8ONhcm0EWgRKHd9lqmW8Dpqnbaf0dG4BNneqwnbPDLVfrDYCTc3jdStZv
 kz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8R40cOPvMPMZYsuXVKC3tvSzxBJxpU4HfejzWEcU2zU=;
 b=WQsHlbjxO6D/kECZxCl4Uf5DM1b4C8U0LtVlqgH/mH8/kzJhN/Rmqjo1IKvxgCNM9u
 i1/BLewSk5A19O8V8gAg8Awh3a7iIX8WCuKhQ5495eOyko+Udo6h7UbiVhWu9LM4IgT0
 K/GmrI1kFfAlD0FMqMBtwmiYzsxOQP0qabhqwSGv4JpsVwkazbDR//KyiASuR4jBmzlE
 yyrrM1kWDUXoM03bzX5fqH7QdhBpdzHq4HGEBtYFpvpUnq2aJAO/kypS+7NYfJXrA9uc
 YXafE06bUNjF9blGXAfg0GfLfjX1EI/G28l3ZubEJwIw8FozbfcHp7Ip4yVcCHIjGJz3
 Pb2w==
X-Gm-Message-State: AOAM533qNKlm8wG3fHnmS+kcE9ULxyxSDlMQ/seh2A3n+Sz6n/vZuWjL
 gQK/p26NcNZAKsQ47Nmycc9geHWxyPg=
X-Google-Smtp-Source: ABdhPJyEylf70dnIj2G+McY0mpT4ug4SyP29t+o24SDEVRlPnIVV1YNpzCO9og1YWBumyZ8B5i9aeA==
X-Received: by 2002:a05:6402:2553:b0:42a:ef31:4444 with SMTP id
 l19-20020a056402255300b0042aef314444mr4395983edb.46.1652954111829; 
 Thu, 19 May 2022 02:55:11 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/radeon: switch over to ttm_bo_init_reserved
Date: Thu, 19 May 2022 11:54:58 +0200
Message-Id: <20220519095508.115203-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
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

