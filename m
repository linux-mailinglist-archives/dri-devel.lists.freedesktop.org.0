Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317158BB5E2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60B01129FD;
	Fri,  3 May 2024 21:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Uj4IxLlj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800E61129FD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:32 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1ecd9dab183so19697105ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772191; x=1715376991;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ivwzpk8LV8o9VOgpaEI0wSikxdx7Ris0rIA4UDrHOxM=;
 b=Uj4IxLljsHU8f9iqXkcELEtu7bHvpfHM1mwQ+eCgI4z8/TM8lLp/Cg8fxIGWGPRrOH
 ojTsxI1WNkrKbrufZc0RwsuNdkXGjgKr3PXl8XGJmvKNlpVZ223J9VFY+rmpcU8ajZp/
 wGm49SgeQioT9QwN6X3fum6qXOFWQsFmOmOhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772191; x=1715376991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivwzpk8LV8o9VOgpaEI0wSikxdx7Ris0rIA4UDrHOxM=;
 b=MJ/khWhG1iza6MSHXByD8PhbOxUvTtbbdHidyWPVegHYpFSEKpQrxzsgDoK9JWfERr
 xbx4GlZE64jPmKmGdS1RmSKgpqhSMO41eG2MtG97FdzLM7Be93RudzCCqs6i6T0IWQEJ
 XhaNWdiN43R5pMIIoqnyNejKNswVHCcJ2glZJdrHxW6n5jak1m3sun2c27geoy8VyK7X
 yY1ppQ35FyTM0D2k9ftnPesAOdLzSmIyNS7vakYXZ15eA265CCg6/maEazDxVrXXD8AC
 mTzSrWwfVQVjr5l61ogTnnGDpk83sN+pHg90L3Eonpz5EpbB/keAOH+FBHk7cPK4AzBc
 wMXg==
X-Gm-Message-State: AOJu0YxRlBZ+ETJi8e7ULUbD8NVrlg/vHqpX+TEnjck6LM7w3GC4e4Jr
 r78sxokCLe0wMyxqCP3dpG3wI5TlzvNsY6smGu907Fu21XRPwSFbYGA1esHeinLhXvk7xvhlD0Z
 /2A==
X-Google-Smtp-Source: AGHT+IEhtQwHX90SwQBe2NnOXhamncltrhxwpD6fYsYZstR87YJRnxBbL7AN6shwzv3NIn/AynD71A==
X-Received: by 2002:a17:902:d093:b0:1e0:a2cf:62e8 with SMTP id
 v19-20020a170902d09300b001e0a2cf62e8mr6761839plv.10.1714772190912; 
 Fri, 03 May 2024 14:36:30 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jerry Han <jerry.han.hq@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Rock Wang <rock_wang@himax.com.cn>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [RFT PATCH v2 03/48] drm/panel: boe-himax8279d: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:44 -0700
Message-ID: <20240503143327.RFT.v2.3.I19086c524d38f28f746befe85cb39ffda9d2f666@changeid>
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

Cc: Jerry Han <jerry.han.hq@gmail.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rock Wang <rock_wang@himax.com.cn>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 12e14615298b..df746baae301 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -894,14 +894,6 @@ static void panel_remove(struct mipi_dsi_device *dsi)
 	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = drm_panel_disable(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
-	err = drm_panel_unprepare(&pinfo->base);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
 	err = mipi_dsi_detach(dsi);
 	if (err < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
@@ -909,14 +901,6 @@ static void panel_remove(struct mipi_dsi_device *dsi)
 	drm_panel_remove(&pinfo->base);
 }
 
-static void panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&pinfo->base);
-	drm_panel_unprepare(&pinfo->base);
-}
-
 static struct mipi_dsi_driver panel_driver = {
 	.driver = {
 		.name = "panel-boe-himax8279d",
@@ -924,7 +908,6 @@ static struct mipi_dsi_driver panel_driver = {
 	},
 	.probe = panel_probe,
 	.remove = panel_remove,
-	.shutdown = panel_shutdown,
 };
 module_mipi_dsi_driver(panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

