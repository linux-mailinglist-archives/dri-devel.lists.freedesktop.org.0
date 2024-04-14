Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF978A4353
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 17:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EDF10E19F;
	Sun, 14 Apr 2024 15:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="WscbcykO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 631 seconds by postgrey-1.36 at gabe;
 Sun, 14 Apr 2024 15:23:02 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336D610EED3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1713108174; bh=gGzIdCw12QXG2TxloTRvkWREcbVU89z7DbBLoR6ZGJA=;
 b=WscbcykOQyAI0gOfQO7zP7xXbgMYV3/jRCaHVZ0YVJwS/Ej26wfGFa8DwXBP/xTsGJi56X3XB
 oi0kKKCk5qvjRz+pWkGLzNPLy/QOv2GXpqRzXWV82bdQ3iyQHVZQyB0TIVs+LTFovDugMxkeOHQ
 skBs9aP9rQmdao7ZyEh6l6jMBWLgLtL90IJuPKLHUr18DPjxItRev6tY/rOYJTKpCxPECW1PC1+
 ddx1n80mCa7v1E5wfBky8matQi/Dnppdr3WgHASrBv2zxGu4DwlfQ2KgYNMrZRV9B1y4dAVwtU3
 t04bOueymiEk92EpGkndKTcgNbiSHhKR54Ar3QGX7fvw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Andy Yan
 <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Mark Yao <markyao0591@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] dt-bindings: display: rockchip,
 dw-hdmi: Fix sound-dai-cells warning
Date: Sun, 14 Apr 2024 15:11:29 +0000
Message-ID: <20240414151135.1774981-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240414151135.1774981-1-jonas@kwiboo.se>
References: <20240414151135.1774981-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 661bf23c99ce03c87699d74d
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

The rockchip,dw-hdmi node can be used as a sound dai codec, however,
dtbs_check may report the following issue:

  hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells' was unexpected)
  from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#

Add a reference to dai-common.yaml and add the #sound-dai-cells prop to
resolve this warning.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: New patch to fix #sound-dai-cells warning
---
 .../bindings/display/rockchip/rockchip,dw-hdmi.yaml           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index af638b6c0d21..3285fff54416 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -15,6 +15,7 @@ description: |
 
 allOf:
   - $ref: ../bridge/synopsys,dw-hdmi.yaml#
+  - $ref: /schemas/sound/dai-common.yaml#
 
 properties:
   compatible:
@@ -124,6 +125,9 @@ properties:
     description:
       phandle to the GRF to mux vopl/vopb.
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
-- 
2.43.2

