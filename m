Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410AB151BBF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 14:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C376EF31;
	Tue,  4 Feb 2020 13:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2556EF2E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 13:59:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so23171183wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 05:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bb72YdIfe2zNeCHRPrpuu7rW8TTiJXrWVPB/6q5eWKE=;
 b=lWNguhfPY7ZiAvkv9WoXZsNJy3tbJ3AqtFEqOa5MGIELpK0lSm8FaEdn+kNu594eYr
 AI5TPz9FJiHnIr0Bx7kDCc/SPdu+Kfizf/AbucYX0knIXa1TFMufR2GMo0VHt1tD2ofQ
 /79haRj0fOezg6bo1sNkgTgIhe6TdnZUonI6ZaI+AQJNcNLjnAYMQUV+00bteM245N/R
 sSMbpHbuh7AYHUKD9ZSVA1wcyWTjkm2O1jg+cDL7cZanSequY9RHkFB0eQFWp8m26cDi
 tVkCgDzDWYEX5xdMTfJvXUzwaTVgVSewGOxBoX9F7VJt/4mtE/CyNPwEOcBHjO5UYk2V
 4DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bb72YdIfe2zNeCHRPrpuu7rW8TTiJXrWVPB/6q5eWKE=;
 b=SsE1udaXTm0xgzIbj151goAMCE+4GaQAvH8KFEMUe0+SA9NdnsStbYrUeEYXgStqfp
 aQpdMzOpri9KIT0+Hs2AhU/7M1ypvmZyGMoLC1t0yN9EbctgwKKj0XzZijcBOTGCFDup
 hVhVX5550bfONaNtaKL/xQ+lAab8Uce3Pa6PeGQuj61RyBFRSJp4fYSRoCXp+z/Ee49Z
 W82DIkLA3qdGoSXCjCbo1p8juUZcQrd1XwhH1GyaZJ207m2krmPQiSufa8iXoF6s1lDE
 ESja4UfWg/DFx5xMQg6bpNPeJNg4SWtuiZkL9GaO+h3+ZwK1LUk9o9Q4Kt0A+/jiwCnP
 X/YQ==
X-Gm-Message-State: APjAAAUfZ5752TDLlex8ab08irZMtml43Zelgrrr5XhODg4oD6hD5Woo
 LYkXTm5ldd8maBP7DkojFc3QjZAq
X-Google-Smtp-Source: APXvYqwFcnbIevzPKB0DkooteCUw0UdLNX3R3kXaIFJERi5Ivf3OHu+ZhhoCs3SbEo1Qthe2XjbrrA==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr21758396wrs.303.1580824776662; 
 Tue, 04 Feb 2020 05:59:36 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id s12sm13476890wrw.20.2020.02.04.05.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 05:59:35 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
Date: Tue,  4 Feb 2020 14:59:25 +0100
Message-Id: <20200204135926.1156340-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204135926.1156340-1-thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This partially reverts the DMA API support that was recently merged
because it was causing performance regressions on older Tegra devices.
Unfortunately, the cache maintenance performed by dma_map_sg() and
dma_unmap_sg() causes performance to drop by a factor of 10.

The right solution for this would be to cache mappings for buffers per
consumer device, but that's a bit involved. Instead, we simply revert to
the old behaviour of sharing IOVA mappings when we know that devices can
do so (i.e. they share the same IOMMU domain).

Reported-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c   | 10 +++++++-
 drivers/gpu/drm/tegra/plane.c | 44 ++++++++++++++++++++---------------
 drivers/gpu/host1x/job.c      | 32 ++++++++++++++++++++++---
 3 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 1237df157e05..623768100c6a 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -60,8 +60,16 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
 	/*
 	 * If we've manually mapped the buffer object through the IOMMU, make
 	 * sure to return the IOVA address of our mapping.
+	 *
+	 * Similarly, for buffers that have been allocated by the DMA API the
+	 * physical address can be used for devices that are not attached to
+	 * an IOMMU. For these devices, callers must pass a valid pointer via
+	 * the @phys argument.
+	 *
+	 * Imported buffers were also already mapped at import time, so the
+	 * existing mapping can be reused.
 	 */
