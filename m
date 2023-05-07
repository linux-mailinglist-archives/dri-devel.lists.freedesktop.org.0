Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1C6F9A8C
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 19:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8A110E22A;
	Sun,  7 May 2023 17:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C89010E22A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 17:26:42 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso4167097e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 10:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683480400; x=1686072400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=usyAdlT3FXAAzlSozkZ6sftT7vPGRMpEuEUdo38d93g=;
 b=CthyILClqag+1d0B1DzQW0C7EPALfTG7xAgYWPawuscJI38lkbDxbo+xabssbJnCLq
 m3pRmCXusK+8sgCRXUWsv366cSxDpOKJ7zBPHqtH5DTILBbtLK+/JGcMMSCMa9HcNhHo
 ZPhn0c0AoNfF0zxd9c+5YAGSWwy4pQKkULgQQ9GQqPB8u4yFVEBPQ+a+VXszDO+Qm4iw
 eB2eVeiX/PzGjNB/JIpfNiaSGKLSFYh8C2qc2bteffCs9Xk6FwiZQpkUugc101gdJokW
 s0xdj5XKuqdukC9M6kkDt3mYY66jbkrKF1C3UkjKJfWEwBaoOmZgHTGUK5wTBLgB7P2H
 WePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683480400; x=1686072400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=usyAdlT3FXAAzlSozkZ6sftT7vPGRMpEuEUdo38d93g=;
 b=JxwS7/tdm7cgJkQ+P+JnlAkuaq2B9/IW/IQdojL830rv4+eXUX2HVuTZCGq77DET32
 OYNJer3kq2aXei97Qgt8nPCQus0l9DXB9DCdL9W5XnHfmLknzulVEzPVn9Pw2VS9Q1WR
 dbir4Qy7uMoHTi4JgdADQdLmeKvUPrSjN7J1QvSieZ9EQg3XAqWRl8/sUH+3IBnlZuEf
 c2Y0l41UZib+ur7OByCMuCExXj2f+Fr5eQZ+aiJQopyOgxGTZ5b1eeOoClkTMwmaxp0u
 dpZPAOBnlRpYG7wJBDN2uNEp2/nHJbEtRINCIQ5Pjc/RfPOpriRpwtS5z1q9sjgLkOF0
 ojIw==
X-Gm-Message-State: AC+VfDyfJu8n6PtfdyKdIUgX8JLxjsTHJL0mx3p5Nxv76l54ZqtC+rZZ
 JMTgBMW2pmaub5bxj3V3UZ+DkQ==
X-Google-Smtp-Source: ACHHUZ6iXSFc89pEc1ZRUN4bocX90e7w4QbdZtcA6eBDExwPEqIS6dwa/9j3alUH/VrEWBxkwQ/PIQ==
X-Received: by 2002:ac2:511d:0:b0:4db:3ddf:2fbd with SMTP id
 q29-20020ac2511d000000b004db3ddf2fbdmr2048547lfb.45.1683480400192; 
 Sun, 07 May 2023 10:26:40 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s17-20020ac25fb1000000b004f14898d18esm1023994lfe.85.2023.05.07.10.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 10:26:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/panel: sharp-ls043t1le01: adjust mode settings
Date: Sun,  7 May 2023 20:26:38 +0300
Message-Id: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using current settings causes panel flickering on APQ8074 dragonboard.
Adjust panel settings to follow the vendor-provided mode. This also
enables MIPI_DSI_MODE_VIDEO_SYNC_PULSE, which is also specified by the
vendor dtsi for the mentioned dragonboard.

Fixes: ee0172383190 ("drm/panel: Add Sharp LS043T1LE01 MIPI DSI panel")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index d1ec80a3e3c7..ef148504cf24 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -192,15 +192,15 @@ static int sharp_nt_panel_enable(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode default_mode = {
-	.clock = 41118,
+	.clock = (540 + 48 + 32 + 80) * (960 + 3 + 10 + 15) * 60 / 1000,
 	.hdisplay = 540,
 	.hsync_start = 540 + 48,
-	.hsync_end = 540 + 48 + 80,
-	.htotal = 540 + 48 + 80 + 32,
+	.hsync_end = 540 + 48 + 32,
+	.htotal = 540 + 48 + 32 + 80,
 	.vdisplay = 960,
 	.vsync_start = 960 + 3,
-	.vsync_end = 960 + 3 + 15,
-	.vtotal = 960 + 3 + 15 + 1,
+	.vsync_end = 960 + 3 + 10,
+	.vtotal = 960 + 3 + 10 + 15,
 };
 
 static int sharp_nt_panel_get_modes(struct drm_panel *panel,
@@ -280,6 +280,7 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 2;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+			MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 			MIPI_DSI_MODE_VIDEO_HSE |
 			MIPI_DSI_CLOCK_NON_CONTINUOUS |
 			MIPI_DSI_MODE_NO_EOT_PACKET;
-- 
2.39.2

