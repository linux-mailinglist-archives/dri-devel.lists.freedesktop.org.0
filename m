Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B6E9FB142
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1810E323;
	Mon, 23 Dec 2024 16:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="MMHd1oJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB9B10E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125603euoutp010774978c06eab3fafff26dad0b9005b5~Tz57ymCGa0030300303euoutp01b
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241223125603euoutp010774978c06eab3fafff26dad0b9005b5~Tz57ymCGa0030300303euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958563;
 bh=6zd+7DIT+1kozgBZgwLKFgnlnTyFTa1FI7kVqIolk1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MMHd1oJ+so/Vm6vVqIg80vuYZFS07zEklmj5tXCF/tKERm1uEh/yScmJdH6QyG9Lg
 dG1GLzpse3lKcEOP1NiQhorN1/I22USvgItjrTPy8tbW8PpejtfZ1KVthGgbbwF/Zc
 GPqpadhDAoeiyCeY4lBCA/++Zwi7sp9NpspIcdgo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241223125602eucas1p1a33613c4b8e49ec3692fc683273a9c04~Tz57QbuAd1525415254eucas1p1s;
 Mon, 23 Dec 2024 12:56:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 56.0C.20409.2ED59676; Mon, 23
 Dec 2024 12:56:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241223125601eucas1p1d274193122638075dc65310a22616bae~Tz56wdMWw2402924029eucas1p1Q;
 Mon, 23 Dec 2024 12:56:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125601eusmtrp1555a07a0ba7cda11d6586c5aac1bfe96~Tz56vpqK32051220512eusmtrp1G;
 Mon, 23 Dec 2024 12:56:01 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-b6-67695de2fb55
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 31.73.19654.1ED59676; Mon, 23
 Dec 2024 12:56:01 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125600eusmtip2c15e8572f2e770fc420851707013d25c~Tz55Y_9mD3173831738eusmtip2L;
 Mon, 23 Dec 2024 12:56:00 +0000 (GMT)
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
Subject: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem clocks
 and update address requirements
Date: Mon, 23 Dec 2024 13:55:35 +0100
Message-Id: <20241223125553.3527812-2-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUdRTH+917994LtnRdSX4joAJphYaPsek3wpA9YC440+TUaGVJW9wW
 Rti1XRBsmgkFNsElQyx0MViRx0a8lnZXIAjdJdYVZDYUFh12A0akNeTNWhoUy5Xyv+8553PO
 95yZQ+MiI7mGTpSmcHKpOCmY9CaMHX91vzD8QaJka7bGD12xl2LI8FBNoerWbgyVtHcLkLNH
 j6EbcxMkqh2xUej31qME6tN+R6HMjjoSudROEk2pnAJ0vfkciWby2gEyzmSRqKbdQaG6uRIM
 nZ8yEKissRkgZU6FAP16NQo5nFcI5LquwpFS/RT6p6WRQgt9OgIVjbdRSD+WL0CWmn0oq+00
 sWstO9GfTbFjLhfBmo/PUmyrW0OwTWoHxaqaugDbUJVDsgN9LSRbbN3D/nbCgrE/ln3BZtV0
 YOzJ+a3sxM+9JPuVvgqwPZl26k3Re94R8VxS4mFOviXyQ+8Es3KBOGTxT5+scuEZwLw6F3jR
 kNkB7Vo3mQu8aRGjBdBdm4/xwSyA96eHCA8lYmYALLZ8tNxxbGgZqgTwRP81wAdjAObccWEe
 imS2w8HKEoGn4MtkEzD7l6NLFM6MAmi8fW7RkaZXMQeh4YdPPA0EswHe+rZuyU7IvAxb7IUC
 3m4dbLt8DfdoL2YXrM7tBzyzElrP3l7i8UUm01CEe+ZD5rI3VDoyAd/8OvzJdhHn9Sp416Kn
 eB0AOwtUBK9lcNAw/Yj5HDapLI90OBzofrC0J848D+uat/DpV6CqwDOeXtQ+sP/eSn4FH3jK
 WIjzaSE8rhTx9Eb4jSrvP9NurRHjNQsn5/WCr0GQ+rFj1I8do/7fVwPwKuDHpSqSJZxiu5RL
 C1OIkxWpUknYx7LkBrD42p0LltlGUHl3KswEMBqYAKTxYF+hSZQoEQnjxUc+4+SyOHlqEqcw
 AX+aCPYTbohfx4kYiTiFO8hxhzj5chWjvdZkYFnSkfVhXfeJoK6Hb9he+z7QoW1MsITjE0Ex
 NwTatPH38cjSHbPcnO9zb8VFaDetX22Z33TmQIy13ad+c3r1kxV/J99KuHD21YC8PQUZEbHH
 ZlzRhnd2d5qsO/N79k0Vdb1tagzUvRtrLRIOl10KaQpY8em23opL7H54s+tAtGa0cqTE+XQB
 Pl45ZN0Yp9NjGSF9D06N6qK8HIN/CAPF+WP1Vf3s6SdOlhdm3vxyc2tNDEo73zCis/mFpBfX
 a8r3rkgJGJh+JvTignnt+J/Pyl7c63a39c7H7rxgu3p4/700mb9bMhkZUS6JfsleGj8UdaR2
 eDAi+U621Oy009xc6HS4fCyYUCSIt4XicoX4XzIdPwxJBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsVy+t/xe7oPYzPTDaYuM7Q4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXcbjtH0vBcemKD6teMjcwHhbrYuTkkBAwkWh6OJGpi5GLQ0hgKaPEodvP
 mSASMhLXul+yQNjCEn+udbFBFL1ilOic95EZJMEmYCTxYPl8VhBbRGAxi8TefZUgRcwCbxkl
 rs/cCNYtLJApMe/lMUYQm0VAVeLWtPVgcV4Be4k916ezQmyQl9h/8CzYUE4BB4k1XTfA6oWA
 av6d+sAGUS8ocXLmE6BeDqAF6hLr5wmBhJmBWpu3zmaewCg4C0nVLISqWUiqFjAyr2IUSS0t
 zk3PLTbSK07MLS7NS9dLzs/dxAhMRtuO/dyyg3Hlq496hxiZOBgPMUpwMCuJ8B4SykwX4k1J
 rKxKLcqPLyrNSS0+xGgK9M1EZinR5HxgOswriTc0MzA1NDGzNDC1NDNWEudlu3I+TUggPbEk
 NTs1tSC1CKaPiYNTqoFp/+x/zBVi09TmG9hOuZRjFxm25NnxDKtDNsIhMR3sbx/oiyRY3LaI
 VbbYl/TCUWXeea4LZ2W3Sr+4FbXqbozy2vAPL2MmLqgQ23R2tvgdKz6P3FtXGEzN+Hh4fvNZ
 lNhmKrgVW36VLHwzcUGB0MXfKw49Emo7f+tKfcodLuuw6vZPLacuR1pILJ27X8FukvbXmY9v
 P5vZoc2xvubcRSXFRU/Cluu6b7P8FPEzoD3dZ+cXSb7SwLfT1/Q2vWjTkORa+/bbH5OvPFrX
 r/o/mC62mGNeZUrOy1Nc51cllEr8+/pt77yJjy0W3jWx9L6/uXvWa+38KzKnjQV7/z3k+qBS
 Etj6adqsRMZUmz8ftEWDlViKMxINtZiLihMBqefk2c8DAAA=
