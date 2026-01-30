Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKdBGTi0fGnSOQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 14:38:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CABB296
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 14:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504AD10E9F4;
	Fri, 30 Jan 2026 13:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lPkS8oOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C159610E9E9;
 Fri, 30 Jan 2026 13:37:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A6848443EA;
 Fri, 30 Jan 2026 13:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CBAC4CEF7;
 Fri, 30 Jan 2026 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769780276;
 bh=BadvRp2kMbYiE6vohEKv25VeRPZoBeiAhKDHz+nyIJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lPkS8oOqgSFwkSTrkhU0/7w1YTiXWrBwmNLdSrmnI505F0sCH2YnugM/smtGpOYdx
 raV66aWR0nKu5TZK3XZ5aPV/DTrldO8qLyqO0ga6eB2QjF4EhZCyCn4wMn5dMeI8tI
 OlC3ShlpvpYlEfrUnpj1MASBnoXseoaAvPuxH87WPOAmwSmfWKFQFaBCWWG6Gx71hA
 /k3NqfAqm9qEPlzB7TEFfIjKzx62DrLS0kwYXj7B5pmZi7kwUWHvp9//JdsNwEunV8
 kMoNJAIwUgS+dxBumKWfWkadG3CJb74es60RejSM97JAK8HGE9Lxl+y3JxOBjWrD7Z
 GMyPknJMh9dAQ==
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
Subject: [PATCH v6 7/8] vfio: Permit VFIO to work with pinned importers
Date: Fri, 30 Jan 2026 15:37:23 +0200
Message-ID: <20260130-dmabuf-revoke-v6-7-06278f9b7bf0@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130-dmabuf-revoke-v6-0-06278f9b7bf0@nvidia.com>
References: <20260130-dmabuf-revoke-v6-0-06278f9b7bf0@nvidia.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shazbot.org:email,intel.com:email,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 161CABB296
X-Rspamd-Action: no action

From: Leon Romanovsky <leonro@nvidia.com>

Till now VFIO has rejected pinned importers, largely to avoid being used
with the RDMA pinned importer that cannot handle a move_notify() to revoke
access.

Using dma_buf_attach_revocable() it can tell the difference between pinned
importers that support the flow described in dma_buf_invalidate_mappings()
and those that don't.

Thus permit compatible pinned importers.

This is one of two items IOMMUFD requires to remove its private interface
to VFIO's dma-buf.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Alex Williamson <alex@shazbot.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 485515629fe4..20d8a452471d 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -22,16 +22,6 @@ struct vfio_pci_dma_buf {
 	u8 revoked : 1;
 };
 
-static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
-{
-	return -EOPNOTSUPP;
-}
-
-static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
-{
-	/* Do nothing */
-}
-
 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 				   struct dma_buf_attachment *attachment)
 {
@@ -43,6 +33,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 	if (priv->revoked)
 		return -ENODEV;
 
+	if (!dma_buf_attach_revocable(attachment))
+		return -EOPNOTSUPP;
+
 	return 0;
 }
 
@@ -107,8 +100,6 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 }
 
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
-	.pin = vfio_pci_dma_buf_pin,
-	.unpin = vfio_pci_dma_buf_unpin,
 	.attach = vfio_pci_dma_buf_attach,
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
@@ -357,7 +348,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 
 		if (priv->revoked != revoked) {
 			dma_resv_lock(priv->dmabuf->resv, NULL);
-			priv->revoked = revoked;
+			if (revoked)
+				priv->revoked = true;
 			dma_buf_invalidate_mappings(priv->dmabuf);
 			dma_resv_wait_timeout(priv->dmabuf->resv,
 					      DMA_RESV_USAGE_BOOKKEEP, false,
@@ -365,17 +357,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 			dma_resv_unlock(priv->dmabuf->resv);
 			if (revoked) {
 				kref_put(&priv->kref, vfio_pci_dma_buf_done);
-				/* Let's wait till all DMA unmap are completed. */
-				wait = wait_for_completion_timeout(
-					&priv->comp, secs_to_jiffies(1));
-				/*
-				 * If you see this WARN_ON, it means that
-				 * importer didn't call unmap in response to
-				 * dma_buf_invalidate_mappings() which is not
-				 * allowed.
-				 */
-				WARN(!wait,
-				     "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");
+				wait_for_completion(&priv->comp);
 			} else {
 				/*
 				 * Kref is initialize again, because when revoke
@@ -389,6 +371,9 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 				 * priv->revoked == true.
 				 */
 				reinit_completion(&priv->comp);
+				dma_resv_lock(priv->dmabuf->resv, NULL);
+				priv->revoked = false;
+				dma_resv_unlock(priv->dmabuf->resv);
 			}
 		}
 		fput(priv->dmabuf->file);
@@ -417,9 +402,7 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 				      MAX_SCHEDULE_TIMEOUT);
 		dma_resv_unlock(priv->dmabuf->resv);
 		kref_put(&priv->kref, vfio_pci_dma_buf_done);
-		wait = wait_for_completion_timeout(&priv->comp,
-						   secs_to_jiffies(1));
-		WARN_ON(!wait);
+		wait_for_completion(&priv->comp);
 		vfio_device_put_registration(&vdev->vdev);
 		fput(priv->dmabuf->file);
 	}

-- 
2.52.0

