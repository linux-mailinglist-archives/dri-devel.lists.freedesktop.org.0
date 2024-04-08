Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ECA89CA41
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0A3112813;
	Mon,  8 Apr 2024 17:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPTDTuH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A80112813
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595870; x=1744131870;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=awzwign24z2Ua3YBdDGqFJ4b8QgPxP60ZUVr8uvT5pw=;
 b=dPTDTuH0fPrmXDYMD1fZw1ZEZCCYEJQB3iQhWLhypcJZ+OKIUd57yoer
 BKxqFH4pF+8MYcLAw0zm0fjp4STvKNxo9/zwhncavhC0YYC8YjQjoMPTA
 ujYQfOlGte73U4B3Wd98DwCkUHJwaVbg5TyEr0GZvJfRHmCVVGNfP3Gyh
 vOvzYeT07TpSxdLfZR1GZDztZMQUiMMAJO2Q2i89bzLRrgJ5/cu1gPGCg
 YDk0Lueaxvr8FnIVTpKiK9hNAa3BH8MB8ZIoxitrEmpakFzcqloVaxkvP
 1efnkmxZYMX/cwWneYYyeq2JYxNdyoooPoxZtcyIiKncaEKm1c41aJjm2 w==;
X-CSE-ConnectionGUID: dNw0Zw/4Q5iecXgOnDbOzw==
X-CSE-MsgGUID: izACJGQXRJiRCxkoZOzPkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793335"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793335"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792324"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792324"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:26 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/21] drm: Increase COMPILE_TEST=y coverage
Date: Mon,  8 Apr 2024 20:04:05 +0300
Message-ID: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I got fed up having to build multiple architectures when
doing subsystem wide refactoring. So I decided to attack
the low hanging COMPILE_TEST=y fruit. Here are the
results. All of these drivers now build with COMPILE_TEST=y
on x86/x86_64

Ville Syrjälä (21):
  drm/armada: Fix printk arguments
  drm/armada: Fix armada_debugfs_crtc_reg_write() return type
  drm/armada: Allow build with COMPILE_TEST=y
  drm/imx/dcss: Fix 64bit divisions
  drm/imx/dcss: Allow build with COMPILE_TEST=y
  drm/sti: Include linux/io.h for devm_ioremap()
  drm/sti: Allow build with COMPILE_TEST=y
  drm/hisilicon/kirin: Include linux/io.h for readl()/writel()
  drm/hisilicon/kirin: Fix 64bit divisions
  drm/hisilicon/kirin: Fix MASK(32) on 32bit architectures
  drm/hisilicon/kirin: Allow build with COMPILE_TEST=y
  drm/tilcdc: Allow build without __iowmb()
  drm/tilcdc: Allow build with COMPILE_TEST=y
  drm/omap: Open code phys_to_page()
  drm/omap: Allow build with COMPILE_TEST=y
  drm/atmel-hlcdc: Allow build with COMPILE_TEST=y
  drm/fsl-dcu: Allow build with COMPILE_TEST=y
  drm/mediatek: Allow build with COMPILE_TEST=y
  drm/meson: Allow build with COMPILE_TEST=y
  drm/rcar-du: Allow build with COMPILE_TEST=y
  drm/stm: Allow build with COMPILE_TEST=y

 drivers/gpu/drm/armada/Kconfig                  |  2 +-
 drivers/gpu/drm/armada/armada_debugfs.c         |  2 +-
 drivers/gpu/drm/armada/armada_gem.c             |  2 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig             |  2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig                 |  2 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig         |  2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 11 +++++------
 drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h    |  2 ++
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h |  2 +-
 drivers/gpu/drm/imx/dcss/Kconfig                |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c          |  4 ++--
 drivers/gpu/drm/mediatek/Kconfig                |  4 ++--
 drivers/gpu/drm/meson/Kconfig                   |  2 +-
 drivers/gpu/drm/omapdrm/Kconfig                 |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c              |  4 ++--
 drivers/gpu/drm/renesas/rcar-du/Kconfig         |  2 +-
 drivers/gpu/drm/sti/Kconfig                     |  2 +-
 drivers/gpu/drm/sti/sti_dvo.c                   |  1 +
 drivers/gpu/drm/stm/Kconfig                     |  2 +-
 drivers/gpu/drm/tilcdc/Kconfig                  |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h            |  2 ++
 21 files changed, 30 insertions(+), 26 deletions(-)

-- 
2.43.2

