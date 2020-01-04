Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACDC130290
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 15:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BC48996F;
	Sat,  4 Jan 2020 14:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4A48996F
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 14:15:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B230D20029;
 Sat,  4 Jan 2020 15:15:08 +0100 (CET)
Date: Sat, 4 Jan 2020 15:15:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] drm/panel: Add driver for Sony ACX424AKP panel
Message-ID: <20200104141507.GA17768@ravnborg.org>
References: <20200104001026.201086-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200104001026.201086-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8
 a=KKAkSRfTAAAA:8 a=L3pK8pvX2aSRoR89ncwA:9 a=CjuIK1q_8ugA:10
 a=A2jcf3dkIZPIRbEE90CI:22 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Sat, Jan 04, 2020 at 01:10:26AM +0100, Linus Walleij wrote:
> The Sony ACX424AKP is a command/videomode DSI panel for
> mobile devices. It is used on the ST-Ericsson HREF520
> reference design. We support video mode by default, but
> it is possible to switch the panel into command mode
> by using the bool property "dsi-command-mode".
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Driver looks good but there are a few issues yet to address:
It does not build on top of drm-misc-next due to changes to the
drm_panel code.

And then there is a few checkpatch warnings that needs to be looked at:
-:25: WARNING:CONFIG_DESCRIPTION: please write a paragraph that describes the config symbol fully
#25: FILE: drivers/gpu/drm/panel/Kconfig:330:
+config DRM_PANEL_SONY_ACX424AKP

-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52:
new file mode 100644

-:307: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#307: FILE: drivers/gpu/drm/panel/panel-sony-acx424akp.c:251:
+	udelay(20);

-:310: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#310: FILE: drivers/gpu/drm/panel/panel-sony-acx424akp.c:254:
+	msleep(11);

-:319: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#319: FILE: drivers/gpu/drm/panel/panel-sony-acx424akp.c:263:
+	msleep(11);

-:543: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#543: FILE: drivers/gpu/drm/panel/panel-sony-acx424akp.c:487:
+	acx->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						 GPIOD_OUT_HIGH);


The build errors was easy to fix - but please have a look at the other
warnings.

I did the following changes locally to fix the build.
But I did not try to look into the delay stuff.

	Sam

diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
index fe33f97cd812..38c83f5b16d5 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
@@ -407,17 +407,17 @@ static int acx424akp_disable(struct drm_panel *panel)
 	return 0;
 }
 
-static int acx424akp_get_modes(struct drm_panel *panel)
+static int acx424akp_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
 {
 	struct acx424akp *acx = panel_to_acx424akp(panel);
-	struct drm_connector *connector = panel->connector;
 	struct drm_display_mode *mode;
 
 	if (acx->video_mode)
-		mode = drm_mode_duplicate(panel->drm,
+		mode = drm_mode_duplicate(connector->dev,
 					  &sony_acx424akp_vid_mode);
 	else
-		mode = drm_mode_duplicate(panel->drm,
+		mode = drm_mode_duplicate(connector->dev,
 					  &sony_acx424akp_cmd_mode);
 	if (!mode) {
 		DRM_ERROR("bad mode or failed to add mode\n");
@@ -484,7 +484,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
 
 	/* This asserts RESET by default */
 	acx->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						 GPIOD_OUT_HIGH);
+						  GPIOD_OUT_HIGH);
 	if (IS_ERR(acx->reset_gpio)) {
 		ret = PTR_ERR(acx->reset_gpio);
 		if (ret != -EPROBE_DEFER)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
