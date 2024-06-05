Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2658FC073
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06AA10E632;
	Wed,  5 Jun 2024 00:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cSYlufhF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DE910E632
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f44b4404dfso55300065ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547069; x=1718151869;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LI+lc0Adrp0Lkxnnuy2KCG5ns+CVmv57DIBitlySUAk=;
 b=cSYlufhFC7Knh+nlu9j/p8XRtHV0S39aerBqT7KV1ppMVw8URd7pNvG3dsOxB9Y9sv
 jBmmd/DGcbyv+Eg7iohkb98py95+AD1Q3ce+Uoj7MwHD5KBoTOkgEtFHYLcVbRPbh0cr
 J0vS2Cq11g6+WVN38oV0sLevdP4ZYFPTpVB60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547069; x=1718151869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LI+lc0Adrp0Lkxnnuy2KCG5ns+CVmv57DIBitlySUAk=;
 b=m8hD+dB+FbcCiTUHW2xbqwzkArqCXVKi1Ttf3XNSZWKNk8Wri/Uq7CmJby8k0MeFtZ
 0GiSikqKfrqzU96W6hgNgPbvjhvlz0NLhe2CxQ2s/ps2+pd2YvB0A9VYuAAzF4D8IFLZ
 9+CdNfHdIS5JwLF7VaRX2Hycy/friKdXWiog5yy3lSlK4CF+hpO6G5xfBkdUzI2u3lbV
 rOVILEqBP6ZaOvYFhR89VUEPhgiofHxuzhDlzZffj0wdOHkLXI8JqXIp43QEqaMUr9oA
 uTmAr1w3VBilPqlN5b7SwOTtDbM2pTxNA28IOPsQZuWB3ddq8VOkeFBsHi9C9hwQKwVY
 905A==
X-Gm-Message-State: AOJu0YwP2ZK/6D96uSw+XiYnOm3vwuScaJL/yYuXYugmtvpVDln3n4gU
 NBm9EsHYKhPYinLkVvbnfGJv0iN1DPKwbtNV3Ppr/oJe7RBEdxqJ4jayjZhTsMqbIaK5vevQRbo
 =
X-Google-Smtp-Source: AGHT+IEIcFmN1SNDSxhI7aIeArYotTMMLemxG6ifMYpzG4iBHTkZgO0UtesSzI4gZV4gQgOfODxBXA==
X-Received: by 2002:a17:903:31d0:b0:1f6:a51b:87bf with SMTP id
 d9443c01a7336-1f6a5a6be24mr9937225ad.46.1717547069457; 
 Tue, 04 Jun 2024 17:24:29 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/24] drm/panel: osd-osd101t2587-53ts: Don't call
 unprepare+disable at shutdown/remove
Date: Tue,  4 Jun 2024 17:22:54 -0700
Message-ID: <20240604172305.v3.8.Ic533ce1323b94230d4155f9364c2b7c1bc47e798@changeid>
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
indicates that it is used by TI OMAP boards. The OMAP driver appears
to be correctly calling drm_atomic_helper_shutdown() so we can remove
the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index c0da7d9512e8..dbea84f51514 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -186,11 +186,6 @@ static void osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
 	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&osd101t2587->base);
-	if (ret < 0)
-		dev_warn(&dsi->dev, "failed to disable panel: %d\n", ret);
-
-	drm_panel_unprepare(&osd101t2587->base);
 	drm_panel_remove(&osd101t2587->base);
 
 	ret = mipi_dsi_detach(dsi);
@@ -198,14 +193,6 @@ static void osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
 }
 
-static void osd101t2587_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&osd101t2587->base);
-	drm_panel_unprepare(&osd101t2587->base);
-}
-
 static struct mipi_dsi_driver osd101t2587_panel_driver = {
 	.driver = {
 		.name = "panel-osd-osd101t2587-53ts",
@@ -213,7 +200,6 @@ static struct mipi_dsi_driver osd101t2587_panel_driver = {
 	},
 	.probe = osd101t2587_panel_probe,
 	.remove = osd101t2587_panel_remove,
-	.shutdown = osd101t2587_panel_shutdown,
 };
 module_mipi_dsi_driver(osd101t2587_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

