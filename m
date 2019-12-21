Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0D1292C2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2F26E1D3;
	Mon, 23 Dec 2019 08:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BCB6E47B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 15:04:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e10so11389184edv.9
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 07:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g9kFTz+OIjtd02sboEb/xPH2umLLduJGHZnkezx3k0U=;
 b=CTktPvnNq1jyejKuw4FPmsDHJqlMqnIK+LqTDjsTZ1ZsJVdD5K3EVXU9H9QfhP1vZi
 Dr+qg3qIXY699xoJ8F0TOCouYc1BBGbU43hDF2kmAYXm04HO5vI0AZGZAi2jkV0r6EFN
 Uqqu8MF/N0nkVC19U2nfYFQHC/XM6Mw8TaFgZUgu9czVrLEwvawDZRjnsTBB+/yigVh0
 MNGrdrt/6eys15k3D6741eDIFVQEakAIF0yLafdCTI/WakOrjNrokbN5gIZLsHdv6rvT
 JHYoqwNQsVMDBB0wYNztnmjEhP8hzVgepORwDvLZVBZd6aM2+hZeuyiCzwGgtYXJJ1Dy
 5Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g9kFTz+OIjtd02sboEb/xPH2umLLduJGHZnkezx3k0U=;
 b=AEx1h7hd1cqk+qI+IValimyQ54Y4BSsHRJCN3fX8LPw/wbGZHY0jjHS3gjZqkq4b4S
 A/WS7ykcFWbIilMu/OKlFR3T/KgvinetCDSL/iKAiO9NoeBgbuKmahlezx7p8B9DPpXn
 L6jWIUzExqw/XnkVjAZXjyd1rY/joZ5wBsBIR62m/qcH6HoTgWM+wcQHHMD/shFP4l+u
 XOrYXA4z4yNwmZitRpz3HvgeH/9J6+RfGeC5D49hvp+ddeW1k9ox1cWzoNjAZ1kgmG17
 RkW+o6TWnyn3Md5825DgLDyM//xckU+Xm6ZIC1ttU+dHq97iiY/wErRBN5zndpM9MKA8
 G59g==
X-Gm-Message-State: APjAAAXX5Co7Fyi6ITe8YKPlxnzydmWdvTpFFue5X+AFFnJFYhno96hO
 DgLH0F11j+u+o12rt9TlaJLpyg==
X-Google-Smtp-Source: APXvYqz53m9hdZ0HCFwnxdnPVWgrcBCgGDP73tz51CWh/bfe9HlHp6dFxdkAOOP0s/SRLuvh29w7og==
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr22057226edf.75.1576940666211; 
 Sat, 21 Dec 2019 07:04:26 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
 by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 07:04:25 -0800 (PST)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 2/8] iommu/vt-d: Use default dma_direct_* mapping functions
 for direct mapped devices
Date: Sat, 21 Dec 2019 15:03:54 +0000
Message-Id: <20191221150402.13868-3-murphyt7@tcd.ie>
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

We should only assign intel_dma_ops to devices which will actually use
the iommu and let the default fall back dma_direct_* functions handle
all other devices. This won't change any behaviour but will just use the
generic implementations for direct mapped devices rather than intel
specific ones.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/intel-iommu.c | 52 +++++--------------------------------
 1 file changed, 6 insertions(+), 46 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index c1ea66467918..64b1a9793daa 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2794,17 +2794,6 @@ static int __init si_domain_init(int hw)
 	return 0;
 }
 
-static int identity_mapping(struct device *dev)
-{
-	struct device_domain_info *info;
-
-	info = dev->archdata.iommu;
-	if (info && info != DUMMY_DEVICE_DOMAIN_INFO && info != DEFER_DEVICE_DOMAIN_INFO)
-		return (info->domain == si_domain);
-
-	return 0;
-}
-
 static int domain_add_dev_info(struct dmar_domain *domain, struct device *dev)
 {
 	struct dmar_domain *ndomain;
@@ -3461,12 +3450,6 @@ static struct dmar_domain *get_private_domain_for_dev(struct device *dev)
 	return domain;
 }
 
