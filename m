Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A3472D7E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D05610E78D;
	Mon, 13 Dec 2021 13:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2710E78D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402599; x=1670938599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9uQ/nA2SxUtGSmaROU3d1oxGvu+83eq3tQzha9jKgE8=;
 b=We85k4fVnRWXCDGHHYAttNk0wJTF37giRtsz5GvP9ildiV2Ut/gxKEmB
 8nO3FH8rU9Nlmv+l0WNE3ijdRTgvjLfForRhhYP4Ym0hK6JagkcO7FByv
 lzPsahz71FwGxW7gk7q80L2fD51RBfq5+yJ5Sx0a5n1S8cEFpPxoez1Hw
 y4cDDL8oZTfddjfd3GNFPH4pgq6zrxzlg9TugCIQn09nJWFvjEGqts3AJ
 z+VTAm9l3sVuhHeJeip2NvmdFYlNvhSdpi0GBIP3qwvgwk3xHKanTYco3
 3OWXm0tLC+IsOAGM0IcLtUeQv9GqQgFtW3dB7l9T7S6Dqru/Y+JZv7J8g g==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012626"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2021 14:36:35 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 13 Dec 2021 14:36:35 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 13 Dec 2021 14:36:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402595; x=1670938595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9uQ/nA2SxUtGSmaROU3d1oxGvu+83eq3tQzha9jKgE8=;
 b=MG0gvtoPgv49ZprXvvDLocnT8t7f7SJ3rAUj/Yprp69skCI6FMavXUHv
 41AqhmQGoFAXJL/vtmRE5zp2KDDdmOjXj5jFN/4DF4RnY75VrxLJ2Gyay
 Nd/QdaS1RZmZNabMLqXTuHMxj2/o+yqxKB8/1jcTd9VuarH3KzGzTZztd
 NV2ScNb2KmdRyqO6JPiCM+s4MxTA6hxUKyDPXlPlRTOc/5Uoa/cSlhwng
 FZuBzxWbFgEDtqEInKyvHXp5K8fcTRtVsR/lni4vF7ZVd+0yy0qF6I3/Z
 Cxvs0wmIQ8LSBkzb5Sa0OofuAC14PS6Zc3p3QKlBonDsLfsYjrzgkOZFs Q==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012625"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Dec 2021 14:36:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B1DB9280078;
 Mon, 13 Dec 2021 14:36:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v5 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply
 bindings
Date: Mon, 13 Dec 2021 14:36:25 +0100
Message-Id: <20211213133626.2498056-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
References: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a VCC regulator which needs to be enabled before the EN pin is
released.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index c3f3e73f740a..48a97bb3e2e0 100644
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
 
@@ -132,6 +135,7 @@ examples:
             reg = <0x2d>;
 
             enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+            vcc-supply = <&reg_sn65dsi83_1v8>;
 
             ports {
                 #address-cells = <1>;
-- 
2.25.1

