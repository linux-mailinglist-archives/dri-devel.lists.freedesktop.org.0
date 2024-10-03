Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC498EDF6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3B10E809;
	Thu,  3 Oct 2024 11:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ah5L6ALJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B978210E805
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954360; x=1759490360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySq/9uQn/5WzOM2QEq408qaJeClR5Me22xI2e6vEv3s=;
 b=Ah5L6ALJ9jHEK67Vgqi4hNHLx10LNCcfSTvUNYPXlt3NiK3/tZSNG1B6
 3wdXDywEPg3fs2iaJhIc/sLVTDAu1AMpxHDjUE0XngGtsIAaJ2zPlctpB
 CLyd0dAaAC61cHiF7UcxOYtb9hMFZqSQvhPAeUzhpjaHc/DluY7WKVek/
 S93eJwCFKlk95zG3CzlOnA8fDYoH5j66u0JvBhAbFM9veTC+isDV0RB8k
 HtbJAmYFk4IzrIs00g9RzWhDqIbBnsgCaZ7mHooLJQc0ODluJVZVDOy8e
 6DMcnnUVuKrHeG6oodssu2L3tdNc0fuI0Mh6S/aPsuv0lEUl79FKbvo03 Q==;
X-CSE-ConnectionGUID: 4rqK7XCJTLSDfM0BTLa+dg==
X-CSE-MsgGUID: PeoQMj9vRt20Ry+WlvLt2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012995"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:20 -0700
X-CSE-ConnectionGUID: /hs9JLRITBSyYdPnl4zv8A==
X-CSE-MsgGUID: 6kCFg3u3R9aJNkFUxNX8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423805"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:19:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@nxp.com>
Subject: [PATCH v2 08/10] drm/fsl-dcu: Allow build with COMPILE_TEST=y
Date: Thu,  3 Oct 2024 14:18:49 +0300
Message-ID: <20241003111851.10453-9-ville.syrjala@linux.intel.com>
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

Allow fsl-dcu to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/fsl-dcu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index 588ce2420af2..4226e54f94c6 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_FSL_DCU
 	tristate "DRM Support for Freescale DCU"
-	depends on DRM && OF && ARM && COMMON_CLK
+	depends on DRM && OF && (ARM || COMPILE_TEST) && COMMON_CLK
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
-- 
2.45.2

