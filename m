Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4690B904FA7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 11:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93A210E274;
	Wed, 12 Jun 2024 09:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cg3X7ue2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DF110E274;
 Wed, 12 Jun 2024 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718186065; x=1749722065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B0sh6F0rJkgkvXHmW62e/kcvPnr2keTFxecQUWzUWy0=;
 b=Cg3X7ue2oCYBj76f3ejZE1BcHy9FU4Wdpd6MWIX1x6ByHHaCJdTEybaV
 ZDc5xcRH13SeOu0rmHgX/8FdN0cA8ZHajJZdI5Uxggu+Ri6nAjLcBaRN2
 o20Livk9TF+SOqINwAflSkCEN/hJIuFC/DLGYOK+9hDqyHUPpnN0WIQY4
 1o3QZsQFzY+zpg01dDjF98qWwxuidWdvYrMbErUK25O0ctO42MxtxGdWl
 fY1fWFXC7QtaTzdsPDWH0/Jji2x0CT5Oav9DK76/bQqhLMR+DUXiF6KV3
 lOFw9DaDTr+trKTpQMrneM5fhbj+vYiWKNbsNSal5qjkQlPz+qjexyfm+ w==;
X-CSE-ConnectionGUID: A92p9hCZQt6fLElx/5oQ3Q==
X-CSE-MsgGUID: hVs9Bq58SqeR2B06ua6yQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15068909"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15068909"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:54:25 -0700
X-CSE-ConnectionGUID: XRssPe5ZSXmSdGHbgRchXw==
X-CSE-MsgGUID: 8eYInQFVSDOVScEVm4nbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="40441617"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 02:54:23 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, sfr@canb.auug.org.au
Subject: [PATCH 0/3] CMRR patch fixes
Date: Wed, 12 Jun 2024 15:24:30 +0530
Message-ID: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
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

Address following issues regarding CMRR

1. Describe target_rr_divider in struct drm_dp_as_sdp.
2. Compute vrr_vsync params when vrr.enable is set.
3. Use required macro to avoid overflow.

Mitul Golani (3):
  drm/dp: Describe target_rr_divider in struct drm_dp_as_sdp
  drm/i915/display: Send vrr vsync params whne vrr is enabled
  drm/i915/display: Update calculation to avoid any overflow

 drivers/gpu/drm/i915/display/intel_vrr.c | 12 +++++++-----
 include/drm/display/drm_dp_helper.h      |  1 +
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.45.2

