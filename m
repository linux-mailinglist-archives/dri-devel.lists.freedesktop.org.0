Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62D43F568
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 05:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0106E9BC;
	Fri, 29 Oct 2021 03:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39F66E9B9;
 Fri, 29 Oct 2021 03:28:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230438542"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="230438542"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 20:28:35 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="538557445"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 20:28:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 00/10] i915: Initial multi-tile support
Date: Thu, 28 Oct 2021 20:28:07 -0700
Message-Id: <20211029032817.3747750-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
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

Some of our upcoming platforms, including the Xe_HP SDV, support a
"multi-tile" design.  A multi-tile platform is effectively a platform
with multiple GT instances and local memory regions, all behind a single
PCI device.  From an i915 perspective, this translates to multiple
intel_gt structures per drm_i915_private.  This series provides the
initial refactoring to support multiple independent GTs per card, but
further work (especially related to local memory) will be required to
fully enable a multi-tile platform.

Note that the presence of multiple GTs is largely transparent to
userspace.  A multi-tile platform will advertise a larger list of
engines to userspace, but the concept of "tile" is not something
userspace has to worry about directly.  There will be some uapi
implications later due to the devices having multiple local memory
regions, but that aspect of multi-tile is not covered by this patch
series and will show up in future work.

v2:
 - Include some additional tile setup refactoring that got missed in v1.

v3:
 - Fix GEM_BUG_ON() assertion on pre-gen9 platforms; the assertion was
   only meant for multi-tile platforms and will always fail on old
   platforms that have a BAR0 smaller than 16MB.
 - Rename some of the gt/tile initialization functions.  (Lucas/Jani)
 - Move top-level tile memory init to i915_drv.c since it isn't directly
   related to the GT.  (Lucas)
 - Squash per-gt cleanup into the patch that introduces the per-gt
   setup.
 - Fix handling of display and GSE interrupts (our current multi-tile
   platforms don't have display, but we can't count on that being true
   in the future).

Daniele Ceraolo Spurio (2):
  drm/i915: split general MMIO setup from per-GT uncore init
  drm/i915: Initial support for per-tile uncore

Matt Roper (1):
  drm/i915: Restructure probe to handle multi-tile platforms

Michal Wajdeczko (1):
  drm/i915/guc: Update CT debug macro for multi-tile

Michał Winiarski (1):
  drm/i915: Store backpointer to GT in uncore

Paulo Zanoni (3):
  drm/i915: rework some irq functions to take intel_gt as argument
  drm/i915/xehp: Determine which tile raised an interrupt
  drm/i915/xehp: Make IRQ reset and postinstall multi-tile aware

Tvrtko Ursulin (2):
  drm/i915: Prepare for multiple gts
  drm/i915/xehpsdv: Initialize multi-tiles

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 177 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  11 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  10 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   6 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   5 +-
 drivers/gpu/drm/i915/i915_drv.c               | 102 ++++++++--
 drivers/gpu/drm/i915/i915_drv.h               |   9 +
 drivers/gpu/drm/i915/i915_irq.c               |  77 +++++---
 drivers/gpu/drm/i915/i915_pci.c               |  40 +++-
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/i915/intel_device_info.h      |  15 ++
 drivers/gpu/drm/i915/intel_memory_region.h    |   3 +
 drivers/gpu/drm/i915/intel_uncore.c           |  36 ++--
 drivers/gpu/drm/i915/intel_uncore.h           |   6 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   3 +-
 drivers/gpu/drm/i915/selftests/mock_uncore.c  |   2 +-
 18 files changed, 423 insertions(+), 94 deletions(-)

-- 
2.33.0

