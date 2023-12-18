Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F49817981
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8F10E28E;
	Mon, 18 Dec 2023 18:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE54610E290
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:20:28 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a234dc0984fso193705466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702923627; x=1703528427;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CX2gA6r/dtvGkH0YEYWwI6mzbAd5lMyIJziHnyg55Q=;
 b=fvhZ1lIjD4ghUur3u11IySseoO0BduorZxfAjkW9I5peMy9zjgk9p2L78OzOxn97G9
 iMVQV0Se+YqOI2dp6OOMMCzMq9YxMcghazQCkWAXZ4ljOYi0dgBBNn0smSTHCSfAD3nQ
 euw5EgpLaQ2HEKBLL/+43RXfwYbxX1smGhK1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702923627; x=1703528427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CX2gA6r/dtvGkH0YEYWwI6mzbAd5lMyIJziHnyg55Q=;
 b=HTmwxh0XjfjoIKAjS//jvhD8snbluRc6xqKLitZny7E2L7OQUydunmGApqVbY83Vas
 Vng88uffi4VDicZH1QzJUUxJbG7zCR5x9hFTmlBj7mkajiNsJXFbfo8ddnob2GSpfN8D
 hGW8q1x0wg31YuHqngR9rAVLcXVScW3CGmcCzWsMQxIsu6hniXgqePCmKD0RaTLyGABg
 FYQLfeJuSrXRwxhJpPs7i75l7YDmxtfv40xj3weMdaUAXpTJ4D90xTst7nQOuptD6L1M
 R6kimvCEwbZpqvqQuWLDk5ULTwaFjH3/PsxSzsmx9zKX4FZcR60dW04FiIWvotPdp69B
 ib3A==
X-Gm-Message-State: AOJu0YxDhjMoMcZc2+BCq7/A9yfttTCwTZD17R65uMaVleVXf9SS8uXg
 6+L5DvrbGfbBm1ABZR4+G5T2kfpqstt5QMt1SpX7Jw==
X-Google-Smtp-Source: AGHT+IFQIjmnqwJHXBWuNV3lOiYbeAZ7NPxnsnxpiSweOVnDxxJk9dtKKOT/fn1raM0scBnAt9eeTA==
X-Received: by 2002:a17:907:e8d:b0:a1f:5e5d:d71b with SMTP id
 ho13-20020a1709070e8d00b00a1f5e5dd71bmr10134407ejc.40.1702889042999; 
 Mon, 18 Dec 2023 00:44:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 un5-20020a170907cb8500b009ff77c2e1dasm13775480ejc.167.2023.12.18.00.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:44:02 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/2] drm: bridge: samsung-dsim: enter display mode in the
 enable() callback
Date: Mon, 18 Dec 2023 09:43:37 +0100
Message-ID: <20231218084354.508942-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218084354.508942-1-dario.binacchi@amarulasolutions.com>
References: <20231218084354.508942-1-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, michael@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The synaptics-r63353 (panel-bridge) can only be configured in command mode.
So, samsung-dsim (bridge) must not be in display mode during the
prepare()/unprepare() of the panel-bridge. Setting the
"pre_enable_prev_first" flag to true allows the prepare() of the
panel-bridge to be called between the pre_enabled() and enabled() of the
bridge. So, the bridge can enter display mode only in the enabled().
The unprepare() of the panel-bridge is instead called between the disable()
and post_disable() of the bridge. So, the disable() must exit the display
mode (i .e. enter command mode) to allow the panel-bridge to receive DSI
commands.

samsung_dsim_atomic_pre_enable   -> command mode
r63353_panel_prepare             -> send DSI commands
samsung_dsim_atomic_enable       -> enter display mode

samsung_dsim_atomic_disable      -> exit display mode (command mode)
r63353_panel_unprepare           -> send DSI commands
samsung_dsim_atomic_post_disable

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index be5914caa17d..15bf05b2bbe4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1494,7 +1494,6 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 			return;
 
 		samsung_dsim_set_display_mode(dsi);
-		samsung_dsim_set_display_enable(dsi, true);
 	}
 }
 
@@ -1507,6 +1506,7 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
 		samsung_dsim_set_display_mode(dsi);
 		samsung_dsim_set_display_enable(dsi, true);
 	} else {
+		samsung_dsim_set_display_enable(dsi, true);
 		samsung_dsim_set_stop_state(dsi, false);
 	}
 
@@ -1524,6 +1524,8 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
 	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
 		samsung_dsim_set_stop_state(dsi, true);
 
+	samsung_dsim_set_display_enable(dsi, false);
+
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
@@ -1532,7 +1534,8 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
-	samsung_dsim_set_display_enable(dsi, false);
+	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
+		samsung_dsim_set_stop_state(dsi, true);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 	pm_runtime_put_sync(dsi->dev);
-- 
2.43.0