-	if (phys && obj->mm) {
+	if (phys) {
 		*phys = obj->iova;
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index cadcdd9ea427..9ccfb56e9b01 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2017 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/iommu.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
@@ -107,21 +109,27 @@ const struct drm_plane_funcs tegra_plane_funcs = {
 
 static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 {
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dc->dev);
 	unsigned int i;
 	int err;
 
 	for (i = 0; i < state->base.fb->format->num_planes; i++) {
 		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
+		dma_addr_t phys_addr, *phys;
+		struct sg_table *sgt;
 
-		if (!dc->client.group) {
-			struct sg_table *sgt;
+		if (!domain || dc->client.group)
+			phys = &phys_addr;
+		else
+			phys = NULL;
 
-			sgt = host1x_bo_pin(dc->dev, &bo->base, NULL);
-			if (IS_ERR(sgt)) {
-				err = PTR_ERR(sgt);
-				goto unpin;
-			}
+		sgt = host1x_bo_pin(dc->dev, &bo->base, phys);
+		if (IS_ERR(sgt)) {
+			err = PTR_ERR(sgt);
+			goto unpin;
+		}
 
+		if (sgt) {
 			err = dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
 					 DMA_TO_DEVICE);
 			if (err == 0) {
@@ -143,7 +151,7 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 			state->iova[i] = sg_dma_address(sgt->sgl);
 			state->sgt[i] = sgt;
 		} else {
-			state->iova[i] = bo->iova;
+			state->iova[i] = phys_addr;
 		}
 	}
 
@@ -156,9 +164,11 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
 		struct sg_table *sgt = state->sgt[i];
 
-		dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
-		host1x_bo_unpin(dc->dev, &bo->base, sgt);
+		if (sgt)
+			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
+				     DMA_TO_DEVICE);
 
+		host1x_bo_unpin(dc->dev, &bo->base, sgt);
 		state->iova[i] = DMA_MAPPING_ERROR;
 		state->sgt[i] = NULL;
 	}
@@ -172,17 +182,13 @@ static void tegra_dc_unpin(struct tegra_dc *dc, struct tegra_plane_state *state)
 
 	for (i = 0; i < state->base.fb->format->num_planes; i++) {
 		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
+		struct sg_table *sgt = state->sgt[i];
 
-		if (!dc->client.group) {
-			struct sg_table *sgt = state->sgt[i];
-
-			if (sgt) {
-				dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
-					     DMA_TO_DEVICE);
-				host1x_bo_unpin(dc->dev, &bo->base, sgt);
-			}
-		}
+		if (sgt)
+			dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
+				     DMA_TO_DEVICE);
 
+		host1x_bo_unpin(dc->dev, &bo->base, sgt);
 		state->iova[i] = DMA_MAPPING_ERROR;
 		state->sgt[i] = NULL;
 	}
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 60b2fedd0061..8198a4d42c77 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/host1x.h>
+#include <linux/iommu.h>
 #include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/scatterlist.h>
@@ -101,9 +102,11 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
 	struct host1x_client *client = job->client;
 	struct device *dev = client->dev;
+	struct iommu_domain *domain;
 	unsigned int i;
 	int err;
 
+	domain = iommu_get_domain_for_dev(dev);
 	job->num_unpins = 0;
 
 	for (i = 0; i < job->num_relocs; i++) {
@@ -117,7 +120,19 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		if (client->group)
+		/*
+		 * If the client device is not attached to an IOMMU, the
+		 * physical address of the buffer object can be used.
+		 *
+		 * Similarly, when an IOMMU domain is shared between all
+		 * host1x clients, the IOVA is already available, so no
+		 * need to map the buffer object again.
+		 *
+		 * XXX Note that this isn't always safe to do because it
+		 * relies on an assumption that no cache maintenance is
+		 * needed on the buffer objects.
+		 */
+		if (!domain || client->group)
 			phys = &phys_addr;
 		else
 			phys = NULL;
@@ -176,6 +191,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		dma_addr_t phys_addr;
 		unsigned long shift;
 		struct iova *alloc;
+		dma_addr_t *phys;
 		unsigned int j;
 
 		g->bo = host1x_bo_get(g->bo);
@@ -184,7 +200,17 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		sgt = host1x_bo_pin(host->dev, g->bo, NULL);
+		/**
+		 * If the host1x is not attached to an IOMMU, there is no need
+		 * to map the buffer object for the host1x, since the physical
+		 * address can simply be used.
+		 */
+		if (!iommu_get_domain_for_dev(host->dev))
+			phys = &phys_addr;
+		else
+			phys = NULL;
+
+		sgt = host1x_bo_pin(host->dev, g->bo, phys);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
 			goto unpin;
@@ -214,7 +240,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 
 			job->unpins[job->num_unpins].size = gather_size;
 			phys_addr = iova_dma_addr(&host->iova, alloc);
-		} else {
+		} else if (sgt) {
 			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
 					 DMA_TO_DEVICE);
 			if (!err) {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
