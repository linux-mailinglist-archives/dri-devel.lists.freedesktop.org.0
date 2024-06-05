Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA678FC081
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD9210E644;
	Wed,  5 Jun 2024 00:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MpA8hVG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106ED10E650
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:59 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1f480624d0fso46314695ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547098; x=1718151898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPVmtOP7OzClmuYgtUVqnYcO82gUWMj5hZYUvdlHA1M=;
 b=MpA8hVG3WZOkxrv0X2hsNapX2yydmn5zzjtR9Uglr6MiRZ3sMpPmJFdu99N+ephgXR
 Nd4wGX94/dAylH9rnwK055YRRTe3HQ4EJInzpIyJhDBdeajkUe8ZhVX8K6GY1KvfwgDG
 ABevY3SM+axX+N+i2G7YJqbWkXeaKPrRwoMsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547098; x=1718151898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPVmtOP7OzClmuYgtUVqnYcO82gUWMj5hZYUvdlHA1M=;
 b=jCX8J3mhB6IZEAEWBzGgrF5mV9J5B9M3A29Pn2mt4Plr2cGuexsOzO4+qsELdddDzL
 dRHqYzEW9/ky9+Dfz6DQn1r5LaKtw5r6KQzGGl+wr0I6W3omvE3JGW+3eN8BbaH/oXAR
 nJWRbhx3ObVaKq/l0PFH5zp1rmUWWEYOdGOQCASA4Z1r7LDR3VX3PewA9QHUnGt373mj
 BjKOSzOu08X8q/W6FzNmfSKw/1yeSfB0X4wBKKEkuKlMqktZvfFzmi6nUtu0avOfZUvo
 dMqgdKeUjweLB5narhhDTfhgmmxzewMzWFYb+ezMD0irnm8qnlrzAwpbPNKMROfnCQ66
 2utQ==
X-Gm-Message-State: AOJu0YxYPy5H3hPT9XJ8o9R30HZ1RmGyf2X5uakKbWnm6pvDdK+g6F3p
 UoIkhJBRTHJwluve5MqSBNaceqoEuDJZCtg4iwFMK/5DdBdCH8z2EUdF4ZVjk8HBOgtI/l96L78
 =
X-Google-Smtp-Source: AGHT+IH67K070V0V8KqyhBHJzGDM8yQfGPIOd6KDxeebE42qN9cRh+u2DvVgSXDxiouyJBsaN27tUw==
X-Received: by 2002:a17:902:d2ce:b0:1f6:6939:ad23 with SMTP id
 d9443c01a7336-1f6a5a1976emr12033745ad.37.1717547097993; 
 Tue, 04 Jun 2024 17:24:57 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/24] drm/panel: sharp-ls043t1le01: Don't call disable at
 shutdown/remove
Date: Tue,  4 Jun 2024 17:23:06 -0700
Message-ID: <20240604172305.v3.20.I89ee53f7fc2f0806cab318128e5fa927990d830f@changeid>
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
indicates that it is used by Qualcomm boards. The Qualcomm driver
appears to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index c86337954ad7..729cbb0d8403 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -267,10 +267,6 @@ static void sharp_nt_panel_remove(struct mipi_dsi_device *dsi)
 	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&sharp_nt->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
@@ -278,13 +274,6 @@ static void sharp_nt_panel_remove(struct mipi_dsi_device *dsi)
 	sharp_nt_panel_del(sharp_nt);
 }
 
-static void sharp_nt_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct sharp_nt_panel *sharp_nt = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&sharp_nt->base);
-}
-
 static const struct of_device_id sharp_nt_of_match[] = {
 	{ .compatible = "sharp,ls043t1le01-qhd", },
 	{ }
@@ -298,7 +287,6 @@ static struct mipi_dsi_driver sharp_nt_panel_driver = {
 	},
 	.probe = sharp_nt_panel_probe,
 	.remove = sharp_nt_panel_remove,
-	.shutdown = sharp_nt_panel_shutdown,
 };
 module_mipi_dsi_driver(sharp_nt_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

