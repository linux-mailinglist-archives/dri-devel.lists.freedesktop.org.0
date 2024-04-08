Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDF89CA60
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9461128C5;
	Mon,  8 Apr 2024 17:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzOC2Zkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B117112899
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595928; x=1744131928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhiDihza+7uwNjOZ56tcAehORrjI4q86teVEuxNknUw=;
 b=BzOC2ZkmtPfOOGD4HiHBfKnObmRRcwd7s6QlT1BTUaOWokMr7FbKjQeh
 gD7btyOEb5m+dVayy9/5VcmEshAgHz2AtvJZWNEnMQLvGZiwIWd6kZ3Sa
 v6tI+GlHmCw+0Ou6CY3Rr8043ElKQ65E/HWH5hgZEqjN06H9GFYnDHTob
 T34xLtovYq0jfVh9YqUv8Wmg+HuEoha5tRza8M+PAxC8fFERZhche0+P7
 EeG7CbI1BvC3qNam2de7iBIUvoUJT2fyJsrxo/h/TppALcHUb6z4UP+bK
 pWM0BZZQUVuRm2hBIfb1+45VifR2x1EAx10nc4NjOfhGJOYRR+W74Q6Sz Q==;
X-CSE-ConnectionGUID: EGSm1aCCSLa0ZsRoDFVocQ==
X-CSE-MsgGUID: tAT7vQzvT/+oq6MOX0VKjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793474"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792341"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792341"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@nxp.com>
Subject: [PATCH 17/21] drm/fsl-dcu: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:22 +0300
Message-ID: <20240408170426.9285-18-ville.syrjala@linux.intel.com>
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

Allow fsl-dcu to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/fsl-dcu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index 5ca71ef87325..9c9954a5e9bc 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_FSL_DCU
 	tristate "DRM Support for Freescale DCU"
-	depends on DRM && OF && ARM && COMMON_CLK
+	depends on DRM && OF && (ARM || COMPILE_TEST) && COMMON_CLK
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
-- 
2.43.2

