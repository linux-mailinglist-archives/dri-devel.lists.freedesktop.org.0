Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0481432EA6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 08:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0476E8A7;
	Tue, 19 Oct 2021 06:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEECF6E8A5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626381; x=1666162381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=afCJuCSTbn7eVZ8BU0m5iuowBOerKVpcXOZ8UxaZTaA=;
 b=jJp6RyMWA2xQMPz0DkdMKAeSSs1Rxsyq0+VfR74J6Dbcg5pZjKaUZz2K
 65EIUu1ToAElVQeaYi3f5WdSGDDHZev9hHa23/10y10Ah1dLxyJ7g7Ygk
 EdkSGJTB6C2S/uXIDa6yat+5wRJOpELH4/fn744ZO918RvfHWep9QsxVm
 WbonlEDxP9Z7ZsBCilAFPbGCoOLFI/2Zy8aoeKaR6jyZ8q7bjaVOdkN8b
 Bbp8dMlxaSx00g1qrQAJoLLsjACdt9GL/g/9GsFeH6LniQYAtSyK18hza
 VEVAOXFXcm8MJW4ZGe21zRaF3+0d97acDpS8+BYvPKuGWp96Wgw5HVx4t w==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20120010"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 19 Oct 2021 08:52:57 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 19 Oct 2021 08:52:57 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 19 Oct 2021 08:52:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626377; x=1666162377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=afCJuCSTbn7eVZ8BU0m5iuowBOerKVpcXOZ8UxaZTaA=;
 b=qZKcnAJcqgUt8pWRYKm6RrPoVVl6A4J8I1CtZaKJ3+KRN/gWrUu6zMwH
 pYiZyrRAUMd4xqI+pCZswRF2Scp66uIh4Vvo3fOHF0uOdPV15AwgmU25A
 aBz+n4NHn14lR4PoKUyuY7SHKx8m/kKTnVWssQiZ+XdN5bxxEHZxICchF
 Z7N/cVGAM2yfs3r73rPmaiduJdo0BQMS0RVM2YqagZGGoZ08p21HY7IHX
 d4it4GOi6sfjzQJL2iFwmlAxaFEgBcE+S7skX3nPgoFAQSUZt4if6o8NO
 i9Bs6jikVAq+l+E+7RUx7KguLdHwRZ5gdYcx8MqvtHyR1mR826JdId8MH w==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20120000"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Oct 2021 08:52:53 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C7281280075;
 Tue, 19 Oct 2021 08:52:52 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply
 bindings
Date: Tue, 19 Oct 2021 08:52:38 +0200
Message-Id: <20211019065239.969988-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
References: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
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

Add a VCC regulator which needs to be enabled before the EN pin is
released.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index a5779bf17849..f1e4f149ccb4 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -32,6 +32,9 @@ properties:
     maxItems: 1
     description: GPIO specifier for bridge_en pin (active high).
 
+  vcc-supply:
+    description: A 1.8V power supply (see regulator/regulator.yaml).
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -134,6 +137,7 @@ examples:
             reg = <0x2d>;
 
             enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+            vcc-supply = <&reg_sn65dsi83_1v8>;
 
             ports {
                 #address-cells = <1>;
-- 
2.25.1

