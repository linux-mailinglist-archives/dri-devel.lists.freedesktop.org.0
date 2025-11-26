Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53879C89D27
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFD910E539;
	Wed, 26 Nov 2025 12:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="n+WCDfPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458E910E539;
 Wed, 26 Nov 2025 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764161107;
 bh=grs1ax7qR/C6sfUCImiEhPSGMofWWl8art4/baMp+io=;
 h=From:To:Cc:Subject:Date:From;
 b=n+WCDfPljwqwYw3nwsNRNK+wXmyf2ZhrMyDflIXNNPEmxzC51MaybTZjnvBlRZfOz
 QfMZpTWqC2eMv6IpAeho58BmBwEWnh3lYK69LLWQZXivTU71OLVfSPIGxh2rqcAR2N
 k88ZIqyOtSw/Lu5/G7iVJauVo/jIncdbKqhb0qCG+/K9kAfj0NwogFWYrrpO3/Rhz1
 9SJKlZfM8hjE3s8+c3u5PQZntubgzIwLiAqtatph3sVNCOhbyFUwbHqbceDZ/JXZhw
 SeZzoP+ReCCWipElCYyEghP4/1vBi60LTW4XSa4Ne1ifHwmqMKcWaGJ8xLq0HHVptN
 gM7brXU+sCBSA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E3F7117E10F6;
 Wed, 26 Nov 2025 13:45:06 +0100 (CET)
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
Subject: [PATCH v6 00/16] drm/panfrost,
 panthor: Cached maps and explicit flushing
Date: Wed, 26 Nov 2025 13:44:39 +0100
Message-ID: <20251126124455.3656651-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
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

The questions about the DMA-API based CPU-cache-flush mechanism used
in this patchset have been dropped. After briefly discussing it with
Sima and Robin, it seems there's a consensus on the fact we should
probably expose CPU cache maintenance without going through the DMA
API (extending drm_cache? providing MM helpers for CPU cache
flush/invalidation? It's not clear yet how, but this will be discussed
in a separate thread). In the meantime, we can rely on dma_sync because
that's good enough for our usecase.

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

Changes in v6:
- No major changes, check the changelog in each patch for more details

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
 drivers/gpu/drm/drm_prime.c                |  10 +-
 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 101 +++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    |  67 +++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |   9 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |  26 ++-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  10 +-
 drivers/gpu/drm/panthor/panthor_device.c   |  10 +-
 drivers/gpu/drm/panthor/panthor_drv.c      |  79 +++++++-
 drivers/gpu/drm/panthor/panthor_gem.c      |  71 ++++++-
 drivers/gpu/drm/panthor/panthor_gem.h      |   4 +
 drivers/gpu/drm/panthor/panthor_gpu.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c    |  18 +-
 include/drm/drm_drv.h                      |   8 +
 include/drm/drm_gem_shmem_helper.h         |  24 +++
 include/uapi/drm/panfrost_drm.h            |  76 +++++++-
 include/uapi/drm/panthor_drm.h             | 157 +++++++++++++++-
 18 files changed, 857 insertions(+), 23 deletions(-)

-- 
2.51.1

