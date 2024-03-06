Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33966872C11
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 02:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C8B112CEB;
	Wed,  6 Mar 2024 01:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4UWqSKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3252A112DD9;
 Wed,  6 Mar 2024 01:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709688185; x=1741224185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9QFb+ls8zmFoD5cK7OMUyxdIOVvqIXnWDbo4N55X8bI=;
 b=k4UWqSKxaRjQO74EyApYugHfYs5iL11nLhYOVqGdaeZsJp+JLyr7h5j1
 nUk/6GFvtDT7ewxERNUrkMTaXoqnL3CO7U/9CA8N3PLEplwNpJsfN/geT
 4aH9+40H0IsIJel6lYuxAZCVSpljZNi1IzCHREIF2u0itABYovACJaGYp
 1rMj4c1oJ86qe+2v33lXMIhCqrDSGqbxdImgQRojJfyL5XGvsjoxqjtvY
 qzLLyXUrThmrKGxRx56xfwMKz8sFqVkpmMEYQG4q/yRFInLIbUNz95sh8
 40/fn4lM+Z8sf5QL8kHsSrY0wdz/C6cNhDrBsF5S5J5iHqrT5AO5NqXJ4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8098380"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8098380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 17:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="40573887"
Received: from unknown (HELO intel.com) ([10.247.118.75])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 17:22:57 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v4 0/3] Disable automatic load CCS load balancing
Date: Wed,  6 Mar 2024 02:22:44 +0100
Message-ID: <20240306012247.246003-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

I have to admit that v3 was a lazy attempt. This one should be on
the right path.

this series does basically two things:

1. Disables automatic load balancing as adviced by the hardware
   workaround.

2. Assigns all the CCS slices to one single user engine. The user
   will then be able to query only one CCS engine

I'm using here the "Requires: " tag, but I'm not sure the commit
id will be valid, on the other hand, I don't know what commit id
I should use.

Thanks Tvrtko, Matt, John and Joonas for your reviews!

Andi

Changelog
=========
v3 -> v4
- Reword correctly the comment in the workaround
- Fix a buffer overflow (Thanks Joonas)
- Handle properly the fused engines when setting the CCS mode.

v2 -> v3
- Simplified the algorithm for creating the list of the exported
  uabi engines. (Patch 1) (Thanks, Tvrtko)
- Consider the fused engines when creating the uabi engine list
  (Patch 2) (Thanks, Matt)
- Patch 4 now uses a the refactoring from patch 1, in a cleaner
  outcome.

v1 -> v2
- In Patch 1 use the correct workaround number (thanks Matt).
- In Patch 2 do not add the extra CCS engines to the exposed UABI
  engine list and adapt the engine counting accordingly (thanks
  Tvrtko).
- Reword the commit of Patch 2 (thanks John).


Andi Shyti (3):
  drm/i915/gt: Disable HW load balancing for CCS
  drm/i915/gt: Refactor uabi engine class/instance list creation
  drm/i915/gt: Enable only one CCS for compute workload

 drivers/gpu/drm/i915/gt/intel_engine_user.c | 40 ++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_gt.c          | 23 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  6 ++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  5 +++
 4 files changed, 62 insertions(+), 12 deletions(-)

-- 
2.43.0

