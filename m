Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B69FB166
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205A610E566;
	Mon, 23 Dec 2024 16:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="m/3eQcvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B1610E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:19 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125617euoutp012ac9528a61f9fdcc144449437cf9d2f2~Tz6Jo0X043236432364euoutp01_
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241223125617euoutp012ac9528a61f9fdcc144449437cf9d2f2~Tz6Jo0X043236432364euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958577;
 bh=bX0rUApl/OyXclMn0ZY1Lk+3ve7QkKG+T1s0MKtFTYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/3eQcvzmWmicUadN+catlEeEg2we8VPkLVd2n3tE0/o6WLqly+sCyPIskxw65wRr
 VL3sW1YOufGoREQ2NDzlTgh94T/3fknQanA8GAqoFvCYKvTX39wBOi7/c5fJrY6kZf
 2k0qEnv1c91e1te0b4Mftzk67pgg79PA39GKFADc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241223125617eucas1p273275e5c6a512aca2d9a1358979c0b6c~Tz6JR10zl1778817788eucas1p2R;
 Mon, 23 Dec 2024 12:56:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 06.C6.20821.1FD59676; Mon, 23
 Dec 2024 12:56:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e~Tz6Iz8Ogf2931129311eucas1p2L;
 Mon, 23 Dec 2024 12:56:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125617eusmtrp17c06cae4cb0d979c22f08a886ea39975~Tz6IzBMMD2051220512eusmtrp1j;
 Mon, 23 Dec 2024 12:56:17 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-8f-67695df1e12a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CD.F3.19920.0FD59676; Mon, 23
 Dec 2024 12:56:16 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125615eusmtip2ed9e2f327938a70fbc1bebd059b3c8a5~Tz6Hb2XDK2641026410eusmtip2m;
 Mon, 23 Dec 2024 12:56:15 +0000 (GMT)
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
Subject: [RFC PATCH v2 12/19] dt-bindings: gpu: Add compatibles for T-HEAD
 TH1520 GPU
Date: Mon, 23 Dec 2024 13:55:46 +0100
Message-Id: <20241223125553.3527812-13-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzved937zu4Nl8mxZNp5O7IqztAPQ+fKzPNsjc50/6y6Ax3471B
 jh9uLKWjgjZAcQL+6IiXEYg6abJQYgsI3LWQTbFRogOLgSYcwW3yY2LDHdTGS+V/n8/n+/l8
 fzz3CHGJlVwhzMjKZVVZMqWUjCSs3XOu+Om9GYq1+qpnkLO/HkOWIEehxk4Xhmq7XAI0dKMF
 QzdnJ0n07egvFPqzs5BA7oYaCmm7m0g0zg2RaFo/JEB97QYS+Y91AWT160hk7vJQqGm2FkOn
 py0EOtvaDlDxEaMA/XrtTeQZchJovE+Po2JuGfq7o5VCC+5LBKq+b6NQi/e4ADnMe5DOdorY
 8hwzOVBEMd7xcYL56fADiul8WEcwbZyHYvRt1wHTbDpCMoPuDpL5+uq7zPBRB8Z8d/ZzRmfu
 xpjy+bXM5OVbJFPWYgLMDW0/tVuSErkpjVVmfMyqEjfvi0z3XPKCnOPRhwpHnWQBmBKXgggh
 pDfACcsPoBRECiV0A4ALvptL5AGAfRedAp74ASwz9IYqwsVIjQ7y+nkArVeMFE+8AOpKglS4
 L0mvh3fO1y6mo+kiAhZdKVzsi9NjociIgQy7ltN7YOOjjsUEQcdBW8AoCGMRvQVe0AYIfsNY
 aPvxZzyMI0J6Y+kA4D1R8GrVyKIHD3m0lmqc95sj4Tctah6/ASuDxRSPl8MJR8sSXgl7TuqX
 +mfDO5aZpWw+bNM7lvArcND1iAyfjNMvwqb2RF7eCm32EYx/CTEc8EXxG4jhCWslzssieLhY
 wrtfgF/qj/031NVgxXjMQNfJckEFWM09dgv32C3c/3PrAG4CMaxGnalg1euy2IMJalmmWpOl
 SJBnZzaD0NfuWXDMtIKaiekEO8CEwA6gEJdGi+ySDIVElCbL+4RVZaeqNEpWbQfPCglpjCgu
 LZaV0ApZLrufZXNY1b9VTBixogBL/GBDyV+3qEPoxNN7ffUXk15N6i1x3072f3Ft0Bf3+6b7
 lerh/Nr8g6mG9Kden8obSV812tv5m8ZSl1qY/Jq3NWp0LkbQtOuc4Xv8zM4c7YQsdWF2rlsr
 lyk55YHyNW+lzHJFjiB3YKM0LdDzhGjlw9i7dNkO00cjz1eKc3Wng4qpVfvG5Mn3jrZ9en2b
 Uv7+9pfX1/VuZc9EGIt33XWURLmH2Nh60VfRyUkXKt6RmqtTSs7Fj6127h74w79MM79twHR7
 TJOkwKoC90yYb7w/YSK+ojmQM0w3l8ft4Hy0Z+N7MzWtm+c/vJynrTLWArFg+9Rn2NtPeuQF
 iv3tUhe+ZqeUUKfL1r2Eq9SyfwAYRxV/SQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7ofYjPTDY60W1qcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLuLvxDWPBRJGKxqcn2BoYP/B1MXJwSAiYSMxtkehi5OIQEljKKPFk6wmW
 LkZOoLiMxLXul1C2sMSfa11sEEWvGCW6vj1kBUmwCRhJPFg+H8wWEVjMIrF3XyVIEbPAW0aJ
 6zM3gnULC4RKnF/0mQ3EZhFQldj/YxlYA6+Ag8Tq5h9QG+Ql9h88ywxicwLF13TdYASxhQTs
 Jf6d+sAGUS8ocXLmE7B6ZqD65q2zmScwCsxCkpqFJLWAkWkVo0hqaXFuem6xoV5xYm5xaV66
 XnJ+7iZGYHrZduzn5h2M81591DvEyMTBeIhRgoNZSYT3kFBmuhBvSmJlVWpRfnxRaU5q8SFG
 U6C7JzJLiSbnAxNcXkm8oZmBqaGJmaWBqaWZsZI4r9vl82lCAumJJanZqakFqUUwfUwcnFIN
 TDX3GfsSPohGmPDcPTtNmnVTof60uPg3nktvGz7dPr9Zt3atcOu2+aldzgkbdIQlS9YnBa59
 XliZqPznvYLZ57UmBg+V75p9tuv+/+1p4sWvtzaqFyfoGk1c9eesmPH/5P9S/JMVKk+IRD65
 E9X4LaQvwLxE7fsBv9sna1NnFbvUZrdV7nideVf9L1vv9L3hnfP/CZ96oW6e8+Z4tFxK3gnT
 Czc+bu+rXVnGdsn30kcd/v1iSnwzje1n3AucYThn27fybz2s/8/Uttze26Dhy3jNLsNJreC/
 wqqs9Wv3buDV0pU4FN/mvD1aT4f1UHRvgFOycE7aUjMnvuydfNtr2G5dnsBwyzfV9erCtN5w
 JZbijERDLeai4kQAYzCmz7gDAAA=
