Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038889CA57
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0351128B5;
	Mon,  8 Apr 2024 17:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ3dEGnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4741128B5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595915; x=1744131915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hl31EcpbgQXVBK+1wM15hGoj5HP2lntAGHjdnxONf8g=;
 b=DQ3dEGnI83Nqq45bcXeLxe75ITmZH3Y+4F4G1BXUclU97kIGSbsZKCOc
 dsVLkhm1FNzYdDAgD5GstiQQ53NURD8uli5o0NZs/uTLYGC5NE6qZIwwj
 DA/WLXaA6GDYmhsp1l6EFxME+SS0cpGnSBNYvf6qt77haamGUHb64pMOC
 IelPczY5XUBX4Becv6ZZg/czn+RbBDljS9djSDN56+RHlD2F/doqP/BOl
 ZvIbIJ9jjDy2jL4syKvWoqHula5QrzJwVYgD0f9YcFmECmDiF3ATFr5Qo
 XU4L5X/eoGUfpXYIrUjpsqn3cm9VGRTRTb8eQVbT/xtfzxg+/XhLVVUn2 Q==;
X-CSE-ConnectionGUID: u0UV/5brSz+Zs80e1LxgRw==
X-CSE-MsgGUID: JIVnAXtCRXaQY6TbU4FetA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793450"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793450"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792337"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792337"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:11 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 13/21] drm/tilcdc: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:18 +0300
Message-ID: <20240408170426.9285-14-ville.syrjala@linux.intel.com>
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

Allow tilcdc to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/tilcdc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index d3bd2d7a181e..1897ef91c70b 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_TILCDC
 	tristate "DRM Support for TI LCDC Display Controller"
-	depends on DRM && OF && ARM
+	depends on DRM && OF && (ARM || COMPILE_TEST)
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_BRIDGE
-- 
2.43.2

