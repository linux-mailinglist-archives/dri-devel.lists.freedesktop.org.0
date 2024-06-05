Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6CF8FC07D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358F10E64D;
	Wed,  5 Jun 2024 00:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YVeb28JM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425E10E644
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1f64ecb1766so14629265ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547093; x=1718151893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUlBvWo2T1mUjKsAM9UGlJV07qR//zMbx5vVmNvhsHw=;
 b=YVeb28JMXDwUFXMquRAFrTrk+wEi70bAi1QRhh4XC2prmdbWSOlOZ7Ez3utQ1yCM72
 1mzaQi4Rz33nDevObVb8JTEAk3hpj2bfg8G2V8zE14LviS6zJ2RLLYl4GK+AZU2DFmWl
 4x4ZqhRY6hDc2erE36nDZgtjf+a3gl9l9xnQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547093; x=1718151893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUlBvWo2T1mUjKsAM9UGlJV07qR//zMbx5vVmNvhsHw=;
 b=ujPGo4BjywG0sUdXBK5RYEbmDWJ/QNsVZqeLcFgu/w9jU0BrfGSqTOaMoDc34HU8kO
 YiZq2QLYoWIokqbatblhiNPbRoeSB3uN7xGEogROpY2y19c/0jrlgDtHAKXLBc7MJyMs
 b4yKvMHsizdbhr07b7ISDViXTvXlRXy1abHppgrIr4m1SiPlRZfaZtUYq3XRFsDnowli
 FebXffqnmPFWZVTr3crzu5SMIrz1iF56qnxTcDI3JCl+ynK7FqnVCM4OpiLm3z2yAJy4
 sewSx6x3SCnjPu75GOiN9EXcWfhiUQt3OHrJPDKP3XOQU7WcPnWCqTpKWLUWCJY8GkHc
 lxPQ==
X-Gm-Message-State: AOJu0YxaEPEOq6gZWnrpXhuV+rTYiNCtFzUxyhbOyiv/OVXfLWPMo7wH
 yIr5VfD11sGCOQmogK2WqbLI/visfMCUDUUqqjIbeFXaVow1FpJabm/w/OR0Fa1+r1yhUM4gEB0
 =
X-Google-Smtp-Source: AGHT+IEBCjVCwzRlhQ5yGZdUyRhLI5wJLXlZzSHlXxP5GByBVUh3AdvfEeSHGA0EtYaytavcaHqdcQ==
X-Received: by 2002:a17:903:40c1:b0:1f6:8235:dba7 with SMTP id
 d9443c01a7336-1f6a5a900a0mr14151585ad.69.1717547093361; 
 Tue, 04 Jun 2024 17:24:53 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:51 -0700 (PDT)
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
Subject: [PATCH v3 18/24] drm/panel: sharp-lq101r1sx01: Don't call disable at
 shutdown/remove
Date: Tue,  4 Jun 2024 17:23:04 -0700
Message-ID: <20240604172305.v3.18.I6a87fce1ee027c96f71c7adf74248b865f50b336@changeid>
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
indicates that it is used by Tegra boards. The Tegra driver appears to
be correctly calling drm_atomic_helper_shutdown() so we can remove the
calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Thierry Reding <treding@nvidia.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 24 ++-----------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 8f6c21b99522..edc9425bb143 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -357,32 +357,13 @@ static void sharp_panel_remove(struct mipi_dsi_device *dsi)
 	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	/* only detach from host for the DSI-LINK2 interface */
-	if (!sharp) {
-		mipi_dsi_detach(dsi);
-		return;
-	}
-
-	err = drm_panel_disable(&sharp->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
-	sharp_panel_del(sharp);
-}
-
-static void sharp_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
-
-	/* nothing to do for DSI-LINK2 */
+	/* only detach from host for the DSI-LINK2 interface */
 	if (!sharp)
-		return;
-
-	drm_panel_disable(&sharp->base);
+		sharp_panel_del(sharp);
 }
 
 static struct mipi_dsi_driver sharp_panel_driver = {
@@ -392,7 +373,6 @@ static struct mipi_dsi_driver sharp_panel_driver = {
 	},
 	.probe = sharp_panel_probe,
 	.remove = sharp_panel_remove,
-	.shutdown = sharp_panel_shutdown,
 };
 module_mipi_dsi_driver(sharp_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

