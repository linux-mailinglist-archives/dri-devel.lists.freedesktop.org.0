Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D72D394B6
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 13:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870F810E2B7;
	Sun, 18 Jan 2026 12:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b57lGzkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBFC10E2B6;
 Sun, 18 Jan 2026 12:09:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9FED8444A1;
 Sun, 18 Jan 2026 12:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27A2C2BC86;
 Sun, 18 Jan 2026 12:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768738149;
 bh=lFp92L2u8Fi3C1r4wz7ICZZY29W6l9NNfEn6EJZj7GA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b57lGzkEObf4t2IQTf/DJYle2Vi+wmkenWL8JiZcUXMFG32RI5QLPPJvEQbZNmUVu
 tVm9SQkuRLXsV+VARTyTJ0ctKEAh36t9OF36xOHzMKHdzrqQIUN+wCKowPjw2OfZCq
 uTMmw9GjLJOlRA/x9vlNTo9600EoOlZ5fJuR5yabUCBsAqvyrwoWDAdpO0SdPcxQzn
 fmRvtiPmspxW0vLun5hT89R8Sl29pf9lU45i5p0t62erSJena939KfeGaNSbhd6Kjo
 PB+o9YyRlIiDI8/OKCEyXgL3nGXjyaFi1GkzNHDkMORYewY4EEZiBeSpWeQYfoARox
 VmHDCcvdgPMdg==
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
Subject: [PATCH v2 2/4] dma-buf: Document revoke semantics
Date: Sun, 18 Jan 2026 14:08:46 +0200
Message-ID: <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
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

Document a DMA-buf revoke mechanism that allows an exporter to explicitly
invalidate ("kill") a shared buffer after it has been handed out to
importers. Once revoked, all further CPU and device access is blocked, and
importers consistently observe failure.

This requires both importers and exporters to honor the revoke contract.

For importers, this means implementing .invalidate_mappings() and calling
dma_buf_pin() after the DMA‑buf is attached to verify the exporter’s support
for revocation.

For exporters, this means implementing the .pin() callback, which checks
the DMA‑buf attachment for a valid revoke implementation.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-buf.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 1b397635c793..e0bc0b7119f5 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -579,6 +579,25 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
 	return !!dmabuf->ops->pin;
 }
 
+/**
+ * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
+ * revoke semantics.
+ * @attach: the DMA-buf attachment to check
+ *
+ * Returns true if DMA-buf importer honors revoke semantics, which is
+ * negotiated with the exporter, by making sure that importer implements
+ * .invalidate_mappings() callback and calls to dma_buf_pin() after
+ * DMA-buf attach.
+ */
+static inline bool
+dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)
+{
+	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) &&
+	       dma_buf_is_dynamic(attach->dmabuf) &&
+	       (attach->importer_ops &&
+		attach->importer_ops->invalidate_mappings);
+}
+
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev);
 struct dma_buf_attachment *

-- 
2.52.0

