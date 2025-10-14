Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFD9BD7D15
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D5110E558;
	Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoHr8uyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5710E556;
 Tue, 14 Oct 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426038; x=1791962038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P2QNcAZ3rhlX78cop+t4GkPvosjyx5jbrk1Mytyg8YM=;
 b=QoHr8uypTtBjBNdr9MLwik84btLYA9Y4hNac/xcwhEP0eA3FGV/hWcZM
 5FK0BugZjcr4GlCUFUHq17iH2fPN8bKJkQnGrVS58ABss9jiPWgM7VdW+
 XkBu8GWrBgGShILuZ2nJ8f03XeB/2qpQ/zgaTXU6z4lj39+U8YmzA2M3P
 L7ykOHSf8CVFuOmH8v9lNWLMdwH5Qjrn2h5p7RcqozqXD6swiaKjTumMg
 ycha5bS9NICfbUe7JyZQ8+oRNlpI9qO/wcx5IatRnR4wCZ4aIHFmoKjty
 hBo2DzyAj9md0lqrCnjYpT5rL0i4/F5sBXTQhOblyBdrMzFKa06ybvaP/ w==;
X-CSE-ConnectionGUID: IVX3wBmRTsuNgpbnq03f7w==
X-CSE-MsgGUID: VLJuUD7jRqWVKF3Upnn+9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257126"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257126"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
X-CSE-ConnectionGUID: jTwE0LiySvOx6bnamqAdRA==
X-CSE-MsgGUID: Yd7pHC4xRtebR/1YVwDa3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369862"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC 4/8] vfio/pci/dmabuf: Add support for IOV interconnect
Date: Tue, 14 Oct 2025 00:08:54 -0700
Message-ID: <20251014071243.811884-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for IOV interconnect by provding ops for map/unmap and
match interconnect. Note that the xarray is populated with entries
of type struct range. The range struct contains the start and end
address of the memory region.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 141 ++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index eaba010777f3..c45c1a7923f8 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -4,6 +4,7 @@
 #include <linux/dma-buf.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/dma-resv.h>
+#include <linux/range.h>
 
 #include "vfio_pci_priv.h"
 
@@ -16,15 +17,138 @@ struct vfio_pci_dma_buf {
 	size_t size;
 	struct phys_vec *phys_vec;
 	struct p2pdma_provider *provider;
+	struct dma_buf_iov_interconnect *iov_ic;
 	u32 nr_ranges;
 	u8 revoked : 1;
 };
 
