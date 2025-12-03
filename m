Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A76C9E577
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C3210E795;
	Wed,  3 Dec 2025 09:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iSsPiBh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1403010E795;
 Wed,  3 Dec 2025 09:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764752511;
 bh=wVBXVqr/V4BvZy2UwGWrvsKrKLyi0iQ/iJea+Zd89Vs=;
 h=From:To:Cc:Subject:Date:From;
 b=iSsPiBh2jQ6jcltEgE/44aSbaYEXp6IGCnieG9WdYFfiNhoP2MiK1S8gte/34FAQb
 I6LP96M2ze0LmfbydqeQ2vAg2YXkMLhVOtR92WhaRQq5QIFD0Ufy1GDQNI2/OlqzgJ
 KLuI2YTyT4s272emoNnyTB1FCaTZDiaBKWa5QURwkm0WOB+th1K5jFYLIPocMFaM5m
 ImWjNnBIiUVT/NGJy4n+/WH1cp5AoQkzy7Ti7sWZE2Otn4d9bUZODlGfdUu2djHJR4
 rW5wz2+qxzoiUkcqbsYtUbfqQs6SwTPf/lAWtcvIFPPqKFHHWapOfMIK7HO7O9gYUH
 27nKEh3/189Kg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A5CE117E090D;
 Wed,  3 Dec 2025 10:01:50 +0100 (CET)
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
Subject: [PATCH v7 00/13] drm/panfrost,
 panthor: Cached maps and explicit flushing
Date: Wed,  3 Dec 2025 10:01:28 +0100
Message-ID: <20251203090141.227394-1-boris.brezillon@collabora.com>
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
topic in a follow-up MR. Keeping everyone Cc-ed on the previous
version involved, so they're aware of this change of direction,
sorry for the noise if you don't care :-/.

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
  drm/panthor: Bump the driver version to 1.6
  drm/panfrost: Add a PANFROST_SYNC_BO ioctl
  drm/panfrost: Add flag to map GEM object Write-Back Cacheable
  drm/panfrost: Bump the driver version to 1.6

Loïc Molinari (1):
  drm/panthor: Add flag to map GEM object Write-Back Cacheable

 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 101 ++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 240 +++++++++++++++++++++
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
 14 files changed, 954 insertions(+), 22 deletions(-)

-- 
2.51.1

