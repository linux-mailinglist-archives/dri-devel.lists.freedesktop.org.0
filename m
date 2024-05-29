Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38868D2C85
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 07:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5BC113124;
	Wed, 29 May 2024 05:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sx2vINgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2B3112324
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 05:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716960973; x=1748496973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ybhIC+9D0FzFiBqGh0zAWkB79mgKE5w60y1oFabl/b8=;
 b=Sx2vINgsakEj17UX+hvm9gozdsF9n+3Vor+HTfPXeMG9JMpFxT0HdX8D
 SUGiAADIgz2aVfCoBViOcK/L/rBnksfDPfbQtuQWHOsUFYZZjSSN00YBU
 qArX/Wpvc3p4ofZoSpB8pIIibemn2unMw3Edb1l6VV3GznvXTNP/ulj/b
 sQ+F0UyHAZ0o6T4KDYhZfpNJDurxIJBLs0ONxM8PHNAucGrjzId/nzcYp
 03XkJrhNG3zQA5EsHxpDcHzgqqWmi1Q4JuMK9tKjldeu/+BqucXB3HwQS
 ULoFjwURH1rBsg928XqITx/BBpXF3f5x17ShOt6RYzIVbr9WNv2buWMVg A==;
X-CSE-ConnectionGUID: qvkuLEx5TsKXxaw7907V+g==
X-CSE-MsgGUID: lV2H01SJQcyhSca3AuyNrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13568810"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13568810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:35:20 -0700
X-CSE-ConnectionGUID: Lx3ESut/QGCW7lfZ/TNLuA==
X-CSE-MsgGUID: oyY1KD/nRaOxmUib4QeiUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35257522"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.127])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 22:35:15 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 04/20] vhost-vdpa: Use iommu_user_domain_alloc()
Date: Wed, 29 May 2024 13:32:34 +0800
Message-Id: <20240529053250.91284-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529053250.91284-1-baolu.lu@linux.intel.com>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace iommu_domain_alloc() with iommu_user_domain_alloc().

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/vhost/vdpa.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 63a53680a85c..7784218fd9d2 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -1312,26 +1312,21 @@ static int vhost_vdpa_alloc_domain(struct vhost_vdpa *v)
 	struct vdpa_device *vdpa = v->vdpa;
 	const struct vdpa_config_ops *ops = vdpa->config;
 	struct device *dma_dev = vdpa_get_dma_dev(vdpa);
-	const struct bus_type *bus;
 	int ret;
 
 	/* Device want to do DMA by itself */
 	if (ops->set_map || ops->dma_map)
 		return 0;
 
-	bus = dma_dev->bus;
-	if (!bus)
-		return -EFAULT;
-
 	if (!device_iommu_capable(dma_dev, IOMMU_CAP_CACHE_COHERENCY)) {
 		dev_warn_once(&v->dev,
 			      "Failed to allocate domain, device is not IOMMU cache coherent capable\n");
 		return -ENOTSUPP;
 	}
 
-	v->domain = iommu_domain_alloc(bus);
-	if (!v->domain)
-		return -EIO;
+	v->domain = iommu_user_domain_alloc(dma_dev, 0);
+	if (IS_ERR(v->domain))
+		return PTR_ERR(v->domain);
 
 	ret = iommu_attach_device(v->domain, dma_dev);
 	if (ret)
-- 
2.34.1

