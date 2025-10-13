Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326ABD2153
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970E610E1D8;
	Mon, 13 Oct 2025 08:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XWiLvI7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1380410E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 08:35:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ED6B745C04;
 Mon, 13 Oct 2025 08:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B715C4CEE7;
 Mon, 13 Oct 2025 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760344532;
 bh=86W+tMqIGJ9AE1Kqrh+zL9da/Dha/yDtcLOGrEf75Ss=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XWiLvI7JXavv2mgEVXeUOzPMjY+KBbO+7mMEdBx6I35dBuc41wnN/wTfkd899wAek
 xxVLhIT86GOTeK8YeNP/hmMfP/xO8wgUmxfu4rHa+rG0QL7TBMEUkQb3u3XnTsUcvB
 OJNh+SsL1SnzH2G7tattrwNfm/T8CkSvuxsyV4XYK+CYh5W4smRW03MdXuJ/k+p0h6
 ZszoBCReQlhGFhJKmjVVmSJvARYZ7lpepzifbp6vpCggzfbzvQW5Gxfjk5NoRVi/j9
 5INvGi+N3jc4JNGGG2kEtNdGB23rvI5czBKQqAK/r5l06Ygl2uCFk1ijeFJuW5Zyt3
 WafdFcjzgWndQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 10:35:19 +0200
Subject: [PATCH v8 4/5] dma: contiguous: Reserve default CMA heap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dma-buf-ecc-heap-v8-4-04ce150ea3d9@kernel.org>
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
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

The CMA code, in addition to the reserved-memory regions in the device
tree, will also register a default CMA region if the device tree doesn't
provide any, with its size and position coming from either the kernel
command-line or configuration.

Let's register that one for use to create a heap for it.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/dma/contiguous.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index d67e95094749d45f43c1809c175e491a3f55b2e1..d8fd6f779f797f711b8e0fd628f868d644b8f784 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -240,17 +240,23 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 		selected_size = max(size_bytes, cma_early_percent_memory());
 #endif
 	}
 
 	if (selected_size && !dma_contiguous_default_area) {
+		int ret;
+
 		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
 			 (unsigned long)selected_size / SZ_1M);
 
 		dma_contiguous_reserve_area(selected_size, selected_base,
 					    selected_limit,
 					    &dma_contiguous_default_area,
 					    fixed);
+
+		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
+		if (ret)
+			pr_warn("Couldn't register default CMA heap.");
 	}
 }
 
 void __weak
 dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)

-- 
2.51.0

