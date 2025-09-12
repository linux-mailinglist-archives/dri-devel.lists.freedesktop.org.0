Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA52B55654
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D8A10E1D5;
	Fri, 12 Sep 2025 18:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="PFDyDR20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19D10ECBA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757702262; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=byJeH/qvrKSq0hRdY3YAxb4YuVStbP8Q8VjieV/qNRDppLSnEK62wmkr53+MnMm4UxAvZtcGVL7utDj44rhO3ZR9+Di5/tb7FKkxb2zjqo8Jj5wn1ojzQEVIvW97jmdJL4L2t9CDl7UYbFnJq98yWy9VEEjWxr/zmbIkOilQX1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757702262;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RM1CPtpcM7iofFgJi6EoZwd3D3Y67w7Up4uLm6O8Je4=; 
 b=khTz1fGFOTVAy89miF0ilU82wfp3RnCPCikZlA+QkbOukt/skJOOXsObFcpolr1Nnlmj7pS7PZe0MGoHnbnmB7HZUNrWqq8sjZfpm2iTAnehdNVJ2Vi/2pVl40+E1qVHdoWFy0ujnopjNLJD6WLzJRpb2bFLv6aaaE6SU8q3zJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702262; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=RM1CPtpcM7iofFgJi6EoZwd3D3Y67w7Up4uLm6O8Je4=;
 b=PFDyDR206u30J3avNJ3Hwa4+fmfWyq6mBbycW/ult5ii31XcdDrpgc1d5sLYAe5A
 ED0AJv7KMjsSXpoQ4NkWawG/A+LoMKdMbz2pHmrniKUy0aNtzywn50ZHAw4AgYCHFh6
 1gR5r1dMQvBXNifWNlzscfG5lTrdFW5nlGjfjpj0=
Received: by mx.zohomail.com with SMTPS id 1757702259914663.1005178250432;
 Fri, 12 Sep 2025 11:37:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:01 +0200
Subject: [PATCH v2 02/10] dt-bindings: devfreq: add mt8196-gpufreq binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-2-779a8a3729d9@collabora.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
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

On the MediaTek MT8196 SoC, the GPU has its power and frequency
dynamically controlled by an embedded special-purpose MCU. This MCU is
in charge of powering up the GPU silicon. It also provides us with a
list of available OPPs at runtime, and is fully in control of all the
regulator and clock fiddling it takes to reach a certain level of
performance. It's also in charge of enforcing limits on power draw or
temperature.

Add a binding for this device in the devfreq subdirectory, where it
seems to fit in best considering its tasks.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../bindings/devfreq/mediatek,mt8196-gpufreq.yaml  | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9d9efd4e70f1ef7ae446c833c15144beb9641b16
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/mediatek,mt8196-gpufreq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MFlexGraphics Performance Controller
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
+    pattern: '^performance-controller@[a-f0-9]+$'
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
+      - const: hw_revision
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
+      - const: mfgpll
+      - const: mfgpll_sc0
+      - const: mfgpll_sc1
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
+  "#performance-domain-cells":
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
+  - "#performance-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+
+    gpufreq: performance-controller@4b09fd00 {
+        compatible = "mediatek,mt8196-gpufreq";
+        reg = <0x4b09fd00 0x80>,
+              <0x4b800000 0x1000>,
+              <0x4b860128 0x4>;
+        reg-names = "gpr", "rpc", "hw_revision";
+        clocks = <&topckgen CLK_TOP_MFG_EB>,
+                 <&mfgpll CLK_MFG_AO_MFGPLL>,
+                 <&mfgpll_sc0 CLK_MFGSC0_AO_MFGPLL_SC0>,
+                 <&mfgpll_sc1 CLK_MFGSC1_AO_MFGPLL_SC1>;
+        clock-names = "eb", "mfgpll", "mfgpll_sc0",
+                      "mfgpll_sc1";
+        mboxes = <&gpueb_mbox 0>, <&gpueb_mbox 1>, <&gpueb_mbox 2>,
+                 <&gpueb_mbox 3>, <&gpueb_mbox 4>, <&gpueb_mbox 5>,
+                 <&gpueb_mbox 7>;
+        mbox-names = "fast-dvfs-event", "gpufreq", "sleep", "timer", "fhctl",
+                     "ccf", "fast-dvfs";
+        shmem = <&gpufreq_shmem>;
+        #performance-domain-cells = <0>;
+    };

-- 
2.51.0

