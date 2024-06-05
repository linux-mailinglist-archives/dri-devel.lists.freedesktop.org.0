Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057C98FC06B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD4210E625;
	Wed,  5 Jun 2024 00:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="h4u1p50O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4267510E625
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:17 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so2936495ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547055; x=1718151855;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsRu3jEWU9sK1vmuNiyJjPrhOLNs5NH11TNjKSLZ2vI=;
 b=h4u1p50O8cf9eMp2w67sUIjSCr7W4n7QV5Vnjtx8y44r1RmQY6XsNFfrr0BIOJFKzK
 JrtX3AjfWh6Z40VsLghhQEXPldfJpiGZQVF4JhwRIfrVVsAq2ODHnF6zyaMGnIYswLyD
 Y5tAY8ViwPU6phQAc/8qNr0dhOXnTf5YRdGkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547055; x=1718151855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsRu3jEWU9sK1vmuNiyJjPrhOLNs5NH11TNjKSLZ2vI=;
 b=Y/OdP0EyrFd3hzqtU5d33pXvnYZxMxWmMmxNmixFz6+8lnYlbb6Ozz1By6tNbiPTkF
 rxutEoc8XRf3Lbtb8punWOuUGQwNHbch/5gRoxfQb8HDb39Qsy0wcPaevdINW5NrT+ph
 ACDWrZvB2n2gCMUKzMiBmiS0HVufCIOc7g1oN5VPphSm+3a8fZYEQZDMoa39c74molET
 VVXWvo69Fnj6+O4bi2oK4cRSj3hSVLvJqIBNlT8xwSQJF8SCvcceXxQJnFZYqifp0X5o
 Eq6VtGG3cM4tdxxvxoXIgtWOzY5q0YDSItaHBl/ehYufXd47IjqE6atKwl3b+ZK2oEww
 bnlg==
X-Gm-Message-State: AOJu0YzSIlK8OEZmcn5iS/geXPTfelmvIKEB6yhEgc7wSbGPVfjMvEZd
 H5Vhzim7a5QyKxHKlppk+tjpHhiFb7CgKhrMYeBmv2MQ3fh3FAq126lKpPG6uHIkD9xWBzhlhpY
 =
X-Google-Smtp-Source: AGHT+IEuttE4Gs9JJB+IuOsNqsKWp7EyRVQUbEuRZzgK3b55KLaK0AVYQ/oG9ywbjEwvWBwh98g+5w==
X-Received: by 2002:a17:903:2303:b0:1f6:a572:86ab with SMTP id
 d9443c01a7336-1f6a572a1d3mr22763635ad.15.1717547055143; 
 Tue, 04 Jun 2024 17:24:15 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jerry Han <jerry.han.hq@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Rock Wang <rock_wang@himax.com.cn>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 02/24] drm/panel: boe-himax8279d: Don't call
 unprepare+disable at shutdown/remove
Date: Tue,  4 Jun 2024 17:22:48 -0700
Message-ID: <20240604172305.v3.2.I19086c524d38f28f746befe85cb39ffda9d2f666@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

