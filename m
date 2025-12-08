Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C50CACCCA
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822B10E40E;
	Mon,  8 Dec 2025 10:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DrFw8pfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2546C10E40E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188531;
 bh=L4YCTlatBJCXHw/iKjcmzk4mX+F156Xy65mqfvPBeX4=;
 h=From:To:Cc:Subject:Date:From;
 b=DrFw8pfN3yx3coQ4RMqTBsl83wLW/mUFRmXE9FMiZmww53iYPKM4Q8OggxAAUYUCc
 Tlbfq1HyJ8g5Wf0nvi2797qIYu4d5rzBkOD1g0Y0reFdHEGxAfDnqENz1A+yiXIlhI
 iF9HAJab0o8w3svP79LLQl3aPq5OQ3pLsgHYgPMA6A6HESZ9F81nbe7hw7yPfBKZU0
 zc07w6SdY8XOvyFd/vD86KzuTXVIED9y4J4bwkjFhjHGqnXJ5uQOoEQhlgghDX1DW4
 aJLRVLQM1HvKGTR+EYnFiqqwio+stdL09Yo6P5wGJgZT/fu2EIzLNc+kXEWz+YBUL/
 85Z4TjSPrNdsg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F40517E1216;
 Mon,  8 Dec 2025 11:08:51 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v8 00/13] drm/panfrost,
 panthor: Cached maps and explicit flushing
Date: Mon,  8 Dec 2025 11:08:27 +0100
Message-ID: <20251208100841.730527-1-boris.brezillon@collabora.com>
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
and panthor.

The PanVK MR to use this lives here:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385

This version moves away from the code sharing proposed at the
drm_prime/gem_shmem level and hand-roll a bunch of things that
could potentially be shared. The goal here is to take the path
of least resistance and discuss this controversial code-sharing
topic in a follow-up MR. Dropping driver maintainers Cc-ed on v7
since they should now be aware that we changed gears and hand-rolled
our own thing in pan{thor,frost}.

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

Changes in v7:
- Drop the drm_prime/gem_shmem helpers and duplicate the logic in
  panthor/panfrost

Changes in v8:
- Fix a double struct field assignment and collect R-b tags

Boris Brezillon (8):
  drm/panthor: Provide a custom dma_buf implementation
  drm/panthor: Fix panthor_gpu_coherency_set()
  drm/panthor: Expose the selected coherency protocol to the UMD
  drm/panthor: Add a PANTHOR_BO_SYNC ioctl
  drm/panthor: Add an ioctl to query BO flags
  drm/panfrost: Provide a custom dma_buf implementation
  drm/panfrost: Expose the selected coherency protocol to the UMD
  drm/panfrost: Add an ioctl to query BO flags

Faith Ekstrand (4):
  drm/panthor: Bump the driver version to 1.7
  drm/panfrost: Add a PANFROST_SYNC_BO ioctl
  drm/panfrost: Add flag to map GEM object Write-Back Cacheable
  drm/panfrost: Bump the driver version to 1.6

Loïc Molinari (1):
  drm/panthor: Add flag to map GEM object Write-Back Cacheable

 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 101 ++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 239 ++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |  10 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |  26 ++-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  10 +-
 drivers/gpu/drm/panthor/panthor_device.c   |  10 +-
 drivers/gpu/drm/panthor/panthor_drv.c      |  79 ++++++-
 drivers/gpu/drm/panthor/panthor_gem.c      | 240 ++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h      |   6 +
 drivers/gpu/drm/panthor/panthor_gpu.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c    |  18 +-
 include/uapi/drm/panfrost_drm.h            |  76 ++++++-
 include/uapi/drm/panthor_drm.h             | 157 +++++++++++++-
 14 files changed, 953 insertions(+), 22 deletions(-)

-- 
2.51.1

