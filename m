Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8063647F4E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 09:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69710E4F9;
	Fri,  9 Dec 2022 08:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1810E4F9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670574830; x=1702110830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=luhwqP615gaIKUHkckaMaynP8Q6kPKzrxxIa8K9DBHA=;
 b=FrdVyamlLppZeYRTNy2LAsET4RVaX92FVd1XFWcV4d7ksdqGMSDG8pSv
 kOGKOSGh7dEW4XYizkHIlI6AP+QFbDGDHjDFckSBnQ9Qgp+GOHxQSr6/U
 FwFjt9R8TwhJ63qZTnyElMZjt8B1kne5zTit6ZZh3waMotvcvYTUUuCfU
 ALQvQX/NUp8a7zrpnHbQ6SPzyiN/YaTz7YwTIVj2jksMJXA/xYiMfwx9C
 OZQgsNoOjki2wKiAmwXp+Bq9ZztN2pMy9J2hHBdBhqeUOYrapEavJdZ+m
 o4iJZzQnNRRyv2sN7mFjbEVMwc+tBmt02l6XO53hCbzs2HptELZu4MT6L Q==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27857152"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2022 09:33:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 09 Dec 2022 09:33:47 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 09 Dec 2022 09:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670574827; x=1702110827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=luhwqP615gaIKUHkckaMaynP8Q6kPKzrxxIa8K9DBHA=;
 b=EWMMD5Tu+d4kwwTJ5UTLE9HHPazaYNiGjw72Gsyv/IvccQRwX455jsj5
 d+xFG/NdwrXJ4riNbCiYN98QMH5SOzfGwsS3qQODq28AQ6DTT7PPvdRSw
 uinhkUzO2BhHuUQfrDCqspJOPsm75RSBI5oy7EbiRc7g/TrguaakgiNTg
 ++gMTroK2v7QQTBJ7ryz+OaowDNGCRQ6TbV0gullKXu9ipxI1CS8M2ZNq
 2u76lEsshCl6+SjOQ3W68JzaP2J1b8n2h2wsuXYDiNw7gZBPs0H1o3vhl
 N9brsvQTIbJyEdpSu5g31FiecPIOdm4+YG7BeuzPp3HXtHOwh0EW5XtU7 A==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27857146"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2022 09:33:46 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C79EA280072;
 Fri,  9 Dec 2022 09:33:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable delay
 property
Date: Fri,  9 Dec 2022 09:33:38 +0100
Message-Id: <20221209083339.3780776-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
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
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It takes some time until the enable GPIO has settled when turning on.
This delay is platform specific and may be caused by e.g. voltage
shifts, capacitors etc.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 48a97bb3e2e0d..3f50d497cf8ac 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -32,6 +32,10 @@ properties:
     maxItems: 1
     description: GPIO specifier for bridge_en pin (active high).
 
+  ti,enable-delay-us:
+    default: 10000
+    description: Enable time delay for enable-gpios
+
   vcc-supply:
     description: A 1.8V power supply (see regulator/regulator.yaml).
 
-- 
2.34.1

