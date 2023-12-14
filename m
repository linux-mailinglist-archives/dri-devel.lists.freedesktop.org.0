Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29892812A4A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 09:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6ED10E00E;
	Thu, 14 Dec 2023 08:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0622B10E190
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 08:25:25 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54cb4fa667bso10835287a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 00:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702542313; x=1703147113;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CX2gA6r/dtvGkH0YEYWwI6mzbAd5lMyIJziHnyg55Q=;
 b=mFmlfJcHF2rPgTXTUDbzBKjbIKFyeuqRN/4eZ27UxSxcQNxmTJcxGQIKpHiLgXVaI0
 uoZwX1qD+0L7TkakRlXhUTHrM1MuaFmiw2QJ+Q4e0XXfFLCFGnuRz+ExKiTN2Bt8Vpwf
 ciYAtRAwUWlCDzwqEESC5lThK7YJ8cN0oIG48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702542313; x=1703147113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CX2gA6r/dtvGkH0YEYWwI6mzbAd5lMyIJziHnyg55Q=;
 b=kguCA4Q0FPazz/DF+e2HpQ4sJaKj36jIar1SPrs2Y3CvnCX9cwFTGyOQivdMJB6u3c
 7mI24CuXCCwiT/tIFgFXWXbnOZDUnbEeq33Gomy5jGgFZWeujjOJz2uk6Vl2CYe3HWZp
 ECHy/MCZ9csdCvJPQSywObY98jNS7gWr4Akp/Eh3lzg4GE+gt5WnWcWrzmjQwCgD47MX
 P+ScPrX2oT0U/3ZhyXSVAJsZtUmRjy1dad6yrF6IxMtC5D121hsxUW0SDP6LCBejiqa8
 682UfLsaVN0lYbYTH5RJJrNVpy/oUv2bq5DYmmLVsgrnBFTIyWhr8xvpgg9mhCi+AO9L
 fHJw==
X-Gm-Message-State: AOJu0YzRixqx9TpVsTTqQXTsB9xOKcUa4l+/oSXEhKrAOlYwD+RugRhr
 c8hmhplPAmjf6IVvE3GKL8r4Rw==
X-Google-Smtp-Source: AGHT+IHF4E5ZXAJ7k9yW6OZicnPe/2G1D5mDGKYNCrdLUzGFly0U1BjdwjZ7QckvyF4kOjAAOPBVOQ==
X-Received: by 2002:a17:907:94c9:b0:a18:4cf3:c8d0 with SMTP id
 dn9-20020a17090794c900b00a184cf3c8d0mr5637071ejc.49.1702542313003; 
 Thu, 14 Dec 2023 00:25:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 hw18-20020a170907a0d200b00a1cbe52300csm9026226ejc.56.2023.12.14.00.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 00:25:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/3] drm: bridge: samsung-dsim: enter display mode in the
 enable() callback
Date: Thu, 14 Dec 2023 09:24:04 +0100
Message-ID: <20231214082457.18737-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214082457.18737-1-dario.binacchi@amarulasolutions.com>
References: <20231214082457.18737-1-dario.binacchi@amarulasolutions.com>
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

