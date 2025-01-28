Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727DA2126C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B038B10E700;
	Tue, 28 Jan 2025 19:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="afG7S8Nu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA4D10E6F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194837euoutp019a534b1d511a78ea2788d9f9be1caa14~e8wcLBpdK1613816138euoutp01O
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250128194837euoutp019a534b1d511a78ea2788d9f9be1caa14~e8wcLBpdK1613816138euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093717;
 bh=SfXss7pPKiqT9qzMmPgQMRq00b1pTKtgf5Dd6l3uLeM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=afG7S8Nuc52CvcYNwc0jA2y04fMIAUR2/tXjn2EUXHUE2jA60KZbWHyEv4g/1yPaF
 +8F73xjvDy7v/2RoG9Yu+tLqWktvfrjwbFMqtUAtRiV2nFyRWcdkx91yI/0/fBAEg8
 NwuEwAegt6lN6sjRiIS352sb5R3wNb6Ah/J59rVs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194836eucas1p1fd54415790fe132e04ecd94431a32ca2~e8wbTprMi1987319873eucas1p1m;
 Tue, 28 Jan 2025 19:48:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3C.A2.20397.49439976; Tue, 28
 Jan 2025 19:48:36 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250128194835eucas1p29b16bee72365f321e1056fc4d9d44345~e8waJcnMK2288522885eucas1p2E;
 Tue, 28 Jan 2025 19:48:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194835eusmtrp210959b5e9e63902a97141e75018c9021~e8waG72z13008430084eusmtrp2b;
 Tue, 28 Jan 2025 19:48:35 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-d9-67993494bf6f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 04.BB.19654.39439976; Tue, 28
 Jan 2025 19:48:35 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194834eusmtip1f0ed1d8aced5134e4dfe40876a885aec~e8wYybosw0291602916eusmtip1a;
 Tue, 28 Jan 2025 19:48:34 +0000 (GMT)
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
Subject: [PATCH v4 08/18] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset
 Controller
Date: Tue, 28 Jan 2025 20:48:06 +0100
Message-Id: <20250128194816.2185326-9-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH/fXe3lua1F0KCz8QmTZophsgk+jPMBU21DuSRYyZLnuxZtxU
 Iq+0MofbBMNjgFXQwOxrludkDY8BbUc7sAqMFoQOkac853A8woYVMG5IGXBx87/P+Z7vyfec
 5PAwoZ7w4kXHnWGkceIYEcHHjS1//+qXF6SU7CrNDEC2viIOMiyqSFTeYOcgbbOdi0a69BzU
 vTBLoMqHnSSabLiAo96y70iU2lJFoCnVCIEc8hEuumfWEGjuUjNAxrk0AlU0D5OoakHLQYUO
 A45K6swAZWR9z0V32w6h4REbjqbuyTGUoXoJLdfXkcjZW40j9V8WEulnrnCRteIkSrPk4SE+
 9Gx/OknPTE3hdFPmPEk3PCnAaZNqmKTlpnZA1+iyCHqot56gr7ceo0cvWjl0bUkynVbRwqFz
 lnbRszd7CPqyXgfortQ+MkL4Af/NKCYm+nNGGnDgU/6pPkdEQvWmLxYte1JAtkc2cOFBKggO
 KopANuDzhFQZgLlPJzC2mAdQM+DkssUcgAOKevB8pMLYTbKNGwBm/dZDsMUMgN2l5fiqi6De
 gGM3tGvj7lQ6DtN/ubCWglETABrHNcSqy406AXUK/QrzeDi1DTqNvquygDoI5zWPuGzcK9By
 uwNbZRcqBNYsleGsxxW2KsfXGFvxpBrUGOuv4MOumjCWw+Azk41k2Q1OW/Xr7A2XTVoOy/Fw
 zPB4ffYraJJb1zkYDtn/WVsNo3bAKnMAK4fC0VozvipDaiPs/9OV3WAjvGq8hrGyAGZmCFn3
 dpgvv/RfqL3MuB5Kw0lTOzcXbFW9cIvqhVtU/+cWAEwHPJhEWayEke2OY876y8SxssQ4if9n
 8bE1YOWx7zitC3WgbNrh3wg4PNAIIA8TuQs+tiskQkGUOOkcI42PlCbGMLJGsImHizwERZZ0
 iZCSiM8wpxkmgZE+73J4Ll4pnOMnv3Uf5B9sFW2o2hE+jZ5KC3ZueNRqGA033Ur+0lG8zyq7
 dXrzw4Scn/0iRtKfHFc/SH59t7zp/rOL0XeKDedsyZ6lrl4hhTfj/DqLj7yVetiZMVrI4OLg
 ifFcc1R/o3hve8fhE015+W3ej9sG33ZbbvQI3et8L7by95LAYI/igcB39niJx+WVUHR20fqa
 /X5K7TfVt79+t0eh1ir/0ARNthz6iJsQbt6Gn89XV+VYJuWd4HKk0rP62Pvlgs1DW2ajCkJS
 7urCfNupT64l9Q9c6fA8+sDH6+qPP6S9HCEPzfIWlu73rXT58CfhVsf5A7GM0DKW1D5sa+Ye
 VeYs7d/3qk/kFhEuOyUO3IlJZeJ/ATFSKGRHBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xu7qTTWamG8ybKGtx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEv4/rHgIKN0hW/95s1MHaJdzFyckgImEis3XaFvYuRi0NIYCmjxLbjp9gg
 EjIS17pfskDYwhJ/rnWxQRS9YpTYfGcOE0iCTcBI4sHy+awgtojAYhaJvfsqQYqYBd4ySlyf
 uRGom4NDWCBEYt3iGhCTRUBV4t82FZByXgF7iS9zPrBCzJeX2H/wLDOIzSngILHp7wqwvUJA
 NY/ezmCDqBeUODnzCVicGai+eets5gmMArOQpGYhSS1gZFrFKJJaWpybnltspFecmFtcmpeu
 l5yfu4kRmFi2Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuGNPTcjXYg3JbGyKrUoP76oNCe1+BCj
 KdDZE5mlRJPzgaktryTe0MzA1NDEzNLA1NLMWEmcl+3K+TQhgfTEktTs1NSC1CKYPiYOTqkG
 pq5/ga4tW0t2r9I+FHrhsc/aMqmjZkWeEVH+PBfeZPPfbvdZz/Rfxkn2d+DHDwkvJ23+W/Mp
 d4N/UXvSP9GT3y9vPRZfOXuVzntzaUvPlf8qFrD6Jequ0DJbfO+qh7bFTbl1Sk7hjD1ZPjs3
 Kx+Vnbq92lpg+9J9dnsLkq0Ut5ZMLWh0Ov8i6brKJlaD+y2OZ+Wquzqv/NjfF5DrXXNwfvaa
 uKM/hM9N3y3SvDv9hN3/Q9L5vGLr82/6Jm78YbPHT7NPUWXtZs9709qWVVVyNrwU6NtZanow
 T/mMrvIJGfe9GgXPrcLLjDS3LEuO1Zv+zH+inXB7U18n49puieQTFRKbXFJU38tMf55k0s6l
 xFKckWioxVxUnAgAm9ewd7UDAAA=
