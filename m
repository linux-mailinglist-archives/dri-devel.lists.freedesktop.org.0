Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E69559AF
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C42C10E064;
	Sat, 17 Aug 2024 21:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0kalL0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327C910E064;
 Sat, 17 Aug 2024 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928445; x=1755464445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Z4z0KHnD85/ErbbwwcaCrJZUnJMXvG5mYV6bLfrkU4=;
 b=R0kalL0bgYlJKv1N8Ljj9uvmPerE9a3SnRbJPZPaJZ5lwnWgj1C9TAMs
 lDbDoeu/YEn5hs58YsaSJPGJs96vmcWOSkm+Dk+8DGNyLTDSF8HRkocBq
 zC4j9RBJP0q8GAOif5fsGtp/tx/irjUqot1GUhg4YdXfLawniQqi3mAUE
 hBaT6J5+GOsutsJatWzMCOm/Mj0V2cK6Q7SsEtRIqXQLKEtfg1sRfhfGq
 XLAPz/Bst8JgdkHYueQQTRCGilqUDXTJxwMyoU2XomMa77iXNqcffFeVK
 cy4xlAtV7HLVEkipNKrmCLS4ZOiqvTC5i4a+PJY82FAwZ8+wLaFMDMN05 w==;
X-CSE-ConnectionGUID: qirds4UrTUeB5H2rcJJB2g==
X-CSE-MsgGUID: ugo+W+JAS/utd8kYQPSWDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="33585030"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="33585030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:00:45 -0700
X-CSE-ConnectionGUID: Ci7Gx0kgQEygx8xNEgUQyA==
X-CSE-MsgGUID: vq/7a2DBS+y+oU++tWKaOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64885827"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:00:41 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 00/11] CCS static load balance
Date: Sat, 17 Aug 2024 23:00:15 +0200
Message-ID: <20240817210026.310645-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch series introduces static load balancing for GPUs with
multiple compute engines. It's a lengthy series, and some
challenging aspects still need to be resolved.

I have tried to split the work as much as possible to facilitate
the review process.

To summarize, in patches 1 to 10, no functional changes occur
except for the addition of the num_cslices interface. The
significant changes happen in patch 11, which is the core part of
the CCS mode setting, utilizing the groundwork laid in the
earlier patches.

Compared to the first version I've taken a completely different
approach to adding and removing engines. in v1 physical engines
were directly added and removed, along with the memory allocated
to them, each time the user changed the CCS mode.

In this updated approach, the focus is now on managing the UABI
engine list, which controls the engines exposed to userspace.
Instead of manipulating phuscal engines and their memory, we now
handle engine exposure through this list.

I would greatly appreciate further input from all reviewers who
have already assisted with the previous work.

IGT tests have also been developed, but I haven't sent them yet.

Thank you Chris for the offline reviews.

Thanks,
Andi

Changelog
=========
v1 -> v2:
 - Changed engine dynamic creation and removal as described
   above.

Andi Shyti (11):
  drm/i915/gt: Move the CCS mode variable to a global position
  drm/i915/gt: Allow the creation of multi-mode CCS masks
  drm/i915/gt: Refactor uabi engine class/instance list creation
  drm/i915/gt: Manage CCS engine creation within UABI exposure
  drm/i915/gt: Remove cslices mask value from the CCS structure
  drm/i915/gt: Expose the number of total CCS slices
  drm/i915/gt: Store engine-related sysfs kobjects
  drm/i915/gt: Store active CCS mask
  drm/i915/gt: Isolate single sysfs engine file creation
  drm/i915/gt: Implement creation and removal routines for CCS engines
  drm/i915/gt: Allow the user to change the CCS mode through sysfs

 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  23 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h |   3 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c  |  49 +++-
 drivers/gpu/drm/i915/gt/intel_gt.c           |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c  | 287 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h  |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c     |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h     |  18 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |   7 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c      |  75 +++--
 drivers/gpu/drm/i915/gt/sysfs_engines.h      |   2 +
 drivers/gpu/drm/i915/i915_drv.h              |   1 +
 12 files changed, 385 insertions(+), 91 deletions(-)

-- 
2.45.2

