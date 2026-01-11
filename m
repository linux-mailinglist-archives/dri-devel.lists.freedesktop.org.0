Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E4D0E97D
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 11:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84E10E1FC;
	Sun, 11 Jan 2026 10:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PC42vNtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62C110E1FA
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 10:37:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 57E4860010;
 Sun, 11 Jan 2026 10:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765CFC4CEF7;
 Sun, 11 Jan 2026 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768127852;
 bh=EB9u2XyG8hOfqiXwLDjNViUG+l4zFMBtygFVUbtOvI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PC42vNtxB+Qd9ZpYwFqWTPv1WbKwV1tsnlIUQNxK5JuKhr9Vc21PG2xz4+W9kyClA
 WoqlZgKqI0PHqeEVkRivzUP8XZ7SshOloidqrN0ZZpsj9ZrTgDPJS85qXdFv3JhHmW
 V3Mci8NLX4GRg06Z5m8BGmdBHQtXs1x6NBs3gmZL7ktD1DExEQnQHmhRJQWJIRL/Ju
 t6UqhjElh0DIHKDFKNojNutSZWoEXYBCOhFvDNxy23odPoV4+h75gMGrHOfd5mMoPv
 7KTB07gzSHWC3i+YtyvnLIahfUBEybflkhhjM+7s8cnjj5DtJYiuZHsGu7uGBh/dXf
 vGneu5dryOpgw==
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
Subject: [PATCH 4/4] iommufd/selftest: Reuse dma-buf revoke semantics
Date: Sun, 11 Jan 2026 12:37:11 +0200
Message-ID: <20260111-dmabuf-revoke-v1-4-fb4bcc8c259b@nvidia.com>
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

Test iommufd_test_dmabuf_revoke() with dma-buf revoke primitives.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/iommufd/selftest.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 550ff36dec3a..523dfac44ff8 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1958,7 +1958,6 @@ void iommufd_selftest_destroy(struct iommufd_object *obj)
 struct iommufd_test_dma_buf {
 	void *memory;
 	size_t length;
-	bool revoked;
 };
 
 static int iommufd_test_dma_buf_attach(struct dma_buf *dmabuf,
@@ -2011,9 +2010,6 @@ int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
 	if (attachment->dmabuf->ops != &iommufd_test_dmabuf_ops)
 		return -EOPNOTSUPP;
 
-	if (priv->revoked)
-		return -ENODEV;
-
 	phys->paddr = virt_to_phys(priv->memory);
 	phys->len = priv->length;
 	return 0;
@@ -2065,7 +2061,6 @@ static int iommufd_test_dmabuf_get(struct iommufd_ucmd *ucmd,
 static int iommufd_test_dmabuf_revoke(struct iommufd_ucmd *ucmd, int fd,
 				      bool revoked)
 {
-	struct iommufd_test_dma_buf *priv;
 	struct dma_buf *dmabuf;
 	int rc = 0;
 
@@ -2078,10 +2073,11 @@ static int iommufd_test_dmabuf_revoke(struct iommufd_ucmd *ucmd, int fd,
 		goto err_put;
 	}
 
-	priv = dmabuf->priv;
 	dma_resv_lock(dmabuf->resv, NULL);
-	priv->revoked = revoked;
-	dma_buf_move_notify(dmabuf);
+	if (revoked)
+		dma_buf_move_notify(dmabuf);
+	else
+		dma_buf_mark_valid(dmabuf);
 	dma_resv_unlock(dmabuf->resv);
 
 err_put:

-- 
2.52.0

