Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB099FB14F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41AA10E55C;
	Mon, 23 Dec 2024 16:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="oErr830G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC11510E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125605euoutp01296efe6868c05422e5af1fab2a9392c4~Tz5_SsMJ03236432364euoutp01r
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241223125605euoutp01296efe6868c05422e5af1fab2a9392c4~Tz5_SsMJ03236432364euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958565;
 bh=wBBLsKGXWyEqQGVNgz3V2oTa+rvBYCB5hR0TfbaEAH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oErr830Gjm/bmGHta6xtXYdZqWJhr9MO8Gd4FmLMXUDqI8Kih9QU5dkGsFiAeVrDG
 pAqDL9s/ibinWFhwnjENxC9vfeFsEli/wYifS6i0MGMGZf8sFhWbW0Uq/TLG5nI9vr
 UaroLZRhMkz3uUhY+NvWvPzdGuhTvDGhMBKB7x18=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241223125605eucas1p2f76411c79a47a9e8ca28fbb04bd9465c~Tz59yY1Zl0564105641eucas1p25;
 Mon, 23 Dec 2024 12:56:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 19.42.20397.5ED59676; Mon, 23
 Dec 2024 12:56:05 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13~Tz59UxfuR1252912529eucas1p26;
 Mon, 23 Dec 2024 12:56:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125604eusmtrp18a1c30f0d180d1d7e7966b9cc97efad1~Tz59Tl-zR2059320593eusmtrp1c;
 Mon, 23 Dec 2024 12:56:04 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-73-67695de523ef
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 16.73.19654.4ED59676; Mon, 23
 Dec 2024 12:56:04 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125603eusmtip248b281e142e58167d0f8d938368903fd~Tz577z94S1803818038eusmtip2j;
 Mon, 23 Dec 2024 12:56:03 +0000 (GMT)
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
Subject: [RFC PATCH v2 03/19] dt-bindings: power: thead,th1520: Add support
 for power domains
Date: Mon, 23 Dec 2024 13:55:37 +0100
Message-Id: <20241223125553.3527812-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzdfe/1vdKt+Cxs3gDRDeecLICoZJdBmFtm8qbZAovZR7NNOvpW
 Kp9pQWUhmXwqXRFlOGJhIsxIg1CwK7VtYMTyURDWqBVomK2Y4bo2bIwvI6h11Ieb/53f75xz
 z/kll4+LTGQYX56TzypyJFmRpIAwDi7bo+9+IZdtb+4j0dBEM4a6Hmgo1NZjx1Bjv52H3DcM
 GLq5NEsi3d1rFPqzp5hA49ofKVQ62EEir8ZNojm1m4cclgYSLVT1A2RcKCNRe7+LQh1LjRhq
 musi0HmTBaCKygs8dP3qHuRyDxHI61DjqEKzDj3uNlHIP36JQPV/91LIMHOKh2ztn6Cy3lpi
 90Zm1llOMTNeL8H0HV+kmJ575wjGrHFRjNo8Chh9ayXJ3BrvJpmzw6nM7e9sGPPz+W+ZsvZB
 jKl+tJ2Z/WWMZE4YWgFzo3SCShGJBUlSNkt+iFXEJqcJMn5frAR5J8KP6Fwe8igwvKQCQXxI
 74JT9UOECgj4IloL4AW9BeOGRQB9nnqcGxYA7KvtJp9arKXFgCNaALTrTSQ3zKz6vXNYQEXS
 O+BUSyMvQITS5QQsH+AsOO0B0Djd8OStEPoAbCmp5gUwQW+BF68PgwAW0m/DPu0YweVtgr1X
 fsUDOIjeDdtUzjXNejh8ZvqJBl/VlHZxZSHdLoBDj8cBZ34PdlaVYBwOgT6bgeJwBBz5Xr0W
 kAunuuZxDhdBs9q2hhPhLfvKalH+asA22GGJ5dbvQIN3nhdYQzoYOv9az1UIhjXGOpxbC+Hx
 ChGnfg2eVlf9F2rXGtfKMPAP6ylwEryieeYYzTPHaP7PPQfwVrCBLVBmy1jlzhz2cIxSkq0s
 yJHFpOdm68Hq5x7x25ZMQOubi7ECjA+sAPLxyFChVSSXiYRSSeE3rCL3gKIgi1VaQTifiNwg
 3CLdxIpomSSfzWTZPFbxlMX4QWFHsRdGkq89tyv69rYxNDf9k1tnzojxhPCEkwffKCmVT9yp
 M2fWRH1+JPeyW8W0ddXG7XSMXTYXyRx+nTYi9R8y5dVEP5U+U3gx6krh4YMf3fe8LN3xoX5d
 y/5J99AdeUmOwscrjkjYu5W5lNysHXW8u29MtSxjV+YjBuItsO5hTfU0m7l4L7Ty7KDVmbjS
 ejpNbHjfcjPtRemAzPtb7KGvpPs/fdM9f9WftfXBVNJSZ34CVv3lZ31FcfF1Tv+kOP4t2wdG
 10RjZlNa9KM88cmwj9NpbG/76OaGznpBSpPkdfjDQJl+Uu8Tb3yYgILreE5dXuro8vh00vOJ
 m4vCjx0j738dSSgzJHFRuEIp+RcfsFGcSwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7pPYjPTDTpvK1mcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLePylk7GgT7pi3d3nbA2MW8S6GDk5JARMJA41NzJ2MXJxCAksZZS4Ov8K
 E0RCRuJa90sWCFtY4s+1LjaIoleMEjdmdDKCJNgEjCQeLJ/PCmKLCCxmkdi7rxKkiFngLaPE
 9ZkbwbqFBWIl/u88wAZiswioSqy+eBKsmVfAXuLwiqtQG+Ql9h88ywxicwo4SKzpugFWIwRU
 8+/UBzaIekGJkzOfgNUzA9U3b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PTc4uN9IoTc4tL89L1
 kvNzNzECE8y2Yz+37GBc+eqj3iFGJg7GQ4wSHMxKIryHhDLThXhTEiurUovy44tKc1KLDzGa
 At09kVlKNDkfmOLySuINzQxMDU3MLA1MLc2MlcR52a6cTxMSSE8sSc1OTS1ILYLpY+LglGpg
 WtT74+3DyzavC9+FnM3Y2Fx8yW26I+tOtbV9C1TPCO5YvVEy4PJ5xma3F+LKa288jPCRCZ/x
 K27Lidkpd/7sWcmwdO2yXO8Hz5ryntvtY7K24fNg0tea66JcvSKimVvXtC18vvX/d/dEl6+y
 2tiZND3jw5PMLL2TdnFyu26GBh/6tPRWTmXU6z++sZn8D7L3LrrPfaxy+pv7Jkb+h1tiFKcc
 kGPa753CubrX7qRxocj5fb4ft3ZL/Hv7U3ptsGP73ucPnmRW5y04f/mv3WLW45n7r4RejdDn
 lxC86Mxct7v4z0fuNJW2M7sZc+oMU89vb/pQvcX1XE2DLC9bbvcMF+8g08/rtuzYuFajhcGD
 TYmlOCPRUIu5qDgRAH3Joda5AwAA
