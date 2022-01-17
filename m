Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256464910AD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 20:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7710FAB7;
	Mon, 17 Jan 2022 19:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485F210FAB6;
 Mon, 17 Jan 2022 19:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642447983; x=1673983983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lyfx0Ro8VfHNohbnLglAYmn0TmW2hMYfodOoYb4Eupg=;
 b=HJXkSewWFecD+uqYH5rS4JXArfbHZq/oXn1/D+qDcUpGLHwAiuA+MblE
 xUwZIPuoTTf4vpTWQ1zcR4lwwRgXSv84FZA9Zu8Y9KjmVpYLvEirpfKn5
 sm9Ryglg2jUJ6xcRbTSypTwX+5EUthEeJ/+tq+NVjOHvZr9nQj8rWaHK9
 i0oPRKT7LYe5sWpH9RvDhYPjrZ5XxHPVnrtpD7m/iyDKVJu1fgILYwR1k
 jIZlWAek73LBhSvtxxnbRkbq0S3PthWpZNJA0IsPQKnQXHmUhq8W8cvR3
 BMHeP337/jG7EXvMbeP2w0B5+lYrqwVY0ROS8xS014iVjKsweRSbyyIWM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331032399"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="331032399"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 11:33:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="531450422"
Received: from nkohl-mobl.ger.corp.intel.com (HELO intel.com) ([10.249.41.90])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 11:32:59 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/2] Introduce multitile support
Date: Mon, 17 Jan 2022 21:32:53 +0200
Message-Id: <20220117193255.236599-1-andi.shyti@linux.intel.com>
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

Andi Shyti (1):
  drm/i915/gt: make a gt sysfs group and move power management files

Tvrtko Ursulin (1):
  drm/i915: Prepare for multiple GTs

 drivers/gpu/drm/i915/Makefile                 |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 141 ++++++-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  14 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/gt/sysfs_gt.c            | 136 ++++++
 drivers/gpu/drm/i915/gt/sysfs_gt.h            |  32 ++
 drivers/gpu/drm/i915/gt/sysfs_gt_pm.c         | 392 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/sysfs_gt_pm.h         |  16 +
 drivers/gpu/drm/i915/i915_driver.c            |  29 +-
 drivers/gpu/drm/i915/i915_drv.h               |   8 +
 drivers/gpu/drm/i915/i915_sysfs.c             | 315 +-------------
 drivers/gpu/drm/i915/i915_sysfs.h             |   3 +
 drivers/gpu/drm/i915/intel_memory_region.h    |   3 +
 drivers/gpu/drm/i915/intel_uncore.c           |  12 +-
 drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   5 +-
 17 files changed, 781 insertions(+), 348 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.c
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.h
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.h

-- 
2.34.1

