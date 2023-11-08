Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D327E510E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 08:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E8710E3B8;
	Wed,  8 Nov 2023 07:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E2C10E3B8;
 Wed,  8 Nov 2023 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699428921; x=1730964921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qeV9HsvgoFTph6r1iksMmJ7wi8mxZJmbqWuVRJJb0Tw=;
 b=HrFQgkUm1mF3hUBKOMtWF9+K5kleumIbHrLH08/ZhoY7BmzR/nnyFVnF
 LyRMUv9ihpsQyw7Z6pWyYIj2pmPE1JGFsqAdwnnHblTaBwqtMYq0txhN6
 QLhmpz1Z9emS8+FnVkQSAXfTcGEIINaEKjgFQ1qA/Ij8AyfC3tIttQP90
 jVU0RtJ5MMEBQfplfbcsMIjFujWIrjphTWDKLyF++ti9iC0JhRmZMIwqr
 fnJ92x9l4Pbm+AlNKXw3stff00Z7nClh3M3e0rilJXcMNzD/l8ByYR4Jh
 mcmOPWFPUingF6bw00TvAzQTuqxorZiUTYrdu4BiUjKPhg03to+917CQc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8360221"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8360221"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 23:35:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906689548"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="906689548"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2023 23:35:19 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 0/6] Panel replay phase1 implementation
Date: Wed,  8 Nov 2023 12:52:57 +0530
Message-Id: <20231108072303.3414118-1-animesh.manna@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dp.c       |  49 +++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 274 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_psr.h      |   7 +
 include/drm/display/drm_dp.h                  |  23 ++
 7 files changed, 282 insertions(+), 96 deletions(-)

-- 
2.29.0