X-CMS-MailID: 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13@eucas1p2.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2024 16:04:53 +0000
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

Introduce a device tree binding for the T-HEAD TH1520 power domain
controller. This allows devices to specify their power domain
dependencies, thereby improving power management for subsystems such as
the GPU. The new YAML schema describes the power domain node for the
T-HEAD TH1520 SoC.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/power/thead,th1520-power.yaml    | 42 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 .../dt-bindings/power/thead,th1520-power.h    | 18 ++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h

diff --git a/Documentation/devicetree/bindings/power/thead,th1520-power.yaml b/Documentation/devicetree/bindings/power/thead,th1520-power.yaml
new file mode 100644
index 000000000000..28ff86f2cb05
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/thead,th1520-power.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/thead,th1520-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 Power Domain
+
+description: |
+  The T-HEAD TH1520 SoC includes a power domain controller responsible for
+  managing the power states of various hardware domains such as the GPU.
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    const: thead,th1520-pd
+
+  "#power-domain-cells":
+    const: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#power-domain-cells"
+
+examples:
+  - |
+    firmware {
+        aon: aon {
+            compatible = "thead,th1520-aon";
+            mboxes = <&mbox_910t 1>;
+            mbox-names = "aon";
+
+            pd: power-domain {
+                compatible = "thead,th1520-pd";
+                #power-domain-cells = <1>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..c0e9639ac210 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20192,6 +20192,7 @@ F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
+F:	Documentation/devicetree/bindings/power/thead,th1520-power.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	drivers/mailbox/mailbox-th1520.c
diff --git a/include/dt-bindings/power/thead,th1520-power.h b/include/dt-bindings/power/thead,th1520-power.h
new file mode 100644
index 000000000000..45835f25010d
--- /dev/null
+++ b/include/dt-bindings/power/thead,th1520-power.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#ifndef __DT_BINDINGS_POWER_TH1520_H
+#define __DT_BINDINGS_POWER_TH1520_H
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

