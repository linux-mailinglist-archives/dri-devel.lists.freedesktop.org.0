Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F869C0950E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF88810E2DF;
	Sat, 25 Oct 2025 16:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sh/gFYhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D4310E2E4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 16:19:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 98B704348E;
 Sat, 25 Oct 2025 16:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F75C4CEFB;
 Sat, 25 Oct 2025 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409197;
 bh=ZKYECfmuP/gazJZqAd0Bg4txl0khCpg3PaWDHbZ4OGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sh/gFYhGqoWcTP4W1+trLjisB33oeJ+3MwAoZYG+kBPEdZgsyf3FuR0WO2TsmWyfM
 sERUJzqyW/18flawVSsFOFDc6pcyFTGqLaZe3Y6DZ/iB3efn9STcU1s2b9xBhenDzn
 9kd96aI71IeaQNZJkOIYRMY4kCtoBFIJK3gUF5g12wiT/sl5jbG2VKkjTpDJE1Eeuk
 E3D0GUtC7zA8TmLGeBox2kfZk4GfRfcUgqW6QovIgbyQuoh/kTAeiQRX/cVMdtlw3T
 vbkFLC+bAPi2UdooTWvh+VxUyNGb5rdZTs4CAl7jMezOrJsbAhOLlRPp3K7CCpjEKz
 SxGH859rqfwxQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-6.12] drm/panthor: check bo offset alignment in
 vm bind
Date: Sat, 25 Oct 2025 11:57:51 -0400
Message-ID: <20251025160905.3857885-240-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Chia-I Wu <olvaffe@gmail.com>

[ Upstream commit 5afa9d2a9bb1410f816e0123846047288b16e4b9 ]

Fail early from panthor_vm_bind_prepare_op_ctx instead of late from
ops->map_pages.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Link: https://lore.kernel.org/r/20250828200116.3532255-1-olvaffe@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What changed
  - Adds page-size alignment validation for `op->bo_offset` alongside
    `op->va` and `op->size` in `panthor_vm_bind_prepare_op_ctx`, causing
    early `-EINVAL` if any are misaligned
    (drivers/gpu/drm/panthor/panthor_mmu.c:2450).
  - Clarifies `panthor_vm_prepare_map_op_ctx` by updating the comment to
    reflect it only checks in-bounds, not alignment
    (drivers/gpu/drm/panthor/panthor_mmu.c:1225).

- Why it matters
  - Previously, only `va` and `size` were checked for alignment at bind-
    prepare time; an unaligned `bo_offset` would be detected later
    during page-table mapping via `ops->map_pages`, i.e., deeper in the
    map path (drivers/gpu/drm/panthor/panthor_mmu.c:917). This late
    failure wastes work (page pinning, SGT fetching, VM BO handling, PT
    prealloc) before unwinding.
  - The new check fails fast at the UAPI entry point for both async and
    sync VM_BIND flows:
    - Async: `panthor_vm_bind_job_create` calls prepare and now rejects
      invalid input immediately
      (drivers/gpu/drm/panthor/panthor_mmu.c:2514).
    - Sync: `panthor_vm_bind_exec_sync_op` likewise rejects before any
      mapping work (drivers/gpu/drm/panthor/panthor_mmu.c:2683).
  - Behavior for invalid inputs does not change (still returns
    `-EINVAL`), but error is returned sooner and more predictably. There
    is no change for valid inputs.

- Correctness and consistency
  - Alignment to the VM page size is consistent with existing checks: VA
    and size are enforced to page alignment in various paths, and the
    VM’s page size is derived from the IOMMU page-table configuration
    (drivers/gpu/drm/panthor/panthor_mmu.c:848).
  - Mapping uses the physical address `paddr = sg_dma_address(sgl) +
    offset`; an unaligned `offset` directly misaligns `paddr`, which can
    cause `ops->map_pages` to fail or fall back suboptimally. Catching
    this in the ioctl path avoids deeper IOMMU/map failures
    (drivers/gpu/drm/panthor/panthor_mmu.c:917).

- Risk assessment
  - Small, contained validation change with no API or architectural
    changes; affects only the panthor driver.
  - Reduces resource churn on error paths (pin/unpin, PT prealloc, etc.)
    and avoids late failures; cleanup paths already exist and remain
    unchanged.
  - No change to success paths; only earlier rejection for inputs that
    would fail later anyway.

- Stable backport criteria
  - Fixes a real (though not catastrophic) bug: missing parameter
    validation leading to late errors and unnecessary work.
  - Minimal regression risk and confined to a single subsystem file.
  - Improves robustness and user-visible behavior (fail early,
    consistent `-EINVAL`), aligning with stable policy for small, low-
    risk fixes.

Given the above, this is a good candidate for stable backport.

 drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5af..d18c832d8ae9a 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1194,7 +1194,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	    (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) != DRM_PANTHOR_VM_BIND_OP_TYPE_MAP)
 		return -EINVAL;
 
-	/* Make sure the VA and size are aligned and in-bounds. */
+	/* Make sure the VA and size are in-bounds. */
 	if (size > bo->base.base.size || offset > bo->base.base.size - size)
 		return -EINVAL;
 
@@ -2411,7 +2411,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
 	int ret;
 
 	/* Aligned on page size. */
-	if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
+	if (!IS_ALIGNED(op->va | op->size | op->bo_offset, vm_pgsz))
 		return -EINVAL;
 
 	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {
-- 
2.51.0

