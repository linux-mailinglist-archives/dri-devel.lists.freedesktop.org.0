Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364E9FB145
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF0110E32A;
	Mon, 23 Dec 2024 16:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="eyPl5k4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29A410E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:17 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125616euoutp01d077363d5da106a0d4aa93ad0e41df1d~Tz6IcL4n40136501365euoutp01T
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241223125616euoutp01d077363d5da106a0d4aa93ad0e41df1d~Tz6IcL4n40136501365euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958576;
 bh=CH+o+BT5CH8pP4jAIXXZjCpR1ExgeU4+9OPJ7VLtzO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eyPl5k4jFdkiIANPc7CsOey4Z9YrqtFxREp/+/i7VrWJZbWe71hL/I84gwv+vpNrw
 q0w7tDF3VxSR2bxUL/p5x8YZ+p5GlPWJgHsms8nRjq3xd+gJhPSSXgS6X96yAdyqYz
 cBM0m7/f+JI/pjtHqU9mZD9zLInJlIMcLY6JSdIo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241223125616eucas1p29a408e445bfb10f0be59fae80ed2951b~Tz6H_3c4s1252912529eucas1p2D;
 Mon, 23 Dec 2024 12:56:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 85.52.20397.0FD59676; Mon, 23
 Dec 2024 12:56:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241223125615eucas1p10cd69b9a6f03f33ce9b9346558de6ce6~Tz6HkcMS72173221732eucas1p1k;
 Mon, 23 Dec 2024 12:56:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125615eusmtrp1840abba5b4072feba5f4284e2ba926c9~Tz6Hirjy22059320593eusmtrp1y;
 Mon, 23 Dec 2024 12:56:15 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-9b-67695df06cfc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 04.83.19654.FED59676; Mon, 23
 Dec 2024 12:56:15 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125614eusmtip2b8f68f28c34f19f988afc93cb65a78a9~Tz6GLQ_i22639426394eusmtip2Q;
 Mon, 23 Dec 2024 12:56:14 +0000 (GMT)
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
Subject: [RFC PATCH v2 11/19] dt-bindings: gpu: Add 'resets' property for
 GPU initialization
