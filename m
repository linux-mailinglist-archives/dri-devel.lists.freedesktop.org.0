Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970685BE9E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4844410E45A;
	Tue, 20 Feb 2024 14:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGciVtlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7012B10E45A;
 Tue, 20 Feb 2024 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708438864; x=1739974864;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s28gQVWPZGE3H1osjrzS3iQPjQBdB6vAoufDHgxlyXs=;
 b=fGciVtlVx+m8Xvqwe318uhPw6FW1Yxqu+E0ILs4yEiiiShXXdyUKZVCV
 +tbPwmR1t5s+6/Qgg63k1gExa+LS7lYvvkGQ5uk6Lmt3GVlUDeXqXbhhz
 R+7YV3rePdEA5bTF8VZvolGouISrJ38rJbOF4YpMGFM+9o9/JcIQC2TGM
 AujacErnau5shqMxvaSYc05Xam+TDI1+LJHJHF/d8nMX31QJJhgdVWxKJ
 NC9KOXfn9OCDPDnClFR44sDHaS+1NfBjm/oAP+dAqERPezfrxd8f8qZDS
 tGZZ9jl9y0FKH4mmjFFkVSvpv2TU9uoXURsFVJ7ibFY0uYM0ta+6W+MgV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2447022"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2447022"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="42283459"
Received: from alichtma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.74])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:21:00 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 0/2] Disable automatic load CCS load balancing
Date: Tue, 20 Feb 2024 15:20:32 +0100
Message-ID: <20240220142034.257370-1-andi.shyti@linux.intel.com>
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

2. Forces the sharing of the load submitted to CCS among all the
   CCS available (as of now only DG2 has more than one CCS). This
   way the user, when sending a query, will see only one CCS
   available.

Andi

Andi Shyti (2):
  drm/i915/gt: Disable HW load balancing for CCS
  drm/i915/gt: Set default CCS mode '1'

 drivers/gpu/drm/i915/gt/intel_gt.c          | 11 +++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  3 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  6 ++++++
 drivers/gpu/drm/i915/i915_drv.h             | 17 +++++++++++++++++
 drivers/gpu/drm/i915/i915_query.c           |  5 +++--
 5 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.43.0

