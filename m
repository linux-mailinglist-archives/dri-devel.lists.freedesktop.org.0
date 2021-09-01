Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D43FE3C1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2566E303;
	Wed,  1 Sep 2021 20:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2EC6E303
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:56 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so552324pjr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6pUN2WQFQLj6KSl3C6MxCczAa7EqCRNuJZ3wEWApoCA=;
 b=P6KZcvEvsrIbNtKa/22jphgGPQruhktwMTbqNyVqiFmwG1zSR7wX3RSRMqGBDSv0hW
 0wjguaPL94sYh961NAd+Y0njk5Akhduz739SHyL+113AzMaPyZi5qw8bZWQeUi07kCWN
 oOvXgGEHHtVA1jZ+hE+fdceke6BB5817OxRoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pUN2WQFQLj6KSl3C6MxCczAa7EqCRNuJZ3wEWApoCA=;
 b=WW0Ao8b72PwuVkMp4gBWtq0PP7dF3SRQTeCsrB2okfjp9na+7lMMVY57uGFkZej3gj
 a/TQOnYXDWtjPZtrCPsUL3rVJZp2Tca1nXilZqY6q53xOZSAJYnOgQVwuM5FsPIIqXDN
 Z91grmy+U2Hm6M+2mfOFvHqd0s3v1WCcmRXDKX4kf6lDAXyNW3BQA7JPA6FdU6aXMG03
 VmSj617CO4zwU1oEqS8A+LrTsBdTPg845bPjTDA/HpGRTBncpzXq+MAT09v5YNFIa/hp
 IO48KrqVMTl5vpiaN2XwMheppITROy2VHlX+G/QAynzG1IlN9VmVph1YFHvFpPYhZgD+
 N9zQ==
X-Gm-Message-State: AOAM533Dzfr8jD8kP2glXR/0OTtOph/FePfefauiKuEvmEeDcjbMNb6N
 PAsWlVbBXPdpI9KVcI/isSZFkg==
X-Google-Smtp-Source: ABdhPJy3C/xaoZa9rHLkvI2VP76zIHLPGspJ86hs1XHQpPhAF3RRo7Rk9zfz9TiRxTdYTWM73QjGmw==
X-Received: by 2002:a17:90a:460e:: with SMTP id
 w14mr1193050pjg.143.1630527655939; 
 Wed, 01 Sep 2021 13:20:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/16] drm/panel-simple-edp: Implement generic "edp-panel"s
 probed by EDID
Date: Wed,  1 Sep 2021 13:19:34 -0700
Message-Id: <20210901131531.v3.16.Id9c96cba4eba3e5ee519bfb09cd64b39f2490293@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
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