X-CMS-MailID: 20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e@eucas1p2.samsung.com>
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

Add a new SoC-specific compatible ("thead,th1520-gpu") for the T-HEAD
TH1520 GPU, alongside the Imagination BXM family compatible
("img,img-bxm").  This documents the GPU integration on the T-HEAD
platform.

Also adjust clock name constraints to accommodate a second clock named
"sys" instead of "mem" for T-HEAD. This is achieved by changing the
order, and making the 'sys' appear before 'mem'.

Provide example of the new GPU node.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4078cc816ea1..1eb1c15baec4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -15,7 +15,10 @@ properties:
     items:
       - enum:
           - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+          - thead,th1520-gpu
+      - enum:
+          - img,img-axe # IMG AXE GPU model/revision is fully discoverable
+          - img,img-bxm
 
   reg:
     maxItems: 1
@@ -27,8 +30,8 @@ properties:
   clock-names:
     items:
       - const: core
-      - const: mem
       - const: sys
+      - const: mem
     minItems: 1
 
   interrupts:
@@ -62,6 +65,15 @@ allOf:
       properties:
         clocks:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-gpu
+    then:
+      properties:
+        clocks:
+          maxItems: 2
 
 examples:
   - |
@@ -77,3 +89,19 @@ examples:
         interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
     };
+
+    #include <dt-bindings/reset/thead,th1520-reset.h>
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+    #include <dt-bindings/power/thead,th1520-power.h>
+
+    gpu: gpu@fff0000 {
+        compatible = "thead,th1520-gpu", "img,img-bxm";
+        reg = <0xfff0000 0x1000>;
+        interrupt-parent = <&plic>;
+        interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk CLK_GPU_CORE>, <&clk CLK_GPU_CFG_ACLK>;
+        clock-names = "core", "sys";
+        power-domains = <&pd TH1520_AON_GPU_PD>;
+        resets = <&rst TH1520_RESET_ID_GPU>;
+        reset-names = "gpu";
+    };
-- 
2.34.1

