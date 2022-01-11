Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6148AD6D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9867110E68A;
	Tue, 11 Jan 2022 12:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D6A10E311;
 Tue, 11 Jan 2022 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641903366; x=1673439366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RvQDpwIhR532RKKDzl2hsJWSDkYmIAGGkPxZjefmxUE=;
 b=h/ELC8zPNSxrDLaX2sWYQgaGeryN36WOmkNpxUb1rL/myy+IBseIq2GT
 29Ddk2gpYLaW6kCCU4V8Os7uc05ornVXmXsoEjt5To5YYRnvwY70xA2fn
 lFHl44LWqIAO9dhhKv9UI5c9Q0W93h4FuGn5I1WygFJuy6xHsHe/Nzp1s
 q2FH8Z9BDUZ32YHo5ZysbpHsLIl2w6zom6qQvIauxw5Afw2WBx+VdbtbK
 OinxZbzcIbJcp4j4Bp5dX+B7/yJWIH/nDNLBzjnnv//TvZi3zlb4vFDIX
 149P+gzkNNc8yl9FjtSDXI1l+TrLw0E3quJuEAE/DYtmyVkL3pEfjdOQR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="304209516"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="304209516"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 04:16:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528722612"
Received: from gkodinet-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.50])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 04:16:03 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Introduce multitile support
Date: Tue, 11 Jan 2022 14:15:50 +0200
Message-Id: <20220111121552.35679-1-andi.shyti@linux.intel.com>
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

Andi Shyti (1):
  drm/i915/gt: make a gt sysfs group and move power management files

Tvrtko Ursulin (1):
  drm/i915: Prepare for multiple GTs

 drivers/gpu/drm/i915/Makefile                 |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 141 ++++++-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  14 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/gt/sysfs_gt.c            | 126 ++++++
 drivers/gpu/drm/i915/gt/sysfs_gt.h            |  44 ++
 drivers/gpu/drm/i915/gt/sysfs_gt_pm.c         | 394 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/sysfs_gt_pm.h         |  16 +
 drivers/gpu/drm/i915/i915_driver.c            |  29 +-
 drivers/gpu/drm/i915/i915_drv.h               |   8 +
 drivers/gpu/drm/i915/i915_reg.h               |   1 +
 drivers/gpu/drm/i915/i915_sysfs.c             | 315 +-------------
 drivers/gpu/drm/i915/i915_sysfs.h             |   3 +
 drivers/gpu/drm/i915/intel_memory_region.h    |   3 +
 drivers/gpu/drm/i915/intel_uncore.c           |  12 +-
 drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   5 +-
 18 files changed, 786 insertions(+), 348 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.c
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt.h
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_gt_pm.h

-- 
2.34.1

