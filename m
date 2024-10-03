Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB498EDF0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC5910E806;
	Thu,  3 Oct 2024 11:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToM+yNx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6156810E805
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954351; x=1759490351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sDN1B3+8eCTn8UdE1PuRscDjA8/jdTqpcVEkaYnt/GI=;
 b=ToM+yNx+4HcJiWgP2mhDx+qCO+ZENBlJEZkSdcsjUt2uZg2wgcC5udAY
 QCFYFPJIt/OofumYcQDaW9oxakxuCROpJnP4rI0x++9NvMrwO2XdOl+Pn
 2hqH424qr1ckjt0xUsMpESZrACHZm8Z9Ijx9WFE7EF+pqmZ2uRqpVnwik
 0ZR9f7MjimVLUJzw20/ddeC10NPY3n+7jn9WI0gJ+lJFJk7OEGgUvj3l7
 XW/LwYaBD2vxPvENULZTwLark7YuXuz+zrBxnm7Vfv5X+13+xrw4MKqVn
 h8AqEL+BF4QO22YtUiuu0RDhmr0BEihNwzS9JiHPhlx/j1kGd7lbF3MdJ w==;
X-CSE-ConnectionGUID: D3d2K+BEQqGOkypChrXMHA==
X-CSE-MsgGUID: tpDkmQTdSzSfdch/gWo2ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012975"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012975"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:11 -0700
X-CSE-ConnectionGUID: 2jn9CGDnTdGlhtIMzUp8vQ==
X-CSE-MsgGUID: SfE4Dv0dQ0GDB/UJYiVWGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423759"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:19:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 05/10] drm/armada: Allow build with COMPILE_TEST=y
Date: Thu,  3 Oct 2024 14:18:46 +0300
Message-ID: <20241003111851.10453-6-ville.syrjala@linux.intel.com>
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

Allow armada to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/armada/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
index b22c891a670b..1376337548da 100644
--- a/drivers/gpu/drm/armada/Kconfig
+++ b/drivers/gpu/drm/armada/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ARMADA
 	tristate "DRM support for Marvell Armada SoCs"
-	depends on DRM && HAVE_CLK && ARM && MMU
+	depends on DRM && HAVE_CLK && MMU && (ARM || COMPILE_TEST)
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
-- 
2.45.2

