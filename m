Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D72AC77C9
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAF410E6E4;
	Thu, 29 May 2025 05:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG9nx8BH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9AA10E274
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497337; x=1780033337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p31VmxVilMXC9KdxzlBocv0GuObtBaCJYVrKzleJOVk=;
 b=ZG9nx8BHqEP/chC3pzlp0J2pqRgjF9GEzvXMnk8oKlhr/8C6ctWR9WHW
 2Z1Vl8he/zDaj8d0LcwkV57KoncCZWUmYma2Fq26vH8kFw6Gpw6KIMguO
 IZbWAOzF0OA30Qr4U833vngpVyF+I20E9I3TiDSB+1uktplAp9gX8yAkV
 elbULIk24EOBAeIW2CxBmD2BnPqvYlEpYfVOgge1zOHwEi7fmKcikPKnq
 zIbLeGrwQprSfoh7bmPZ5JcaPQB5enPZHr4GqysZMERQWj2NpvaD/df8M
 WOoi0gOmyVAMdHH/k6aJIuymExOi2OduNnhqxwQATS5ZKqnIk6L3DtPp7 Q==;
X-CSE-ConnectionGUID: FcJveuSISyuZtg/5g3aNqA==
X-CSE-MsgGUID: UubCEllVT3qWofVvBGnU7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67962973"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67962973"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:42:17 -0700
X-CSE-ConnectionGUID: zcK+C4NbTKClBEhaxo9Yyw==
X-CSE-MsgGUID: U/QnultNSjmn5UPRmf0Lxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443303"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:42:10 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 06/30] HACK: vfio/pci: Support get_pfn() callback for
 dma-buf
Date: Thu, 29 May 2025 13:34:49 +0800
Message-Id: <20250529053513.1592088-7-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

This is to support private device/MMMIO assignment, but is an
incomplete implementation as discussed. In this case, VFIO PCI act as
the exporter for MMIO regions and KVM is the importer. KVM imports the
dma-buf FD and gets MMIO pfn through dma_buf_ops.get_pfn(), then map
the pfn in KVM MMU. KVM should also react to dma-buf move notify, unmap
all pfns when VFIO revokes the MMIOs. I.e VFIO controls the lifetime of
the MMIOs.

Previously, KVM uses follow_pfn() to get the MMIO pfn. With dma-buf,
KVM no longer needs to firstly map the MMIOs to host page table. It
also solves the concern in Confidential Computing (CC) that host is not
allowed to have mapping to private resources owned by guest.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index a4c313ca5bda..cf9a90448856 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -174,6 +174,39 @@ static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
 	kfree(sgt);
 }
 
+static int vfio_pci_dma_buf_get_pfn(struct dma_buf_attachment *attachment,
+				    pgoff_t pgoff, u64 *pfn, int *max_order)
+{
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	struct vfio_region_dma_range *dma_ranges = priv->dma_ranges;
+	u64 offset = pgoff << PAGE_SHIFT;
+	int i;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	if (priv->revoked)
+		return -ENODEV;
+
+	if (offset >= priv->dmabuf->size)
+		return -EINVAL;
+
+	for (i = 0; i < priv->nr_ranges; i++) {
+		if (offset < dma_ranges[i].length)
+			break;
+
+		offset -= dma_ranges[i].length;
+	}
+
+	*pfn = PHYS_PFN(pci_resource_start(priv->vdev->pdev, dma_ranges[i].region_index) +
+			dma_ranges[i].offset + offset);
+
+	/* TODO: large page mapping is yet to be supported */
+	if (max_order)
+		*max_order = 0;
+
+	return 0;
+}
+
 static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 {
 	struct vfio_pci_dma_buf *priv = dmabuf->priv;
@@ -198,6 +231,7 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.unpin = vfio_pci_dma_buf_unpin,
 	.release = vfio_pci_dma_buf_release,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
+	.get_pfn = vfio_pci_dma_buf_get_pfn,
 };
 
 static int check_dma_ranges(struct vfio_pci_dma_buf *priv,
-- 
2.25.1

