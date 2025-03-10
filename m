Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D3A5936E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACE510E3F8;
	Mon, 10 Mar 2025 12:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qjqmtDkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F0210E3FD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:06:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D5C5A45A99;
 Mon, 10 Mar 2025 12:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D605EC4CEEA;
 Mon, 10 Mar 2025 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741608384;
 bh=2YzE4b+Qi+V9hV6O5UCs1RYDTh6ddyq+BV8GpU5GQUE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qjqmtDknv7QUg/iDumEaO9V3eXLQMkJoagsIq89SSs+1N7acbPZXWD17ldw1M3TKe
 PMliu5u6NwaMsA3bT6dLrX1yjvUMkL0oA80IjJJi+hypDgd7j5qAw1hgGQZOFzqnnQ
 ZInbEz/FbqYH2OiTTl6wgDaSimir6JW+oaipvFPaSPGfPzNZcQJFhuNQjx2PxWGM71
 byt+Kceqio0vbEhIzd9qn2qVk4H5w0YpfWJ3v9GO7/gbbjyEBPL1Gt9VJhZEXA0uy3
 h0vVv5EM1AXM3tM05QphZ64QctN82e6k9D5EqX4V2bEzy/jSs9ncUhvlHxQevCbp3o
 FnRn1MYeFwzGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:08 +0100
Subject: [PATCH RFC 02/12] cma: Provide accessor to cma dmem region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-2-2984c1bc9312@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2YzE4b+Qi+V9hV6O5UCs1RYDTh6ddyq+BV8GpU5GQUE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm5cH1a87eYU773J9zyPXm56VvU+f61h0oRf0qv/s
 ur96Ku/31HCwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJBKgwfM87LWv75/xvll/+
 5bx9sb0aNRxHUvaX7arWY/y6UinlPSPDzmh9kYQtsY85Fz4RDTOKPGBzTFnnmvzZJDFRv3YRq1Z
 +AA==
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

Consumers of the CMA API will have to know which CMA region their device
allocate from in order for them to charge the memory allocation in the
right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/cma.h | 9 +++++++++
 mm/cma.c            | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index d15b64f51336df18d17a4097e27961fd1ac8d79f..d7b2f13918e536aeb8bccebc1934d36f2f0b4cf4 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -66,6 +66,15 @@ static inline bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
 	return false;
 }
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma);
+#else /* CONFIG_CGROUP_DMEM */
+static inline struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return NULL;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index 41a9ae907dcf69a73e963830d2c5f589dfc44f22..4973a8c6bacb9d4924f4969be07757cf631304b8 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -49,10 +49,17 @@ unsigned long cma_get_size(const struct cma *cma)
 const char *cma_get_name(const struct cma *cma)
 {
 	return cma->name;
 }
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return cma->dmem_cgrp_region;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
 	if (align_order <= cma->order_per_bit)
 		return 0;

-- 
2.48.1

