Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705982EF6C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE09710E55A;
	Tue, 16 Jan 2024 13:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A08510E55E;
 Tue, 16 Jan 2024 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410501; x=1736946501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7NkDBGXQDWjcPyDigGVHeuccBWYT+ZSkzRBCwJOLuQ=;
 b=Rx4Z2Hw/8huRM3cBRMcJ8OJslzKU6jkCn3ZIyHlFWyrsXLlulvPTWd5N
 ouL8td53uRZ+zQPhe0CzHOqMQYJFQca6knbqVGDnqBYL7XpPfjp7pX6Rd
 rzAdYCDAA1D5DoBV45E7n0XHV9TlPZ3KTId8upk7sZKSueyd/B5G+EmdD
 UXHIudpSsXt0JQnZrzLBLZ42avoaLwuB/Mxp8NoNaYZnuQ7soycZnMUnA
 mvQ2MKecLiO0qsM11Lk9WXl8LEBsxaAlq2f+RfyC75DTQwMfZV8XrNggc
 Vy0Qd9ojroogtFzp07njY/AiPz6mXZy2OjEqq0Xr+zQ2mT4RUft+Vgw3D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="6949559"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6949559"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="777047220"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="777047220"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] drm/mode: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
Date: Tue, 16 Jan 2024 15:07:30 +0200
Message-Id: <56f6f3e8e045206706d7a292968b6b2f4fc19c27.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the device specific debug printer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 8525ef851540..48fd2d67f352 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -544,7 +544,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 	 */
 	WARN_ON(!list_empty(&dev->mode_config.fb_list));
 	list_for_each_entry_safe(fb, fbt, &dev->mode_config.fb_list, head) {
-		struct drm_printer p = drm_debug_printer("[leaked fb]");
+		struct drm_printer p = drm_dbg_printer(dev, DRM_UT_KMS, "[leaked fb]");
 
 		drm_printf(&p, "framebuffer[%u]:\n", fb->base.id);
 		drm_framebuffer_print_info(&p, 1, fb);
-- 
2.39.2

