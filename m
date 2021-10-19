Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6AD432EA5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 08:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D536E8A5;
	Tue, 19 Oct 2021 06:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302666E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626376; x=1666162376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEsOShHi53FwhvjjCf5twbUdvETtYuAw3EERG3UwX5A=;
 b=UDMxrO0nAnw7B8+kZvAZ6z3OeAQYwF8z7TQ0t3HOJHNzzbecc9oAJRxX
 Z4ap3melHRnz0uFNWqrmeuLW78M11mkGj5JEslU/5JojzL+abUzr5+q+3
 va11s9dnCmVGGKrW3NXsB9ogg72yJzjXvdBo8obfsP1Ck+v4QlYeQVlst
 Hgq/F8DdtJ8/KTPJzbIvHGl32vypYKQTNSf6EqyA7GMFmJHS6he9fG+QN
 hhWDp/lJWp0IOMyzgA0/ibZgmdVPGhe+ZL08RMGBloSWlmJQMBPV0M/z9
 JrU/MtowkqyL0ieP/3TlNPBRHPAmGKZR8LczxJ7dRVzYJ9R8+iEcVOdcj w==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20119997"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 19 Oct 2021 08:52:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 19 Oct 2021 08:52:52 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 19 Oct 2021 08:52:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626372; x=1666162372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEsOShHi53FwhvjjCf5twbUdvETtYuAw3EERG3UwX5A=;
 b=HuYEUGluTbcDMagJYu21BPDNW1UC1AMYO9jpzLwH7M23bthPSTG2xtju
 XSwnqgItG4KYD8gkxQ0nVTHNI1ogcYf7RvZDAJNY/4Ih6XYO5PT/RM5UB
 BpeVHIyccTA7BX4p6uY68yq+c6urb22vNec3N/moNniZHXab2mG4K8NX9
 W5AwXH9Lsrn8ZMTF9opp8wQeneXDrxpHwHU2V3ghZmrahCKQwojyTuSGC
 xhuglY98k9y+GQ3wtYGStXy4nZ/CVGvddO45GJy2+BJmai64rBs7JSjak
 GHFxz3/bnoNZB0MSV61FdZbeN7bCzE9wO+Hl2yl1+JX4jCnGMVR7xxSf2 w==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20119996"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Oct 2021 08:52:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 53FF8280075;
 Tue, 19 Oct 2021 08:52:52 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 1/4] dt-bindings: display: bridge: sn65dsi83: Make enable
 GPIO optional
Date: Tue, 19 Oct 2021 08:52:36 +0200
Message-Id: <20211019065239.969988-2-alexander.stein@ew.tq-group.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled by
means not available to the kernel. Make the GPIO optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 07b20383cbca..a5779bf17849 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -93,7 +93,6 @@ properties:
 required:
   - compatible
   - reg
-  - enable-gpios
   - ports
 
 allOf:
-- 
2.25.1

