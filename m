Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0063DC048
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 23:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243846F4BB;
	Fri, 30 Jul 2021 21:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A286F4B5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 21:26:55 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so22593445pja.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40YzoOKug0ixPZC7Um9F1pMdUxsZSDrw3C3GC0yN/wo=;
 b=b3U+OIE36tvfWGdz32hS2b3udSR9smFz5iYrAiqc8Yl5qEcIT1Y5Ji9OACPB77frhm
 u0yd25/GEOX4ESrp4SdRfoPtC9W3Dgd201sdyauMot6NGE3YhsrxCiPrVV6/1qqk1t5o
 oh1N7YTggnrWziK3/vhZ6YgwoJ20bLMG/Dc1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=40YzoOKug0ixPZC7Um9F1pMdUxsZSDrw3C3GC0yN/wo=;
 b=DGr3E5IbGHrQIEWNhhc59Tp+nSPxRDvYdopthQKijpJjtUYH++6p/NH2L7oK3bwzSI
 wH1nhqTAJuxk0fQWcn/ob0t2GraCAPOD6MMa4DEz28aHTielk4dMPituccp8fiT3stN+
 bj6eGdyWHK6dRbkBZZBpqV5Eap0Ao2U/0ZeLoftp1ZKTIh3d7/xBjsBKnf6ylOhH7HAe
 Km5Jx1zE18iMaGv1E8Gx6CvAfcT895+9NuL/xi0xuk1SsSk0S2xi9ExSQvQdVjkQwH0w
 KYW1WuGq+adePdu5zuErqQzDbEQ7y0bLmP8y1YbffiRGiOUKD3e2BOKcNx4IqN1M98YA
 bO7w==
X-Gm-Message-State: AOAM531Iwh57NwU9t5RvYJrwSDbOjQ12fjwx1uzppRfL8xhW0PaEA7Dm
 yOlDkD7qYtksGEC0uL0Kj7TnlQ==
X-Google-Smtp-Source: ABdhPJzLSbhRO7dIdUOC8tS755XOPwEQeylZ8cDdmIiDi+ZWJbdJVbcNu2MD3JVk7FUVO/F2HH9Gpw==
X-Received: by 2002:a17:90b:4c12:: with SMTP id
 na18mr5073398pjb.157.1627680414976; 
 Fri, 30 Jul 2021 14:26:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3424:e0ac:5a92:d061])
 by smtp.gmail.com with ESMTPSA id u21sm3484625pfh.163.2021.07.30.14.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 14:26:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Linus W <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/panel-simple: Implement generic "edp-panel"s
 probed by EDID
Date: Fri, 30 Jul 2021 14:26:25 -0700
Message-Id: <20210730142537.v2.6.Id9c96cba4eba3e5ee519bfb09cd64b39f2490293@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730212625.3071831-1-dianders@chromium.org>
References: <20210730212625.3071831-1-dianders@chromium.org>
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
the panel-simple driver for this.

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

