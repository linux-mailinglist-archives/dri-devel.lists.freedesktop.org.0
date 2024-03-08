Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58658767EC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 17:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC8510E924;
	Fri,  8 Mar 2024 16:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQMO85qY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC73610E924;
 Fri,  8 Mar 2024 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709913834; x=1741449834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CYdGQ08Ok2YU1xKGFXoWTuQPUh6PUOMsZ4KgGZSkSCs=;
 b=SQMO85qYU7Cgq97efGxl6rgTHXDWZVJeVIW/HP5ZXabHkdotsdEulSRu
 nk3ImJX8KLFl5cB/c2AJTbcZsGGrfm3N/soD6Cr2Phpls2LLKJm5VGgwC
 mmFk2ynJxVZ/1+cs6sgShsMZByyi0mdmL0lFEyoEEUR+UvbEPY+lc5QB2
 1lWhNsuCmBCTKi5ZqpY5M7P7Z+IpsKLVWJW2tmCwIxcdKdJAH7lwFPohd
 IINpJ7ko1btob4e9N9RMwkfj3JTfLn5cmbnfj3jocGwoip1TO+QkI6WT3
 3hM9aFbVaQiu3JwRnRf2JsrjHi7DuWz3JTHwaUFRaTs83OoGeE07x2Bsp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4765677"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4765677"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:03:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="15160156"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:03:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 0/8] drm: fix .get_modes() return values
Date: Fri,  8 Mar 2024 18:03:38 +0200
Message-Id: <cover.1709913674.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_connector_helper_funcs .get_modes() hooks are not supposed to
return negative error codes. Some do, but they're not checked, and could
lead to mysterious errors. Fix this all over the place.

BR,
Jani.

Jani Nikula (8):
  drm/probe-helper: warn about negative .get_modes()
  drm/panel: do not return negative error codes from
    drm_panel_get_modes()
  drm/exynos: do not return negative values from .get_modes()
  drm/bridge: lt8912b: do not return negative values from .get_modes()
  drm/imx/ipuv3: do not return negative values from .get_modes()
  drm/vc4: hdmi: do not return negative values from .get_modes()
  drm/bridge: lt9611uxc: use int for holding number of modes
  drm/exynos: simplify the return value handling in
    exynos_dp_get_modes()

 drivers/gpu/drm/bridge/lontium-lt8912b.c     | 16 +++++++---------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  2 +-
 drivers/gpu/drm/drm_panel.c                  | 17 +++++++++++------
 drivers/gpu/drm/drm_probe_helper.c           |  7 +++++++
 drivers/gpu/drm/exynos/exynos_dp.c           |  7 +++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c     |  4 ++--
 drivers/gpu/drm/exynos/exynos_hdmi.c         |  4 ++--
 drivers/gpu/drm/imx/ipuv3/parallel-display.c |  4 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c               |  2 +-
 include/drm/drm_modeset_helper_vtables.h     |  3 ++-
 10 files changed, 38 insertions(+), 28 deletions(-)

-- 
2.39.2

