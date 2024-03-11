Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6E6877DAB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 11:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA3F10EC3A;
	Mon, 11 Mar 2024 10:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G3Ka4SAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CA510EC0D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0x3lpvhLXYC+dqAGxNnQcEd8h75y/WIjUGZjxRBa8Uo=; b=G3Ka4SAN5xjnHg4d1nTow4WI6f
 mkDIhgEjPR918/QcmUTUp6kwcIp6+WBVWnz+nwLSsnMkp0dYypwKuXFH59w7gpTZCO5UzIwv322op
 s+2i0GdB41lByRDvR6LO331zHchp9ORoTgfApQ3MPF09PN3m7xsS7RlB1PYDj0lP1nuYtEyRIL7TT
 +8tSFcXjuXgBxyHo+zbBhGmAVPEfI0cN/ZYG2B+YyaNu4/HsB+tmdX0z7cB1wtnGLUKwnE1PawQJC
 jBX2OhAvsTzvVDQ/uR0EyStlPr09MxD6fH3npVbfi18KNSFFFSxSH4Wq6SfsBxgKv7NqLY40QRI7C
 SWWZ2y4Q==;
Received: from [186.230.26.74] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rjcbo-008ou6-Q9; Mon, 11 Mar 2024 11:10:17 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/5] drm/v3d: Enable Super Pages
Date: Mon, 11 Mar 2024 07:05:57 -0300
Message-ID: <20240311100959.205545-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
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

This series introduces support for super pages in V3D. The V3D MMU has support
for 1MB pages, called super pages, which is currently not used. Therefore,
this patchset has the intention to enable super pages in V3D. The advantage of
enabling super pages size is that if any entry for a page within a super page
is cached in the MMU, it will be used for translation of all virtual addresses
in the range of that super pages without requiring fetching any other entries.

Super pages essentially means a slightly better performance for users,
especially in applications with high memory requirements (e.g. applications
that uses multiple large BOs).

Using a Raspberry Pi 4 (with a PAGE_SIZE=4KB downstream kernel), when running
traces from multiple applications, we were able to see the following
improvements:

fps_avg  helped:  warzone2100.70secs.1024x768.trace:                       1.81 -> 2.56 (41.82%)
fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       2.00 -> 2.39 (19.62%)
fps_avg  helped:  quake2-gl1.4-1280x720.trace:                             35.01 -> 36.57 (4.47%)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       120.75 -> 125.50 (3.93%)
fps_avg  helped:  quake2-gles3-1280x720.trace:                             62.69 -> 64.29 (2.55%)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      26.13 -> 26.75 (2.39%)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     60.35 -> 61.36 (1.67%)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             24.60 -> 24.94 (1.40%)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     23.07 -> 23.34 (1.15%)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       47.44 -> 47.74 (0.63%)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              18.91 -> 19.02 (0.59%)

Using a Raspberry Pi 5 (with a PAGE_SIZE=16KB downstream kernel), when running
traces from multiple applications, we were able to see the following
improvements:

fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       3.60 -> 4.49 (24.72%)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                              46.33 -> 49.34 (6.49%)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr:    155.70 -> 165.71 (6.43%)
fps_avg  helped:  gl-117-1024x768.trace:                                   31.82 -> 33.85 (6.41%)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       287.80 -> 303.80 (5.56%)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      45.27 -> 47.30 (4.49%)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                              42.05 -> 43.68 (3.89%)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      19.94 -> 20.59 (3.26%)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     135.19 -> 139.45 (3.15%)
fps_avg  helped:  quake2-gles3-1280x720.trace:                             151.71 -> 156.13 (2.92%)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              30.28 -> 31.05 (2.54%)
fps_avg  helped:  rbdoom-3-bfg_640x480.gfxr:                               31.52 -> 32.30 (2.49%)
fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 157.29 -> 160.35 (1.94%)
fps_avg  helped:  quake3e-1280x720.trace:                                  230.48 -> 234.51 (1.75%)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     49.67 -> 50.46 (1.60%)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             39.70 -> 40.23 (1.34%)

This series also introduces changes in the GEM helpers, in order to enable V3D
to have a separated mountpoint for shmem GEM objects. Any feedback from the
community about the changes in the GEM helpers is welcomed!

Best Regards,
- Maíra

Maíra Canal (5):
  drm/v3d: Fix return if scheduler initialization fails
  drm/gem: Add a mountpoint parameter to drm_gem_object_init()
  drm/v3d: Introduce gemfs
  drm/gem: Create shmem GEM object in a given mountpoint
  drm/v3d: Enable super pages

 drivers/gpu/drm/armada/armada_gem.c           |  2 +-
 drivers/gpu/drm/drm_gem.c                     | 12 ++++-
 drivers/gpu/drm/drm_gem_dma_helper.c          |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 30 +++++++++--
 drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  2 +-
 drivers/gpu/drm/gma500/gem.c                  |  2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
 drivers/gpu/drm/tegra/gem.c                   |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  2 +-
 drivers/gpu/drm/v3d/Makefile                  |  3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  | 19 ++++++-
 drivers/gpu/drm/v3d/v3d_drv.c                 |  7 +++
 drivers/gpu/drm/v3d/v3d_drv.h                 | 15 +++++-
 drivers/gpu/drm/v3d/v3d_gem.c                 |  6 ++-
 drivers/gpu/drm/v3d/v3d_gemfs.c               | 52 +++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_mmu.c                 | 24 ++++++++-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
 include/drm/drm_gem.h                         |  3 +-
 include/drm/drm_gem_shmem_helper.h            |  3 ++
 28 files changed, 176 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c

--
2.43.0