Changes in v2:
- Don't support a "fallback" panel. Probed panels must be probed.
- Not based on patch to copy "desc"--just allocate for probed panels.
- Add "-ms" suffix to delays.

 drivers/gpu/drm/panel/panel-simple.c | 187 ++++++++++++++++++++++++---
 1 file changed, 171 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 7d80bb20e6e0..c2a2168f9a13 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -178,6 +178,20 @@ struct panel_desc {
 	int connector_type;
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
 struct panel_simple {
 	struct drm_panel base;
 	bool enabled;
@@ -532,8 +546,15 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
-	/* add hard-coded panel modes */
-	num += panel_simple_get_non_edid_modes(p, connector);
+	/*
+	 * Add hard-coded panel modes. Don't call this if there are no timings
+	 * and no modes (the generic edp-panel case) because it will clobber
+	 * the display_info that was already set by drm_add_edid_modes().
+	 */
+	if (p->desc->num_timings || p->desc->num_modes)
+		num += panel_simple_get_non_edid_modes(p, connector);
+	else if (!num)
+		dev_warn(p->base.dev, "No display modes\n");
 
 	/* set up connector's "panel orientation" property */
 	drm_connector_set_panel_orientation(connector, p->orientation);
@@ -662,9 +683,79 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
+
+static int generic_edp_panel_probe(struct device *dev, struct panel_simple *panel)
+{
+	const struct edp_panel_entry *edp_panel;
+	struct panel_desc *desc;
+	u32 panel_id;
+	char vend[4];
+	u16 product_id;
+	u32 prepare_ms = 0;
+	u32 absent_ms = 0;
+	int ret;
+
+	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+	desc->connector_type = DRM_MODE_CONNECTOR_eDP;
+	panel->desc = desc;
+
+	/*
+	 * Read the dts properties for the initial probe. These are used by
+	 * the runtime resume code which will get called by the
+	 * pm_runtime_get_sync() call below.
+	 */
+	of_property_read_u32(dev->of_node, "hpd-reliable-delay-ms", &prepare_ms);
+	desc->delay.prepare = prepare_ms;
+	of_property_read_u32(dev->of_node, "hpd-absent-delay-ms", &absent_ms);
+	if (absent_ms && absent_ms <= prepare_ms)
+		dev_warn(dev,
+			 "Ignoring hpd-absent-delay-ms <= hpd-reliable-delay-ms\n");
+	else if (absent_ms)
+		/*
+		 * hpd_absent_delay is added to prepare delay in prepare,
+		 * so subtract since dts bindings are specified slightly
+		 * that they overlap.
+		 */
+		desc->delay.hpd_absent_delay = absent_ms - prepare_ms;
+
+	/* Power the panel on so we can read the EDID */
+	pm_runtime_get_sync(dev);
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
+	if (!edp_panel) {
+		dev_err(dev, "Unrecognized panel %s %#06x\n", vend, product_id);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	dev_info(dev, "Detected %s %s (%#06x)\n", vend, edp_panel->name, product_id);
+
+	/* Update the delay; everything else comes from EDID */
+	desc->delay = *edp_panel->delay;
+
+	ret = 0;
+exit:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
 static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			      struct drm_dp_aux *aux)
 {
+	bool is_generic_edp_panel = false;
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
@@ -728,6 +819,29 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
+	dev_set_drvdata(dev, panel);
+
+	/*
+	 * We use runtime PM for prepare / unprepare since those power the panel
+	 * on and off and those can be very slow operations. This is important
+	 * to optimize powering the panel on briefly to read the EDID before
+	 * fully enabling the panel.
+	 */
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
+	if (of_device_is_compatible(dev->of_node, "edp-panel")) {
+		is_generic_edp_panel = true;
+
+		err = generic_edp_panel_probe(dev, panel);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "Couldn't detect panel nor find a fallback\n");
+		/* generic_edp_panel_probe() replaces desc in the panel */
+		desc = panel->desc;
+	}
+
 	connector_type = desc->connector_type;
 	/* Catch common mistakes for panels. */
 	switch (connector_type) {
@@ -751,7 +865,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 			desc->bpc != 8);
 		break;
 	case DRM_MODE_CONNECTOR_eDP:
-		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
+		if (!is_generic_edp_panel && desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
 			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
 		break;
 	case DRM_MODE_CONNECTOR_DSI:
@@ -782,18 +896,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 		break;
 	}
 
-	dev_set_drvdata(dev, panel);
-
-	/*
-	 * We use runtime PM for prepare / unprepare since those power the panel
-	 * on and off and those can be very slow operations. This is important
-	 * to optimize powering the panel on briefly to read the EDID before
-	 * fully enabling the panel.
-	 */
-	pm_runtime_enable(dev);
-	pm_runtime_set_autosuspend_delay(dev, 1000);
-	pm_runtime_use_autosuspend(dev);
-
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
@@ -4281,6 +4383,9 @@ static const struct panel_desc arm_rtsm = {
 
 static const struct of_device_id platform_of_match[] = {
 	{
+		/* Must be first */
+		.compatible = "edp-panel",
+	}, {
 		.compatible = "ampire,am-1280800n3tzqw-t00h",
 		.data = &ampire_am_1280800n3tzqw_t00h,
 	}, {
@@ -4707,11 +4812,61 @@ static const struct of_device_id platform_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, platform_of_match);
 
+static const struct panel_delay boe_nv116whm_t01_delay = {
+	.hpd_absent_delay = 200,
+	.prepare_to_enable = 80,
+	.unprepare = 500,
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
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x5c40, &auo_b116xak01.delay, "B116XAK01"),
+
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x2d08, &boe_nv133fhm_n61.delay, "NV133FHM-N62"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x8607, &boe_nv116whm_t01_delay, "NV116WHM-T01"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x8d09, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0xd107, &boe_nv133fhm_n61.delay, "NV133FHM-N61"),
+
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x4c11, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
+
+	EDP_PANEL_ENTRY('K', 'D', 'B', 0x2406, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
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
 static int panel_simple_platform_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 
-	id = of_match_node(platform_of_match, pdev->dev.of_node);
+	/* Skip one since "edp-panel" is only supported on DP AUX bus */
+	id = of_match_node(platform_of_match + 1, pdev->dev.of_node);
 	if (!id)
 		return -ENODEV;
 
-- 
2.32.0.554.ge1b32706d8-goog

