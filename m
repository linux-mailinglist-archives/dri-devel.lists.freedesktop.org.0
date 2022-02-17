Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AB74BA342
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D16D10E9AC;
	Thu, 17 Feb 2022 14:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4715E10E9AC;
 Thu, 17 Feb 2022 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645108991; x=1676644991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tEApPEoSmBzfmx3K/x7jCSSH8+QaR45nRQjI7LQnALA=;
 b=fI66XyLsmQuiGmxXMBsxuYVjf7CInxuZCqt4P19djGuJvMYU38TUuKXK
 dqsxPxoiqlrSZifzRLFVuENILghlx/PdJTQT2faowahAUNjJWpKcLVDzi
 A9vINP775t1NtGrIk7QMNKWFMZwF0WcHxd2NxbHfzLaO72hp6aK4T6S4Y
 M7JRE1nu3aObqb2L660ju2L3gTzaqrcCUSYoL/mddRnAe4MyedxotPUbV
 xYMXQFQJc3s9p7b9x8glAyc0YOXN58ty5RsSjtxqSbT0FZlwys2CHq/1g
 u1U0zezcBuLLWpHgOxVLxvwomk87Hx4+jeFHiir+2gwCBuqz4PEywfW3f A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="248482367"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="248482367"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545638692"
Received: from sewaggon-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.33.71])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:05 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 0/7] Introduce multitile support
Date: Thu, 17 Feb 2022 15:41:51 +0100
Message-Id: <20220217144158.21555-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
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

Thanks,
Andi

Patchwork: https://patchwork.freedesktop.org/series/98741/

Changelog
=========
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
  RFC : drm/i915: Adding new sysfs frequency attributes

Tvrtko Ursulin (1):
  drm/i915: Prepare for multiple GTs

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_fb.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |   4 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |   8 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 137 +++-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  21 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      | 137 ++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h      |  34 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 638 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h   |  15 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |  83 +++
 drivers/gpu/drm/i915/gt/intel_rps.h           |  10 +
 drivers/gpu/drm/i915/i915_driver.c            |  29 +-
 drivers/gpu/drm/i915/i915_drv.h               |   8 +
 drivers/gpu/drm/i915/i915_reg.h               |  11 +
 drivers/gpu/drm/i915/i915_sysfs.c             | 315 +--------
 drivers/gpu/drm/i915/i915_sysfs.h             |   3 +
 drivers/gpu/drm/i915/intel_memory_region.c    |   2 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |   7 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  12 +-
 drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   7 +-
 26 files changed, 1148 insertions(+), 364 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h

-- 
2.27.0

