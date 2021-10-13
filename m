Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0242CF3F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 01:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090286E891;
	Wed, 13 Oct 2021 23:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520196E891
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 23:37:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214719605"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214719605"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="659744008"
Received: from thollida-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.111.141])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:37:29 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Cc: sam@ravnborg.org,
	edmund.j.dea@intel.com
Subject: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
Date: Wed, 13 Oct 2021 16:36:32 -0700
Message-Id: <20211013233632.471892-7-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
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
The user can initialize fbcon by loading kmb-drm with the parameter
console=1.

v2: added missing static clk_enable

Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 961ac6fb5fcf..b4e66eac63b5 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
@@ -15,6 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -24,6 +26,12 @@
 #include "kmb_dsi.h"
 #include "kmb_regs.h"
 
+/* Module Parameters */
+static bool console;
+module_param(console, bool, 0400);
+MODULE_PARM_DESC(console,
+		 "Enable framebuffer console support (0=disable [default], 1=on)");
+
 static int kmb_display_clk_enable(struct kmb_drm_private *kmb)
 {
 	int ret = 0;
@@ -559,6 +567,9 @@ static int kmb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_register;
 
+	if (console)
+		drm_fbdev_generic_setup(&kmb->drm, 32);
+
 	return 0;
 
  err_register:
-- 
2.25.1

