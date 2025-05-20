Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04CABE12D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4AC10E5DE;
	Tue, 20 May 2025 16:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8G5hz88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3567E10E085;
 Tue, 20 May 2025 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747760023; x=1779296023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0YHiEm+Lu718zLVBOyGfqS/sj/qaDdil73gVp2bj9Ic=;
 b=h8G5hz88ZTu57zw7RbNTCfK7GNRJ4y0ZBmefBCTaxIVGAsL2eS/tth5V
 8544iKCMu0vT4YnhuLbvBKRcPhAmwVOO0gACH3oTIGaal1Jvff/KwGnKS
 yEqaeaoC3tKo6gEkvWqL39W8KGlL/O7Cc7BmVXjXOCL5q6LicGgCUtY9s
 ZMwf+k0ijlGA93MIhD8QABmlovWE2JFz/ESfhYVLXjGZsOnKv3WvbYTA7
 A5aXV4Ipi0Zq2E+Utv3+hxdhNZiSKLgH5dq4JBuoaowoYzmiVI1hWSrIa
 QTO4/7b5DFtBuUNylV9R0RmU4/ZRuOhoP+PWgJQhHjODUOH+fMVIB8a1M Q==;
X-CSE-ConnectionGUID: QeqGZURIQ4C5MsdFbHeyqQ==
X-CSE-MsgGUID: 7CzD0kqNTd+//zZkNYo0RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37322148"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="37322148"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:42 -0700
X-CSE-ConnectionGUID: YmtzLOKVSmm9lhr580J9dQ==
X-CSE-MsgGUID: KxC+KyG+TjuIDF/MIEGFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="163038098"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.130])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:40 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 00/12] Panel Replay + Adaptive sync
Date: Tue, 20 May 2025 19:53:14 +0300
Message-ID: <20250520165326.1631330-1-jouni.hogander@intel.com>
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

Patches are tested on LunarLake and PantheLake using our reference panel supporting
Adaptive Sync and Panel Replay.

EMP_AS_SDP_TL is currently missing completely from drm-tip. There is a patch for that which is needed if testing these patches:

https://patchwork.freedesktop.org/series/148421/

Otherwise "PSR idle timeout" errors are seen while testing.

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
 include/drm/display/drm_dp.h                  | 18 +++--
 11 files changed, 163 insertions(+), 44 deletions(-)

-- 
2.43.0

