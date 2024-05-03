Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756A08BB5FC
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8549C113291;
	Fri,  3 May 2024 21:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aJ2n9sBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0853011329B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:17 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1ecd3867556so924555ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772236; x=1715377036;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kb398tnZbF7fJMJErZr2qa99FcR7DjSwRYR6pHqFAA=;
 b=aJ2n9sBPLEdVJFh1KQeM0n+ud4RtE4ZrgdoejIvs4IZICtEqNB1RME/PLXC32GtPWJ
 eG03RQEGbbclLMahLAXhFBrU1EnFGHHGy6QEP85b5RLKm4drdb0OGZ5fcR/nBUIBts7c
 Oq0eZd6iP5sYH8+ffq8hziRTSTSzEFvEKi+Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772236; x=1715377036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9kb398tnZbF7fJMJErZr2qa99FcR7DjSwRYR6pHqFAA=;
 b=aI0ti4Y89gJnmHkbv5hqkNWltmbwRGECh+zBvBAWMyPXNP2U9VJgTl3A4nEADP1RvN
 rQ9reViyD1Pfu8OqnmzwkJHswtPRETQMEEIvHJeJnC7owFuCL0fo1ZoPMoMj7rdWvLPs
 v4fZSUb5a6lGs3gALhYBkLnjm47CRKyvsWRBqxIPuHxEv3VW9xIHbhGTwbreR787JNbc
 In+S1h/kU9rVhiOdeBWB+aog9dIsbfEqaZcGkNopWpckgVSaBjhKG1pSv95fFlYVoSgi
 2D/xJXU+nu9MNxaQSjI6zr8JRpLxO44Rds7wFfkU8DJUy12OA6friiP4ui/FlMk166TK
 7mdw==
X-Gm-Message-State: AOJu0YyL+VrjA1H7BmOrKUVO27F+JeX3yAvADz2NRgITF58MRSXmcOWs
 kuQDejCu+fLpxFXyJ6Vi1UhX9IR8CUnpugJq+sKgbpW9cKETkH25oDhCqdVJ71UOmNmKXg40QDf
 Ztw==
X-Google-Smtp-Source: AGHT+IHwYPDlKJY3i9orrstWVpc4QIsGJstcoDV81Owbok8H8JVv/jrLAEu/UHN2wqnlkUP+yYrQEQ==
X-Received: by 2002:a17:902:d2c5:b0:1eb:992b:789b with SMTP id
 n5-20020a170902d2c500b001eb992b789bmr4648219plc.2.1714772235805; 
 Fri, 03 May 2024 14:37:15 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 22/48] drm/panel: osd-osd101t2587-53ts: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:33:03 -0700
Message-ID: <20240503143327.RFT.v2.22.Ic7f6b4ae48027668940a756090cfc454645d3da4@changeid>
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

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 27 +------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 493e0504f6f7..c0da7d9512e8 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -21,9 +21,6 @@ struct osd101t2587_panel {
 
 	struct regulator *supply;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *default_mode;
 };
 
@@ -37,13 +34,8 @@ static int osd101t2587_panel_disable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;
 
-	if (!osd101t2587->enabled)
-		return 0;
-
 	ret = mipi_dsi_shutdown_peripheral(osd101t2587->dsi);
 
-	osd101t2587->enabled = false;
-
 	return ret;
 }
 
@@ -51,11 +43,7 @@ static int osd101t2587_panel_unprepare(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 
-	if (!osd101t2587->prepared)
-		return 0;
-
 	regulator_disable(osd101t2587->supply);
-	osd101t2587->prepared = false;
 
 	return 0;
 }
@@ -63,16 +51,8 @@ static int osd101t2587_panel_unprepare(struct drm_panel *panel)
 static int osd101t2587_panel_prepare(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
-	int ret;
 
-	if (osd101t2587->prepared)
-		return 0;
-
-	ret = regulator_enable(osd101t2587->supply);
-	if (!ret)
-		osd101t2587->prepared = true;
-
-	return ret;
+	return regulator_enable(osd101t2587->supply);
 }
 
 static int osd101t2587_panel_enable(struct drm_panel *panel)
@@ -80,15 +60,10 @@ static int osd101t2587_panel_enable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;
 
-	if (osd101t2587->enabled)
-		return 0;
-
 	ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
 	if (ret)
 		return ret;
 
-	osd101t2587->enabled = true;
-
 	return ret;
 }
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

