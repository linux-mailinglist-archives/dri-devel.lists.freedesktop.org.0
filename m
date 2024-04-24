Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5848B018A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673010EA9B;
	Wed, 24 Apr 2024 06:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="Fx2BA5Br";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DDE10EA9B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lE+uUC1d7L8x6K9peDBJlZu6EwrH1fp2nIPWGDlX1GY=; b=Fx2BA5BrSdIYO5eKNmn2YR4o7A
 YOGDOdQaGmcg7ruuicLer8gg7lcomsgFbCrR0TK8jOwNCCX49sNUN7JucDt1E5vKmCU9q5cVgau1Q
 AuruM7kJjENp/Mv00rRwSCOKuQvSss666uuwsj/mqoCO5HlJ6RAEQ32d4qslDrPJ7qUPE9WsthPWV
 2AM4H0PFgYS/SV4ZaR06JF2N/mPNPlTI6y4jruyfvb7T5cfqtpCC7cn/sZ4wK5xXlpDfD3M+lp9EO
 cGIweEcH01C2pmCfDv3GQOYADiTd2LLFXlq/+sKPxdE7VVZGiYV1XonIhpBRJuSUyh3O+6Pn4zat4
 kDLXvFOg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1rzUx4-00BBnQ-02;
 Wed, 24 Apr 2024 08:13:50 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] drm/tegra: gem: Don't attach dma-bufs when not needed
Date: Wed, 24 Apr 2024 08:13:35 +0300
Message-ID: <20240424051335.2872574-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240424051335.2872574-1-cyndis@kapsi.fi>
References: <20240424051335.2872574-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Mikko Perttunen <mperttunen@nvidia.com>

The dma-buf import code currently attaches and maps all imported
dma-bufs to the drm device to get their sgt for mapping to the
directly managed IOMMU domain.

In many cases, like for newer chips (Tegra186+), the directly
managed IOMMU domain is, however, not used. Mapping to the drm
device can also cause issues e.g. with swiotlb since it is not
a real device.

To improve the situation, only attach and map imported dma-bufs
when required.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 66 ++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/gem.h | 21 ++++++++++++
 2 files changed, 57 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 189861c6c630..d275404ad0e9 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -76,8 +76,8 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 	/*
 	 * Imported buffers need special treatment to satisfy the semantics of DMA-BUF.
 	 */
-	if (gem->import_attach) {
-		struct dma_buf *buf = gem->import_attach->dmabuf;
+	if (obj->dma_buf) {
+		struct dma_buf *buf = obj->dma_buf;
 
 		map->attach = dma_buf_attach(buf, dev);
 		if (IS_ERR(map->attach)) {
@@ -184,8 +184,8 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
 	if (obj->vaddr)
 		return obj->vaddr;
 
-	if (obj->gem.import_attach) {
-		ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
+	if (obj->dma_buf) {
+		ret = dma_buf_vmap_unlocked(obj->dma_buf, &map);
 		if (ret < 0)
 			return ERR_PTR(ret);
 
@@ -208,8 +208,8 @@ static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 	if (obj->vaddr)
 		return;
 
-	if (obj->gem.import_attach)
-		return dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
+	if (obj->dma_buf)
+		return dma_buf_vunmap_unlocked(obj->dma_buf, &map);
 
 	vunmap(addr);
 }
@@ -465,27 +465,32 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	if (IS_ERR(bo))
 		return bo;
 
-	attach = dma_buf_attach(buf, drm->dev);
-	if (IS_ERR(attach)) {
-		err = PTR_ERR(attach);
-		goto free;
-	}
-
-	get_dma_buf(buf);
+	/*
+	 * If we need to use IOMMU API to map the dma-buf into the internally managed
+	 * domain, map it first to the DRM device to get an sgt.
+	 */
+	if (tegra->domain) {
+		attach = dma_buf_attach(buf, drm->dev);
+		if (IS_ERR(attach)) {
+			err = PTR_ERR(attach);
+			goto free;
+		}
 
-	bo->sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
-	if (IS_ERR(bo->sgt)) {
-		err = PTR_ERR(bo->sgt);
-		goto detach;
-	}
+		bo->sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
+		if (IS_ERR(bo->sgt)) {
+			err = PTR_ERR(bo->sgt);
+			goto detach;
+		}
 
-	if (tegra->domain) {
 		err = tegra_bo_iommu_map(tegra, bo);
 		if (err < 0)
 			goto detach;
+
+		bo->gem.import_attach = attach;
 	}
 
-	bo->gem.import_attach = attach;
+	get_dma_buf(buf);
+	bo->dma_buf = buf;
 
 	return bo;
 
@@ -516,20 +521,21 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 				dev_name(mapping->dev));
 	}
 
-	if (tegra->domain)
+	if (tegra->domain) {
 		tegra_bo_iommu_unmap(tegra, bo);
 
-	if (gem->import_attach) {
-		struct dma_buf *dmabuf = gem->import_attach->dmabuf;
-
-		dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
-						  DMA_TO_DEVICE);
-		dma_buf_detach(dmabuf, gem->import_attach);
-		dma_buf_put(dmabuf);
-	} else {
-		tegra_bo_free(gem->dev, bo);
+		if (gem->import_attach) {
+			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
+							  DMA_TO_DEVICE);
+			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
+		}
 	}
 
+	tegra_bo_free(gem->dev, bo);
+
+	if (bo->dma_buf)
+		dma_buf_put(bo->dma_buf);
+
 	drm_gem_object_release(gem);
 	kfree(bo);
 }
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index cb5146a67668..bf2cbd48eb3f 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -32,6 +32,26 @@ struct tegra_bo_tiling {
 	enum tegra_bo_sector_layout sector_layout;
 };
 
+/*
+ * How memory is referenced within a tegra_bo:
+ *
+ * Buffer source  | Mapping API(*)  | Fields
+ * ---------------+-----------------+---------------
+ * Allocated here | DMA API         | iova (IOVA mapped to drm->dev), vaddr (CPU VA)
+ *
+ * Allocated here | IOMMU API       | pages/num_pages (Phys. memory), sgt (Mapped to drm->dev),
+ *                                  | iova/size (Mapped to domain)
+ *
+ * Imported       | DMA API         | dma_buf (Imported dma_buf)
+ *
+ * Imported       | IOMMU API       | dma_buf (Imported dma_buf),
+ *                                  | gem->import_attach (Attachment on drm->dev),
+ *                                  | sgt (Mapped to drm->dev)
+ *                                  | iova/size (Mapped to domain)
+ *
+ * (*) If tegra->domain is set, i.e. TegraDRM IOMMU domain is directly managed through IOMMU API,
+ *     this is IOMMU API. Otherwise DMA API.
+ */
 struct tegra_bo {
 	struct drm_gem_object gem;
 	struct host1x_bo base;
@@ -39,6 +59,7 @@ struct tegra_bo {
 	struct sg_table *sgt;
 	dma_addr_t iova;
 	void *vaddr;
+	struct dma_buf *dma_buf;
 
 	struct drm_mm_node *mm;
 	unsigned long num_pages;
-- 
2.42.0

