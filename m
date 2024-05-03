Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCEF8BB611
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C0A1132A5;
	Fri,  3 May 2024 21:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kIm/fjTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201F21132A5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1ed0abbf706so1072815ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772275; x=1715377075;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZ2bcwxBHMvzwpRFsoGmIetgpC7SnvJGS8R4x5ACAaI=;
 b=kIm/fjTxUZ2JLcTYjOvXZH/mQOT2UxC/w1kSuy8UIzTcQAfWKRtqf1hUsegEj1PahU
 +RdjYGvRR2zFv39nrB4oXOX84a8irnb3QHnALHqGlwe0Qj7NV+N/HSkMpLTGezIUqYF1
 smkQxfhp3Y0O4C3dC8m0dsCjOaLPDkJJxoQkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772275; x=1715377075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZ2bcwxBHMvzwpRFsoGmIetgpC7SnvJGS8R4x5ACAaI=;
 b=eEZzQ9wK896T232ZnVUMvf60udrXfsKnxA/78onaJhDyIBBYO8AdmfNx+jpLcYtYD3
 hvFjiYHKb/sHI1aX6YMQAcMQVvd1hZ/mf7gJVDgn+X44nFbpjG8Verp21VaUDGqcKD2k
 lpe2wR6t0E6kJvONYhzMGVq9yixhBPS0xUZ2iIfuV7rz4dNEJ8xokkeFW8EaNqyaLCzA
 PYBZUSU/Af6Mf22SrrJOuNdRoI58eUmknVff34v8rd1PtoiEb8PoEzGw+YXqaW7Air0p
 sgNXLGd9lLkBQ1+thTMaHavRZMWF9rnyKfY5mfFHhf7mzY+H4xHGVCw3nAH5NYzZZjX4
 iVUg==
X-Gm-Message-State: AOJu0YzixAuzP2ZBU3jhTlLylTm6SahKGezVC8bBsopae5zieu/HSoK4
 a7clbMFnkFAxRbIao9yIyx3O1mWAQb4loruie4tpzhkKOq/0KvZS5b9s3c3nYk8Ah18M7UX3g0P
 wXg==
X-Google-Smtp-Source: AGHT+IF4B6Nfr3ZtrpYHNA9pejG1rE3AiUgc8H89qrn9KVvMkhOXg6EYM81DsPyLvBFCo2ge0DZf3A==
X-Received: by 2002:a17:903:2306:b0:1eb:1af8:309f with SMTP id
 d6-20020a170903230600b001eb1af8309fmr5575949plh.4.1714772274987; 
 Fri, 03 May 2024 14:37:54 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 39/48] drm/panel: sharp-lq101r1sx01: Don't call disable
 at shutdown/remove
Date: Fri,  3 May 2024 14:33:20 -0700
Message-ID: <20240503143327.RFT.v2.39.I6a87fce1ee027c96f71c7adf74248b865f50b336@changeid>
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
indicates that it is used by Tegra boards. The Tegra driver appears to
be correctly calling drm_atomic_helper_shutdown() so we can remove the
calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   | 24 ++-----------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 8f6c21b99522..edc9425bb143 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -357,32 +357,13 @@ static void sharp_panel_remove(struct mipi_dsi_device *dsi)
 	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	/* only detach from host for the DSI-LINK2 interface */
-	if (!sharp) {
-		mipi_dsi_detach(dsi);
-		return;
-	}
-
-	err = drm_panel_disable(&sharp->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
-	sharp_panel_del(sharp);
-}
-
-static void sharp_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
-
-	/* nothing to do for DSI-LINK2 */
+	/* only detach from host for the DSI-LINK2 interface */
 	if (!sharp)
-		return;
-
-	drm_panel_disable(&sharp->base);
+		sharp_panel_del(sharp);
 }
 
 static struct mipi_dsi_driver sharp_panel_driver = {
@@ -392,7 +373,6 @@ static struct mipi_dsi_driver sharp_panel_driver = {
 	},
 	.probe = sharp_panel_probe,
 	.remove = sharp_panel_remove,
-	.shutdown = sharp_panel_shutdown,
 };
 module_mipi_dsi_driver(sharp_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

