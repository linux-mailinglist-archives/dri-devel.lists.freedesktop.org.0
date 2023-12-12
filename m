Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AE080E2D0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 04:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2350810E164;
	Tue, 12 Dec 2023 03:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDB910E147
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 03:33:17 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b70de199f6so141209839f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 19:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702351996; x=1702956796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYInYE6vgyZ8xggSLq7h777qBlps2bVu+HQMH76x0n0=;
 b=BptQeh0MnT67y28l7NPwP000s/LjNnZzlKJyz1mTd7sDhUrJKGagIQRwWZQxrFrmCE
 1O/QjwP43teLxIY2Lr6o7rUZOKJh/82IWMkSWyr3ivPSub+6hEi0BEzWcBkdpWO00QP0
 y6dy8vZFg29FUChLUFEVJs/UalH4aOl6yk2jRKl/bEMgekyHXbfrOCdv08ACYQS2QK0i
 CQxBh5uIj4kq8PlIxVH/N+Uc8op8c2ljVPIHZvfUStWv/ceU5iLxNRTo4EHuFFm0v+Mi
 GMQAf4BTaFhap2fZoce4YEQHscTolaVaq05MKTOt+H3ZG1UFOFLmz9RRC3EMCCmTShGY
 2bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702351996; x=1702956796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nYInYE6vgyZ8xggSLq7h777qBlps2bVu+HQMH76x0n0=;
 b=vaeFlDud816CpjLuxew9ZH6mdgrACr2Y1wVeS7FCCGNluv5GgDsO+OaolKt5v5ZuTk
 OeyM00RudLj2aDtdZ1ic6hxkDf0cMmy1tI+3pdx2KZkU6Nk/xjbFQ/K+L4V6YECwA9hP
 8ohmbr+/vbixmZIY0Gj12K17v9iXuGnF2Ks2TOEJmAeRXCrh4QXLCBUGk9fEFklCPJpS
 YXXI/9suWeyqa8ABUtuOlBL7QZaadv7MEiYXIoMDfrEO8iD2pujNcE0VRYpXxOXAKCsh
 46STWpkhjm0h5h6ugh36iz+kFz+Ghlt0WmLhY6CX6pWhr9Z3TvPljfbE6ZCQ/7z+xelG
 29SQ==
X-Gm-Message-State: AOJu0YwKQ6Jnqm6F9u6F3ZpK6SV54Xb3vgbCkM6bgCmd9xgLjFJdFHD2
 CqBwOw40CYLiMth6/iRO1PXr3ZAPdKvGpQ==
X-Google-Smtp-Source: AGHT+IG08MJ0IJU3QFb5acFcJOPuXxUtZCYC4nz6t5BQKhDRpUHFrucdvKe0afj1ildqn1g7OvRgBA==
X-Received: by 2002:a5e:a916:0:b0:7b7:19e3:a645 with SMTP id
 c22-20020a5ea916000000b007b719e3a645mr5176094iod.20.1702351995800; 
 Mon, 11 Dec 2023 19:33:15 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:6068:4690:ab38:4373])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a5e8717000000b007b457153a6bsm2590049ioj.28.2023.12.11.19.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 19:33:15 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation rounding
Date: Mon, 11 Dec 2023 21:32:59 -0600
Message-Id: <20231212033259.189718-2-aford173@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212033259.189718-1-aford173@gmail.com>
References: <20231212033259.189718-1-aford173@gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using video sync pulses, the HFP, HBP, and HSA are divided between
the available lanes if there is more than one lane.  For certain
timings and lane configurations, the HFP may not be evenly divisible.
If the HFP is rounded down, it ends up being too small which can cause
some monitors to not sync properly. In these instances, adjust htotal
and hsync to round the HFP up, and recalculate the htotal.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM with HDMI monitor
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 239d253a7d71..f5795da1d8bb 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1628,6 +1628,27 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
 	}
 
+	/*
+	 * When using video sync pulses, the HFP, HBP, and HSA are divided between
+	 * the available lanes if there is more than one lane.  For certain
+	 * timings and lane configurations, the HFP may not be evenly divisible.
+	 * If the HFP is rounded down, it ends up being too small which can cause
+	 * some monitors to not sync properly. In these instances, adjust htotal
+	 * and hsync to round the HFP up, and recalculate the htotal. Through trial
+	 * and error, it appears that the HBP and HSA do not appearto need the same
+	 * correction that HFP does.
+	 */
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lanes > 1) {
+		int hfp = adjusted_mode->hsync_start - adjusted_mode->hdisplay;
+		int remainder = hfp % dsi->lanes;
+
+		if (remainder) {
+			adjusted_mode->hsync_start += remainder;
+			adjusted_mode->hsync_end   += remainder;
+			adjusted_mode->htotal      += remainder;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.40.1

