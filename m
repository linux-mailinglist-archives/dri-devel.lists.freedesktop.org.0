Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782428BB5EC
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DC3112D84;
	Fri,  3 May 2024 21:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OlEa2q9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C53112A09
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1ec4dc64c6cso1156305ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772211; x=1715377011;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpAqyGRZ35mrxRmKBHfboZzq/mHfdewzPnwv0OdchAs=;
 b=OlEa2q9nTLc4KgRybtpqaooRrkWpRil5myza9cBrn9/w3WCRGXpzO7/HTMlvoJ7sW4
 9b7kmOtiO6ItUdozRJVci6SE9phcDvG8FdP+iDlwIUOdwEYTUSCA9l0aEMzyWzROoB3O
 xHE3dZVI2DZBpBj9GthIxw7GDi8WI9W0psjtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772211; x=1715377011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpAqyGRZ35mrxRmKBHfboZzq/mHfdewzPnwv0OdchAs=;
 b=WXQwuK34zxXd7odC0tXKR7DGVNfvpQkz/vjEZMkJ9IXHqSX8tgPWV5L36Dmp4OXDJj
 wONcpLD/CavE2frCru9ASc1XGhA0KdePfpvX5ZAjN/jg/17zrWvCqEu0heVUyZePwsxw
 VjP062ZYq+2m15XfshOzKxEZOZY/jDyVRJ/T7rZkZWHzjnuJYm11NxlA3gJG3vl1vUud
 1BOT59ITe/TR5+AyakgA+7xXhSDXQppHJfY4x2G408aP5GG0Bx04rpI98BWKMqJyQTbl
 EhtVNxyK1yMUMwjplp009ruidCV3xG1dLCKj/Cv4/77l8e7zh2/dJ9s8vHxnvR/vkYTa
 CMyA==
X-Gm-Message-State: AOJu0Yy7LmXRQpiAxYp9QFaD7o9Ok5GVG1RyHuBiebxuO3wP6qcSZCAH
 hGdYbqQBAtuawWgvS63YIHYXLYSSz8TX3U06VQf9c9JIpUpAUVTLzK81oZh2SoZy1JuS6rhFnv3
 oQw==
X-Google-Smtp-Source: AGHT+IHPgak4KhT/VY1k6i6WU80Ppl8jX085UmJogG4vsMPYn1oTd7Du1ToJIYk6Efeso5tSI4Y1lg==
X-Received: by 2002:a17:902:ce87:b0:1e0:983c:d686 with SMTP id
 f7-20020a170902ce8700b001e0983cd686mr5162135plg.20.1714772210940; 
 Fri, 03 May 2024 14:36:50 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jacobe Zang <jacobe.zang@wesion.com>, Nicolas Belin <nbelin@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 11/48] drm/panel: khadas-ts050: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:52 -0700
Message-ID: <20240503143327.RFT.v2.11.I1ee65e7905bf5bf46a0e6c5126ac3c7aa25cb80b@changeid>
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

Unfortunately, grepping mainline for this panel's compatible string
shows no hits, so we can't be 100% sure if the DRM modeset driver used
with this panel has been fixed. If it is found that the DRM modeset
driver hasn't been fixed then this patch could be temporarily reverted
until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Jacobe Zang <jacobe.zang@wesion.com>
Cc: Nicolas Belin <nbelin@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-khadas-ts050.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index e35762ebdbd1..14932cb3defc 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -880,16 +880,6 @@ static void khadas_ts050_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	drm_panel_remove(&khadas_ts050->base);
-	drm_panel_disable(&khadas_ts050->base);
-	drm_panel_unprepare(&khadas_ts050->base);
-}
-
-static void khadas_ts050_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct khadas_ts050_panel *khadas_ts050 = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&khadas_ts050->base);
-	drm_panel_unprepare(&khadas_ts050->base);
 }
 
 static struct mipi_dsi_driver khadas_ts050_panel_driver = {
@@ -899,7 +889,6 @@ static struct mipi_dsi_driver khadas_ts050_panel_driver = {
 	},
 	.probe = khadas_ts050_panel_probe,
 	.remove = khadas_ts050_panel_remove,
-	.shutdown = khadas_ts050_panel_shutdown,
 };
 module_mipi_dsi_driver(khadas_ts050_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

