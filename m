Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7E8AC148
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 23:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D96D10F0D2;
	Sun, 21 Apr 2024 21:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JY3fcx+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EEC10F0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 21:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=emgwsLPUEDxO5gGa089CYKcIeYgE47COgjSLvIsIvxI=; b=JY3fcx+LI9wwLkEa0df5dAJOO1
 W1pEm1UeYl5ygGCf68424SAn0NfWkM3A5TMpPZ1R4UUUNadOdaOJWvnSMhAgyC++V4tt5O1Jc0nlN
 QRy47yDVBCqqtDXN/UCD7xX/42Iovpch56x20wGERQQXDxyuQZdsC5n2ReqTiqk02lBIYvLvSgbxs
 eswVqQqIxCsu1Anxomyz9zITNGPFub+t/ERmodMafgkrjaD22cI35Z1Wffl2cUhmVMZhOcyOgc8wi
 UGXa7yNn8/H2KGw3eUJ8i56Tb340rqjlGJbyOHR+NRH+KcWATWbGmY3xDUDVKSFUVlRYlhUmbtrcL
 dX1zPFPg==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ryf7i-0072SJ-Nh; Sun, 21 Apr 2024 23:53:23 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 0/8] drm/v3d: Enable Big and Super Pages
Date: Sun, 21 Apr 2024 18:44:18 -0300
Message-ID: <20240421215309.660018-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
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

fps_avg  helped:  warzone2100.70secs.1024x768.trace:                    1.98 -> 2.42     (22.19%)
fps_avg  helped:  warzone2100.30secs.1024x768.trace:                    2 -> 2.45        (21.96%)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                    123.12 -> 128.39 (4.28%)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:  61.26 -> 62.89   (2.67%)
fps_avg  helped:  quake2-gles3-1280x720.trace:                          63.42 -> 64.86   (2.27%)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                          25.15 -> 25.63   (1.89%)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:           19.28 -> 19.61   (1.72%)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:  23.58 -> 23.91   (1.39%)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr: 61.40 -> 62.00   (0.96%)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                    49.41 -> 49.84   (0.86%)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                   8.69 -> 8.74     (0.56%)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                           17.55 -> 17.64   (0.50%)
fps_avg  helped:  quake2-gl1.4-1280x720.trace:                          36.43 -> 36.58   (0.43%)
fps_avg  helped:  quake3e-1280x720.trace:                               94.49 -> 94.87   (0.40%)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                           19.79 -> 19.87   (0.39%)

Using a Raspberry Pi 5 (with a PAGE_SIZE=16KB downstream kernel), when running
traces from multiple applications, we were able to see the following
improvements:

fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       4.40 -> 4.95     (12.58%)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     135.05 -> 141.21 (4.56%)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       291.73 -> 302.05 (3.54%)
fps_avg  helped:  quake2-gles3-1280x720.trace:                             148.90 -> 153.57 (3.13%)
fps_avg  helped:  quake2-gl1.4-1280x720.trace:                             82.60 -> 84.46   (2.25%)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      49.59 -> 50.54   (1.92%)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     51.03 -> 51.93   (1.76%)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              31.15 -> 31.64   (1.60%)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             40.26 -> 40.88   (1.54%)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                              43.23 -> 43.84   (1.40%)
fps_avg  helped:  warzone2100.70secs.1024x768.trace:                       4.36 -> 4.42     (1.39%)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                              48.94 -> 49.51   (1.17%)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr:    162.11 -> 163.13 (0.63%)
fps_avg  helped:  quake3e-1280x720.trace:                                  229.82 -> 231.00 (0.51%)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      20.42 -> 20.48   (0.30%)
fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 157.45 -> 157.61 (0.10%)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       59.99 -> 60.02   (0.05%)

This series also introduces changes in the GEM helpers, in order to enable V3D
to have a separate mount point for shmfs GEM objects. Any feedback from the
community about the changes in the GEM helpers is welcomed!

