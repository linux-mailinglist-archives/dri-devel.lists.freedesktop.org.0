Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608E0429E2E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0932B6E5A3;
	Tue, 12 Oct 2021 06:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667DE6E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021345; x=1665557345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRR0se0nChPPCwlnAT8ZDDTNztxvzoMjgIcwUmvsRbk=;
 b=mubyBgMxWZp4HSueBvx2YcRUdxBBRJK0svB0qGorI41Y7Hcs+/lhZkFA
 PmW1wml+3jE9XQUKYbLpts+la2M2yWH8lnRbagEa9+xNE+1v1HRvrvn51
 SKE+9PEVKtyRGyw4rkjbw8eme7nupIwO3IeFugm91zoIqDVxZsggyyLTN
 cIfanheiMI8SDj8k9IwHQEZfdI+yc6gTlpxwo9VGk4whqdeMHzmJUElO7
 4HKipnLgBYWjARf4QA+GqQR2bijUEU1j7fXEyqFAtVdtcu6dhhwlZt7+U
 BQaZTy0CMUVIZj4mWFSiAzEwzuth+NaMFXLY7rUkZhKSoz6l10ELikYJu A==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985096"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:49:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:49:02 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021342; x=1665557342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRR0se0nChPPCwlnAT8ZDDTNztxvzoMjgIcwUmvsRbk=;
 b=iST/7KGJAtbpzbJjH8XRjGIJeVauikGvq7EZhNuyohQRUtQQ39w/fkXO
 UQFOS/ZB/0+cxrykKds/b9zVIgVY+IWksBGzATUYcAgOuuW4GYNbe37VN
 ooArTguanV5Sfiyvw2jQgGeGA2WvcbC6dsCfxixFexLvJ/oVNWR6wt4rC
 y2c2Oj2NixskTfDiiPBFfbhtYaPRrMSv+GA572yjVv+YsXHZcSzNOlw4F
 u4LSiA5ZdkIlZX7gJajQIshmtPQxtTUbOx84gp0oIciL4esIcIy8dBMxE
 9R49ZfI2mXPq+9Z1yZH1DvnaNGBz6zCpov6QmR9JhNxKxqlX1HTf3qHiH A==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985095"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:49:02 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E804A280075;
 Tue, 12 Oct 2021 08:49:01 +0200 (CEST)
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
Subject: [PATCH v2 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply
 bindings
Date: Tue, 12 Oct 2021 08:48:42 +0200
Message-Id: <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Oct 2021 06:54:21 +0000
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
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index a5779bf17849..49ace6f312d5 100644
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
 
@@ -93,6 +96,7 @@ properties:
 required:
   - compatible
   - reg
+  - vcc-supply
   - ports
 
 allOf:
@@ -134,6 +138,7 @@ examples:
             reg = <0x2d>;
 
             enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+            vcc-supply = <&reg_sn65dsi83_1v8>;
 
             ports {
                 #address-cells = <1>;
-- 
2.25.1

