Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8A4EB652
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 01:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7EA10F12A;
	Tue, 29 Mar 2022 23:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC27110F0DA;
 Tue, 29 Mar 2022 23:00:30 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id w7so14514959pfu.11;
 Tue, 29 Mar 2022 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5mokzcWUJeEgdsztBUx3V6Ayus21b4yBmtSSS7BPMiI=;
 b=ThnTSEL/39R9/mEDiBGAOhdk0PCChMdnYROKuQIswnZ174/3+g1q4upNptNMVg9Ek3
 UWa6W+doWVOTs9cgfhVMYIdwGp5OecVIt9SKUptDZ8rBuzOFiTGduW3Cdw1E/8s/SZex
 lz7LeHwxKJXl8G0XnpotU3Je/aB5sct2bJcVASNmN8TnbIJ8JnSz1cl9OPLBq586tdA6
 SGBtmkLPp6WvU4Pi2aBeN1QF+7q6iCqIFZ0UASLbWmZbOSZtvy84S19SLskLacyTAH37
 uO/XF9NqIzOrqaAg5lAYP2bIk/QiRQ+1UwisK7xtjwmU/5HogimQn6rFcoO97U2Naf0u
 +PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mokzcWUJeEgdsztBUx3V6Ayus21b4yBmtSSS7BPMiI=;
 b=1v6+I6s7t1KXZkKjdF76vTVafGt1ULt/IKlNhWkbwD1+aUMNr36/y3qzToJ0j6Y99S
 Gu7LA9NC4y+kXf7eaZde8JOxRVdaF8i1szYYPix4Z/HSVP6avN6MAqA6KgZSBRm5REpi
 GhervMiEyb/cqq/fW25NCt+L7sfq/XdV4kwuWuXyDj9/Xa3BxApoiNqzAagJXLMaKztE
 9PB6aP4QyVTdqYRTPiAlnejvHN5yEUGH1sDp92itO9ociX2O0zM2JGLplHeHir8isLP9
 G7S1UV3zgcUOqSZHCPduCn10QgbNysV+NrOURSYl6/JUaY8fGJnZXAGj4Nf4NJoqoya6
 PEsQ==
X-Gm-Message-State: AOAM531/BqjY0MYW03Xn7rmrEoGnWfO80A6EG3j341WjHmnvP1GhW1Eu
 7UKIriL+O8UcKPaC4dlbUWgzCie8JnU=
X-Google-Smtp-Source: ABdhPJzhIiLz0mDyVwfumhtw2MZNZguepzv6N0tFi8ImJ4G3jDykVQHUs+A2TFwxcIfNMnCY0QMuPQ==
X-Received: by 2002:a63:4721:0:b0:382:70fa:479d with SMTP id
 u33-20020a634721000000b0038270fa479dmr3717925pga.259.1648594829563; 
 Tue, 29 Mar 2022 16:00:29 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090a660600b001c985b0cb53sm3906992pjj.26.2022.03.29.16.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:00:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/msm/gem: Drop PAGE_SHIFT for address space mm
Date: Tue, 29 Mar 2022 16:00:52 -0700
Message-Id: <20220329230105.601666-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329230105.601666-1-robdclark@gmail.com>
References: <20220329230105.601666-1-robdclark@gmail.com>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Get rid of all the unnecessary conversion between address/size and page
offsets.  It just confuses things.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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

