Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060C570B88
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D622F90FA9;
	Mon, 11 Jul 2022 20:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D1411BE75;
 Mon, 11 Jul 2022 20:25:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA59F61604;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E88C385A2;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=C84LTeMv1GsveffvvN1df93tCCsgdFBzCTBnrEybj3o=;
 h=From:To:Cc:Subject:Date:From;
 b=EITthsjBCeFT1+8Y5CrvMeHdxTzOXltiVE4N+agy1lhf2lp046BO8uL8AS5Dx4jfL
 hr1XDRRkI4SDm66QdWUhpFap2TjEjnEeOsqufJksmtDxVEi5sD2jYk1BRkoAX+UMj5
 fICg5KTvV5e2X0zzn2OctYi6DU2G6zOEHXt+KvbiVh+uc3dyQ8KpHwaCkGbS/Mj7nR
 4IPcK9WJ2SOD9FGyUhVwEAKBIzUdB+b/hranRIpSEY5cyui/DTjq/cvAUDDX7Q+Jjx
 wqZDOT2RUqg8FM+6Ziu4cRx7cmXXWj/vF4etu/U0WuBIjlq2EYnakFchpT4qCpbTpB
 IakVN00Hy79NA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e7R-8d;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 00/32] drm/i915: fix kernel-doc issues
Date: Mon, 11 Jul 2022 21:24:45 +0100
Message-Id: <cover.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several kernel-doc markups along the i915 driver that aren't part
of the i915.rst file, nor are included on any other file under Documentation.
Maybe due to that, there are several kernel-doc markups that report problems
when checked with scripts/kernel-doc. More than that, some of them also
have problems when actually integrated at the building system, as reported
by Sphinx.

Along the issues we have:

- renamed symbols where the prototype doesn't match the kernel-doc name;
- some markups doesn't have the symbol name on it;
- typos when defining parameter;
- some parameters are missing;
- some ascii artwork aren't properly displayed after parsed by Sphinx;
- some other tags produce bad results and warnings after parsed by html build;
- some "/**" patterns exist on places that aren't kernel-doc markups.

This series, against drm-tip, fix all the above issues and all all such files to
i915.rst. This way, it will be easier to avoid other problems to be introduced.

While here, I also added SPDX on two display files. Besides being the current
way to indicate the license, it also makes easier to find all files with kernel-doc
markups, as all it is needed is to search for "/**" at i915 files to know what of
them have embedded documentation.

Mauro Carvalho Chehab (32):
  drm/i915: fix kernel-doc trivial warnings on i915/*.[ch] files
  drm/i915: display: fix kernel-doc markup warnings
  drm/i915: gt: fix some Kernel-doc issues
  drm/i915: gvt: fix kernel-doc trivial warnings
  drm/i915: gem: fix some Kernel-doc issues
  drm/i915: intel_wakeref.h: fix some kernel-doc markups
  drm/i915: i915_gem_ttm: fix a kernel-doc markup
  drm/i915: i915_gem_ttm_pm.c: fix kernel-doc markups
  drm/i915: gem: add missing trivial function parameters
  drm/i915: i915_gpu_error.c: document dump_flags
  drm/i915: document kernel-doc trivial issues
  drm/i915: intel_dp_link_training.c: fix kernel-doc markup
  drm/i915: intel_fb: fix a kernel-doc issue with Sphinx
  drm/i915: skl_scaler: fix return value kernel-doc markup
  drm/i915: intel_pm.c: fix some ascii artwork at kernel-doc
  drm/i915: i915_gem_region.h: fix i915_gem_apply_to_region_ops doc
  drm/i915: i915_gem_wait.c: fix a kernel-doc markup
  drm/i915: fix i915_gem_ttm_move.c DOC: markup
  drm/i915: stop using kernel-doc markups for something else
  drm/i915: dvo_ch7xxx.c: use SPDX header
  drm/i915: dvo_sil164.c: use SPDX header
  drm/i915: i915_vma_resource.c: fix some kernel-doc markups
  drm/i915: i915_gem.c fix a kernel-doc issue
  drm/i915: i915_scatterlist.h: fix some kernel-doc markups
  drm/i915: i915_deps: use a shorter title markup
  docs: gpu: i915.rst: display: add kernel-doc markups
  docs: gpu: i915.rst: gt: add more kernel-doc markups
  docs: gpu: i915.rst: GuC: add more kernel-doc markups
  docs: gpu: i915.rst: GVT: add more kernel-doc markups
  docs: gpu: i915.rst: PM: add more kernel-doc markups
  docs: gpu: i915.rst: GEM/TTM: add more kernel-doc markups
  docs: gpu: i915.rst: add the remaining kernel-doc markup files

 Documentation/gpu/i915.rst                    | 283 ++++++++++++++++++
 drivers/gpu/drm/i915/display/dvo_ch7017.c     |  26 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c     |  39 +--
 drivers/gpu/drm/i915/display/dvo_sil164.c     |  32 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 .../drm/i915/display/intel_display_power.c    |   2 +-
 .../drm/i915/display/intel_display_types.h    |   2 +-
 .../drm/i915/display/intel_dp_link_training.c |   2 +
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |   6 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   4 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_tv.c       |   2 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  26 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   6 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  63 ++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h  |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  12 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   6 +-
 drivers/gpu/drm/i915/gt/intel_reset_types.h   |   4 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
 .../gpu/drm/i915/gt/intel_timeline_types.h    |   6 +-
 .../drm/i915/gt/shaders/clear_kernel/hsw.asm  |   4 +-
 .../drm/i915/gt/shaders/clear_kernel/ivb.asm  |   4 +-
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |  24 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   |   5 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |   4 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          |   2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h             |   2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |   2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   2 +-
 drivers/gpu/drm/i915/gvt/page_track.c         |   2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c               |   6 +-
 drivers/gpu/drm/i915/i915_active.h            |  14 +-
 drivers/gpu/drm/i915/i915_deps.c              |   4 +-
 drivers/gpu/drm/i915/i915_drm_client.h        |   2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  30 +-
 drivers/gpu/drm/i915/i915_file_private.h      |   8 +-
 drivers/gpu/drm/i915/i915_gem.c               |  12 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   3 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   4 +-
 drivers/gpu/drm/i915/i915_pmu.h               |  38 +--
 drivers/gpu/drm/i915/i915_request.h           |   4 +-
 drivers/gpu/drm/i915/i915_scatterlist.c       |   2 +-
 drivers/gpu/drm/i915/i915_scatterlist.h       |  12 +-
 drivers/gpu/drm/i915/i915_utils.h             |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |   2 +
 drivers/gpu/drm/i915/i915_vma_resource.c      |   4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      |   3 +-
 drivers/gpu/drm/i915/intel_pm.c               |  33 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |   3 +-
 drivers/gpu/drm/i915/intel_uncore.h           |   4 +-
 drivers/gpu/drm/i915/intel_wakeref.h          |   4 +-
 66 files changed, 561 insertions(+), 282 deletions(-)

-- 
2.36.1


