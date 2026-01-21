Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL6TOsnNcGkOaAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 13:59:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F852573BB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 13:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038C710E785;
	Wed, 21 Jan 2026 12:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oHr3E4VO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B68510E786;
 Wed, 21 Jan 2026 12:59:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2205B42DF7;
 Wed, 21 Jan 2026 12:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C20CC19421;
 Wed, 21 Jan 2026 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769000390;
 bh=58tlcanDY9T+aBkaQ7vWfXy+++XD4LOLW2oAbnjGDH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oHr3E4VO5+kpQrrHbqPjTJNKxsFH965nx3z+HGEKVzNi9Z46nDUJ3e+zN65x7aq4g
 0AYI4kFliWoK103IScu/8h1MlBmeLHpzVrXHj6im/8sP87EFc9h+YDPyu7DDu/Vxkv
 Xb+DSYCK/LecthYvxo+0fV3b1dbDv+KO5UAGJnm/WfAMELvAQtHHqfc4kSGbYc1gDx
 oXWcxFpc/uPK6T1m5LO/70qgrjK6E8xkm9TrTso2N6+6wEVeWERTKJusLLY5fR4RCM
 SBb/OTT0IL9T102lhwc+slhv49nnNQlOllpzQw8rES2gqbrI0TM5sCZerrsJmS8D0o
 vdQcB72KWVxyA==
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
Subject: [PATCH v4 6/8] iommufd: Pin dma-buf importer for revoke semantics
Date: Wed, 21 Jan 2026 14:59:14 +0200
Message-ID: <20260121-dmabuf-revoke-v4-6-d311cbc8633d@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,nvidia.com:mid];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 9F852573BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Leon Romanovsky <leonro@nvidia.com>

IOMMUFD does not support page fault handling, and after a call to
.invalidate_mappings() all mappings become invalid. Ensure that
the IOMMUFD dma-buf importer is bound to a revoke‑aware dma-buf
exporter (for example, VFIO).

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/iommufd/pages.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 76f900fa1687..a5eb2bc4ef48 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1501,16 +1501,22 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 		mutex_unlock(&pages->mutex);
 	}
 
-	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
+	rc = dma_buf_pin(attach);
 	if (rc)
 		goto err_detach;
 
+	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
+	if (rc)
+		goto err_unpin;
+
 	dma_resv_unlock(dmabuf->resv);
 
 	/* On success iopt_release_pages() will detach and put the dmabuf. */
 	pages->dmabuf.attach = attach;
 	return 0;
 
+err_unpin:
+	dma_buf_unpin(attach);
 err_detach:
 	dma_resv_unlock(dmabuf->resv);
 	dma_buf_detach(dmabuf, attach);
@@ -1656,6 +1662,7 @@ void iopt_release_pages(struct kref *kref)
 	if (iopt_is_dmabuf(pages) && pages->dmabuf.attach) {
 		struct dma_buf *dmabuf = pages->dmabuf.attach->dmabuf;
 
+		dma_buf_unpin(pages->dmabuf.attach);
 		dma_buf_detach(dmabuf, pages->dmabuf.attach);
 		dma_buf_put(dmabuf);
 		WARN_ON(!list_empty(&pages->dmabuf.tracker));

-- 
2.52.0

