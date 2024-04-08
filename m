Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46289CA55
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92966112899;
	Mon,  8 Apr 2024 17:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSLo/Wpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBF3112899
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595924; x=1744131924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5kUDx7DRa3ULMdMSLl3MsXU/Q9i2dllR2Au7YtYZpg=;
 b=PSLo/WpjNohmLNk4WaTPCQHuZanqUCgRV42llP/kFVP0/kdCaP6XBMKx
 whe5Ntrwzf5aUthzJ2sDvcIGDcr8in0Em9W6Z/jEWmlNLV0dO6oIqDA2Y
 0LxnTSnmEtCK/2oGxhk1zMDd1n3cReUOT3DckioW6IpOoxKA58z+I1kEv
 B+jo9Y9BySInkY84QKsOVfv3HgMneyX3OQQtkFbMuxAGGxWfAX2tC1K9l
 dCGUUPQG5dGRfEtMvfS5UbvsWAO08F0pjLe7qkgr1NOT4DBjqnb2G/NYi
 PcDOPD1bFQKxJqFi2ymv1HxAFwIOds+OVQPe92u7MRqoVTi7pawNbt+vK A==;
X-CSE-ConnectionGUID: PU8JGdRTT82iulmNGIDItw==
X-CSE-MsgGUID: lakvl8OaQbGGj0ARYWTqUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793468"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793468"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792340"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792340"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>,
	Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH 16/21] drm/atmel-hlcdc: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:21 +0300
Message-ID: <20240408170426.9285-17-ville.syrjala@linux.intel.com>
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

Allow atmel-hlcdc to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/atmel-hlcdc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/Kconfig b/drivers/gpu/drm/atmel-hlcdc/Kconfig
index 3bdbab3a6333..945f3aa7bb24 100644
--- a/drivers/gpu/drm/atmel-hlcdc/Kconfig
+++ b/drivers/gpu/drm/atmel-hlcdc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ATMEL_HLCDC
 	tristate "DRM Support for ATMEL HLCDC Display Controller"
-	depends on DRM && OF && COMMON_CLK && MFD_ATMEL_HLCDC && ARM
+	depends on DRM && OF && COMMON_CLK && ((MFD_ATMEL_HLCDC && ARM) || COMPILE_TEST)
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
-- 
2.43.2

