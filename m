Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8B4F56E9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F32410F2C8;
	Wed,  6 Apr 2022 07:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D61810F265
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:47 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qh7so2450548ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=eXeU+WOO0nSydex337qozFuPVBkWoUVEP5vTvD+Om8A=;
 b=Ocjj3Plr3dwvtS783+LPt41Il5DoetQZ3ZvsUGnyhmFUoxtnV0Q94kuHv78LAJZo34
 qxcDroZmTnUGSd0MyguiRUhs3qfettUqf8N292+/koAbWOkLcRQnGTFYnFOqOFUOEH2p
 bPEPY623hKdgNy3WLPq2WLPKhpWKKGC1f1ejBnQV7Jzdfgc5hsNp9+mSd9e4z72S08W7
 DG6wy8EKOoKlykoNq+FnGRkmFT28a7RDmShqmbXYqEb/LqaD96SrVJuemEPVcnwLw7cU
 eHADIvJeWZuEn3sFhCqNp66cAVxgCPjoXsiUS+wLPtvu7cL43K9uBOuEDKySJNDtEf5z
 rAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=eXeU+WOO0nSydex337qozFuPVBkWoUVEP5vTvD+Om8A=;
 b=ucwfL0aSq5ZzqRqki+9n650bIjxxi1in+UYOpKvjeOHQO6bGDJvWdeUtuI/tc/yer6
 R4yd7xGEcWzQkC3BOVm5gGcAKA3FzooJyBOLLziG7vrhpmmuCvGEZSwCaxCHucigX6BU
 B8NuwqOJGcIxfwI1OTCzd1srjpeQuQ4yVjYcQSvcTver2wXfmwjDpzupElcJULkRNrw1
 NKmxpivPUVkbbP3iW0f+eK928rdb7ntHn6PB+OJjroBQgybFuZmiV6VmjnNwAcH6V5iP
 9kNwwXlFT2Kio9vK2zmrd2kWqsXLOxicMbfsBJxth3eHBEkF/Sqmkl/B7Q1XUsD71iEu
 pzpg==
X-Gm-Message-State: AOAM531FMGm+RzoQ4Khh9D2Z/oHxfE9VG8x4OW2dzVSCkidHA6Ncdek0
 VJiPyBdhcIzq1Sg9UBFpsE4=
X-Google-Smtp-Source: ABdhPJxi9ATn6aSmsIvzVwgQijmnrNDFjmlCDfmTVlwr6MqCXRgJ+Hm3QJ2EqQa5OOU8uNEImLuSOQ==
X-Received: by 2002:a17:906:9c82:b0:6df:c5f0:d456 with SMTP id
 fj2-20020a1709069c8200b006dfc5f0d456mr6982881ejc.287.1649231505953; 
 Wed, 06 Apr 2022 00:51:45 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/16] drm/amdgpu: use DMA_RESV_USAGE_KERNEL
Date: Wed,  6 Apr 2022 09:51:22 +0200
Message-Id: <20220406075132.3263-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
References: <20220406075132.3263-1-christian.koenig@amd.com>
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
Reply-To: DMA-resv@freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wait only for kernel fences before kmap or UVD direct submission.

This also makes sure that we always wait in amdgpu_bo_kmap() even when
returning a cached pointer.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c    |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index a3cdf8a24377..5832c05ab10d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -761,6 +761,11 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 	if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
 		return -EPERM;
 
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
+				  false, MAX_SCHEDULE_TIMEOUT);
+	if (r < 0)
+		return r;
+
 	kptr = amdgpu_bo_kptr(bo);
 	if (kptr) {
 		if (ptr)
@@ -768,11 +773,6 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 		return 0;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
-				  false, MAX_SCHEDULE_TIMEOUT);
-	if (r < 0)
-		return r;
-
 	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 3654326219e0..6eac649499d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1164,7 +1164,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 
 	if (direct) {
 		r = dma_resv_wait_timeout(bo->tbo.base.resv,
-					  DMA_RESV_USAGE_WRITE, false,
+					  DMA_RESV_USAGE_KERNEL, false,
 					  msecs_to_jiffies(10));
 		if (r == 0)
 			r = -ETIMEDOUT;
-- 
2.25.1

