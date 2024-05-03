Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46938BB5FF
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D017111329C;
	Fri,  3 May 2024 21:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Hhx5mQdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2176111329C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1e834159f40so687265ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772241; x=1715377041;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4ZnBWaIKiuSZ6rYgD6PXXRcgsfalihno55gNzam3kQ=;
 b=Hhx5mQdqOgPvYAzBd9eOnqsM2LwYRIyXUP+vMArFkPBpGyKxjKYpiaOzhn/8xWYmWR
 oHxoqGUEcRhjMQmWI//Pr4Xnu/TkkEiYvAdRcnk3lTxDSTdXQacUjblf6jtQIPMhrmtU
 YYLX//UovoezxVZ0Tehds0Sesgkpcsi/Aiq7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772241; x=1715377041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4ZnBWaIKiuSZ6rYgD6PXXRcgsfalihno55gNzam3kQ=;
 b=PgHsyKkW9TBKOAHEDjaIfZ/2HeON6G5KMbaUE/KJL2F0xO/XVUiqU1XqsOEb89Fe2y
 R9nMIb/eJYVEn4+Wx/EodZm75B6K695DoYPu3nV+VGG6ntd3HkCHFkw52ITz6lXjo46Y
 cVF0BRnuEfRM6K8xsQ5HdxDPI8CLI8UJPEQdVuVJQgMGRiibNECS9OUA5UTXh26KWWEY
 +PNrDkvvNlyGhlDDTerKhRnGqP3Q9YjFVi9khtw0EaxzljVUqEoeM2S7cX8/72pMmnte
 XG/hm/4rG82e0dKvBgGhaLRoM7YNGYMzJTVs7mlBN5xmB5Ic4GTtelB/q0WAchTPCGFK
 hDDQ==
X-Gm-Message-State: AOJu0YzUKQOW6u6lHRVxmbxs6a5lgA9ehjyJ7Gy4Uns9dDy85VJ52SsC
 /9RCLuwyxHfNRyV5yJNRM6ZG8J5v97i3gfNqnpHMTdQF4bLWft0cuZve2EslsqucrMRtXdZKYmn
 LJQ==
X-Google-Smtp-Source: AGHT+IFBu/Hjhl9CXDDNgZhms0TZtEM8WWT7JEQNvy6BxJ5HNCgPTDI2jWO6fbS+Td4nj2A1qpFYHw==
X-Received: by 2002:a17:902:6503:b0:1e0:a3dd:82df with SMTP id
 b3-20020a170902650300b001e0a3dd82dfmr4006853plk.38.1714772240760; 
 Fri, 03 May 2024 14:37:20 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:19 -0700 (PDT)
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
Subject: [RFT PATCH v2 24/48] drm/panel: samsung-atna33xc20: Stop tracking
 prepared/enabled
Date: Fri,  3 May 2024 14:33:05 -0700
Message-ID: <20240503143327.RFT.v2.24.Ibb4f923363a27167c480a432e52884b117221974@changeid>
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

 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 24 -------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index a9f0d214a900..a322dd0a532f 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -25,8 +25,6 @@
 
 struct atana33xc20_panel {
 	struct drm_panel base;
-	bool prepared;
-	bool enabled;
 	bool el3_was_on;
 
 	bool no_hpd;
@@ -143,13 +141,8 @@ static int atana33xc20_disable(struct drm_panel *panel)
 {
 	struct atana33xc20_panel *p = to_atana33xc20(panel);
 
-	/* Disabling when already disabled is a no-op */
-	if (!p->enabled)
-		return 0;
-
 	gpiod_set_value_cansleep(p->el_on3_gpio, 0);
 	p->el_on3_off_time = ktime_get_boottime();
-	p->enabled = false;
 
 	/*
 	 * Keep track of the fact that EL_ON3 was on but we haven't power
@@ -173,10 +166,6 @@ static int atana33xc20_enable(struct drm_panel *panel)
 {
 	struct atana33xc20_panel *p = to_atana33xc20(panel);
 
-	/* Enabling when already enabled is a no-op */
-	if (p->enabled)
-		return 0;
-
 	/*
 	 * Once EL_ON3 drops we absolutely need a power cycle before the next
 	 * enable or the backlight will never come on again. The code ensures
@@ -195,20 +184,14 @@ static int atana33xc20_enable(struct drm_panel *panel)
 	atana33xc20_wait(p->powered_on_time, 400);
 
 	gpiod_set_value_cansleep(p->el_on3_gpio, 1);
-	p->enabled = true;
 
 	return 0;
 }
 
 static int atana33xc20_unprepare(struct drm_panel *panel)
 {
-	struct atana33xc20_panel *p = to_atana33xc20(panel);
 	int ret;
 
-	/* Unpreparing when already unprepared is a no-op */
-	if (!p->prepared)
-		return 0;
-
 	/*
 	 * Purposely do a put_sync, don't use autosuspend. The panel's tcon
 	 * seems to sometimes crash when you stop giving it data and this is
@@ -220,26 +203,19 @@ static int atana33xc20_unprepare(struct drm_panel *panel)
 	ret = pm_runtime_put_sync_suspend(panel->dev);
 	if (ret < 0)
 		return ret;
-	p->prepared = false;
 
 	return 0;
 }
 
 static int atana33xc20_prepare(struct drm_panel *panel)
 {
-	struct atana33xc20_panel *p = to_atana33xc20(panel);
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
 
 	return 0;
 }
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

