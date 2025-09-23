Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57293B95AF2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67CF10E5EB;
	Tue, 23 Sep 2025 11:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="T3FdaC/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1342710E5EB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758627634; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QC5kBBs7HMf1H3HIKcnYEmgc/l9eNYPZF+SIMhlPf2GBrD6VYRp/AWir0wyTmUNQPwozZq4zn9qn3rxz22QxWoJ1SzGusI4KMjHBQCInK7PPSFZzwMkk6TcVBxQpFoPyJ4RMCicnuoNJwNLHvPpl2VQsJ0tqmmKe7saQ2LCL6vA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758627634;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=949P4c7oqZxzyo32GRpJ63no7ggIJKiAuXyyVIYptoo=; 
 b=QNMa6hnv9FjFyUbnv3zoL0P18DDSB4PBnBeKniCv4Zn67jbSjnkH8zNZdnW5wlKbFebuIvsIrvCpRyiCUpZxLaCb4cmJKzcpCkcaEIEJxvHsvz2S+HLPnsQfXIpY0+42ijYVZGL+yze0joSHyddUj7Gi4EJZhg6Sq7Kl1tSH0Nc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758627634; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=949P4c7oqZxzyo32GRpJ63no7ggIJKiAuXyyVIYptoo=;
 b=T3FdaC/KTIftSH470aR/Ul2aZLxtVSbyowKqlyeWUei8rzdr/vNAVmtrijsvYiX0
 RLGrX/xr7wOKh4jxeEVlLJu2VPbscCew+M9216HP89Dava1o4kWME24fh5sPU4lmmjq
 /10+uH05ldee9uBdsnlSAt468tPPkVjsTZ/DzX4E=
Received: by mx.zohomail.com with SMTPS id 17586276323594.250542151723835;
 Tue, 23 Sep 2025 04:40:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 23 Sep 2025 13:39:55 +0200
Subject: [PATCH v4 2/8] dt-bindings: power: Add MT8196 GPU frequency
 control binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-mt8196-gpufreq-v4-2-6cd63ade73d6@collabora.com>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
In-Reply-To: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
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
X-Mailer: b4 0.14.2
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

On the MT8196 and MT6991 SoCs, the GPU power and frequency is controlled
by some integration logic, referred to as "MFlexGraphics" by MediaTek,
which comes in the form of an embedded controller running
special-purpose firmware.

This controller takes care of the regulators and PLL clock frequencies
to squeeze the maximum amount of power out of the silicon.

Add a binding which models it as a power domain.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..03721244a737ce0914a89cc0aedd88fa3b6b2038
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/mediatek,mt8196-gpufreq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MFlexGraphics Power and Frequency Controller
+
+maintainers:
+  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+description: |
+  A special-purpose embedded MCU to control power and frequency of GPU devices
+  using MediaTek Flexible Graphics integration hardware.
+
+properties:
+  $nodename:
+    pattern: '^power-controller@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - mediatek,mt8196-gpufreq
+
+  reg:
+    items:
+      - description: GPR memory area
+      - description: RPC memory area
+      - description: SoC variant ID register
+
+  reg-names:
+    items:
+      - const: gpr
+      - const: rpc
+      - const: hw-revision
+
+  clocks:
+    items:
+      - description: main clock of the embedded controller (EB)
+      - description: core PLL
+      - description: stack 0 PLL
+      - description: stack 1 PLL
+
+  clock-names:
+    items:
+      - const: eb
+      - const: core
+      - const: stack0
+      - const: stack1
+
+  mboxes:
+    items:
+      - description: FastDVFS events
+      - description: frequency control
+      - description: sleep control
+      - description: timer control
+      - description: frequency hopping control
+      - description: hardware voter control
+      - description: FastDVFS control
+
+  mbox-names:
+    items:
+      - const: fast-dvfs-event
+      - const: gpufreq
+      - const: sleep
+      - const: timer
+      - const: fhctl
+      - const: ccf
+      - const: fast-dvfs
+
+  shmem:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the shared memory region of the GPUEB MCU
+
+  "#clock-cells":
+    const: 1
+
+  "#power-domain-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - mboxes
+  - mbox-names
+  - shmem
+  - "#clock-cells"
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+
+    power-controller@4b09fd00 {
+        compatible = "mediatek,mt8196-gpufreq";
+        reg = <0x4b09fd00 0x80>,
+              <0x4b800000 0x1000>,
+              <0x4b860128 0x4>;
+        reg-names = "gpr", "rpc", "hw-revision";
+        clocks = <&topckgen CLK_TOP_MFG_EB>,
+                 <&mfgpll CLK_MFG_AO_MFGPLL>,
+                 <&mfgpll_sc0 CLK_MFGSC0_AO_MFGPLL_SC0>,
+                 <&mfgpll_sc1 CLK_MFGSC1_AO_MFGPLL_SC1>;
+        clock-names = "eb", "core", "stack0", "stack1";
+        mboxes = <&gpueb_mbox 0>, <&gpueb_mbox 1>, <&gpueb_mbox 2>,
+                 <&gpueb_mbox 3>, <&gpueb_mbox 4>, <&gpueb_mbox 5>,
+                 <&gpueb_mbox 7>;
+        mbox-names = "fast-dvfs-event", "gpufreq", "sleep", "timer", "fhctl",
+                     "ccf", "fast-dvfs";
+        shmem = <&gpufreq_shmem>;
+        #clock-cells = <1>;
+        #power-domain-cells = <0>;
+    };

-- 
2.51.0

