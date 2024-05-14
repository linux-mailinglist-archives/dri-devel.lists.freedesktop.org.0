Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1C8C564F
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C2310E09F;
	Tue, 14 May 2024 12:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzHYgBfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3E10E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691325; x=1747227325;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QRPIX2aiVrr6eKheUPFX6/X/cKDByELUcyhA6TCpKaw=;
 b=JzHYgBfESnM569fXTrL0Pi/OlqTHsV4NlvFxoJicEWMj6uDNl8NKjOtd
 YxQgcgVqfOTdRCeRu8VJ5fixurHKPgqFlpDcxlQDz6Fnklt3ZST9BAyuK
 pg6KA1VPlJMCgXGHC1WqqN1MixBmhEbCro5XZnsmaBBiGU2KOKHVhrwDf
 a6WbvNNLg7vXwyubpTuKTwXqLc3NgIbFKDh6eRXWzIANMf+GD3nD1PWHp
 O03qMaxHmKHDBRWSsf+m+lnR4MauDxEY3plUyENeMlwtd9ohUDKWT7nVu
 VxrshlNoC4xc5msyt5UrYlOz5Odep6K50ugjWv/3p39p4STsMJ5mQ3i15 Q==;
X-CSE-ConnectionGUID: oSVsR7/6SY6olky4BV/fFw==
X-CSE-MsgGUID: D6oedyB6TDCJKzWcWt/YLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15458649"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15458649"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:24 -0700
X-CSE-ConnectionGUID: XoAJDb5DSFup7aHgAWwPxQ==
X-CSE-MsgGUID: CdcxhS1wSjywfdaBVlB/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30507437"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 00/11] drm: conversions to struct drm_edid 
Date: Tue, 14 May 2024 15:55:06 +0300
Message-Id: <cover.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Convert more drivers to struct drm_edid.

Compile tested only.

Jani Nikula (11):
  drm/rockchip: cdn-dp: get rid of drm_edid_raw()
  drm/sti/sti_hdmi: convert to struct drm_edid
  drm/bridge: analogix_dp: convert to struct drm_edid
  drm/exynos: hdmi: convert to struct drm_edid
  drm/hisilicon/hibmc: convert to struct drm_edid
  drm/loongson/7a1000: convert to struct drm_edid
  drm/loongson/7a2000: convert to struct drm_edid
  drm/msm/dp: switch to struct drm_edid
  drm/tegra: convert to struct drm_edid
  drm/imx/tve: convert to struct drm_edid
  drm/imx/ldb: convert to struct drm_edid

 .../drm/bridge/analogix/analogix_dp_core.c    | 15 +++---
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 23 +++++----
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 17 ++++---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           | 24 +++++-----
 drivers/gpu/drm/imx/ipuv3/imx-tve.c           | 14 +++---
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c | 15 +++---
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c | 15 +++---
 drivers/gpu/drm/msm/dp/dp_display.c           | 11 ++---
 drivers/gpu/drm/msm/dp/dp_panel.c             | 47 ++++++-------------
 drivers/gpu/drm/msm/dp/dp_panel.h             |  2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 16 +++----
 drivers/gpu/drm/sti/sti_hdmi.c                | 24 ++++++----
 drivers/gpu/drm/tegra/drm.h                   |  2 +-
 drivers/gpu/drm/tegra/output.c                | 29 +++++++-----
 14 files changed, 121 insertions(+), 133 deletions(-)

-- 
2.39.2

