Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77E37DFC36
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 23:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2B110E15A;
	Thu,  2 Nov 2023 22:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC7C10E15A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 22:13:17 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6b709048d8eso1472314b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 15:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698963197; x=1699567997;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QorWcfM+G5ADWypzN9KpHRHW7tbG66Yho+IlCrrLtv4=;
 b=ida4AIcmO00IU8dEZkByvMqEP/7KkgDKrca1/jS3u3GzsUsKMjHn+wZkNYW68rdplY
 1TNC72Znyhib4waV7uOUYx4jMfwMdcJ8tdfL1qeWYMntkOj1QspBuNe52t0C+SbZ8FiI
 Y6oa0ZW1LI33NynXehCFC7/Pvpu2C6lIw91ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698963197; x=1699567997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QorWcfM+G5ADWypzN9KpHRHW7tbG66Yho+IlCrrLtv4=;
 b=DmdqccSnZQBZQ9cIFR6RReoUXAm+ql1S1oM3FQPD0JNHsmyu45f7Xwyi3Cjz5Vzr1+
 TTJ8e9HZfkxru3YvIhVQUE2gcEACrACTUoXbDPYqSIVm+HDiAGkqRWtsVpZSe5xUVLBO
 ulAKAIr75OOCrApfb2wK+sdAOicVZJQ+UBYBags3BwIFnIb3yybrIIpGCoKW2AVR4MQp
 T9ETGY8ExmqIP2czaiAcW4gg6OmoSzmrXjBWzX/eG0z9YBrGhj6gCM8zgOAdeaf69eGD
 2yfbpMVbtnhYoy0QDz8dybE1QjSJSsgXgGCce2FxwzBso4u0jn8CH35qOoLSRecGE/NU
 58qw==
X-Gm-Message-State: AOJu0Yzqm7UEPqObY0bW+Y+fdvs/3iOVi2sAzFsE3uywpCkaorCYCLU9
 pXs1Oayqo3QgeJMC9HQVZD473Q==
X-Google-Smtp-Source: AGHT+IHsESpCZKCOaDEoSCspf7ydpJASehOuQu/k89L/AXjr01cZuIeLGe6D0D91cLuWfWqfayizIQ==
X-Received: by 2002:a05:6a00:1152:b0:6be:2bfa:6290 with SMTP id
 b18-20020a056a00115200b006be2bfa6290mr18056636pfm.8.1698963197065; 
 Thu, 02 Nov 2023 15:13:17 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:6ec1:79de:6e50:d6fa])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a63ce06000000b00565e96d9874sm196057pgf.89.2023.11.02.15.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:13:16 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/4] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
Date: Thu,  2 Nov 2023 14:47:48 -0700
Message-ID: <20231102221309.1971910-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231102221309.1971910-1-hsinyi@chromium.org>
References: <20231102221309.1971910-1-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic edp gets mode from edid. However, some panels report incorrect
mode in this way, resulting in glitches on panel. Introduce a new quirk
additional_mode to the generic edid to pick a correct hardcoded mode.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v1->v2: no change
---
 drivers/gpu/drm/panel/panel-edp.c | 68 ++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 599a949d74d1..0fb439b5efb1 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -203,6 +203,9 @@ struct edp_panel_entry {
 
 	/** @name: Name of this panel (for printing to logs). */
 	const char *name;
+
+	/** @override_edid_mode: Override the mode obtained by edid. */
+	const struct drm_display_mode *override_edid_mode;
 };
 
 struct panel_edp {
@@ -301,6 +304,25 @@ static unsigned int panel_edp_get_display_modes(struct panel_edp *panel,
 	return num;
 }
 
+static int panel_edp_override_edid_mode(struct panel_edp *panel,
+					struct drm_connector *connector,
+					const struct drm_display_mode *override_mode)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, override_mode);
+	if (mode) {
+		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+		drm_mode_set_name(mode);
+		drm_mode_probed_add(connector, mode);
+		return 1;
+	}
+
+	dev_err(panel->base.dev, "failed to add additional mode\n");
+
+	return 0;
+}
+
 static int panel_edp_get_non_edid_modes(struct panel_edp *panel,
 					struct drm_connector *connector)
 {
@@ -568,6 +590,9 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 {
 	struct panel_edp *p = to_panel_edp(panel);
 	int num = 0;
+	bool has_override_edid_mode = p->detected_panel &&
+				      p->detected_panel != ERR_PTR(-EINVAL) &&
+				      p->detected_panel->override_edid_mode;
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
@@ -575,9 +600,18 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 
 		if (!p->edid)
 			p->edid = drm_get_edid(connector, p->ddc);
-
-		if (p->edid)
-			num += drm_add_edid_modes(connector, p->edid);
+		if (p->edid) {
+			if (has_override_edid_mode) {
+				/*
+				 * override_edid_mode is specified. Use
+				 * override_edid_mode instead of from edid.
+				 */
+				num += panel_edp_override_edid_mode(p, connector,
+						p->detected_panel->override_edid_mode);
+			} else {
+				num += drm_add_edid_modes(connector, p->edid);
+			}
+		}
 
 		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
@@ -950,6 +984,19 @@ static const struct panel_desc auo_b101ean01 = {
 	},
 };
 
+static const struct drm_display_mode auo_b116xa3_mode = {
+	.clock = 70589,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 40,
+	.hsync_end = 1366 + 40 + 40,
+	.htotal = 1366 + 40 + 40 + 32,
+	.vdisplay = 768,
+	.vsync_start = 768 + 10,
+	.vsync_end = 768 + 10 + 12,
+	.vtotal = 768 + 10 + 12 + 6,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
 static const struct drm_display_mode auo_b116xak01_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -1878,6 +1925,15 @@ static const struct panel_delay delay_200_150_e200 = {
 	.delay = _delay \
 }
 
+#define EDP_PANEL_ENTRY2(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name, _mode) \
+{ \
+	.name = _name, \
+	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
+					     product_id), \
+	.delay = _delay, \
+	.override_edid_mode = _mode \
+}
+
 /*
  * This table is used to figure out power sequencing delays for panels that
  * are detected by EDID. Entries here may point to entries in the
@@ -1895,9 +1951,11 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
+	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
+			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1",
+			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.42.0.869.gea05f2083d-goog

