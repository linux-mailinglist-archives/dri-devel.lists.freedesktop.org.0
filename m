Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A2F4341E7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 01:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490A889EA6;
	Tue, 19 Oct 2021 23:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2054489DFE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 23:07:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228919191"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="228919191"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 16:07:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="662017404"
Received: from csha-mobl1.amr.corp.intel.com (HELO achrisan-desk3.intel.com)
 ([10.212.27.111])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 16:07:54 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Cc: sam@ravnborg.org,
	edmund.j.dea@intel.com,
	tzimmermann@suse.de
Subject: [PATCH v4 2/2] drm/kmb: Enable support for framebuffer console
Date: Tue, 19 Oct 2021 16:07:19 -0700
Message-Id: <20211019230719.789958-2-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019230719.789958-1-anitha.chrisanthus@intel.com>
References: <20211019230719.789958-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
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

Enable support for fbcon (framebuffer console).

v2: added missing static clk_enable
v3: removed module parameter, use fbdev_emulation instead. Use
preferred depth of 24 for color depth. (Thomas Z.)

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 12ce669650cc..19621535043b 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -176,6 +177,7 @@ static int kmb_setup_mode_config(struct drm_device *drm)
 	drm->mode_config.min_height = KMB_FB_MIN_HEIGHT;
 	drm->mode_config.max_width = KMB_FB_MAX_WIDTH;
 	drm->mode_config.max_height = KMB_FB_MAX_HEIGHT;
+	drm->mode_config.preferred_depth = 24;
 	drm->mode_config.funcs = &kmb_mode_config_funcs;
 
 	ret = kmb_setup_crtc(drm);
@@ -559,6 +561,8 @@ static int kmb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_register;
 
+	drm_fbdev_generic_setup(&kmb->drm, 0);
+
 	return 0;
 
  err_register:
-- 
2.25.1

