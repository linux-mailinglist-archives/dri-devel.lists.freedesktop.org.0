Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9310798EDEB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110B610E801;
	Thu,  3 Oct 2024 11:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1DyWJym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1F210E801
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954342; x=1759490342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kw5OI0ciSn4W0AHcRzS/pZbCg5OLjoBgX/KaQgOyXtU=;
 b=f1DyWJymp0bdlOY+X12DlDRYbOtuR6e6/MT69XsB4tusZHhe5NiPBORl
 E0tgnLHsAtOGuTrBTlNdhom/ytC1IVR/WgDHaLhoGryfeLZxp2R3NI1Q9
 R5FTkWqr+MLVV0xZq036oy+1OR0FNi5QGkmSCSDeQKtKaVzoLhX2YqYET
 euXuaaCJB5wPne4XVjx0MHH6q9z9um/rTnDh5akPpupdGLz+x3obmGkLH
 foFI2452xl5gOV8rY6039b7UwTjg1TNNR7O6Um4LeAetUzukl1yWHwlCH
 to+G5wrONLbv2WHMzZ3Dg6dCn8YlBveSkAkq0tpNPM3on4NR6kUmBfO1I g==;
X-CSE-ConnectionGUID: M7BrdotmRHCNyCw5Iou4Zg==
X-CSE-MsgGUID: iOQODO3yScSt6cxQDSa5pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012962"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:02 -0700
X-CSE-ConnectionGUID: yK9cZ4jKTB+hjJmUdadIHQ==
X-CSE-MsgGUID: CNfBEUVPTFKdXxruSjVwsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423705"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:18:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 02/10] drm/tilcdc: Allow build with COMPILE_TEST=y
Date: Thu,  3 Oct 2024 14:18:43 +0300
Message-ID: <20241003111851.10453-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
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

Allow tilcdc to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/tilcdc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index 24f9a245ba59..c430914b1db7 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_TILCDC
 	tristate "DRM Support for TI LCDC Display Controller"
-	depends on DRM && OF && ARM
+	depends on DRM && OF && (ARM || COMPILE_TEST)
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-- 
2.45.2

