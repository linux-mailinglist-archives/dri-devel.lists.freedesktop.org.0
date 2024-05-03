Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF578BB615
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CD11132A9;
	Fri,  3 May 2024 21:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i1o0GADl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDCA1132A9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:38:06 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ecddf96313so1029415ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772283; x=1715377083;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Avvw3HtD9t825/57o/WJV3t+qgm+MjAo1zab7qfrAw=;
 b=i1o0GADlQ1+krovd3JniHplpmHOHdyQD+arEUm81//sj1UQM834SyHqM9hqkmF19Pp
 LEaeBjsgGU+KZEjND6vkZRV15iKCNJS+G3Qw4ZIlIyxgmoE8iRU/hBIVy16ZgMyztFKH
 KmMOz8lkOiWyXZcOM0ktQeWFhb9+P4TE3ZFXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772283; x=1715377083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Avvw3HtD9t825/57o/WJV3t+qgm+MjAo1zab7qfrAw=;
 b=sxnEwAfJCjZbajI/Ur7i3MnhErArM2DmCrm23LjwwsSclNjZ5dJNUmDX92N39A6LDt
 cNLi87hA3uE1FMVMyH0N2rW6wD6ikIUqcyjHkJcSw8sgWNWa7pUjqi+dXelESTRK0iU4
 Y65WhHKvLt0z1F7d7K3KWjYcgWAJ49xMNXdJXRkpfKjYSICj2kH/gH7VbxHeMvsp088U
 mzw7+EipyUbpD4qNaTkcw1SwDeDZAPwIy5HXALM0mCA/o61WC5+Ihl8pa6aMODAtCBh9
 /nLKYMk7nWnEB67V8npYWAwdHEnWwkXefYBdepGlaI6OGZFlqSdjASHcOBO0QBxB2EaD
 bqjw==
X-Gm-Message-State: AOJu0YzHno+Hkfi8upG4oR0Jx2/qnzCwXyfSTB7arxlY/xfkk6vSzsWb
 RPcWhG9Md4XHX7UKCX7Yx2+E9Y2TUF0IPld4+kQamdfUaRoqM1e8WFGD2BDduF3MEkR+Gz/ToUL
 GBQ==
X-Google-Smtp-Source: AGHT+IEu82XmRy0lY1T4aUx77LcpN+15wj25rF0IIbfio5kewqFsMtXS5VE3myBBns7XneJTh6xgPw==
X-Received: by 2002:a17:902:b784:b0:1e5:a025:12f9 with SMTP id
 e4-20020a170902b78400b001e5a02512f9mr4001966pls.28.1714772283235; 
 Fri, 03 May 2024 14:38:03 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:38:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
 Frank Oltmanns <frank@oltmanns.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Purism Kernel Team <kernel@puri.sm>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 43/48] drm/panel: sitronix-st7703: Don't call disable
 at shutdown/remove
Date: Fri,  3 May 2024 14:33:24 -0700
Message-ID: <20240503143327.RFT.v2.43.I08ba0d4e2d534c06ab0ede9c148bb14cc7c1a9d7@changeid>
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

The compatible strings used by this driver seem to show up across
boards using a variety of DRM drivers. It appears that the relevant
drivers have been converted, but at least one compatible string
doesn't seem to be found in any mainline dts files so we can't be 100%
sure. If it is found that the DRM modeset driver hasn't been fixed
then this patch could be temporarily reverted until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: "Guido Günther" <agx@sigxcpu.org>
Cc: "Ondřej Jirman" <megi@xff.cz>
Cc: Chris Morgan <macromorgan@hotmail.com>
Cc: Frank Oltmanns <frank@oltmanns.dev>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6b2d940640ca..77b30e045a57 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -937,27 +937,11 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void st7703_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct st7703 *ctx = mipi_dsi_get_drvdata(dsi);
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
 static void st7703_remove(struct mipi_dsi_device *dsi)
 {
 	struct st7703 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	st7703_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -981,7 +965,6 @@ MODULE_DEVICE_TABLE(of, st7703_of_match);
 static struct mipi_dsi_driver st7703_driver = {
 	.probe	= st7703_probe,
 	.remove = st7703_remove,
-	.shutdown = st7703_shutdown,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = st7703_of_match,
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

