Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8C3A3C114
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAE810E80B;
	Wed, 19 Feb 2025 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="gZeoFqMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3AF10E7FC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140302euoutp01c71be7cf4a1903d4bcdf13e69ac519e2~loO-IuiMG1247812478euoutp01R
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140302euoutp01c71be7cf4a1903d4bcdf13e69ac519e2~loO-IuiMG1247812478euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973782;
 bh=tiAogzDnp3X5AVGtde4GrCWYG6lJFIpXWWslOKRJqrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gZeoFqMlkJ+YnWj1fmDmyyd8TFmoEqpVZifZ2+wI0GIUVw8zcafbxO6XrHW0QZsCX
 DI1CZvu9OyMNiC83zVC6cjJxcl5GPTOeihtynfj49spbObVE8VK0biYayd0ndwwLDE
 uzyawQqnuTXZeal3a4l/XXVkTsFCAp1td3UzYX98=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250219140302eucas1p2c1a7c3f1a885f4ce4de5df5513cb455a~loO_gMcGF2649626496eucas1p2o;
 Wed, 19 Feb 2025 14:03:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7F.73.20821.594E5B76; Wed, 19
 Feb 2025 14:03:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639~loO978eW42656126561eucas1p2y;
 Wed, 19 Feb 2025 14:03:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140301eusmtrp1448f32bd534ff4313a0e82bd593f36cc~loO96gQ1d2415024150eusmtrp1d;
 Wed, 19 Feb 2025 14:03:01 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-3f-67b5e495a558
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6F.76.19920.594E5B76; Wed, 19
 Feb 2025 14:03:01 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140300eusmtip2b03cc0867969973d99117e93d945b810~loO8tKSj42765027650eusmtip2d;
 Wed, 19 Feb 2025 14:03:00 +0000 (GMT)
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
Subject: [PATCH v5 09/21] dt-bindings: clock: thead: Add GPU clkgen reset
 property
