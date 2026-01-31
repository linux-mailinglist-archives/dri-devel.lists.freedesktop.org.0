Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIzELneUfWnQSgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 06:34:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271CBC0C70
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 06:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2B510E259;
	Sat, 31 Jan 2026 05:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fAHoKYJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669BF10E260;
 Sat, 31 Jan 2026 05:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6759443AE;
 Sat, 31 Jan 2026 05:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB95C4CEF1;
 Sat, 31 Jan 2026 05:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769837683;
 bh=PjtPaYCwW8GyC9UrsuJNBQBTLvXGRWhqJxW4W7K8RDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fAHoKYJSQIA5FD5Z4jRtDfIY19kNDGT85pD1iLEg8Oy9RKKLvOKkqDJl6czg0goM2
 7Kypx18/dEVqCGXsZvOcnsq1wiiilkdJBxb2zbB3cUxZJDlaMXTvIQoHrOYikE3l84
 k0/Eay+eO2OkhTVIc/o/UGC+23sl99rLPLvAI/sjan5Zkpa+Tjbe4lJz+oy0ASme6x
 QM6n9G6UAEZugLn9nQLxCmHMyXZ0O+bSc6+Zj2Io+z+5NHREgUTHoduhxRyQuUpKTp
 P6EM3Rr+b7LVhd7jfpMYT+SRSi3ba2T+e5X9ym5YXIC5WIwFCdEPt3xprJYf9NEfGM
 LQdMwKUr87Opg==
From: Leon Romanovsky <leon@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: [PATCH v7 4/8] vfio: Wait for dma-buf invalidation to complete
Date: Sat, 31 Jan 2026 07:34:14 +0200
Message-ID: <20260131-dmabuf-revoke-v7-4-463d956bd527@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-47773
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[35];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 271CBC0C70
X-Rspamd-Action: no action

From: Leon Romanovsky <leonro@nvidia.com>

dma-buf invalidation is handled asynchronously by the hardware, so VFIO
must wait until all affected objects have been fully invalidated.

In addition, the dma-buf exporter is expecting that all importers unmap any
buffers they previously mapped.

Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 61 +++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index d8ceafabef48..78d47e260f34 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -17,6 +17,8 @@ struct vfio_pci_dma_buf {
 	struct dma_buf_phys_vec *phys_vec;
 	struct p2pdma_provider *provider;
 	u32 nr_ranges;
+	struct kref kref;
+	struct completion comp;
 	u8 revoked : 1;
 };
 
@@ -44,27 +46,46 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	return 0;
 }
 
+static void vfio_pci_dma_buf_done(struct kref *kref)
+{
+	struct vfio_pci_dma_buf *priv =
+		container_of(kref, struct vfio_pci_dma_buf, kref);
+
+	complete(&priv->comp);
+}
+
 static struct sg_table *
 vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
 		     enum dma_data_direction dir)
 {
 	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+	struct sg_table *ret;
 
 	dma_resv_assert_held(priv->dmabuf->resv);
 
 	if (priv->revoked)
 		return ERR_PTR(-ENODEV);
 
-	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
-				       priv->phys_vec, priv->nr_ranges,
-				       priv->size, dir);
+	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
+				      priv->phys_vec, priv->nr_ranges,
+				      priv->size, dir);
+	if (IS_ERR(ret))
+		return ret;
+
+	kref_get(&priv->kref);
+	return ret;
 }
 
 static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir)
 {
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
 	dma_buf_free_sgt(attachment, sgt, dir);
+	kref_put(&priv->kref, vfio_pci_dma_buf_done);
 }
 
 static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
@@ -287,6 +308,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 		goto err_dev_put;
 	}
 
+	kref_init(&priv->kref);
+	init_completion(&priv->comp);
+
 	/* dma_buf_put() now frees priv */
 	INIT_LIST_HEAD(&priv->dmabufs_elm);
 	down_write(&vdev->memory_lock);
@@ -331,9 +355,33 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 
 		if (priv->revoked != revoked) {
 			dma_resv_lock(priv->dmabuf->resv, NULL);
-			priv->revoked = revoked;
+			if (revoked)
+				priv->revoked = true;
 			dma_buf_invalidate_mappings(priv->dmabuf);
+			dma_resv_wait_timeout(priv->dmabuf->resv,
+					      DMA_RESV_USAGE_BOOKKEEP, false,
+					      MAX_SCHEDULE_TIMEOUT);
 			dma_resv_unlock(priv->dmabuf->resv);
+			if (revoked) {
+				kref_put(&priv->kref, vfio_pci_dma_buf_done);
+				wait_for_completion(&priv->comp);
+			} else {
+				/*
+				 * Kref is initialize again, because when revoke
+				 * was performed the reference counter was decreased
+				 * to zero to trigger completion.
+				 */
+				kref_init(&priv->kref);
+				/*
+				 * There is no need to wait as no mapping was
+				 * performed when the previous status was
+				 * priv->revoked == true.
+				 */
+				reinit_completion(&priv->comp);
+				dma_resv_lock(priv->dmabuf->resv, NULL);
+				priv->revoked = false;
+				dma_resv_unlock(priv->dmabuf->resv);
+			}
 		}
 		fput(priv->dmabuf->file);
 	}
@@ -354,7 +402,12 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 		priv->vdev = NULL;
 		priv->revoked = true;
 		dma_buf_invalidate_mappings(priv->dmabuf);
+		dma_resv_wait_timeout(priv->dmabuf->resv,
+				      DMA_RESV_USAGE_BOOKKEEP, false,
+				      MAX_SCHEDULE_TIMEOUT);
 		dma_resv_unlock(priv->dmabuf->resv);
+		kref_put(&priv->kref, vfio_pci_dma_buf_done);
+		wait_for_completion(&priv->comp);
 		vfio_device_put_registration(&vdev->vdev);
 		fput(priv->dmabuf->file);
 	}

-- 
2.52.0

