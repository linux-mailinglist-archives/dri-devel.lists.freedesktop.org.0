Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ACEB2E320
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECF510E799;
	Wed, 20 Aug 2025 17:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="jGjcsFSK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AB810E799
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710085; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FTnWVGb5ktCfnaCYrS5yenNeDc7vDsN2aJVUGxm2/9Cqcw4eVg2x/EiacItHeT5AIYXkxGEnWkocJbTpl0iy17gLUoHAlorkG3/lX+3wpyszhE/dajidQ5il1t6s5duZOmHXmfZa5/FbW71YZXchwW5mH7c8a6F+psjgPKpX5M8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710085;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FoPVuBStBvUM57EnDHdyDOSI/MqVu22rPsFJ0LZ4BLU=; 
 b=MTv/99UW8etAyy5/38QR+E2c+ZruaERBMxdoqgEreTKCTZ09U1lN343bk9qUCYH2PBx3GVug3n5QHkIUu2u3e0nclzcRkZkJIePFH+KjzD3aPGg6GUAfG4Ae521HDkvmYOc1kXcWUWr3mSf45kMXm0/1zsj5OvRc+5JPJxWUAvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710085; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FoPVuBStBvUM57EnDHdyDOSI/MqVu22rPsFJ0LZ4BLU=;
 b=jGjcsFSKI9tNIT2mMc7ULHhV9VXmZ2mN8VTO4r4iatqo2USNHECT9uTRPAvRboVX
 7dseJNDMWoP6p5FI3rov+csDBr/HAyoSmH/HydhHOxtDjdVGeJsO8eo/iVBltpuH39e
 z9+rZe8b9K7VCyyS4CvyFRyVSsAyIU0yJ/VhAeIA=
Received: by mx.zohomail.com with SMTPS id 1755710083545671.3749174712098;
 Wed, 20 Aug 2025 10:14:43 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add
 assigned-clocks/rates properties
Date: Wed, 20 Aug 2025 14:12:51 -0300
Message-ID: <20250820171302.324142-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Current, the DT bindings for MediaTek mmsys controller is missing the
assigned-clocks and assigned-clocks-rates properties. Add these and
update the example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 3f4262e93c789..d045d366eb8e2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -68,6 +68,12 @@ properties:
       of the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
   mboxes:
     description:
       Using mailbox to communicate with GCE, it should have this
@@ -130,6 +136,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/power/mt8173-power.h>
     #include <dt-bindings/gce/mt8173-gce.h>
 
@@ -137,6 +144,8 @@ examples:
         compatible = "mediatek,mt8173-mmsys", "syscon";
         reg = <0x14000000 0x1000>;
         power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+        assigned-clock-rates = <400000000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
-- 
2.50.1

