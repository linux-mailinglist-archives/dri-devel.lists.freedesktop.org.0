Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B74AB618
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 08:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BE810F2CA;
	Mon,  7 Feb 2022 07:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59810F2B8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1644220418; x=1675756418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PLdPDLywrxWexnul+G8OpwDVmHBqyL7KeEVS03R8byg=;
 b=mvliWePuRtmtLBgC607A9zzyENcTw2D1BQfVc37AFkekMNMTs7nRF3/L
 I0vssWmhHY5Ksu/KbpCAi1JCb4nTLqPtfjr1zE19LjjBu0nufVc0DXZwb
 WNVp6+IoC/0jguM/Op2WGnNZSpsVcwhmLbc+4n24Yn0KgotXqhvzRFwur
 7i1JAL9u8F7pBYkwM7U1vMn9Brmx2sGLymQG3TosVQ/mLsuVk0yE5LDm1
 O4Epu2hQ8UwJCm6mfCpUOF9bmxk8vi2+1O2c79Y1OIdCyw5HMMwt/ygF+
 ON7Xmn7N5b93gd7RpSbEdBTil4JKAisQezD/iHSj7qMqbIRF0Kxl9Mdc0 A==;
X-IronPort-AV: E=Sophos;i="5.88,349,1635199200"; d="scan'208";a="21922577"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 07 Feb 2022 08:53:35 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 07 Feb 2022 08:53:35 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 07 Feb 2022 08:53:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1644220415; x=1675756415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PLdPDLywrxWexnul+G8OpwDVmHBqyL7KeEVS03R8byg=;
 b=m4mGjM+H+jdqPCb4EkRmlUfySjSRlGRhrXT9yDQEoPp+gA/5+21KcfFG
 CRb5IFmDmB4CKBZxH4H40Qkn8j/5ybwCMX6Ku/SWWM0o2IPZW99thanTR
 ScfMe0g1dakqSZrK0f6d2vQ50WCD/T/Ss/zHXF+JgzKYXxbbSdQxu0z29
 y9f8/bvDnhu3ys64jBueWBUx9pH6WO0yFMDeQ40wfMdorlKwsKbgGGsqc
 zHX9YhMhVhVokfpxYVPSP9X5geTwtrTA5vNY84p+c40KmOPK1iYvOV0qD
 k7v7pqZJbj5iLbAX1tA0Pvfy01c6GmvPe8P275dhVh4Feuc020SPEZ6WK g==;
X-IronPort-AV: E=Sophos;i="5.88,349,1635199200"; d="scan'208";a="21922576"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 07 Feb 2022 08:53:35 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E1341280075;
 Mon,  7 Feb 2022 08:53:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Allow GPIO operations to sleep
Date: Mon,  7 Feb 2022 08:53:25 +0100
Message-Id: <20220207075325.285179-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207075325.285179-1-alexander.stein@ew.tq-group.com>
References: <20220207075325.285179-1-alexander.stein@ew.tq-group.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to require non-sleeping GPIO access. Silence the
WARN_ON() if GPIO is using e.g. I2C expanders.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
If the GPIO is from an expander on I2C, this warning will rise
obviously. Straight forward fix.

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 1f02596d6db4..2927fa2abd3d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -346,7 +346,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	/* Deassert reset */
-	gpiod_set_value(ctx->enable_gpio, 1);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
 	usleep_range(1000, 1100);
 
 	/* Get the LVDS format from the bridge state. */
@@ -497,7 +497,7 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 	int ret;
 
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
-	gpiod_set_value(ctx->enable_gpio, 0);
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
 	usleep_range(10000, 11000);
 
 	ret = regulator_disable(ctx->vcc);
-- 
2.25.1

