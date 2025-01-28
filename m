Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBACAA21280
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292CD10E6F9;
	Tue, 28 Jan 2025 19:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="CNxgZhcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1D610E6F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194851euoutp02997c62049a12e1e5167e0a7600ef4041~e8wpGomX-0801408014euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194851euoutp02997c62049a12e1e5167e0a7600ef4041~e8wpGomX-0801408014euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093731;
 bh=vt7JWzghtAmS4fKJN8Ir00QUirp5ujThWVAc+56dmcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CNxgZhcGjcpvAthpuJEXiAkruh9b4Lovk42IzlZaLsEiy8WWiZrN3P/FfsOrSx4I1
 9y8WnLHZI1uaQsGOEDTecePedUYrvs2MDb12fZNQvNohVfUBYj2HqED+V/Cp0YxaIG
 DJHRyaL325s3Zyz+HIqcLRwbzc5gdmx4KdClUeKs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194850eucas1p11f9e60d10d2e7c183dc984e76151c4d4~e8woS9N4J1601016010eucas1p13;
 Tue, 28 Jan 2025 19:48:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C3.C2.20409.2A439976; Tue, 28
 Jan 2025 19:48:50 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194849eucas1p1c957dedd293b3091d8dfb35bdfa1fb0c~e8wnEPIKG1601116011eucas1p18;
 Tue, 28 Jan 2025 19:48:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194849eusmtrp2e8eaba1fb03f93c070f3988728d2da39~e8wnDgw6k0493804938eusmtrp2N;
 Tue, 28 Jan 2025 19:48:49 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-2c-679934a295ca
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 51.F0.19920.1A439976; Tue, 28
 Jan 2025 19:48:49 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194847eusmtip1fc75fd1ce7c2e9e3f0336886a24de17f~e8wlX99iV0756107561eusmtip1V;
 Tue, 28 Jan 2025 19:48:47 +0000 (GMT)
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
Subject: [PATCH v4 18/18] riscv: dts: thead: Add GPU node to TH1520 device tree
Date: Tue, 28 Jan 2025 20:48:16 +0100
Message-Id: <20250128194816.2185326-19-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxbVRjGc+69vfdSZd6WEU4AURsdkUVWCZrjZgi6Oe9kkLG4kJgIdHBX
 mKWQFpybRkv4EGonY6GZFBhY2fisndB2fMpkSDemdYMJiMDYHOFj3SiDkm1mVMpF3X/P+7y/
 c573PTk0LraQgXS6MptTKWUKCSkkbP0PHa8YI8vlUn1ZGLo0YsSQ9W8DhZq7HRiq7nMI0OSg
 BUPX3Qsk+n76KoVmu3MJNFxfRaG8fjOJ5gyTJFrUTQrQUEcliZaO9wFkW8onkalvgkJmdzWG
 vl20Eqi2rQOgwuKzAnRt4B00MXmJQHNDOhwVGp5Bnq42Cq0O/0Cgins9FLI4SwXIbkpA+T1l
 RHQIuzBaQLHOuTmCvVi0TLHdKzUE226YoFhd+y+AbWksJtnx4S6SPX05nr3xlR1jW2u/YPNN
 /Rhb8ljKLvz4O8l+bWkE7GDeCLVP/IHwzVROkf4xp9oWlSxMa/VMYVkzwk++y0vSgDu0FtA0
 ZCKh5qZEC4S0mKkHcEA3S/HFMoBV2mKSL5YAXNGXEFrgs37Cfm5ewDfqADyjsW9QTgBLmyvX
 KZKJgFN11evUZqaAgAU/5wJvgTMzANpuV5Jeyo+Jh+5qJ+adhGBegmNng7y2LxMNS1tLBHzc
 c7Dnp19xr/ZZ81se1xM8I4KXy2+va3yNybNW4DxvEkKXO5HXu2Cj8fTGPX5w3m6heB0MPe3V
 GK8z4ZT1/sbZz2C7zr6hd8BxxyPSOxrOvAzNHdt4+y34191WjH+7TXD0roifYBM8aTuF87Yv
 LCoU8/QWqNcd/y/UUW/bCGXhoCeXPAFeMDyxi+GJXQz/59YAvBEEcDnqDDmnjlByR8LVsgx1
 jlIenpKZ0QLWPvaVVftyG6ibXwzvBRgNegGkcclm3w8d38jFvqmyo8c4VWaSKkfBqXtBEE1I
 AnyNPQVyMSOXZXMfcVwWp/q3i9E+gRosI7jkS1ckXeIISWxuiqnzO5Clp5NvBk4PWbfqnQPv
 N9zYZb/oeu9RXIw5Fo90hV4Y2psymrJVmy/d4fx8xWN7mDKe1FmzpDGf3zc/diRmzy37ikNU
 tHO8Qvrg6tMXnFX3T/52KGX/dmnT6xEW9cxhSdinz1aEbG9QnDrW9G5CnH+qCY53US216rnV
 O2PlQZ5DV/yvR6/8EW/O14nSog4qY3d3vtig1xgdBTMJwScOu/zzcqzDlQE1B4LLotNvZTu6
 joadUSQO7S27Nli2ADtytLPGN5Zj7zG7G3ZqXnM/H1fxdub5c1GhyaLYxpHQXsVTDX8agTvQ
 FJSgjDrYKZ1+gPVJCHWa7NUwXKWW/QN5kRGYRwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xu7oLTWamG1yaKWFx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEvY/P/B0wFz7kqFjfHNzC+5uhi5OSQEDCROL7hFWsXIxeHkMBSRon5m++y
 QiRkJK51v2SBsIUl/lzrYoMoesUo8fbGFnaQBJuAkcSD5fPBGkQEFrNI7N1XCVLELPCWUeL6
 zI1g3cIC/hKPzyxj6mLk4GARUJW4tUwaJMwr4CAxcXM/1DJ5if0HzzKD2JxA8U1/V4C1CgnY
 Szx6O4MNol5Q4uTMJ2BxZqD65q2zmScwCsxCkpqFJLWAkWkVo0hqaXFuem6xoV5xYm5xaV66
 XnJ+7iZGYHLZduzn5h2M81591DvEyMTBeIhRgoNZSYQ39tyMdCHelMTKqtSi/Pii0pzU4kOM
 pkBnT2SWEk3OB6a3vJJ4QzMDU0MTM0sDU0szYyVxXrfL59OEBNITS1KzU1MLUotg+pg4OKUa
 mHYc7fJ+IbxXSjL07v1FwZOer4pNyj9tF/f/+/7XvonJB79P1QsT3+Uzubon+e0cBecJ7ZM2
 bL/R9EXogbblLsktazpjeiUt0zmmHJ4Ylff4ZHHdqv/O8qk3fSouB/UxeAV4cxoZL7cOZ49b
 zlda/+VUe9bq9osRqxQ3FO+KFE2dH6Z72qf9aIPNfvf79xYss9qkr/Nob8eS7vI3DPqa78X5
 6gNmvfPcu/m7aX/w4cVxUT87BFWPaf6seVhVd3rC5Qbzv+tUdZOr+LZWzONUXy65eKny16O3
 hD/UtW7yE3Y/tKPL4OTOlcbbWErVl31KLWnn3RfMfjk62qvz0qZjat5C7+alOclu+Wm+WH2C
 kxJLcUaioRZzUXEiAHobLJy3AwAA
