Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362856375E0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00D110E6C3;
	Thu, 24 Nov 2022 10:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1423D10E6BC;
 Thu, 24 Nov 2022 10:02:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kt23so3013952ejc.7;
 Thu, 24 Nov 2022 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDurF+iNH5v+x/TrEN0UdvMI8v4GH8id9dWHUg8Rht8=;
 b=olWB5d7Js/mPoMwLuUMdZHUWgpDnfw6EPizHH+uJZPJ4bcgr2KByZP4KWtzLW8coZq
 CSZRCk8VPkC8nO/2ZMlY1NcfK5HQTXjg5FeK4CZBeD0Fe6x3JtAJ6zHqVu76qBCt2kva
 ahvQF2F3MC9B+L0dzd7e6M9J2dW5Odkftb/iLqxCxXLEKr0IiKEr1AyClvyUfbfcYGHi
 atbwFMnxFNMcEAFzkJ8U/0O4p2lG0VaTA73AGlKCgZCAi6/J6K1KFB4QyrQMD1v9fD7V
 ouTiDeMdY2Vt2Xaj+167/5jvoyVlFAOBavo3XR54pqVywUNFcJRLFlJnsUma1N1zPgWp
 Xibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDurF+iNH5v+x/TrEN0UdvMI8v4GH8id9dWHUg8Rht8=;
 b=j0qlaPWC9yD/TDekpkQCjTYQ3o0lQLrDpjNbJ/zojW6zo07zrT/F83oH64oyHynzrn
 5UtzOb/NA6BY2V1WrpifMUHloIWkr9M584iPPPBbb7IKwP9p6RfgmBQiqoJ2OLIZQ0WY
 G7WUBiA0I6l9OWSbvtgOt5S48FDRNbyMufU+b2PsckW8NBXhGpkUobGppN8v7y/tIlYx
 CYNHgQRbOFKZS9iG8ZsV+udT0a/ifekEAbKMH5QR32WvIhXWDk8xBL0pvN6jYAFh9WRZ
 qoJXuiz81ZSZpvlK5Eq2HyR4iDoj13jI7e4857iwg8CNW0N53gAqd4d4bBrzuHk9ZpBF
 HOuw==
X-Gm-Message-State: ANoB5pk6tYJpy1p3Vysv+/ucF/S16g5NBZDroCk50TY2MrgvNLQbXJxY
 p8lrgQdI3I2tv/fvyCJxZPvTmld9Scs=
X-Google-Smtp-Source: AA0mqf75kzfNGxUTNFmMsajt9ldHTGMTK4pJvrw6dLwk325iZbRteHhOHOq3ApCCaQjFbq4KauC77Q==
X-Received: by 2002:a17:907:8d02:b0:7ad:f43a:cb07 with SMTP id
 tc2-20020a1709078d0200b007adf43acb07mr3306342ejc.562.1669284177543; 
 Thu, 24 Nov 2022 02:02:57 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 ey3-20020a0564022a0300b00461816beef9sm328907edb.14.2022.11.24.02.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:02:57 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, Marek.Olsak@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: generally allow over-commit during BO
 allocation
Date: Thu, 24 Nov 2022 11:02:52 +0100
Message-Id: <20221124100252.2744-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124100252.2744-1-christian.koenig@amd.com>
References: <20221124100252.2744-1-christian.koenig@amd.com>
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
Cc: Amaranath.Somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com
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
index 8ef31d687ef3..286509e5e17e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -112,7 +112,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 	bp.resv = resv;
 	bp.preferred_domain = initial_domain;
 	bp.flags = flags;
-	bp.domain = initial_domain;
+	bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
 	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
 
 	r = amdgpu_bo_create_user(adev, &bp, &ubo);
@@ -331,20 +331,10 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
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

