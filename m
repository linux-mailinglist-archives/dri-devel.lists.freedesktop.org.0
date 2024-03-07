Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DAC875ADA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD2110F24C;
	Thu,  7 Mar 2024 23:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gcEKu51+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAC610F243
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:07:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1dca3951ad9so11785095ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709852821; x=1710457621;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kB/qX4HZuCvCcxbPmER5bpPaaStWtmbIuwHw3vs9CPk=;
 b=gcEKu51+rSCAv8a6Q7QrOTCZ/+RzPTSSf/O0tq6Dv43M4FzaWD0n3vi3FY899102Wr
 VXyWXfKdeP7oTXeab6hn9vOUZQClvvHvMa8FmUUzDv27MtlP/rGH0Zb7ZPmOboRebTrc
 dl5iksDuBbq/kMJ7/m1qLlqehyCOufIp4s5AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709852821; x=1710457621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kB/qX4HZuCvCcxbPmER5bpPaaStWtmbIuwHw3vs9CPk=;
 b=nCDpSuzkQJNHjnuCoypYbv45pZ7EnzHZyUhO/UVYZ510VDbR5px20cJrafnIWluMqT
 CWBv9hz3DJMarqFUm0OmMhI7AnYVfQwzWjzIk0T2dOlyzKqKnP1tTz8h3YG9DefHWah4
 flkS4xie0FO1IJoSC6ow6T7fG5QeiYfCln3yhJM30Eq/z/cE0o0VwLjYxlBW44FGJGLE
 TjvESRkoDF8chAzFwE2zMmhwOcJagXuMRjyZmWc21u0Xigy2oWwnfMsFvdqUsVNU4hi9
 ZbggsQmgyhlKqfGWePirEVu4tr4PxAAmZ+QacdJNE4twrcyWiN3OwstBP8f8KORr86jb
 BbKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxPGrYt0nXLsFFFa1LQsK90Em5zyjZqnCGOL8fo9cK8hJU2gAcZ5hnWmYcpGr8ZyPLHddNQnLMq2uyDNngj2EBebgF1IIHzPxEqVWmeFJw
X-Gm-Message-State: AOJu0Yxp71HnNGlBvG4+iRLP9SJYx8u2Zaf1hrw5DtjpKMhYx9HS/PEN
 bEnBjR7AOjEyps3pJ1hC118XHJw51umosuYt/qjQ3tfHBJh78ePMvSRq/6UoRg==
X-Google-Smtp-Source: AGHT+IEl2SKEsnIe/1ux3kSFRla9XwGixgGKsomT1jpfmaa9qvtDZ24gCTCnu2EwFPABsHHlxklyGg==
X-Received: by 2002:a17:902:d58d:b0:1dc:bb8e:d28f with SMTP id
 k13-20020a170902d58d00b001dcbb8ed28fmr2842865plh.66.1709852821077; 
 Thu, 07 Mar 2024 15:07:01 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bf8f:10d4:f877:bee3])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b001db63cfe07dsm15196654plc.283.2024.03.07.15.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:07:00 -0800 (PST)
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
Subject: [PATCH v6 4/5] drm/panel-edp: Match edp_panels with panel identity
Date: Thu,  7 Mar 2024 14:57:44 -0800
Message-ID: <20240307230653.1807557-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240307230653.1807557-1-hsinyi@chromium.org>
References: <20240307230653.1807557-1-hsinyi@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v5->v6: add some comments.
---
 drivers/gpu/drm/panel/panel-edp.c | 50 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fe51680feb61..7f749b17df85 100644
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
@@ -2111,15 +2113,25 @@ static const struct edp_panel_entry edp_panels[] = {
 	{ /* sentinal */ }
 };
 
-static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id, const struct drm_edid *edid)
 {
 	const struct edp_panel_entry *panel;
 
 	if (!panel_id)
 		return NULL;
 
-	for (panel = edp_panels; panel->panel_id; panel++)
-		if (panel->panel_id == panel_id)
+	/*
+	 * Match with identity first. This allows handling the case where
+	 * vendors incorrectly reused the same panel ID for multiple panels that
+	 * need different settings. If there's no match, try again with panel
+	 * ID, which should be unique.
+	 */
+	for (panel = edp_panels; panel->ident.panel_id; panel++)
+		if (drm_edid_match(edid, &panel->ident))
+			return panel;
+
+	for (panel = edp_panels; panel->ident.panel_id; panel++)
+		if (panel->ident.panel_id == panel_id)
 			return panel;
 
 	return NULL;
-- 
2.44.0.278.ge034bb2e1d-goog