X-CMS-MailID: 20250128194849eucas1p1c957dedd293b3091d8dfb35bdfa1fb0c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194849eucas1p1c957dedd293b3091d8dfb35bdfa1fb0c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194849eucas1p1c957dedd293b3091d8dfb35bdfa1fb0c
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194849eucas1p1c957dedd293b3091d8dfb35bdfa1fb0c@eucas1p1.samsung.com>
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

Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
the GPU using the drm/imagination driver.

By adding this node, the kernel can recognize and initialize the GPU,
providing graphics acceleration capabilities on the Lichee Pi 4A and
other boards based on the TH1520 SoC.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index bdbb1b985b0b..b4b3add0d98d 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -498,6 +498,18 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@ffef400000 {
+			compatible = "thead,th1520-gpu", "img,img-bxm";
+			reg = <0xff 0xef400000 0x0 0x100000>;
+			interrupt-parent = <&plic>;
+			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_vo CLK_GPU_CORE>,
+				 <&clk_vo CLK_GPU_CFG_ACLK>;
+			clock-names = "core", "mem";
+			power-domains = <&aon TH1520_GPU_PD>;
+			resets = <&rst TH1520_RESET_ID_GPU>;
+		};
+
 		rst: reset-controller@ffef528000 {
 			compatible = "thead,th1520-reset";
 			reg = <0xff 0xef528000 0x0 0x4f>;
-- 
2.34.1

