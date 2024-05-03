Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6888BB5F9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D57113295;
	Fri,  3 May 2024 21:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PmIrPFrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA48113295
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:10 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1e65a1370b7so1136475ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772229; x=1715377029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCEzmsJkNVqJjLKEek1G559OvdmwxBqijlKTr/wX13A=;
 b=PmIrPFrMnfU6p1yTzoFc4s3BCOEQ6oDwjv8jtaRFrDGH+w3lQhtE3xn1rODdbt7pBe
 sOpS1sD/XQO/PzrXpAZUdHptJWiIKq9FOkc+4XDUT23H37C3nywNnLkxWxIktQIIQs5B
 Q/fmo/Co6Yw5mqvNl6DLKa6hBE8hTsUygSr5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772229; x=1715377029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCEzmsJkNVqJjLKEek1G559OvdmwxBqijlKTr/wX13A=;
 b=V0iMv2pPXhKQ5qvG8iQViWBn8Xel3+mtyG4zgYpU0QBU589aCwD3K+0IViyIVLjYsH
 2HnwQIy07EapGQylSx1vTSHUrIZD7D+Lg99p8iQomVAqOwK/MiHo9j17kI4IpxJ98Jw9
 FJ52CeIgjqjdzrAP0EQu6jivQ7/QG3gYoxDKuDdEIj4OlbW4gMMFDj24/1bJ/CjmA1Fi
 2dQ8iPUEF2g2ZrZ7xyFew5Dqfo6E/m9eh/09no4f6hkojDk6cNs8puXfMuzpK+S+mj13
 cI5jmr9J+j2d9GPDA823TP73PdTlgnGG9fWitwDo2RF1qeRd/ZC1CfuyfD/SVsYvJfNW
 NXIA==
X-Gm-Message-State: AOJu0YztqKrwsLVhBy2GQzAYwCp14egxvDtKn6Q256C3lKPf+oaL/CWX
 CBkwH6n7Xx86bVb7tAYOB1x4Jsxg8j5ZigAYsx94+TbVALMvW8HZMw7fX2rbk5BexbYroqJBcS3
 RLg==
X-Google-Smtp-Source: AGHT+IF/zJruBSwTUZM1XWyjeIBA3vGsxjzRfWQyTdUJXMgAkw1voDP5oQ1EzE0p/oXqEfQ5DM+Pdw==
X-Received: by 2002:a17:902:bb17:b0:1ec:7b0d:9eb9 with SMTP id
 im23-20020a170902bb1700b001ec7b0d9eb9mr3415331plb.64.1714772229039; 
 Fri, 03 May 2024 14:37:09 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benni Steini <bennisteinir@gmail.com>, Joel Selvaraj <jo@jsfamily.in>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 19/48] drm/panel: novatek-nt36672a: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:00 -0700
Message-ID: <20240503143327.RFT.v2.19.I67819ba5513d4ef85f254a68b22a3402b4cdf30f@changeid>
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

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benni Steini <bennisteinir@gmail.com>
Cc: Joel Selvaraj <jo@jsfamily.in>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 35aace79613a..c2abd20e0734 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -656,14 +656,6 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
 	struct nt36672a_panel *pinfo = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_unprepare(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
-	err = drm_panel_disable(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
@@ -671,14 +663,6 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&pinfo->base);
 }
 
-static void nt36672a_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct nt36672a_panel *pinfo = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&pinfo->base);
-	drm_panel_unprepare(&pinfo->base);
-}
-
 static const struct of_device_id tianma_fhd_video_of_match[] = {
 	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
 	{ },
@@ -692,7 +676,6 @@ static struct mipi_dsi_driver nt36672a_panel_driver = {
 	},
 	.probe = nt36672a_panel_probe,
 	.remove = nt36672a_panel_remove,
-	.shutdown = nt36672a_panel_shutdown,
 };
 module_mipi_dsi_driver(nt36672a_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

