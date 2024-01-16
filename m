Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA7882ECAC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 11:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C7910E45B;
	Tue, 16 Jan 2024 10:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209210E0D1;
 Tue, 16 Jan 2024 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705400556; x=1736936556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tKNr89uUYOCvBnyu8cmFH2vdarOCQ3G2DHjS++AkfvM=;
 b=HfCEZBgTGuh8ru+j1bjAfAHO5JzjljT5kL2UzqvpVWGkwkMuDIQyNyVu
 iUn+zELzMtZMG8W6LUEXabJ6TuiWopNllKpvxAMtZhZwThRl78216g1XH
 xku9BK+rfpsHWySq/hSCXh0+FUU92uBegz4tjFWIui/5flW0lwPUH5hmJ
 Nwqa+m6/4+tYtYgZfL0ZXLj8COW5wmpnCS5kSZ/CnCDWZrN0QZ6S387pw
 8d61FiUDaCgF8QaJKzQscy2vCLshm+/ezgTJ/P2FP/AHcpaIkMQpJV1Yw
 a8+iW2YRdnyjFewZN0xe8pVNvALsEDgXmJPFpuekYSR72WdoNah15gHnV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="7202431"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="7202431"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 02:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="787397099"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; d="scan'208";a="787397099"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.195])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 02:22:31 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: daniel.vetter@ffwll.ch,
	airlied@gmail.com
Subject: [PULL] drm-xe-next-fixes
Date: Tue, 16 Jan 2024 11:22:03 +0100
Message-ID: <20240116102204.106520-1-thomas.hellstrom@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maintainers,

Various fixes for the Xe driver, as described below, for -rc1.

Thanks,
Thomas


The following changes since commit 315acff5196f4e2f84a2a2d093000e0c6b0b4d1c:

  drm/xe: Fix warning on impossible condition (2023-12-26 12:53:26 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-01-16

for you to fetch changes up to bf3ff145df184698a8a80b33265064638572366f:

  drm/xe: display support should not depend on EXPERT (2024-01-15 21:40:32 +0100)

----------------------------------------------------------------
Driver Changes:
- Fix for definition of wakeref_t
- Fix for an error code aliasing
- Fix for VM_UNBIND_ALL in the case there are no bound VMAs
- Fixes for a number of __iomem address space mismatches reported by sparse
- Fixes for the assignment of exec_queue priority
- A Fix for skip_guc_pc not taking effect
- Workaround for a build problem on GCC 11
- A couple of fixes for error paths
- Fix a Flat CCS compression metadata copy issue
- Fix a misplace array bounds checking
- Don't have display support depend on EXPERT (as discussed on IRC)

----------------------------------------------------------------
Brian Welty (3):
      drm/xe: Fix guc_exec_queue_set_priority
      drm/xe: Fix modifying exec_queue priority in xe_migrate_init
      drm/xe: Fix bounds checking in __xe_bo_placement_for_flags()

Dan Carpenter (3):
      drm/xe/device: clean up on error in probe()
      drm/xe/selftests: Fix an error pointer dereference bug
      drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()

Jani Nikula (1):
      drm/xe: display support should not depend on EXPERT

José Roberto de Souza (1):
      drm/xe: Fix definition of intel_wakeref_t

Matthew Brost (1):
      drm/xe: Fix exec IOCTL long running exec queue ring full condition

Paul E. McKenney (1):
      drm/xe: Fix build bug for GCC 11

Thomas Hellström (6):
      drm/xe/vm: Fix an error path
      drm/xe: Use __iomem for the regs pointer
      drm/xe: Annotate xe_mem_region::mapping with __iomem
      drm/xe: Annotate multiple mmio pointers with __iomem
      drm/xe: Annotate xe_ttm_stolen_mgr::mapping with __iomem
      drm/xe/migrate: Fix CCS copy for small VRAM copy chunks

Vinay Belgaumkar (1):
      drm/xe: Check skip_guc_pc before setting SLPC flag

 drivers/gpu/drm/xe/Kconfig                         |   2 +-
 drivers/gpu/drm/xe/Makefile                        |   1 -
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |   5 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  16 +--
 drivers/gpu/drm/xe/xe_device.c                     |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   8 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   6 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   3 +
 drivers/gpu/drm/xe/xe_guc.c                        |   7 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c                    | 133 +++++++++++++--------
 drivers/gpu/drm/xe/xe_mmio.c                       |   2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  15 ++-
 18 files changed, 136 insertions(+), 91 deletions(-)
