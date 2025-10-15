Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF3BDF86B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CEF10E853;
	Wed, 15 Oct 2025 16:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FUY83EDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE0710E853
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760544216;
 bh=si+z8fRpLLhAn9HA8aXWodGeWDbAP1JbWJuId1d8ggc=;
 h=From:To:Cc:Subject:Date:From;
 b=FUY83EDKbFiBhHNYg2DUwDLzGVTFCtdq0lI0G1A4zRfdVn5T6vSEPD3aYD3cAdzFt
 CffYsDwGYYV7hsDFAk+Fe8D163/vTAhsMC5RCIJ9sklXLJo/lRHQzgxcdPp9deIpO0
 fFnuX/yA1IXXFg29B03uJUAi48ZxIfCqiS5M6UDf09jnzFRc71cXtJclhyqNxnW0OK
 NwXe7CaLAbPg19D10g8Y6xgGk9iYxdjRZihS4/OtZj5V1lKow8ZhlXeAkD7yVaQmsN
 rvw1STc5GonnO5vFmU0mesZPikFVjsLAXyLxkBBnza1EpyB1bklirXB2WWmU/TOiLI
 7aYC1jxZ0PatQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 78F7017E1305;
 Wed, 15 Oct 2025 18:03:36 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v4 00/14]  drm/panfrost,
 panthor: Cached maps and explicit flushing
Date: Wed, 15 Oct 2025 18:03:12 +0200
Message-ID: <20251015160326.3657287-1-boris.brezillon@collabora.com>
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
and panthor.  To avoid code/bug duplication, the tricky guts of the cache
flushing ioctl which walk the sg list are broken into a new common shmem
helper which can be used by any driver.

The PanVK MR to use this lives here:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385

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

Boris Brezillon (7):
  drm/panthor: Fix panthor_gpu_coherency_set()
  drm/gem: Add a drm_gem_object_funcs::sync() and a drm_gem_sync()
    helper
  drm/prime: Provide default ::{begin,end}_cpu_access() implementations
  drm/panthor: Expose the selected coherency protocol to the UMD
  drm/panthor: Add an ioctl to query BO flags
  drm/panfrost: Expose the selected coherency protocol to the UMD
  drm/panfrost: Add an ioctl to query BO flags

Faith Ekstrand (6):
  drm/shmem: Add a drm_gem_shmem_sync() helper
  drm/panthor: Add a PANTHOR_BO_SYNC ioctl
  drm/panthor: Bump the driver version to 1.6
  drm/panfrost: Add a PANFROST_SYNC_BO ioctl
  drm/panfrost: Add flag to map GEM object Write-Back Cacheable
  drm/panfrost: Bump the driver version to 1.6

Loïc Molinari (1):
  drm/panthor: Add flag to map GEM object Write-Back Cacheable

 drivers/gpu/drm/drm_gem.c                  |  10 ++
 drivers/gpu/drm/drm_gem_shmem_helper.c     |  89 +++++++++++
 drivers/gpu/drm/drm_prime.c                |  42 +++++
 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 106 ++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    |  23 +++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |   2 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |  26 +++-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  10 +-
 drivers/gpu/drm/panthor/panthor_device.c   |  10 +-
 drivers/gpu/drm/panthor/panthor_drv.c      |  84 +++++++++-
 drivers/gpu/drm/panthor/panthor_gem.c      |  24 +++
 drivers/gpu/drm/panthor/panthor_gem.h      |   3 +
 drivers/gpu/drm/panthor/panthor_gpu.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c    |  18 ++-
 include/drm/drm_gem.h                      |  45 ++++++
 include/drm/drm_gem_shmem_helper.h         |  11 ++
 include/drm/drm_prime.h                    |   5 +
 include/uapi/drm/panfrost_drm.h            |  74 +++++++++
 include/uapi/drm/panthor_drm.h             | 171 ++++++++++++++++++++-
 20 files changed, 738 insertions(+), 18 deletions(-)

-- 
2.51.0

