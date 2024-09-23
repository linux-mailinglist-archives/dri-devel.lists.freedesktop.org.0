Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE197ECDA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D38910E408;
	Mon, 23 Sep 2024 14:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IToD73ZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577C610E401
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JbHpbH4ikPKmtCLLt3QdKtKYQhnZVe16YGdw1f7YcnQ=; b=IToD73ZEp2kKrR5V9UE/zow49d
 1SFnCy7OS9aBwCd1Gycb4TvtDvnnZ3lj96AJHqndNnkn/MVqoxSX+qSIi4TUuahqnCK/Lz6TXVYhe
 n8fmUjo1HpCCMxGzqYzQLWFRgiE9kuWLctlxYwax1XcTWauEpBSZN92fAsnzMv4MT63AnQp6ds5ky
 r8jzjcU7D83F2xuod9PLLLOZOLzCLQKV+Rvoba+vZ0FLGYH+arJA6eoD5Un+5ofveQ3k0mtlmNR+l
 9xE81jkGw2VwFEqMy8zvu7V9joznpN66AC8mXxEocto1R8Ql6lHxshTU/e/J+eZjwVI+bnYKO7tM0
 cASF+9hQ==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssjpO-00HYyM-IT; Mon, 23 Sep 2024 16:14:15 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v6 00/11] drm/v3d: Enable Big and Super Pages
Date: Mon, 23 Sep 2024 10:55:04 -0300
Message-ID: <20240923141348.2422499-1-mcanal@igalia.com>
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

fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       56.39 -> 61.10 (8.36%)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      20.71 -> 21.47 (3.65%)
fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 60.88 -> 62.50 (2.67%)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       112.62 -> 115.61 (2.65%)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     20.45 -> 20.88 (2.10%)
fps_avg  helped:  quake2-gles3-1280x720.trace:                             59.76 -> 60.84 (1.82%)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             27.60 -> 28.03 (1.54%)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     54.59 -> 55.30 (1.29%)
fps_avg  helped:  ue4_shooter_game_low_quality_640x480.gfxr:               32.75 -> 33.08 (1.00%)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                              20.90 -> 21.03 (0.61%)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      8.58 -> 8.63 (0.60%)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              19.62 -> 19.74 (0.59%)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       44.00 -> 44.21 (0.50%)
fps_avg  helped:  ue4_vehicle_game-2_640x480.gfxr:                         12.59 -> 12.65 (0.49%)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                              21.42 -> 21.46 (0.19%)
fps_avg  helped:  quake3e-1280x720.trace:                                  84.45 -> 84.52 (0.09%)

total fps_avg in all runs: 845.43 -> 857.29 (1.40%)

Using a Raspberry Pi 5 (with a PAGE_SIZE=16KB downstream kernel), when running
traces from multiple applications, we were able to see the following
improvements:

fps_avg  helped:  quake2-gles3-1280x720.trace:                             151.77 -> 157.26 (3.62%)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       306.79 -> 313.88 (2.31%)
fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       140.92 -> 144.03 (2.21%)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     131.45 -> 134.20 (2.10%)
fps_avg  helped:  ue4_vehicle_game-2_640x480.gfxr:                         24.42 -> 24.88 (1.89%)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              32.12 -> 32.53 (1.29%)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             42.05 -> 42.55 (1.20%)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     52.77 -> 53.31 (1.04%)
fps_avg  helped:  quake3e-1280x720.trace:                                  238.31 -> 240.53 (0.93%)
fps_avg  helped:  warzone2100.70secs.1024x768.trace:                       151.09 -> 151.81 (0.48%)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                              50.81 -> 51.05 (0.46%)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      20.91 -> 20.98 (0.33%)
fps_avg  helped:  ue4_shooter_game_low_quality_640x480.gfxr:               59.68 -> 59.86 (0.29%)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr:    167.70 -> 168.17 (0.29%)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      53.40 -> 53.51 (0.22%)
fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 163.37 -> 163.64 (0.17%)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       60.00 -> 60.03 (0.06%)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                              45.04 -> 45.04 (<.01%)

total fps_avg in all runs: 1892.60 -> 1917.26 (1.30%)

We also could attest to some improvement when running CTS and Piglit tests on
Mesa CI. For example, the job v3dv-rpi5-vk-full:arm64 usually takes around 100
minutes to run. After running Super Pages kernels on Mesa CI several times, we
can see that this job duration reduces to 90 minutes [1]. Another example is the
job v3dv-rpi4-vk-full:arm64 */6, which has its duration reduced from 44 minutes
to around 42 minutes [1].

