Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536C2C0BC8D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 05:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57AB10E34C;
	Mon, 27 Oct 2025 04:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGMVc9x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826A410E138;
 Mon, 27 Oct 2025 04:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761540518; x=1793076518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9XPUo/or/wWYUUgDlarwL5bwrrn6O9Mbf/FnsnaqSdo=;
 b=KGMVc9x7PkIl0DdQ4cQ73QGB33oDk2+Nl5jhNpS74IICpH87hOaoMav3
 Y0pTcT5uMNm+DFQW3FiS6okb7pC96x0xnWtRZkJIa70DwVo0azEaNN+n0
 pR0qwh6HR7WU1A6QzZ5IyXTTXc+YANSmYD3T1rP2y7PpQvPL9SMca3lCs
 n25fvfnjQDavIh+BAWTaFftgGzz5rQKF6xbg7J1UvxfLbhGa9IQJWAoWm
 eRbpauUmSAYgDdlpHdfOX0h3h0K7L/4nxESHjqWJzubEkP1dlSTXHZszW
 8y+7IcNWM/71YiyxD6aJBQO0h6UDJGQFHcICINWZGOOs4lQfIR7GtQwqu w==;
X-CSE-ConnectionGUID: UOBGjIarQbq53XK9JQ091g==
X-CSE-MsgGUID: gfahVdnxQtqmddMCQnV7RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63515632"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63515632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: eiiU/X5rQSioWtN2oBB1Eg==
X-CSE-MsgGUID: 32PQDhRyRxm78RV5fbMtOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="188992985"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC v2 4/8] vfio/pci/dmabuf: Add support for IOV interconnect
Date: Sun, 26 Oct 2025 21:44:16 -0700
Message-ID: <20251027044712.1676175-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
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
of type struct range. The range type contains the start and end
addresses of the memory region.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 135 ++++++++++++++++++++++++++++-
 1 file changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index eaba010777f3..d2b7b5410e5a 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -4,6 +4,7 @@
 #include <linux/dma-buf.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/dma-resv.h>
+#include <linux/range.h>
 
 #include "vfio_pci_priv.h"
 
@@ -16,15 +17,132 @@ struct vfio_pci_dma_buf {
 	size_t size;
 	struct phys_vec *phys_vec;
 	struct p2pdma_provider *provider;
+	struct dma_buf_interconnect_match *ic_match;
 	u32 nr_ranges;
 	u8 revoked : 1;
 };
 
+static int
+vfio_pci_create_match(struct vfio_pci_dma_buf *priv,
+			  struct vfio_device_feature_dma_buf *dma_buf)
+{
+	struct dma_buf_interconnect_match *ic_match;
+
+	ic_match = kzalloc(sizeof(*ic_match), GFP_KERNEL);
+	if (!ic_match)
+		return -ENOMEM;
+
+	ic_match->dev = &priv->vdev->pdev->dev;
+	ic_match->bar = dma_buf->region_index;
+
+	priv->ic_match = ic_match;
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
+	const struct dma_buf_interconnect *ic = attachment->ic_match->type;
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	int ret = -EINVAL;
+
+	ranges->nranges = priv->nr_ranges;
+
+	if (ic == iov_interconnect)
+		ret = vfio_pci_map_iov_interconnect(priv, &ranges->ranges);
+
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
+vfio_pci_match_iov_interconnect(const struct dma_buf_interconnect_match *exp,
+				const struct dma_buf_interconnect_match *imp)
+{
+	struct pci_dev *exp_pdev = to_pci_dev(exp->dev);
+	struct pci_dev *imp_pdev = to_pci_dev(imp->dev);
+
+	return imp_pdev == pci_physfn(exp_pdev) && imp->bar == exp->bar;
+}
+
+static bool
+vfio_pci_match_interconnect(const struct dma_buf_interconnect_match *exp,
+			    const struct dma_buf_interconnect_match *imp)
+{
+	const struct dma_buf_interconnect *ic = exp->type;
+
+	if (ic == iov_interconnect)
+		return vfio_pci_match_iov_interconnect(exp, imp);
+
+	return false;
+}
+
+static bool
+vfio_pci_match_interconnects(struct vfio_pci_dma_buf *priv,
+			     struct dma_buf_attachment *attachment)
+{
+	const struct dma_buf_attach_ops *aops = attachment->importer_ops;
+	const struct dma_buf_interconnect_match supports_ics[] = {
+		MATCH_INTERCONNECT(iov_interconnect,
+				   priv->ic_match->dev, priv->ic_match->bar),
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
 
@@ -189,6 +307,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 	return ERR_PTR(ret);
 }
 
+
 static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir)
@@ -228,15 +347,23 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 		vfio_device_put_registration(&priv->vdev->vdev);
 	}
 	kfree(priv->phys_vec);
+	kfree(priv->ic_match);
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
@@ -365,6 +492,10 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 		goto err_free_phys;
 	}
 
+	ret = vfio_pci_create_match(priv, &get_dma_buf);
+	if (ret)
+		goto err_dev_put;
+
 	exp_info.ops = &vfio_pci_dmabuf_ops;
 	exp_info.size = priv->size;
 	exp_info.flags = get_dma_buf.open_flags;
@@ -373,7 +504,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	priv->dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(priv->dmabuf)) {
 		ret = PTR_ERR(priv->dmabuf);
-		goto err_dev_put;
+		goto err_free_iov;
 	}
 
 	/* dma_buf_put() now frees priv */
@@ -391,6 +522,8 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	 */
 	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
 
+err_free_iov:
+	kfree(priv->ic_match);
 err_dev_put:
 	vfio_device_put_registration(&vdev->vdev);
 err_free_phys:
-- 
2.50.1

