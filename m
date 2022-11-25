Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80C63874E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9AE10E693;
	Fri, 25 Nov 2022 10:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68A510E607;
 Fri, 25 Nov 2022 10:21:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n7so6034815wrr.13;
 Fri, 25 Nov 2022 02:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ew8M0PkxgyobeEwJ5uJ+RaPpgEkLlL9vZ8bbzJQpK5g=;
 b=X6xsPsWINWOSAfY9hPpBorv7Z0WCK8r5TrALjl4x9wyjMeN1+VVmmtPo3vU0f5I4wK
 jdVorSyh/AWuallSiiEOwxxwhcyI4ojYSFbIpcjg261sH3oasNhmUjCwfzUCwj6ebEbQ
 vISeT83wmwsyrFyMrWXqslevhIUsI+CUGJyTOOLfhLgV00dzUlHJh1Gpc75LFcp71cql
 aXBVJi2/PJFhe5Ms92B2CFi1eh1N5/VnrYQEPlxRdZlaxKaPSRdEVLBa5cC3OJqX80II
 IrAfwMvv7hKYFM8hK99AOrRZPtEjAmSguRINf/lTAVTNDn7kx559UzGTVaMldLTRJuOp
 +M+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ew8M0PkxgyobeEwJ5uJ+RaPpgEkLlL9vZ8bbzJQpK5g=;
 b=WH+0mZVSdRq14Lje4VJLzxSGjtR/z03eyJvCxGvrDRHoC4Lyo7e5DEfm6rffHlua+c
 Ve1/jO24s5JsCdq56QAeiSjDqOa3Qbuc3inDkKOCSvgqMxahQnB6xbbojt4roensMfEQ
 j487n+MgDrWa4y8IfQ2QxNgdyYQLPtaSFpVN/m9wgN+7RJ0sD7rX6s1X+c728bXynkdz
 r9HG1WhfKERyY7rXkKAeh0tqC2MqxJt27GtkVAQ9EPKCNfqvS4ZbyGmxy9HXJvEi5s5K
 +MVG6/wcJRC135TBQhQp5Z729kFmLRHRZF8j4uf05dAaOI8mTvQL3j0ro84PYSLaUnrK
 0nNQ==
X-Gm-Message-State: ANoB5pmOazNpXC6Uurd5ADC3UZ8X7aX84J7N3xM7zHIxF8fj7xYBiWkl
 ROQ3CYQsKb+u8h7RF3hkZQgioEZjj6Q=
X-Google-Smtp-Source: AA0mqf6g1+4ACRi0mg/NkSnOj4jRe/IFu2qMW4OULjNf0AjDL4JFFzD0XfinhDL8/d7XYd20hJ0Tcw==
X-Received: by 2002:a5d:620e:0:b0:241:e32f:8371 with SMTP id
 y14-20020a5d620e000000b00241e32f8371mr9827636wru.156.1669371699275; 
 Fri, 25 Nov 2022 02:21:39 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/9] drm/amdgpu: generally allow over-commit during BO
 allocation
Date: Fri, 25 Nov 2022 11:21:29 +0100
Message-Id: <20221125102137.1801-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already fallback to a dummy BO with no backing store when we
allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.

Drop all those workarounds and generalize this for GTT as well. This
fixes ENOMEM issues with runaway applications which try to allocate/free
GTT in a loop and are otherwise only limited by the CPU speed.

The CS will wait for the cleanup of freed up BOs to satisfy the
various domain specific limits and so effectively throttle those
buggy applications down to a sane allocation behavior again.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a0780a4e3e61..62e98f1ad770 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 	bp.resv = resv;
 	bp.preferred_domain = initial_domain;
 	bp.flags = flags;
-	bp.domain = initial_domain;
+	bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
 	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
 
 	r = amdgpu_bo_create_user(adev, &bp, &ubo);
@@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	initial_domain = (u32)(0xffffffff & args->in.domains);
-retry:
 	r = amdgpu_gem_object_create(adev, size, args->in.alignment,
-				     initial_domain,
-				     flags, ttm_bo_type_device, resv, &gobj);
+				     initial_domain, flags, ttm_bo_type_device,
+				     resv, &gobj);
 	if (r && r != -ERESTARTSYS) {
-		if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
-			flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
-			goto retry;
-		}
-
-		if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
-			initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
-			goto retry;
-		}
 		DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
 				size, initial_domain, args->in.alignment, r);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 974e85d8b6cc..919bbea2e3ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
 
 	bo->tbo.bdev = &adev->mman.bdev;
-	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
-			  AMDGPU_GEM_DOMAIN_GDS))
-		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
-	else
-		amdgpu_bo_placement_from_domain(bo, bp->domain);
+	amdgpu_bo_placement_from_domain(bo, bp->domain);
 	if (bp->type == ttm_bo_type_kernel)
 		bo->tbo.priority = 1;
 
-- 
2.34.1

