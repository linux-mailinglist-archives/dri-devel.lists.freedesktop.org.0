Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9478C1B1F15
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB366E8BC;
	Tue, 21 Apr 2020 06:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1CB6E598
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:03:45 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id di6so4664418qvb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AL7hXb8H/qoBJbDBZohhbHzSXTKh5iAM3hIyFPRwuxM=;
 b=VbG3OkuzryiADo+SuBJMbjRhDLggqq8Z1nhcUstkpW0HmJY80ivSzoVD2bIoL6+c7I
 Uuz2QniB7Z5CqT94K3NPuYYbVgEk167cNocTu/UlsjOALbqUng7Q1NVdJibuQAanmatL
 DduIC6hLlqo28IdSPd0YwUcYBhPtHmyeb29iL7yLS77UHGjIR2tuLHes5h98hsDaEwQS
 /oKP9LDWnrAJD5oEEpwSKM6ofmER19wQeJE8eZQ42tTaJJFNsy4QFfd4A0MmR+8EvgXc
 1y9+4KleZ3lbmFCkeUINytrZV/azWgy2U9PJ4oZlHOt3Yae9ET3/FjlGOZJty3tL+svC
 NeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AL7hXb8H/qoBJbDBZohhbHzSXTKh5iAM3hIyFPRwuxM=;
 b=e8SfAVfn6x6FGe3D0TdcxmDIFyHeGJ/WIsWKX20nsIcuemvyrVjE28Cd4GHufm/5qL
 lXmAnV0Jgcfa7Qx0vrAoecxJYswa10pTnwZaXHkiYUP0FYXphMmm9J0MezOWFnmc8yAG
 aORT5NAjSS4CbQnD3tHI5UQbINwQbY3GMgqvnteYvdA7/vIeKOiY7EXX3z9IsD2Bvrl0
 QqvxwduzEzYBiBA6zDpq/r/mHwHeTTpBzAkI7aEp54AF7R5sbPycywNoHfbtowOR5m1j
 PT8l2YQfq6ecTssHv3iDEcPGY3VNnUVGr7dNb/+JrmLwBDcRvv1w4U2s59xmc8k6PCvG
 yvGg==
X-Gm-Message-State: AGi0PuZVhqMXUqT2h0rao1t//Elxhad2NOvZ6GGpxfewESsLH5TAlrht
 WONlo97KkCFD60qd0S5KR3y3jw==
X-Google-Smtp-Source: APiQypJbBE+wFH9zAewo04smsE28aAKfYYfnbIhgn83376FC45tY9AalDkIrTnMLrKQ/dym8U3JM0Q==
X-Received: by 2002:a0c:f38d:: with SMTP id i13mr15276070qvk.187.1587391423430; 
 Mon, 20 Apr 2020 07:03:43 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:03:42 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/9] drm/msm/a6xx: allow allocating GMU memory with a fixed
 address
Date: Mon, 20 Apr 2020 10:03:07 -0400
Message-Id: <20200420140313.7263-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 748cd379065f..c6ecb3189ec5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -938,8 +938,8 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
 	kfree(bo);
 }
 
-static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
-		size_t size)
+static struct a6xx_gmu_bo *
+a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, size_t size, uint64_t iova)
 {
 	struct a6xx_gmu_bo *bo;
 	int ret, count, i;
@@ -964,13 +964,13 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 			goto err;
 	}
 
-	bo->iova = gmu->uncached_iova_base;
+	bo->iova = iova ?: gmu->uncached_iova_base;
 
 	for (i = 0; i < count; i++) {
 		ret = iommu_map(gmu->domain,
 			bo->iova + (PAGE_SIZE * i),
 			page_to_phys(bo->pages[i]), PAGE_SIZE,
-			IOMMU_READ | IOMMU_WRITE);
+			IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV);
 
 		if (ret) {
 			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU buffer object\n");
@@ -990,7 +990,8 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
 		goto err;
 
 	/* Align future IOVA addresses on 1MB boundaries */
-	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
+	if (!iova)
+		gmu->uncached_iova_base += ALIGN(size, SZ_1M);
 
 	return bo;
 
@@ -1331,12 +1332,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_put_device;
 
 	/* Allocate memory for for the HFI queues */
-	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
+	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
 	if (IS_ERR(gmu->hfi))
 		goto err_memory;
 
 	/* Allocate memory for the GMU debug region */
-	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K);
+	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
 	if (IS_ERR(gmu->debug))
 		goto err_memory;
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
