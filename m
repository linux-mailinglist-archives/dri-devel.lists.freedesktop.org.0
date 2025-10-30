Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A26C2074B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB3610E982;
	Thu, 30 Oct 2025 14:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QcYzSFDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2120010E5D2;
 Thu, 30 Oct 2025 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833136;
 bh=kIw7xNe/xB6WTR1zFb0jRwn9/fqnoQwox9SIw7CMUm8=;
 h=From:To:Cc:Subject:Date:From;
 b=QcYzSFDTzoUHxoJoPSOPej+OAnReE6syO3/aKpDaydnHGRB3/4Q15kUMvJsLtWYmR
 nsFdz0a0MiiVb2O5ariVXujan4dnhhvi6n/A3A5xOGDufeA+grq7KS4kwGBWfWZhQZ
 gSA3z8fkVH7rtlGKn5pXoFr+A5A9pJ0qD53tyWFuTXMc0vLJJRMRO32kIsNYFtV/h1
 pZvPhV6xlNW4rY15AaHSixwjwqJyvpdjtp1YLMpOvYrkAeZhxE/il8E6hpiM+PKxZH
 EQ7CST73w7JsgmB8S/dDtxoG3jK+CNX5rPcoG4EfiOeqUyWGwyZly8pCxgelz5Tnta
 Jw+1YCPfzuIjA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B98DB17E139C;
 Thu, 30 Oct 2025 15:05:35 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v5 00/16] drm/panfrost,
 panthor: Cached maps and explicit flushing
Date: Thu, 30 Oct 2025 15:05:09 +0100
Message-ID: <20251030140525.366636-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
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

This series implements cached maps and explicit flushing for both panfrost
and panthor. To avoid code/bug duplication, the tricky guts of the cache
flushing ioctl which walk the sg list are broken into a new common shmem
helper which can be used by any driver.

The PanVK MR to use this lives here:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385

A few words about this v5: Faith and I discussed a few cache
maintenance aspects that were bothering me, and she suggested to forbid
exports of CPU-cacheable BOs to simplify things. But while doing that I
realized this was still broken on systems where the Mali GPU is coherent
but other potential importers are not, because in that case, even BOs
declared without WB_MMAP are upgraded to CPU-cacheable. I first
considered making those truly uncached, but that's not possible because
coherency is flagged at the device level and making a BO non-cacheable
on these systems messes up with how shmem zeroes out the pages at alloc
time (with a temporary cached mapping) and how Arm64 lazily defers
flushes. Because dma_map_sgtable() ends up being a NOP if the device is
coherent, we end up with dirty cachelines hanging around even after
we've created an uncached mapping to the same memory region, and this
leads to corruptions later on, or even worse, potential data leaks
because the uncached mapping can access memory before it's been zeroed
out.

TLDR; CPU cache maintenance is an mess on Arm unless everything is
coherent, and we'll have to sort it out at some point, but I believe
this is orthogonal to us implementing proper
dma_buf_ops::{begin,end}_cpu_access(), so, I eventually decided to
implement dma_buf_ops::{begin,end}_cpu_access() instead of pretending
we're good if we only export CPU-uncached BOs (which we can't really
do on systems where Mali is coherent, see above). I've hacked an
IGT test to make sure this does the right thing, and it seems to work.
Now, the real question is, is this the right thing to do. I basically
went for the system dma_heap approach where not only the exporter, but
also all importers have a dma_sync_sgtable_for_xxx() called on their
sgtable to prepare/end the CPU access. This should work if only CPU
cache maintenance is involved, but as soon as the importer needs more
than that (copying memory around to make it CPU/device visible), it's
going to be problematic. The only way to do that properly, would be
to add {begin,end}_cpu_access() hooks to dma_buf_attach_ops and let
the dma_buf core walk the importers to forward CPU access requests.

Sorry for the noise if you've been Cc-ed and don't care, but my goal
is to gather feedback on what exactly is expected from GPU drivers
exporting their CPU-cacheable buffers, and why so many drivers get
away with no dma_buf_ops::xxx_cpu_access() hooks, or very simple
ones that don't cover the cases I described above.

Changes in v2:
- Expose the coherency so userspace can know when it should skip cache
  maintenance
- Hook things up at drm_gem_object_funcs level to dma-buf cpu_prep hooks
  can be implemented generically
- Revisit the semantics of the flags passed to gem_sync()
- Add BO_QUERY_INFO ioctls to query BO flags on imported objects and
  let the UMD know when cache maintenance is needed on those

Changes in v3:
- New patch to fix panthor_gpu_coherency_set()
- No other major changes, check each patch changelog for more details

Changes in v4:
- Two trivial fixes, check each patch changelog for more details

Changes in v5:
- Add a way to overload dma_buf_ops while still relying on the drm_prime
  boilerplate
- Add default shmem implementation for
  dma_buf_ops::{begin,end}_cpu_access()
- Provide custom dma_buf_ops to deal with CPU cache flushes around CPU
  accesses when the BO is CPU-cacheable
- Go back to a version of drm_gem_shmem_sync() that only deals with
  cache maintenance, and adjust the semantics to make it clear this is
  the only thing it cares about
- Adjust the BO_SYNC ioctls according to the new drm_gem_shmem_sync()
  semantics

Boris Brezillon (10):
  drm/prime: Simplify life of drivers needing custom dma_buf_ops
  drm/shmem: Provide a generic {begin,end}_cpu_access() implementation
  drm/panthor: Provide a custom dma_buf implementation
  drm/panthor: Fix panthor_gpu_coherency_set()
  drm/panthor: Expose the selected coherency protocol to the UMD
  drm/panthor: Add a PANTHOR_BO_SYNC ioctl
  drm/panthor: Add an ioctl to query BO flags
  drm/panfrost: Provide a custom dma_buf implementation
  drm/panfrost: Expose the selected coherency protocol to the UMD
  drm/panfrost: Add an ioctl to query BO flags

Faith Ekstrand (5):
  drm/shmem: Add a drm_gem_shmem_sync() helper
  drm/panthor: Bump the driver version to 1.6
  drm/panfrost: Add a PANFROST_SYNC_BO ioctl
  drm/panfrost: Add flag to map GEM object Write-Back Cacheable
  drm/panfrost: Bump the driver version to 1.6

Loïc Molinari (1):
  drm/panthor: Add flag to map GEM object Write-Back Cacheable

 drivers/gpu/drm/drm_gem_shmem_helper.c     | 207 +++++++++++++++++++++
 drivers/gpu/drm/drm_prime.c                |  14 +-
 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  98 +++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    |  73 ++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |   9 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |  26 ++-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  10 +-
 drivers/gpu/drm/panthor/panthor_device.c   |  10 +-
 drivers/gpu/drm/panthor/panthor_drv.c      |  80 +++++++-
 drivers/gpu/drm/panthor/panthor_gem.c      |  77 +++++++-
 drivers/gpu/drm/panthor/panthor_gem.h      |   6 +
 drivers/gpu/drm/panthor/panthor_gpu.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c    |  18 +-
 include/drm/drm_drv.h                      |   8 +
 include/drm/drm_gem_shmem_helper.h         |  24 +++
 include/uapi/drm/panfrost_drm.h            |  76 +++++++-
 include/uapi/drm/panthor_drm.h             | 160 +++++++++++++++-
 18 files changed, 875 insertions(+), 24 deletions(-)

-- 
2.51.0

