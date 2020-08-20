Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD624C163
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4426E963;
	Thu, 20 Aug 2020 15:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 548D06E963
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:09:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A704E1477;
 Thu, 20 Aug 2020 08:09:35 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 226C33F6CF;
 Thu, 20 Aug 2020 08:09:32 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 11/18] iommu/omap: Add IOMMU_DOMAIN_DMA support
Date: Thu, 20 Aug 2020 16:08:30 +0100
Message-Id: <5ac3788f9f61f7698cfa9c5924d62714e230f678.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that arch/arm is wired up for default domains and iommu-dma,
implement the corresponding driver-side support for DMA domains.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/omap-iommu.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 71f29c0927fc..ea25c2fe0418 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -9,6 +9,7 @@
  *		Paul Mundt and Toshihiro Kobayashi
  */
 
+#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -1574,13 +1575,19 @@ static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
 
+	if (type == IOMMU_DOMAIN_DMA &&
+	    iommu_get_dma_cookie(&omap_domain->domain)) {
+		kfree(omap_domain);
+		return NULL;
+	}
+
 	spin_lock_init(&omap_domain->lock);
 
 	omap_domain->domain.geometry.aperture_start = 0;
@@ -1601,6 +1608,7 @@ static void omap_iommu_domain_free(struct iommu_domain *domain)
 	if (omap_domain->dev)
 		_omap_iommu_detach_dev(omap_domain, omap_domain->dev);
 
+	iommu_put_dma_cookie(&omap_domain->domain);
 	kfree(omap_domain);
 }
 
@@ -1736,6 +1744,17 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 	return group;
 }
 
+static int omap_iommu_of_xlate(struct device *dev,
+			       struct of_phandle_args *args)
+{
+	/*
+	 * Logically, some of the housekeeping from _omap_iommu_add_device()
+	 * should probably move here, but the minimum we *need* is simply to
+	 * cooperate with of_iommu at all to let iommu-dma work.
+	 */
+	return 0;
+}
+
 static const struct iommu_ops omap_iommu_ops = {
 	.domain_alloc	= omap_iommu_domain_alloc,
 	.domain_free	= omap_iommu_domain_free,
@@ -1747,6 +1766,7 @@ static const struct iommu_ops omap_iommu_ops = {
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
+	.of_xlate	= omap_iommu_of_xlate,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 };
 
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
