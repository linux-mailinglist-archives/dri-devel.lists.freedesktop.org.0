Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF97E0A9A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 22:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E2B10EAC8;
	Fri,  3 Nov 2023 21:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92B410EAC7;
 Fri,  3 Nov 2023 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699045972; x=1730581972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pf/tAY5djrzhBAGZrWBL5LecxR1FMwoPZ1orlDgzD8c=;
 b=GKalgoF6Qbax4lCDjys0VOhtSMQFVXShat0YfvR9Gp0Lb1aZklnPaV4P
 WKTAq/SsmaRfTEwLlpLP2cllRDtg4lXyAyrXhxSlaOlS/uwfQp59IyoVG
 lI1KPJ2FpnmaKqGJBbIwGXT6IC7GvaXBM7pKkrkxenQOEW3nsW5J7+FBa
 IelrluVfo4JNzWEnEic1dotl2cJcfbUwVtuCtRBdyWsokrUY80q858QEh
 IZ8IRNx9QRKYJ9JM6IYeQYq87RO0OcBOsx8OaUmHucntBe8uupfh19zFl
 NPP6Dv6pAdqEAOzkGr41G9FXHVHhWSuOoM/dOGfWri7by9Q7+dveSYkxb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379416717"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="379416717"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 14:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="790877320"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="790877320"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 03 Nov 2023 14:12:49 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/6] Panel replay phase1 implementation
Date: Sat,  4 Nov 2023 02:30:29 +0530
Message-Id: <20231103210035.3151502-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel Replay is a power saving feature for DP 2.0 monitor and similar
to PSR on EDP.

These patches are basic enablement patches added on top of
existing psr framework to enable full-screen live active frame
update mode of panel replay. Panel replay also can be enabled
in selective update mode which will be enabled in a incremental
approach.

As per current design panel replay priority is higher than psr.
intel_dp->psr.panel_replay_enabled flag indicate panel replay is enabled.
intel_dp->psr.panel_replay_enabled + intel_dp->psr.psr2_enabled indicates
panel replay is enabled in selective update mode.
intel_dp->psr.panel_replay_enabled + intel_dp->psr.psr2_enabled +
intel_psr.selective_fetch enabled indicates panel replay is
enabled in selective update mode with selective fetch.
PSR replated flags remain same like before.

Note: The patches are under testing by using panel replay emulator and
panel is not avalible.

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (5):
  drm/panelreplay: dpcd register definition for panelreplay
  drm/i915/panelreplay: Initializaton and compute config for panel
    replay
  drm/i915/panelreplay: Enable panel replay dpcd initialization for DP
  drm/i915/panelreplay: enable/disable panel replay
  drm/i915/panelreplay: Debugfs support for panel replay

Jouni Högander (1):
  drm/i915/psr: Move psr specific dpcd init into own function

 drivers/gpu/drm/i915/display/intel_ddi.c      |   7 +-
 .../drm/i915/display/intel_display_types.h    |  15 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  49 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 292 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_psr.h      |   7 +
 include/drm/display/drm_dp.h                  |  23 ++
 7 files changed, 291 insertions(+), 105 deletions(-)

-- 
2.29.0

