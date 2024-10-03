Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE698EDF7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65910E80A;
	Thu,  3 Oct 2024 11:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRiOZAtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D4110E80A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954364; x=1759490364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4FuzTyDGreS0szixpBegUWK/7yzbqINFYrMt9HjXBE=;
 b=KRiOZAtXQ3jw5/MP4jgV3ZV4agXwPG2tsfFSZidLobZrko4jQhH/20iy
 0D1MYm42iz2AwnV5+Rz+fSaLkc0By18VOWvrIR4PdpnMajThO/5yizxFN
 gUZch5Lf6dKT5QDe4lta05Ildd0jRXXooEL1UeiGTuImB6sWyMZ7no3wy
 jyzaD7LPv/vWboSNbrBNLN+DO+Ze31Q1BsgSRDzEtonPnLiIGH6ndzpsD
 d0DR1Ms8QlGsvZsOQ/8QwGtb0DUsWIYEX3s8V2qQMLtDH1ARy1OZyIaOx
 PR+8wWeiJLEfx4Bz0GZR88oFIz3uNsqSnXEJAbpT6FNjuzZl6ry2BSaoE g==;
X-CSE-ConnectionGUID: VlQzq9sYTBepL1nKYT4HAw==
X-CSE-MsgGUID: Ambt8xXSR52b0j7VaRlNVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27013023"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27013023"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:23 -0700
X-CSE-ConnectionGUID: n+jyGRUXQiylc0o9f28Znw==
X-CSE-MsgGUID: pL+u723oSLui50F3+/MfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423820"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:19:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Date: Thu,  3 Oct 2024 14:18:50 +0300
Message-ID: <20241003111851.10453-10-ville.syrjala@linux.intel.com>
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
index 3d2436272ff2..2e0e7c4079b6 100644
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
 	select DRM_CLIENT_SELECTION
-- 
2.45.2

