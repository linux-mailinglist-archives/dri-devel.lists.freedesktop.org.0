Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5BD394BA
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 13:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C9010E2BF;
	Sun, 18 Jan 2026 12:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qmFx0xYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D9A10E2BB;
 Sun, 18 Jan 2026 12:09:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 50F286000A;
 Sun, 18 Jan 2026 12:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670ACC116D0;
 Sun, 18 Jan 2026 12:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768738153;
 bh=zoYsMrm1rjNa0PY8BZkc8G3M4wgcf/AwcE0GTUAFzBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qmFx0xYrLhiCoTyr27YOjREc26M9s0f9UnpkBsDc5PYOT/t7lnouVm8sM8UhPobW3
 GGspx43c9S9cMWUTDtYZaTGpzTIwOSQ6HFiloRqxoH1GyxbwrkLl8QY3fT0ANwBLnk
 mnHPOB5ynxhv3SI9MbskUQ2uFktlq1ldP3K1hzBjsG/XAkFyfG7YvLvUF4J/PQmCcR
 u0kEC4y8iQNC9pZRJuqAITvFazRttA5hZmm4quyQqXcFzT6VtfWlM9f1FKwTW64Wr/
 5Ib8uJQhX+8/zM4l/M3BaKXf09VpjopHkwJdRyv6CSk3Lpen4DFAh+sZRhLlRUDOfz
 duIHSuBnBQFCA==
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
 Robin Murphy <robin.murphy@arm.com>, Alex Williamson <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: [PATCH v2 4/4] vfio: Add pinned interface to perform revoke semantics
Date: Sun, 18 Jan 2026 14:08:48 +0200
Message-ID: <20260118-dmabuf-revoke-v2-4-a03bb27c0875@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
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

DMABUF ->pin() interface is called when the DMABUF importer perform
its DMA mapping, so let's use this opportunity to check if DMABUF
exporter revoked its buffer or not.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index d4d0f7d08c53..af9c315ddf71 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -20,6 +20,20 @@ struct vfio_pci_dma_buf {
 	u8 revoked : 1;
 };
 
+static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
+{
+	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	return dma_buf_attachment_is_revoke(attachment) ? 0 : -EOPNOTSUPP;
+}
+
+static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
+{
+	/* Do nothing */
+}
+
 static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
 				   struct dma_buf_attachment *attachment)
 {
@@ -76,6 +90,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 }
 
 static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
+	.pin = vfio_pci_dma_buf_pin,
+	.unpin = vfio_pci_dma_buf_unpin,
 	.attach = vfio_pci_dma_buf_attach,
 	.map_dma_buf = vfio_pci_dma_buf_map,
 	.unmap_dma_buf = vfio_pci_dma_buf_unmap,

-- 
2.52.0

