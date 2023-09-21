Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEAB7A91B8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 08:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F27110E0BC;
	Thu, 21 Sep 2023 06:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388FD10E059;
 Thu, 21 Sep 2023 06:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695277500; x=1726813500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WRRACPRwTvJpc/MELkb/SvEjq1PHuRvYunviNnrA99Y=;
 b=ic6NSAlRqjd+i23rAlR42naTohBJFRj/A8r1IMBWTIj5Xx48/AVLL5/H
 xrgla48AJ1TCnrS2D+3wX+op8uYmKVtCEpTyVCJ+J5JudaRhPFLG5ZvCW
 tXRmEtGCFetfSN1Y6H6YB9FmB8KCBl4Xi+ZWuCsC5I+RpKA/fyB/MxLre
 +1ZEZftXWUxKqHICp5iDOw4dCgFX4BTmRbPP2UucEM05WF1pOj+HsmSCX
 zYbRmVkRB/Jx7qViHtL/UBjgNsm4erqVvjtH0X9CZaH4ZuEiWwkqIGcBV
 bdcR7OyJ0XqUyDQIoVx19NlN8dSBZrzYwQ98JnjUDvr2FwbEG+yRWxXWQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379314091"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="379314091"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 23:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812488062"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="812488062"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 23:24:57 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/6] Panel replay phase1 implementation
Date: Thu, 21 Sep 2023 11:43:29 +0530
Message-Id: <20230921061335.454818-1-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, jouni.hogander@intel.com,
 Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com,
 dri-devel@lists.freedesktop.org
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
 drivers/gpu/drm/i915/display/intel_dp.c       |  50 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 332 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_psr.h      |   7 +
 include/drm/display/drm_dp.h                  |  23 ++
 7 files changed, 323 insertions(+), 114 deletions(-)

-- 
2.29.0

