Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631965BDF6F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EEC10E47B;
	Tue, 20 Sep 2022 08:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6595810E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6QHkkbYG1N/hBv6OdpkzJhp5+2T/3eG3ZDr7ykqG74U=; b=iBrXymsW088djJCGujg8ZfkYzL
 hNFiknUxvF+3nMfb3x2jc5RbEsmaqH4HMliyCsUOpKav2EhbqQVUCzPUO1s2TYTBMaoVDVJWhM9gf
 ZQM+AQX+kYXeEMWHIT5KQGhsnKwLN7NJ8Z9NhIRznpWRyjpUHaxhV22HVRRaZyVd104GK26XMP61k
 QYbePC+7uq28miZg1dH/05Qgj11B8lOB/MkvHFBXoUVx7SNK0OjeFPbpewkmfBus9ZcsaQq/NQbWR
 +NTNQ6BrnDBiHbiXQxcbwKTUqbBeTU/o5cBto+g1Gsgzm8EV5YQlkp2ds5qBYpqlIPGOqY+vynMm2
 QiOC8YkA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oaYMo-0017q3-Lj; Tue, 20 Sep 2022 11:12:30 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v3 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Date: Tue, 20 Sep 2022 11:11:58 +0300
Message-Id: <20220920081203.3237744-4-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220920081203.3237744-1-cyndis@kapsi.fi>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Update NVDEC bindings for Tegra234. This new engine version only has
two memory clients, but now requires three clocks, and as a bigger
change the engine loads firmware from a secure carveout configured by
the bootloader.

For the latter, we need to add a phandle to the memory controller
to query the location of this carveout, and several other properties
containing offsets into the firmware inside the carveout. This
carveout is not accessible by the CPU, but is needed by NVDEC,
so we need this information to be relayed from the bootloader.

As the binding was getting large with many conditional properties,
also split the Tegra234 version out into a separate file.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
- Adjusted descriptions for firmware-related DT properties
  as requested.
- Small update to commit message.
v2:
- Split out into separate file to avoid complexity with
  conditionals etc.
---
 .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
new file mode 100644
index 000000000000..7cc2dd525a96
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra234 NVDEC
+
+description: |
+  NVDEC is the hardware video decoder present on NVIDIA Tegra210
+  and newer chips. It is located on the Host1x bus and typically
+  programmed through Host1x channels.
+
+maintainers:
+  - Thierry Reding <treding@gmail.com>
+  - Mikko Perttunen <mperttunen@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^nvdec@[0-9a-f]*$"
+
+  compatible:
+    enum:
+      - nvidia,tegra234-nvdec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: nvdec
+      - const: fuse
+      - const: tsec_pka
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: nvdec
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  interconnects:
+    items:
+      - description: DMA read memory client
+      - description: DMA write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: write
+
+  nvidia,memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the memory controller for determining information for the NVDEC
+      firmware secure carveout. This carveout is configured by the bootloader and
+      not accessible to CPU.
+
+  nvidia,bl-manifest-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset to bootloader manifest from beginning of firmware that was configured by
+      the bootloader.
+
+  nvidia,bl-code-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset to bootloader code section from beginning of firmware that was configured by
+      the bootloader.
+
+  nvidia,bl-data-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset to bootloader data section from beginning of firmware that was configured by
+      the bootloader.
+
+  nvidia,os-manifest-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset to operating system manifest from beginning of firmware that was configured by
+      the bootloader.
+
+  nvidia,os-code-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset to operating system code section from beginning of firmware that was configured by
+      the bootloader.
+
+  nvidia,os-data-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Offset to operating system data section from beginning of firmware that was configured
+      by the bootloader.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - nvidia,memory-controller
+  - nvidia,bl-manifest-offset
+  - nvidia,bl-code-offset
+  - nvidia,bl-data-offset
+  - nvidia,os-manifest-offset
+  - nvidia,os-code-offset
+  - nvidia,os-data-offset
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra234-clock.h>
+    #include <dt-bindings/memory/tegra234-mc.h>
+    #include <dt-bindings/power/tegra234-powergate.h>
+    #include <dt-bindings/reset/tegra234-reset.h>
+
+    nvdec@15480000 {
+            compatible = "nvidia,tegra234-nvdec";
+            reg = <0x15480000 0x00040000>;
+            clocks = <&bpmp TEGRA234_CLK_NVDEC>,
+                     <&bpmp TEGRA234_CLK_FUSE>,
+                     <&bpmp TEGRA234_CLK_TSEC_PKA>;
+            clock-names = "nvdec", "fuse", "tsec_pka";
+            resets = <&bpmp TEGRA234_RESET_NVDEC>;
+            reset-names = "nvdec";
+            power-domains = <&bpmp TEGRA234_POWER_DOMAIN_NVDEC>;
+            interconnects = <&mc TEGRA234_MEMORY_CLIENT_NVDECSRD &emc>,
+                            <&mc TEGRA234_MEMORY_CLIENT_NVDECSWR &emc>;
+            interconnect-names = "dma-mem", "write";
+            iommus = <&smmu_niso1 TEGRA234_SID_NVDEC>;
+            dma-coherent;
+
+            nvidia,memory-controller = <&mc>;
+
+            /* Placeholder values, to be replaced with values from overlay */
+            nvidia,bl-manifest-offset = <0>;
+            nvidia,bl-data-offset = <0>;
+            nvidia,bl-code-offset = <0>;
+            nvidia,os-manifest-offset = <0>;
+            nvidia,os-data-offset = <0>;
+            nvidia,os-code-offset = <0>;
+    };
-- 
2.37.0

