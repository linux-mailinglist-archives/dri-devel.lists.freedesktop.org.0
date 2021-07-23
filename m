Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1543D30D9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 02:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD226F886;
	Fri, 23 Jul 2021 00:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126086F87F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:22:16 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id u8so1394125plr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkFF98e5eFd70BOJkhQ3nRTVL7R4mLevP/eO/PN3oN4=;
 b=fLYg8viiIW0H7/q4zpJ6F8dzhqY5IjyMWaWn60YHhNODHTOAMdj9VUETy0KoQXyPFt
 3GlVZI1M6KgtrD6gE8i8KmbREsQc36IkCQh7Pa/tWCNtU6CTIJdRRzKi6DXftrblKzAI
 uDE0y0fDM6yaGynW5ruJN/8T2tPE3TsO1Q7Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkFF98e5eFd70BOJkhQ3nRTVL7R4mLevP/eO/PN3oN4=;
 b=mRYCf2WXepckmlJM+Z19AHn4ig++V171yThvaALOivcUxZOTxbIDxqYIgx323TZZ8f
 DVkJoN/60zhdXdhZsHV3NP+QNW4Ap4LTXkqJLz3DuvyMGOIS9ZWWlFiYei9qBgvh9fsr
 Lo/VRGRb7e+4TKVrxEuo4cZtK3wsDaaYB+NTBw4FpxnOI2toWAL40TFh6f6SQmINNCrx
 sdGzsPYmkVbiT6R2+nm5qyHEwrBLPLryaAbF80MqXGByGSlbIHXuuET9FNCNxIca059J
 bRF0e+d1kwWYdyn2QUtvCSevKTNGT50QJzh01vZwVPl5MdEZ+jtdXtOumgw+9w9FVQ8J
 /6XQ==
X-Gm-Message-State: AOAM531+bIY7435EbMc5zFToZmDkQNG8YUh25emNcIUPVz+/4n0yRGcv
 ACqAlT0haDaso4UQ4y15UPeJOQ==
X-Google-Smtp-Source: ABdhPJxlsb6y3A+e06iNRcOp7l33cEW/toaSNmDLWaT6y7DE2kQUGT81yYQTwLCF8XeIRzvauYImFw==
X-Received: by 2002:a62:1c47:0:b029:328:c15c:7603 with SMTP id
 c68-20020a621c470000b0290328c15c7603mr2202363pfc.6.1626999735676; 
 Thu, 22 Jul 2021 17:22:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
 by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 17:22:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 5/8] drm/panel-simple: Copy "desc" into driver data;
 don't store a pointer
Date: Thu, 22 Jul 2021 17:21:43 -0700
Message-Id: <20210722172104.RFC.5.I89640bdefeafa3b4a856f16fb7f150dc2c4b14d5@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steev Klimaszewski <steev@kali.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Up until now "desc" has usually pointed to one of the "static const"
objects defined in the panel-simple driver. Just storing a pointer to
one of these data elements made sense.

In a future patch to support probable eDP panels, however, it's
convenient to be able to modify the delays that the driver uses as it
starts up. One nice way to handle this is to just copy the "desc" into
our driver data instead of storing a pointer.

