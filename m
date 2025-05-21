Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33183ABF361
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AC811B50F;
	Wed, 21 May 2025 11:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XjJkT1Te";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659B411B50A;
 Wed, 21 May 2025 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828423; x=1779364423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cjAMbLmXnIydXSjbN1PgdZh8GI2aSpVYIfuhMdfQ/SE=;
 b=XjJkT1TerQ9pMmqmB/a0QP7etZR774RgiOO0zxyWGsBGpo+Fc1nUxbBd
 hw4nRAHZJN5ocUgIHcxXxa9qSbqwhTXIN/YLx/NeEAaJ7ezfSg/RMoy2A
 WGISH7Y/xI9qH84QnscjNYVwhfR+DBVUfCa/UleBVr9kuK5irTCkwg7Z9
 +eihFVWvM0HELuxbRpV8cbDzFGqhjj+X4MOIy6ffajfR+c7tsZD8g8WME
 Qih8chQxxPsbzWhroaSiqJbCcbOCy+0W8ARKa9NJQlazG/i/DFxAJKLbr
 gEL256ivERtd/DsJVhEJDEwnTS0JqcNpRHMmcDN3b8XIVxaDR2pGNJ8Oh A==;
X-CSE-ConnectionGUID: LgX3gIIQRqaudhc3phE8dg==
X-CSE-MsgGUID: BUhGMGkPRQeusyYS0vXXUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217786"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:40 -0700
X-CSE-ConnectionGUID: hvH0+jCXT2GxBecpwO1ikQ==
X-CSE-MsgGUID: a8cLMCACQcaxO2AVd4sSbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140452857"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 00/12] Panel Replay + Adaptive sync
Date: Wed, 21 May 2025 14:53:07 +0300
Message-ID: <20250521115319.2380655-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This patch set is adding missing configuration to have Panel Replay
and Adaptive Sync enabled simultaneously. Also some issues identified
while debugging are fixed:

1. Source PORT ALPM configuration has to made during modeset.
2. PHY_CMN1_CONTROL is not written according to HAS document
3. Wrong register field definitions for PORT_ALPM_LFPS_CTL.

Patches are tested on LunarLake and PantherLake using our reference panel supporting
Adaptive Sync and Panel Replay.

v4:
  - added DP_DSC_DECODE_CAPABILITY definitions
  - use defined shift instead of hardcoded value
v3:
  - comment about DP2.1 corrected as DP2.1a
  - referring patch removed from commit message
v2:
  - rework Panel Replay DPCD register definitions
  - do not use hardcoded indices while accessing intel_dp->pr_dpcd
  - ensure ALPM registers are not written on platform where they do
    not exist
  - remove kerneldoc comments

Jouni Högander (12):
  drm/panelreplay: Panel Replay capability DPCD register definitions
  drm/dp: Add Panel Replay capability bits from DP2.1 specification
  drm/i915/psr: Read all Panel Replay capability registers from DPCD
  drm/i915/alpm: Add PR_ALPM_CTL register definitions
  drm/i915/alpm: Write PR_ALPM_CTL register
  drm/i915/psr: Add interface to check if AUXLess ALPM is needed by PSR
  drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
  drm/i915/alpm: Move port alpm configuration
  drm/i915/display: Add PHY_CMN1_CONTROL register definitions
  drm/i915/display: Add function to configure LFPS sending
  drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
  drm/i915/psr: Do not disable Panel Replay in case VRR is enabled

 drivers/gpu/drm/i915/display/intel_alpm.c     | 72 +++++++++++++------
 drivers/gpu/drm/i915/display/intel_alpm.h     |  4 ++
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 32 +++++++++
 drivers/gpu/drm/i915/display/intel_cx0_phy.h  |  2 +
 .../gpu/drm/i915/display/intel_cx0_phy_regs.h |  3 +
 drivers/gpu/drm/i915/display/intel_ddi.c      | 12 ++++
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 44 +++++++-----
 drivers/gpu/drm/i915/display/intel_psr.h      |  2 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 14 +++-
 include/drm/display/drm_dp.h                  | 24 +++++--
 11 files changed, 168 insertions(+), 45 deletions(-)

-- 
2.43.0