Date: Mon, 23 Dec 2024 13:55:45 +0100
Message-Id: <20241223125553.3527812-12-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH+z7Ps+cZuxs9jHX7Rp7UwsREROrsm3idpNmDaeFdxlnXj9We
 JsdPNxHz7JQ2CMYIJIlzSIPEBJQ4aFtAwBBwU4glP0R+TuisNiMQN0r0GDEeKv97fT+f9+fz
 /nw+9+XjIhMZxI9PPsQqk2WJUlJAmK3z9g133o1XRBTnEujKjW8wZHqgp9DFFjuGDJ12HnL0
 GTE0MDdDou9+vUYhZ0sGgQYrSymkttaSyKV3kGhW5+Ch/qYzJHLndQJkdmtIVNM5TqHaOQOG
 ymdNBKpoaAIoK+dbHurtegWNO64QyNWvw1GW/lG02NxAIe9gHYFKpi0UMk6d5CFbTRzSWE4R
 21YzM0OZFDPlchFMR7aHYlr+KiOYRv04xegafwJMfXUOyYwNNpPM11f3MjdzbRjzfcVxRlNj
 xZj8hQhmpvU6yXxhrAZMn/oGFSt6W7BVzibGH2aVG1/6QHCgYv4mSJ2mjhgcA/gJ0EFqAZ8P
 6efhL0NrtcCPL6IrAWwrDdMCwRJ7ABx/0Aq4hxvAy6dGgE/lKxjNd+JcxXkA+z6L4ERTAJa2
 DS4nSDoSTpw38HwJMZ1JwMzLGcutcPp3AM23zpA+VSD9HjR7f6N8TNBrYF29B/OxkN4GDTNq
 irMLhpZLPctd/ZbiF7VDgNMEwKunbxE+xpc0alMJ7jOAdI0AfrUwjHHFO2Bh4fDK3IHwts24
 0nQV7P5SR3CcAidMd3GOj8FGnW2Fo+CY/f7ykXB6Haxt2siFo+FElRlwt/OHQ38GcCP4w0Jz
 Mc6FhTA7S8Spn4FFurz/TO2V5pXBGNij68UKwFP6h5bRP7SM/n/fMoBXAwmbpkpSsKrnktn0
 cJUsSZWWrAj/KCWpHiz97G6vba4BVN6eDW8HGB+0A8jHpWJhuyheIRLKZZ8cZZUp7yvTEllV
 O3iCT0glwjXyYFZEK2SH2ASWTWWV/2Yxvl/QCWx7ldfyYqRk3F06un74qHXP/h2C5gzx+u7X
 uz62lE0/3lkiPf1G2I/Xj00bL/B4eSWTC870O557o+fuN1rF19KjN3lCw2NeS3Mg9MLBrSfP
 JnbtBZO6I0/qq1yKn1c5zypH7k2ORc4vzMgL9v3x2IUw18Cbd3t46h92RockbJc9DbYMCNZC
 d+DfkghNnjpr86K4SDsbN/1IrOWdt+o2oJjWQC8qWOdUSBJ2k0SqYDE41BgZ17+zWxsTV1cc
 q5cXZm/J75A27ztcVB4SvflDzTlljjuqv7xZ2ZBLhrwcFcroK4xBn3+aljvSJQ/e5TxuFx+s
 fTU7oK13v7t8dbU/2hV6SUqoDsg2PYsrVbJ/ALyiZi1IBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7rvYzPTDZZvVbA4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXseTnfcaCd+wV8+9dYW5gPMzWxcjJISFgInG7/wVzFyMXh5DAUkaJtb1z
 mSESMhLXul+yQNjCEn+udbFBFL1ilNiwfh1Ygk3ASOLB8vmsILaIwGIWib37KkGKmAXeMkpc
 n7kRrEhYIEZi3dwnjCA2i4CqxMZNX5hAbF4BB4n575vZITbIS+w/eBZsMydQfE3XDbB6IQF7
 iX+nPrBB1AtKnJz5BGwmM1B989bZzBMYBWYhSc1CklrAyLSKUSS1tDg3PbfYSK84Mbe4NC9d
 Lzk/dxMjMMFsO/Zzyw7Gla8+6h1iZOJgPMQowcGsJMJ7SCgzXYg3JbGyKrUoP76oNCe1+BCj
 KdDdE5mlRJPzgSkuryTe0MzA1NDEzNLA1NLMWEmcl+3K+TQhgfTEktTs1NSC1CKYPiYOTqkG
 Ju4Q63cM03eszY44topHX1EwQK4uJbLqH/Ptz1EOgpWGHIu/XQhhDzUTztTeqxk3U0plz3yH
 rbPvMi3Z11FXpq3usMP1+i0lJvbwCOXPu3dam9acsF6QGLWz3uD47XXP2QPl5ZeUnXv+fH7B
 z5CHHOaX6nr3/urMV+Ne2a04ufy9pKBM1LGNUxx/Xi+q51dyNvNR5Hm9+U9bUDv7+1B2H27V
 lUbcoZauL2uvcyT5tckcsta/+jeO+eOTnXfsXCWmqinK7XhwcffeTD+jJ9aXG2ReKaSvuzXT
 ze/N4tVH+fqOH22pXCqh/PTOtOhJpV+5dEVKdT8FH2yVmXhnLqOn8rFiz5ud7MlbfiuvCdmt
 xFKckWioxVxUnAgAYwq0B7kDAAA=
X-CMS-MailID: 20241223125615eucas1p10cd69b9a6f03f33ce9b9346558de6ce6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125615eucas1p10cd69b9a6f03f33ce9b9346558de6ce6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125615eucas1p10cd69b9a6f03f33ce9b9346558de6ce6
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125615eucas1p10cd69b9a6f03f33ce9b9346558de6ce6@eucas1p1.samsung.com>
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

Many RISC-V boards featuring Imagination Technologies GPUs require a
reset line to be de-asserted as part of the GPU power-up sequence. To
support this, add a 'resets' property (and corresponding 'reset-names')
to the GPU device tree bindings. This ensures the GPU can be properly
initialized on these platforms.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087..4078cc816ea1 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -37,6 +37,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: gpu
+
 required:
   - compatible
   - reg
-- 
2.34.1

