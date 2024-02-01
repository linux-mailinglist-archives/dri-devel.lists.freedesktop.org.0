Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D447845653
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 12:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344810EBD7;
	Thu,  1 Feb 2024 11:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UU+RmAmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE08210EBD2;
 Thu,  1 Feb 2024 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706787444; x=1738323444;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=9TCocgBHoBO3W89Cixz7zeF8KJyVDnoPHhhK220cqS4=;
 b=UU+RmAmDEcMcsRUsyeoNWgvQrik7SvRhehV/XM01YQ93TX3uA9sJVLpX
 lVdr1tZmMkZGQoHnuk7MT10qR/tDq4J+dVatQ/J4wvHDisYkMmOL0W/NR
 Vp6DlaU9l8dwz0cGBbPWsiWvTQVGRkq7HrlA/t0dsvYcSg2zmy+qOgMV5
 IsUfqE/tR1LtBaRh44Yso9cSVwnv7dWwdvmyUEftFcx/QT6JtbOrpf+Mh
 LIL6VHt2+kw4tRfYKR4Z4m/xajvYPCJoL/KmP55vJ/CpDeBWQPzu/EvRs
 gDAnUsjXt8OLTF8cPXHUjlzQ9R/vqoWzba16AVlbZt+4myJX0YJIHtQxI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407592649"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="407592649"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932159413"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="932159413"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO fedora) ([10.249.254.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:37:17 -0800
Date: Thu, 1 Feb 2024 12:37:05 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-xe-fixes
Message-ID: <ZbuCYdMDVK-kAWC5@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Sima,

The xe fixes for 6.8-rc2.

drm-xe-fixes-2024-02-01:
UAPI Changes:
- Only allow a single user-fence per exec / bind.
  The reason for this clarification fix is a limitation in the implementation
  which can be lifted moving forward, if needed.

Driver Changes:
- A crash fix
- A fix for an assert due to missing mem_acces ref
- Some sparse warning fixes
- Two fixes for compilation failures on various odd
  combinations of gcc / arch pointed out on LKML.
- Fix a fragile partial allocation pointed out on LKML.

Cross-driver Change:
- A sysfs ABI documentation warning fix
  This also touches i915 and is acked by i915 maintainers.

Thanks,
Thomas

The following changes since commit 9e3a13f3eef6b14a26cc2660ca2f43f0e46b4318:

  drm/xe: Remove PVC from xe_wa kunit tests (2024-01-24 11:13:55 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-02-01

for you to fetch changes up to 5f16ee27cd5abd5166e28b2311ac693c204063ff:

  drm/hwmon: Fix abi doc warnings (2024-02-01 12:04:52 +0100)

----------------------------------------------------------------
UAPI Changes:
- Only allow a single user-fence per exec / bind.
  The reason for this clarification fix is a limitation in the implementation
  which can be lifted moving forward, if needed.

Driver Changes:
- A crash fix
- A fix for an assert due to missing mem_acces ref
- Only allow a single user-fence per exec / bind.
- Some sparse warning fixes
- Two fixes for compilation failures on various odd
  combinations of gcc / arch pointed out on LKML.
- Fix a fragile partial allocation pointed out on LKML.

Cross-driver Change:
- A sysfs ABI documentation warning fix
  This also touches i915 and is acked by i915 maintainers.

----------------------------------------------------------------
Badal Nilawar (1):
      drm/hwmon: Fix abi doc warnings

José Roberto de Souza (1):
      drm/xe: Fix crash in trace_dma_fence_init()

Matt Roper (1):
      drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms

Matthew Brost (3):
      drm/xe: Only allow 1 ufence per exec / bind IOCTL
      drm/xe: Use LRC prefix rather than CTX prefix in lrc desc defines
      drm/xe: Make all GuC ABI shift values unsigned

Thomas Hellström (3):
      drm/xe: Annotate mcr_[un]lock()
      drm/xe: Don't use __user error pointers
      drm/xe/vm: Subclass userptr vmas

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |  14 +-
 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  14 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   4 +-
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h      |   4 +-
 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h |   8 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |   6 +-
 drivers/gpu/drm/xe/abi/guc_messages_abi.h          |  20 +--
 drivers/gpu/drm/xe/xe_exec.c                       |  10 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   4 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  11 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   2 +
 drivers/gpu/drm/xe/xe_hw_fence.c                   |   6 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  14 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  32 ++--
 drivers/gpu/drm/xe/xe_query.c                      |  50 +++----
 drivers/gpu/drm/xe/xe_sync.h                       |   5 +
 drivers/gpu/drm/xe/xe_vm.c                         | 165 ++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                         |  16 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |  16 +-
 19 files changed, 234 insertions(+), 167 deletions(-)
