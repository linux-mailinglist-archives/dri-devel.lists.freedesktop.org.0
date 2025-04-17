Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED2A919FC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E643310EAAF;
	Thu, 17 Apr 2025 11:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFs1eCdD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E8110EAAD;
 Thu, 17 Apr 2025 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744888017; x=1776424017;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=J9M2NbvoJEIjhCrEQiVGQ76lzGlXLmEmsrRkUXw9TNo=;
 b=DFs1eCdDFfqToiNq6zHnAzJ6+DDKXVHxRqJvhvwO7MlYT/vZyzQM31/9
 dLlj9ErU7NIGJBtDbi61otSS0m8V5HK/eNaBEiQvJGZ4UtkDgi7AtyMoO
 hgoRlAi8v8IPp4xyaoSXMEaMC/9JxQL/oQdKEgVwAWM83sPPANPnyJXpL
 eKLIfJkjnaIc4b7VbQyX0de2EgFL9jyhnNo8sYnv9QdOtV6nvhJJagQxX
 syzBo/YgBmN7Z7AfQKBBJCel18MFoJytJXsgYYnwveynsCI7PZZgPMhcV
 mjr5baYIS/ovlt+jvaqk7YZhtVSJx4qLG9gdNdZd3Lk8B+5pv6Z7xNnXS g==;
X-CSE-ConnectionGUID: kKWBduf3SBG9X7R+vlL5iQ==
X-CSE-MsgGUID: WHoLVOR2SuilmIWmkeFNMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46481055"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46481055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:06:56 -0700
X-CSE-ConnectionGUID: /URRlrcSS/KtucbqUUNHjw==
X-CSE-MsgGUID: ogWRntMWT2ej7Ll2KjNGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131754017"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa008.jf.intel.com with ESMTP; 17 Apr 2025 04:06:55 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v3 0/3] Rework/Correction on minimum hblank calculation
Date: Thu, 17 Apr 2025 16:22:27 +0530
Message-Id: <20250417-hblank-v3-0-d3387df7efce@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzdAGgC/03MTQ6CMBCG4auQWVvTP0BceQ/jooVRJmJrWtJoC
 He3kGBYfpN5nwkiBsII52KCgIkieZeHOhTQ9sY9kFGXN0guS655zXo7GPdkurFKc4PWKAH5+R3
 wTp8Vut7y7imOPnxXN4nluhGnjUiCcaatEXVmEKvyQm7E4dj6FyxEkrtMlP9M5kwYqbDpmlpVf
 J/N8/wDogy8ZNMAAAA=
X-Change-ID: 20250407-hblank-49b340aeba31
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20250415-hblank-v2-0-1a23e9d97360@intel.com

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250408-hblank-v1-0-4ba17aebee65@intel.com

---
Arun R Murthy (3):
      drm/display/dp: Export fn to calculate link symbol cycles
      drm/i915/display: export function to count dsc slices
      drm/i915/display: move min_hblank from dp_mst.c to dp.c

 drivers/gpu/drm/display/drm_dp_helper.c      | 53 ++++++++++++-----------
 drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 64 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 56 ++----------------------
 drivers/gpu/drm/i915/display/intel_dp_mst.h  |  3 ++
 include/drm/display/drm_dp_helper.h          |  2 +
 7 files changed, 122 insertions(+), 78 deletions(-)
---
base-commit: c4fc93b0ec49f4b0105c142502b7d1d5de379950
change-id: 20250407-hblank-49b340aeba31

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

