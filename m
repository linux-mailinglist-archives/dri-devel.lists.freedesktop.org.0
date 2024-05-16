Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12198C72EC
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2137D10E29E;
	Thu, 16 May 2024 08:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBPcHUMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572D810E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715848445; x=1747384445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hIe/GV+SszjqFG9FGCcYxpExlFJkuc/XiXVVaFGHMwQ=;
 b=HBPcHUMOtS/0KsrzhcI6N/QfxIx/fm+BFvI8JSi7KSEyT4QLd6JfAfgr
 UGsKLAIBS228RHq1XwcsRzJ0zHz0f1fr1ZkHd302SEyiptPwGQdhpgl/M
 eKJbRdWrZ4C73M2QCD2hpj9rG2eOq4AdL/2U5/SbHGMtFQthRwhGHFqrZ
 JYdzNtpcEOg/z68rIWWQJzjaefS0JDQTAsR7/raMZDk6HRhT6C6mCAE2v
 rdV+Z4EE5FHeDHErr4AdDOGcr9iBjgCHPyqOad5VGDbyPh/GIPWl5GF/C
 twQ1LEOgzhh1uCGzKMupi4nrYskoqdMYn5vEj5dOVA2i1QOtClw1BnMf9 Q==;
X-CSE-ConnectionGUID: UUTN4YwiRXmJ25SALQj82g==
X-CSE-MsgGUID: 6pdrMuDeSoGxQD/AvSDmtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23081688"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="23081688"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:34:04 -0700
X-CSE-ConnectionGUID: NNgXWuVAQfWrK5VFPenzMQ==
X-CSE-MsgGUID: 5lfnjkIfQHWuizl9w2DZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="35910641"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.208])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 01:34:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, airlied@gmail.com,
 Jani Nikula <jani.nikula@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] drm: have config DRM_WERROR depend on !WERROR
Date: Thu, 16 May 2024 11:33:43 +0300
Message-Id: <20240516083343.1375687-1-jani.nikula@intel.com>
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

If WERROR is already enabled, there's no point in enabling DRM_WERROR or
asking users about it.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com
Fixes: f89632a9e5fa ("drm: Add CONFIG_DRM_WERROR")
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 026444eeb5c6..d0aa277fc3bf 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -450,6 +450,7 @@ config DRM_PRIVACY_SCREEN
 config DRM_WERROR
 	bool "Compile the drm subsystem with warnings as errors"
 	depends on DRM && EXPERT
+	depends on !WERROR
 	default n
 	help
 	  A kernel build should not cause any compiler warnings, and this
-- 
2.39.2

