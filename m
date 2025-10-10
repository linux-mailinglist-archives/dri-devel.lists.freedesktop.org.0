Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC1BCC7AD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051E310E0A1;
	Fri, 10 Oct 2025 10:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H51l7HbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3010E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760091117;
 bh=xwpt2loKoTA2acf46V7KINCf1zYDEBb8KR3mkW4IrP0=;
 h=From:To:Cc:Subject:Date:From;
 b=H51l7HbOuqHYxmgRNofQ3EXV0YGpe058pcLKj9jPL8dpMtJFcQQGfY0kxnt2oL0Ob
 9z6uo99DfWpcGyOu21oZbGTBfeYpYFFtO7Ozgd5oNJZ/PyWKNo/Z4o9Wc+7kl2mR5P
 dUGglxzL+kEAA32MiyIJxfCPPJ6doWA009CA9bh5OJEtv0qqISEPOBSTaWOORogM79
 fd3t3VsPs/13DzhbKoqhw5VjTWTyT9T0BvmByV+80SabMdXk8BQJ8G2uqqEnPg98YQ
 wkMjcIkrE9FdAV+sGVEvyQBUQLeprU/CrHkQC8yB2meVR/sDtej4mcNROp0vB8q4Gu
 Bc5rMzqbLWE0g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 32DCB17E013C;
 Fri, 10 Oct 2025 12:11:57 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 00/13] drm/panfrost,
 panthor: Cached maps and explicit flushing
Date: Fri, 10 Oct 2025 12:11:33 +0200
Message-ID: <20251010101147.3290604-1-boris.brezillon@collabora.com>
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
flusing ioctl which walk the sg list are broken into a new common shmem
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

Boris Brezillon (6):
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
 drivers/gpu/drm/drm_prime.c                |  36 +++++
 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 106 ++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    |  23 +++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |   2 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |  18 ++-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |   2 +
 drivers/gpu/drm/panthor/panthor_device.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_drv.c      |  85 +++++++++-
 drivers/gpu/drm/panthor/panthor_gem.c      |  24 +++
 drivers/gpu/drm/panthor/panthor_gem.h      |   3 +
 drivers/gpu/drm/panthor/panthor_gpu.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c    |  18 ++-
 include/drm/drm_gem.h                      |  45 ++++++
 include/drm/drm_gem_shmem_helper.h         |  11 ++
 include/drm/drm_prime.h                    |   5 +
 include/uapi/drm/panfrost_drm.h            |  74 +++++++++
 include/uapi/drm/panthor_drm.h             | 171 ++++++++++++++++++++-
 20 files changed, 717 insertions(+), 14 deletions(-)

-- 
2.51.0

