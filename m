Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637524F7AAE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD9710E5AE;
	Thu,  7 Apr 2022 09:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2079410E58D;
 Thu,  7 Apr 2022 08:59:57 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bg10so9453693ejb.4;
 Thu, 07 Apr 2022 01:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXj3Kbe7xDHiyyOo1B4OYi1sImslS+0K/zY6uVLIi6w=;
 b=YbmXAOFs+gy5D015qYxvG2OieoMf/vdwD/ijlCdS+KTOgB+FyIOdBGxI0D9+AcoxAZ
 isJBepkWkxA29ApS2kbZ8HRDiEWC7TbAOQzWqAjH2B0ODJxOBxBUgZ/nz9+PAN1DyRA5
 aTTYgeZvDUB0bqCdohjupaIHeLIL5viYu1FZmssQG0WpIHSwufaYPJAswLtKfm1tcJ98
 s2U5q/OWTnGDL/2KSyUsvHzqwyRvhqL+RmGZCZ68VuzS3thVWTNv3uC49pPAtjIU+1W7
 ozpA6iCVtF/NRZOm2W8OJjSVhMi5tXXNrXIKcl2l70mQBO/5vnlaH62o8Lcd24LMBbd7
 qT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXj3Kbe7xDHiyyOo1B4OYi1sImslS+0K/zY6uVLIi6w=;
 b=l8GlJeCatP0pVeaoK/X7up8nB9E+x02n+u8tOfbIMKBUqN9dEkPRXIjWuLnXoQlrrW
 CV+DxnzE9nxltabWw30FnP4WYmcF/mKylXU4BVM/lnT5zjNA8+M+3E4qYPVHHSNygfJe
 Tp2gGlvjmyZcJ2d8L57FUwAIsQVwLpwzgc3moqZbv00atvMv1B7l3zt9C9lwO0DFMGJ/
 rGZ0J7YddomuTCd39fLllGyDORwdVy3kE0s+MT3dpceef0x+CiqGNw6Ci1OZROJZqpob
 XPDr3BmCAG5HhQthKgJ9NiAtr14IG7+ZF7nuMG1wiq4mfSenObZBEJIV/l7dIrj2KQ3W
 LNnQ==
X-Gm-Message-State: AOAM531Mgco8kW42J1uKIys4Bvu+7lUGTZTZvxe0FUCbhYAdQvyYsv8+
 bV3qavPnE5U6nEllNHz186c=
X-Google-Smtp-Source: ABdhPJyvjeR9CZoQ4PIU/jrK26usfsiKkXh6Wyjwbj4nnnWpODNbwTBex5/ZVXURFPN9veF3SERFhw==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr12376953eje.746.1649321995641; 
 Thu, 07 Apr 2022 01:59:55 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:59:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/15] drm/amdgpu: use DMA_RESV_USAGE_KERNEL
Date: Thu,  7 Apr 2022 10:59:36 +0200
Message-Id: <20220407085946.744568-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
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

Wait only for kernel fences before kmap or UVD direct submission.

This also makes sure that we always wait in amdgpu_bo_kmap() even when
returning a cached pointer.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