X-CMS-MailID: 20241223125601eucas1p1d274193122638075dc65310a22616bae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125601eucas1p1d274193122638075dc65310a22616bae
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125601eucas1p1d274193122638075dc65310a22616bae
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com>
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

The T-Head TH1520 SoC’s AP clock controller now needs two address ranges
to manage both the Application Processor (AP) and Video Output (VO)
subsystem clocks. Update the device tree bindings to require two `reg`
entries, one for the AP clocks and one for the VO clocks.

Additionally, introduce new VO subsystem clock constants in the header
file. These constants will be used by the driver to control VO-related
components such as display and graphics units.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/clock/thead,th1520-clk-ap.yaml   | 15 +++++++--
 .../dt-bindings/clock/thead,th1520-clk-ap.h   | 33 +++++++++++++++++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
index 0129bd0ba4b3..f0df97a450ef 100644
--- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
@@ -8,7 +8,8 @@ title: T-HEAD TH1520 AP sub-system clock controller
 
 description: |
   The T-HEAD TH1520 AP sub-system clock controller configures the
-  CPU, DPU, GMAC and TEE PLLs.
+  CPU, DPU, GMAC and TEE PLLs. Additionally the VO subsystem configures
+  the clock gates for the HDMI, MIPI and the GPU.
 
   SoC reference manual
   https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
@@ -23,7 +24,13 @@ properties:
     const: thead,th1520-clk-ap
 
   reg:
-    maxItems: 1
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: ap-clks
+      - const: vo-clks
 
   clocks:
     items:
@@ -47,7 +54,9 @@ examples:
     #include <dt-bindings/clock/thead,th1520-clk-ap.h>
     clock-controller@ef010000 {
         compatible = "thead,th1520-clk-ap";
-        reg = <0xef010000 0x1000>;
+        reg = <0xef010000 0x1000>,
+              <0xff010000 0x1000>;
+        reg-names = "ap-clks", "vo-clks";
         clocks = <&osc>;
         #clock-cells = <1>;
     };
diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
index a199784b3512..8b9a98f878a6 100644
--- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
+++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
@@ -93,4 +93,37 @@
 #define CLK_SRAM3		83
 #define CLK_PLL_GMAC_100M	84
 #define CLK_UART_SCLK		85
+
+/* VO clocks */
+#define CLK_AXI4_VO_ACLK		86
+#define CLK_GPU_CORE			87
+#define CLK_GPU_CFG_ACLK		88
+#define CLK_DPU_PIXELCLK0		89
+#define CLK_DPU_PIXELCLK1		90
+#define CLK_DPU_HCLK			91
+#define CLK_DPU_ACLK			92
+#define CLK_DPU_CCLK			93
+#define CLK_HDMI_SFR			94
+#define CLK_HDMI_PCLK			95
+#define CLK_HDMI_CEC			96
+#define CLK_MIPI_DSI0_PCLK		97
+#define CLK_MIPI_DSI1_PCLK		98
+#define CLK_MIPI_DSI0_CFG		99
+#define CLK_MIPI_DSI1_CFG		100
+#define CLK_MIPI_DSI0_REFCLK		101
+#define CLK_MIPI_DSI1_REFCLK		102
+#define CLK_HDMI_I2S			103
+#define CLK_X2H_DPU1_ACLK		104
+#define CLK_X2H_DPU_ACLK		105
+#define CLK_AXI4_VO_PCLK		106
+#define CLK_IOPMP_VOSYS_DPU_PCLK	107
+#define CLK_IOPMP_VOSYS_DPU1_PCLK	108
+#define CLK_IOPMP_VOSYS_GPU_PCLK	109
+#define CLK_IOPMP_DPU1_ACLK		110
+#define CLK_IOPMP_DPU_ACLK		111
+#define CLK_IOPMP_GPU_ACLK		112
+#define CLK_MIPIDSI0_PIXCLK		113
+#define CLK_MIPIDSI1_PIXCLK		114
+#define CLK_HDMI_PIXCLK			115
+
 #endif
-- 
2.34.1

