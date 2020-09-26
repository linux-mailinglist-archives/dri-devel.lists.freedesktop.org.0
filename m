Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8096927A81E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182326E32A;
	Mon, 28 Sep 2020 07:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE426E17B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601139909; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2X8WxJ+5iLQbOvutkSewBQk7CE1YfeGwzy9VSDqe9S0=;
 b=I6rA9dA4uzDSVpT5yQzIJx3IZ0W6D6VZ//7M4OSt1Copvb/41AT3ibrAPVQV0dEaJzXP+l
 AN8G9JV9GoUKJ+cnYo40xBkMtYLSANLE4wQqcIwHwcIU5SqViT/QkRL5N9HvD7tuHutUuQ
 XGyufmenGVWp7QuansaTMAetGFG+bpk=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/7] drm/ingenic: Reset pixclock rate when parent clock
 rate changes
Date: Sat, 26 Sep 2020 19:04:55 +0200
Message-Id: <20200926170501.1109197-2-paul@crapouillou.net>
In-Reply-To: <20200926170501.1109197-1-paul@crapouillou.net>
References: <20200926170501.1109197-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Old Ingenic SoCs can overclock very well, up to +50% of their nominal
clock rate, whithout requiring overvolting or anything like that, just
by changing the rate of the main PLL. Unfortunately, all clocks on the
system are derived from that PLL, and when the PLL rate is updated, so
is our pixel clock.

To counter that issue, we make sure that the panel is in VBLANK before
the rate change happens, and we will then re-set the pixel clock rate
afterwards, once the PLL has been changed, to be as close as possible to
the pixel rate requested by the encoder.

v2: Add comment about mutex usage

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 61 ++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 937d080f5d06..eadfe3a20bf1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -12,6 +12,7 @@
 #include <linux/dma-noncoherent.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -71,6 +72,21 @@ struct ingenic_drm {
 
 	bool panel_is_sharp;
 	bool no_vblank;
+
+	/*
+	 * clk_mutex is used to synchronize the pixel clock rate update with
+	 * the VBLANK. When the pixel clock's parent clock needs to be updated,
+	 * clock_nb's notifier function will lock the mutex, then wait until the
+	 * next VBLANK. At that point, the parent clock's rate can be updated,
+	 * and the mutex is then unlocked. If an atomic commit happens in the
+	 * meantime, it will lock on the mutex, effectively waiting until the
+	 * clock update process finishes. Finally, the pixel clock's rate will
+	 * be recomputed when the mutex has been released, in the pending atomic
+	 * commit, or a future one.
+	 */
+	struct mutex clk_mutex;
+	bool update_clk_rate;
+	struct notifier_block clock_nb;
 };
 
 static const u32 ingenic_drm_primary_formats[] = {
@@ -119,6 +135,29 @@ static inline struct ingenic_drm *drm_crtc_get_priv(struct drm_crtc *crtc)
 	return container_of(crtc, struct ingenic_drm, crtc);
 }
 
+static inline struct ingenic_drm *drm_nb_get_priv(struct notifier_block *nb)
+{
+	return container_of(nb, struct ingenic_drm, clock_nb);
+}
+
+static int ingenic_drm_update_pixclk(struct notifier_block *nb,
+				     unsigned long action,
+				     void *data)
+{
+	struct ingenic_drm *priv = drm_nb_get_priv(nb);
+
+	switch (action) {
+	case PRE_RATE_CHANGE:
+		mutex_lock(&priv->clk_mutex);
+		priv->update_clk_rate = true;
+		drm_crtc_wait_one_vblank(&priv->crtc);
+		return NOTIFY_OK;
+	default:
+		mutex_unlock(&priv->clk_mutex);
+		return NOTIFY_OK;
+	}
+}
+
 static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_crtc_state *state)
 {
@@ -284,8 +323,14 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	if (drm_atomic_crtc_needs_modeset(state)) {
 		ingenic_drm_crtc_update_timings(priv, &state->mode);
+		priv->update_clk_rate = true;
+	}
 
+	if (priv->update_clk_rate) {
+		mutex_lock(&priv->clk_mutex);
 		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
+		priv->update_clk_rate = false;
+		mutex_unlock(&priv->clk_mutex);
 	}
 
 	if (event) {
@@ -1044,16 +1089,28 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	if (soc_info->has_osd)
 		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
 
+	mutex_init(&priv->clk_mutex);
+	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
+
+	parent_clk = clk_get_parent(priv->pix_clk);
+	ret = clk_notifier_register(parent_clk, &priv->clock_nb);
+	if (ret) {
+		dev_err(dev, "Unable to register clock notifier\n");
+		goto err_devclk_disable;
+	}
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register DRM driver\n");
-		goto err_devclk_disable;
+		goto err_clk_notifier_unregister;
 	}
 
 	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
 
+err_clk_notifier_unregister:
+	clk_notifier_unregister(parent_clk, &priv->clock_nb);
 err_devclk_disable:
 	if (priv->lcd_clk)
 		clk_disable_unprepare(priv->lcd_clk);
@@ -1075,7 +1132,9 @@ static int compare_of(struct device *dev, void *data)
 static void ingenic_drm_unbind(struct device *dev)
 {
 	struct ingenic_drm *priv = dev_get_drvdata(dev);
+	struct clk *parent_clk = clk_get_parent(priv->pix_clk);
 
+	clk_notifier_unregister(parent_clk, &priv->clock_nb);
 	if (priv->lcd_clk)
 		clk_disable_unprepare(priv->lcd_clk);
 	clk_disable_unprepare(priv->pix_clk);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
