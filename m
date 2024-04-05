Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E4A89A590
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18F910E907;
	Fri,  5 Apr 2024 20:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="k9evZVwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC8710E913
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NjXX2rJWOlgE1dDt1ZLMYlnr/seu6nVLQn+fPgpzSZw=; b=k9evZVwe07dLWsBY3tylvW+viM
 ZMaD1aR8QUCpQgxGNnaqIr/wOVf0+PkmAKaATBBF+nd3vjCqCkP9lZwig6qlWn98eRG/VYYLtcLVm
 ylu6g1KrabDbC9/6VJPkwHr1X23NrzfVI38uw4Y+6Hi6l8ookvI2ZW/I92FfWgVwvoLRJQT+RximE
 WfgKcmlIlGAlIWgTQzComxg7AtuRXdnm8X6Aa37hlE3ZXNnRU7/sAAqN5/4iUWZhUGTmz6w38AI2i
 9+rF/cQpLIT9OH0a1C1W9+DAuTfiHcRALGrKVv23LJoBXJpDt1rtoSHLA3r1wvnf2NWkE8NxURj6z
 xvzde9wQ==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rsq11-001kwR-2t; Fri, 05 Apr 2024 22:18:23 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/6] drm/v3d: Enable Big and Super Pages
Date: Fri,  5 Apr 2024 15:29:03 -0300
Message-ID: <20240405201753.1176914-1-mcanal@igalia.com>
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

fps_avg  helped:  warzone2100.70secs.1024x768.trace:                    1.98 -> 2.42     (22.19%) (v1: 2.56)
fps_avg  helped:  warzone2100.30secs.1024x768.trace:                    2 -> 2.45        (21.96%) (v1: 2.39)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                    123.12 -> 128.39 (4.28%)  (v1: 125.50)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:  61.26 -> 62.89   (2.67%)  (v1: 61.36)
fps_avg  helped:  quake2-gles3-1280x720.trace:                          63.42 -> 64.86   (2.27%)  (v1: 64.29)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                          25.15 -> 25.63   (1.89%)  (v1: 24.94)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:           19.28 -> 19.61   (1.72%)  (v1: 19.02)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:  23.58 -> 23.91   (1.39%)  (v1: 23.34)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr: 61.40 -> 62.00   (0.96%)  (v1: -)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                    49.41 -> 49.84   (0.86%)  (v1: 47.74)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                   8.69 -> 8.74     (0.56%)  (v1: -)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                           17.55 -> 17.64   (0.50%)  (v1: -)
fps_avg  helped:  quake2-gl1.4-1280x720.trace:                          36.43 -> 36.58   (0.43%)  (v1: 36.57)
fps_avg  helped:  quake3e-1280x720.trace:                               94.49 -> 94.87   (0.40%)  (v1: -)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                           19.79 -> 19.87   (0.39%)  (v1: -)

Using a Raspberry Pi 5 (with a PAGE_SIZE=16KB downstream kernel), when running
traces from multiple applications, we were able to see the following
improvements:

