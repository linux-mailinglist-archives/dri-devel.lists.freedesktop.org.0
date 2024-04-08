Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E589CA52
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4C81128A4;
	Mon,  8 Apr 2024 17:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy4+cdoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8071128A0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595908; x=1744131908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33tG9mTNIWWrYtpbKkB4oRy2Z27N6J4EvNBTBZG4nHU=;
 b=Oy4+cdoBAuLfQ6uTkBRNYTVL7+whR9YJi8kn4xATnQ6qfrZe5VJxOd9b
 9W6ndSyLt2h11Up9/QSflLczswuLL66YVm39o283Te3CrBKL+ZqejIOdZ
 7C0cD7A15mAyvQLGCMUjvvYtFnNi3HrCxjPqwJ1iLyglirZDSXxDLACbJ
 /J4mQQuNVifZK5jyz9nJvpmdRrs0UGHZtmQvibwOAlUMK2RQW2XyyaoLY
 zubX0T7jQ/4fRIFXVyIBxjP7/vRRBOQss/SQuAMgAL/b53yt2yoqm0seq
 p7v+PwdS7IWvjOZiuGCT/HxdhyNNH2XrB2uDlOm25CBt+OchJ/quNBHdO w==;
X-CSE-ConnectionGUID: C5/1mcN7Q8uBOXHuwENIwg==
X-CSE-MsgGUID: vtFg+KB8SRuUMFLVyf6qog==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793426"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793426"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792335"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792335"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:03 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: [PATCH 11/21] drm/hisilicon/kirin: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:16 +0300
Message-ID: <20240408170426.9285-12-ville.syrjala@linux.intel.com>
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

Allow kirin to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/hisilicon/kirin/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/Kconfig b/drivers/gpu/drm/hisilicon/kirin/Kconfig
index c5265675bf0c..0772f79567ef 100644
--- a/drivers/gpu/drm/hisilicon/kirin/Kconfig
+++ b/drivers/gpu/drm/hisilicon/kirin/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_HISI_KIRIN
 	tristate "DRM Support for Hisilicon Kirin series SoCs Platform"
-	depends on DRM && OF && ARM64
+	depends on DRM && OF && (ARM64 || COMPILE_TEST)
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DSI
-- 
2.43.2

