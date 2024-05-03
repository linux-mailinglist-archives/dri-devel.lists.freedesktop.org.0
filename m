Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7B8BB5EA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8D7112A05;
	Fri,  3 May 2024 21:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ETUuttk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E309112A05
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:48 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1eab16c8d83so854755ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772206; x=1715377006;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AM3srp3tc9xHdA4+vQgvWU13AmEZ/1q1evFgoZKKMpU=;
 b=ETUuttk8VpHAlXc/Phhu08iW19QpEm4lWVAuDmbJsSssj6cBX3+gyHCUqvxJilNUBk
 O5vG8ahDpE57WT7BG3rSJ/S55TlA4pFuPxlgjaZ7VoAPBsVBmkQfJoBBvoUKukCO1Kxs
 Pa20UF5HXv1zGPizyVLeU8PKpOITIcNPG6TB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772206; x=1715377006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AM3srp3tc9xHdA4+vQgvWU13AmEZ/1q1evFgoZKKMpU=;
 b=Q0W6TGDj1h1SPTndlcc1yjkhtnkutfA1xcD3+TfyJ6VH7ncNIWR7yF24xkryiBJVpX
 odYYGkxSjYi6FmI6BiXHU1PqOvibtmNNJ/LahM/c9gEe3fqawl1GFLZJj/7z/hXu5k74
 Fv8EwQuqZwDH8dbgOcDTqnywOa9ix8OyBZn96nMXQ4/O5JOIiT5dksdpMfgh7t8ltq3R
 YMR9EfsamRvzvNeTlCZ3KDtJVLQggfPP/gKr4fuRs/RAwNKgx12z1BbBhC+QJ2vI5648
 4QEmDobpHt6e9QrMuhUHd7UHNWg9lqKANdXqMVX9XhWI2bJ5rP2o7VGzsdlU0tJwco6a
 /fAw==
X-Gm-Message-State: AOJu0Yy4CdPvA+gNaCuFCa1iFz0xMJPSw7H1Fg8DuBu/FsytfaRq5hVN
 jH2pGvYZ0BZ1jp7Swq1deqFXXBsycLpdk0lK3PQcbC2hcsJU2u0Legyhk73i3JiiDyDWtUlc24z
 Vcw==
X-Google-Smtp-Source: AGHT+IHQD9LkPID127xDFcCRAQJiVGTr5XKbdWyjPjZmELM/1pOIiovaPXVxv+TzcgrmiYCp2kAmvQ==
X-Received: by 2002:a17:903:1211:b0:1e0:115c:e03c with SMTP id
 l17-20020a170903121100b001e0115ce03cmr4713172plh.53.1714772206553; 
 Fri, 03 May 2024 14:36:46 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Chris Zhong <zyw@rock-chips.com>,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 09/48] drm/panel: innolux-p079zca: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:50 -0700
Message-ID: <20240503143327.RFT.v2.9.Iaddb8e0cab570e2f8066a4baf1d49239a820b799@changeid>
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

Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Lin Huang <hl@rock-chips.com>
Cc: Brian Norris <briannorris@chromium.org>
Cc: "Heiko Stübner" <heiko@sntech.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 5833d3a0fc79..280f0fc35b67 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -471,13 +471,6 @@ static void innolux_panel_remove(struct mipi_dsi_device *dsi)
 	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_unprepare(&innolux->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
-	err = drm_panel_disable(&innolux->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
 
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
@@ -486,14 +479,6 @@ static void innolux_panel_remove(struct mipi_dsi_device *dsi)
 	innolux_panel_del(innolux);
 }
 
-static void innolux_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_unprepare(&innolux->base);
-	drm_panel_disable(&innolux->base);
-}
-
 static struct mipi_dsi_driver innolux_panel_driver = {
 	.driver = {
 		.name = "panel-innolux-p079zca",
@@ -501,7 +486,6 @@ static struct mipi_dsi_driver innolux_panel_driver = {
 	},
 	.probe = innolux_panel_probe,
 	.remove = innolux_panel_remove,
-	.shutdown = innolux_panel_shutdown,
 };
 module_mipi_dsi_driver(innolux_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

