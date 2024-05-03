Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93598BB5E5
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473F1112A01;
	Fri,  3 May 2024 21:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="epieQBs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103D6112A01
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:37 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1ecddf96313so1021735ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772197; x=1715376997;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kta59gfQkdmQ0TL4kfPKXK/PL72P/0YD8zIuorS00AE=;
 b=epieQBs9qmqnvlmKyhkbyn1BgUi2DTP09m84nrAmWi9oQT8ERy9rO+2vRgLvndnAFB
 90h+grHFGXcwGqtC0SaynqF1U+pFFkB4vYlF7/6ph5tgh0FUCaA4bV7Uw/DV3TsvW1Cf
 tmPzTPGRCyXs5L0eNrMdgBv+FwAnnCSPGzynI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772197; x=1715376997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kta59gfQkdmQ0TL4kfPKXK/PL72P/0YD8zIuorS00AE=;
 b=uIIs3wARTOzu2zQqaL3SA08kD/AazK0Po0CI0TUrtziFoUSJR3Ej0II+EpUe7ppG4Z
 WW0tBjGSdsDduzHdNGcCjQBsFTdlWVOlfiPeGt706qSRtrIRg3fs1A5Xk8xUaU8UBRAA
 7J5BkgRVu8QjYlhh3cNADSaB241EVIvqPsBuWKINBb6SSdQIJilWVu8EIiKqkMM+qt9j
 yGvlsMQnx5I2xtV8LQpcf1M4uP2q2gcu3qbQNQXEp1D+soMFt1100/17PzYQ28nHQpYl
 lJI3LH9fSJBiuUPlGaBDMFhywvfAaF0rMGQFDVBHui0Yqh7kvqkFkizjhR/4qTExi/st
 nc7A==
X-Gm-Message-State: AOJu0YzpW7PWOpxN7GAcIQAkXEv7NffPYSlFqS7TFtsgYEBjBJLYxYqk
 uiuqiXw2O6zfEPjQN95629PWOjeu+6hsc0pzsTKjwe0uw1Bw8iNO+SixCVu3mJxCKwtxD0umyWa
 9Hw==
X-Google-Smtp-Source: AGHT+IHVhWhn4/nQtVyQZZLqUsnywWTqYGnhPIFneTo2Pek/30GOWy84nbyfus1Fy+LIRhpR3w7cFQ==
X-Received: by 2002:a17:902:d4c7:b0:1e5:4f5:7fa7 with SMTP id
 o7-20020a170902d4c700b001e504f57fa7mr5769734plg.21.1714772197003; 
 Fri, 03 May 2024 14:36:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [RFT PATCH v2 05/48] drm/panel: boe-tv101wum-nl6: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:46 -0700
Message-ID: <20240503143327.RFT.v2.5.I5bd120aa0b7d17a1149ea43cc4852492834058c0@changeid>
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
indicates that it is used by Mediatek and Qualcomm boards. Both of
those drivers appear to be correctly calling
drm_atomic_helper_shutdown() so we can remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 667e1bb4a58b..77b20e24cac7 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1910,21 +1910,11 @@ static int boe_panel_probe(struct mipi_dsi_device *dsi)
 	return ret;
 }
 
-static void boe_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&boe->base);
-	drm_panel_unprepare(&boe->base);
-}
-
 static void boe_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	boe_panel_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
@@ -1972,7 +1962,6 @@ static struct mipi_dsi_driver boe_panel_driver = {
 	},
 	.probe = boe_panel_probe,
 	.remove = boe_panel_remove,
-	.shutdown = boe_panel_shutdown,
 };
 module_mipi_dsi_driver(boe_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

