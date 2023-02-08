Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80AA68ED0F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 11:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3023210E72E;
	Wed,  8 Feb 2023 10:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069210E203
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 10:37:27 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C5F56602091;
 Wed,  8 Feb 2023 10:37:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675852646;
 bh=9zKNAYGAIzYijQZ5yFYs1JqVdC6zxa+UlfAq3E44SFA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K7QoFPGpxVSP+tQKfGWuOebcnt6Sd7l0HgiIDDgqcEbc6Z9X2oX2CngfDWRQqfjL2
 ttioKTdt5/tFqh19H6ZXV0irIqDpptMKjbJ6h2vKMVAYWmu1lp57CqO6i6QO4vr/+/
 8ZITo3NG4Tu6PgU5CSyyGPkyNHVnS0c98xBydU5cCbfBfuqnS1mYh9ynOP2Lfr/DpG
 DKWE5uTekG4YZIj4ym4iTzTPkIxwgLcidjyXfjVkwOhkLDWihddzEfsmBUWOP0Cl5r
 iBTlQjk8u9Ie8TEN0zfTiYHOH2Tlg6ErACv7GNRDCqYCkGZcGi4WcmsmSMj+dEh3mo
 hIVb/qvf5QvDQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow sram-supply
 by default
Date: Wed,  8 Feb 2023 11:37:01 +0100
Message-Id: <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sram-supply is MediaTek-specific, it is and will ever be used
only for the mediatek,mt8183-mali compatible due to the addition of
the mediatek-regulator-coupler driver: change the binding to add
this supply when mediatek,mt8183-mali is present as a compatible
instead of disabling it when not present.

This is done in preparation for adding new bindings for other
MediaTek SoCs, such as MT8192 and others.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 78964c140b46..69212f3b1328 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -57,8 +57,6 @@ properties:
 
   mali-supply: true
 
-  sram-supply: true
-
   operating-points-v2: true
 
   power-domains:
@@ -157,6 +155,7 @@ allOf:
             - const: core0
             - const: core1
             - const: core2
+        sram-supply: true
 
       required:
         - sram-supply
@@ -166,7 +165,6 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
-        sram-supply: false
   - if:
       properties:
         compatible:
-- 
2.39.1

