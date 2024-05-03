Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6DF8BB5FD
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DECB11329B;
	Fri,  3 May 2024 21:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MC9Fs8W2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6123511329B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1e834159f40so687075ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772238; x=1715377038;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjHl+DB7wvFQ0erRTiSGp5Vkb60hgkc17VF3W8JYnEQ=;
 b=MC9Fs8W2cmSAdbwD+K9rNrtvdOVKoBaHusOUIiU+wieqpbdGMwGbhRUi0ftxhVCRKV
 ibv+z1OjDq7XtjUA1l/jL+mvowxHC2fv0CB7//bCCtoMcZWUTO0SR/yAA15owm9Z2OJC
 YUk7eaoqEXfzTj54Jp+dm3lSX/yKJNjYjsjeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772238; x=1715377038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjHl+DB7wvFQ0erRTiSGp5Vkb60hgkc17VF3W8JYnEQ=;
 b=wlqys++/Bd7duXh0jeJ+j0gSzLIvffvcn5RF0REECJEr9fvZnETt69xvq+t1K73X/b
 lwqzQa+bbBRrA8HMxdxfCZDcOuhPobL+5eDOkpDcfcId0TP1AC/FGk0e+WH7jVEEU9Qw
 F4SIAHqMnzesjr8g599K/YNgxCT0xSZRWmyz2MqtyNforZWAZp5QlrgFmaDA9Vod4sa6
 w4aWCJgs3EzKJw7Q/LfEVsyjDIGGEYARxuxnD7iKtsLPv0+ZC5ZbelWLQFESvSRmmCua
 qh9ftsGjbNlJeLd1LdsfEqzHVyMWiPMid+77hxpGAsrgxOVrVnjeSKppcOg8GzRrPvud
 DcUQ==
X-Gm-Message-State: AOJu0YxMKXR/3FC8ZdnBpJ1eHrxlL7aFjxrXwaQpZZwvtM9msTRxYI4q
 MmggLoUhwQ9wpLOKrTV1v9JWg8xLoeVIDP8f1ef+2QuYsxzT92uFPQJgmntgaJRp0QBy4zwboV+
 P7Q==
X-Google-Smtp-Source: AGHT+IHGkmJTrA+QEdoj0aZR/Y9uwm9CMi5KsoludQGf1jksEPkLR67IdZOHw27LEYo4LBKbqkaXGw==
X-Received: by 2002:a17:902:e807:b0:1e5:556:60e2 with SMTP id
 u7-20020a170902e80700b001e5055660e2mr4570462plg.5.1714772238405; 
 Fri, 03 May 2024 14:37:18 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 23/48] drm/panel: osd-osd101t2587-53ts: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:04 -0700
Message-ID: <20240503143327.RFT.v2.23.Ic533ce1323b94230d4155f9364c2b7c1bc47e798@changeid>
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
indicates that it is used by TI OMAP boards. The OMAP driver appears
to be correctly calling drm_atomic_helper_shutdown() so we can remove
the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index c0da7d9512e8..dbea84f51514 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -186,11 +186,6 @@ static void osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
 	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&osd101t2587->base);
-	if (ret < 0)
-		dev_warn(&dsi->dev, "failed to disable panel: %d\n", ret);
-
-	drm_panel_unprepare(&osd101t2587->base);
 	drm_panel_remove(&osd101t2587->base);
 
 	ret = mipi_dsi_detach(dsi);
@@ -198,14 +193,6 @@ static void osd101t2587_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
 }
 
-static void osd101t2587_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct osd101t2587_panel *osd101t2587 = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&osd101t2587->base);
-	drm_panel_unprepare(&osd101t2587->base);
-}
-
 static struct mipi_dsi_driver osd101t2587_panel_driver = {
 	.driver = {
 		.name = "panel-osd-osd101t2587-53ts",
@@ -213,7 +200,6 @@ static struct mipi_dsi_driver osd101t2587_panel_driver = {
 	},
 	.probe = osd101t2587_panel_probe,
 	.remove = osd101t2587_panel_remove,
-	.shutdown = osd101t2587_panel_shutdown,
 };
 module_mipi_dsi_driver(osd101t2587_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

