Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC354ADD8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 11:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A178210F8AD;
	Tue, 14 Jun 2022 09:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9C810E703
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655200725; x=1686736725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZCHN9piLADGflszZhdGaQcj7PzFJmElyOhm0mCktr30=;
 b=QCiNXIfUWjGV8ISj4j/S+tHOYkDPex4r92UmZQ2PMkuZFkZMG8FMJMXV
 4pU7hno34LVKxUdx9PUoV/IS5Jj8b+8z58XtbBcDTfBAb9ixemAUX1cl0
 9ytRy0Dfspz9R/oBCe1aEZQk3W3g79zONL1pTTV7HAlD0NeJOFQ1l+1hi
 +tpphQAUplZ0CIOvxn4ONJenMZGPx5X7eqKJCD9UAZDWepnfHV6MbNQcK
 36Gt+3OQlQnw4iqS8nwfDpZ5oB9vvkPhMB5EVAqTxoRzjrHNm2KzuYt7M
 Nk+Z1ueNwP6OSQjmUHvcMcKBUp7sMe2gzzmvho7OjrAA4K2b6HEwlLGBA g==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647298800"; d="scan'208";a="24444865"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 14 Jun 2022 11:58:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 14 Jun 2022 11:58:42 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 14 Jun 2022 11:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655200722; x=1686736722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZCHN9piLADGflszZhdGaQcj7PzFJmElyOhm0mCktr30=;
 b=aoGzYyWknO4za0QJ/GIgOesnRS+NowjgPLRKj7oY3qdCUOQFuQIKiItv
 DgYe3djeHjwFqgvwscplByzaCUVxM4k2lefsEVrgQgl1xkfhKzsMI8epv
 2EV05q+kV6jtoX8Y+dh5+w38QPtRpiDPdoOGkDrXE5UGDjxQ1I9bRgnv5
 9knAW6eos2uX6eGyPi3Q35+S+lZYzpHuRQF4ScV5W/t1Lhee6/lWPxXKW
 0R065/GL1SSKSh0QotciHwOKQEY91xdgMwts0hiDk2FjlCI2yNjFnbwE1
 nOqNmvgIV+biC7407oRiE9IxbP1WLX0kw+7drpirRP8JGC3J7BPI81dR4 w==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647298800"; d="scan'208";a="24444864"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 14 Jun 2022 11:58:42 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0D1D3280072;
 Tue, 14 Jun 2022 11:58:42 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/bridge: ti-sn65dsi83: Allow GPIO operations to
 sleep
Date: Tue, 14 Jun 2022 11:58:35 +0200
Message-Id: <20220614095835.1398708-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614095835.1398708-1-alexander.stein@ew.tq-group.com>
References: <20220614095835.1398708-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to require non-sleeping GPIO access. Silence the
WARN_ON() if GPIO is using e.g. I2C expanders.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Change in v2:
* None

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index a306150a8027..dc26640e7d9b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -344,7 +344,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	/* Deassert reset */
-	gpiod_set_value(ctx->enable_gpio, 1);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
 	usleep_range(1000, 1100);
 
 	/* Get the LVDS format from the bridge state. */
@@ -500,7 +500,7 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 	int ret;
 
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(10000, 11000);
 
 	ret = regulator_disable(ctx->vcc);
-- 
2.25.1

