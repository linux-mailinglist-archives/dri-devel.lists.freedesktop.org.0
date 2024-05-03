Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF78BB607
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D15A112A0B;
	Fri,  3 May 2024 21:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bfGi0nrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C95F112A0B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:40 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1ecc23e6c9dso730405ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772258; x=1715377058;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/OkjbvX0C1irAjMh4DggDyOVbw/aLDxkOK/5mqNSwoE=;
 b=bfGi0nrd79gvKM2yHEVQX5lF2C+C5bgI1jFjZqd84MQytRuU9iLKrVYLTNK7Rt5tCO
 9uY2fq4Es2MOHmGi+ijioiHiwDrwQC0HdHZlC9om11nCbQaa/u2pPCjjCCs2xOPUmQsF
 18tVTI95AF5JAMYlRlpAsTfklJ8yhmn70+fNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772258; x=1715377058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/OkjbvX0C1irAjMh4DggDyOVbw/aLDxkOK/5mqNSwoE=;
 b=QjRcPflmGOojgocuYeHdneY8a85Js38kGPm3JtJ2a782kU5sCJKtx55k2oSk8uZ6Di
 OqepGsrytuozMhnabXQ4i7YJLM9/4lUN8GRp12AVIaDhvDhrzscJhtp5i54/2KrOP6uH
 PQd78kAeVsToIB8y69pT9gW8ae6QiDVvUhBSuIe/z4Om7w8OP+qxX0fX04vnf1cPQgud
 vyRLK4oIxPEY3EPwX5HBsPm7OfyMF4J7HxO+r22DIM5NggkgsmztWhQjhtNe+nUpJelF
 cWH4AUJeUbeY4YC9Kz5NC2PJIX2GmO98T4nu3afT512sNSlmU6AHqpFxvDes1nSV2aoP
 69xQ==
X-Gm-Message-State: AOJu0YzDmxqJDgqRJcg5pc39NVvyB6DQdr4i+lKfeDbV5LiLziRJrQin
 Sr5L4SElLE22DxLxThw2TTmhXtJcIkZmKJ7naFSfhYR4bPU6qqcchEV6SNj480Y8g8wBX72F97K
 6Lg==
X-Google-Smtp-Source: AGHT+IGYHi4nDiwk/CzlytVTK20zaPGarGSgcOiG/MYrHHmtbd3gAzexe8vp7KqG0wrEiuiufOiKDQ==
X-Received: by 2002:a17:903:1108:b0:1e5:5bd7:e2b7 with SMTP id
 n8-20020a170903110800b001e55bd7e2b7mr3948148plh.34.1714772258578; 
 Fri, 03 May 2024 14:37:38 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 31/48] drm/panel: xinpeng-xpp055c272: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:12 -0700
Message-ID: <20240503143327.RFT.v2.31.Ib97e67a9877070698afbec4f8ede091b2bf89a1f@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
indicates that it is used by Rockchip boards. The Rockchip driver
appears to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: "Heiko Stübner" <heiko@sntech.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c    | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 8262c00670cf..22a14006765e 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -306,27 +306,11 @@ static int xpp055c272_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void xpp055c272_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct xpp055c272 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-}
-
 static void xpp055c272_remove(struct mipi_dsi_device *dsi)
 {
 	struct xpp055c272 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	xpp055c272_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -347,7 +331,6 @@ static struct mipi_dsi_driver xpp055c272_driver = {
 	},
 	.probe	= xpp055c272_probe,
 	.remove = xpp055c272_remove,
-	.shutdown = xpp055c272_shutdown,
 };
 module_mipi_dsi_driver(xpp055c272_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

