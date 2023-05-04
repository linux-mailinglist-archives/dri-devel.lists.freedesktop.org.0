Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656B26F654B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 08:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E961E10E074;
	Thu,  4 May 2023 06:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B0A10E39D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683183204; x=1714719204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/JaEkfLjlbqHBjhrGPL3OBjFwJL/iCtACrIb+oKSOQI=;
 b=oNSITueaWq4rIQCjTsE6xyGkvPwRBX56kEynHpwIVEiG3jWgzFVAKrSa
 b21oj9qOoFb14jPUyfj37pkSFKJUJxX7/9y0K+N4peNpzab7WyyXDo6tK
 z87IRj02vd7I8nBFiFakBETmnmKtcfRojsjtgarZ6zxKHOqROOFUm9LRQ
 RYjqblRQ9+jFZbhyBRyoW8p2nTu4lYctYxSR4UAaX8nJaDRkiyDC95LB2
 yX4HHtLQl4l91+3yff/iKbBembQtUTwqEKQuUoLFx1REzLtWRD13kOKu2
 r7FrBY4XCoRYhxv/iw/pViwkhEomKWFQ+iWhkI62LQXdvGE96vvF8orn+ A==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30708663"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 May 2023 08:53:20 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 04 May 2023 08:53:20 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 04 May 2023 08:53:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683183200; x=1714719200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/JaEkfLjlbqHBjhrGPL3OBjFwJL/iCtACrIb+oKSOQI=;
 b=fGIjX6IOx8RKQZFqOp6XaOnKROfXqsC7qzsnZawkfb9CjUKfp5ywnn34
 /1Wau/cFa1IdST3UUWpYP/kYlkZfSNiiryHPeAEXXc8jYHbXMM6aShiyy
 j571j7Ey/5MGBW0lVGgv0bRuEUQx46I4FDBQ7VykaOYadbmc2BHxSLB4n
 zBNo3fcGHDbMfvKiqoJKX1PxHn+9ZkDSXDADHjehPy9gux3RKf5q3cHEo
 AtBvh5bzew+78pxpZSE/WdCLN/fs4D/GJOcYl1ZEoFRwQT4oXUC2/eqw4
 3KHhjvLCXU09J491MxIIhkQnMx1ZaS5JD46C2ByKt/NY/9pBQUEutjamG g==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30708662"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 May 2023 08:53:20 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7E59F280056;
 Thu,  4 May 2023 08:53:20 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
Date: Thu,  4 May 2023 08:53:16 +0200
Message-Id: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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

If PLL locking failed, the regulator needs to be disabled again.

Fixes: 5664e3c907e2 ("drm/bridge: ti-sn65dsi83: Add vcc supply regulator support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 75286c9afbb9..1f5c07989e2b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -478,6 +478,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
 		/* On failure, disable PLL again and exit. */
 		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
+		regulator_disable(ctx->vcc);
 		return;
 	}
 
-- 
2.34.1

