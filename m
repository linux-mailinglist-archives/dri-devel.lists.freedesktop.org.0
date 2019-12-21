Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4E1292DF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5016E595;
	Mon, 23 Dec 2019 08:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D990B6E480
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 15:04:20 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id dc19so11377439edb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 07:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYBMxHbMND3KXJAAlRHvXU1gMqhOszki9jNdzLeiJU4=;
 b=OfH7P/O33XqVmrRHuQ/69BFU28v+MGMIwEx7w/umhnY1qNKXSsCGq1Cwaq7vbEzLMp
 1ksjMyjtAT7hWlwrLscfQ77QvEuhl13Swd9KWJGnv0QAQ12Z4EMmc0UBnDdMMC+fXDOJ
 AwGTYVg3PMuc/dPZ45WbnbZxhIn8YgFF6EoHwr+nGZQHnCr6DhBjsrSxM9L9AHr6Caov
 mXYjg4dRT2WuQhsh/0gAG0D+t+HUDuGU7Nr7pKzkderovTZvMGtj+Zix8GpyJLSUDu3F
 9RO4rb75QMNfDN91pVMg46S9XuW7CZvVU6kXu8d0DBfHs3P12+Wv2dYSOCKjy0bOS/Il
 93QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYBMxHbMND3KXJAAlRHvXU1gMqhOszki9jNdzLeiJU4=;
 b=WmYGf9012UukSlY7YFaRrXvdVATTTGNJPJJonzaehX9GxD5HHGj4xr3w3F4TemvVE+
 61ahMDZI5kbcfwIYhzkbdxF+DEYwl8QYLJlOcFT+Q83Jzh+NLnOLBKzq+vYfOesjS2Nz
 2TSzI3kwyo48tTbvgC5jwkoTZWOYchJSTSFKj6Cs2jjmvcP6ur0SfuRC57Je08sk4YPo
 WLDEnMl6PkhUo3w+u1ZKe/Uenf0K6UOibp7vXu2qkE35zx+a6fF54H1VMhBOKf7XVtRg
 SGJxQ9kwFnRr6B71K2zhJ1VB6H0SkBFGojVAo9L2v/oYDwP2sf2jrmmXtowt1RLxwl3c
 ZdqQ==
X-Gm-Message-State: APjAAAUAQLDjSCQ+EvRkWTSqmXflJlYttjWcoywt8VRNihGJu5QyowUP
 TyHKRCBGLHJQSuG0UeJ6GXedaw==
X-Google-Smtp-Source: APXvYqxT2LSHoXL54d4LTh1o2yBuykvAD28LUC42eFWoj6JLm/GJqllZFuXkdK3UEroGowvwPF7Zpw==
X-Received: by 2002:a17:906:5448:: with SMTP id
 d8mr22606596ejp.254.1576940659410; 
 Sat, 21 Dec 2019 07:04:19 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
 by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 07:04:18 -0800 (PST)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/8] iommu/vt-d: clean up 32bit si_domain assignment
Date: Sat, 21 Dec 2019 15:03:53 +0000
Message-Id: <20191221150402.13868-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Kukjin Kim <kgene@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the intel iommu driver devices which only support 32bit DMA can't be
direct mapped. The implementation of this is weird. Currently we assign
it a direct mapped domain and then remove the domain later and replace
it with a domain of type IOMMU_DOMAIN_IDENTITY. We should just assign it
a domain of type IOMMU_DOMAIN_IDENTITY from the begging rather than
needlessly swapping domains.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/intel-iommu.c | 88 +++++++++++++------------------------
 1 file changed, 31 insertions(+), 57 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0c8d81f56a30..c1ea66467918 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3462,46 +3462,9 @@ static struct dmar_domain *get_private_domain_for_dev(struct device *dev)
 }
 
 /* Check if the dev needs to go through non-identity map and unmap process.*/
-static bool iommu_need_mapping(struct device *dev)
+static bool iommu_no_mapping(struct device *dev)
 {
-	int ret;
-
-	if (iommu_dummy(dev))
-		return false;
-
-	ret = identity_mapping(dev);
-	if (ret) {
-		u64 dma_mask = *dev->dma_mask;
-
-		if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
-			dma_mask = dev->coherent_dma_mask;
-
-		if (dma_mask >= dma_direct_get_required_mask(dev))
-			return false;
-
-		/*
-		 * 32 bit DMA is removed from si_domain and fall back to
-		 * non-identity mapping.
-		 */
-		dmar_remove_one_dev_info(dev);
-		ret = iommu_request_dma_domain_for_dev(dev);
-		if (ret) {
-			struct iommu_domain *domain;
-			struct dmar_domain *dmar_domain;
-
-			domain = iommu_get_domain_for_dev(dev);
-			if (domain) {
-				dmar_domain = to_dmar_domain(domain);
-				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
-			}
-			dmar_remove_one_dev_info(dev);
-			get_private_domain_for_dev(dev);
-		}
-
-		dev_info(dev, "32bit DMA uses non-identity mapping\n");
-	}
-
-	return true;
+	return iommu_dummy(dev) || identity_mapping(dev);
 }
 
 static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