This time, the benchmark results were obtained using
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE instead of CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS.
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y can sometimes hurt the overall performance
of embedded systems. As mentioned by [2], "Embedded systems should enable
hugepages only inside madvise regions to eliminate any risk of wasting any
precious byte of memory and to only run faster." 

We were able to attest through benchmarks that CONFIG_TRANSPARENT_HUGEPAGE_MADVISE
improves the overall performance of 3D applications (using Super Pages) when
compared to CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS.

This version didn't add any new features to the series. It only addresses
comments from the reviewers. That said, I added one more patch to expose
the Super Pages capability to user-space through V3D parameters.

This series also introduces changes in the GEM helpers, in order to enable V3D
to have a separate mount point for shmfs GEM objects. Any feedback from the
community about the changes in the GEM helpers is welcomed!

[1] https://gitlab.freedesktop.org/mairacanal/mesa/-/pipelines/1276368/
[2] https://docs.kernel.org/admin-guide/mm/transhuge.html

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
* [6/6] Don't use `drm_prime_get_contiguous_size()`, as it could give us
        misleading data (Tvrtko Ursulin)
* [6/6] Use both Big Pages (64K) and Super Pages (1MB)

v2 -> v3: https://lore.kernel.org/dri-devel/20240405201753.1176914-1-mcanal@igalia.com/T/

* [2/8] Add Tvrtko's R-b to PATCH 2/8 (Tvrtko Ursulin)
* [4/8] Add Tvrtko's R-b to PATCH 4/8 (Tvrtko Ursulin)
* [6/8] Now, PATCH 6/8 regards supporting big/super pages when writing out PTEs
        (Tvrtko Ursulin)
* [6/8] s/page_address/pfn (Tvrtko Ursulin)
* [6/8] As `sg_dma_len()` returns `unsigned int`, then `len` must be `unsigned
        int` too (Tvrtko Ursulin)
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
* [10/10] Add Tvrtko's R-b to PATCH 10/10 (Tvrtko Ursulin)

v5 -> v6: https://lore.kernel.org/dri-devel/20240829130954.2439316-1-mcanal@igalia.com/T/

* [1/11] Improve commit message by describing the change that we are now waiting
         for each flush to complete before starting the other flush (Iago Toral)
* [1/11] Change error message to "MMU TLB clear wait idle failed" (Iago Toral)
* [2/11] Add Iago's R-b to PATCH 2/11 (Iago Toral)
* [11/11] New patch: Expose Super Pages capability

Best Regards,
- Maíra

Maíra Canal (11):
  drm/v3d: Address race-condition in MMU flush
  drm/v3d: Flush the MMU before we supply more memory to the binner
  drm/v3d: Fix return if scheduler initialization fails
  drm/gem: Create a drm_gem_object_init_with_mnt() function
  drm/v3d: Introduce gemfs
  drm/gem: Create shmem GEM object in a given mountpoint
  drm/v3d: Reduce the alignment of the node allocation
  drm/v3d: Support Big/Super Pages when writing out PTEs
  drm/v3d: Use gemfs/THP in BO creation if available
  drm/v3d: Add modparam for turning off Big/Super Pages
  drm/v3d: Expose Super Pages capability

 drivers/gpu/drm/drm_gem.c              | 34 +++++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 30 +++++++--
 drivers/gpu/drm/v3d/Makefile           |  3 +-
 drivers/gpu/drm/v3d/v3d_bo.c           | 21 ++++++-
 drivers/gpu/drm/v3d/v3d_drv.c          | 10 +++
 drivers/gpu/drm/v3d/v3d_drv.h          | 14 ++++-
 drivers/gpu/drm/v3d/v3d_gem.c          |  6 +-
 drivers/gpu/drm/v3d/v3d_gemfs.c        | 50 +++++++++++++++
 drivers/gpu/drm/v3d/v3d_irq.c          |  2 +
 drivers/gpu/drm/v3d/v3d_mmu.c          | 85 ++++++++++++++++----------
 include/drm/drm_gem.h                  |  3 +
 include/drm/drm_gem_shmem_helper.h     |  3 +
 include/uapi/drm/v3d_drm.h             |  1 +
 13 files changed, 215 insertions(+), 47 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c

-- 
2.46.0

