Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AD578F8E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 03:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1658811A294;
	Tue, 19 Jul 2022 01:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086D411A294;
 Tue, 19 Jul 2022 01:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658192833; x=1689728833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=72x3hW4EiBuVpFTEzlYlkJRsr+uCRH5e2gH1lsqSvjM=;
 b=YemLE9wOA0mhtMFNIg4HExVhnyWY6vBOK+v+yCMIdC1a/3Eg/Lr+nHTS
 uy9uF83apmfyKmxahgSSXSi3/n9stpKEFxwSD10GNRW82dGw6QFqKOeQ3
 AmlMtFif1sFohpZW5dCClwLnpdJQ1jUTihE2gzEDy/DgdnKtyl/wn766E
 4xQf18eviA/J/J7etMd+1Sg3BWZEuMACODGpxI2Th7dZvVmoc8/S6PJpZ
 jPuBGe1dbSxqBUit1tOl2jPASid/ZX3HWDqciG6MOuIYhi/FbaeDbfuTy
 ao081cPe1nZ15qeaZmBGWugvJDwAw+EwqlfFaZ/dlkjfMouh0rbULh/jt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266759606"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="266759606"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 18:07:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="630128382"
Received: from orsosgc001.jf.intel.com ([10.165.21.135])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 18:07:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/gt: Expose per gt defaults in sysfs
Date: Mon, 18 Jul 2022 18:07:06 -0700
Message-Id: <cover.1658192398.git.ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a gt/gtN/.defaults/ directory (similar to
engine/<engine-name>/.defaults/) to expose default parameter values for each
gt in sysfs. This allows userspace to restore default parameter values
after they may have changed.

Patch 1: Creates the gt/gtN/.defaults/ directory
Patch 2: Adds per-gt RPS defaults (rps_max_freq_mhz and rps_min_freq_mhz)
	 to gt/gtN/.defaults/

An approved Level-0/oneAPI UMD pull request which consumes the exposed
defaults can be seen here:
	https://github.com/intel/compute-runtime/pull/552
The UMD pull request will be merged if/after this series is merged to i915.

Previous discussion on these patches can be seen here:
	https://patchwork.freedesktop.org/patch/484238/?series=102665&rev=4
	https://patchwork.freedesktop.org/patch/483988/?series=102665&rev=3

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Ashutosh Dixit (2):
  drm/i915/gt: Create gt/gtN/.defaults/ for per gt sysfs defaults
  drm/i915/gt: Expose per-gt RPS defaults in sysfs

 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    | 10 +++---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h    |  6 ++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 34 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  9 ++++++
 drivers/gpu/drm/i915/gt/intel_rps.c         |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 12 +++++---
 6 files changed, 64 insertions(+), 9 deletions(-)

-- 
2.34.1