This has a nice side effect of simplifying the "DPI" case since we no
longer need an extra alloc there.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 84 +++++++++++++---------------
 1 file changed, 38 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index bcdc84b20827..c08bc70f7798 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -199,7 +199,7 @@ struct panel_simple {
 	ktime_t prepared_time;
 	ktime_t unprepared_time;
 
-	const struct panel_desc *desc;
+	struct panel_desc desc;
 
 	struct regulator *supply;
 	struct i2c_adapter *ddc;
@@ -226,8 +226,8 @@ static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
 
-	for (i = 0; i < panel->desc->num_timings; i++) {
-		const struct display_timing *dt = &panel->desc->timings[i];
+	for (i = 0; i < panel->desc.num_timings; i++) {
+		const struct display_timing *dt = &panel->desc.timings[i];
 		struct videomode vm;
 
 		videomode_from_timing(dt, &vm);
@@ -242,7 +242,7 @@ static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_timings == 1)
+		if (panel->desc.num_timings == 1)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
@@ -258,8 +258,8 @@ static unsigned int panel_simple_get_display_modes(struct panel_simple *panel,
 	struct drm_display_mode *mode;
 	unsigned int i, num = 0;
 
-	for (i = 0; i < panel->desc->num_modes; i++) {
-		const struct drm_display_mode *m = &panel->desc->modes[i];
+	for (i = 0; i < panel->desc.num_modes; i++) {
+		const struct drm_display_mode *m = &panel->desc.modes[i];
 
 		mode = drm_mode_duplicate(connector->dev, m);
 		if (!mode) {
@@ -271,7 +271,7 @@ static unsigned int panel_simple_get_display_modes(struct panel_simple *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_modes == 1)
+		if (panel->desc.num_modes == 1)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_set_name(mode);
@@ -290,9 +290,6 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 	bool has_override = panel->override_mode.type;
 	unsigned int num = 0;
 
-	if (!panel->desc)
-		return 0;
-
 	if (has_override) {
 		mode = drm_mode_duplicate(connector->dev,
 					  &panel->override_mode);
@@ -305,7 +302,7 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 	}
 
 	/* Only add timings if override was not there or failed to validate */
-	if (num == 0 && panel->desc->num_timings)
+	if (num == 0 && panel->desc.num_timings)
 		num = panel_simple_get_timings_modes(panel, connector);
 
 	/*
@@ -314,17 +311,17 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 	 * We should only ever have either the display timings specified
 	 * or a fixed mode. Anything else is rather bogus.
 	 */
-	WARN_ON(panel->desc->num_timings && panel->desc->num_modes);
+	WARN_ON(panel->desc.num_timings && panel->desc.num_modes);
 	if (num == 0)
 		num = panel_simple_get_display_modes(panel, connector);
 
-	connector->display_info.bpc = panel->desc->bpc;
-	connector->display_info.width_mm = panel->desc->size.width;
-	connector->display_info.height_mm = panel->desc->size.height;
-	if (panel->desc->bus_format)
+	connector->display_info.bpc = panel->desc.bpc;
+	connector->display_info.width_mm = panel->desc.size.width;
+	connector->display_info.height_mm = panel->desc.size.height;
+	if (panel->desc.bus_format)
 		drm_display_info_set_bus_formats(&connector->display_info,
-						 &panel->desc->bus_format, 1);
-	connector->display_info.bus_flags = panel->desc->bus_flags;
+						 &panel->desc.bus_format, 1);
+	connector->display_info.bus_flags = panel->desc.bus_flags;
 
 	return num;
 }
@@ -350,8 +347,8 @@ static int panel_simple_disable(struct drm_panel *panel)
 	if (!p->enabled)
 		return 0;
 
-	if (p->desc->delay.disable)
-		msleep(p->desc->delay.disable);
+	if (p->desc.delay.disable)
+		msleep(p->desc.delay.disable);
 
 	p->enabled = false;
 
@@ -364,8 +361,8 @@ static int panel_simple_suspend(struct device *dev)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 
-	if (p->desc->delay.disable_to_power_off)
-		msleep(p->desc->delay.disable_to_power_off);
+	if (p->desc.delay.disable_to_power_off)
+		msleep(p->desc.delay.disable_to_power_off);
 
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
@@ -416,7 +413,7 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 	int hpd_asserted;
 	unsigned long hpd_wait_us;
 
-	panel_simple_wait(p->unprepared_time, p->desc->delay.unprepare);
+	panel_simple_wait(p->unprepared_time, p->desc.delay.unprepare);
 
 	err = regulator_enable(p->supply);
 	if (err < 0) {
@@ -424,20 +421,20 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 		return err;
 	}
 
-	if (p->desc->delay.power_to_enable)
-		msleep(p->desc->delay.power_to_enable);
+	if (p->desc.delay.power_to_enable)
+		msleep(p->desc.delay.power_to_enable);
 
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
-	delay = p->desc->delay.prepare;
+	delay = p->desc.delay.prepare;
 	if (p->no_hpd)
-		delay += p->desc->delay.hpd_absent_delay;
+		delay += p->desc.delay.hpd_absent_delay;
 	if (delay)
 		msleep(delay);
 
 	if (p->hpd_gpio) {
-		if (p->desc->delay.hpd_absent_delay)
-			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
+		if (p->desc.delay.hpd_absent_delay)
+			hpd_wait_us = p->desc.delay.hpd_absent_delay * 1000UL;
 		else
 			hpd_wait_us = 2000000;
 
@@ -520,10 +517,10 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->enabled)
 		return 0;
 
-	if (p->desc->delay.enable)
-		msleep(p->desc->delay.enable);
+	if (p->desc.delay.enable)
+		msleep(p->desc.delay.enable);
 
-	panel_simple_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
+	panel_simple_wait(p->prepared_time, p->desc.delay.prepare_to_enable);
 
 	p->enabled = true;
 
@@ -566,14 +563,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	struct panel_simple *p = to_panel_simple(panel);
 	unsigned int i;
 
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
+	if (p->desc.num_timings < num_timings)
+		num_timings = p->desc.num_timings;
 
 	if (timings)
 		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
+			timings[i] = p->desc.timings[i];
 
-	return p->desc->num_timings;
+	return p->desc.num_timings;
 }
 
 static const struct drm_panel_funcs panel_simple_funcs = {
@@ -592,15 +589,12 @@ static int panel_dpi_probe(struct device *dev,
 {
 	struct display_timing *timing;
 	const struct device_node *np;
-	struct panel_desc *desc;
+	struct panel_desc *desc = &panel->desc;
 	unsigned int bus_flags;
 	struct videomode vm;
 	int ret;
 
 	np = dev->of_node;
-	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
-	if (!desc)
-		return -ENOMEM;
 
 	timing = devm_kzalloc(dev, sizeof(*timing), GFP_KERNEL);
 	if (!timing)
@@ -628,8 +622,6 @@ static int panel_dpi_probe(struct device *dev,
 	/* We do not know the connector for the DT node, so guess it */
 	desc->connector_type = DRM_MODE_CONNECTOR_DPI;
 
-	panel->desc = desc;
-
 	return 0;
 }
 
@@ -640,7 +632,7 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 						 struct panel_simple *panel,
 						 const struct display_timing *ot)
 {
-	const struct panel_desc *desc = panel->desc;
+	const struct panel_desc *desc = &panel->desc;
 	struct videomode vm;
 	unsigned int i;
 
@@ -653,8 +645,8 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		return;
 	}
 
-	for (i = 0; i < panel->desc->num_timings; i++) {
-		const struct display_timing *dt = &panel->desc->timings[i];
+	for (i = 0; i < desc->num_timings; i++) {
+		const struct display_timing *dt = &desc->timings[i];
 
 		if (!PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hactive) ||
 		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hfront_porch) ||
@@ -696,7 +688,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 
 	panel->enabled = false;
 	panel->prepared_time = 0;
-	panel->desc = desc;
+	panel->desc = *desc;
 	panel->aux = aux;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
-- 
2.32.0.432.gabb21c7263-goog

