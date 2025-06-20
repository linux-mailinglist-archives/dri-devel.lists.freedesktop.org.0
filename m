Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E816FAE13E1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E11410EAE9;
	Fri, 20 Jun 2025 06:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gk5mReYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E769A10EAE6;
 Fri, 20 Jun 2025 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401308; x=1781937308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UUEViCDQMO5i6fZjooBRlEpv7p7xqVtAkG59uVhsdvg=;
 b=Gk5mReYYbKgNBFMeIDoh9HipIuxItNjT6FM0H9n4S/KmojOHUwxmfRXp
 e5thVBL1QOLik0296WhZMpXg4WvsZDj1Hs+YPB35XQDT85gcNZgB4QOYk
 1e2mRS6/BRqNG+h6ojrC/u3Nt1OTK71bVLchrppCUuBROsToEhMWPSLjG
 MGi4IZWEMWQyAxZPqXyZw6YeicIrkB7sn8qSk7nLVN2MZhhX19gV+JNsV
 MeajIgbISSMsXs6rDfviKYEYiHZAhu2mSFw4AshiafAR4RGSrYBdBtu6v
 KkRSHPTggBq140zh81ZY4X4rVLtAuDs9ZhrUy7FyDDV8yucAEABVb2yuI g==;
X-CSE-ConnectionGUID: UdnC13NQSJuklTeSnnsqSw==
X-CSE-MsgGUID: 9XZkWIl5QAizVSC9qCPuPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701837"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:07 -0700
X-CSE-ConnectionGUID: WDvPZiu7QwCe62UIPJ7waQ==
X-CSE-MsgGUID: yieLjfSsShiuA/8ZINaRLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440267"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 00/13] Modify drm helpers to use luminance
Date: Fri, 20 Jun 2025 12:04:32 +0530
Message-Id: <20250620063445.3603086-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series modifies drm dp edp helpers so that drivers can now use them
to manipulate brightness using luminance value via the
PANEL_TARGET_LUMINANCE_VALUE register. This feature was
introduced frin eDP 1.5.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (13):
  drm/dp: Introduce new member in drm_backlight_info
  drm/dp: Add argument in drm_edp_backlight_init
  drm/dp: Add argument for max luminance in drm_edp_backlight_init
  drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
  drm/dp: Change current_level argument type to u32
  drm/dp: Modify drm_edp_probe_state
  drm/dp: Change argument type for drm_edp_backlight_set_level
  drm/dp: Modify drm_edp_backlight_set_level
  drm/dp: Change argument type of drm_edp_backlight_enable
  drm/dp: Enable backlight control using luminance
  drm/i915/backlight: Use drm helper to initialize edp backlight
  drm/i915/backlight: Use drm helper to set edp backlight
  drm/i915/backlight: Use drm_edp_backlight_enable

 drivers/gpu/drm/display/drm_dp_helper.c       |  92 ++++++++----
 .../drm/i915/display/intel_dp_aux_backlight.c | 140 ++++++------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   7 +-
 include/drm/display/drm_dp_helper.h           |  10 +-
 5 files changed, 127 insertions(+), 124 deletions(-)

-- 
2.34.1

