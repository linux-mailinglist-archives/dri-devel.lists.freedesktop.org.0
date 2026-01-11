Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E863AD0E96B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 11:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9610E0D0;
	Sun, 11 Jan 2026 10:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GJfxDiwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B18410E0D0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 10:37:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0808560010;
 Sun, 11 Jan 2026 10:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E15DC4CEF7;
 Sun, 11 Jan 2026 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768127839;
 bh=XZA4z75ZOHA3aBBuy9XF0n0lJ74IuJtROdjB9F6LTwg=;
 h=From:To:Cc:Subject:Date:From;
 b=GJfxDiwSgzusKIQpJZPvotpXqneRfIW4Aw0aoP73c8C0uMUG2kZo2uFwS4W+jq8Z/
 ScyO11QB8QX+9Wp0ZPkxN5mbCMu8rBJk+2uz0yb2ZME/2iwTVCKsF6124sJPF8Y58m
 nCjdl0+oRyz1N224ttGKmOFL8AElqtrQei4VQRO8+UEBiVJxjxr9rLvjYvfGd243co
 pAQ96WtNcurKnh+UHt2hfeCfpNOmGe6+mOI9/4GVuhENuJItjyZHEsqeJTvzBNm9kh
 Z4bM3XW0wzDb6a7RZldoMydvWeT6tErDqQScE1ckUiHKNtOMHLhvXEJ2yjzPH32R97
 102Te8QiEqXTg==
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
Subject: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared buffers
Date: Sun, 11 Jan 2026 12:37:07 +0200
Message-ID: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251221-dmabuf-revoke-b90ef16e4236
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

This series implements a dma-buf “revoke” mechanism: to allow a dma-buf
exporter to explicitly invalidate (“kill”) a shared buffer after it has
been distributed to importers, so that further CPU and device access is
prevented and importers reliably observe failure.

Today, dma-buf effectively provides “if you have the fd, you can keep using
the memory indefinitely.” That assumption breaks down when an exporter must
reclaim, reset, evict, or otherwise retire backing memory after it has been
shared. Concrete cases include GPU reset and recovery where old allocations
become unsafe to access, memory eviction/overcommit where backing storage
must be withdrawn, and security or isolation situations where continued access
must be prevented. While drivers can sometimes approximate this with
exporter-specific fencing and policy, there is no core dma-buf state transition
that communicates “this buffer is no longer valid; fail access” across all
access paths.

The change in this series is to introduce a core “revoked” state on the dma-buf
object and a corresponding exporter-triggered revoke operation. Once a dma-buf
is revoked, new access paths are blocked so that attempts to DMA-map, vmap, or
mmap the buffer fail in a consistent way.

In addition, the series aims to invalidate existing access as much as the kernel
allows: device mappings are torn down where possible so devices and IOMMUs cannot
continue DMA.

The semantics are intentionally simple: revoke is a one-way, permanent transition
for the lifetime of that dma-buf instance.

From a compatibility perspective, users that never invoke revoke are unaffected,
and exporters that adopt it gain a core-supported enforcement mechanism rather
than relying on ad hoc driver behavior. The intent is to keep the interface
minimal and avoid imposing policy; the series provides the mechanism to terminate
access, with policy remaining in the exporter and higher-level components.

BTW, see this megathread [1] for additional context.  
Ironically, it was posted exactly one year ago.

[1] https://lore.kernel.org/all/20250107142719.179636-2-yilun.xu@linux.intel.com/

Thanks

Cc: linux-rdma@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: kvm@vger.kernel.org
Cc: iommu@lists.linux.dev
To: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Alex Williamson <alex@shazbot.org>
To: Kevin Tian <kevin.tian@intel.com>
To: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
Leon Romanovsky (4):
      dma-buf: Introduce revoke semantics
      vfio: Use dma-buf revoke semantics
      iommufd: Require DMABUF revoke semantics
      iommufd/selftest: Reuse dma-buf revoke semantics

 drivers/dma-buf/dma-buf.c          | 36 ++++++++++++++++++++++++++++++++----
 drivers/iommu/iommufd/pages.c      |  2 +-
 drivers/iommu/iommufd/selftest.c   | 12 ++++--------
 drivers/vfio/pci/vfio_pci_dmabuf.c | 27 ++++++---------------------
 include/linux/dma-buf.h            | 31 +++++++++++++++++++++++++++++++
 5 files changed, 74 insertions(+), 34 deletions(-)
---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20251221-dmabuf-revoke-b90ef16e4236

Best regards,
--  
Leon Romanovsky <leonro@nvidia.com>

