Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E58FC07C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AD510E647;
	Wed,  5 Jun 2024 00:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OCGLVbqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBFE10E640
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:42 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1f62fae8c3cso46590645ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547081; x=1718151881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1AbhkHbMcMoNlGR2CNiQzfOA470DcPJEE3YgeJALa4=;
 b=OCGLVbqL7iWrNB27RQTrj/D4NXPiWB3A6WgaGMBZe6t/ZOMz2Bc7V4veMonldXLZBS
 hdFSRhY8uWjIx77NUlCfP6Lvq8ju4aLGq7e5DlIJXZW8FyYBvIofJmIgsRQUyYNIEPEU
 lCffCrF6EXUltNa+A+zv5AwAC2xC3Bfyl+VhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547081; x=1718151881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1AbhkHbMcMoNlGR2CNiQzfOA470DcPJEE3YgeJALa4=;
 b=Rbt/tw7I0CdT42f8uPySKIWsGTTX3SjqlJWL///QB/fWl2u7xqFxj/D6LqM+iYUgsC
 p9KLCtxjrSrngtR1Y30fB8pYyrSiGhWzLwI34Ps4NDRtJgdwfIwZA8ZzHDAhA4dk6DOC
 Mmrszz50/IAvkm0JUOZc9mnxizb5JPMUxsazTwIilA5Si81nHDwKsVPEjOz/v38ERdp2
 vmRJpzGW1pPlnWlS9QgGIETyh9/RM3MDHD9yVTsXuwmpBmb3hVf2dgU1vzXnQ8f0eTPL
 gKHCPin/GJO/YAapkoTy3YOdG3K3aVu1Ve3i8SvRX5yrh+aL6xsYTMwrYlTgSmnB2c3L
 5gLg==
X-Gm-Message-State: AOJu0YwbVYpUQ9WwklWTQvO/b5Nzlbv/cNffNkSPW2KRzvPOwM1DqXSO
 M/b8iMrJWbNKH+G+N2lt9/pSK7BysQtl0tVCcjfW4Oa/tTmGKfl0qL/NIl/wHlGLaYlkKQUlg8k
 =
X-Google-Smtp-Source: AGHT+IGu8485oXCnzIRAECaBH3dhdfdAn+6q6Kuo2jjHznsxYxzsjH5Zj4/blut1i6HGmkU6SpKExQ==
X-Received: by 2002:a17:902:d506:b0:1f6:3215:3d3b with SMTP id
 d9443c01a7336-1f6a5a22ef8mr15113505ad.31.1717547080831; 
 Tue, 04 Jun 2024 17:24:40 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/24] drm/panel: panasonic-vvx10f034n00: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:22:59 -0700
Message-ID: <20240604172305.v3.13.I7278e956ffd1cf686e737834578d4bb3ea527c7f@changeid>
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

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

