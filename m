Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67286A050A6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D744210E7D2;
	Wed,  8 Jan 2025 02:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7sXf0yC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202E210E7D2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303333; x=1767839333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=otWkkgUeiMivJEjrgfsr/A/0Wt8yPpouFUFtERZOVd0=;
 b=O7sXf0yCz5QnSBtj/5RFICpVrpdVchvfKFPShno968Mv6wkTtfuNXPLF
 iIjaWTSPUkTcNemIncjgva7vXZejNAkj2z6ufSpTW5sOpUBsjSolJXNKN
 3Wr7cnHYLFdXGsRjZUwCpGYVMwnRl/pYVecI3xX+dVrCdB4JtNiJSDeUe
 ABzLQHC438KtPmHLx672O1Q06e5uh+agvo9mHMPWMtz+5T5hAIWBukrSi
 92af52IhNry4Jzj/pv5akT8a7zL/StnrePzKKCY6HYtqCR05+Wa+PvYnx
 gsahiiqUZ63yFmsz+b5f06PDqt5DVLESLgMj6/egum7splMlZlQ1FF88i g==;
X-CSE-ConnectionGUID: PYaN27mJQsmVTufQBnUcqw==
X-CSE-MsgGUID: lpg5FM3iQJecMWkc5tx/GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010506"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010506"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:28:52 -0800
X-CSE-ConnectionGUID: AYUspgPUQrSA4seOzX8GZA==
X-CSE-MsgGUID: ZHy1gbacQMGfWoRc81VWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793662"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:28:47 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com
Cc: yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: [RFC PATCH 05/12] vfio/pci: Support get_pfn() callback for dma-buf
Date: Tue,  7 Jan 2025 22:27:12 +0800
Message-Id: <20250107142719.179636-6-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107142719.179636-1-yilun.xu@linux.intel.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
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

Implement get_pfn() callback for exported MMIO resources.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/pci/dma_buf.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
index 1d5f46744922..ad12cfb85099 100644
--- a/drivers/vfio/pci/dma_buf.c
+++ b/drivers/vfio/pci/dma_buf.c
@@ -33,8 +33,34 @@ static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
 static int vfio_pci_dma_buf_get_pfn(struct dma_buf_attachment *attachment,
 				    pgoff_t pgoff, u64 *pfn, int *max_order)
 {
-	/* TODO */
-	return -EOPNOTSUPP;
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
 }
 
 static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
-- 
2.25.1