fps_avg  helped:  warzone2100.30secs.1024x768.trace:                       4.40 -> 4.95     (12.58%) (v1: 4.49)
fps_avg  helped:  vkQuake_capture_frames_1_through_1200_1280x720.gfxr:     135.05 -> 141.21 (4.56%)  (v1: 139.45)
fps_avg  helped:  supertuxkart-menus_1024x768.trace:                       291.73 -> 302.05 (3.54%)  (v1: 303.80)
fps_avg  helped:  quake2-gles3-1280x720.trace:                             148.90 -> 153.57 (3.13%)  (v1: 156.13)
fps_avg  helped:  quake2-gl1.4-1280x720.trace:                             82.60 -> 84.46   (2.25%)  (v1: -)
fps_avg  helped:  ue4_shooter_game_shooting_low_quality_640x480.gfxr:      49.59 -> 50.54   (1.92%)  (v1: 47.30)
fps_avg  helped:  ue4_shooter_game_shooting_high_quality_640x480.gfxr:     51.03 -> 51.93   (1.76%)  (v1: 50.46)
fps_avg  helped:  ue4_shooter_game_high_quality_640x480.gfxr:              31.15 -> 31.64   (1.60%)  (v1: 31.05)
fps_avg  helped:  ue4_sun_temple_640x480.gfxr:                             40.26 -> 40.88   (1.54%)  (v1: 40.23)
fps_avg  helped:  sponza_demo01_800x600.gfxr:                              43.23 -> 43.84   (1.40%)  (v1: 43.68)
fps_avg  helped:  warzone2100.70secs.1024x768.trace:                       4.36 -> 4.42     (1.39%)  (v1: -)
fps_avg  helped:  sponza_demo02_800x600.gfxr:                              48.94 -> 49.51   (1.17%)  (v1: 49.34)
fps_avg  helped:  quake3e_capture_frames_1_through_1800_1920x1080.gfxr:    162.11 -> 163.13 (0.63%)  (v1: 165.71)
fps_avg  helped:  quake3e-1280x720.trace:                                  229.82 -> 231.00 (0.51%)  (v1: 234.51)
fps_avg  helped:  supertuxkart-racing_1024x768.trace:                      20.42 -> 20.48   (0.30%)  (v1: 20.59)
fps_avg  helped:  quake3e_capture_frames_1800_through_2400_1920x1080.gfxr: 157.45 -> 157.61 (0.10%)  (v1: 160.35)
fps_avg  helped:  serious_sam_trace02_1280x720.gfxr:                       59.99 -> 60.02   (0.05%)  (v1: -)

When glancing at the percentage improvement, one might initially perceive v2
as causing a performance downgrade. However, that assumption doesn't hold true.
In the case of v1, we were using downstream kernel version 6.1, whereas now,
with the kernel updated to 6.6 for v2, there's a small uptick in performance.
This indicates an enhancement in the baseline scenario, rather than any detriment
caused by v2. Additionally, I've included stats from v1 in the comparisons. Upon
scrutinizing the average FPS of v2 in contrast to v1, it becomes evident that v2
not only maintains the improvements but may even surpass them.

This version provides a much safer way to iterate through memory and doesn't
hold to the same limitations as v1. For example, v1 had a hard-coded hack that
only allowed a huge page to be created if the BO was bigger than 2MB. These
limitations are gone now.

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
* [5/6] Create a separate patch to reduce the alignment of the node
	allocation (Iago Toral)
* [6/6] Complete refactoring to the way that we iterate through the
	memory (Tvrtko Ursulin)
* [6/6] Don't use drm_prime_get_contiguous_size(), as it could give us
	misleading data (Tvrtko Ursulin)
* [6/6] Use both Big Pages (64K) and Super Pages (1MB)

Best Regards,
- Maíra

Maíra Canal (6):
  drm/v3d: Fix return if scheduler initialization fails
  drm/gem: Create a drm_gem_object_init_with_mnt() function
  drm/v3d: Introduce gemfs
  drm/gem: Create shmem GEM object in a given mountpoint
  drm/v3d: Reduce the alignment of the node allocation
  drm/v3d: Enable big and super pages

 drivers/gpu/drm/drm_gem.c              | 34 +++++++++++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 30 +++++++++++++--
 drivers/gpu/drm/v3d/Makefile           |  3 +-
 drivers/gpu/drm/v3d/v3d_bo.c           | 21 ++++++++++-
 drivers/gpu/drm/v3d/v3d_drv.c          |  8 ++++
 drivers/gpu/drm/v3d/v3d_drv.h          | 13 ++++++-
 drivers/gpu/drm/v3d/v3d_gem.c          |  6 ++-
 drivers/gpu/drm/v3d/v3d_gemfs.c        | 52 ++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_mmu.c          | 46 ++++++++++++++++++-----
 include/drm/drm_gem.h                  |  3 ++
 include/drm/drm_gem_shmem_helper.h     |  3 ++
 11 files changed, 195 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c

--
2.44.0

