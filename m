Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E588AB6694
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 10:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB02D10E1FB;
	Wed, 14 May 2025 08:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEiWCm6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59A710E1FB;
 Wed, 14 May 2025 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747212907; x=1778748907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7VYT+DmwVHP1CBmU7j+lnFrgFzo3RRTSbidq8hZZFU8=;
 b=KEiWCm6naIT69IcWPUMTBLR/DkwO5ZNopeavHQLzNEVpcKG743miS8JC
 5kSRlWgJIcquAbEO0pisBMjTlcfwU77u0931Xs6tplVcQM8+M4CCfXSk3
 KxgLpvJvgiEA0gZJAIcb4n1vSEmvLX/HyorSZeiIOpGyPI3WIoAf6NV5K
 dtR72/wy0Lyxwtc7Y1iQxpdy/YkpVEWgxAkdQM/LJi/kQIWzOHE3dP61C
 2357rOhKNDoaXOkssGtyY8ew4yf+KoUojtkzIbWsu/wO9be6gSxxewvNv
 FBRb7VwcfChQXOvrcka8i4I8YU0vZQ8ug37Nj/2kWffXd+LLciAj1TxDD A==;
X-CSE-ConnectionGUID: ih2Z2Au5SyKj2Hp5Fyf8Mw==
X-CSE-MsgGUID: NvhRW/E3QpOqpS994Mj0Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60106622"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="60106622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:55:07 -0700
X-CSE-ConnectionGUID: k387UBeAS/GKJL5YR6qCsw==
X-CSE-MsgGUID: 0DAW029yTDq0azCJ3E4L4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="138399186"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:55:04 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Add quirk for panels that support HBR3 without TPS4
Date: Wed, 14 May 2025 14:13:54 +0530
Message-ID: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Revert the existing patch that rejects HBR3 for all eDP panels that
do not support TPS4. Add a patch to add a quirk for specific panels that
support HBR3 without TPS4 and are unstable with higher rate.
Reject HBR3 only for these panels.

Ankit Nautiyal (2):
  Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"
  drm/dp: Add quirk for panel with HBR3 without TPS4

 drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c | 43 +++++++++++++++++++------
 include/drm/display/drm_dp_helper.h     |  8 +++++
 3 files changed, 44 insertions(+), 9 deletions(-)

-- 
2.45.2

