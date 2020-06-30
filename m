Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE120FF04
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658716E462;
	Tue, 30 Jun 2020 21:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47CF6E329;
 Tue, 30 Jun 2020 21:28:42 +0000 (UTC)
IronPort-SDR: f8zkzdLlMwqL8xzKHuqzYMxfZj7fuSZteX1IDWCDmZgxXUrlY8ngU9Q1pXcPWzK2u2GiexudNL
 /qjcygALPNKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="144554736"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="144554736"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:42 -0700
IronPort-SDR: laqI+khfFrzXlbMRHWrANovoXKoT87bE33ausnOCWRczmvCebfEUk3IVXwNPN9t5VNVA/HsGF9
 Sp6dOUdVygVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066689"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:42 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 20/59] drm/kmb: Register IRQ for LCD
Date: Tue, 30 Jun 2020 14:27:32 -0700
Message-Id: <1593552491-23698-21-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code is commented out until firmware is updated to
redirect LCD IRQ from MSSCPU to A53.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index a94d387..d35f1b2 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -48,12 +48,16 @@
 #include "kmb_plane.h"
 #include "kmb_dsi.h"
 
+/*IRQ handler*/
+static irqreturn_t kmb_isr(int irq, void *arg);
+
 static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
 	struct kmb_drm_private *dev_p = drm->dev_private;
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	/*struct resource *res;*/
 	/*u32 version;*/
+	/*int irq_lcd, irq_mipi; */
 	int ret;
 
 	/* TBD - not sure if clock_get needs to be called here */
@@ -104,6 +108,12 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	dev_p->msscam_mmio = ioremap_cache(MSS_CAM_BASE_ADDR,
 			MSS_CAM_MMIO_SIZE);
 
+	/*TODO - register irqs here - section 17.3 in databook
+	 * lists LCD at 79 under MSS CPU - firmware has to redirect it to A53
+	 * May be 33 for LCD and 34 for MIPI? Will wait till firmware
+	 * finalizes the IRQ numbers for redirection
+	 */
+
 /*TBD read and check for correct product version here */
 
 	/* Get the optional framebuffer memory resource */
@@ -151,7 +161,7 @@ static void kmb_setup_mode_config(struct drm_device *drm)
 	drm->mode_config.funcs = &kmb_mode_config_funcs;
 }
 
-static irqreturn_t kmb_irq(int irq, void *arg)
+static irqreturn_t kmb_isr(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
 	unsigned long status, val;
@@ -196,8 +206,9 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver kmb_driver = {
 	.driver_features = DRIVER_HAVE_IRQ | DRIVER_GEM |
-	    DRIVER_MODESET | DRIVER_ATOMIC,
-	.irq_handler = kmb_irq,
+			DRIVER_MODESET |
+			DRIVER_ATOMIC,
+	.irq_handler = kmb_isr,
 	.irq_preinstall = kmb_irq_reset,
 	.irq_uninstall = kmb_irq_reset,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
