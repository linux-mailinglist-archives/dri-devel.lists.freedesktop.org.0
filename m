Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5893BAA8EF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 22:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BFC10E494;
	Mon, 29 Sep 2025 20:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HkWzCL1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983F110E494;
 Mon, 29 Sep 2025 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759176292;
 bh=99oZ1P7VzqkhLJbQUXrJREFvLqy3hC4FKU/uBU4LITk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HkWzCL1VTgODwNs2olF/EN97qvp+mVWvhDn/cRxOyHvNZ9dxHMYMo093ZkHsW6z2u
 22bmoYV9rKtr4m9f5UozvRl1b/1iswDL7ddGAk035uAdOAlP+N8JPOJrJuegpIhHvU
 UJXIA0ATufT54tRGQY0R4NhmSJc+DvzNX+5qDA7KP4RCM9ABxyGEO+c060P8XzMXJj
 hz/6i138BR0DbfGO48oePQPevtNXwew61jdn2T5uu8d81Nbic6RpZymEFsUZQqCG1o
 ABzLg51rKa+buvlGZvEwCGail5Z/WoFRBemGi1XoAdRphhyOC0OQwX74OpUHYbf6X6
 3qgFlPvsfjOvg==
Received: from debian-rockchip-rock5b-rk3588.. (unknown
 [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EEEE17E13C1;
 Mon, 29 Sep 2025 22:04:52 +0200 (CEST)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org, kernel@collabora.com
Subject: [PATCH 7/8] drm/panthor: Improve IOMMU map/unmap debugging logs
Date: Mon, 29 Sep 2025 22:03:15 +0200
Message-ID: <20250929200316.18417-8-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929200316.18417-1-loic.molinari@collabora.com>
References: <20250929200316.18417-1-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Log the number of pages and their sizes actually mapped/unmapped by
the IOMMU page table driver. Since a map/unmap op is often split in
several ops depending on the underlying scatter/gather table, add the
start address and the total size to the debugging logs in order to
help understand which batch an op is part of.

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e378..aefbd83d1a75 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -917,10 +917,9 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 {
 	struct panthor_device *ptdev = vm->ptdev;
 	struct io_pgtable_ops *ops = vm->pgtbl_ops;
+	u64 start_iova = iova;
 	u64 offset = 0;
 
-	drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm->as.id, iova, size);
-
 	while (offset < size) {
 		size_t unmapped_sz = 0, pgcount;
 		size_t pgsize = get_pgsize(iova + offset, size - offset, &pgcount);
@@ -935,6 +934,12 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 			panthor_vm_flush_range(vm, iova, offset + unmapped_sz);
 			return  -EINVAL;
 		}
+
+		drm_dbg(&ptdev->base,
+			"unmap: as=%d, iova=0x%llx, sz=%llu, va=0x%llx, pgcnt=%zu, pgsz=%zu",
+			vm->as.id, start_iova, size, iova + offset,
+			unmapped_sz / pgsize, pgsize);
+
 		offset += unmapped_sz;
 	}
 
@@ -950,6 +955,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 	struct scatterlist *sgl;
 	struct io_pgtable_ops *ops = vm->pgtbl_ops;
 	u64 start_iova = iova;
+	u64 start_size = size;
 	int ret;
 
 	if (!size)
@@ -969,15 +975,18 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 		len = min_t(size_t, len, size);
 		size -= len;
 
-		drm_dbg(&ptdev->base, "map: as=%d, iova=%llx, paddr=%pad, len=%zx",
-			vm->as.id, iova, &paddr, len);
-
 		while (len) {
 			size_t pgcount, mapped = 0;
 			size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
 
 			ret = ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
 					     GFP_KERNEL, &mapped);
+
+			drm_dbg(&ptdev->base,
+				"map: as=%d, iova=0x%llx, sz=%llu, va=0x%llx, pa=%pad, pgcnt=%zu, pgsz=%zu",
+				vm->as.id, start_iova, start_size, iova, &paddr,
+				mapped / pgsize, pgsize);
+
 			iova += mapped;
 			paddr += mapped;
 			len -= mapped;
-- 
2.47.3