Date: Wed, 19 Feb 2025 15:02:27 +0100
Message-Id: <20250219140239.1378758-10-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVRTdRjH/d17d++2w+B6tfy1SmunOqHFS6ejv1OeIgu71amjZZmew7GV
 16HA4Gy8ZGFivAQ0BZJKxmuTBHY2F7CN8V4IDHlZ+QJDZXMppUMQEOUEJMW4WP73fb7P5/l9
 n+ecnxBnzKRUuFcZz6mU8mgZKSasnTO/PvvdsEUR0n0ZQ11OHYYsc1oKGZodGCptdwiQ+6wZ
 Q+fvjJPo5B+/Ueh68yECDVQWUyi100Qir9ZNokmNW4DONRSRaOpwO0DWqTQSGdtdFDLdKcXQ
 D5MWApXbGgDKyDohQGe6w5HL3UUg7zkNjjK0AeifJhuF5geqCVR4s5VC5tE8AbIbt6O01nwi
 bDU7PphOsaNeL8GeyrxNsc3TZQRbr3VRrKa+F7A1+iySHRpoItmS01vZy1/bMba2/CCbZuzE
 2Jy7Iex4Sz/JHjHrAXs21UltYXaKN+7movcmcqrglz4SR9o6wuNy/D49OVZNpYAGUTYQCSH9
 PLyra8GygVjI0JUAZledIvniNoD1V3UCvpgCsKRuVnBvxOTx4HyjAsDpvxqXqFEA8ycqCB9F
 0s9BT0XpYmMlnU7A9I5DwFfg9DUArcNFpI9aQW+DV76yLb5L0E/CzNH+BS0USugwmOKK4+PW
 wNZf+nCfLVqwW85IfbaEXg5PFwwvZuELSKqlcHEjSFeLoX36T4KffQ2OXbpC8XoFHLGbl/Qj
 sOeoZomJhR7LLZzXybBeY1/SL8Ihxyzpy8XpQGhqCObtV+Bw3THKZ0PaHw6OLedX8IffWL/H
 eVsCMzMYnn4Kfqs5/F+oo9KK8QgLu8yf54LHtffdor3vFu3/sWUA14NVXII6RsGpQ5VcUpBa
 HqNOUCqCPomNqQELH7tn3n7LBopHJoPaACYEbQAKcdlKScZBs4KR7Jbv/4xTxe5SJURz6jbw
 sJCQrZLoWtMVDK2Qx3NRHBfHqe51MaFImoK9cVwXw02so9xRztx1frEB2tYNtpT4mU039hkv
 /GQFytpG49E3ax+c94pzIqKnAx/dOeWq2ZC0g2pO1l+Yod0PhJJ73pFGOEOGw6Rb/ZKLHb/P
 9gre2nGzzL+tj2E297cUZCUNFs6u10fZjQcMuvmeY03rbWsqnn6iI88wl6gW5z0TPCC+Kjuv
 VcAZOs6wx/B6+quOOfJvs7f/7ZI+LvCxtZHZHx4gwhO7t01+ufEh6Y+ekMYvLlollqRrQ84P
 Ol8W/9yx/8T2CSZiZNf1oqr3Pi5INl3Mh2HM6oBN5f5jrtQt7n2ZIrpsc91YqrOT6Y2EuctG
 jl8CN15YJi6o0uvef1dGqCPloWtxlVr+L643Yf1HBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7pTn2xNN9g9T8LixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
 xeVdc9gsPvceYbTY9rmFzWLtkbvsFuu/zmeyWPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
 l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
 X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
 +66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexo6jrgX9PBXr3m5kb2DcxdnFyMkhIWAisf7BA+YuRi4OIYGljBLnvt1h
 hkjISFzrfskCYQtL/LnWxQZR9IpRYsnKT+wgCTYBI4kHy+ezgtgiAotZJPbuqwQpYhZ4yyhx
 feZGoG4ODmGBIInPswtBalgEVCU63lxlBQnzCjhINNwtgJgvL7H/4FlmkDAnUHjfRSmQsJCA
 vcS5vvtg03kFBCVOznwCdg4zUHnz1tnMExgFZiFJzUKSWsDItIpRJLW0ODc9t9hQrzgxt7g0
 L10vOT93EyMwsWw79nPzDsZ5rz7qHWJk4mA8xCjBwawkwttWvyVdiDclsbIqtSg/vqg0J7X4
 EKMp0NUTmaVEk/OBqS2vJN7QzMDU0MTM0sDU0sxYSZzX7fL5NCGB9MSS1OzU1ILUIpg+Jg5O
 qQam46tbog/kascarNoQx3DOmYt9htAm1S6LGsGVbgtVT1aXnjzzfEW/ynU2htN1m2+UTO5m
 6p/6durRxu8HPQMyP9nmVcqH/5zBzs3zWHReefmPdHEL+0mXJHedDpie+63oge0+8Stvgh1W
 z5gREVXhtf0na+oaTdu5L9NvB/R6GRxu2jw99+Ren98F2ZITKhwVnjN806l8pXx9xz/lOt77
 If28/SGKlo+X3FzkN+PhJJ9txt8Ev+10anIIzD46Kdu5qO1Q+QRlqZg0FtED6fsr9tYHXF5Z
 J/GGP77UQjpyspDnZQPWriNRE/fP/t/TF8y7eMLHSeU/0157aIVJPtJ5+8B/6XE+5Y8bGgVc
 Fu1VYinOSDTUYi4qTgQAwMlhCbUDAAA=
X-CMS-MailID: 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639@eucas1p2.samsung.com>
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

Add a mandatory reset property for the TH1520 VO clock controller that
handles the GPU clocks. This reset line controls the GPU CLKGEN reset,
which is required for proper GPU clock operation.

The reset property is only required for the "thead,th1520-clk-vo"
compatible, as it specifically handles the GPU-related clocks.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/clock/thead,th1520-clk-ap.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
index 9d058c00ab3d..6ea8202718d0 100644
--- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
@@ -40,6 +40,12 @@ properties:
             (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
             a maximum FOUTVCO of 2376 MHz.
 
+  resets:
+    maxItems: 1
+    description:
+      Required for "thead,th1520-clk-vo". This reset line controls the
+      GPU CLKGEN reset which is required for proper GPU clock operation.
+
   "#clock-cells":
     const: 1
     description:
@@ -51,6 +57,16 @@ required:
   - clocks
   - "#clock-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-clk-vo
+    then:
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

