Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FD15B3005
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4FE10EC0D;
	Fri,  9 Sep 2022 07:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903CE10EBEA;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03F7661EDD;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72E9C433D6;
 Fri,  9 Sep 2022 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708893;
 bh=LO1q9PXt1LPU8ZYul1ZA2HViOhmbcId7c05/mP4h0Ys=;
 h=From:To:Cc:Subject:Date:From;
 b=KWVOVKlF3jUS0SvDd7DTWPM0+/rl08mOO3SwB1VIgFHJz83GfYC71j4P6skDsl1oe
 AAGcZDsUmdzyrTA2nC479IgtknRfU3rB88Uie3ET9AU53c3eQz6OCFgA08iZucQkMl
 xUrHPYpOBuUQhixkPFTvoE1tG+cGL3X2O9TDtUO1D+0r29Os/QNa2FVxTsF+Rw8/V7
 f2fvcFkOvKI3wb7Ta6c7C1WA7q+gksTR/6lK9ZFqYgYOXo46Ok7PyTxFmz10reZ9Ub
 E7Rxg0X59gj4reUogVeO3fEkfwPiEWRcxlgnU2kk3X8A95UdpV17bOG/RSOZ3qOOPG
 Zjxsa2idI7ydg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXF-007FFc-Ho;
 Fri, 09 Sep 2022 09:34:45 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 00/37] drm/i915: fix kernel-doc issues
Date: Fri,  9 Sep 2022 09:34:07 +0200
Message-Id: <cover.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org
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

PS.: my end goal here is to ensure that the TLB patch series I'm about to
send will be properly documented. For that to happen, let's first fix all
warnings when building the documentation ;-)

---

v3:
- Dropped patches with issues already fixed;
- Addressed Rodrigo's comments.

v2:
- Added 3 already-existing patches form other PRs addressing some of the
  issues. The subjects were renamed, in order to describe what they're
  doing.
- Fixed checkpatch warnings;
- Added 4 additional patches at the end, documenting some structs
  at i915_gem_object_types.h and  intel_gt_pm.h, plus adding 
  intel-guc.c internal functions to the generated documentation.

Mauro Carvalho Chehab (37):
  drm/i915: fix kernel-doc trivial warnings on i915/*.[ch] files
  drm/i915: display: fix kernel-doc markup warnings
  drm/i915: gt: fix some Kernel-doc issues
  drm/i915: gvt: fix kernel-doc trivial warnings
  drm/i915: gem: fix some Kernel-doc issues
  drm/i915: intel_wakeref.h: fix some kernel-doc markups
  drm/i915: i915_gem_ttm: fix a kernel-doc markup
  drm/i915: i915_gem_ttm_pm.c: fix kernel-doc markups
  drm/i915: gem: add kernel-doc description for some function parameters
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
  drm/i915 i915_gem_object_types.h: document struct i915_lut_handle
  drm/i915: document struct drm_i915_gem_object
  drm/i915: add descriptions for some RPM macros at intel_gt_pm.h
  drm/i915: add GuC functions to the documentation
  drm/i915: be consistent with kernel-doc function declaration

 Documentation/gpu/i915.rst                    | 283 +++++++++++++++++-
 drivers/gpu/drm/i915/display/dvo_ch7017.c     |  26 +-
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c     |  39 +--
 drivers/gpu/drm/i915/display/dvo_sil164.c     |  32 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |   4 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 .../drm/i915/display/intel_display_power.c    |   2 +-
 .../drm/i915/display/intel_display_types.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  10 +-
 .../drm/i915/display/intel_dp_link_training.c |   2 +
 drivers/gpu/drm/i915/display/intel_dsb.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |   6 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |   2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   8 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   4 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_tv.c       |   2 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 212 ++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  26 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   6 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  69 +++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  14 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h  |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  51 ++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  12 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   6 +-
 drivers/gpu/drm/i915/gt/intel_reset_types.h   |   4 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
 .../gpu/drm/i915/gt/intel_timeline_types.h    |   6 +-
 .../drm/i915/gt/shaders/clear_kernel/hsw.asm  |   4 +-
 .../drm/i915/gt/shaders/clear_kernel/ivb.asm  |   4 +-
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |  24 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          |   2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h             |   2 +-
 drivers/gpu/drm/i915/gvt/page_track.c         |   2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c               |   6 +-
 drivers/gpu/drm/i915/i915_active.h            |  14 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c        |   8 +-
 drivers/gpu/drm/i915/i915_deps.c              |   4 +-
 drivers/gpu/drm/i915/i915_drm_client.h        |   2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  24 +-
 drivers/gpu/drm/i915/i915_file_private.h      |   8 +-
 drivers/gpu/drm/i915/i915_gem.c               |  12 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   3 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   4 +-
 drivers/gpu/drm/i915/i915_pmu.h               |  38 +--
 drivers/gpu/drm/i915/i915_reg_defs.h          |  12 +-
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
 drivers/gpu/drm/i915/intel_wopcm.c            |   4 +-
 82 files changed, 826 insertions(+), 378 deletions(-)

-- 
2.37.3


