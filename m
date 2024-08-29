Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D09645DC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDB410E05D;
	Thu, 29 Aug 2024 13:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DxgHCsqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302AD10E672
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nWqWLtmTkixJLcQE0UjLM9UoMBSfs9/CMbo/IuTMK1c=; b=DxgHCsqv51nvtLhVdE0tT6H2Zl
 Ik7EbOlL0k/mwrAXzr9Q07wA/qWl87wPTyKpkBoBisNOUuKGeh1oysFVOAJ5fGpUA+c+CS4QkiLF0
 o+rKrjDqO7x53xNM32F9FD4k9MQKbJY7qazF1bCzKHiqDymBHvBMku2QkebDUH/nSG1k0F/RyhmJm
 dPGqcsCqVHrq5plcBHocYWk13o14fIpgpgkM13waiP1Tu9RsByRyXkOZsrtyMWQ05vBlvyugDT7uZ
 5vMqbJf7nd52PueiOX3rliShp4YT419FpGJKwd8WkIrK3F2SgDdDDd1+slI8InZoqRYZNOJsx9PmU
 u06CjZXg==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sjev1-006jlG-OR; Thu, 29 Aug 2024 15:10:31 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 00/10] drm/v3d: Enable Big and Super Pages
Date: Thu, 29 Aug 2024 10:05:08 -0300
Message-ID: <20240829130954.2439316-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
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

This series introduces support for big and super pages in V3D. The V3D MMU has
support for 64KB and 1MB pages, called big pages and super pages, which are
currently not used. Therefore, this patchset has the intention to enable big and
super pages in V3D. The advantage of enabling big and super pages is that if any
entry for a page within a big/super page is cached in the MMU, it will be used
for the translation of all virtual addresses in the range of that super page
without requiring fetching any other entries.

Big/Super pages essentially mean a slightly better performance for users,
especially in applications with high memory requirements (e.g. applications
that use multiple large BOs).

Using a Raspberry Pi 4 (with a PAGE_SIZE=4KB downstream kernel), when running
traces from multiple applications, we were able to see the following
improvements:

fps_avg  helped:  warzone2100.70secs.1024x768.trace:                       2.02 -> 2.55     (25.93%) (v1: 2.56)
fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       2.05 -> 2.58     (25.84%) (v1: 2.39)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       122.91 -> 126.97 (3.31%)  (v1: 125.50)
fps_avg  helped:  quake2-gles3-1280x720.trace:                             63.17 -> 64.90   (2.75%)  (v1: 64.29)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             25.04 -> 25.51   (1.87%)  (v1: 24.94)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     23.54 -> 23.86   (1.39%)  (v1: 23.34)
fps_avg  helped:  quake2-gl1.4-1280x720.trace:                             36.34 -> 36.81   (1.29%)  (v1: 36.57)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              19.25 -> 19.47   (1.16%)  (v1: 19.02)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      27.23 -> 27.48   (0.94%)  (v1: 26.75)
fps_avg  helped:  quake3e-1280x720.trace:                                  94.39 -> 95.18   (0.84%)  (v1: -)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                              20.07 -> 20.21   (0.69%)  (v1: -)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                              17.81 -> 17.91   (0.53%)  (v1: -)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr:    60.97 -> 61.29   (0.52%)  (v1: -)
fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 62.08 -> 62.19   (0.18%)  (v1: -)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       45.49 -> 45.53   (0.09%)  (v1: 47.74)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      8.70 -> 8.70     (0.06%)  (v1: -)

Using a Raspberry Pi 5 (with a PAGE_SIZE=16KB downstream kernel), when running
traces from multiple applications, we were able to see the following
improvements:

fps_avg  helped:  warzone2100.70secs.1024x768.trace:                       4.49 -> 5.14     (14.48%) (v1: -)
fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       4.42 -> 4.77     (7.80%)  (v1: 4.49)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     53.43 -> 54.53   (2.05%)  (v1: 50.46)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      54.55 -> 55.43   (1.62%)  (v1: 47.30)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              32.57 -> 33.09   (1.58%)  (v1: 31.05)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     113.45 -> 115.12 (1.47%)  (v1: 139.45)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             42.24 -> 42.84   (1.43%)  (v1: 40.23)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                              44.87 -> 45.45   (1.31%)  (v1: 43.68)
fps_avg  helped:  gl-117-1024x768.trace:                                   34.21 -> 34.61   (1.18%)  (v1: 33.85)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                              50.72 -> 51.22   (0.99%)  (v1: 49.34)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr:    167.18 -> 168.20 (0.61%)  (v1: 165.71)
fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 162.24 -> 163.02 (0.48%)  (v1: 160.35)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       302.24 -> 303.08 (0.28%)  (v1: 303.80)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      20.84 -> 20.88   (0.20%)  (v1: 20.59)
fps_avg  helped:  quake2-gl1.4-1280x720.trace:                             83.72 -> 83.86   (0.17%)  (v1: -)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       59.78 -> 59.85   (0.11%)  (v1: -)
fps_avg  helped:  quake2-gles3-1280x720.trace:                             154.73 -> 154.85 (0.08%)  (v1: 156.13)
fps_avg  helped:  rbdoom-3-bfg_640x480.gfxr:                               37.38 -> 37.40   (0.05%)  (v1: 32.30)
fps_avg  helped:  quake3e-1280x720.trace:                                  236.56 -> 236.60 (0.02%)  (v1: 234.51)

