Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C23A9A629
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAD610E76C;
	Thu, 24 Apr 2025 08:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2GGnWPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF0110E76B;
 Thu, 24 Apr 2025 08:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745483831; x=1777019831;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=6z6sipAmJyEF6fAlaDV5MR4Tbm+Cir+dJNNkFSBkGro=;
 b=l2GGnWPE4VChzgqlcOkU7AHJHXhHn5+hdO+99LUlvLgN8my+qUitRHzE
 SzOYqz/4XJZOHOJd5aWYVXDdxhy1fX6IdPg9xKdkYK5m4secGpOTeVDFF
 7b6qLz3lGxw/cLbv1aynXXq41hzbMjnC59CHCR1slVCJi6Rqfqzf3HwOu
 YubdPz3bWvwjGKq1a8R/YDaeviYdLPZgMTsjdsQ7mB5a2WAWZiLrmQ6PM
 rW/96BrHhaiK2jN598P4uEwIb5u749MIfJsCAtex3OhmoYHgTvHRnwKQo
 cw6utqHuIf11uXPXNm7tJv1ltLY/+5aGI9XubObq95Y56NJ7WhFkWAE4B Q==;
X-CSE-ConnectionGUID: yw5uNgy3T7uIAqRrGtFILQ==
X-CSE-MsgGUID: UwiEKV2DSkCPnryGq3E40g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57754169"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="57754169"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 01:36:59 -0700
X-CSE-ConnectionGUID: AbiZLVgCRMi7023dqM/buw==
X-CSE-MsgGUID: DKCb0b3lS0GOrZMwXdO8ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="136639121"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 24 Apr 2025 01:36:57 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v6 0/2] Rework/Correction on minimum hblank calculation
Date: Thu, 24 Apr 2025 13:52:28 +0530
Message-Id: <20250424-hblank-v6-0-3d10442d9a31@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMT0CWgC/13PTQ6CMBAF4KuYrq1pp3/UlfcwLtoySqOCAUI0h
 rtbTMDK8k3me5N5kw7biB3Zb96kxSF2salT0NsNCZWrL0hjmTIBBopJZmjlb66+Umm9kMyhd4K
 TtPxo8Ryf36LjKeUqdn3Tvr69A5+mc0UxVwycMiq94ybVIGp1iHWPt11o7mSqGCBjXC0MEuMOB
 NrSGqHZmsmMASxMJuZLb3xpgyx0yNh2/g/E33qBiosQlNQK1ldUfuXHVGJ6+oYXPlhjczaO4wc
 TuyyJcAEAAA==
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

 drivers/gpu/drm/display/drm_dp_helper.c      | 53 +++++++++++++-------
 drivers/gpu/drm/i915/display/intel_display.c | 19 +++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 74 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  2 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 56 ++-------------------
 include/drm/display/drm_dp_helper.h          |  2 +
 6 files changed, 136 insertions(+), 70 deletions(-)
---
base-commit: ada794bd93930fd265c2df8f38196994173e1fde
change-id: 20250407-hblank-49b340aeba31

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

