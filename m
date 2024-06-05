Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6698FC083
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7618010E650;
	Wed,  5 Jun 2024 00:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NfPwE/Zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C287210E656
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:25:04 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f480624d0fso46315215ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547103; x=1718151903;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WueavCuqsC++tgdW3b4kChJiO3Z5diw3u/WttA4fZGU=;
 b=NfPwE/ZtCGnglaCtG5rPOMBQCsoQWl1CdWUSSl/N5aUbAAH/aU59WQXa5eDigRih84
 yPFm/mW5G6BqmS8FvzrCLwLmlEWiKm6rFj30GCcok4KTRSomX23ixcsfkPRzHRVmvZzR
 TjtiAj9lF92YksHX21xIslTyOtpL/DsppsZfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547103; x=1718151903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WueavCuqsC++tgdW3b4kChJiO3Z5diw3u/WttA4fZGU=;
 b=UsLE9y/Uf0SYtFnIy3UBX7vtNzuhc+/nsa/ww0NjR9nuVRGYixwQUaQlihUKGP0H5O
 dx7XCC7boX0kdvq9C2eexaNM1tqT6bXEuGDTHIS5xoTPHJdoQjG80L4AI9eKpLLIf5Kz
 i/Y9kq2e/fBn9LGamWfsRNNIJitgUCsPuN/wdeD5zSTWxqtpLbC65dGu9c878xcQ2eBv
 AWO4VS/Wv/egHNzqbKeTDQB8EkQMR023qaNRNjPf1o7B7jaZ8/imnc3a9rjJD+uoxK7U
 TkBeONhHZ5jCBpMnBTsL4h0V/ntvI2mFf3QliDknoiid1USwTpDNQrNKlwRHviCSS5Ch
 s0Bw==
X-Gm-Message-State: AOJu0YyZn9yGvaBCioxGJxIV60/C5rMTbLiBSKLmVgxNiiFZ7HkgnDrl
 MGz7dIg7LX7YAkbi/P0RMXNM6YObfFMKtJPwnX6H/zTKvjkF23mfJ2tnroX/r72VRRhK8i9IN+c
 =
X-Google-Smtp-Source: AGHT+IHZV8rnTIG07xU0wk0unrHRbIjagmzYiGL/t8yAbJMj8hc5iEhhmcsmlBP97t06k9Tu/aYGNQ==
X-Received: by 2002:a17:902:b7ca:b0:1f4:b702:f143 with SMTP id
 d9443c01a7336-1f6a5a094d5mr10864515ad.15.1717547103166; 
 Tue, 04 Jun 2024 17:25:03 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:25:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Chiras <robert.chiras@nxp.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/24] drm/panel: raydium-rm67191: Don't call
 unprepare+disable at shutdown
Date: Tue,  4 Jun 2024 17:23:08 -0700
Message-ID: <20240604172305.v3.22.Id14188f1a8af7d524751c27c343a5b583ff5361f@changeid>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by IMX boards. The IMX driver appears to be
correctly calling drm_atomic_helper_shutdown() so we can remove the
calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Robert Chiras <robert.chiras@nxp.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index fa9bf89d3bb5..b2029e035635 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -612,14 +612,6 @@ static void rad_panel_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&rad->panel);
 }
 
-static void rad_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct rad_panel *rad = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&rad->panel);
-	drm_panel_unprepare(&rad->panel);
-}
-
 static const struct of_device_id rad_of_match[] = {
 	{ .compatible = "raydium,rm67191", },
 	{ /* sentinel */ }
@@ -633,7 +625,6 @@ static struct mipi_dsi_driver rad_panel_driver = {
 	},
 	.probe = rad_panel_probe,
 	.remove = rad_panel_remove,
-	.shutdown = rad_panel_shutdown,
 };
 module_mipi_dsi_driver(rad_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

