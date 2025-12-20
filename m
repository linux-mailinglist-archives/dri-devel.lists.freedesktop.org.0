Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A1CD356F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 19:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E77110E317;
	Sat, 20 Dec 2025 18:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ItW7jbSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B45E10E317
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 18:51:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766256635; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RcSApAUIVHOQQ/PxKnGD95WnMzfQvGyERWSxzZMbadXIeaP0GjeVMJE1dpYqFjvkS3Z8RvxlJ+apXRiuNwoTwkS53Wzi1neqpgLaAurOwhhB2mOIPcQBiSamSZSbcytmHzi6A5P9XPkLOlDG6T07cGKdz9M3cIH2qUXimMYS9Kk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766256635;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cKOC4sPnmtkQ7L+JdsUlBb5Bsh8vjqzfoYmPcpjnenM=; 
 b=gXoPv05aAM4S9McpI7E5eUhlRoG5iRR+B6VmdOdKkSqrxNTHuxR9HuO83Tq1Wcw5ICftOPCSS22TxcMzT1VGoWSk8fUwm9F1kzyQvX6He/R9uJ67I1Z061GCevUC3vvQ1T1OPxRNmdR6WIir+XWzYGVNnkm36WA1rlGRo+9TSMQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766256635; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=cKOC4sPnmtkQ7L+JdsUlBb5Bsh8vjqzfoYmPcpjnenM=;
 b=ItW7jbSZjDFdna655b7OCzhvdzkW0QxENSTZ6BK+Jp7zm4AIrDNFQHft3sklcy7T
 2Wx+pRZtz90Eg7AZ8rLe3Q9N8YHUUf8Ie3FcC6PFyvq4aRMkz+1bXRgBo/ASAFDpj6P
 uZa6RFtTQ/4w4N+GpTwBMIYIZFAgVjr3K2j5NX90=
Received: by mx.zohomail.com with SMTPS id 1766256633664149.3015413763843;
 Sat, 20 Dec 2025 10:50:33 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 20 Dec 2025 19:49:53 +0100
Subject: [PATCH v2 2/4] dt-bindings: power: mt8196-gpufreq: Describe nvmem
 provider ability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-mt8196-shader-present-v2-2-45b1ff1dfab0@collabora.com>
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

On the MediaTek MT8196 SoC, the Mali GPU's "shader_present" hardware
register may also include a non-functional shader core, along with the
present shader cores. An efuse elsewhere in the SoC provides the
shader_present mask with the fused off core omitted.

However, the efuse address is not publicly disclosed. What is known
though is that the GPUEB MCU reads this efuse, and exposes its contents
in the memory it shares with the application processor.

We can therefore describe the mediatek,mt8196-gpufreq device as being an
nvmem provider for this purpose, as it does provide nvmem access in an
indirect way.

The shader-present child node is left out of the list of required
properties as we may one day be able to describe the actual efuse region
this value comes from, so the gpufreq device isn't necessarily the only
device that can provide this cell, and implementations shouldn't need to
implement this functionality once this is the case.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
index b9e43abaf8a4..66fc59b3c8b4 100644
--- a/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
@@ -74,9 +74,18 @@ properties:
   "#clock-cells":
     const: 1
 
+  "#nvmem-cell-cells":
+    const: 0
+
   "#power-domain-cells":
     const: 0
 
+  shader-present:
+    type: object
+
+dependencies:
+  shader-present: [ "#nvmem-cell-cells" ]
+
 required:
   - compatible
   - reg
@@ -113,5 +122,9 @@ examples:
                      "ccf", "fast-dvfs";
         memory-region = <&gpueb_shared_memory>;
         #clock-cells = <1>;
+        #nvmem-cell-cells = <0>;
         #power-domain-cells = <0>;
+
+        shader-present {
+        };
     };

-- 
2.52.0

