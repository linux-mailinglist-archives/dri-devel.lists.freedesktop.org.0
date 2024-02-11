Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2E850875
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 10:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AE710E54B;
	Sun, 11 Feb 2024 09:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="J9GCfR4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9920010E54B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 09:53:38 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id D872960531;
 Sun, 11 Feb 2024 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707645218;
 bh=tP5AC41GiYDobaCkRgLI+2FBA4s/W4ZP0qFF3WFMI7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J9GCfR4zsfq12L0vvMRYRIq4jUxidU2XbajF5KbMIdLal5xpBD9RcDoy6Ae8KeLIQ
 bQa8qGCDRpHwOesH0XUlWc0H8999MmQ1brJaFaBKSxSVgdZpOnGHX3BWtn6dwEbrmb
 Xg2pAXsXSjW2lPfWdm/3iNtuTbYmbGsvhm43nTTV++mVIKq2EM4Fl+/dsPxD3Jvn0w
 vpoeRYX4D4xDVH1yFL8IXsZnXPWDksHNQHYrE8Sy463J7C4E+vZuXV5YNDhZzlTWfx
 ZbCsv010ytOfSLtckjfyhWCIDmMu4BjvSciYrWc8CgzGoG7ewLPIfFVG3qTDlkoQdI
 L5azwRnzaL5Lw==
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 01/10] dt-bindings: display: bridge: tc358775: make stby
 gpio optional
Date: Sun, 11 Feb 2024 11:51:06 +0200
Message-ID: <20240211095144.2589-2-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240211095144.2589-1-tony@atomide.com>
References: <20240211095144.2589-1-tony@atomide.com>
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

For a normal operation, the stby GPIO is not needed.

The reset pin is required because once the PPI (PHY protocol interface)
is started, it can only be stopped by asserting the reset pin.

Signed-off-by: Michael Walle <mwalle@kernel.org>
[tony@atomide.com: dropped regulator related changes]
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/display/bridge/toshiba,tc358775.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -70,7 +70,6 @@ required:
   - reg
   - vdd-supply
   - vddio-supply
-  - stby-gpios
   - reset-gpios
   - ports
 
-- 
2.43.0