X-CMS-MailID: 20250128194835eucas1p29b16bee72365f321e1056fc4d9d44345
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194835eucas1p29b16bee72365f321e1056fc4d9d44345
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194835eucas1p29b16bee72365f321e1056fc4d9d44345
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194835eucas1p29b16bee72365f321e1056fc4d9d44345@eucas1p2.samsung.com>
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

Add a YAML schema for the T-HEAD TH1520 SoC reset controller. This
controller manages resets for subsystems such as the GPU within the
TH1520 SoC.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 .../dt-bindings/reset/thead,th1520-reset.h    | 15 +++++++
 3 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h

diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
new file mode 100644
index 000000000000..f2e91d0add7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 SoC Reset Controller
+
+description:
+  The T-HEAD TH1520 reset controller is a hardware block that asserts/deasserts
+  resets for SoC subsystems.
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - thead,th1520-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      rst: reset-controller@ffef528000 {
+        compatible = "thead,th1520-reset";
+        reg = <0xff 0xef528000 0x0 0x1000>;
+        #reset-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 33c804f1a60f..b4e21d814481 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20344,6 +20344,7 @@ F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
+F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	drivers/firmware/thead,th1520-aon.c
@@ -20353,6 +20354,7 @@ F:	drivers/pinctrl/pinctrl-th1520.c
 F:	drivers/pmdomain/thead/
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/power/thead,th1520-power.h
+F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RNBD BLOCK DRIVERS
diff --git a/include/dt-bindings/reset/thead,th1520-reset.h b/include/dt-bindings/reset/thead,th1520-reset.h
new file mode 100644
index 000000000000..6bc445c5e39c
--- /dev/null
+++ b/include/dt-bindings/reset/thead,th1520-reset.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#ifndef _DT_BINDINGS_TH1520_RESET_H
+#define _DT_BINDINGS_TH1520_RESET_H
+
+#define TH1520_RESET_ID_GPU	0
+#define TH1520_RESET_ID_NPU	1
+#define TH1520_RESET_ID_WDT0	2
+#define TH1520_RESET_ID_WDT1	3
+
+#endif /* _DT_BINDINGS_TH1520_RESET_H */
-- 
2.34.1