As discussed in the patch ("dt-bindings: drm/panel-simple: Introduce
generic eDP panels") we can actually support probing eDP panels at
runtime instead of hardcoding what panel is connected. Add support to
the panel-simple-edp driver for this.

We'll implement a solution like this:
* We'll read in two delays from the device tree that are used for
  powering up the panel the initial time (to read the EDID).
* In the EDID we can find a 32-bit ID that identifies what panel we've
  found. From this ID we can look up the full set of delays.

After this change we'll still need to add per-panel delays into the
panel-simple driver but we will no longer need to specify exactly
which panel is connected to which board in the device tree. Nicely,
any panels that are only supported this way also don't need to
hardcode mode data since it's guaranteed that we can get that through
the EDID.

This patch will seed the ID-to-delay table with a few panels that I
have access to, many of which are on sc7180-trogdor devices.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Generic "edp-panel" handled by the eDP panel driver now.
- Change init order to we power at the end.
- Adjust endianness of product ID.
- Fallback to conservative delays if panel not recognized.
- Add Sharp LQ116M1JW10 to table.
- Add AUO B116XAN06.1 to table.
- Rename delays more generically so they can be reused.

Changes in v2:
- Don't support a "fallback" panel. Probed panels must be probed.
- Not based on patch to copy "desc"--just allocate for probed panels.
- Add "-ms" suffix to delays.

 drivers/gpu/drm/panel/panel-simple-edp.c | 215 +++++++++++++++++++++--
 1 file changed, 201 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple-edp.c b/drivers/gpu/drm/panel/panel-simple-edp.c
index 90ba146426e4..1762a10d43b1 100644
--- a/drivers/gpu/drm/panel/panel-simple-edp.c
+++ b/drivers/gpu/drm/panel/panel-simple-edp.c
@@ -189,6 +189,20 @@ struct panel_desc {
 	struct panel_delay delay;
 };
 
+/**
+ * struct edp_panel_entry - Maps panel ID to delay / panel name.
+ */
+struct edp_panel_entry {
+	/** @panel_id: 32-bit ID for panel, encoded with encode_edid_id(). */
+	u32 panel_id;
+
+	/* @delay: The power sequencing delays needed for this panel. */
+	const struct panel_delay *delay;
+
+	/* @name: Name of this panel (for printing to logs). */
+	const char *name;
+};
+
 struct panel_edp {
 	struct drm_panel base;
 	bool enabled;
@@ -559,8 +573,15 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
-	/* add hard-coded panel modes */
-	num += panel_edp_get_non_edid_modes(p, connector);
+	/*
+	 * Add hard-coded panel modes. Don't call this if there are no timings
+	 * and no modes (the generic edp-panel case) because it will clobber
+	 * the display_info that was already set by drm_add_edid_modes().
+	 */
+	if (p->desc->num_timings || p->desc->num_modes)
+		num += panel_edp_get_non_edid_modes(p, connector);
+	else if (!num)
+		dev_warn(p->base.dev, "No display modes\n");
 
 	/* set up connector's "panel orientation" property */
 	drm_connector_set_panel_orientation(connector, p->orientation);
@@ -641,6 +662,94 @@ static void panel_edp_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
+
+static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
+{
+	const struct edp_panel_entry *edp_panel;
+	struct panel_desc *desc;
+	u32 panel_id;
+	char vend[4];
+	u16 product_id;
+	u32 reliable_ms = 0;
+	u32 absent_ms = 0;
+	int ret;
+
+	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+	panel->desc = desc;
+
+	/*
+	 * Read the dts properties for the initial probe. These are used by
+	 * the runtime resume code which will get called by the
+	 * pm_runtime_get_sync() call below.
+	 */
+	of_property_read_u32(dev->of_node, "hpd-reliable-delay-ms", &reliable_ms);
+	desc->delay.hpd_reliable = reliable_ms;
+	of_property_read_u32(dev->of_node, "hpd-absent-delay-ms", &absent_ms);
+	desc->delay.hpd_reliable = absent_ms;
+
+	/* Power the panel on so we can read the EDID */
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Couldn't power on panel to read EDID: %d\n", ret);
+		goto exit;
+	}
+
+	panel_id = drm_get_panel_id(panel->ddc);
+	if (!panel_id) {
+		dev_err(dev, "Couldn't identify panel via EDID\n");
+		ret = -EIO;
+		goto exit;
+	}
+	decode_edid_id(panel_id, vend, &product_id);
+
+	edp_panel = find_edp_panel(panel_id);
+
+	/*
+	 * We're using non-optimized timings and want it really obvious that
+	 * someone needs to add an entry to the table, so we'll do a WARN_ON
+	 * splat.
+	 */
+	if (WARN_ON(!edp_panel)) {
+		dev_warn(dev,
+			 "Unknown panel %s %#06x, using conservative timings\n",
+			 vend, product_id);
+
+		/*
+		 * It's highly likely that the panel will work if we use very
+		 * conservative timings, so let's do that. We already know that
+		 * the HPD-related delays must have worked since we got this
+		 * far, so we really just need the "unprepare" / "enable"
+		 * delays. We don't need "prepare_to_enable" since that
+		 * overlaps the "enable" delay anyway.
+		 *
+		 * Nearly all panels have a "unprepare" delay of 500 ms though
+		 * there are a few with 1000. Let's stick 2000 in just to be
+		 * super conservative.
+		 *
+		 * An "enable" delay of 80 ms seems the most common, but we'll
+		 * throw in 200 ms to be safe.
+		 */
+		desc->delay.unprepare = 2000;
+		desc->delay.enable = 200;
+	} else {
+		dev_info(dev, "Detected %s %s (%#06x)\n",
+			 vend, edp_panel->name, product_id);
+
+		/* Update the delay; everything else comes from EDID */
+		desc->delay = *edp_panel->delay;
+	}
+
+	ret = 0;
+exit:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 			      struct drm_dp_aux *aux)
 {
@@ -698,12 +807,14 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
 		panel_edp_parse_panel_timing_node(dev, panel, &dt);
 
-	/* Catch common mistakes for panels. */
-	if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
-		dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
-
 	dev_set_drvdata(dev, panel);
 
+	drm_panel_init(&panel->base, dev, &panel_edp_funcs, DRM_MODE_CONNECTOR_eDP);
+
+	err = drm_panel_of_backlight(&panel->base);
+	if (err)
+		goto err_finished_ddc_init;
+
 	/*
 	 * We use runtime PM for prepare / unprepare since those power the panel
 	 * on and off and those can be very slow operations. This is important
@@ -714,11 +825,18 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
-	drm_panel_init(&panel->base, dev, &panel_edp_funcs, DRM_MODE_CONNECTOR_eDP);
-
-	err = drm_panel_of_backlight(&panel->base);
-	if (err)
-		goto disable_pm_runtime;
+	if (of_device_is_compatible(dev->of_node, "edp-panel")) {
+		err = generic_edp_panel_probe(dev, panel);
+		if (err) {
+			dev_err_probe(dev, err,
+				      "Couldn't detect panel nor find a fallback\n");
+			goto err_finished_pm_runtime;
+		}
+		/* generic_edp_panel_probe() replaces desc in the panel */
+		desc = panel->desc;
+	} else if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10) {
+		dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
+	}
 
 	if (!panel->base.backlight && panel->aux) {
 		pm_runtime_get_sync(dev);
@@ -726,16 +844,17 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 		if (err)
-			goto disable_pm_runtime;
+			goto err_finished_pm_runtime;
 	}
 
 	drm_panel_add(&panel->base);
 
 	return 0;
 
