Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0568FC079
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431F510E640;
	Wed,  5 Jun 2024 00:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H3rugRhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAED510E640
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:46 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1f44b5b9de6so41197465ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547086; x=1718151886;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xFzIDtydxqVVGN3IYfhfbW6uYn49tP8HLCeKu1mdxF0=;
 b=H3rugRhNnbv0YysBTmcu+qZVEssj2QEGzJBL/812i94kvnfkR4neYgyuMEM8ozmzKf
 aHwXRZFWgrknQL1rmmC34yi+ir5PzQoKxGcPyrordDvUiSi8WOB4AOyH+KyKtYjRXoKp
 34BWtokEBjGbc9YsePGzP2QUBYlTAK2Nl0CZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547086; x=1718151886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFzIDtydxqVVGN3IYfhfbW6uYn49tP8HLCeKu1mdxF0=;
 b=ie4NRNktV9YoInDWtjDkURXlNq6RK1yjvHafmc+Q8bJA8HbzVzDsHd5ue1WEV6hwC0
 eYyXAimMsGRlxsv7jfc40izta3pN7stOCL5NU9g2wkCG+7w7LGECLIymkm1O/xwDmgAG
 SbxmEr8ry7T58DT+8emB/LmZZWC/VWMLWgRubj1dlYB1UFC7E5DGPerqsedMNnFwonU5
 2XjsIoZCyVNuu+VZBzT828P7HQ6Yh85BqrwqqjfXD55WXoPYZSma0uZ8ZpZFPfXmFRJu
 9AC3sDvSgAqWpOy+es/ZwynBDZaWRv5ZXNkakJ+vRJuWbnVEK9dv5edBU7bmOwB+fEof
 4CRQ==
X-Gm-Message-State: AOJu0Yx3Obss+6pFYBMRmPF09ziEcLEwR55f3LfNhrtIAdn9Zz/mJyTg
 wIMesCy1Ce6/gUGgbXb0lgCjBlo4Betqf0wXaoJbxE5MmJ7DCDPm2PTnnpOOGlE7wEolf7ikvak
 =
X-Google-Smtp-Source: AGHT+IFm27+/fauZ3nMgvWWl74IN5ajXU9Ol2WKo4tVnIcK0hz7JGfbfsPcOkqAdhqR5nLRbBIMn9g==
X-Received: by 2002:a17:902:e54f:b0:1f6:7fa4:e064 with SMTP id
 d9443c01a7336-1f6a5a83917mr13819875ad.61.1717547085853; 
 Tue, 04 Jun 2024 17:24:45 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Marco Franchi <marco.franchi@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/24] drm/panel: seiko-43wvf1g: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:23:01 -0700
Message-ID: <20240604172305.v3.15.Idda91d310ca2e4f5a4ab4ca6eaf1afdaf14eeb51@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

