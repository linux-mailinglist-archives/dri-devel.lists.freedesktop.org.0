Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426AE21FF4B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC87D6E9E1;
	Tue, 14 Jul 2020 20:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935B56E990;
 Tue, 14 Jul 2020 20:58:31 +0000 (UTC)
IronPort-SDR: ArAIDKSsmhR/4PX+iaNudT5H2t5scwVWQUQz8zQ+0KRFUGpa9I+70YeRfSg/tJJDpNQFHhNBGn
 993GnVcWP59w==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444573"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444573"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:31 -0700
IronPort-SDR: qN29doMP908wZxei9vfmQ+rAWEvi9rqEbEanEhOaRViK7bswPELfT1WjlPfH1MpfN3cQiTVRyq
 4JPAn/W32wig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504165"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:31 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 25/59] drm/kmb: Display clock enable/disable
Date: Tue, 14 Jul 2020 13:57:11 -0700
Message-Id: <1594760265-11618-26-git-send-email-anitha.chrisanthus@intel.com>
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

Get clock info from DT and enable it during initialization.
Also changed name of the driver to "kmb,display" to match other
entries in the DT.

v2: fixed error in clk_disable

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 5a2ff9d..71fdb94 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -32,6 +32,25 @@
 /*IRQ handler*/
 static irqreturn_t kmb_isr(int irq, void *arg);
 
+static struct clk *clk_lcd;
+static struct clk *clk_mipi;
+
+static int kmb_display_clk_enable(void)
+{
+	clk_prepare_enable(clk_lcd);
+	clk_prepare_enable(clk_mipi);
+	return 0;
+}
+
+static int kmb_display_clk_disable(void)
+{
+	if (clk_lcd)
+		clk_disable_unprepare(clk_lcd);
+	if (clk_mipi)
+		clk_disable_unprepare(clk_mipi);
+	return 0;
+}
+
 static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
 	struct kmb_drm_private *dev_p = to_kmb(drm);
@@ -153,6 +172,19 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 
+	/* enable display clocks*/
+	clk_lcd = clk_get(&pdev->dev, "clk_lcd");
+	if (!clk_lcd) {
+		DRM_ERROR("clk_get() failed clk_lcd\n");
+		goto setup_fail;
+	}
+	clk_mipi = clk_get(&pdev->dev, "clk_mipi");
+	if (!clk_mipi) {
+		DRM_ERROR("clk_get() failed clk_mipi\n");
+		goto setup_fail;
+	}
+	kmb_display_clk_enable();
+
 	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
 	if (ret < 0) {
 		DRM_ERROR("failed to install IRQ handler\n");
@@ -382,6 +414,11 @@ static void kmb_drm_unbind(struct device *dev)
 	of_reserved_mem_device_release(drm->dev);
 	drm_mode_config_cleanup(drm);
 
+	/*release clks */
+	kmb_display_clk_disable();
+	clk_put(clk_lcd);
+	clk_put(clk_mipi);
+
 	drm_dev_put(drm);
 	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
@@ -420,8 +457,8 @@ static int kmb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id kmb_of_match[] = {
-	{.compatible = "lcd"},
+static const struct of_device_id  kmb_of_match[] = {
+	{.compatible = "kmb,display"},
 	{},
 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
