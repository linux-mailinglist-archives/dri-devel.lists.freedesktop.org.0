Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8581A89614
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 10:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5DE10E67C;
	Tue, 15 Apr 2025 08:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIH8PFb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05BC10E679;
 Tue, 15 Apr 2025 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744704593; x=1776240593;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=CBn3S4NQjbcvwDo4sTCBm3K4/y/d7APVIK8ZkkWfz/8=;
 b=hIH8PFb3eN1U2s8sdrxwvpC5nUDDtE5SX9HooCk7ddlHdKtRzvnnt0q+
 ryqLyvkdJGghClxGDo6bK+uz7da+r6BElt8EfcPJ8F+HlLHYMTVJQuz1u
 D3euEH04mLIZM1FLdL7F23JjHbojMKq+evvaF9W/yOjFoCzLAGy2CsZOP
 Pa5ZZIS+zzuT7TyUgt/UDJ7L//PcootTZSQsWsqyhgeXp+p65XYcy5Y8E
 C6LdtmsCHC8AKY+8KdNDQ+4cdctdiv6jRcZrsGLUEezOrr0bEJBpbwYvM
 Ct+cIHvdzpJ7a4ZO7kNdFbWZ2gxfY0/kfgp2wum/5LoXFmFnk8Gz3DH0l Q==;
X-CSE-ConnectionGUID: d6VJf9LxRKS6e9we9SRYFw==
X-CSE-MsgGUID: 5R5EXUBTQQaN2rSb91GxHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57191743"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57191743"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:09:52 -0700
X-CSE-ConnectionGUID: 5m4WgJMOQQ+Lw2+e3igMng==
X-CSE-MsgGUID: E4HuB3B4TOSv4ZEJl+ckAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130594824"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2025 01:09:50 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v2 0/3] Rework/Correction on minimum hblank calculation
Date: Tue, 15 Apr 2025 13:25:06 +0530
Message-Id: <20250415-hblank-v2-0-1a23e9d97360@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANoQ/mcC/zXMQQ7CIBCF4as0sxYDlFp15T1MF1BHmVjBQEM0D
 Xd3bNLl//LyLZAxEWY4NwskLJQpBg69a2D0NjxQ0I0btNSdNLIX3k02PIU5udZIi862Cvj8Tni
 nzwpdB25PeY7pu7pF/deNOG5EUUIK46zqmUE8dBcKM077Mb5gqLX+ABz1ApucAAAA
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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250408-hblank-v1-0-4ba17aebee65@intel.com

---
Arun R Murthy (3):
      drm/display/dp: Export fn to calculate link symbol cycles
      drm/i915/display: export function to count dsc slices
      drm/i915/display: move min_hblank from dp_mst.c to dp.c

 drivers/gpu/drm/display/drm_dp_helper.c      | 47 ++++++++++++------------
 drivers/gpu/drm/i915/display/intel_audio.c   |  7 ++++
 drivers/gpu/drm/i915/display/intel_display.c | 19 ++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 55 ++--------------------------
 drivers/gpu/drm/i915/display/intel_dp_mst.h  |  3 ++
 include/drm/display/drm_dp_helper.h          |  3 ++
 7 files changed, 105 insertions(+), 76 deletions(-)
---
base-commit: c4fc93b0ec49f4b0105c142502b7d1d5de379950
change-id: 20250407-hblank-49b340aeba31

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

