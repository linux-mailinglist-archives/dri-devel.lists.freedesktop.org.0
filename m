Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD5CD3575
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 19:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C18410E332;
	Sat, 20 Dec 2025 18:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="jEa18x1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7BF10E317
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 18:51:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766256629; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G8xgTZWTJjB4ImOOXFRogkyAppca3TcwYZiVjfFeoWw4cnf3J6yz1l0TmFFFM69NVBZKqPXvn9qVxy8axHJzrAjdanOreLGymgDlXr19Y7ud5gjoh2mrcYVQCCz+DN4sKfQKMUF7CBihUxC0XwKABVYfHrqRvrjJR46bDyrf8vw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766256629;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8IbRY714eO2zGl6q64FE7lg6CXtlWXzXvxXQfYH5rwI=; 
 b=kyZmEgzFo3uCZqEt92Fqf1irIMioiyGvG4VCWM0XG6OY1+lX1o6vtUu9yFuocGMKQrBoM8gmxJc4Qk57fsYGruRAVHkLTy5x7LTZ9A1WgvOc+3Jovg7Bsf/zfk5g43lC+OivDYF4gltniOLqdMvn6Sn8r+TyP5acGEdedyGK7Cc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766256629; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=8IbRY714eO2zGl6q64FE7lg6CXtlWXzXvxXQfYH5rwI=;
 b=jEa18x1NgxTIWetBz2e1aTELkeupFac1ViPHoq7QhKZkaVQrtk55dqLMOL0RR9hZ
 b8KoIp+hlNHz9aVpsO0h+1GKcn9zR0Ai4Px2QJm5PBEz3xdUYuBTqMexCkgRUYF/pEU
 8FII1oDeCA1XiYsC9keOrmMm7hYhBu7JiR2iX/jE=
Received: by mx.zohomail.com with SMTPS id 1766256628125717.7120182725639;
 Sat, 20 Dec 2025 10:50:28 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 20 Dec 2025 19:49:52 +0100
Subject: [PATCH v2 1/4] dt-bindings: gpu: mali-valhall-csf: Add
 shader-present nvmem cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-mt8196-shader-present-v2-1-45b1ff1dfab0@collabora.com>
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
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

On the MediaTek MT8196 SoC, the bitmask for which shader cores are
present and functional is not the one in the Mali GPU's registers, but
in an external efuse.

Add the nvmem cell properties to describe such a setup, and make them
required on MT8196.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index bee9faf1d3f8..8eccd4338a2b 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -51,6 +51,14 @@ properties:
           - stacks
       - const: stacks
 
+  nvmem-cells:
+    items:
+      - description: bitmask of functional shader cores
+
+  nvmem-cell-names:
+    items:
+      - const: shader-present
+
   mali-supply: true
 
   operating-points-v2: true
@@ -108,6 +116,8 @@ allOf:
       properties:
         clocks:
           minItems: 3
+        nvmem-cells: false
+        nvmem-cell-names: false
         power-domains:
           maxItems: 1
         power-domain-names: false
@@ -133,6 +143,8 @@ allOf:
             - const: core
             - const: stacks
       required:
+        - nvmem-cells
+        - nvmem-cell-names
         - power-domains
 
 examples:
@@ -179,6 +191,8 @@ examples:
                      <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
                      <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
         interrupt-names = "job", "mmu", "gpu";
+        nvmem-cells = <&shader_present>;
+        nvmem-cell-names = "shader-present";
         power-domains = <&gpufreq>;
     };
 

-- 
2.52.0