+static int
+vfio_pci_create_iov_match(struct vfio_pci_dma_buf *priv,
+			  struct vfio_device_feature_dma_buf *dma_buf)
+{
+	struct dma_buf_iov_interconnect *iov_ic;
+
+	iov_ic = kzalloc(sizeof(*iov_ic), GFP_KERNEL);
+	if (!iov_ic)
+		return -ENOMEM;
+
+	iov_ic->base.type = DMA_BUF_INTERCONNECT_IOV;
+	iov_ic->pdev = priv->vdev->pdev;
+	iov_ic->bar = dma_buf->region_index;
+
+	priv->iov_ic = iov_ic;
+	return 0;
+}
+
+static int vfio_pci_map_iov_interconnect(struct vfio_pci_dma_buf *priv,
+					 struct xarray *ranges)
+{
+	struct phys_vec *phys_vec = priv->phys_vec;
+	struct range *range;
+	unsigned long i;
+	void *entry;
+	int ret;
+
+	range = kmalloc_array(priv->nr_ranges, sizeof(*range), GFP_KERNEL);
+	if (!range)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->nr_ranges; i++) {
+		entry = &range[i];
+		range[i].start = phys_vec[i].paddr;
+		range[i].end = phys_vec[i].paddr + phys_vec[i].len - 1;
+
+		entry = xa_store(ranges, i, entry, GFP_KERNEL);
+		if (xa_is_err(entry)) {
+			ret = xa_err(entry);
+			goto err_free_range;
+		}
+	}
+	return 0;
+
+err_free_range:
+	kfree(range);
+	return ret;
+}
+
+static int vfio_pci_map_interconnect(struct dma_buf_attachment *attachment,
+				     struct dma_buf_ranges *ranges)
+{
+	enum dma_buf_interconnect_type type = attachment->interconnect.type;
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	int ret = -EINVAL;
+
+	ranges->nranges = priv->nr_ranges;
+
+	if (type == DMA_BUF_INTERCONNECT_IOV)
+		ret = vfio_pci_map_iov_interconnect(priv, &ranges->ranges);
+	return ret;
+}
+
+static void vfio_pci_unmap_interconnect(struct dma_buf_attachment *attachment,
+					struct dma_buf_ranges *ranges)
+{
+	void *entry;
+
+	entry = xa_load(&ranges->ranges, 0);
+	kfree(entry);
+}
+
+static bool
+vfio_pci_match_iov_interconnect(const struct dma_buf_interconnect *exp,
+				const struct dma_buf_interconnect *imp)
+{
+	const struct dma_buf_iov_interconnect *exp_ic =
+		container_of(exp, struct dma_buf_iov_interconnect, base);
+	const struct dma_buf_iov_interconnect *imp_ic =
+		container_of(imp, struct dma_buf_iov_interconnect, base);
+
+	return imp_ic->pdev == pci_physfn(exp_ic->pdev) &&
+	       imp_ic->bar == exp_ic->bar;
+}
+
+static bool
+vfio_pci_match_interconnect(const struct dma_buf_interconnect *exp,
+			    const struct dma_buf_interconnect *imp)
+{
+	enum dma_buf_interconnect_type type = exp->type;
+
+	switch (type) {
+	case DMA_BUF_INTERCONNECT_IOV:
+		return vfio_pci_match_iov_interconnect(exp, imp);
+	default:
+		return false;
+	}
+}
+
+static bool
+vfio_pci_match_interconnects(struct vfio_pci_dma_buf *priv,
+			     struct dma_buf_attachment *attachment)
+{
+	const struct dma_buf_attach_ops *aops = attachment->importer_ops;
+	struct pci_dev *pdev = priv->vdev->pdev;
+	unsigned int bar = priv->iov_ic->bar;
+	const struct dma_buf_interconnect_match supports_ics[] = {
+		CREATE_IOV_INTERCONNECT(pdev, bar),
+	};
+
+	if (attachment->allow_ic) {
+		if (aops->supports_interconnects(attachment, supports_ics,
+						 ARRAY_SIZE(supports_ics)))
+			return true;
+	}
+	return false;
+}
+
 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 				   struct dma_buf_attachment *attachment)
 {
 	struct vfio_pci_dma_buf *priv = dmabuf->priv;
 
+	if (vfio_pci_match_interconnects(priv, attachment)) {
+		return 0;
+	}
+
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
 
@@ -189,6 +313,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 	return ERR_PTR(ret);
 }
 
+
 static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir)
@@ -228,15 +353,23 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 		vfio_device_put_registration(&priv->vdev->vdev);
 	}
 	kfree(priv->phys_vec);
+	kfree(priv->iov_ic);
 	kfree(priv);
 }
 
+static const struct dma_buf_interconnect_ops vfio_pci_interconnect_ops = {
+	.match_interconnect = vfio_pci_match_interconnect,
+	.map_interconnect = vfio_pci_map_interconnect,
+	.unmap_interconnect = vfio_pci_unmap_interconnect,
+};
+
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
 	.attach = vfio_pci_dma_buf_attach,
 	.detach = vfio_pci_dma_buf_detach,
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.release = vfio_pci_dma_buf_release,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
+	.interconnect_ops = &vfio_pci_interconnect_ops,
 };
 
 static void dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
@@ -365,6 +498,10 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 		goto err_free_phys;
 	}
 
+	ret = vfio_pci_create_iov_match(priv, &get_dma_buf);
+	if (ret)
+		goto err_dev_put;
+
 	exp_info.ops = &vfio_pci_dmabuf_ops;
 	exp_info.size = priv->size;
 	exp_info.flags = get_dma_buf.open_flags;
@@ -373,7 +510,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	priv->dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(priv->dmabuf)) {
 		ret = PTR_ERR(priv->dmabuf);
-		goto err_dev_put;
+		goto err_free_iov;
 	}
 
 	/* dma_buf_put() now frees priv */
@@ -391,6 +528,8 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	 */
 	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
 
+err_free_iov:
+	kfree(priv->iov_ic);
 err_dev_put:
 	vfio_device_put_registration(&vdev->vdev);
 err_free_phys:
-- 
2.50.1

