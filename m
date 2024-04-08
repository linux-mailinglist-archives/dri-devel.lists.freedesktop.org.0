Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B75889CA5A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB9A1128BE;
	Mon,  8 Apr 2024 17:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lz4rhdAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3991128BE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595935; x=1744131935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ep6l4tE6d/T5WqNMeZ7oCFUOTHiY9hJKRKAOBw+/Si0=;
 b=Lz4rhdAwokGgtqdJLYknsw4au3B0E8KP1rgedQ67m9TOAJSZ1FtJG5og
 TYXAT6OxzT/hKlc0pDhDbeAYG6iOLWEW2O1nF3iOsBw8GiFAhkJ9KO7JV
 U/zHtjLh5LpYrCz2u9F6Hpfn8LZBRlVfnk44DHaeQX4L3Mxs0bI+DjQnh
 ys3IxTYW4VNV7+d44W5sEt+eCFBLZ2dy19T1DxRid6v//d7ZbP1+lFAmC
 chis5A1IWnde5pGCsAjyrxtkvR6EoQwUvaWNgt+D7Yd37AWSxrq3ybzdY
 UCWWq6nXZNOWcSNGrjq08AlTI3dB0sc/yig31FVfYwCBRmjjf9f9mQ9zn g==;
X-CSE-ConnectionGUID: ZBa1YQuTRUOJKRk2iRuA1w==
X-CSE-MsgGUID: 6vxadc+jSwaSHPtoi7ZSDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793488"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793488"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792343"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792343"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:30 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 19/21] drm/meson: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:24 +0300
Message-ID: <20240408170426.9285-20-ville.syrjala@linux.intel.com>
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

Allow meson to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 5520b9e3f010..d8f67bd9c755 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_MESON
 	tristate "DRM Support for Amlogic Meson Display Controller"
-	depends on DRM && OF && (ARM || ARM64)
+	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
 	depends on ARCH_MESON || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-- 
2.43.2

