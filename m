Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672387410E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C8011350C;
	Wed,  6 Mar 2024 20:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HD5gpnpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677EC113502
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:04:01 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6e64cdf08e3so87548b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709755441; x=1710360241;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CE2sNS/vxOPb5cf5bC+myjwShUIoD0EfwdnD7Qy1Os=;
 b=HD5gpnpOIvg/1k+o4+If+8poJhIjkoLyXnFMQWDob+EsWusADuE6wSOGdWkzx05Rpc
 EBPWrkxjsxs0gLt2/dcwmth0mTo8EW3kzr9Ot+h7j7QJqgG4o6s3DUmEfSVplz3Qv0Mt
 NwIuZX+axEA+7czwuWWpvF4ttTb8P8TuyNx+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755441; x=1710360241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CE2sNS/vxOPb5cf5bC+myjwShUIoD0EfwdnD7Qy1Os=;
 b=a1j6Ph6r0j43Qq6ZvVBGQz0Kb3g1I9aiiY5X6owGkVuU2W0GX7m5hQkd6Rah3DaP0Q
 W9AenwVeUKsk2WwI0E7yS29tpmKsTyx7qbF10e6YxGc7deeXUzWV9srosffxY6IKJ+cd
 v8bvO3WRJDUDEhbZxXL3nWdAc2yFearJPnsUPQHVzM6LqGOwBFPg9f3N/OnZkBU7EJMW
 QJFBOOzTug6sXA5mUeYwKp6WYYDN8FFjKHRi0c3Wa1QLLdS/FClPg8s5hVDoaOEk487t
 BNT+tkK6awq8Wpx6umTVR6IZV3HF96O8wtX5ed583x7a6OQmnYaAp3doDDyOnljiahNA
 k34Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ1H0VgPW3FbYZunXJMre9IsngDlvBOeZdZ690yB+865SQj0nkN4WtKbsOJ+a+SB4PXPGVZ74LpKDKhshEdioa7WqawA2UT3OydV3vEump
X-Gm-Message-State: AOJu0YxgSYcNrKQ9F7iK7apzfiwN+5wHvesDqaFPmp4y88T73pDyZVvG
 OkXKC3BWsfbK3KKKL0yXuJlR/cA99ayyvxzmLFNsBI3PR2S/oyL84aMi2H41jg==
X-Google-Smtp-Source: AGHT+IETZdUaUGspqsCyXd6rJT/N5p6jaVTBU5cNKikpauZE+EH7NLX+lSXVUp6nj8dsq6Y/lQsAUw==
X-Received: by 2002:a05:6a20:a104:b0:1a1:6f1b:a86a with SMTP id
 q4-20020a056a20a10400b001a16f1ba86amr126518pzk.28.1709755440790; 
 Wed, 06 Mar 2024 12:04:00 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:a215:f6c0:3224:5460])
 by smtp.gmail.com with ESMTPSA id
 e3-20020aa79803000000b006e5667793d4sm11124241pfl.66.2024.03.06.12.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 12:04:00 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] drm/panel-edp: Match edp_panels with panel identity
Date: Wed,  6 Mar 2024 11:55:55 -0800
Message-ID: <20240306200353.1436198-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306200353.1436198-1-hsinyi@chromium.org>
References: <20240306200353.1436198-1-hsinyi@chromium.org>
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

It's found that some panels have variants that they share the same panel id
although their EDID and names are different. When matching generic edp
panels, we should first match with both panel identity, which contains both
panel id and panel name. If not found, match with panel id only.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v5: no change
---
 drivers/gpu/drm/panel/panel-edp.c | 45 ++++++++++++++++---------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fe51680feb61..772bf6011d79 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -210,15 +210,12 @@ struct panel_desc {
  * struct edp_panel_entry - Maps panel ID to delay / panel name.
  */
 struct edp_panel_entry {
-	/** @panel_id: 32-bit ID for panel, encoded with drm_edid_encode_panel_id(). */
-	u32 panel_id;
+	/** @ident: edid identity used for panel matching. */
+	const struct drm_edid_ident ident;
 
 	/** @delay: The power sequencing delays needed for this panel. */
 	const struct panel_delay *delay;
 
-	/** @name: Name of this panel (for printing to logs). */
-	const char *name;
-
 	/** @override_edid_mode: Override the mode obtained by edid. */
 	const struct drm_display_mode *override_edid_mode;
 };
@@ -691,7 +688,7 @@ static int detected_panel_show(struct seq_file *s, void *data)
 	else if (!p->detected_panel)
 		seq_puts(s, "HARDCODED\n");
 	else
-		seq_printf(s, "%s\n", p->detected_panel->name);
+		seq_printf(s, "%s\n", p->detected_panel->ident.name);
 
 	return 0;
 }
@@ -761,7 +758,7 @@ static void panel_edp_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
-static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id, const struct drm_edid *edid);
 
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
@@ -799,7 +796,6 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	base_block = drm_edid_read_base_block(panel->ddc);
 	if (base_block) {
 		panel_id = drm_edid_get_panel_id(base_block);
-		drm_edid_free(base_block);
 	} else {
 		dev_err(dev, "Couldn't identify panel via EDID\n");
 		ret = -EIO;
@@ -807,7 +803,9 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	}
 	drm_edid_decode_panel_id(panel_id, vend, &product_id);
 
-	panel->detected_panel = find_edp_panel(panel_id);
+	panel->detected_panel = find_edp_panel(panel_id, base_block);
+
+	drm_edid_free(base_block);
 
 	/*
 	 * We're using non-optimized timings and want it really obvious that
@@ -840,7 +838,7 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		panel->detected_panel = ERR_PTR(-EINVAL);
 	} else {
 		dev_info(dev, "Detected %s %s (%#06x)\n",
-			 vend, panel->detected_panel->name, product_id);
+			 vend, panel->detected_panel->ident.name, product_id);
 
 		/* Update the delay; everything else comes from EDID */
 		desc->delay = *panel->detected_panel->delay;
@@ -1954,17 +1952,21 @@ static const struct panel_delay delay_200_500_e50_po2e200 = {
 
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
-	.name = _name, \
-	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
-					     product_id), \
+	.ident = { \
+		.name = _name, \
+		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
+						     product_id), \
+	}, \
 	.delay = _delay \
 }
 
 #define EDP_PANEL_ENTRY2(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name, _mode) \
 { \
-	.name = _name, \
-	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
-					     product_id), \
+	.ident = { \
+		.name = _name, \
+		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
+						     product_id), \
+	}, \
 	.delay = _delay, \
 	.override_edid_mode = _mode \
 }
@@ -2111,15 +2113,16 @@ static const struct edp_panel_entry edp_panels[] = {
 	{ /* sentinal */ }
 };
 
-static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id, const struct drm_edid *edid)
 {
 	const struct edp_panel_entry *panel;
 
-	if (!panel_id)
-		return NULL;
+	for (panel = edp_panels; panel->ident.panel_id; panel++)
+		if (drm_edid_match(edid, &panel->ident))
+			return panel;
 
-	for (panel = edp_panels; panel->panel_id; panel++)
-		if (panel->panel_id == panel_id)
+	for (panel = edp_panels; panel->ident.panel_id; panel++)
+		if (panel->ident.panel_id == panel_id)
 			return panel;
 
 	return NULL;
-- 
2.44.0.278.ge034bb2e1d-goog

