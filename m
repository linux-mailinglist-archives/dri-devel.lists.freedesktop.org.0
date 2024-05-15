Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5D8C67FF
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 15:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A4710EA6D;
	Wed, 15 May 2024 13:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TwfJbMJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E3810E993
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:58:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55F65614CC;
 Wed, 15 May 2024 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3B1C2BD11;
 Wed, 15 May 2024 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715781487;
 bh=N5UwfZ1hKMI6+ZrGSh9smBi+SvvW9VpZtds2AMuGHos=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TwfJbMJr2eudO50gB4jtqCfWmhQ4amIjE1zaF6WRdIcpHwO5rxvJbZJuVPBjUSigc
 8TO0sFjBMWieujTeWTcuXI80s/WdCooRLCshP+Q/b0ITdjgasFFSNbNxExZovj+gwM
 MqxQyWjQ9L4GKUH5za52rqgOSxbjtXji1bS6WDBU09KLKF6xXnGxBua7W8KBwKwYTv
 kTyJG45a37w38lAwA6FHp1phbWKUmqeti4YPxDNtGMpGRIPOYhZd/GFlbyoIEyxavY
 r47jnKx51PjUmobjfH+JRFKkFOOn0ocJkOqbql9gO5OBozz9g9Hmqn6m9vT+dk6kVi
 oqdf60asXfERQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:57:03 +0200
Subject: [PATCH 8/8] dma-buf: heaps: carveout: Handle ECC flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-8-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094; i=mripard@kernel.org;
 h=from:subject:message-id; bh=N5UwfZ1hKMI6+ZrGSh9smBi+SvvW9VpZtds2AMuGHos=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+wOVf9vPYLP0PMqdtrWoJ7LZR7Lp+cNXh60Z5vbwa
 D3c2HqlYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkbh5jnYYCo0VUtc+Dd+uE
 2daUX+142sf9ZzNr7g5joTNPPvPvWLjxoFSLysFas91tCT8vZjzoYaxmSWWJajqzSnUrN69XyMV
 0Lukrn8/LlLqZ6FROnnTgt2SU9adC6ZaXZtJ3NbLWr572kQ0A
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

Now that we have introduced ECC-related flags for the dma-heaps buffer
allocations, let's honour these flags depending on the memory setup.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/carveout_heap.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma-buf/heaps/carveout_heap.c b/drivers/dma-buf/heaps/carveout_heap.c
index 896ca67e6bd9..81b167785999 100644
--- a/drivers/dma-buf/heaps/carveout_heap.c
+++ b/drivers/dma-buf/heaps/carveout_heap.c
@@ -6,10 +6,11 @@
 #include <linux/of_reserved_mem.h>
 
 struct carveout_heap_priv {
 	struct dma_heap *heap;
 	struct gen_pool *pool;
+	bool ecc_enabled;
 };
 
 struct carveout_heap_buffer_priv {
 	struct mutex lock;
 	struct list_head attachments;
@@ -182,10 +183,16 @@ static struct dma_buf *carveout_heap_allocate(struct dma_heap *heap,
 	struct dma_buf *buf;
 	dma_addr_t daddr;
 	void *buffer;
 	int ret;
 
+	if (!heap_priv->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_PROTECTED))
+		return ERR_PTR(-EINVAL);
+
+	if (heap_priv->ecc_enabled && (heap_flags & DMA_HEAP_FLAG_ECC_UNPROTECTED))
+		return ERR_PTR(-EINVAL);
+
 	buffer_priv = kzalloc(sizeof(*buffer_priv), GFP_KERNEL);
 	if (!buffer_priv)
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&buffer_priv->attachments);
@@ -235,20 +242,29 @@ static int __init carveout_heap_setup(struct device_node *node)
 	const struct reserved_mem *rmem;
 	struct carveout_heap_priv *priv;
 	struct dma_heap *heap;
 	struct gen_pool *pool;
 	void *base;
+	u32 val = 0;
 	int ret;
 
 	rmem = of_reserved_mem_lookup(node);
 	if (!rmem)
 		return -EINVAL;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	of_property_read_u32(node, "ecc-correction-bits", &val);
+	if (val <= 0) {
+		if (of_memory_get_ecc_correction_bits() > 0)
+			priv->ecc_enabled = true;
+	} else {
+		priv->ecc_enabled = true;
+	}
+
 	pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
 	if (!pool) {
 		ret = -ENOMEM;
 		goto err_cleanup_heap;
 	}

-- 
2.44.0

