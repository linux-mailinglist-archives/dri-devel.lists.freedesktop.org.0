Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11392569FB7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9C14ABE5;
	Thu,  7 Jul 2022 10:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FFB10E957;
 Thu,  7 Jul 2022 10:24:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z12so16037115wrq.7;
 Thu, 07 Jul 2022 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Lh/Jalcxno4YTqEY5QxK+FR+aXvcc+zRLMTDiIBBlM=;
 b=KORhumn0UQ70H6jNfjSy0rKQSTvdtz3u59yvQr/2Ru8o37oBaOfN6yvWnGSZaPehwr
 /3omM6EJ5yQVRT5Sigv+XlMF6HEaGM0Wp+4ZgicPfnkLQ7dEVf6640UdZ1tBflsZ0wfx
 uy/6VGOTVfIZm0k/OtZuQ0iEeW3C1/XX7GtlRM2urJjLn65GuR/PkMII2bzdtC2GOsjy
 NtRfmV0LIlUcHPBJNEnb2EJmTst7TN6yvIsPupMUa12h3/OE6CEaz84Y3xo+AgQqD4oC
 WWW1lhC33MU6IeU3tFU6WzQhm0+WH8UTp+O6gMvclDhnnRUNoM+zs6wCiRRduU4Yp7jG
 beFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Lh/Jalcxno4YTqEY5QxK+FR+aXvcc+zRLMTDiIBBlM=;
 b=uzVJsdTeIQPrsMSgYGHt0Q7B5AeqtkYZ5KoLvk+FSK4xpVlhR+aXO9end94OksYq2A
 d9/VL6qg4cppKoeCT/bXYV7X/ResmoIYUv1fviXmnTl31XtsAL6RYpmGFzeYTNsIsy2r
 yNugHt5vzrlft305feSrvQTt12eLnkVN19t+AFdbijFR/8mBQxyUU023Gjp0ddU9tpbH
 ZyOB0OX7N6YZb9LZEi1RPWYIHzH+y+ALt7+s2RvY71kYuJdV0nzZ2cSq2Y8OC6kKTkLr
 uhthEAY3ONITAk9KAv1ktWXCqC/DQDjn5mhRTHtZ2wwcQjC4jyHGl63or4UpIELfDsbF
 Xk8A==
X-Gm-Message-State: AJIora8Mc85cbLJLub3YGI8mQQIzzo992atntmITRccaJ5bSEMchTqWp
 jdim0KyjcAGdtUuumu3kf5/FQ8ABPW8=
X-Google-Smtp-Source: AGRyM1vkN8biF1nZHcWXb0URQ3jb0KpO8z+RUCCFPQnGISNSj30fNFYM3Ye3qoChK94WHPnwi/F4vA==
X-Received: by 2002:adf:c64c:0:b0:21a:7a3:54a4 with SMTP id
 u12-20020adfc64c000000b0021a07a354a4mr42442929wrg.163.1657189497752; 
 Thu, 07 Jul 2022 03:24:57 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20091950wmq.11.2022.07.07.03.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:24:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu: audit bo->resource usage
Date: Thu,  7 Jul 2022 12:24:49 +0200
Message-Id: <20220707102453.3633-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707102453.3633-1-christian.koenig@amd.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
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

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index d9cfe259f2a9..677d1dfab37f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1305,7 +1305,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (bo->base.resv == &bo->base._resv)
 		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
 
-	if (bo->resource->mem_type != TTM_PL_VRAM ||
+	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
 	    adev->in_suspend || adev->shutdown)
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index be6f76a30ac6..3bddf266e8b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -471,7 +471,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	adev = amdgpu_ttm_adev(bo->bdev);
 
-	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
+	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
+			 bo->ttm == NULL)) {
 		ttm_bo_move_null(bo, new_mem);
 		goto out;
 	}
-- 
2.25.1

