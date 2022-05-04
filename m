Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9B519E34
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6926710F860;
	Wed,  4 May 2022 11:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5389F10F860
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:41:18 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so4941090pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zMs/ahjsuW/3pyoDPdTDx4JCwHHuvSLOtpCm4rKmrXg=;
 b=SVenTxQUkDyXsYbLphK8C8joex+YA17/52S2UEEQuasymHntl+gbZ6hBKGfef+rU9L
 BJgX/jpUAMw69v1x0Y+63HYOLAcQLEh8CeBdOZ2dDhfF9Aw/h08RNOdyD2yeDKkBh4QW
 i0nyfkpjGQYgLcHFOBKBcpeZ9N1J3/6o4DqJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zMs/ahjsuW/3pyoDPdTDx4JCwHHuvSLOtpCm4rKmrXg=;
 b=CAAEc+X41kMMgSYtW4sC2stpYhrAfcV7V8OqWFK+3GxXU7Jv6oRbVMKB+b9XGZytjO
 9EOvY0c4GnaQX/mEyuhVheSGOyTWd2CVrR15vEzVNBR5jRtSNLS1cQCfYVsn8LeoceFb
 uxT75evXhBUADkdbxV2kuBZyuOwG4z0Q4dKE4RU/P4DIUExVdeIcN02kxDcEGN+cU7nH
 I6JiRVuKm79fcMpNn3Xj9KJ0RxqukjJff0rvSVaAFoTJ22E66fUJY2RQSe4SKYmSy+9q
 bDIRKAxkYOiiB1zUOZe7QPFcBcv703646Xmr31daTu9gYva5KHa2cbeZ61aMtr63W5E6
 kNYA==
X-Gm-Message-State: AOAM532rJPX4HN8pwjc3uavaBybYd2yCx6guXh2eECUeRQP+ECFwrYbs
 TDvM1wfQ+KT5b9MIHQUiZoCV5A==
X-Google-Smtp-Source: ABdhPJxD8WMIBN5LbEmrgwis2/7My6i2oV6asbmrzISHufiZynRA61sNuZBJnYMXJamBVxlNiks0ew==
X-Received: by 2002:a17:90a:de87:b0:1d9:8264:baef with SMTP id
 n7-20020a17090ade8700b001d98264baefmr9889219pjv.227.1651664478075; 
 Wed, 04 May 2022 04:41:18 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:41:17 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH v2 05/12] drm: bridge: samsung-dsim: Add DSI init in bridge
 pre_enable()
Date: Wed,  4 May 2022 17:10:14 +0530
Message-Id: <20220504114021.33265-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Host transfer() in DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this
host transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the
controller setup for I2C configured DSI bridges.

This patch adds the DSI initialization from transfer to bridge
pre_enable as the bridge pre_enable API is invoked by core as
it is common across all classes of DSI device drivers.

v2:
* check initialized state in samsung_dsim_init

v1:
* keep DSI init in host transfer

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 60dc863113a0..b9361af5ef2d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1259,6 +1259,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & DSIM_STATE_INITIALIZED)
+		return 0;
+
 	samsung_dsim_reset(dsi);
 	samsung_dsim_enable_irq(dsi);
 
@@ -1271,6 +1274,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
+	dsi->state |= DSIM_STATE_INITIALIZED;
+
 	return 0;
 }
 
@@ -1290,6 +1295,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	ret = samsung_dsim_init(dsi);
+	if (ret)
+		return;
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
@@ -1464,12 +1473,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = samsung_dsim_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = samsung_dsim_init(dsi);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
-- 
2.25.1

