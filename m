Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA10FA17142
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350D210E464;
	Mon, 20 Jan 2025 17:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="p7ZyCUIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5710E452
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172124euoutp01fa90e48ab2ba3cba0be34f6993d05e84~cdlnNbD4q2651826518euoutp01m
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250120172124euoutp01fa90e48ab2ba3cba0be34f6993d05e84~cdlnNbD4q2651826518euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393684;
 bh=0OEwJDD9UosNBE7/klOOmElhNj46cDXsS2V1zQFs2EU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p7ZyCUIXI8EelxIS5vr1q1aG4blH7+/N+kY+kF95csDYNZ0M0HBVKRmIvTJrLvt+h
 xZ4UyBZJzTcEcMINzsluNgDfvPpib9EWoeV+sCB4ELO+Jjn4qKuwjGEg5P3adCUxFi
 uzxKyk8zUKSHsQXU31ZWfYLgpOQkdxShjmg5WPzY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250120172123eucas1p1e17c4ff78a73499e160eb28d9a1a52b2~cdlmqt4Jh0503405034eucas1p1i;
 Mon, 20 Jan 2025 17:21:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5B.7B.20821.3168E876; Mon, 20
 Jan 2025 17:21:23 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172123eucas1p13564bf2d07000506caf44cf55bda7fd9~cdlmMcU7W0726407264eucas1p16;
 Mon, 20 Jan 2025 17:21:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172123eusmtrp20400e15340aab59212cb82ef85870e6e~cdlmLnAXi0490804908eusmtrp2f;
 Mon, 20 Jan 2025 17:21:23 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-01-678e86131473
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 9A.C8.19920.3168E876; Mon, 20
 Jan 2025 17:21:23 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172121eusmtip11cb0a66c108a17251b163a3a6dd5443a~cdlk2OBOf1307113071eusmtip1O;
 Mon, 20 Jan 2025 17:21:21 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [RFC v3 03/18] dt-bindings: firmware: thead,th1520: Add support for
 firmware node
Date: Mon, 20 Jan 2025 18:20:56 +0100
Message-Id: <20250120172111.3492708-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG851zes6hS/XQuvGFLTK6jYlzXHZxn0AEshnOXJxsWaJOs63T
 Y61ySwvbxCkgpaOsXKdZVmA4ROmIrGtLK0U6kJWLE4nKRbJIB5HL6LiWi4oBR23d/O95n/f3
 fs/7Jh+NCy+S/rQsKZWTJ0kSxCSfsLTd73pVpCqQho10vIg6blViyPxAS6ELti4MVdi7eMhx
 sw5DPQvTJPpl5DqF/rZlEahPV06h7DY9ica1DhLNahw81N1QRqK5fDtAljkliWrtAxTSL1Rg
 6KdZM4Gq6hsAUqnP89CNP7ahAUcHgca7NThSadeih431FFrpMxCodKqJQnUTxTzUXrsLKZtO
 ETHr2en+HIqdGB8n2N9z5ynWtniGYK3aAYrVWDsBa6xRk+ztvkaS/fHKB+xf37ZjrKkqg1XW
 tmFs4XIYO/1bL8kW1NUA9mb2LSpe+DE/6gCXIPuCk4du/Yx/yKKzYyn5z39VUtBLZQKXfx7w
 oSHzBjxnN5B5gE8LGR2AJS13ME8xD+D5gn8oTzEH4MV8Jfl4ZLTTxPM0qgEsmr7kpSYAXKjW
 Y26KZF6Dg9UVj6h1TA4Bc1qzgLvAmTEALcNlj94SMfugaWh+laJpgnkJNhu3uG0BEw0NeTpv
 XABsunwNd2sfJgbe7bVRHsYXXvlhmHBrfJXJNpfi7vchY+DD5qVR3DP8Dry3VEp5tAg62+u8
 +jn40FqBeXQyHDS7vPzX0Kpp9+pIeLtriXTvhjPBUN8Q6rFjYVGhCnfbkFkD+yd9PSusgSWW
 7722AOaqhB46CJ7W5P8X2qWzeENZWHL9T14RCNQ+cYz2iWO0/+eeAXgN8OPSFIlSThGexH0Z
 opAkKtKSpCH7kxONYPVvX11pd9WDcudsSAvAaNACII2L1wmentFIhYIDkqPpnDz5U3laAqdo
 Ac/ShNhPUNmUIxUyUkkqd4TjUjj54y5G+/hnYjsyN0j3aLv70o8HzULnuQ0HD+60ica2x9wt
 nJUPF5jeq9rbOhOKy2g84/BTkXqN4ZM76lyuxy/oRITAJ/BsrLFVHbMrv2zTyzu2BFYvz0+Z
 phTKyuISrTrAqXnb6rBPKUVFwabytb6/yhKCwzePDMlPPnPPOjgpYBs3x7YMhU5ePWF85cP4
 /XFj8Xs3ORfxB2EZbwo6P3ohPXXPvrGIz8XW8aCI0VHqBtJtPdYv4w8X68Ni1BWXr2136QLN
 ccfFG0PjVN8ZLxl8oqM6x96VRe6+MHfkGP/k6+EpPxeu7wkw56qduxUrOdHvJzS7slJCmOVv
 3jp7f2ZxW9RMAHH4qGFnnZhQHJKEb8TlCsm/xXnsUEoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xu7rCbX3pBhuvslucuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DL2LbiCFNBr0LFpL6r7A2Mn6S6GDk5JARMJJ6d2czaxcjFISSwlFFi7+mH
 7BAJGYlr3S9ZIGxhiT/XuthAbCGBV4wS9xaGgdhsAkYSD5bPZwWxRQQWs0js3VcJMohZ4C2j
 xPWZG8GahQWiJO6uW8DUxcjBwSKgKnFgkyVImFfAXmJj1wo2iPnyEvsPnmUGsTkFHCS+X93L
 DrHLXuLO1W5GiHpBiZMzn4CNZAaqb946m3kCo8AsJKlZSFILGJlWMYqklhbnpucWG+oVJ+YW
 l+al6yXn525iBCaXbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4RT/0pAvxpiRWVqUW5ccXleak
 Fh9iNAU6eyKzlGhyPjC95ZXEG5oZmBqamFkamFqaGSuJ87pdPp8mJJCeWJKanZpakFoE08fE
 wSnVwDTNfx9P2qmM1Yu3tjx5VhPSt/n98tbuQx/q+u4VTm1r9gtPmherqH/J/uyznR++H87r
 X3dBUPr7Xgduzrtsn1UZr3zamzi9Wrzv5dLUz1+2tVoXKt2+OWXjztU9mX/9JeZc4UswOJg3
 lfVehNiFib/217GGXr4qlHd0UqJTrOLfoKPHbjf+3LlX8Sajpa30pxv/SgKup6w7saLUZc2L
 jvP/WNIsjDnD+9t/XPLwuHW8Qa8kNbhwxr7C2Hgrk5QTN14VXDzx4O2LreExPTHF05qn+HqW
 ll+f62njWRpZZtLAo1Ln2Sk8M7clyelT070+qal1VQWHbobeV5vR8iS0+qFEvde9qE4TA/9d
 Ku8tWpRYijMSDbWYi4oTATFqopu3AwAA
