Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC214ECE3C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 22:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1996710E971;
	Wed, 30 Mar 2022 20:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1720310E96D;
 Wed, 30 Mar 2022 20:48:07 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id l129so9902779pga.3;
 Wed, 30 Mar 2022 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fYDyepM1PAw2FFzhXN5YHyImg0OWJ25svdZsQDoslA8=;
 b=ChVMQToydrt+7HGXPCiIPagn73alyXCDQwOewO9LNcXKaY3wJod0f1Wr9TxpzQ9908
 AaQ3ngeH6Nf2g9WG5OSC6Y+BynUXNFF7Cpbp5d3513UQxhvfm/+BTRNktwebBqhIZih8
 eiOPj5odKM3VYb+PEUkhPULpW3gvrwUAa5/dlmIGdZW/QnP0iPutXZfFsy2BJqvtjP7Q
 nT17wtqZgqBndc+E4RkBblbSY8etJTlPwEcqkrpYVVfOgpWZFra2aqojUWV45NMxK5HC
 Mn32p5oAEiZPqa9UubcKPZjJFCNkwrHFyxnYKkxRHAUQO6CNawkvn0IH+gBhU5nrOcWh
 0dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fYDyepM1PAw2FFzhXN5YHyImg0OWJ25svdZsQDoslA8=;
 b=7rUbntyc2UCfsZCz35Q722OsF4QQYRDKK9ABp6pXmZ+KG8oVrdQ6UlQvZZk0YohUA8
 HBxszpIFe5xvbweJmzQbL8v8UjGWA9ePDQk8bqicVEb/d1F5D9Db9aTQKwSO4Pmi4jp4
 GG1WD7fJD0ChasF9Lf4FkD7DFzTTzmfbOAOV09gEKUd5nHlbG6fpUFO4Fj/giMEa0xyT
 9hhMp9A7eP+Mv7hyJ6gOfxJ7EUjZ+OGDnvpIRPXbBWtskKLK/lmBvmwCOiCFP+Ux9CJ7
 rcc5Ah4qYGWXKJkTZrWTKMX1IMDl48e0s5qmo8e2R68Bx2OU+w8iczAa+vx8zcM6xGoZ
 kqBg==
X-Gm-Message-State: AOAM533HmeB+b9d2fQVip7sIB9/yWCBTyD3FjUTackkMQRTDoh5SVgUU
 67c2iZFtGy/3ybAE65PVIEpfG0bRvyM=
X-Google-Smtp-Source: ABdhPJysrCW7T4xLr30Fk4k5Y9pqgTYVNJdHJPSmvaqNrmHMUh6eDCzdUrrBZBnkmHm6GQ5x+MtBKw==
X-Received: by 2002:a65:530b:0:b0:382:b21d:82eb with SMTP id
 m11-20020a65530b000000b00382b21d82ebmr7766001pgq.215.1648673286092; 
 Wed, 30 Mar 2022 13:48:06 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 f192-20020a636ac9000000b0039836edcf42sm11513218pgc.85.2022.03.30.13.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 13:48:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/10] drm/msm/gem: Drop PAGE_SHIFT for address space mm
Date: Wed, 30 Mar 2022 13:47:50 -0700
Message-Id: <20220330204804.660819-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330204804.660819-1-robdclark@gmail.com>
References: <20220330204804.660819-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wang Qing <wangqing@vivo.com>,
 Sean Paul <sean@poorly.run>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Get rid of all the unnecessary conversion between address/size and page
offsets.  It just confuses things.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 +-
 drivers/gpu/drm/msm/msm_gem.c         |  5 ++---
 drivers/gpu/drm/msm/msm_gem.h         |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c     | 16 ++++++++--------
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3e325e2a2b1b..9f76f5b15759 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1172,7 +1172,7 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
 		return PTR_ERR(bo->obj);
 
 	ret = msm_gem_get_and_pin_iova_range(bo->obj, gmu->aspace, &bo->iova,
-		range_start >> PAGE_SHIFT, range_end >> PAGE_SHIFT);
+					     range_start, range_end);
 	if (ret) {
 		drm_gem_object_put(bo->obj);
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index f96d1dc72021..f4b68bb28a4d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -392,7 +392,7 @@ static int get_iova_locked(struct drm_gem_object *obj,
 		if (IS_ERR(vma))
 			return PTR_ERR(vma);
 
-		ret = msm_gem_init_vma(aspace, vma, obj->size >> PAGE_SHIFT,
+		ret = msm_gem_init_vma(aspace, vma, obj->size,
 			range_start, range_end);
 		if (ret) {
 			del_vma(vma);
@@ -434,8 +434,7 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	ret = msm_gem_map_vma(aspace, vma, prot,
-			msm_obj->sgt, obj->size >> PAGE_SHIFT);
+	ret = msm_gem_map_vma(aspace, vma, prot, msm_obj->sgt, obj->size);
 
 	if (!ret)
 		msm_obj->pin_count++;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1b7f0f0b88bf..090c3b1a6d9a 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -59,7 +59,7 @@ struct msm_gem_vma {
 };
 
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int npages,
+		struct msm_gem_vma *vma, int size,
 		u64 range_start, u64 range_end);
 bool msm_gem_vma_inuse(struct msm_gem_vma *vma);
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
@@ -68,7 +68,7 @@ void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 int msm_gem_map_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int prot,
-		struct sg_table *sgt, int npages);
+		struct sg_table *sgt, int size);
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index dc2ae097805e..4949899f1fc7 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -46,7 +46,7 @@ bool msm_gem_vma_inuse(struct msm_gem_vma *vma)
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	unsigned size = vma->node.size << PAGE_SHIFT;
+	unsigned size = vma->node.size;
 
 	/* Print a message if we try to purge a vma in use */
 	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
@@ -73,9 +73,8 @@ void msm_gem_unmap_vma(struct msm_gem_address_space *aspace,
 int
 msm_gem_map_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma, int prot,
-		struct sg_table *sgt, int npages)
+		struct sg_table *sgt, int size)
 {
-	unsigned size = npages << PAGE_SHIFT;
 	int ret = 0;
 
 	if (GEM_WARN_ON(!vma->iova))
@@ -120,7 +119,7 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 
 /* Initialize a new vma and allocate an iova for it */
 int msm_gem_init_vma(struct msm_gem_address_space *aspace,
-		struct msm_gem_vma *vma, int npages,
+		struct msm_gem_vma *vma, int size,
 		u64 range_start, u64 range_end)
 {
 	int ret;
@@ -129,14 +128,15 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
 		return -EBUSY;
 
 	spin_lock(&aspace->lock);
-	ret = drm_mm_insert_node_in_range(&aspace->mm, &vma->node, npages, 0,
-		0, range_start, range_end, 0);
+	ret = drm_mm_insert_node_in_range(&aspace->mm, &vma->node,
+					  size, PAGE_SIZE, 0,
+					  range_start, range_end, 0);
 	spin_unlock(&aspace->lock);
 
 	if (ret)
 		return ret;
 
-	vma->iova = vma->node.start << PAGE_SHIFT;
+	vma->iova = vma->node.start;
 	vma->mapped = false;
 
 	kref_get(&aspace->kref);
@@ -161,7 +161,7 @@ msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
 	aspace->name = name;
 	aspace->mmu = mmu;
 
-	drm_mm_init(&aspace->mm, va_start >> PAGE_SHIFT, size >> PAGE_SHIFT);
+	drm_mm_init(&aspace->mm, va_start, size);
 
 	kref_init(&aspace->kref);
 
-- 
2.35.1