-disable_pm_runtime:
+err_finished_pm_runtime:
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
+err_finished_ddc_init:
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
@@ -1516,6 +1635,9 @@ static const struct panel_desc starry_kr122ea0sra = {
 
 static const struct of_device_id platform_of_match[] = {
 	{
+		/* Must be first */
+		.compatible = "edp-panel",
+	}, {
 		.compatible = "auo,b101ean01",
 		.data = &auo_b101ean01,
 	}, {
@@ -1605,11 +1727,76 @@ static const struct of_device_id platform_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);
 
+static const struct panel_delay delay_200_500_p2e80 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.prepare_to_enable = 80,
+};
+
+static const struct panel_delay delay_200_500_p2e100 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.prepare_to_enable = 100,
+};
+
+static const struct panel_delay delay_200_500_e50 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 50,
+};
+
+#define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
+{ \
+	.name = _name, \
+	.panel_id = encode_edid_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id), \
+	.delay = _delay \
+}
+
+/*
+ * This table is used to figure out power sequencing delays for panels that
+ * are detected by EDID. Entries here may point to entries in the
+ * platform_of_match table (if a panel is listed in both places).
+ *
+ * Sort first by vendor, then by product ID.
+ */
+static const struct edp_panel_entry edp_panels[] = {
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
+
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV116WHM-T01"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
+
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
+
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
+
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+
+	{ /* sentinal */ }
+};
+
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
+{
+	const struct edp_panel_entry *panel;
+
+	if (!panel_id)
+		return NULL;
+
+	for (panel = edp_panels; panel->panel_id; panel++)
+		if (panel->panel_id == panel_id)
+			return panel;
+
+	return NULL;
+}
+
 static int panel_edp_platform_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 
-	id = of_match_node(platform_of_match, pdev->dev.of_node);
+	/* Skip one since "edp-panel" is only supported on DP AUX bus */
+	id = of_match_node(platform_of_match + 1, pdev->dev.of_node);
 	if (!id)
 		return -ENODEV;
 
-- 
2.33.0.259.gc128427fd7-goog