v5 has the introduction of two new patches: 1/10 and 2/10. Those patches have the
intention to address MMU flush issues that were exposed when the VA alignment was
reduced to 4 KB. We identified the issues when running Piglit tests concurrently
on the RPi 4. The two patches aim to fix the current TLB and MMU cache inconsistencies 
that we have in the driver.

This series also introduces changes in the GEM helpers, in order to enable V3D
to have a separate mount point for shmfs GEM objects. Any feedback from the
community about the changes in the GEM helpers is welcomed!

v1 -> v2: https://lore.kernel.org/dri-devel/20240311100959.205545-1-mcanal@igalia.com/

* [1/6] Add Iago's R-b to PATCH 1/5 (Iago Toral)
* [2/6] Create a new function `drm_gem_object_init_with_mnt()` to define the
        shmfs mountpoint. Now, we don't touch a bunch of drivers, as
				`drm_gem_object_init()` preserves its signature (Tvrtko Ursulin)
* [3/6] Use `huge=within_size` instead of `huge=always`, in order to avoid OOM.
        This also allow us to move away from the 2MB hack. (Tvrtko Ursulin)
* [3/6] Add Iago's R-b to PATCH 3/5 (Iago Toral)
* [5/6] Create a separate patch to reduce the alignment of the node allocation
        (Iago Toral)
* [6/6] Complete refactoring to the way that we iterate through the memory
        (Tvrtko Ursulin)
* [6/6] Don't use drm_prime_get_contiguous_size(), as it could give us misleading
        data (Tvrtko Ursulin)
* [6/6] Use both Big Pages (64K) and Super Pages (1MB)

v2 -> v3: https://lore.kernel.org/dri-devel/20240405201753.1176914-1-mcanal@igalia.com/T/

* [2/8] Add Tvrtko's R-b to PATCH 2/8 (Tvrtko Ursulin)
* [4/8] Add Tvrtko's R-b to PATCH 4/8 (Tvrtko Ursulin)
* [6/8] Now, PATCH 6/8 regards supporting big/super pages when writing out PTEs
        (Tvrtko Ursulin)
* [6/8] s/page_address/pfn (Tvrtko Ursulin)
* [6/8] As `sg_dma_len()` returns `unsigned int`, then `len` must be `unsigned int`
        too (Tvrtko Ursulin)
* [6/8] `i` and `page_size` are `unsigned int` as well (Tvrtko Ursulin)
* [6/8] Move `i`, `page_prot` and `page_size` to the inner scope (Tvrtko Ursulin)
* [6/8] s/pte/page_address/ (Tvrtko Ursulin)
* [7/8] New patch: Use gemfs/THP in BO creation if available
* [8/8] New patch: Add modparam for turning off Big/Super Pages
* [8/8] Don't expose the modparam `super_pages` unless CONFIG_TRANSPARENT_HUGEPAGE
        is enabled (Tvrtko Ursulin)
* [8/8] Use `v3d->gemfs` to check if the user disabled Super Pages support
        (Tvrtko Ursulin)

v3 -> v4: https://lore.kernel.org/dri-devel/20240421215309.660018-1-mcanal@igalia.com/T/

* [5/8] Add Iago's R-b to PATCH 5/8 (Iago Toral)
* [6/8] Add Tvrtko's R-b to PATCH 6/8 (Tvrtko Ursulin)
* [7/8] Add Tvrtko's R-b to PATCH 7/8 (Tvrtko Ursulin)
* [8/8] Move `bool super_pages` to the guard (Tvrtko Ursulin)

v4 -> v5: https://lore.kernel.org/dri-devel/20240428124426.309096-1-mcanal@igalia.com/T/

* [1/10] New patch: Fix the MMU flush order
* [2/10] New patch: Flush the MMU before we supply more memory to the binner
* [10/10] Move `extern bool super_pages` to v3d_drv.h
* [10/10] Add Tvrtko's R-b to PATCH 10/10 (Tvrtko Ursulin)

Best Regards,
- Maíra

Maíra Canal (10):
  drm/v3d: Fix the MMU flush order
  drm/v3d: Flush the MMU before we supply more memory to the binner
  drm/v3d: Fix return if scheduler initialization fails
  drm/gem: Create a drm_gem_object_init_with_mnt() function
  drm/v3d: Introduce gemfs
  drm/gem: Create shmem GEM object in a given mountpoint
  drm/v3d: Reduce the alignment of the node allocation
  drm/v3d: Support Big/Super Pages when writing out PTEs
  drm/v3d: Use gemfs/THP in BO creation if available
  drm/v3d: Add modparam for turning off Big/Super Pages

 drivers/gpu/drm/drm_gem.c              | 34 +++++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 30 +++++++--
 drivers/gpu/drm/v3d/Makefile           |  3 +-
 drivers/gpu/drm/v3d/v3d_bo.c           | 21 ++++++-
 drivers/gpu/drm/v3d/v3d_drv.c          |  7 +++
 drivers/gpu/drm/v3d/v3d_drv.h          | 14 ++++-
 drivers/gpu/drm/v3d/v3d_gem.c          |  6 +-
 drivers/gpu/drm/v3d/v3d_gemfs.c        | 50 +++++++++++++++
 drivers/gpu/drm/v3d/v3d_irq.c          |  2 +
 drivers/gpu/drm/v3d/v3d_mmu.c          | 85 ++++++++++++++++----------
 include/drm/drm_gem.h                  |  3 +
 include/drm/drm_gem_shmem_helper.h     |  3 +
 12 files changed, 211 insertions(+), 47 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c

-- 
2.46.0

