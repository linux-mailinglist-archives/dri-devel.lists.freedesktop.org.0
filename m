Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30ECD0E983
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 11:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3576510E1FA;
	Sun, 11 Jan 2026 10:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eYaAAEaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9608610E1FA
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 10:37:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FAB960169;
 Sun, 11 Jan 2026 10:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581CCC19423;
 Sun, 11 Jan 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768127855;
 bh=vKVJahwFDp2BgaIk7FWtQz247pzEh1oOdaEn5cwav6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eYaAAEaPsCa1kqPN5BEZNCK+/0r801KkCRoagdgFGgTu/MPFWYrWFsb6P8kJdHfdv
 OWnIq4rhH6DvN/5hmUU8DxZS4aTKYm9KUiEKE5vtDEQz4A9xH+wJkCLVoqOUWr/Lx1
 fM5k3prC+f3spxNqGYmpqPWELXaF/TNm7MtAY9SHlWijhuUcWm4+RMKQVjgXEW78U+
 3aCbkQDz2qFSLte+JLouW22VDt/ZxquxvaJuwTKrsN4A50UTg023gMO1GgBO7+UvYB
 7S3BVmDmmmDvr7n5VN3BgaptpNjylBWo3U1qPBcdNDO1p/L4eDJjJvnjPidlgCEWfc
 Z0xUNukhUxIIA==
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex@shazbot.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Subject: [PATCH 2/4] vfio: Use dma-buf revoke semantics
Date: Sun, 11 Jan 2026 12:37:09 +0200
Message-ID: <20260111-dmabuf-revoke-v1-2-fb4bcc8c259b@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6db3
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

From: Leon Romanovsky <leonro@nvidia.com>

Remove open-code variant of revoked semantics and reuse existing
dma_buf_move_notify() and newly introduced dma_buf_mark_valid()
primitives.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index d4d0f7d08c53..d953bd4cd118 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -17,20 +17,14 @@ struct vfio_pci_dma_buf {
 	struct dma_buf_phys_vec *phys_vec;
 	struct p2pdma_provider *provider;
 	u32 nr_ranges;
-	u8 revoked : 1;
 };
 
 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 				   struct dma_buf_attachment *attachment)
 {
-	struct vfio_pci_dma_buf *priv = dmabuf->priv;
-
 	if (!attachment->peer2peer)
 		return -EOPNOTSUPP;
 
-	if (priv->revoked)
-		return -ENODEV;
-
 	return 0;
 }
 
@@ -42,9 +36,6 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 
 	dma_resv_assert_held(priv->dmabuf->resv);
 
-	if (priv->revoked)
-		return ERR_PTR(-ENODEV);
-
 	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
 				       priv->phys_vec, priv->nr_ranges,
 				       priv->size, dir);
@@ -90,8 +81,6 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
  *
  * If this function succeeds the following are true:
  *  - There is one physical range and it is pointing to MMIO
- *  - When move_notify is called it means revoke, not move, vfio_dma_buf_map
- *    will fail if it is currently revoked
  */
 int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 				 struct dma_buf_phys_vec *phys)
@@ -104,9 +93,6 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 		return -EOPNOTSUPP;
 
 	priv = attachment->dmabuf->priv;
-	if (priv->revoked)
-		return -ENODEV;
-
 	/* More than one range to iommufd will require proper DMABUF support */
 	if (priv->nr_ranges != 1)
 		return -EOPNOTSUPP;
@@ -268,6 +254,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	exp_info.size = priv->size;
 	exp_info.flags = get_dma_buf.open_flags;
 	exp_info.priv = priv;
+	exp_info.revoke_semantics = true;
 
 	priv->dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(priv->dmabuf)) {
@@ -279,7 +266,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	INIT_LIST_HEAD(&priv->dmabufs_elm);
 	down_write(&vdev->memory_lock);
 	dma_resv_lock(priv->dmabuf->resv, NULL);
-	priv->revoked = !__vfio_pci_memory_enabled(vdev);
 	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
 	dma_resv_unlock(priv->dmabuf->resv);
 	up_write(&vdev->memory_lock);
@@ -317,12 +303,12 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 		if (!get_file_active(&priv->dmabuf->file))
 			continue;
 
-		if (priv->revoked != revoked) {
-			dma_resv_lock(priv->dmabuf->resv, NULL);
-			priv->revoked = revoked;
+		dma_resv_lock(priv->dmabuf->resv, NULL);
+		if (revoked)
 			dma_buf_move_notify(priv->dmabuf);
-			dma_resv_unlock(priv->dmabuf->resv);
-		}
+		else
+			dma_buf_mark_valid(priv->dmabuf);
+		dma_resv_unlock(priv->dmabuf->resv);
 		fput(priv->dmabuf->file);
 	}
 }
@@ -340,7 +326,6 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		dma_resv_lock(priv->dmabuf->resv, NULL);
 		list_del_init(&priv->dmabufs_elm);
 		priv->vdev = NULL;
-		priv->revoked = true;
 		dma_buf_move_notify(priv->dmabuf);
 		dma_resv_unlock(priv->dmabuf->resv);
 		vfio_device_put_registration(&vdev->vdev);

-- 
2.52.0

