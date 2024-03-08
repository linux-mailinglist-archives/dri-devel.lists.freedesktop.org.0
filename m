Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749DE876BAF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 21:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61851112D5E;
	Fri,  8 Mar 2024 20:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaGmpxoU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ACF112D5E;
 Fri,  8 Mar 2024 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709929362; x=1741465362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z5C+/kqT7zzayWP3YRJGvQW73+4jn1t84uLJD3UPT5o=;
 b=MaGmpxoUVDH4aaHjPXCZ4ABNKJBZpyV5DjjgG/LrgMzjnCpKR8zFzsgm
 DQx670KeMGBaG/0Lym/PPlY7/9AG+1oLjbT+21Qa3YBBGZGiRBTzKxmO4
 G8iG9r/jji1xehAaX/ZHo5Cy7NKIgctiWIyK2rcAyo2wLgjnbDjKyCKDi
 kemoYwfPEBcJvBr5qXG749322QAvABhOYrdiZ2gLtdkabeJs3TOgUhdQB
 8qxmOpZJ07pYkaOkNbKffH/8RERa1RT2iI5CekCb5zDKOrG1gJbTTqh6L
 AarOFxkJTRPSgEReWvevsRY8yORJ02wCKkVRW8oXxicDcb+Ni88yq8EOu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="22120687"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="22120687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 12:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="41503833"
Received: from unknown (HELO intel.com) ([10.247.118.109])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 12:22:33 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v5 0/4] Disable automatic load CCS load balancing
Date: Fri,  8 Mar 2024 21:22:15 +0100
Message-ID: <20240308202223.406384-1-andi.shyti@linux.intel.com>
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

this series does basically two things:

1. Disables automatic load balancing as adviced by the hardware
   workaround.

2. Assigns all the CCS slices to one single user engine. The user
   will then be able to query only one CCS engine

In this v5 I have created a new file, gt/intel_gt_ccs_mode.c
where I added the intel_gt_apply_ccs_mode(). In the upcoming
patches, this file will contain the implementation for dynamic
CCS mode setting.

I saw also necessary the creation of a new mechanism fro looping
through engines in order to exclude the CCS's that are merged
into one single stream. It's called for_each_available_engine()
and I started using it in the hangcheck sefltest. I might still
need to iterate a few CI runs in order to cover more cases when
this call is needed.

I'm using here the "Requires: " tag, but I'm not sure the commit
id will be valid, on the other hand, I don't know what commit id
I should use.

Thanks Tvrtko, Matt, John and Joonas for your reviews!

Andi

Changelog
=========
v4 -> v5
 - Use the workaround framework to do all the CCS balancing
   settings in order to always apply the modes also when the
   engine resets. Put everything in its own specific function to
   be executed for the first CCS engine encountered. (Thanks
   Matt)
 - Calculate the CCS ID for the CCS mode as the first available
   CCS among all the engines (Thanks Matt)
 - create the intel_gt_ccs_mode.c function to host the CCS
   configuration. We will have it ready for the next series.
 - Fix a selftest that was failing because could not set CCS2.
 - Add the for_each_available_engine() macro to exclude CCS1+ and
   start using it in the hangcheck selftest.

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
 - In Patch 2 do not add the extra CCS engines to the exposed
   UABI engine list and adapt the engine counting accordingly
   (thanks Tvrtko).
 - Reword the commit of Patch 2 (thanks John).

Andi Shyti (4):
  drm/i915/gt: Disable HW load balancing for CCS
  drm/i915/gt: Refactor uabi engine class/instance list creation
  drm/i915/gt: Disable tests for CCS engines beyond the first
  drm/i915/gt: Enable only one CCS for compute workload

 drivers/gpu/drm/i915/Makefile                |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c  | 40 ++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gt.h           | 13 +++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c  | 39 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h  | 13 +++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  6 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c  | 30 ++++++++++++++-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 22 +++++------
 8 files changed, 139 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h

-- 
2.43.0

