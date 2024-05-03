Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CC08BB60F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5E31132A4;
	Fri,  3 May 2024 21:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MysnYSKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06921132A4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:53 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e3c3aa8938so877455ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772273; x=1715377073;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltVsqzMHcXWQrzEkIaopepMP6yzxK8+ru/cwzj6Xja4=;
 b=MysnYSKT9KR4XyXC54NrPtFzjDine/PjfdQ8KLMozV9CCrGjMOhsEbBRFo1RlqssfN
 ADs6f2ngmK8WRV3M4c2bFRh8m+VYKGB8l3IA5tAmf7edEayzW2noHsgkfGZ79nBhZZb0
 uC2KGBpjpDmVNV4OmzNdQso/QpSUyHFFqv5qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772273; x=1715377073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltVsqzMHcXWQrzEkIaopepMP6yzxK8+ru/cwzj6Xja4=;
 b=rppsNmbru+G8W0Od6kBEcQ8dnjJk7pzmeXtAUi1MPAA+TJdlFsonvOCho2e5TgmTFL
 Jt2A28L/FnBdUwa3FlCxHE5rpEjw4rjOjL7ELDloN5Ykuqe1nq1zeZGR7m8Qz9teVXda
 pIT/GrAhhnsZzJQDu8eLgzqfMVV9jAia7Key2bH2KBeSTRk91R6RMe2rIM56EHdCdF1X
 sU6SuKJsWUnoeXjmlivnlNJfUsMe7TBcV2vOFYxbdSN1p2y+1fRw0Suu2kuQXaELjlvl
 RJphuGXcNzfvg4wOng5E1SLylRnp/6fykN/yjVmYXNtstqAqN+DDgQ4o0Rge3ac2xUe2
 LJnQ==
X-Gm-Message-State: AOJu0YxcubTtYcTlXaemRxpALyDMDQhDplgMBeGy+FkzsA6vx9VyOZ7S
 xcXlazs7oEug7D/2tSRpk5WBr9jj5iBpvx1t0fzbYoRvynGWSMWmEp6mWarvKKnrRFSLCuNCHnw
 cRA==
X-Google-Smtp-Source: AGHT+IGYZcCvztVAnqAetSOocHorxHkEiQPDfYYRF0RW3qXwcDIlheeCC9kdMyrxGDD9aFGgBa5DWQ==
X-Received: by 2002:a17:903:1111:b0:1e5:3684:617e with SMTP id
 n17-20020a170903111100b001e53684617emr4153719plh.52.1714772272986; 
 Fri, 03 May 2024 14:37:52 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 38/48] drm/panel: sharp-lq101r1sx01: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:33:19 -0700
Message-ID: <20240503143327.RFT.v2.38.Ifd6b12b8a4bca7d492e892ea7455e83f5c0ab5a8@changeid>
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

Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 39 -------------------
 1 file changed, 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 14851408a5e1..8f6c21b99522 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -24,9 +24,6 @@ struct sharp_panel {
 
 	struct regulator *supply;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *mode;
 };
 
@@ -85,26 +82,11 @@ static __maybe_unused int sharp_panel_read(struct sharp_panel *sharp,
 	return err;
 }
 
-static int sharp_panel_disable(struct drm_panel *panel)
-{
-	struct sharp_panel *sharp = to_sharp_panel(panel);
-
-	if (!sharp->enabled)
-		return 0;
-
-	sharp->enabled = false;
-
-	return 0;
-}
-
 static int sharp_panel_unprepare(struct drm_panel *panel)
 {
 	struct sharp_panel *sharp = to_sharp_panel(panel);
 	int err;
 
-	if (!sharp->prepared)
-		return 0;
-
 	sharp_wait_frames(sharp, 4);
 
 	err = mipi_dsi_dcs_set_display_off(sharp->link1);
@@ -119,8 +101,6 @@ static int sharp_panel_unprepare(struct drm_panel *panel)
 
 	regulator_disable(sharp->supply);
 
-	sharp->prepared = false;
-
 	return 0;
 }
 
@@ -164,9 +144,6 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 	u8 format = MIPI_DCS_PIXEL_FMT_24BIT;
 	int err;
 
-	if (sharp->prepared)
-		return 0;
-
 	err = regulator_enable(sharp->supply);
 	if (err < 0)
 		return err;
@@ -235,8 +212,6 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	sharp->prepared = true;
-
 	/* wait for 6 frames before continuing */
 	sharp_wait_frames(sharp, 6);
 
@@ -247,18 +222,6 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 	return err;
 }
 
-static int sharp_panel_enable(struct drm_panel *panel)
-{
-	struct sharp_panel *sharp = to_sharp_panel(panel);
-
-	if (sharp->enabled)
-		return 0;
-
-	sharp->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 	.clock = 278000,
 	.hdisplay = 2560,
@@ -295,10 +258,8 @@ static int sharp_panel_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs sharp_panel_funcs = {
-	.disable = sharp_panel_disable,
 	.unprepare = sharp_panel_unprepare,
 	.prepare = sharp_panel_prepare,
-	.enable = sharp_panel_enable,
 	.get_modes = sharp_panel_get_modes,
 };
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

