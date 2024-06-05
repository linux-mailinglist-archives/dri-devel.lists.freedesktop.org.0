Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998D8FC07E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0593010E64C;
	Wed,  5 Jun 2024 00:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AfFKfDD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6167510E643
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:51 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-6c5a6151ff8so1343677a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547090; x=1718151890;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwSr2LQpLEh1dbqQjF4R2fgSgqdzndDaTOcijaWNa9w=;
 b=AfFKfDD9t47v3GN4ze6mf2C6phgyaP+FziqPkL3c08ssYwZ4I4CnX2DR3Ha2Gef6OE
 2Jper0hYOhvktIv/9ukDtHlnMLBfEgXFY4s6A6IS+zZ078KbUDDwjkmnFQQbDQ6xvmTD
 IScv9s7II5YKMmJO1nf7Ha7pxwYnrZQw+wj2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547090; x=1718151890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwSr2LQpLEh1dbqQjF4R2fgSgqdzndDaTOcijaWNa9w=;
 b=RNM7B8h/LB2BCQI3LIoSf34NNQ/DNgDLd6F1sCe66Rs6Dl/w6UsC0SFDcR/RzXV+EY
 3HBAEDSpTLsxL+TqJAa2WNA5/QrcJwCQ98mfy7cdcJ23lPQP6X9FwNp4btIw3VlPmfuR
 cC8I0AesOL/+8MVAOrs+RwTeR8BYw2yurq3RQMYE1YHIbZZcDUhjat3kR791uZJHyksN
 V1dxKkdZjL0hn+cgLQM636KRR4XrNj5iSOUdg5GDo/j70BUkRfn6Zrl9xVaaAZW/ptz3
 zfZWdNzGNyGfOK4iS23EulVhUvaj1AWPOgqVaQBesSPVkt+beEp+EPUTKkhS1ULaQ3wo
 dgvA==
X-Gm-Message-State: AOJu0Ywxw2QZ0s57pp4gUhJbtq4eq+tFR1vdMzvL0iIhC1+nPdDfXHx8
 xkzuR4CJv+xpzI5PWJNBFELo/MroKeKAhmPmuWykBsnF+yQyk/ySkIlqrRmh9p7JWFML0OmRnCU
 =
X-Google-Smtp-Source: AGHT+IHTA/HmCvWBMAd8tf+YR+vrYnIMOjenFrx5elkt8kCQQG58qBMYuoMj6MIUTI76RDDnK6YNvQ==
X-Received: by 2002:a05:6a21:819f:b0:1b2:7d48:7f7d with SMTP id
 adf61e73a8af0-1b2b71c8e82mr1254043637.61.1717547090168; 
 Tue, 04 Jun 2024 17:24:50 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/24] drm/panel: sharp-lq101r1sx01: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:23:03 -0700
Message-ID: <20240604172305.v3.17.Ifd6b12b8a4bca7d492e892ea7455e83f5c0ab5a8@changeid>
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

Cc: Thierry Reding <treding@nvidia.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

