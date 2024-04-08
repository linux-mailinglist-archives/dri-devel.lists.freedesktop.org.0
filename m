Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9284D89CA58
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC5F1128C0;
	Mon,  8 Apr 2024 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg8vQdJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62171128C7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595931; x=1744131931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s41Sdv2GSjV1+VTAar/7MoJTxXLUIFIvIg2/MmK9lDo=;
 b=Xg8vQdJ/Ey9NuFXJQt9lTKL9V102mcY93w0JPccwZcO2/rQcPttVrvMz
 rD/Xny/jN5VeoVBwCWcIEIJfb6VXcrea96LRxySzrSkhQo56438tsuBqu
 tH5oiGlmGhpzzacHlb7/qldAcOU8Tsv2l4D4EyqmwhwujJnlMksX2LMHo
 wx3PtpqcBbP539Jlu5ClwO0wWsbO6YMoJJ2ORYc/Llebffht+KpovrLfG
 BbSbtjQfAlRoqEUbHOmVrt0Mi4PB/o9+YagMwLbuF2ArZYR57FpV8n3Jv
 aPXIahU5QAkfO0CieQqw2FI9CBOfGdJKP86jdE5bGoE7VQmWhaW1hcn7s g==;
X-CSE-ConnectionGUID: YZLo78rSTQqS+kAB2HZa9Q==
X-CSE-MsgGUID: icsnZVsiR8So9ZbErVOV8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793480"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793480"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792342"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792342"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org
Subject: [PATCH 18/21] drm/mediatek: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:23 +0300
Message-ID: <20240408170426.9285-19-ville.syrjala@linux.intel.com>
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

Allow mediatek to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 6caab8d4d4e0..d770936e238b 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -2,9 +2,9 @@
 config DRM_MEDIATEK
 	tristate "DRM Support for Mediatek SoCs"
 	depends on DRM
-	depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
+	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	depends on COMMON_CLK
-	depends on HAVE_ARM_SMCCC
+	depends on HAVE_ARM_SMCCC || COMPILE_TEST
 	depends on OF
 	depends on MTK_MMSYS
 	select DRM_KMS_HELPER
-- 
2.43.2

