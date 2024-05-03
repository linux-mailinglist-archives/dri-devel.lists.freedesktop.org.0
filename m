Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9918BB601
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E51211329F;
	Fri,  3 May 2024 21:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NuR/UiW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E685B11329F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1e834159f40so687655ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772246; x=1715377046;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2B/kTWdyUau2alXgEoUxYv1c4k3su/yovwNR5wduBo=;
 b=NuR/UiW/BplP62S7a8Uyv1idSUWIpiBNQPiDRX4RZNE77J++s0wWPIQu7dfyjhTxsm
 wq/+gZzHqzejhqAbgazArJY0jx8o2oorCPT51Z9eWX0ZDefxBuLl1vHSmdZWaVQzYy0Z
 qPvd9mkH3APOHT/IVHSUDUJSmyC0N7a34quFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772246; x=1715377046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2B/kTWdyUau2alXgEoUxYv1c4k3su/yovwNR5wduBo=;
 b=YTvPqpr7t3t491MY2Fxl8uW0jLod/uUmTZvtPc+7cOun0tSDogZNMKLvjcPyU6lVCG
 k6/up4BylAYwgEnxv6I2pJVJhHQH5Miff5bsnnZEXwghIfBiy4QGTP0xKMPl7debkpyz
 XzgkIUCvJVvEaOBob3Aeu5vDzXnjlbB5UJ5TxoB+f72BVUOg8ucxjKhxwq6XyXOoKl5B
 ujj+gGHelowulmR9bCOHPOetwWoCgceZN1tNMCMaryraPlFTkQF+dLCE4o0WIN4N5TJm
 gLfJeU2Nxct31uWdG9t/ag9y+Bcsql/BlTclaeFUFoJHv81ftKTjTPRn1nb6pQgfYSE3
 52PQ==
X-Gm-Message-State: AOJu0YzmqzqC7WUTDxWzZjlK8B6fqLPILAjDAPM5SkRnX/OhlhIy0QHe
 xhoCpVrvAf/CgfDEMhk4MXq5ZQSU8mNqt6CPvx+O4U/m04uDQ+3TgUeVsV+Ifv3ZyqwY3YnndHo
 /ig==
X-Google-Smtp-Source: AGHT+IHeLoFfHMC/OUeeJoDhqoJSJfOwPhDJNHriFCGoke4s3Yn0fXRdNzl+m82UbjoOonNJKwQK5Q==
X-Received: by 2002:a17:902:d386:b0:1eb:519e:e05f with SMTP id
 e6-20020a170902d38600b001eb519ee05fmr3748669pld.45.1714772245858; 
 Fri, 03 May 2024 14:37:25 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:24 -0700 (PDT)
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
Subject: [RFT PATCH v2 26/48] drm/panel: simple: Stop tracking prepared/enabled
Date: Fri,  3 May 2024 14:33:07 -0700
Message-ID: <20240503143327.RFT.v2.26.I865be97dd393d6ae3c3a3cd1358c95fdbca0fe83@changeid>
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

 drivers/gpu/drm/panel/panel-simple.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dcb6d0b6ced0..42d902d2bbbe 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -138,9 +138,6 @@ struct panel_desc {
 
 struct panel_simple {
 	struct drm_panel base;
-	bool enabled;
-
-	bool prepared;
 
 	ktime_t unprepared_time;
 
@@ -290,14 +287,9 @@ static int panel_simple_disable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->enabled)
-		return 0;
-
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
-	p->enabled = false;
-
 	return 0;
 }
 
@@ -317,18 +309,12 @@ static int panel_simple_suspend(struct device *dev)
 
 static int panel_simple_unprepare(struct drm_panel *panel)
 {
-	struct panel_simple *p = to_panel_simple(panel);
 	int ret;
 
-	/* Unpreparing when already unprepared is a no-op */
-	if (!p->prepared)
-		return 0;
-
 	pm_runtime_mark_last_busy(panel->dev);
 	ret = pm_runtime_put_autosuspend(panel->dev);
 	if (ret < 0)
 		return ret;
-	p->prepared = false;
 
 	return 0;
 }
@@ -356,21 +342,14 @@ static int panel_simple_resume(struct device *dev)
 
 static int panel_simple_prepare(struct drm_panel *panel)
 {
-	struct panel_simple *p = to_panel_simple(panel);
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
 
@@ -378,14 +357,9 @@ static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (p->enabled)
-		return 0;
-
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
-	p->enabled = true;
-
 	return 0;
 }
 
@@ -609,7 +583,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	if (!panel)
 		return -ENOMEM;
 
-	panel->enabled = false;
 	panel->desc = desc;
 
 	panel->supply = devm_regulator_get(dev, "power");
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

