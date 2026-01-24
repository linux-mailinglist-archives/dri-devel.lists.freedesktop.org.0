Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBMAADUadWl8AwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 20:15:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29BC7E9F0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 20:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9472310E33F;
	Sat, 24 Jan 2026 19:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sPfmjiey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3AA10E352;
 Sat, 24 Jan 2026 19:14:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C35360127;
 Sat, 24 Jan 2026 19:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA13C2BC9E;
 Sat, 24 Jan 2026 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769282091;
 bh=3D3OvmHdl7CtonK+GTGLGOQGYsGv5xRF/fJKjHtWrds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sPfmjieyBFmJ+auLUXTwkDyqx9iP+AX0DmWHt0nCeNCFRRf7NdRHJ1d9eXDX8eyIz
 +qJXLVSNo4bMNlFIr/ylvpCMd0NJ/+j1qcpyqxPE1WC3WpwY1yCESe4iXbsVxDwqXg
 hurBEjxmkBczLU0e+eBWMxLeKKKax3BBjQrLnSbHOjiZ9TCD5BVWNvU/QoC3tON27N
 Y1ECQH5eaoQubNVoCLjVGElO4pBCZVWVV66UvJZUV4D7f6mBHjYcvqO80luEsTdzTT
 /Ai4nWHNm31uRVjOJYA0Ex5rsK9LmZ9OdKpM4QTZyqy4dCxleQCPXKaD076YtLmD+7
 8t8RDmAastbhA==
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
Subject: [PATCH v5 6/8] dma-buf: Add dma_buf_attach_revocable()
Date: Sat, 24 Jan 2026 21:14:18 +0200
Message-ID: <20260124-dmabuf-revoke-v5-6-f98fca917e96@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A29BC7E9F0
X-Rspamd-Action: no action

From: Leon Romanovsky <leonro@nvidia.com>

Some exporters need a flow to synchronously revoke access to the DMA-buf
by importers. Once revoke is completed the importer is not permitted to
touch the memory otherwise they may get IOMMU faults, AERs, or worse.

DMA-buf today defines a revoke flow, for both pinned and dynamic
importers, which is broadly:

	dma_resv_lock(dmabuf->resv, NULL);
	// Prevent new mappings from being established
	priv->revoked = true;

	// Tell all importers to eventually unmap
	dma_buf_invalidate_mappings(dmabuf);

	// Wait for any inprogress fences on the old mapping
	dma_resv_wait_timeout(dmabuf->resv,
			      DMA_RESV_USAGE_BOOKKEEP, false,
			      MAX_SCHEDULE_TIMEOUT);
	dma_resv_unlock(dmabuf->resv, NULL);

	// Wait for all importers to complete unmap
	wait_for_completion(&priv->unmapped_comp);

This works well, and an importer that continues to access the DMA-buf
after unmapping it is very buggy.

However, the final wait for unmap is effectively unbounded. Several
importers do not support invalidate_mappings() at all and won't unmap
until userspace triggers it.

This unbounded wait is not suitable for exporters like VFIO and RDMA tha
need to issue revoke as part of their normal operations.

Add dma_buf_attach_revocable() to allow exporters to determine the
difference between importers that can complete the above in bounded time,
and those that can't. It can be called inside the exporter's attach op to
reject incompatible importers.

Document these details about how dma_buf_invalidate_mappings() works and
what the required sequence is to achieve a full revocation.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/dma-buf/dma-buf.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/dma-buf.h   |  9 +++------
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1629312d364a..f0e05227bda8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1242,13 +1242,59 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
 
+/**
+ * dma_buf_attach_revocable - check if a DMA-buf importer implements
+ * revoke semantics.
+ * @attach: the DMA-buf attachment to check
+ *
+ * Returns true if the DMA-buf importer can support the revoke sequence
+ * explained in dma_buf_invalidate_mappings() within bounded time. Meaning the
+ * importer implements invalidate_mappings() and ensures that unmap is called as
+ * a result.
+ */
+bool dma_buf_attach_revocable(struct dma_buf_attachment *attach)
+{
+	return attach->importer_ops &&
+	       attach->importer_ops->invalidate_mappings;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_attach_revocable, "DMA_BUF");
+
 /**
  * dma_buf_invalidate_mappings - notify attachments that DMA-buf is moving
  *
  * @dmabuf:	[in]	buffer which is moving
  *
  * Informs all attachments that they need to destroy and recreate all their
- * mappings.
+ * mappings. If the attachment is dynamic then the dynamic importer is expected
+ * to invalidate any caches it has of the mapping result and perform a new
+ * mapping request before allowing HW to do any further DMA.
+ *
+ * If the attachment is pinned then this informs the pinned importer that the
+ * underlying mapping is no longer available. Pinned importers may take this is
+ * as a permanent revocation and never establish new mappings so exporters
+ * should not trigger it lightly.
+ *
+ * Upon return importers may continue to access the DMA-buf memory. The caller
+ * must do two additional waits to ensure that the memory is no longer being
+ * accessed:
+ *  1) Until dma_resv_wait_timeout() retires fences the importer is allowed to
+ *     fully access the memory.
+ *  2) Until the importer calls unmap it is allowed to speculatively
+ *     read-and-discard the memory. It must not write to the memory.
+ *
+ * A caller wishing to use dma_buf_invalidate_mappings() to fully stop access to
+ * the DMA-buf must wait for both. Dynamic callers can often use just the first.
+ *
+ * All importers providing a invalidate_mappings() op must ensure that unmap is
+ * called within bounded time after the op.
+ *
+ * Pinned importers that do not support a invalidate_mappings() op will
+ * eventually perform unmap when they are done with the buffer, which may be an
+ * ubounded time from calling this function. dma_buf_attach_revocable() can be
+ * used to prevent such importers from attaching.
+ *
+ * Importers are free to request a new mapping in parallel as this function
+ * returns.
  */
 void dma_buf_invalidate_mappings(struct dma_buf *dmabuf)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d5c3ce2b3aa4..84a7ec8f5359 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -468,12 +468,8 @@ struct dma_buf_attach_ops {
 	 * called with this lock held as well. This makes sure that no mapping
 	 * is created concurrently with an ongoing move operation.
 	 *
-	 * Mappings stay valid and are not directly affected by this callback.
-	 * But the DMA-buf can now be in a different physical location, so all
-	 * mappings should be destroyed and re-created as soon as possible.
-	 *
-	 * New mappings can be created after this callback returns, and will
-	 * point to the new location of the DMA-buf.
+	 * See the kdoc for dma_buf_invalidate_mappings() for details on the
+	 * required behavior.
 	 */
 	void (*invalidate_mappings)(struct dma_buf_attachment *attach);
 };
@@ -601,6 +597,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
 void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 				enum dma_data_direction);
 void dma_buf_invalidate_mappings(struct dma_buf *dma_buf);
+bool dma_buf_attach_revocable(struct dma_buf_attachment *attach);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
 int dma_buf_end_cpu_access(struct dma_buf *dma_buf,

-- 
2.52.0