@@ -3568,20 +3531,22 @@ static dma_addr_t intel_map_page(struct device *dev, struct page *page,
 				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
-		return __intel_map_single(dev, page_to_phys(page) + offset,
-				size, dir, *dev->dma_mask);
-	return dma_direct_map_page(dev, page, offset, size, dir, attrs);
+	if (iommu_no_mapping(dev))
+		return dma_direct_map_page(dev, page, offset, size, dir, attrs);
+
+	return __intel_map_single(dev, page_to_phys(page) + offset, size, dir,
+			*dev->dma_mask);
 }
 
 static dma_addr_t intel_map_resource(struct device *dev, phys_addr_t phys_addr,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
-		return __intel_map_single(dev, phys_addr, size, dir,
-				*dev->dma_mask);
-	return dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
+	if (iommu_no_mapping(dev))
+		return dma_direct_map_resource(dev, phys_addr, size, dir,
+				attrs);
+
+	return __intel_map_single(dev, phys_addr, size, dir, *dev->dma_mask);
 }
 
 static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
@@ -3632,16 +3597,16 @@ static void intel_unmap_page(struct device *dev, dma_addr_t dev_addr,
 			     size_t size, enum dma_data_direction dir,
 			     unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
-		intel_unmap(dev, dev_addr, size);
-	else
+	if (iommu_no_mapping(dev))
 		dma_direct_unmap_page(dev, dev_addr, size, dir, attrs);
+	else
+		intel_unmap(dev, dev_addr, size);
 }
 
 static void intel_unmap_resource(struct device *dev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
+	if (!iommu_no_mapping(dev))
 		intel_unmap(dev, dev_addr, size);
 }
 
@@ -3652,7 +3617,7 @@ static void *intel_alloc_coherent(struct device *dev, size_t size,
 	struct page *page = NULL;
 	int order;
 
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_alloc(dev, size, dma_handle, flags, attrs);
 
 	size = PAGE_ALIGN(size);
@@ -3688,7 +3653,7 @@ static void intel_free_coherent(struct device *dev, size_t size, void *vaddr,
 	int order;
 	struct page *page = virt_to_page(vaddr);
 
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_free(dev, size, vaddr, dma_handle, attrs);
 
 	size = PAGE_ALIGN(size);
@@ -3708,7 +3673,7 @@ static void intel_unmap_sg(struct device *dev, struct scatterlist *sglist,
 	struct scatterlist *sg;
 	int i;
 
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_unmap_sg(dev, sglist, nelems, dir, attrs);
 
 	for_each_sg(sglist, sg, nelems, i) {
@@ -3734,7 +3699,7 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 	struct intel_iommu *iommu;
 
 	BUG_ON(dir == DMA_NONE);
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_map_sg(dev, sglist, nelems, dir, attrs);
 
 	domain = deferred_attach_domain(dev);
@@ -3782,7 +3747,7 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 
 static u64 intel_get_required_mask(struct device *dev)
 {
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_get_required_mask(dev);
 	return DMA_BIT_MASK(32);
 }
@@ -5618,9 +5583,13 @@ static int intel_iommu_add_device(struct device *dev)
 	struct iommu_domain *domain;
 	struct intel_iommu *iommu;
 	struct iommu_group *group;
+	u64 dma_mask = *dev->dma_mask;
 	u8 bus, devfn;
 	int ret;
 
+	if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
+		dma_mask = dev->coherent_dma_mask;
+
 	iommu = device_to_iommu(dev, &bus, &devfn);
 	if (!iommu)
 		return -ENODEV;
@@ -5640,7 +5609,12 @@ static int intel_iommu_add_device(struct device *dev)
 	domain = iommu_get_domain_for_dev(dev);
 	dmar_domain = to_dmar_domain(domain);
 	if (domain->type == IOMMU_DOMAIN_DMA) {
-		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
+		/*
+		 * We check dma_mask >= dma_get_required_mask(dev) because
+		 * 32 bit DMA falls back to non-identity mapping.
+		 */
+		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY &&
+				dma_mask >= dma_get_required_mask(dev)) {
 			ret = iommu_request_dm_for_dev(dev);
 			if (ret) {
 				dmar_remove_one_dev_info(dev);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
