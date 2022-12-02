Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B866408B8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3FE10E0BD;
	Fri,  2 Dec 2022 14:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E700710E40F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:47:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h11so8087063wrw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNbuTJsW5iDjZ5bVEjjDMURKNgB71MXg4jy8qHcnjho=;
 b=CtLibbJtUG3gGlxnNN+688gCyeyI8TfnU+gqo3iiFzZMkySOF9K0JT/SCSnClKsUjo
 ulw+zZ/II5V9pYTtjiofa1f7aFHOPz6KH/ldMz0XG7bI/nsu/LdJw0V/k8+beJWQBC5I
 jBjh4YqPKR4qF8BLUNOlmh6AvJ7M9d7eL4CL83q/hSZJ0p/vjTLHG0oHTsUUCiie4bY2
 2CizK2qlF4mSUKm9GKfhFJpuz4VE79tkFm0lYoSonnALu8Cu5QE//4fsk8mIwDBOC+Wk
 t3I/bAq5F/loeeE/GL0Mx8S0HxntNlvF4ii3HLPc/WAnlCKGQD3PIsxbW5qsczAApRgX
 WH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jNbuTJsW5iDjZ5bVEjjDMURKNgB71MXg4jy8qHcnjho=;
 b=isO/Y2i1RUex2mAyUVEID4HXKWltOZ67oyF2OfLtQXWUalooPRQrC0Yfaod8pl64wS
 PetGXic7jlSAOLjClNtiEx3CglbHrbt8sfuPvKkT3uq8Z+i1+CzwQMzYweVuc4Hu50WK
 KVuF86VrrD0RSi8MAif92DRISZ4sOGwOO+a0pFxZHZPgDLnxcP/jh9N4ntqtXfT1Kyqn
 UkAudbAHko6D3U1/tEHspF6SZyoCYbD6UE8VjXAygP4rA7x33MxlD2cZPRbcDd6UUl5+
 ApNlYOaF/obnTCuluLXlwobLh5j6ibGXzHxD3h70Q+HknDQGjIyUzCmXuWAyV2OF9/ni
 Pwuw==
X-Gm-Message-State: ANoB5pmvRkIk43Dbb+HehRWjMgnDcsOojPGPqdujAwYUBbr0fAPHe7Sw
 OqfsbN72yJfxxh45N61gwaE50Q==
X-Google-Smtp-Source: AA0mqf62udjpxIMBlKF3JrnHf1nJqLCE8TT5FXbdakCbWMT2dvFvpx8tEL0xA+6IhnhTxxVh2w8szQ==
X-Received: by 2002:a05:6000:70a:b0:242:22b0:4280 with SMTP id
 bs10-20020a056000070a00b0024222b04280mr10800559wrb.548.1669992457073; 
 Fri, 02 Dec 2022 06:47:37 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm10700152wms.44.2022.12.02.06.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 06:47:36 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/panel: Add prepare_prev_first flag to drm_panel
Date: Fri,  2 Dec 2022 14:28:15 +0000
Message-Id: <20221202142816.860381-5-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
References: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mapping to the drm_bridge flag pre_enable_prev_first,
add a new flag prepare_prev_first to drm_panel to allow
the panel driver to request that the upstream bridge should
be pre_enabled before the panel prepare.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/panel.c |  2 ++
 include/drm/drm_panel.h        | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 216af76d0042..03c3274dc3d9 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -364,6 +364,8 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 		devres_free(ptr);
 	}
 
+	bridge->pre_enable_prev_first = panel->prepare_prev_first;
+
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 994bfcdd84c5..432fab2347eb 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -188,6 +188,16 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
+
+	/**
+	 * @prepare_prev_first:
+	 *
+	 * The previous controller should be prepared first, before the prepare
+	 * for the panel is called. This is largely required for DSI panels
+	 * where the DSI host controller should be initialised to LP-11 before
+	 * the panel is powered up.
+	 */
+	bool prepare_prev_first;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.34.1

