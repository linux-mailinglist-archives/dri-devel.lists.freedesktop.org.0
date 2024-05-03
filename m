Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605778BB60D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C48A1132A3;
	Fri,  3 May 2024 21:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NCMOUs/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850B1132A3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1ec69e3dbe5so1228605ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772269; x=1715377069;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0iO3yAQ8KkSt7Wokb68l77QkaHVGUqroVg9qjrT7Jw=;
 b=NCMOUs/iEKMH5Gbp5GwC81zfKCBT7nllCy3Vv7Hr4NsvdZI9dJ2OytGl4XDESHauCe
 9vgw3u2Z2zA0RODW/w7VheIbkv57BYLLaEQxUt4sSOGgfBtfoC7tkxSaNm9WWudkCfdI
 xzPLYSLZ//48y2ct7Z5I6B/Ns2SqN5xF1hw1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772269; x=1715377069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0iO3yAQ8KkSt7Wokb68l77QkaHVGUqroVg9qjrT7Jw=;
 b=Z3jCJULwFF65Pa7jNrpecuV++OIsQs4qPzw6h5nDM4oUi2TdmYSgbQQTu75MpXF+CJ
 JsOex2uMGVjnoUbwkMP8NiNv2KMHtLNoGmWhM6y0F82zHKFs9/QdisfZ071+D6j6nul4
 d+Qk9PfuEuI1tALxu15WmHprDEN9UVYsM7Q5AjWRuSwHudevhSzrk2hBb/8QufXjrRhM
 gD/2m/+00O9+7rs9cK5XdU8v68Kvp63LWXjG6NHI+0u7RZEt0yeFFmwLrnQJmXpxWm55
 r/JYva1pxRh88fP0EYUhEbNnI7Le5WcErR/WLXpSmSNbYNhb5yV9UA4BvwbFsWSHqqiy
 BC8A==
X-Gm-Message-State: AOJu0YzOOTDAc1XIkjHoFnC4dtvoVJaaaLQSFpKSEMaN60zLh8ou70KX
 +40iDUHphFS2l6Fq9Eq+ia5ciu/j2O82fkRw+n/z3qI/ocs1UC0ae7DnxQ+NlcvsTgOi2/ueT1Q
 WUg==
X-Google-Smtp-Source: AGHT+IEJXRtPeQGcDuRFCN51uInhuJn+mY1i1wPYgk00iOIMC5r7aJDHEYH9EmcUpqfMP7eJW7lrPw==
X-Received: by 2002:a17:902:7797:b0:1e3:e39a:2e49 with SMTP id
 o23-20020a170902779700b001e3e39a2e49mr3858363pll.18.1714772269071; 
 Fri, 03 May 2024 14:37:49 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Marco Franchi <marco.franchi@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 36/48] drm/panel: seiko-43wvf1g: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:33:17 -0700
Message-ID: <20240503143327.RFT.v2.36.Idda91d310ca2e4f5a4ab4ca6eaf1afdaf14eeb51@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: imx@lists.linux.dev
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 40 ---------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 658c7c040570..98480904126c 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -44,8 +44,6 @@ struct seiko_panel_desc {
 
 struct seiko_panel {
 	struct drm_panel base;
-	bool prepared;
-	bool enabled;
 	const struct seiko_panel_desc *desc;
 	struct regulator *dvdd;
 	struct regulator *avdd;
@@ -122,25 +120,10 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 	return num;
 }
 
-static int seiko_panel_disable(struct drm_panel *panel)
-{
-	struct seiko_panel *p = to_seiko_panel(panel);
-
-	if (!p->enabled)
-		return 0;
-
-	p->enabled = false;
-
-	return 0;
-}
-
 static int seiko_panel_unprepare(struct drm_panel *panel)
 {
 	struct seiko_panel *p = to_seiko_panel(panel);
 
-	if (!p->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 
 	regulator_disable(p->avdd);
@@ -150,8 +133,6 @@ static int seiko_panel_unprepare(struct drm_panel *panel)
 
 	regulator_disable(p->dvdd);
 
-	p->prepared = false;
-
 	return 0;
 }
 
@@ -160,9 +141,6 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 	struct seiko_panel *p = to_seiko_panel(panel);
 	int err;
 
-	if (p->prepared)
-		return 0;
-
 	err = regulator_enable(p->dvdd);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enable dvdd: %d\n", err);
@@ -180,8 +158,6 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
-	p->prepared = true;
-
 	return 0;
 
 disable_dvdd:
@@ -189,18 +165,6 @@ static int seiko_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int seiko_panel_enable(struct drm_panel *panel)
-{
-	struct seiko_panel *p = to_seiko_panel(panel);
-
-	if (p->enabled)
-		return 0;
-
-	p->enabled = true;
-
-	return 0;
-}
-
 static int seiko_panel_get_modes(struct drm_panel *panel,
 				 struct drm_connector *connector)
 {
@@ -228,10 +192,8 @@ static int seiko_panel_get_timings(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs seiko_panel_funcs = {
-	.disable = seiko_panel_disable,
 	.unprepare = seiko_panel_unprepare,
 	.prepare = seiko_panel_prepare,
-	.enable = seiko_panel_enable,
 	.get_modes = seiko_panel_get_modes,
 	.get_timings = seiko_panel_get_timings,
 };
@@ -246,8 +208,6 @@ static int seiko_panel_probe(struct device *dev,
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
-	panel->prepared = false;
 	panel->desc = desc;
 
 	panel->dvdd = devm_regulator_get(dev, "dvdd");
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

