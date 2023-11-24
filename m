Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81B7F740F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1DC10E1DC;
	Fri, 24 Nov 2023 12:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59510E1DC;
 Fri, 24 Nov 2023 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829848; x=1732365848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SCHm1mAv+g00PAkc+L7W1l7IRP0x4cdpe3URBVrGobM=;
 b=OGoLfweyFL7C9dFe9EZMIM87Ly+gyfJIDQTYGMMx3c8Pv/XQuYgecuC8
 R8uLflE8sl7tJZENjd2/MUTqrvGRHbfOrY5ltX2ECI4WcUESRv9J5SE8Z
 GVfWqvwcD9WWWietVqc4gko3+xKx8tG99ZXYDt94GzFwiGH0suxgivmNe
 YkMOjbagqVwXyeUckK55R8PlNB025hubLYbVQf9Q6AbVehAxr+35GnwaR
 X5IDQ/gm2cQNvmZ4pi5wUHq9cTGzqhS/XFhel9kLYf4zFYvXc0l2ynJt+
 S2D8kKHjy+ghdVUNAkDdJ7R2kHU4sB3lhvn13Y1CMwAVD2LSysGwnzQkl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396322584"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="396322584"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="891057678"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="891057678"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm: drm debug and error logging improvements
Date: Fri, 24 Nov 2023 14:43:54 +0200
Message-Id: <cover.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make drm_err_printer() drm device specific, and add drm device specific
drm_dbg_printer(). Switch code over to use them.

Jani Nikula (8):
  drm/print: make drm_err_printer() device specific by using drm_err()
  drm/print: move enum drm_debug_category etc. earlier in drm_print.h
  drm/print: add drm_dbg_printer() for drm device specific printer
  drm/dp_mst: switch from drm_debug_printer() to device specific
    drm_dbg_printer()
  drm/mode: switch from drm_debug_printer() to device specific
    drm_dbg_printer()
  drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
  drm/i915: switch from drm_debug_printer() to device specific
    drm_dbg_printer()
  drm/i915: use drm_printf() with the drm_err_printer intead of pr_err()

 drivers/gpu/drm/display/drm_dp_helper.c       |  17 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  23 +-
 drivers/gpu/drm/drm_mode_config.c             |   2 +-
 drivers/gpu/drm/drm_print.c                   |  28 ++-
 .../drm/i915/display/intel_crtc_state_dump.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  27 ++-
 .../drm/i915/display/intel_display_driver.c   |   3 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   3 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   3 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   3 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |  10 +-
 drivers/gpu/drm/i915/i915_driver.c            |   3 +-
 drivers/gpu/drm/i915/selftests/i915_active.c  |   8 +-
 include/drm/display/drm_dp_helper.h           |   3 +-
 include/drm/drm_print.h                       | 217 ++++++++++--------
 16 files changed, 209 insertions(+), 149 deletions(-)

-- 
2.39.2

