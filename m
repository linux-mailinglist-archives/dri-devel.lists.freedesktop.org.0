Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086868BB5E6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDA1112A03;
	Fri,  3 May 2024 21:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ynbp2ER9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F6B112A03
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ec69e3dbcfso1120605ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772199; x=1715376999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCoTs68fkVHbhVnPnaiJoDVVCaB+mneUDffLrqHY7lM=;
 b=Ynbp2ER9ifaRkF9M/UofcRtqGE/OZzqsVwpMhKKYsi+9NwgrKo7nFcLLtKKi+1XIeJ
 wNIgc8hXTS/pl7RSeVbFSsHdr9pqCTqYq22k7dgPQsZabKOU6xO+hHsopei8hkOCv+23
 WPltaNyN91yeHbQN8qXIF2tYWqH7D3G2UyMuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772199; x=1715376999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCoTs68fkVHbhVnPnaiJoDVVCaB+mneUDffLrqHY7lM=;
 b=B4p+WZRKu0Z/xbUmltdHSWosasMu7k5d3yDx0jwWHJHxXv+esS/yPaJuLJB5Lx/dhB
 lmhGDA8uOxonIG8StcoEyZh/lDobPzUqlV9vcJh3EdS7vU2O108AIzHHZ5Gu6bGDpeyv
 vkZuGK4PqtQuwza/GGkGNB77p1qIr0olzXvkqzzZX1Kf5UHiuucJ6OUR/Q4Hn2z27Vgp
 f+r2v5sQjFBSIVHe3bndynrfpITOGnTZK9QapvgZOmBZ8LGthaRN4TJmZHYj8IHwJxAy
 vqk2rimItWSYzn8t7tIqh+FbrUm7YEuWUgTcayAqugBEvwZyZ8f+ANFCTb2fFz0Mgq6c
 xW/g==
X-Gm-Message-State: AOJu0Yyuf32IH+ZrblX6DsvHKBUTdDlsRS/c+KrTYfIsuPZ/3pMXDeVo
 Md+drjBv/rLKGWxt255p2NOZA7ryjt2ex4Pot6509dIUXjxP/pGpV0OMC1SzIPpkS7mQSwI8dwK
 4nQ==
X-Google-Smtp-Source: AGHT+IELE7rVEQIWwU2v7bYG2I6EIH6w07IbYCviD6Ulwew4A7zRTV/QWIpp+ISdHunRXglP3i8Fyw==
X-Received: by 2002:a17:902:e5c4:b0:1ec:2274:8205 with SMTP id
 u4-20020a170902e5c400b001ec22748205mr5122613plf.48.1714772199273; 
 Fri, 03 May 2024 14:36:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:38 -0700 (PDT)
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
Subject: [RFT PATCH v2 06/48] drm/panel: edp: Stop tracking prepared/enabled
Date: Fri,  3 May 2024 14:32:47 -0700
Message-ID: <20240503143327.RFT.v2.6.I4d1bf08781593c08127e506422687ab19fd3c824@changeid>
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-edp.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6db277efcbb7..344f67871d41 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -222,11 +222,8 @@ struct edp_panel_entry {
 
 struct panel_edp {
 	struct drm_panel base;
-	bool enabled;
 	bool no_hpd;
 
-	bool prepared;
-
 	ktime_t prepared_time;
 	ktime_t powered_on_time;
 	ktime_t unprepared_time;
@@ -395,14 +392,9 @@ static int panel_edp_disable(struct drm_panel *panel)
 {
 	struct panel_edp *p = to_panel_edp(panel);
 
-	if (!p->enabled)
-		return 0;
-
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
-	p->enabled = false;
-
 	return 0;
 }
 
@@ -420,17 +412,11 @@ static int panel_edp_suspend(struct device *dev)
 
 static int panel_edp_unprepare(struct drm_panel *panel)
 {
-	struct panel_edp *p = to_panel_edp(panel);
 	int ret;
 
-	/* Unpreparing when already unprepared is a no-op */
-	if (!p->prepared)
-		return 0;
-
 	ret = pm_runtime_put_sync_suspend(panel->dev);
 	if (ret < 0)
 		return ret;
-	p->prepared = false;
 
 	return 0;
 }
@@ -542,21 +528,14 @@ static int panel_edp_resume(struct device *dev)
 
 static int panel_edp_prepare(struct drm_panel *panel)
 {
-	struct panel_edp *p = to_panel_edp(panel);
 	int ret;
 
-	/* Preparing when already prepared is a no-op */
-	if (p->prepared)
-		return 0;
-
 	ret = pm_runtime_get_sync(panel->dev);
 	if (ret < 0) {
 		pm_runtime_put_autosuspend(panel->dev);
 		return ret;
 	}
 
-	p->prepared = true;
-
 	return 0;
 }
 
@@ -565,9 +544,6 @@ static int panel_edp_enable(struct drm_panel *panel)
 	struct panel_edp *p = to_panel_edp(panel);
 	unsigned int delay;
 
-	if (p->enabled)
-		return 0;
-
 	delay = p->desc->delay.enable;
 
 	/*
@@ -598,8 +574,6 @@ static int panel_edp_enable(struct drm_panel *panel)
 
 	panel_edp_wait(p->powered_on_time, p->desc->delay.powered_on_to_enable);
 
-	p->enabled = true;
-
 	return 0;
 }
 
@@ -869,7 +843,6 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
 	panel->prepared_time = 0;
 	panel->desc = desc;
 	panel->aux = aux;
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

