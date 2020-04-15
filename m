Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7D1A94C2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6666E8CC;
	Wed, 15 Apr 2020 07:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09666E8A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a81so17655503wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0vd0kKcbNJN+Z0a3PfFzYtncebg2DKTzv5SbKCkuxcU=;
 b=FZSeV2QjUXm1SuGZu8jHT+WoZ3Olg6fPW1Q1usQpHVePHw5GyVKRDihwNUJJWNYYXX
 14jrvJZ1EbuEPrMKT4Zl163fALdHeftgXiRcW27s203ApqfDH50OpBXo7WitMcPszVYG
 Xmfu+qCztQF6efdJb17S3Q7CQ4zuK6PQpbjhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vd0kKcbNJN+Z0a3PfFzYtncebg2DKTzv5SbKCkuxcU=;
 b=E8mkckAnpzFKHJpkS0xlk/4gSC+JS4Xzt58E2n9TuCYAuL+Eoy2Rl1I0avI2+qM1hx
 /ndua7G0iDprpVvuadH8ykgcCa0dB5t77YUE19R9raqWhNJeP7mM0QrGpoEqGnP1em5k
 o0r0IYlet5fG33fRfVS4EsxudrYvG3Ki9TnaNVstVBynTDlWPV3gMryYEFruAhcFqoOk
 1ROLGyYXHTtwqD95SWJbBc9tHe8Xuyak64cmEH6DaSzO2xTfCIONoJTsJHVCvApWe39h
 KEUHHER5rckrC/sUWnHgrYWFvwOEjWZ5D3a2ytXo9JkchPntJgOMKOoxh6+ksRpdTICm
 fNeQ==
X-Gm-Message-State: AGi0PubarDsMq/ivur8aNcJq+5sX+T/e4F6nb+sYywAiUustbMUaK4BP
 TGPhX19511ZlgsEnMNWxwh+Y0Q==
X-Google-Smtp-Source: APiQypL+Zv7L2UFEE7NtZRANz0lASf+2xrhgNoDekGIA1AkhR3TLGCGG2ndupJAJMyQeJ1izbPXFYQ==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr4036153wml.105.1586936471331; 
 Wed, 15 Apr 2020 00:41:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 29/59] drm/mcde: Don't use drm_device->dev_private
Date: Wed, 15 Apr 2020 09:40:04 +0200
Message-Id: <20200415074034.175360-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

v2: Move misplaced removal of double-assignment to this patch (Sam)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org> (v1)
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 10 +++++-----
 drivers/gpu/drm/mcde/mcde_drm.h     |  2 ++
 drivers/gpu/drm/mcde/mcde_drv.c     |  6 ++----
 drivers/gpu/drm/mcde/mcde_dsi.c     |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index e59907e68854..04e1d38d41f7 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -948,7 +948,7 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
 
 	drm_crtc_vblank_off(crtc);
@@ -1020,7 +1020,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event = crtc->state->event;
 	struct drm_plane *plane = &pipe->plane;
 	struct drm_plane_state *pstate = plane->state;
@@ -1078,7 +1078,7 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 	u32 val;
 
 	/* Enable all VBLANK IRQs */
@@ -1097,7 +1097,7 @@ static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 
 	/* Disable all VBLANK IRQs */
 	writel(0, mcde->regs + MCDE_IMSCPP);
@@ -1117,7 +1117,7 @@ static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
 
 int mcde_display_init(struct drm_device *drm)
 {
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 	int ret;
 	static const u32 formats[] = {
 		DRM_FORMAT_ARGB8888,
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index 80edd6628979..679c2c4e6d9d 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -34,6 +34,8 @@ struct mcde {
 	struct regulator *vana;
 };
 
+#define to_mcde(dev) container_of(dev, struct mcde, drm)
+
 bool mcde_dsi_irq(struct mipi_dsi_device *mdsi);
 void mcde_dsi_te_request(struct mipi_dsi_device *mdsi);
 extern struct platform_driver mcde_dsi_driver;
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 22003478db2c..84f3e2dbd77b 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -164,7 +164,7 @@ static irqreturn_t mcde_irq(int irq, void *data)
 static int mcde_modeset_init(struct drm_device *drm)
 {
 	struct drm_mode_config *mode_config;
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 	int ret;
 
 	if (!mcde->bridge) {
@@ -311,13 +311,11 @@ static int mcde_probe(struct platform_device *pdev)
 	if (IS_ERR(mcde))
 		return PTR_ERR(mcde);
 	drm = &mcde->drm;
-	drm->dev_private = mcde;
 	mcde->dev = dev;
 	platform_set_drvdata(pdev, drm);
 
 	/* Enable continuous updates: this is what Linux' framebuffer expects */
 	mcde->oneshot_mode = false;
-	drm->dev_private = mcde;
 
 	/* First obtain and turn on the main power */
 	mcde->epod = devm_regulator_get(dev, "epod");
@@ -487,7 +485,7 @@ static int mcde_probe(struct platform_device *pdev)
 static int mcde_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 
 	component_master_del(&pdev->dev, &mcde_drm_comp_ops);
 	clk_disable_unprepare(mcde->mcde_clk);
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 7af5ebb0c436..1baa2324cdb9 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1020,7 +1020,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			 void *data)
 {
 	struct drm_device *drm = data;
-	struct mcde *mcde = drm->dev_private;
+	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 	struct device_node *child;
 	struct drm_panel *panel = NULL;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
