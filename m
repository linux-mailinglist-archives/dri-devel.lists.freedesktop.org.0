Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023528BB609
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4341132A0;
	Fri,  3 May 2024 21:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jZY0VKb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9308E113296
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:43 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ecd9dab183so19701345ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772262; x=1715377062;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlKkW94AChnsvIhCVySiJbRiNalT5tOJ34PXKTcPDbA=;
 b=jZY0VKb77DS9wQelm7e1wC6bCZkWt6SZpQ3L0KSRgygFlRv8lbeRhb0pw00iEyJrCs
 RxObw/fWnztmMBwR5hizFG19OKAS5tdsDRLU2ktyvNE8vOJXvYTmoQxfelGGdA/28ByD
 5JX26+sXY3On7LAK6lvaonJZVuFgKY8ZglfPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772262; x=1715377062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlKkW94AChnsvIhCVySiJbRiNalT5tOJ34PXKTcPDbA=;
 b=eagOAgY0bDeas7Z5F+BJA1o54+0Ude6K7ahWoR8EsrH96Tqr9XpYfib75TYhePdfAs
 0A0e/r/gkd3vmiYTWx10nu0qrTbovyl57hUQqXweloNujonEf95+z4oBdzTy5EvbO7Q9
 ckV0i6mljnMU1OQX8BKt/3mKdCI2HR2ko7vYQnyHyC5ffz3qz7Ex3xfXmormO3CAwz4d
 AU8PNZR86DwkzXKmlBwKaw0Uaqp0GrAtqvTV5VE746fQc8ocYp8AH3npjPfvH26+Y8hj
 R88q0br/t+ePyTfCtbKODClCMQpSPhbwVSKWtiK4hFtMcrziwFRjApMr2uzeDi2JJiMR
 X6nA==
X-Gm-Message-State: AOJu0YyLibphyJOf/waWIsVT+ZAUIfznYYlAm227d3YrlmgsPPvaoNHy
 Lei+KVys/nmIK3jW6iy2k8WZ3dacGrDcDtwJcWfH9WaiufRylqomq/q7yWxtE3H3AF8bqrFOIlw
 EMw==
X-Google-Smtp-Source: AGHT+IEq5AgUw6GyV8pe9okGVdoOhJW8iWaIkyS1EF9ClHC3n8yX96iFTRmuWTK/fQ6r8ShwT0dFzQ==
X-Received: by 2002:a17:903:41cb:b0:1eb:8299:db35 with SMTP id
 u11-20020a17090341cb00b001eb8299db35mr10401266ple.32.1714772262650; 
 Fri, 03 May 2024 14:37:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Vinay Simha BN <simhavcs@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 33/48] drm/panel: jdi-lt070me05000: Don't call disable
 at shutdown/remove
Date: Fri,  3 May 2024 14:33:14 -0700
Message-ID: <20240503143327.RFT.v2.33.I5f3426e511e77b93c247e0aac114bd12b2b2a933@changeid>
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

Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 4ddddee6fa1e..b1ce186de261 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -452,10 +452,6 @@ static void jdi_panel_remove(struct mipi_dsi_device *dsi)
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&jdi->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
@@ -464,13 +460,6 @@ static void jdi_panel_remove(struct mipi_dsi_device *dsi)
 	jdi_panel_del(jdi);
 }
 
-static void jdi_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&jdi->base);
-}
-
 static struct mipi_dsi_driver jdi_panel_driver = {
 	.driver = {
 		.name = "panel-jdi-lt070me05000",
@@ -478,7 +467,6 @@ static struct mipi_dsi_driver jdi_panel_driver = {
 	},
 	.probe = jdi_panel_probe,
 	.remove = jdi_panel_remove,
-	.shutdown = jdi_panel_shutdown,
 };
 module_mipi_dsi_driver(jdi_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

