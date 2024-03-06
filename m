Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE3872BDD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C35112DB8;
	Wed,  6 Mar 2024 00:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZCYTmcM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059AB112DB6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:43:55 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3c1c3ab19c3so3059028b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709685834; x=1710290634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j07CQ2B9VSDqAzaDJZq3q/Yl1tEHZa3IBFEiQqTUDBc=;
 b=ZCYTmcM6FQxqc2E6rSjLmeGlxaEpO+6X9jE/Q/DpD/7vsrwQUTWEPHw7PIBrCkk8sW
 z21ByUCGWu2rIfJ6YS5/siH7F+1CAx1h/StZBRsN4iGt9+XZ/VRmUwFfTMuU9g/48mdt
 iWVLXv4nnta4YihRiuwInb0ujBoTP8UPNS4gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709685834; x=1710290634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j07CQ2B9VSDqAzaDJZq3q/Yl1tEHZa3IBFEiQqTUDBc=;
 b=XtbdfzTia7vona7gZg2D3fzqp0tk3+zQkQWvqQoLFM3buns4vdxRH+sU7pZsyycZvr
 E9/UNht6VHVpKPjPEi6GpSh1gI4URumWyCBFWBuIU4Ddqi1lrfjIiJUEaYCW+b/JmpjK
 9ojk+49ZBJdku/XEVIKXzAuHDbcugTG12N/dUIXWf1Y6vAZoYr+sPLfdDFrmVhGxcnKd
 IjV14VMVtLt93U69XKrOJtt21LnTK+7A7GZOVm3/HmV2WTS+NnahgumuRjo+OxFPhEEm
 deIxxmWHOedWgi58uk9Bs0yiGtxKEEo82S4f/SQdCqmbgWJM4iXlcTZuUBPFqrMH4W+B
 k8wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhSigtPqrVKxLRszGZSz5jaijfV3jSELKvn/kW6WUnU0q5d988rhRrx0eMzEIqTluTwAY49IzW92XjJW5E3690GUqNec9EBTIsu/6WUggz
X-Gm-Message-State: AOJu0YyE2tzqi1Kj4XTmQMsM+fwavpsbdHZJZyWpYPf7ZwgKxCa0wIOb
 +VQCEhwiTaZ/FC6NtGbb0zRRB2mSqQvFvYjlUy8ypmRnr5Ho/ge/AN+L2uQppA==
X-Google-Smtp-Source: AGHT+IGVnGKEsExHxbPRiJmGh3KBiVOW4N6JErxuzUZyiTZ6ITHKHl+QpRGST85Fo1jkHYkBxJWVAg==
X-Received: by 2002:aca:1208:0:b0:3c1:ea81:64e9 with SMTP id
 8-20020aca1208000000b003c1ea8164e9mr3292594ois.44.1709685834206; 
 Tue, 05 Mar 2024 16:43:54 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:29bc:b3d:1ba8:cf52])
 by smtp.gmail.com with ESMTPSA id
 x37-20020a631725000000b005dc48e56191sm8512885pgl.11.2024.03.05.16.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 16:43:54 -0800 (PST)
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
Subject: [PATCH v4 4/5] drm/panel-edp: Match edp_panels with panel identity
Date: Tue,  5 Mar 2024 16:34:04 -0800
Message-ID: <20240306004347.974304-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306004347.974304-1-hsinyi@chromium.org>
References: <20240306004347.974304-1-hsinyi@chromium.org>
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
v3->v4: combine name and id to identity.
---
 drivers/gpu/drm/panel/panel-edp.c | 45 ++++++++++++++++---------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d094cfc43da8..fb70e97a2e71 100644
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
@@ -1930,17 +1928,21 @@ static const struct panel_delay delay_200_500_e50_po2e200 = {
 
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
@@ -2087,15 +2089,16 @@ static const struct edp_panel_entry edp_panels[] = {
 	{ /* sentinal */ }
 };
 
-static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id, const struct drm_edid *edid)
 {
 	const struct edp_panel_entry *panel;
 
-	if (!panel_id)
-		return NULL;
+	for (panel = edp_panels; panel->ident.panel_id; panel++)
+		if (drm_edid_match_identity(edid, &panel->ident))
+			return panel;
 
-	for (panel = edp_panels; panel->panel_id; panel++)
-		if (panel->panel_id == panel_id)
+	for (panel = edp_panels; panel->ident.panel_id; panel++)
+		if (panel->ident.panel_id == panel_id)
 			return panel;
 
 	return NULL;
-- 
2.44.0.278.ge034bb2e1d-goog

