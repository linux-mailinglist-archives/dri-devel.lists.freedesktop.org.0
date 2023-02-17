Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9A69AB56
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA9910EFA3;
	Fri, 17 Feb 2023 12:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7210EF9D;
 Fri, 17 Feb 2023 12:22:32 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j20so5085204edw.0;
 Fri, 17 Feb 2023 04:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mZHGa2GoczV8SobMBL4eZrxvktxY9/CEPQQFfd9j9c4=;
 b=jcycg02h19wCD0AO0gHJigbe5K5vEfbGXlMCk1d07z1irJ/ZOrlOD7Mh/TFI633aSA
 agLLZ6Bi+DvsAsoocoqEWbjrl3BqKDvOQz665461d0rKLRKKXYd5CqGjhExIJFt3gwvk
 3mzfIt+RU/ZnQMAHHrjIf+avJL+ip+Gc5L7oa6t+rygoBWnzkU6Rh/R6bfJ3c7T9N/Xf
 CFfVZjS71bHUytvVT6l86fS6fXLlkHVugVkLXphJocOSwawdFaU+kpqH9HPuJm4ERag3
 NuEh+B4D/Y6SIUBYUcyJIhcHCEFKgxycCRf7BmdL3rA2v/LPtFP2deCvbfmCX9vyhZ2R
 69Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZHGa2GoczV8SobMBL4eZrxvktxY9/CEPQQFfd9j9c4=;
 b=lG7XG01Ipxl85vY/qWb49isvsFEteSLtdiLPl8IIUzNl3DqSc+oFtYn+Y/UcRjsWl1
 S0oNtTsoxbut+Iyn+LPNUxBfPcwLw0Op0BZf80esIPJCxI7Bx6meippHS5KDnOS9d6UF
 Pzq/FuVRtdDweND+WIvEzdNjcQ/P6jLLdW5bbhJZ3xbK4vY5aGDhoFQAUYXtf1CigB0y
 2LeXfBNfgj9Ll9OCmjT2jwdhYkCMown0+V5718AaiYWd97gjfHbPmuz2wLh643g2K9oD
 /XGj9xhNsqQA5rbdbCiinkPjrP0EKnxddYoR6taXkL1DdUY38JyqBnRnlta+eidXyMKv
 0WfA==
X-Gm-Message-State: AO0yUKXHiNOE1wbOhNvhKnc1TWm0l27oeSc/Na6/kNUY/Dx1D/riycyX
 QeRdAEqq877k88LftsBZgpHLaeTRkcY=
X-Google-Smtp-Source: AK7set+bzqbrzO8BdZJIusuJ5fKHriLqL6MVEuG3V2kPEuweIeA+fYvxNjLhOPj1jj8Xu6B4YJTSIg==
X-Received: by 2002:aa7:ca53:0:b0:4a0:e31a:434 with SMTP id
 j19-20020aa7ca53000000b004a0e31a0434mr991720edt.27.1676636550928; 
 Fri, 17 Feb 2023 04:22:30 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a50c38a000000b004ad75c5c0fdsm1373472edf.18.2023.02.17.04.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:22:30 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/amdgpu: Cleanup the GDS, GWS and OA allocations
Date: Fri, 17 Feb 2023 13:22:23 +0100
Message-Id: <20230217122224.29243-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217122224.29243-1-christian.koenig@amd.com>
References: <20230217122224.29243-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

Change the size of GDS, GWS and OA from pages to bytes.
The initialized gds_size, gws_size and oa_size in bytes,
remove PAGE_SHIFT in amdgpu_ttm_init_on_chip().

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  3 +--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..4641b25956fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -142,16 +142,16 @@ void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
 			      struct amdgpu_bo *gws, struct amdgpu_bo *oa)
 {
 	if (gds) {
-		job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
-		job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
+		job->gds_base = amdgpu_bo_gpu_offset(gds);
+		job->gds_size = amdgpu_bo_size(gds);
 	}
 	if (gws) {
-		job->gws_base = amdgpu_bo_gpu_offset(gws) >> PAGE_SHIFT;
-		job->gws_size = amdgpu_bo_size(gws) >> PAGE_SHIFT;
+		job->gws_base = amdgpu_bo_gpu_offset(gws);
+		job->gws_size = amdgpu_bo_size(gws);
 	}
 	if (oa) {
-		job->oa_base = amdgpu_bo_gpu_offset(oa) >> PAGE_SHIFT;
-		job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
+		job->oa_base = amdgpu_bo_gpu_offset(oa);
+		job->oa_size = amdgpu_bo_size(oa);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 05fc6bda5f58..d95c61b79b4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -541,12 +541,11 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
 		/* GWS and OA don't need any alignment. */
 		page_align = bp->byte_align;
-		size <<= PAGE_SHIFT;
 
 	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
 		/* Both size and alignment must be a multiple of 4. */
 		page_align = ALIGN(bp->byte_align, 4);
-		size = ALIGN(size, 4) << PAGE_SHIFT;
+		size = ALIGN(size, 4);
 	} else {
 		/* Memory should be aligned at least to a page size. */
 		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9009b5477faa..449b2344af27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -77,8 +77,7 @@ static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
 				    uint64_t size)
 {
-	return ttm_range_man_init(&adev->mman.bdev, type,
-				  false, size << PAGE_SHIFT);
+	return ttm_range_man_init(&adev->mman.bdev, type, false, size);
 }
 
 /**
-- 
2.34.1

