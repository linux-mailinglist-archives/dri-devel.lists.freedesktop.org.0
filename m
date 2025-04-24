Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D940CA9B240
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 17:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4509D10E834;
	Thu, 24 Apr 2025 15:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKGpChUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CE610E82C;
 Thu, 24 Apr 2025 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745508585; x=1777044585;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=rHntk/aEZyC9YOHKgQCpD4LJD2bljYNJKF/eWEOxAHE=;
 b=eKGpChUZvfYymfaOqlICBPEPMA/WQEtIsPJnHLgtJkDd+20TESXZ3q6k
 A4eb0ibW/v00Bzj+Udm1Z6oF+q4PZcE9C4TvUkm2aoFJYbV4jm4cDldVN
 92PE2TexmRFufnOI1aLu7FvkY5mTIjAVtIAZN64eZixciusvqXHYFHjdL
 /e1u41976t8Q1vsCP2B5qKqk2QZcaK0GtcZW29Iz/9F436fUNgsmZZctv
 QWnV3pskTEQCNKjO4PBL7XsZ7qidvn6EtCfmNdeWn53NLkgHfPk5JimDq
 L2mhxKIe//J/mNTpaGmQ3Mq7yZ2vsfUQ6sE6RbpMFzqXfAJ0dC21e3Txg w==;
X-CSE-ConnectionGUID: SY3KibngR+mzJBgzKGBTkQ==
X-CSE-MsgGUID: 7vGH7j4XRg+9UcwFi1v94Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50816443"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50816443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 08:29:44 -0700
X-CSE-ConnectionGUID: FB/oBR94TSaPKMDUoRZQuA==
X-CSE-MsgGUID: XsqAKT7ZTGqI5s7yzeLC9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137748307"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2025 08:29:42 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v7 0/2] Rework/Correction on minimum hblank calculation
Date: Thu, 24 Apr 2025 20:45:13 +0530
Message-Id: <20250424-hblank-v7-0-8b002f1506cc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIFVCmgC/13QTU7EMAwF4KuMsp6ixHGSZlbcA7HIj6ERQ4vaU
 QUa9e64I7WELl/k71nOXUw0FprE5XQXI81lKkPPwZ1PInWhf6emZM4CJBiJ0jVdvIb+o0EfNcp
 AMWglePhrpLfy/Sh6eeXclek2jD+P3lmtr1tFu1XMqpENxqAc1xBZ81z6G12f0vAp1ooZKqbMz
 oCZCqDJZ++0lUeGFQPYGTKLObqYfcLWpoqdt/tA/xtvySidkkFr4LjF1Fv+mGFm12tUG5N3/sh
 szXBnlpnOSiJC9vylNVuW5Rd9MwjzpwEAAA==
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
Changes in v7:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v6: https://lore.kernel.org/r/20250424-hblank-v6-0-3d10442d9a31@intel.com

Changes in v6:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v5: https://lore.kernel.org/r/20250423-hblank-v5-0-6bee618bc979@intel.com

Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20250423-hblank-v4-0-8e513cc54652@intel.com

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

 drivers/gpu/drm/display/drm_dp_helper.c      | 52 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_display.c | 19 +++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 74 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  2 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 56 ++-------------------
 include/drm/display/drm_dp_helper.h          |  2 +
 6 files changed, 136 insertions(+), 69 deletions(-)
---
base-commit: ada794bd93930fd265c2df8f38196994173e1fde
change-id: 20250407-hblank-49b340aeba31

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

