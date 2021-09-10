Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD17406A49
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C986E9DD;
	Fri, 10 Sep 2021 10:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CEC6E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iBFnsYzCiNLQhu3Hg3ernLSsE4AKoExrnyGWyNz8nho=; b=sk6dsZTfk9/rzA8DLeQkNwawW/
 r82rKKOgNVVfWA4VPnlI/vEWWNgyI5Vi7F4chJ37WRHRGjlHGnXe25MPUtOJcT02txEv1uiOXghM9
 8IZB35/6EHEKxs7zvItjCRPCimAfiCxNBF5NHXDCQdt2k/1UL7KpZOI0L6opCJ4MyxnnmgU8AMnzN
 w3P7Rh1WWXcZmjo/r+qRLyt5SuZAiLduu/nhQ7i1UTv61+rSDBUKvfx44On+W3bdKzh4P7rm82Zhx
 USz7xcZxVvqvNggbZzc0d4yp+O7rYmiEKcyv4TdW9hou/SFCt8+oobHpWf03WddKIo+mBgj4bFlni
 aFla5lhw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mOdzg-00056E-FB; Fri, 10 Sep 2021 13:42:52 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 1/3] dt-bindings: Add YAML bindings for NVDEC
Date: Fri, 10 Sep 2021 13:42:45 +0300
Message-Id: <20210910104247.1206716-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210910104247.1206716-1-mperttunen@nvidia.com>
References: <20210910104247.1206716-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add YAML device tree bindings for NVDEC, now in a more appropriate
place compared to the old textual Host1x bindings.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Changed from nvidia,instance to nvidia,host1x-class optional
  property.
* Added dma-coherent
v4:
* Fix incorrect compatibility string in 'if' condition
v3:
* Drop host1x bindings
* Change read2 to read-1 in interconnect names
v2:
* Fix issues pointed out in v1
* Add T194 nvidia,instance property
---
 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 104 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
new file mode 100644
index 000000000000..f1f8d083d736
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra NVDEC
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
+      - nvidia,tegra210-nvdec
+      - nvidia,tegra186-nvdec
+      - nvidia,tegra194-nvdec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: nvdec
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
+      - description: DMA read 2 memory client
+      - description: DMA write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: read-1
+      - const: write
+
+  nvidia,host1x-class:
+    description: Host1x class of the engine. If not specified, defaults to 0xf0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    nvdec@15480000 {
+            compatible = "nvidia,tegra186-nvdec";
+            reg = <0x15480000 0x40000>;
+            clocks = <&bpmp TEGRA186_CLK_NVDEC>;
+            clock-names = "nvdec";
+            resets = <&bpmp TEGRA186_RESET_NVDEC>;
+            reset-names = "nvdec";
+
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD1 &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
+            interconnect-names = "dma-mem", "read-1", "write";
+            iommus = <&smmu TEGRA186_SID_NVDEC>;
+    };
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 69932194e1ba..ce9e360639d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6230,6 +6230,7 @@ L:	linux-tegra@vger.kernel.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/tegra/linux.git
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+F:	Documentation/devicetree/bindings/gpu/host1x/
 F:	drivers/gpu/drm/tegra/
 F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
-- 
2.32.0

