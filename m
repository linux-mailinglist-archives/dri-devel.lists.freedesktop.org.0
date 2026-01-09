Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0564D0A379
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 14:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA5C10E23E;
	Fri,  9 Jan 2026 13:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YCgF8Tge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11E10E118
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767964092;
 bh=3IUICi41IRgZVAFWuzfH83tQj43RsDbUTEoR4dDMYk0=;
 h=From:To:Cc:Subject:Date:From;
 b=YCgF8TgeOmm3M/7grbha51iwICNDv9niJiBSTLapdPZyOQKpkmJM105ElhPVubCG1
 ilTKjAEfW/rR5Fl2F2CH2cWGgEg4qoYqEQNw59f6xWItrN3c8DPdOWZIIE8+3+OGyI
 YhKet/+Xi/i5UQCbpqsEFT+QUDTB7pvhwHpbt9MAZAHD/q9201Rrq62v7rfObr5ODF
 6vpck2W/L0RQPfT9MhkwB1JIHSRrJFAmbi2lf5YsCkKvjhTc+JU4jjEWvcytu0SRWs
 MK+73mxIZP56+auoSK9r2VG3SW/Br1HFF4gP6N1wLMxbiw2hH+AU9LotWveEey105g
 7NAtAyeVVkdnw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BC59717E13E0;
 Fri,  9 Jan 2026 14:08:11 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: [PATCH v1 0/9] drm/panthor: Add a GEM shrinker
Date: Fri,  9 Jan 2026 14:07:52 +0100
Message-ID: <20260109130801.1239558-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

Hello,

This is an attempt at adding a GEM shrinker to panthor so the system
can finally reclaim GPU memory.

This implementation is losely based on the MSM shrinker (which is why
I added the MSM maintainers in Cc), and it's relying on the drm_gpuvm
eviction/validation infrastructure.

I've only done very basic IGT-based [1] and chromium-based (opening
a lot of tabs on Aquarium until the system starts reclaiming+swaping
out GPU buffers) testing, but I'm posting this early so I can get
preliminary feedback on the implementation. If someone knows about
better tools/ways to test the shrinker, please let me know.

A few words about some design/implementation choices:
- No MADVISE support because I want to see if we can live with just
  transparent reclaim
- We considered basing this implementation on the generic shrinker work
  started by Dmitry [2], but
  1. with the activeness/idleness tracking happening at the VM
     granularity, having per-BO LRUs would caused a lot of
     list_move()s that are not really needed (the VM as a whole
     become active/idle, we can track individual BOs)
  2. Thomas Zimmermann recently suggested that we should have our
     own GEM implementation instead of trying to add this extra reclaim
     complexity to gem-shmem. There are some plans to create a
     gem-uma (Unified Memory Architecture) lib that would do more
     than gem-shmem but in a way that doesn't force all its users
     to pay the overhead (size overhead of the gem object, mostly)
     for features they don't use. Patch "Part ways with
     drm_gem_shmem_object" is showing what this component-based lib
     API could look like if it were to be extracted
- At the moment we only support swapout, but we could add an
  extra flag to specify when buffer content doesn't need to be
  preserved to avoid the swapout/swapin dance. First candidate for
  this DISCARD_ON_RECLAIM flag would probably be the tiler heap chunks.
- Reclaim uses _try_lock() all the way because of the various lock order
  inversions between the reclaim path and submission paths. That means
  we don't try very hard to reclaim hot GPU buffers, but the locking is
  such a mess that I don't really see a better option to be honest.

Regards,

Boris

[1]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/commit/fc76934a5579767d2aabe787d40e38a17c3f4ea4
[2]https://lkml.org/lkml/2024/1/5/665

Akash Goel (1):
  drm/panthor: Add a GEM shrinker

Boris Brezillon (8):
  drm/gem: Consider GEM object reclaimable if shrinking fails
  drm/gpuvm: Validate BOs in the extobj list when VM is resv protected
  drm/panthor: Move panthor_gems_debugfs_init() to panthor_gem.c
  drm/panthor: Group panthor_kernel_bo_xxx() helpers
  drm/panthor: Part ways with drm_gem_shmem_object
  drm/panthor: Lazily allocate pages on mmap()
  drm/panthor: Split panthor_vm_prepare_map_op_ctx() to prepare for
    reclaim
  drm/panthor: Track the number of mmap on a BO

 drivers/gpu/drm/drm_gem.c                |   10 +
 drivers/gpu/drm/drm_gpuvm.c              |   23 +-
 drivers/gpu/drm/panthor/Kconfig          |    1 -
 drivers/gpu/drm/panthor/panthor_device.c |   11 +-
 drivers/gpu/drm/panthor/panthor_device.h |   73 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |   33 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   16 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 1387 ++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_gem.h    |  135 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  451 +++++--
 drivers/gpu/drm/panthor/panthor_mmu.h    |    8 +
 drivers/gpu/drm/panthor/panthor_sched.c  |    9 +-
 include/drm/drm_gpuvm.h                  |    6 +
 13 files changed, 1829 insertions(+), 334 deletions(-)

-- 
2.52.0

