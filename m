Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A5C695AC3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 08:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202E10E7F5;
	Tue, 14 Feb 2023 07:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0C810E042;
 Tue, 14 Feb 2023 07:42:43 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o18so14688087wrj.3;
 Mon, 13 Feb 2023 23:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQQFrBizUdFKPezAzjnBMsO4C0aui2hfp5xwGSsDpiM=;
 b=NNvXDphBZ28jy4mUD6LIAIPP95pNwoxaQEcRnbGJ7pSGu8vGvawhijzaw2icxcjOhy
 wSyS8tIqnO+MfpJzm7FanELxfKF1kMT97P8xXFO4nOzImfYDEy2gQih2k76Akyrshy0n
 TDvMcSI2ASZQ/mrgdDUzn+qB2yfacNvVQZcXA7gboLHaoU7lt8dYtdpEUrv39FxFiK2o
 DDfIAVKym7aO0tDAHf8/fyHuHPy/DWnr8flYAbzTQldJpDRED2qnnlE4SVZdClyxN5kI
 WUNRlL48sWlkkUA9zqn8Hj1xNtK+z4HzP7nQNjZNsz4kiIrJLCMC1kwghZ36dpuGP4Om
 vwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQQFrBizUdFKPezAzjnBMsO4C0aui2hfp5xwGSsDpiM=;
 b=GM/XCNZNk+Q6qEY9NWYKui3itQz/FfuARjPzDWP9HrF8t2Z1aoRqf0YRzABWMmaT4u
 oSnp4+hYXAufp7nqsPZrcUF7hGmF83e8oZBPYW6x190TZdYI2TYjVuTGhg80ucZPbI+x
 rhXdDWtFURDhB7Cb9McJtq9RzvXHfA/Yfw6ZVJdm+MODOmEEsJn8VA/pBVodYyFJ2dXk
 3v5UbNTo9pIGCMYXs4X1CCVguwFZWt9AsCIQ3SMvflsNrCmNujuaEC4tq5vASTz+L+H5
 QxUrj9aS520r2AuhKw/+quVsfjnFUbI25BFXFU4FAtAMA9FA7lO2j4Zg7NM9f1kGFgTb
 ZIUw==
X-Gm-Message-State: AO0yUKWxn5cqkoOPyV9NH7jx5CpzYmaHbBjKLEP/VRtdB2I0o9TNFOgR
 EEymBqsbWKRds/HEC4SACFah75/X7qI=
X-Google-Smtp-Source: AK7set9EmmdNYA6j9SZoV2Egp4bzLc67TiqfOonSvDg++mn2qXm2ThrLqzC2Ca1D/1PkxhWrSQXUTg==
X-Received: by 2002:adf:d845:0:b0:2c5:598a:dd0f with SMTP id
 k5-20020adfd845000000b002c5598add0fmr1270015wrl.0.1676360562150; 
 Mon, 13 Feb 2023 23:42:42 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d65ce000000b002c561805a4csm1679855wrw.45.2023.02.13.23.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 23:42:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: use amdgpu_res_cursor in more places v2
Date: Tue, 14 Feb 2023 08:42:36 +0100
Message-Id: <20230214074238.65865-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214074238.65865-1-christian.koenig@amd.com>
References: <20230214074238.65865-1-christian.koenig@amd.com>
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
Cc: Amaranath.Somalapuram@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of resource->start use the cursor to get this.

v2 (chk): remove changes to amdgpu_bo_gpu_offset_no_check(), that
	  won't work with the AGP aperture otherwise.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c               | 8 ++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2cd081cbf706..f62e5398e620 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -845,6 +845,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
+	struct amdgpu_res_cursor cursor;
 	uint64_t flags;
 	int r;
 
@@ -892,7 +893,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 	flags = amdgpu_ttm_tt_pte_flags(adev, ttm, bo_mem);
 
 	/* bind pages into GART page tables */
-	gtt->offset = (u64)bo_mem->start << PAGE_SHIFT;
+	amdgpu_res_first(bo_mem, 0, bo_mem->size, &cursor);
+	gtt->offset = cursor.start;
 	amdgpu_gart_bind(adev, gtt->offset, ttm->num_pages,
 			 gtt->ttm.dma_address, flags);
 	gtt->bound = true;
@@ -912,6 +914,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(bo->ttm);
+	struct amdgpu_res_cursor cursor;
 	struct ttm_placement placement;
 	struct ttm_place placements;
 	struct ttm_resource *tmp;
@@ -945,7 +948,8 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
 
 	/* Bind pages */
-	gtt->offset = (u64)tmp->start << PAGE_SHIFT;
+	amdgpu_res_first(tmp, 0, tmp->size, &cursor);
+	gtt->offset = cursor.start;
 	amdgpu_ttm_gart_bind(adev, bo, flags);
 	amdgpu_gart_invalidate_tlb(adev);
 	ttm_resource_free(bo, &bo->resource);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c06ada0844ba..9114393d2ee6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -200,8 +200,12 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
 
 	if (q->wptr_bo) {
+		struct amdgpu_res_cursor cursor;
+
 		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);
-		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
+		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
+				 q->wptr_bo->tbo.resource->size, &cursor);
+		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
 	}
 
 	queue_input.is_kfd_process = 1;
-- 
2.34.1

