Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37078BB60A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D315B1132A1;
	Fri,  3 May 2024 21:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OxU2RUoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044631132A1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:46 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e5c7d087e1so1051535ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772265; x=1715377065;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZDXX5+LO4KCYTMyL9bFp7mWqxckeafU4NqU6b6Zl+A=;
 b=OxU2RUoeUWzcSOQe6eFJjJnByUme+g5+9t0rPDLXcCCwPYFl+N3/fTN+Z01XXLZTxq
 2qofvtsk//AWlg3a6fPEDvmvhowdq/dZ6taks/cHc+xuUXbCjAoUMTJHKv8MpbayTuXQ
 XFeBTQd2HLTXNIAyv0VARtREA+yIGulRpO4Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772265; x=1715377065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wZDXX5+LO4KCYTMyL9bFp7mWqxckeafU4NqU6b6Zl+A=;
 b=See/muHFgE4NjfzCDa8p3CBX2dQFi1OLGr3W/Bv8MUjQ/4UzR1mRba5/sQaEHPu8+z
 sADvhAaklXncYTaVa1mWpGeQtDXIkVJbwLp5rzRXlo878G5x2Au406UgVXkETWySo7Of
 cC9dGM/tsze73uYm6jSXJZr9hW6Vzwvk1L/WO1s+6aBpB7Vfuw/lISGlYRXu1nZ2LwLt
 4RnMVgnn5bntlMwFpliTNWgvl0z+y8XIymdtJuwgF1VmOtGAtdS6KhzWo3LIJHrvYLr3
 3EwnWueykj1hAihi39Xaii4AfyXJzHGrLQv9SZay0u/H4+dEl6h3c217ztqsX0/sYxda
 rHkA==
X-Gm-Message-State: AOJu0Yw1u8Ghx/EG5hTnYXIYwtDcibXJtoMDOgy5wVB8ZN75CBHWsqW7
 ilMs9VnMujUq6hY7bImLXplnaFyKkilVHRHTseZFlgae7wo1fFve+m6geyKwMf3S7bedwXPDXLT
 VuQ==
X-Google-Smtp-Source: AGHT+IEM/QZtMkwvjlLIFbPnkF0+gcBny1uUrL28BGWnqjNaJ9gJCfvZsyvZC8Acyq8l9IiCgiHpFQ==
X-Received: by 2002:a17:903:41d1:b0:1ec:22ca:b290 with SMTP id
 u17-20020a17090341d100b001ec22cab290mr5158303ple.21.1714772264830; 
 Fri, 03 May 2024 14:37:44 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 34/48] drm/panel: panasonic-vvx10f034n00: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:33:15 -0700
Message-ID: <20240503143327.RFT.v2.34.I7278e956ffd1cf686e737834578d4bb3ea527c7f@changeid>
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

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../drm/panel/panel-panasonic-vvx10f034n00.c  | 35 +------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 8ba6d8287938..822ca2f971eb 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -32,9 +32,6 @@ struct wuxga_nt_panel {
 
 	struct regulator *supply;
 
-	bool prepared;
-	bool enabled;
-
 	ktime_t earliest_wake;
 
 	const struct drm_display_mode *mode;
@@ -53,28 +50,16 @@ static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
 static int wuxga_nt_panel_disable(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
-	int mipi_ret, bl_ret = 0;
-
-	if (!wuxga_nt->enabled)
-		return 0;
-
-	mipi_ret = mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
-
-	wuxga_nt->enabled = false;
 
-	return mipi_ret ? mipi_ret : bl_ret;
+	return mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
 }
 
 static int wuxga_nt_panel_unprepare(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
 
-	if (!wuxga_nt->prepared)
-		return 0;
-
 	regulator_disable(wuxga_nt->supply);
 	wuxga_nt->earliest_wake = ktime_add_ms(ktime_get_real(), MIN_POFF_MS);
-	wuxga_nt->prepared = false;
 
 	return 0;
 }
@@ -85,9 +70,6 @@ static int wuxga_nt_panel_prepare(struct drm_panel *panel)
 	int ret;
 	s64 enablewait;
 
-	if (wuxga_nt->prepared)
-		return 0;
-
 	/*
 	 * If the user re-enabled the panel before the required off-time then
 	 * we need to wait the remaining period before re-enabling regulator
@@ -117,8 +99,6 @@ static int wuxga_nt_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	wuxga_nt->prepared = true;
-
 	return 0;
 
 poweroff:
@@ -127,18 +107,6 @@ static int wuxga_nt_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static int wuxga_nt_panel_enable(struct drm_panel *panel)
-{
-	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
-
-	if (wuxga_nt->enabled)
-		return 0;
-
-	wuxga_nt->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 	.clock = 164402,
 	.hdisplay = 1920,
@@ -178,7 +146,6 @@ static const struct drm_panel_funcs wuxga_nt_panel_funcs = {
 	.disable = wuxga_nt_panel_disable,
 	.unprepare = wuxga_nt_panel_unprepare,
 	.prepare = wuxga_nt_panel_prepare,
-	.enable = wuxga_nt_panel_enable,
 	.get_modes = wuxga_nt_panel_get_modes,
 };
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