X-CMS-MailID: 20250120172123eucas1p13564bf2d07000506caf44cf55bda7fd9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172123eucas1p13564bf2d07000506caf44cf55bda7fd9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172123eucas1p13564bf2d07000506caf44cf55bda7fd9
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172123eucas1p13564bf2d07000506caf44cf55bda7fd9@eucas1p1.samsung.com>
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

The kernel communicates with the E902 core through the mailbox
transport using AON firmware protocol. Add dt-bindings to document it
the dt node.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/firmware/thead,th1520-aon.yaml   | 53 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 .../dt-bindings/firmware/thead,th1520-aon.h   | 18 +++++++
 3 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 create mode 100644 include/dt-bindings/firmware/thead,th1520-aon.h

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
new file mode 100644
index 000000000000..bbc183200400
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/thead,th1520-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 AON (Always-On) Firmware
+
+description: |
+  The Always-On (AON) subsystem in the TH1520 SoC is responsible for managing
+  low-power states, system wakeup events, and power management tasks. It is
+  designed to operate independently in a dedicated power domain, allowing it to
+  remain functional even during the SoC's deep sleep states.
+
+  At the heart of the AON subsystem is the E902, a low-power core that executes
+  firmware responsible for coordinating tasks such as power domain control,
+  clock management, and system wakeup signaling. Communication between the main
+  SoC and the AON subsystem is handled through a mailbox interface, which
+  enables message-based interactions with the AON firmware.
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    const: thead,th1520-aon
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    items:
+      - const: aon
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    aon: aon {
+        compatible = "thead,th1520-aon";
+        mboxes = <&mbox_910t 1>;
+        mbox-names = "aon";
+        #power-domain-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0fa7c5728f1e..c56a1fb6e02a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20184,6 +20184,7 @@ M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
+F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -20194,6 +20195,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
+F:	include/dt-bindings/firmware/thead,th1520-aon.h
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
diff --git a/include/dt-bindings/firmware/thead,th1520-aon.h b/include/dt-bindings/firmware/thead,th1520-aon.h
new file mode 100644
index 000000000000..7607522289f7
--- /dev/null
+++ b/include/dt-bindings/firmware/thead,th1520-aon.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#ifndef __DT_BINDINGS_AON_TH1520_H
+#define __DT_BINDINGS_AON_TH1520_H
+
+#define TH1520_AON_VDEC_PD	1
+#define TH1520_AON_NPU_PD	2
+#define TH1520_AON_VENC_PD	3
+#define TH1520_AON_GPU_PD	4
+#define TH1520_AON_DSP0_PD	5
+#define TH1520_AON_DSP1_PD	6
+
+#endif
-- 
2.34.1

