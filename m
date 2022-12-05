Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5269642EE3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E6710E26E;
	Mon,  5 Dec 2022 17:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5E710E26C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:33:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id y16so19759186wrm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNbuTJsW5iDjZ5bVEjjDMURKNgB71MXg4jy8qHcnjho=;
 b=gnwP+Dr4JylUbLtMvI3OW7jFwd7LtHJF4DJwwIM0DaWpDWH05Hc6+wLPBCtdQWcrfw
 b5FaHgOxaPriZ5QXVw6dkPcmYLUtK7/uxSYcUCaYQYLl2hX5K8vcXM5Ujg8OyVdojRLi
 7+Ddx0MXdvXqGQg95IfxxZ9n36bl5SGdO6mLBE6kowgCAUBwFaEiwzv0JQ/Gp+MYOb+9
 3Fp0Ee/xNqku9alAen3zjdBU8720K8c2Ep7R2xkOiSr0EZXg8tplNRaWZMWJc28vWewU
 aq8VlstmaJdPQgdaGfZzWcOsY9GMvpNvT7gacd+MKLWBNsWnqK5QYht10lfjKMEON3Ep
 yXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jNbuTJsW5iDjZ5bVEjjDMURKNgB71MXg4jy8qHcnjho=;
 b=Duln1lX2pxk1x9D7K0/48zSuwQhbyUOR28xiNGrJ3vc2O8uEU9mUKx4+T4ZW8zBLMN
 eE8PkaSVouXx0CrU+5SdM+5tDTA6kbHp8qJBh7VXo6FwMDddDVbuLAe5G7qwbJU1nVac
 1ToPvMB220hSiBO+6JB1uchdhRFAj8l0qjiGh8hlfhc0Yj2ulvI2FTVT1FJcPUcMjzx7
 HBMS7/PCV6a55KSzpzikwDqr9mWE4zAKoKSTQhIVJkbtkLbkGL8F0rXdnsAs5rqnG/RW
 VAa/so7cCLZjt8oJ4DvGvpzGo6iYYh+fp+tPqjhfJSlYgL18h5jC9vYcA1Kh9n/wip0x
 GG8g==
X-Gm-Message-State: ANoB5pnsOhUtEUj5jEEdBSR95lb/tBmA+lrWy1ZBOYbsQn6WZ1yb6zk7
 wwyw057Djm8EtAoBESuJrL0z8w==
X-Google-Smtp-Source: AA0mqf7Qelq7reHIjlL501QumcXjcfkSapUbYyBd1H1XAtx2Mvh89bc7j/ZKZIrdtb2UVORCnEMW1g==
X-Received: by 2002:a5d:68c1:0:b0:242:15b5:59ac with SMTP id
 p1-20020a5d68c1000000b0024215b559acmr22188015wrw.128.1670261630651; 
 Mon, 05 Dec 2022 09:33:50 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002421ed1d8c8sm14524245wrw.103.2022.12.05.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 09:33:50 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/6] drm/panel: Add prepare_prev_first flag to drm_panel
Date: Mon,  5 Dec 2022 17:33:27 +0000
Message-Id: <20221205173328.1395350-6-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
References: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, andrzej.hajda@gmail.com,
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