v1 -> v2: https://lore.kernel.org/dri-devel/20240311100959.205545-1-mcanal@igalia.com/

* [1/6] Add Iago's R-b to PATCH 1/5 (Iago Toral)
* [2/6] Create a new function `drm_gem_object_init_with_mnt()` to define the
        shmfs mountpoint. Now, we don't touch a bunch of drivers, as
				`drm_gem_object_init()` preserves its signature. (Tvrtko Ursulin)
* [3/6] Use `huge=within_size` instead of `huge=always`, in order to avoid OOM.
        This also allow us to move away from the 2MB hack. (Tvrtko Ursulin)
* [3/6] Add Iago's R-b to PATCH 3/5 (Iago Toral)
* [5/6] Create a separate patch to reduce the alignment of the node allocation.
        (Iago Toral)
* [6/6] Complete refactoring to the way that we iterate through the memory.
        (Tvrtko Ursulin)
* [6/6] Don't use drm_prime_get_contiguous_size(), as it could give us
        misleading data. (Tvrtko Ursulin)
* [6/6] Use both Big Pages (64K) and Super Pages (1MB).

v2 -> v3: https://lore.kernel.org/dri-devel/20240405201753.1176914-1-mcanal@igalia.com/T/

* [2/8] Add Tvrtko's R-b to PATCH 2/8 (Tvrtko Ursulin)
* [4/8] Add Tvrtko's R-b to PATCH 4/8 (Tvrtko Ursulin)
* [6/8] Now, PATCH 6/8 only adds support to big/super pages when writing out
        PTEs. BO creation with THP and addition of modparam are moved to
				other patches. (Tvrtko Ursulin)
* [6/8] s/page_address/pfn (Tvrtko Ursulin)
* [6/8] As `sg_dma_len()` returns `unsigned int`, then `len` must be
        `unsigned int` too. (Tvrtko Ursulin)
* [6/8] `i` and `page_size` are `unsigned int` as well. (Tvrtko Ursulin)
* [6/8] Move `i`, `page_prot` and `page_size` to the inner scope. (Tvrtko Ursulin)
* [6/8] s/pte/page_address/ (Tvrtko Ursulin)
* [7/8] New patch: Use gemfs/THP in BO creation if available (Tvrtko Ursulin)
* [8/8] New patch: Add modparam for turning off Big/Super Pages (Tvrtko Ursulin)
* [8/8] Don't expose the modparam `super_pages` unless CONFIG_TRANSPARENT_HUGEPAGE
        is enabled. (Tvrtko Ursulin)
* [8/8] Use `v3d->gemfs` to check if the user disabled Super Pages support.
        (Tvrtko Ursulin)

Best Regards,
- Maíra

Maíra Canal (8):
  drm/v3d: Fix return if scheduler initialization fails
  drm/gem: Create a drm_gem_object_init_with_mnt() function
  drm/v3d: Introduce gemfs
  drm/gem: Create shmem GEM object in a given mountpoint
  drm/v3d: Reduce the alignment of the node allocation
  drm/v3d: Support Big/Super Pages when writing out PTEs
  drm/v3d: Use gemfs/THP in BO creation if available
  drm/v3d: Add modparam for turning off Big/Super Pages

 drivers/gpu/drm/drm_gem.c              | 34 +++++++++++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 30 +++++++++++++--
 drivers/gpu/drm/v3d/Makefile           |  3 +-
 drivers/gpu/drm/v3d/v3d_bo.c           | 21 ++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.c          |  8 ++++
 drivers/gpu/drm/v3d/v3d_drv.h          | 12 +++++-
 drivers/gpu/drm/v3d/v3d_gem.c          |  6 ++-
 drivers/gpu/drm/v3d/v3d_gemfs.c        | 51 +++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_mmu.c          | 52 +++++++++++++++++++-------
 include/drm/drm_gem.h                  |  3 ++
 include/drm/drm_gem_shmem_helper.h     |  3 ++
 11 files changed, 196 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c

-- 
2.44.0

