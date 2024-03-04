Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDC870B06
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F70112521;
	Mon,  4 Mar 2024 19:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DWrRk/62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DD5112521
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:52:20 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6e635b772eeso422085b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709581940; x=1710186740;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3Jp14BDf8QPEEvMzAymcf9k4zD9ixOAGCQ7prLq3JA=;
 b=DWrRk/620e/vTJanaa5V0Xx5XeAlS98aVObFwPGV/clw5kYtG7CZUqYImwjt+FzZtO
 p80tjIv/aro5UTdm5mjFEi9z3ZahqmypMKaoIlYu1/PzslJye3SkS1EkMr2gVa3XRYe3
 PLagIKcG3NRaWFJgIRVszK2RaufcMfh1aKVfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709581940; x=1710186740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3Jp14BDf8QPEEvMzAymcf9k4zD9ixOAGCQ7prLq3JA=;
 b=kLmVEbD6CDLTkzFsfJwD2X8p4E5lGGWW/uNQQ+u11I4NuZcYvYXxOFQncBQyL6gxy6
 BxJYqwmUzB2GJlo4OPrsTuNu7KI1IdmIfwBOClbDzbpyw3mRMj1a1Y/o3bpnrbFzDNJu
 fhAGoNdbrJ3F/ptT/pW5tE4NlycE/c7ewLMo6P0h1M5DQixXwNx22/ozHHbgzXCmevEz
 txCkXLUVU3LPKsOYOhsn6vW5VjRX2tun2Ir+RGx9D0YRjyYmgEGi24yLHztKvbV0Lo1E
 26Nlq+/M/5gLEQLJQyt9VuyhWAYQI9DjUU6h6OTtHSNnGw2NHMVaLJ8lBtq0/rx2fQAP
 FqCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8HDM27usGNZBteWmVoGh0ZAZg97YVEswsGxx1rPbEcW2GYDnChUgIu35SimTWXXRBokobHWdfs3tTSZlKwA7tbTEk5el+Pbl9IjlCKGqI
X-Gm-Message-State: AOJu0Yz4sbOskWs/zrHSVsONt28TNJ+FOxZIrXHiJfMNTp2xhJQ/d7gQ
 GDNrLLslL+x+suuRcbfdR4QbUWpnSi2c6rx5fa2jJStlZ0T1t3tNEK9N1R2gIQ==
X-Google-Smtp-Source: AGHT+IHK/PazsA/rAq12BUCaXQt6do7doHeEYNnPIuOEBjQwpxHmb2OW8AC1Tseh0xuGhFovu2zIEA==
X-Received: by 2002:a05:6a00:18a8:b0:6e6:21b3:cf2 with SMTP id
 x40-20020a056a0018a800b006e621b30cf2mr4672758pfh.8.1709581940519; 
 Mon, 04 Mar 2024 11:52:20 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bcf3:25da:25cd:199])
 by smtp.gmail.com with ESMTPSA id
 r27-20020aa7845b000000b006e04d2be954sm7600820pfn.187.2024.03.04.11.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:52:20 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] drm/panel: panel-edp: Match edp_panels with panel name
Date: Mon,  4 Mar 2024 11:44:58 -0800
Message-ID: <20240304195214.14563-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
In-Reply-To: <20240304195214.14563-1-hsinyi@chromium.org>
References: <20240304195214.14563-1-hsinyi@chromium.org>
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
panels, we should first match with both panel id and panel name by checking
if edid contains the name string. If not found, match with panel id only.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: move string matching to drm_edid
---
 drivers/gpu/drm/panel/panel-edp.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fc2d648fd3ab..e3044e34c5f8 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -761,7 +761,8 @@ static void panel_edp_parse_panel_timing_node(struct device *dev,
 		dev_err(dev, "Reject override mode: No display_timing found\n");
 }
 
-static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id,
+						    struct edid_base_block *base_block);
 
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
@@ -799,7 +800,6 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	base_block = drm_edid_get_base_block(panel->ddc);
 	if (base_block) {
 		panel_id = drm_edid_get_panel_id(base_block);
-		kfree(base_block);
 	} else {
 		dev_err(dev, "Couldn't identify panel via EDID\n");
 		ret = -EIO;
@@ -807,7 +807,9 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	}
 	drm_edid_decode_panel_id(panel_id, vend, &product_id);
 
-	panel->detected_panel = find_edp_panel(panel_id);
+	panel->detected_panel = find_edp_panel(panel_id, base_block);
+
+	kfree(base_block);
 
 	/*
 	 * We're using non-optimized timings and want it really obvious that
@@ -2087,13 +2089,18 @@ static const struct edp_panel_entry edp_panels[] = {
 	{ /* sentinal */ }
 };
 
-static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
+static const struct edp_panel_entry *find_edp_panel(u32 panel_id,
+						    struct edid_base_block *base_block)
 {
 	const struct edp_panel_entry *panel;
 
-	if (!panel_id)
-		return NULL;
+	 /* Match with both panel_id and name */
+	for (panel = edp_panels; panel->panel_id; panel++)
+		if (panel->panel_id == panel_id &&
+		    drm_edid_has_monitor_string(base_block, panel->name))
+			return panel;
 
+	/* Match with only panel_id */
 	for (panel = edp_panels; panel->panel_id; panel++)
 		if (panel->panel_id == panel_id)
 			return panel;
-- 
2.44.0.rc1.240.g4c46232300-goog

