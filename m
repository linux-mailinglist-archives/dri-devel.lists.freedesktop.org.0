Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4120A8471D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0862410E9E6;
	Thu, 10 Apr 2025 14:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwbQaDah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1167110E9E6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744297155; x=1775833155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySA7GXGFZOZZ4YpKfk7lLGBIB5XGeGk00QsR2nkU+m8=;
 b=SwbQaDahBfYp8+9w0uZkC6lr5o0Q5n/FXNcBUbRyx4WFkXhdI/i0a4PK
 rcKS1/1PLrOweqtq4BmzZhDPmJ8z0SE0b0iOL4iS8lIAy4j1xS08CKdaV
 zV3lDuICOc7eBr/sTtEfxZX6aXBnQ1BE/vG1Wht0L7Hhyrxdl9DRNXRFT
 363gWaACUjDg6+bI4Da7Qlior5q+6tEfmEuU9NzIkgmIqjOEd5i2388mS
 ELInLSs+svSEsvCIB2ZeaquRLdFmuFMzjXkgSLJaM0MebahEWoO2IUgXB
 z2J6Dpb+WRLstr2181qnWz8Y9AW73UdfaZ9Oqegi9V3B1q/TP2zCmbdkO Q==;
X-CSE-ConnectionGUID: V/vFAcS3QCuRV1nCNfo9Kw==
X-CSE-MsgGUID: LYNTaao6Qpubaxt4K6Iftw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71208138"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71208138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:59:14 -0700
X-CSE-ConnectionGUID: al5zttqSRtapjorgHNSgeQ==
X-CSE-MsgGUID: +ykXOIbJSGm6iPY2L/ZJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134101986"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 07:59:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 17:59:11 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 2/6] drm/tilcdc: Allow build with COMPILE_TEST=y
Date: Thu, 10 Apr 2025 17:59:00 +0300
Message-ID: <20250410145904.25550-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
References: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
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
2.49.0

