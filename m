Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8C85652A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 15:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E630310E5D9;
	Thu, 15 Feb 2024 14:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwu6iGha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294810E5D9;
 Thu, 15 Feb 2024 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708005616; x=1739541616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s28gQVWPZGE3H1osjrzS3iQPjQBdB6vAoufDHgxlyXs=;
 b=bwu6iGhaIOJQuiDd1pGyLsGbhklN1cfqHHnnqII6Zi0OG5vJtBvFDfAT
 XpA6qb8mkt6x8l1VIX0dK+rllU6S6ZhKNrRuCEWQvla1265RTh50HWWYs
 dg1xKyEAQc4maj8s9R+Be211brubnn1AmTMS+YxAxkFmX3CBPirZzdXuT
 3Os+vBJY/CcF18RqNqUWaMovyVmyuStTZY3KS1ka6sgMAizRkfB31/UEh
 +JXmSqSiwWFhrZEFs+KAWC6d3blAoNzPpQGb3G2PGuoKF2dm5YyoyAGOA
 UyD8f9nTcJ5S7o5HVi1MSHcLx+ZnSU4p0ndRC32JSzx7ahcfkBDFihWTH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5061153"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5061153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 06:00:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="8188580"
Received: from yspisare-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.246.50.215])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 06:00:11 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 0/2] Disable automatic load CCS load balancing
Date: Thu, 15 Feb 2024 14:59:22 +0100
Message-ID: <20240215135924.51705-1-andi.shyti@linux.intel.com>
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

