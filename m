Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1BDA98670
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 11:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFDF10E66B;
	Wed, 23 Apr 2025 09:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILItbBj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE0610E658;
 Wed, 23 Apr 2025 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745401934; x=1776937934;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=ffaWTA861PvXBG7qetBvydmdZela/cIhNbYOklxd+3s=;
 b=ILItbBj73ixSlky1X8uOKxOSaXkrrioOII9YDjSZfSWUq73UkRYo/rMO
 1OKgXTzMRTHwuCjnF8zxBJPkXV9xM0OHn4EoJs8tZ7TgKoqCXTNUY6Tjq
 U/V/I0Kb8bQLi4W2dtUJCPVsxFwJrLeGZdwsoLEMUKkY5ZwAy6H0GwSav
 r+kENscuWtkkVNkmA4M/ZD1IoFZBjM2UffqKcpN6qfysLkXckAdW2/bev
 Vp71CpmraoFkRTQitdloSq4CK1IGTDMDYV+NfdzQrkyR0c7Rg0n6BlkCd
 WbOdj74aioOTJvO+JKB8hJkTu6WNw32KgpxtT8Kg2hccElNdhlKhGJwF5 g==;
X-CSE-ConnectionGUID: DAmMTCBITHGn+54wEwFyug==
X-CSE-MsgGUID: dUsGQU5bTXuVipQ8g/XSig==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46221930"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46221930"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 02:52:14 -0700
X-CSE-ConnectionGUID: V081JWnmR6q1Sijk4Hug6g==
X-CSE-MsgGUID: kFnw9N8TRRufa7xy14Kj4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163327158"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2025 02:52:11 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v4 0/2] Rework/Correction on minimum hblank calculation
Date: Wed, 23 Apr 2025 15:07:38 +0530
Message-Id: <20250423-hblank-v4-0-8e513cc54652@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOK0CGgC/13MSwrCMBSF4a2UjI3k1aZx5D7EQR5XG9RUkhKU0
 r2bFlqKw3O53z+iBNFDQqdqRBGyT74PZYhDhWynwx2wd2UjRlhNBJG4M08dHlgowwXRYDSnqDy
 /I9z8ZwldrmV3Pg19/C7dTOfrmmjXRKaYYGE0lSUD0NRnHwZ4Hm3/QnMisx2j9cZYYVQzDsopy
 Rvyz8SOMbYxUZhxRhqnrGgbu2fTNP0AEMVFlgoBAAA=
X-Change-ID: 20250407-hblank-49b340aeba31
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: imre.deak@intel.com, vinod.govindapillai@intel.com, 
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
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20250422-hblank-v4-0-bdb7bd9c486c@intel.com

Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20250415-hblank-v2-0-1a23e9d97360@intel.com

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250408-hblank-v1-0-4ba17aebee65@intel.com

---
Arun R Murthy (2):
      drm/display/dp: Export fn to calculate link symbol cycles
      drm/i915/display: move min_hblank from dp_mst.c to dp.c

 drivers/gpu/drm/display/drm_dp_helper.c      | 51 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 76 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  3 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 57 +++------------------
 include/drm/display/drm_dp_helper.h          |  2 +
 6 files changed, 137 insertions(+), 69 deletions(-)
---
base-commit: ada794bd93930fd265c2df8f38196994173e1fde
change-id: 20250407-hblank-49b340aeba31

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

