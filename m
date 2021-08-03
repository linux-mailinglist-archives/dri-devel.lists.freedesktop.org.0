Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC913DF73E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F4F6E117;
	Tue,  3 Aug 2021 22:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCBA6E117
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 22:05:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="277558133"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="277558133"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:05:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="585154084"
Received: from tdpeach-mobl.amr.corp.intel.com (HELO achrisan-desk3.intel.com)
 ([10.212.91.220])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:05:57 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH v2 8/8] drm/kmb: Enable support for fbcon (framebuffer console)
Date: Tue,  3 Aug 2021 15:04:52 -0700
Message-Id: <20210803220452.52379-8-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
References: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
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

From: Edmund Dea <edmund.j.dea@intel.com>

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
index bb7eca9e13ae..b4c29ae297c8 100644
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
 #include <drm/drm_irq.h>
@@ -25,6 +27,12 @@
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
@@ -545,6 +553,9 @@ static int kmb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_register;
 
+	if (console)
+		drm_fbdev_generic_setup(&kmb->drm, 32);
+
 	return 0;
 
  err_register:
-- 
2.25.1

