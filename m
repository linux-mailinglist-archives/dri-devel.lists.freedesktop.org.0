Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98636856354
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F7F10E672;
	Thu, 15 Feb 2024 12:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="qkzUVCIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D77610E672
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:37:23 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id CFC90603EE;
 Thu, 15 Feb 2024 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708000643;
 bh=V2mEp9oEvcmr4hMbt6NFHaZLrPOvc7ilqQ9ACpZGNbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qkzUVCIKGL2T67oGjc8sPeoqJ44Mro+ZK243BIfNdpFsKf9G/nSMSgWgDT0xcPcmq
 Mb8HSfeowEkuzJ9aAA8IhrSPUuvBadlH7ITFL/19j0KGvERC14I+/tuMqehYPM/S6z
 XKn6h1WBy7qkdgDuhSSuVS7JZRFkJz0Y7KL90BbejPnwzHK1gPom6rowtPsVOARyDe
 eMK3fsXQkr0NWp4pIkPqhAEmB7cqK+7ymv3KZyR5D8ZonKytrvK1rS2SdKpwxZyVY/
 GEE9oH/THJpPzNmsBy9PffSEfkdT8+gy9nB9A+m9ue+K9sr4KYFy7fIIOz7R103ev6
 uY5PU0bK8ZANg==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Michael Walle <mwalle@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 05/10] drm/bridge: tc358775: make standby GPIO optional
Date: Thu, 15 Feb 2024 14:31:48 +0200
Message-ID: <20240215123222.42609-6-tony@atomide.com>
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

From: Michael Walle <mwalle@kernel.org>

The stby pin is optional. It is only needed for power-up and down
sequencing. It is not needed, if the power rails cannot by dynamically
enabled.

Because the GPIO is now optional, remove the error message.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -669,12 +669,9 @@ static int tc_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	tc->stby_gpio = devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
-	if (IS_ERR(tc->stby_gpio)) {
-		ret = PTR_ERR(tc->stby_gpio);
-		dev_err(dev, "cannot get stby-gpio %d\n", ret);
-		return ret;
-	}
+	tc->stby_gpio = devm_gpiod_get_optional(dev, "stby", GPIOD_OUT_HIGH);
+	if (IS_ERR(tc->stby_gpio))
+		return PTR_ERR(tc->stby_gpio);
 
 	tc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(tc->reset_gpio)) {
-- 
2.43.1
