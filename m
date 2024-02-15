Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A1856367
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB2710E6BB;
	Thu, 15 Feb 2024 12:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="gNP0Kdyc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E50D10E757
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:39:47 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 3A564603EE;
 Thu, 15 Feb 2024 12:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708000786;
 bh=iIJvn+BTCwLpyPd1iD4wRftor0jq12kCKD4Ngzd6vkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gNP0Kdyc6DvS/fSVQyydqaWu34LSkTpSorou8Sir1M+lVL0F3zc5Lll6vsGK+v/JV
 1e94QWkTNGPFsNkWoHy82/CEYC0Pjr+jV47nkv+KKZB8wtA3uDf9Oav3KmF7Lv1myP
 5meWEhsuE1xKJl5wJBB7UjWXRIZJFasjwcGIWCN5wmslfzDUXKo2Ku/ubRlsWoV5vW
 1GFpJR1z52GAp1/MUO0Dp2P/41whgwZtN1mQLFM1hgfRqQ+lrGv8dRIplWmUovo+hm
 juHdF203afvCkj/8OM/uUdRZOb2nZhY+bR+Q3qgTvoRc2cOjg8QPpEl6WgZ7QqsrDi
 Az+n7WSEn5Fmg==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 08/10] drm/bridge: tc358775: Enable pre_enable_prev_first
 flag
Date: Thu, 15 Feb 2024 14:31:51 +0200
Message-ID: <20240215123222.42609-9-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215123222.42609-1-tony@atomide.com>
References: <20240215123222.42609-1-tony@atomide.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set pre_enable_prev_first to ensure the previous bridge is enabled
first.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Tested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -680,6 +680,7 @@ static int tc_probe(struct i2c_client *client)
 
 	tc->bridge.funcs = &tc_bridge_funcs;
 	tc->bridge.of_node = dev->of_node;
+	tc->bridge.pre_enable_prev_first = true;
 	drm_bridge_add(&tc->bridge);
 
 	i2c_set_clientdata(client, tc);
-- 
2.43.1
