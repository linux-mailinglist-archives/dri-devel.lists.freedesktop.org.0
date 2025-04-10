Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F766A84723
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD610E9EB;
	Thu, 10 Apr 2025 14:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEhKC5zV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CEB10E9E9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744297167; x=1775833167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NJSZWsxdLLa41psvZHWcp3PprADyxKkAB5AnEgkvilA=;
 b=iEhKC5zVI7tAP9f9g0JPkL9qXeN/bz05x4hel65w+s64wA7j+7XkvI5A
 krJLzGlprUBBi5N+h0D1IFjLjlw822+JO6I8ju2sc1MOx16qzsinWVJ5/
 Nf9DhJWNxj45M8f8J9Tt89a2hLhdNcmQjll9Ia6apV3Lpx9X7JffSDPKV
 9QE6m82Zsgj9zf3mTCy3bOAOdtTUEB3kLStNr3JheGz1fLyYjfCJDmjRw
 7d203ZBjRERzN6cfSmO8MdwAtAE4BGmy2y0HheI43UWrCAVd8hlxyxlzm
 n4pp3qFOKhN2DL5ib/m3Wgk7td7ZbbxDlkYwYekzOFsL57GZ/eeVzEVLY w==;
X-CSE-ConnectionGUID: Eif4AD+4S0SKnljWWeenog==
X-CSE-MsgGUID: MrF+EWpEQp+jiCvgIsmUQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71208169"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71208169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:59:27 -0700
X-CSE-ConnectionGUID: M3jOCorFRey7HodAQ9Owpw==
X-CSE-MsgGUID: 7UE//3VLQ5ODx5Rh8bhrZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134102004"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 07:59:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 17:59:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@nxp.com>
Subject: [PATCH v3 6/6] drm/fsl-dcu: Allow build with COMPILE_TEST=y
Date: Thu, 10 Apr 2025 17:59:04 +0300
Message-ID: <20250410145904.25550-7-ville.syrjala@linux.intel.com>
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

Allow fsl-dcu to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/fsl-dcu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index 0e0f910ceb9f..ef7fd7fc9fd6 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_FSL_DCU
 	tristate "DRM Support for Freescale DCU"
-	depends on DRM && OF && ARM && COMMON_CLK
+	depends on DRM && OF && COMMON_CLK && (ARM || COMPILE_TEST)
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
-- 
2.49.0

