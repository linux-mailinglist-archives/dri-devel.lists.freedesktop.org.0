Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F498BDD846
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4648A10E750;
	Wed, 15 Oct 2025 08:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ciqQhiSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF33110E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:50:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760518235; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KU8nsY1uLYKqlLextu1or7O4qacnlTQntvNei8N1+k6B36fmsuv0IuS4fTJRCJ7/wSMsNwvj/BmWwUZNsLkMtt8lvh092oIaPZTMnFv9oT2+08fyhyChJmB+3OPi9H7xPCaouMa01SRCDvAyt1Bu1teKcBjXPD1Qy/wkFoWDot4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760518235;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5kCSOGJcwbOC+7+5BLR+gRNJdgGMuPaf20hsggRiPEw=; 
 b=l18bYoWFWRlTkoARZ2Rhz0hhU9XkV1Jn5QINewgsVU0sKZfN6x/MJbdyfgbA/fRVQZO57olHYWQK9AyDGYg5u74ckz8gYsU03Tsil+HRuY+hcG9X+VWOZEjBYShvpA/JFPkT7boTVG9Fz01Q1nQfseLriyK19qE8bTleOX9sN+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760518235; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=5kCSOGJcwbOC+7+5BLR+gRNJdgGMuPaf20hsggRiPEw=;
 b=ciqQhiSOoHqcRCrAKnG6Hky0cvRZ8VYuO+6TtT+Hy7mCD5fuqjYLxv9KClVpxm/5
 Zur2WSISTw7sqJzpha4SydW+rO7FBikFLhq/tLAsOzHJrhY2gQkcsM28YdgF6Gc2kvc
 EmnkgYEu6eU/BxIWszrDhA4Aw4hsk2CDLgmCxzRk=
Received: by mx.zohomail.com with SMTPS id 1760518223888154.97368582539445;
 Wed, 15 Oct 2025 01:50:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 15 Oct 2025 10:50:00 +0200
Subject: [PATCH v7 1/5] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-mt8196-gpufreq-v7-1-0a6435da2080@collabora.com>
References: <20251015-mt8196-gpufreq-v7-0-0a6435da2080@collabora.com>
In-Reply-To: <20251015-mt8196-gpufreq-v7-0-0a6435da2080@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
control the power and frequency of the GPU. This is modelled as a power
domain and clock provider.

It lets us omit the OPP tables from the device tree, as those can now be
enumerated at runtime from the MCU.

Add the necessary schema logic to handle what this SoC expects in terms
of clocks and power-domains.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/gpu/arm,mali-valhall-csf.yaml         | 37 +++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 613040fdb444..860691ce985e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -45,7 +45,9 @@ properties:
     minItems: 1
     items:
       - const: core
-      - const: coregroup
+      - enum:
+          - coregroup
+          - stacks
       - const: stacks
 
   mali-supply: true
@@ -110,6 +112,27 @@ allOf:
         power-domain-names: false
       required:
         - mali-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-mali
+    then:
+      properties:
+        mali-supply: false
+        sram-supply: false
+        operating-points-v2: false
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+        clocks:
+          maxItems: 2
+        clock-names:
+          items:
+            - const: core
+            - const: stacks
+      required:
+        - power-domains
 
 examples:
   - |
@@ -145,5 +168,17 @@ examples:
             };
         };
     };
+  - |
+    gpu@48000000 {
+        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
+        reg = <0x48000000 0x480000>;
+        clocks = <&gpufreq 0>, <&gpufreq 1>;
+        clock-names = "core", "stacks";
+        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "job", "mmu", "gpu";
+        power-domains = <&gpufreq>;
+    };
 
 ...

-- 
2.51.0

