Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C594DE490
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 00:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3BF10E476;
	Fri, 18 Mar 2022 23:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E6110E451;
 Fri, 18 Mar 2022 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647646811; x=1679182811;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WPTkIf+D6Ht1QEzuSLW2MFLBk/9iyb37Q/0NQ1o7adA=;
 b=OrA5iNxtSd4jHsiUySRKzhgt5oRbHJ+89QVWrSzW4IDIPGBkaOETE5OG
 fBSzS1gYOtWut0Hc+HenFARgU/3jbYqeD8GjtFCezR9S3rWY3caqPIZyB
 yVxIUI36FTqekv69aeOb87ms0dYnlw5jeEhxyr43OcwvO3kk3R62jSioG
 TBO+7Bg0sxvoB/c7t6BCfAImbrkCqqM8cslN27Od99cdm8ruauHNs9lCN
 ZgodIiEg949EgULDk3RnigKfxITZrsnlzViS4vfV287xRDP3zmM4QSnXg
 nUsVuLswVcbELRrr+k2WZKVsQ9am+CHRPcEkbt4qVygJ+odW5lBfiHHET Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="244724329"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="244724329"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:39:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558717369"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.168])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:39:46 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/7] Introduce multitile support
Date: Sat, 19 Mar 2022 01:39:30 +0200
Message-Id: <20220318233938.149744-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the second series that prepares i915 to host multitile
platforms. It introduces the for_each_gt() macro that loops over
the tiles to perform per gt actions.

This patch is a combination of two patches developed originally
by Abdiel, who introduced some refactoring during probe, and then
Tvrtko has added the necessary tools to start using the various
tiles.

The second patch re-organises the sysfs interface to expose the
API for each of the GTs. I decided to prioritise this patch
over others to unblock Sujaritha for further development.

A third series will still follow this.

Thanks Michal and Andrzej for the reviews and support!

Thanks,
Andi

Patchwork: https://patchwork.freedesktop.org/series/98741/

Changelog
=========
v6 -> v7
 - fixed a mock selftest error by initializing i915->gt[0]
   (thanks Tvrtko!)
 - removed spurious file added by mistake (thanks Matt!)
 - improved commit log in patch 7 (thanks Suja!)

v5 -> v6
 - address all Michal and Andrzej's reviews that consist mainly
   in code refactoring.

v4 -> v5
 - fixed Michal's reviews.
 - the sysfs patches have been split in 3 parts to make reviews
   easier.
 - Sujaritha's patch on pm throttle has been queued.
 - INTEL_REGION_LMEM has been renamed to INTEL_REGION_LMEM_0
 - added the gt_is_root() helper
 - the sysfs files will be called intel_gt_sysfs_* instead of
   sysfs_gt_*

v3 -> v4
 - fixed Tvrtko's review:
    - remove the SYSFS_DEPRECATED_V2 mention from the commit log
    - reworded the error message when accessing deprecated files
    - errors in sysfs are printed as warnings as they are not
      fatal
    - the inline functions are moved to be out of line.
   and some other minor refactoring.

v2 -> v3
 - Added Matt and Sujaritha's r-b for patch 1 and 2.
 - Reworded the commit of patch 2 to underline the fact that the
   interface is useful also when used manually.

v1 -> v2
 - fixed a couple of coding style issues in patch 2.

Andi Shyti (5):
  drm/i915: Rename INTEL_REGION_LMEM with INTEL_REGION_LMEM_0
  drm/i915/gt: add gt_is_root() helper
  drm/i915/gt: create per-tile sysfs interface
  drm/i915/gt: Create per-tile RC6 sysfs interface
  drm/i915/gt: Create per-tile RPS sysfs interfaces

Sujaritha Sundaresan (1):
  drm/i915/gt: Add sysfs throttle frequency interfaces

Tvrtko Ursulin (1):
  drm/i915: Prepare for multiple GTs

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_fb.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 .../drm/i915/display/intel_plane_initial.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |   4 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |   8 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 135 +++-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  22 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      | 122 ++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h      |  34 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 601 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h   |  15 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |  18 +
 drivers/gpu/drm/i915/gt/intel_rps.h           |   4 +
 drivers/gpu/drm/i915/i915_driver.c            |  28 +-
 drivers/gpu/drm/i915/i915_drv.h               |   8 +
 drivers/gpu/drm/i915/i915_reg.h               |  11 +
 drivers/gpu/drm/i915/i915_sysfs.c             | 310 +--------
 drivers/gpu/drm/i915/i915_sysfs.h             |   3 +
 drivers/gpu/drm/i915/intel_memory_region.c    |   2 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   7 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  11 +-
 drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  13 +-
 27 files changed, 1023 insertions(+), 366 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h


base-commit: 76874531ffae41683316380bd6d6227bbba12148
-- 
2.35.1

