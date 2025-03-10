Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FAFA5937A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFF710E414;
	Mon, 10 Mar 2025 12:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oEVjNg3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80EB10E403
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:06:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A4F2BA4599F;
 Mon, 10 Mar 2025 12:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B990C4CEE5;
 Mon, 10 Mar 2025 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741608411;
 bh=7pH3VC/kTZvZyXEwWyZXDmfZRfenpkkRjJncy/YaV3A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oEVjNg3fibaFagVdlIbk1zBQgRtK4seXDgW44TGzwkQ40PmG4N59lYT+i2hjQ5l03
 NA6f1fLNP8lcsn9t2x7thW/+0wFqWl1lNQwn5emhsN+Qm5+zGTO8TqmVCBlLiZNaiF
 OgPH/VIaPn14p9iOs4NrV5TAKskCUJoMdusz5wcDhMolyNdyGa1OnKb1njCHwNN+Wn
 BtXSC8CYNyCjeNV/fE609L74FQslohr/mle3ggF1fH8TF2nA4YnRFcGyCVPmS4+Plf
 xK+5UbDA3sytdfkGm4HmEcfHeLQdRJwFr4I+93ghEJCXwvZi1+K+ouJwqyEt/fcySB
 tFZezpIY8/SOg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:18 +0100
Subject: [PATCH RFC 12/12] media: videobuf2: Track buffer allocations
 through the dmem cgroup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-12-2984c1bc9312@kernel.org>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7pH3VC/kTZvZyXEwWyZXDmfZRfenpkkRjJncy/YaV3A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm6/ZsdQ+MWVYVbt25WiJm9cVq1kbvIv1+nqNj8Uw
 cQw8Zh/RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaiH8jI8G9RwTMV4c9c83xf
 z/EMmLjgxVIR86M37d8sdLg43++uTQbDf9/VGd8tpSbXPHmhXr3q3hpj4wk3k392pC04ujVyhVh
 VDjsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The dmem cgroup allows to track any DMA memory allocation made by the
userspace. Let's charge our allocations in videobuf2 to enable proper
memory tracking.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a13ec569c82f6da2d977222b94af32e74c6c6c82..48384e18030812f4f89f1c225c38def2ac6aa3ca 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -8,10 +8,11 @@
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation.
  */
 
+#include <linux/cgroup_dmem.h>
 #include <linux/dma-buf.h>
 #include <linux/module.h>
 #include <linux/refcount.h>
 #include <linux/scatterlist.h>
 #include <linux/sched.h>
@@ -40,10 +41,14 @@ struct vb2_dc_buf {
 	struct sg_table			*sgt_base;
 
 	/* DMABUF related */
 	struct dma_buf_attachment	*db_attach;
 
+#ifdef CONFIG_CGROUP_DMEM
+	struct dmem_cgroup_pool_state	*cgroup_pool_state;
+#endif
+
 	struct vb2_buffer		*vb;
 	bool				non_coherent_mem;
 };
 
 /*********************************************/
@@ -169,10 +174,14 @@ static void vb2_dc_put(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 
 	if (!refcount_dec_and_test(&buf->refcount))
 		return;
 
+#ifdef CONFIG_CGROUP_DMEM
+	dmem_cgroup_uncharge(buf->cgroup_pool_state, buf->size);
+#endif
+
 	if (buf->non_coherent_mem) {
 		if (buf->vaddr)
 			dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
 		dma_free_noncontiguous(buf->dev, buf->size,
 				       buf->dma_sgt, buf->dma_dir);
@@ -230,10 +239,11 @@ static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
 
 static void *vb2_dc_alloc(struct vb2_buffer *vb,
 			  struct device *dev,
 			  unsigned long size)
 {
+	struct dmem_cgroup_pool_state *pool;
 	struct vb2_dc_buf *buf;
 	int ret;
 
 	if (WARN_ON(!dev))
 		return ERR_PTR(-EINVAL);
@@ -249,25 +259,34 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
 
 	buf->size = size;
 	/* Prevent the device from being released while the buffer is used */
 	buf->dev = get_device(dev);
 
+	ret = dmem_cgroup_try_charge(dma_get_dmem_cgroup_region(dev), size, &pool, NULL);
+	if (ret)
+		return ret;
+
 	if (buf->non_coherent_mem)
 		ret = vb2_dc_alloc_non_coherent(buf);
 	else
 		ret = vb2_dc_alloc_coherent(buf);
 
 	if (ret) {
 		dev_err(dev, "dma alloc of size %lu failed\n", size);
+		dmem_cgroup_uncharge(pool, size);
 		kfree(buf);
 		return ERR_PTR(-ENOMEM);
 	}
 
 	buf->handler.refcount = &buf->refcount;
 	buf->handler.put = vb2_dc_put;
 	buf->handler.arg = buf;
 
+#ifdef CONFIG_CGROUP_DMEM
+	buf->cgroup_pool_state = pool;
+#endif
+
 	refcount_set(&buf->refcount, 1);
 
 	return buf;
 }
 

-- 
2.48.1

