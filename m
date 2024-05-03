Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3D8BB613
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620991132A7;
	Fri,  3 May 2024 21:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NXjyxOVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDEB1132A9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:59 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1e4266673bbso1051205ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772279; x=1715377079;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dXwPdbkXokcaTdukxLAHZJBTCR2jkjSjRsL5uHOD/8=;
 b=NXjyxOVqeFXqaKG5YOHrOioxNZuQCHsXrZSmDz40s+eEMJTG8EcYDCNfeVNxTAWI1F
 M2x0jHvnpwuSwqV0XK0WoWieB7m0qBIsl3n4uy0wbuyGe3JBF1+xEZUWHoL1L/541jUL
 6FJXSWK+ryE9pnrvFQSVfsIe3IfJgm5vDupK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772279; x=1715377079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/dXwPdbkXokcaTdukxLAHZJBTCR2jkjSjRsL5uHOD/8=;
 b=o/GQ6TlUJauRw1+ShYGn6h/Cgr2APKgbDHckaswhc2yeyZLdOZGcQsCDAt9a8Yg96e
 y5rus73xgnjfFnNWCMMxYMIOFHjkCatOA9TuAoLUzKaM3g0QPgbNDJG+dhLH5L6WqhL+
 I+KtAV+/w8gB8DLDB2yJRnlHTUU1hXIU9ppG9sUd3Rc+aREf6COBbGAMEZirxHft1bFe
 JlDbZWfFkkVhBiXhfn7WwJmcvH+nqyzHZLRBAuXm37caMISG0OLm7/lc82J2q3DGkR3J
 Z7AR5SPSyh2GBUxCVXBSUdoPn5Dqrvtkx+7QVhdjqPEkmsKy8GN4JZxJGs1u9nyl1zba
 hxxA==
X-Gm-Message-State: AOJu0Yw7TU86rvXaHiyB5f+YyJSX1dy0rj/jGJwPqtRxaz40bjr0nj3W
 SuCu+4Bis3V9lGMnjq54TTgNcVNxDlkQ58AZumuyfzsD0Eiv7ci6RzTqo3tB/EtzOce4JaELBbw
 8KQ==
X-Google-Smtp-Source: AGHT+IE/1VVEigXJzCYmydTc9NCW51n7kNBmzsc64scd/SOgSmiWWb87c07CAccSkm9G8TiEnbdUIA==
X-Received: by 2002:a17:902:8f96:b0:1e2:6d57:c1bb with SMTP id
 z22-20020a1709028f9600b001e26d57c1bbmr3584215plo.21.1714772279072; 
 Fri, 03 May 2024 14:37:59 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 41/48] drm/panel: sharp-ls043t1le01: Don't call disable
 at shutdown/remove
Date: Fri,  3 May 2024 14:33:22 -0700
Message-ID: <20240503143327.RFT.v2.41.I89ee53f7fc2f0806cab318128e5fa927990d830f@changeid>
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

A grep through mainline for compatible strings used by this driver
indicates that it is used by Qualcomm boards. The Qualcomm driver
appears to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.45.0.rc1.225.g2a3ae87e7f-goog

