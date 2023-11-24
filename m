Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542647F741C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD8110E1F2;
	Fri, 24 Nov 2023 12:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C3F10E1E8;
 Fri, 24 Nov 2023 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829871; x=1732365871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7NkDBGXQDWjcPyDigGVHeuccBWYT+ZSkzRBCwJOLuQ=;
 b=lRyJ7VzEU+B7RVHHwdQpzM9meMdWclBBImLq4nNFa6CuLraPVxejHtjr
 vIclB8jBNcr0LeTja/2WT4C5eD8Nt73/rmeRrtDbUpailqTvpmXne8zhA
 AwfHVVOE656MlChKTbyV9ux364f5A50Ncd2epkg9K6Mirv/LTJZPZmz2k
 aw9bHvhblzTHcP2AzzcTQuiNWwqQYr6nvaF6VeBtRmNu40vDVcLsmmKQf
 QTpH1eyZ0efZEKJkTh6A6CKGIDcAjLhVl0x8oyKYQG7SIJiRvdCSART5b
 aBIbhq5zLoNKSUm3OcmM2y1VpmxcaFEJOgLy4VywkLXsP59ohwVaYXHip A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396322612"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="396322612"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="891057752"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="891057752"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/mode: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
Date: Fri, 24 Nov 2023 14:43:59 +0200
Message-Id: <d1ddaa6d85c267830326944fa7906031f8551f45.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1700829750.git.jani.nikula@intel.com>
References: <cover.1700829750.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
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

