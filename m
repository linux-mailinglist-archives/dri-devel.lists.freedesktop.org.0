Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A8A8527D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 06:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9837B10EAB6;
	Fri, 11 Apr 2025 04:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeZam+B6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9011610EAB1;
 Fri, 11 Apr 2025 04:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345744; x=1775881744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mw4s8LaTFfI+d/PF6Ldn2wm2m0sz1cW32gabehsAS3o=;
 b=KeZam+B62bBJFU10dWM+FRS52U37SI67/ngCbCBdyB9HOJbcdKatKCqI
 /XiV+UwMY/zjEL9oPAQRK8KVQCBpMNQf1NbAakvS1KeoZyFDo0F9Ut98y
 VMaTe4sF4x03rCTHGjIaQyhrOqUkF7wp7uwwtHl7wlEi/TcygZu2Fc7Z0
 qd5wcw3eLMXi+vgRY4ArylsbF4/qg+wssdx+xkkSscBA5POlfbCKmgJyD
 MmP28vrlkXeo01RK78DoFhfJU4729CwAUzQBJGtSbPlbVCBmUYJKUXr00
 V5CseKn1gfUxw024KR/IS2VYfWIaDshQNCrnmkRlxXKpRsPFDeDn4XYGJ g==;
X-CSE-ConnectionGUID: huugGTkFQW25fk9FwNZmSA==
X-CSE-MsgGUID: +7I6TMU+QYqQjfEiXF+Zqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259917"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259917"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:03 -0700
X-CSE-ConnectionGUID: Yqg+rkPtTHii/SPqzNvTHQ==
X-CSE-MsgGUID: 5MU90zbgQluztFpza0dYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="160056930"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 21:29:00 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 00/13] Modify drm helpers to use luminance
Date: Fri, 11 Apr 2025 09:58:56 +0530
Message-Id: <20250411042909.2626807-1-suraj.kandpal@intel.com>
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
  drm/dp: Add argument for luminance range info in
    drm_edp_backlight_init
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

 drivers/gpu/drm/display/drm_dp_helper.c       |  92 +++++++----
 .../drm/i915/display/intel_dp_aux_backlight.c | 143 ++++++------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   9 +-
 include/drm/display/drm_dp_helper.h           |  10 +-
 5 files changed, 128 insertions(+), 128 deletions(-)

-- 
2.34.1

