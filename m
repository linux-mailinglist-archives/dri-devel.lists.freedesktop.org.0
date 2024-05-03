Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82F8BB5E8
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D2D112A04;
	Fri,  3 May 2024 21:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dz2/wjmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4CC112603
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:44 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ec69e3dbcfso1120925ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772202; x=1715377002;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/gDi06ypcwTUid62LmhVpKtIZZa53PC46cbq17u59E=;
 b=dz2/wjmkZ+ZbUcSAih9Fy6H01L6okgBgRnisl8Fl4WnamLouEE5HbTDx2lul7oesEL
 GSV7F/tQv2vC/Qu+wmo5G8c4ZDflnAft6dszwDg7XJUzRBW91SDqry0VBeclQj1tH3LS
 ZEcZzJ12amTTp4ZhWBzUNO+uLoYWNgjB/e/UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772202; x=1715377002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/gDi06ypcwTUid62LmhVpKtIZZa53PC46cbq17u59E=;
 b=gsE4JAW1Jd4g05wGpBWm5Ug2wIJzWJqXOVxA/3rTUrnQqgw5PboATdAe6gGDC+dC0U
 dvNTV14fiCLSlis5+c5IACn0EXZr6V/AY70jP6RI36G+bFdZlVnRgpk5mGHG8TOVtB6z
 5EYLQYYQCdjxFclwHt84TxX7bJEIawaS0ONBf+sW7qLxIVyPbXxOMNPp7j2tuXRbMWZA
 JM8bPQkyFpndPTEnbdBxPsYb8KBkZa08cDzUhZwQhFCirrlil1Y+rUsbixg/LNsqv2c1
 +rgv9oUSg7V+YSExTg3Ziw8ucSI76evxm1CWsk8nKKpjsxhadbJ1NnDg3cs97Swws4wp
 AlDQ==
X-Gm-Message-State: AOJu0YxKRnVKmzX6zs/RzpFJOGbKXsrvTxTNfzFyXDOXc2sUvuvNOLEV
 EEwBcpOogl3K0/+AcWiTamosf2N47dk91eMcGIQU+Ab7XtEcj/S+h3Cbo0bMUWfJm3p/q07qJ34
 RNg==
X-Google-Smtp-Source: AGHT+IHVkT5EJTIYXQXBX5EIce/1Ex+Br0DGJO9Vob3PlE0kbtZ2ROcTXrJAG7DEeHfLLcWqrz5ILQ==
X-Received: by 2002:a17:902:ce8a:b0:1e4:9ad5:a666 with SMTP id
 f10-20020a170902ce8a00b001e49ad5a666mr4922430plg.25.1714772202526; 
 Fri, 03 May 2024 14:36:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 07/48] drm/panel: edp: Add a comment about
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:48 -0700
Message-ID: <20240503143327.RFT.v2.7.Icff7f7005d997773d585e36aba9ed41a9865201f@changeid>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

Unfortunately, it's very difficult to know exactly which DRM modeset
drivers are using panel-edp due to the sheer number of panels it
handles. For now, we'll leave the calls and just add a comment to keep
people from copying this code.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.
- panel-edp and panel-simple just get a comment now.

 drivers/gpu/drm/panel/panel-edp.c | 33 +++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 344f67871d41..9c4c5c0e39a3 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -944,13 +944,34 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	return err;
 }
 
-static void panel_edp_remove(struct device *dev)
+static void panel_edp_shutdown(struct device *dev)
 {
 	struct panel_edp *panel = dev_get_drvdata(dev);
 
-	drm_panel_remove(&panel->base);
+	/*
+	 * NOTE: the following two calls don't really belong here. It is the
+	 * responsibility of a correctly written DRM modeset driver to call
+	 * drm_atomic_helper_shutdown() at shutdown time and that should
+	 * cause the panel to be disabled / unprepared if needed. For now,
+	 * however, we'll keep these calls due to the sheer number of
+	 * different DRM modeset drivers used with panel-edp. The fact that
+	 * we're calling these and _also_ the drm_atomic_helper_shutdown()
+	 * will try to disable/unprepare means that we can get a warning about
+	 * trying to disable/unprepare an already disabled/unprepared panel,
+	 * but that's something we'll have to live with until we've confirmed
+	 * that all DRM modeset drivers are properly calling
+	 * drm_atomic_helper_shutdown().
+	 */
 	drm_panel_disable(&panel->base);
 	drm_panel_unprepare(&panel->base);
+}
+
+static void panel_edp_remove(struct device *dev)
+{
+	struct panel_edp *panel = dev_get_drvdata(dev);
+
+	drm_panel_remove(&panel->base);
+	panel_edp_shutdown(dev);
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
@@ -961,14 +982,6 @@ static void panel_edp_remove(struct device *dev)
 	panel->drm_edid = NULL;
 }
 
-static void panel_edp_shutdown(struct device *dev)
-{
-	struct panel_edp *panel = dev_get_drvdata(dev);
-
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
-}
-
 static const struct display_timing auo_b101ean01_timing = {
 	.pixelclock = { 65300000, 72500000, 75000000 },
 	.hactive = { 1280, 1280, 1280 },
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

