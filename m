Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D0621FF65
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2D96EA09;
	Tue, 14 Jul 2020 20:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC006E99B;
 Tue, 14 Jul 2020 20:58:28 +0000 (UTC)
IronPort-SDR: X/3tp0tfRx6Lgio3st4RAiDS94RTBn06FGD/b4M6FfEYcBsRPAHfJCeGnSxKRScQn4AGvhi3Oo
 YNVYQ5sgVKWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444566"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444566"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:28 -0700
IronPort-SDR: 5EJif/oeXdox4415fjW4qphtC0+QMOY8QMcWQDNhWlAxBtsUxpYa/8zSE4UhTGKMdTB6nIQRXA
 tZq+5gBIfNnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504133"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:28 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 20/59] drm/kmb: Register IRQ for LCD
Date: Tue, 14 Jul 2020 13:57:06 -0700
Message-Id: <1594760265-11618-21-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
index 5192040..594e64c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -29,12 +29,16 @@
 #include "kmb_plane.h"
 #include "kmb_regs.h"
 
+/*IRQ handler*/
+static irqreturn_t kmb_isr(int irq, void *arg);
+
 static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
 	struct kmb_drm_private *dev_p = to_kmb(drm);
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	/*struct resource *res;*/
 	/*u32 version;*/
+	/*int irq_lcd, irq_mipi; */
 	int ret;
 
 	/* TBD - not sure if clock_get needs to be called here */
@@ -85,6 +89,12 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
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
@@ -132,7 +142,7 @@ static void kmb_setup_mode_config(struct drm_device *drm)
 	drm->mode_config.funcs = &kmb_mode_config_funcs;
 }
 
-static irqreturn_t kmb_irq(int irq, void *arg)
+static irqreturn_t kmb_isr(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
 	unsigned long status, val;
@@ -178,8 +188,9 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver kmb_driver = {
 	.driver_features = DRIVER_GEM |
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
