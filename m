Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBBA16D4E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 14:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105F410E40C;
	Mon, 20 Jan 2025 13:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="W/6pvMSg";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WcDZJWhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C37B10E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1737379308; x=1768915308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=62nqD86aL+D7gBH4cdruwt6L/X3Hu+NUAwcGP2VG03Q=;
 b=W/6pvMSgl9cPwA+H4wPqceJsvV4v8ZJdhnaady9wkG4K5t+vuawu051p
 tC+2TFax2garm/3OUYEw3qTC0wJ42qJY0LeIpTGq9Svv85JqJ32dyWml6
 7ycj2eThf2WEioxXYwkxDgsbzosq0LJ0yA+DbA9y89cppNacVBcK0SvgM
 EKL2E6kyTgbkr6RbtiiMbEngzP/SlqtGdBeYZhLkURqttLBIgLCkNmyRt
 cm2YNn8VVkB7H96zDYyGaPs+59yB3cfHHGRsXE8zQ/drRR80THT70Gr8Q
 TEpJb5tBsGxzTfb1D3+vqmat03GL+BleyvdOgLdHHD5+4FlffcdaEalf7 A==;
X-CSE-ConnectionGUID: 3F9Vgab5QwaPXUaqR/rQ9Q==
X-CSE-MsgGUID: kY2uADUORQigCDxyZ4fXVA==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; d="scan'208";a="41177775"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 20 Jan 2025 14:21:46 +0100
X-CheckPoint: {678E4DEA-23-1CE016C0-E589DA3E}
X-MAIL-CPID: D1FE008DC500160EA307A9DA591A486A_1
X-Control-Analysis: str=0001.0A682F18.678E4DEA.008E, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1FBBB161451; Mon, 20 Jan 2025 14:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1737379302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=62nqD86aL+D7gBH4cdruwt6L/X3Hu+NUAwcGP2VG03Q=;
 b=WcDZJWhVITjTlLWbAZeNPN617KFjJZADyv90NwfeZztYB7Gba795oTyfm+WyvXLuOKH/O2
 OAQDGFjLQ31PuT6GkTEGBRIlpIVulyAQgmMg1fTEvweaKmrtwRXRetBwqN14Afmj86fFLg
 nUaFLImlVlFS4DYwzS9Wb3VrsY8MQq4iyXIzpa0tIKckll8Lwr3Igbm7uu5NTETmT3xr1t
 DbB7cePXFyHfL4jxo7icKfM+yIeC6Gh7rDrt/Q924HP2yW4OPtsZrdininhynfhpQGOcIA
 hrVXPxUEmGb5L6xkqAZnVM2rOp+aHWlHFhBDxm+FGUGP+wk+nOCYIMXz0NwcIQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/bridge: ti-sn65dsi83: Set bridge type
Date: Mon, 20 Jan 2025 14:21:34 +0100
Message-Id: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

This is a DSI to LVDS bridge, so set the bridge type accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 336380114eea9..9e9590f645229 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -849,6 +849,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	ctx->bridge.funcs = &sn65dsi83_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
+	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	drm_bridge_add(&ctx->bridge);
 
 	ret = sn65dsi83_host_attach(ctx);
-- 
2.34.1

