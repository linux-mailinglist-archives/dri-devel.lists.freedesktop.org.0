Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05D89CA4C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DDE1128A3;
	Mon,  8 Apr 2024 17:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYQa/C6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05127112889
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595891; x=1744131891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qtgW6cDHbjXCZHnD3uUoe80KzOu9Z+I5e0ZtgR8x0KE=;
 b=VYQa/C6Ttgo+gqbOW2xPIoNUzcdZAbMzpJydUsGx1fUT8S4+MY43h5Y5
 ggbsE6R8a2lxsCEwRS9Os3kKNMvx2oEscHMzznoczgkZDA9/EeRR8wgyl
 MRqYpzGpWGnhkYficGzC3Fh2xH1rZvcLBUPxuVwTspYt5tLrDPoAKnoUs
 8twu0JXKAZZLL2K5X7NCsxQ+3EMZsbAWPdFq+LlXzhzxHy5USLk2MjNLm
 LpIXcMlLcUmqp6RUD+XdQxx5Nk+P7+AzDH+gCcKwcQ59iNz8O4YTHl3ot
 pZFOVgmFiMSZWWE279Lb9XddCVjJzjTZBvLHXQKbHwkXDH7KcmG/lHnEo A==;
X-CSE-ConnectionGUID: /VkOzZbNSOWbAq1CS5bNAQ==
X-CSE-MsgGUID: AaVhcYqbSIqiOcnQljuHOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793382"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793382"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792331"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792331"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 07/21] drm/sti: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:12 +0300
Message-ID: <20240408170426.9285-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
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

Allow sti to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/sti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
index 3c7a5feff8de..75c301aadcbc 100644
--- a/drivers/gpu/drm/sti/Kconfig
+++ b/drivers/gpu/drm/sti/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_STI
 	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
-	depends on OF && DRM && ARCH_STI
+	depends on OF && DRM && (ARCH_STI || COMPILE_TEST)
 	select RESET_CONTROLLER
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-- 
2.43.2