-/* Check if the dev needs to go through non-identity map and unmap process.*/
-static bool iommu_no_mapping(struct device *dev)
-{
-	return iommu_dummy(dev) || identity_mapping(dev);
-}
-
 static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 				     size_t size, int dir, u64 dma_mask)
 {
@@ -3531,9 +3514,6 @@ static dma_addr_t intel_map_page(struct device *dev, struct page *page,
 				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
-	if (iommu_no_mapping(dev))
-		return dma_direct_map_page(dev, page, offset, size, dir, attrs);
-
 	return __intel_map_single(dev, page_to_phys(page) + offset, size, dir,
 			*dev->dma_mask);
 }
@@ -3542,10 +3522,6 @@ static dma_addr_t intel_map_resource(struct device *dev, phys_addr_t phys_addr,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
-	if (iommu_no_mapping(dev))
-		return dma_direct_map_resource(dev, phys_addr, size, dir,
-				attrs);
-
 	return __intel_map_single(dev, phys_addr, size, dir, *dev->dma_mask);
 }
 
@@ -3597,17 +3573,13 @@ static void intel_unmap_page(struct device *dev, dma_addr_t dev_addr,
 			     size_t size, enum dma_data_direction dir,
 			     unsigned long attrs)
 {
-	if (iommu_no_mapping(dev))
-		dma_direct_unmap_page(dev, dev_addr, size, dir, attrs);
-	else
-		intel_unmap(dev, dev_addr, size);
+	intel_unmap(dev, dev_addr, size);
 }
 
 static void intel_unmap_resource(struct device *dev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	if (!iommu_no_mapping(dev))
-		intel_unmap(dev, dev_addr, size);
+	intel_unmap(dev, dev_addr, size);
 }
 
 static void *intel_alloc_coherent(struct device *dev, size_t size,
@@ -3617,9 +3589,6 @@ static void *intel_alloc_coherent(struct device *dev, size_t size,
 	struct page *page = NULL;
 	int order;
 
-	if (iommu_no_mapping(dev))
-		return dma_direct_alloc(dev, size, dma_handle, flags, attrs);
-
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
 
@@ -3653,9 +3622,6 @@ static void intel_free_coherent(struct device *dev, size_t size, void *vaddr,
 	int order;
 	struct page *page = virt_to_page(vaddr);
 
-	if (iommu_no_mapping(dev))
-		return dma_direct_free(dev, size, vaddr, dma_handle, attrs);
-
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
 
@@ -3673,9 +3639,6 @@ static void intel_unmap_sg(struct device *dev, struct scatterlist *sglist,
 	struct scatterlist *sg;
 	int i;
 
-	if (iommu_no_mapping(dev))
-		return dma_direct_unmap_sg(dev, sglist, nelems, dir, attrs);
-
 	for_each_sg(sglist, sg, nelems, i) {
 		nrpages += aligned_nrpages(sg_dma_address(sg), sg_dma_len(sg));
 	}
@@ -3699,8 +3662,6 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 	struct intel_iommu *iommu;
 
 	BUG_ON(dir == DMA_NONE);
-	if (iommu_no_mapping(dev))
-		return dma_direct_map_sg(dev, sglist, nelems, dir, attrs);
 
 	domain = deferred_attach_domain(dev);
 	if (!domain)
@@ -3747,8 +3708,6 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 
 static u64 intel_get_required_mask(struct device *dev)
 {
-	if (iommu_no_mapping(dev))
-		return dma_direct_get_required_mask(dev);
 	return DMA_BIT_MASK(32);
 }
 
@@ -5014,7 +4973,6 @@ int __init intel_iommu_init(void)
 	if (!has_untrusted_dev() || intel_no_bounce)
 		swiotlb = 0;
 #endif
-	dma_ops = &intel_dma_ops;
 
 	init_iommu_pm_ops();
 
@@ -5623,6 +5581,8 @@ static int intel_iommu_add_device(struct device *dev)
 				dev_info(dev,
 					 "Device uses a private identity domain.\n");
 			}
+		} else {
+			dev->dma_ops = &intel_dma_ops;
 		}
 	} else {
 		if (device_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {
@@ -5639,6 +5599,7 @@ static int intel_iommu_add_device(struct device *dev)
 				dev_info(dev,
 					 "Device uses a private dma domain.\n");
 			}
+			dev->dma_ops = &intel_dma_ops;
 		}
 	}
 
@@ -5665,8 +5626,7 @@ static void intel_iommu_remove_device(struct device *dev)
 
 	iommu_device_unlink(&iommu->iommu, dev);
 
-	if (device_needs_bounce(dev))
-		set_dma_ops(dev, NULL);
+	set_dma_ops(dev, NULL);
 }
 
 static void intel_iommu_get_resv_regions(struct device *device,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
