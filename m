Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3448A3C105
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5952B10E2FF;
	Wed, 19 Feb 2025 14:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Dfh2Vi0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B6910E308
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:54 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140252euoutp02e4a9debbe9bb1d971e5392d8ee15a0d5~loO14ZFz-0180401804euoutp02D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250219140252euoutp02e4a9debbe9bb1d971e5392d8ee15a0d5~loO14ZFz-0180401804euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973772;
 bh=wuhyuqSqo6HVIvqyUq2c5/LF8oCKIYFSYyPVyjnS8rI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dfh2Vi0kts6Ljn7EWbbEJF2WNxpA2pAlIQ3TB1XwJhGxNDeQKOfylYKUKNiAq/QLA
 8EmN6rktYn9u4vVP3WjHXysFLZcm/s1BtBK3H81HHPWKLe7xiwwz0EUOF+G5JKvtJJ
 wJaj18Bm2unTG6eUJfbUfSBcfhrCFwqBThU91seg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140252eucas1p165cad7c5ce817dfc50c484c151522008~loO1rX9yB1847218472eucas1p1S;
 Wed, 19 Feb 2025 14:02:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 0B.72.20397.C84E5B76; Wed, 19
 Feb 2025 14:02:52 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250219140252eucas1p10c718f8e337ab3bf35f4debc56f13f86~loO1SLnU11050110501eucas1p1v;
 Wed, 19 Feb 2025 14:02:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140252eusmtrp1472fd429c0acc2d57645bb5829517c36~loO1NJyhr2395223952eusmtrp1F;
 Wed, 19 Feb 2025 14:02:52 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-bb-67b5e48ce5e6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 37.42.19654.B84E5B76; Wed, 19
 Feb 2025 14:02:51 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140250eusmtip2bbff6d3965dde4370f7fd095b33087f7~loOz7AM0r0084200842eusmtip2_;
 Wed, 19 Feb 2025 14:02:50 +0000 (GMT)
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
Subject: [PATCH v5 02/21] clk: thead: Add clock support for VO subsystem in
 T-Head TH1520 SoC
Date: Wed, 19 Feb 2025 15:02:20 +0100
Message-Id: <20250219140239.1378758-3-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH/T7Ps+cZ82YPg5Nv5A/iLiO7DUTqvmAXZGiPWV0W1w+6oqlP
 E/nZNgw9L9BtxHCYkmQ9SBA3Y3HiArYF07kEZMjPAEG7Y0Q2T/ntBLxLBHM8WP73/ny+r/fn
 /fncfYW4xEoGC5PT1awyXZ4aSooIW8s/3VKDx6qIcLSGoNarFRiyznEUOuPowlBZc5cADfVa
 MHRldopEZ2/8TqFbjkMEGjCVUkjTYibRCDdEIq9hSID67KdINF3YDJBtWkui6mY3hcyzZRj6
 0WslkLHeDlCe/icB6mnbgtxDrQQa6TPgKI97Aj04X0+hhYEaApVMOilkGT8uQK7q95HWeYKI
 W8NMXdNRzPjICME05c9QjONuOcE0cG6KMTR0AKa2Sk8ygwPnSeaHyzuYP4+4MKbOmMNoq1sw
 5uv5CGbqQj/JHLVUAaZXc5V6W5Ioemk3m5q8j1WGv/ypaM/9b3WCzMkPsi0zdSAXXNleAPyE
 kI6CJ4ynqQIgEkpoE4C/zXcK+GIGwI65BeCjJPQ0gAa3+pGjsU5H8FAlgFzuJOCLcQCPV97H
 fBRJR8LhyrLFUYG0joC6S4cWKZy+CaDNc4osAEJhAJ0EL7Uf9BkI+hn4lbmb8mkxHQvHGiYI
 Pm4tdF7sxH24Hx0HL/QE84g/vPy9ZxHBHyIaawnuGw/pn0WwqeYuznvj4R+to4DXAXDUZaF4
 vQq2f2NYmp8Bh613lviDsMHgWtKb4GDXvcU1cfo5aLaH8+1XoFGjJ3xtSK+A1yb8+RVWwCLb
 SZxvi2F+noSn18FiQ+F/oV0mG8ZrBhb97SCPgae5x47hHjuG+z+3HOBVIIjNUqUpWNXGdPYL
 mUqepspKV8h2ZaTVgoc/u33BNVsPTKNeWSPAhKARQCEeGijOy7EoJOLd8v0HWGVGkjIrlVU1
 gqeERGiQuMKpU0hohVzNprBsJqt89IoJ/YJzsWUJ1prasm68c4csbK1eKnnz8Ce38ks2e+3r
 5/1vR70mHV75WWJ+Us/CaXXBztWuaObD/XNVJaKJlI9Kt8VjTYWfB8Xal8evi3927+SvxRHa
 6/mq4vDkk8t7mbqcO0XnNjT9YrLG9btkUR2eYnRb6r7nfW/serS5Jgn9tVk77z26Zd+R1d8R
 znrMGLv1hW2GmDE6LCjS+2TppsEHq/pDjC+eMySHD5v0KZo15TshzD4m5hL2Npg+DkwGnBPI
 1Mab5nfexS0Js89n1En7siM1Z1+NDhHVS+kKfHvm6xu/jDlwOCDkrTMdlotjzZ5ZV8wbW6Vx
 hStvKMP8GxM527K24V1toYRqj3zDelypkv8Lh2yP9kgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7rdT7amG9xptbE4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX8WdaK2vBu4iKLV82MzYwXvHuYuTkkBAwkTi0uZWli5GLQ0hgKaPEmqfL
 2SESMhLXul+yQNjCEn+udbFBFL1ilFi9ZidYEZuAkcSD5fNZQWwRgcUsEnv3VYIUMQu8ZZS4
 PnMjUDcHh7BArMSKFrBBLAKqEu3rz4P18grYS7ze+RZqgbzE/oNnmUHKOQUcJPZdlAIJCwGV
 nOu7zwpRLihxcuYTsHJmoPLmrbOZJzAKzEKSmoUktYCRaRWjSGppcW56brGRXnFibnFpXrpe
 cn7uJkZgctl27OeWHYwrX33UO8TIxMF4iFGCg1lJhLetfku6EG9KYmVValF+fFFpTmrxIUZT
 oLMnMkuJJucD01teSbyhmYGpoYmZpYGppZmxkjgv25XzaUIC6YklqdmpqQWpRTB9TBycUg1M
 oVLXjZv6+ZcL/ZETP7Y/uyDwfonMS4Zsftl09bmLL2sevKbEK1QttmHvGpvMeZ0NfC9v/57j
 Y57Ifvr/iq6j/y5b7ym/EtcidcacYbJ2QtmnV12Tnz0/nhbP2rzuttql6dvzO48zz2c5r1lh
 be1qVCfCmCSex9LUKGiauD9coWoRA8NjXm7t3KPpWc8WFAQ6/mcXc1zy8NNb28X+Mvr2R54e
 W7Ipwtfal5t1QZ70sujnVruDKtbn2bs7935fdYwtzuHN2+kbHy49mS32NiDjsRsXw9vHX37f
 0V7qoZbTMl2DtY5r6pajLNK6DM4Gyf26camRVTppN7m66mx27j940/565YGY0oCsi/tkc5RY
 ijMSDbWYi4oTAdIEmCC3AwAA
X-CMS-MailID: 20250219140252eucas1p10c718f8e337ab3bf35f4debc56f13f86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140252eucas1p10c718f8e337ab3bf35f4debc56f13f86
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140252eucas1p10c718f8e337ab3bf35f4debc56f13f86
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140252eucas1p10c718f8e337ab3bf35f4debc56f13f86@eucas1p1.samsung.com>
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

The T-Head TH1520 SoC integrates a variety of clocks for its subsystems,
including the Application Processor (AP) and the Video Output (VO) [1].
Up until now, the T-Head clock driver only supported AP clocks.

This commit extends the driver to provide clock functionality for the VO
subsystem. At this stage, the focus is on implementing the VO clock
gates, as these are currently the most relevant and required components
for enabling and disabling the VO subsystem functionality.  Future
enhancements may introduce additional VO-related clocks as necessary.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 197 +++++++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 4c9555fc6184..57972589f120 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
 static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
 static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
 
+static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
+		video_pll_clk_pd, 0x0, BIT(0), 0);
+static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
+		0x0, BIT(3), 0);
+static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
+		video_pll_clk_pd, 0x0, BIT(4), 0);
+static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
+		video_pll_clk_pd, 0x0, BIT(5), 0);
+static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
+		video_pll_clk_pd, 0x0, BIT(6), 0);
+static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
+		BIT(7), 0);
+static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
+		BIT(8), 0);
+static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, 0x0,
+		BIT(9), 0);
+static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_clk_pd,
+		0x0, BIT(10), 0);
+static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_pd, 0x0,
+		BIT(11), 0);
+static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_clk_pd,
+		0x0, BIT(12), 0);
+static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
+		video_pll_clk_pd, 0x0, BIT(13), 0);
+static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
+		video_pll_clk_pd, 0x0, BIT(14), 0);
+static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-clk",
+		video_pll_clk_pd, 0x0, BIT(15), 0);
+static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-clk",
+		video_pll_clk_pd, 0x0, BIT(16), 0);
+static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-refclk",
+		video_pll_clk_pd, 0x0, BIT(17), 0);
+static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
+		video_pll_clk_pd, 0x0, BIT(18), 0);
+static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
+		0x0, BIT(19), 0);
+static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
+		video_pll_clk_pd, 0x0, BIT(20), 0);
+static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
+		video_pll_clk_pd, 0x0, BIT(21), 0);
+static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
+		video_pll_clk_pd, 0x0, BIT(22), 0);
+static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
+		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
+static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
+		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
+static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
+		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
+static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
+		video_pll_clk_pd, 0x0, BIT(27), 0);
+static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
+		video_pll_clk_pd, 0x0, BIT(28), 0);
+static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
+		video_pll_clk_pd, 0x0, BIT(29), 0);
+static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
+		video_pll_clk_pd, 0x0, BIT(30), 0);
+static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
+		video_pll_clk_pd, 0x0, BIT(31), 0);
+static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
+		0x4, BIT(0), 0);
+
 static CLK_FIXED_FACTOR_HW(gmac_pll_clk_100m, "gmac-pll-clk-100m",
 			   &gmac_pll_clk.common.hw, 10, 1, 0);
 
@@ -963,7 +1024,38 @@ static struct ccu_common *th1520_gate_clks[] = {
 	&sram3_clk.common,
 };
 
-#define NR_CLKS	(CLK_UART_SCLK + 1)
+static struct ccu_common *th1520_vo_gate_clks[] = {
+	&axi4_vo_aclk.common,
+	&gpu_core_clk.common,
+	&gpu_cfg_aclk.common,
+	&dpu0_pixelclk.common,
+	&dpu1_pixelclk.common,
+	&dpu_hclk.common,
+	&dpu_aclk.common,
+	&dpu_cclk.common,
+	&hdmi_sfr_clk.common,
+	&hdmi_pclk.common,
+	&hdmi_cec_clk.common,
+	&mipi_dsi0_pclk.common,
+	&mipi_dsi1_pclk.common,
+	&mipi_dsi0_cfg_clk.common,
+	&mipi_dsi1_cfg_clk.common,
+	&mipi_dsi0_refclk.common,
+	&mipi_dsi1_refclk.common,
+	&hdmi_i2s_clk.common,
+	&x2h_dpu1_aclk.common,
+	&x2h_dpu_aclk.common,
+	&axi4_vo_pclk.common,
+	&iopmp_vosys_dpu_pclk.common,
+	&iopmp_vosys_dpu1_pclk.common,
+	&iopmp_vosys_gpu_pclk.common,
+	&iopmp_dpu1_aclk.common,
+	&iopmp_dpu_aclk.common,
+	&iopmp_gpu_aclk.common,
+	&mipi_dsi0_pixclk.common,
+	&mipi_dsi1_pixclk.common,
+	&hdmi_pixclk.common
+};
 
 static const struct regmap_config th1520_clk_regmap_config = {
 	.reg_bits = 32,
@@ -972,8 +1064,44 @@ static const struct regmap_config th1520_clk_regmap_config = {
 	.fast_io = true,
 };
 
+struct th1520_plat_data {
+	struct ccu_common **th1520_pll_clks;
+	struct ccu_common **th1520_div_clks;
+	struct ccu_common **th1520_mux_clks;
+	struct ccu_common **th1520_gate_clks;
+
+	int nr_clks;
+	int nr_pll_clks;
+	int nr_div_clks;
+	int nr_mux_clks;
+	int nr_gate_clks;
+};
+
+static const struct th1520_plat_data th1520_ap_platdata = {
+	.th1520_pll_clks = th1520_pll_clks,
+	.th1520_div_clks = th1520_div_clks,
+	.th1520_mux_clks = th1520_mux_clks,
+	.th1520_gate_clks = th1520_gate_clks,
+
+	.nr_clks = CLK_UART_SCLK + 1,
+
+	.nr_pll_clks = ARRAY_SIZE(th1520_pll_clks),
+	.nr_div_clks = ARRAY_SIZE(th1520_div_clks),
+	.nr_mux_clks = ARRAY_SIZE(th1520_mux_clks),
+	.nr_gate_clks = ARRAY_SIZE(th1520_gate_clks),
+};
+
+static const struct th1520_plat_data th1520_vo_platdata = {
+	.th1520_gate_clks = th1520_vo_gate_clks,
+
+	.nr_clks = CLK_HDMI_PIXCLK + 1,
+
+	.nr_gate_clks = ARRAY_SIZE(th1520_vo_gate_clks),
+};
+
 static int th1520_clk_probe(struct platform_device *pdev)
 {
+	const struct th1520_plat_data *plat_data;
 	struct device *dev = &pdev->dev;
 	struct clk_hw_onecell_data *priv;
 
@@ -982,11 +1110,17 @@ static int th1520_clk_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int ret, i;
 
-	priv = devm_kzalloc(dev, struct_size(priv, hws, NR_CLKS), GFP_KERNEL);
+	plat_data = device_get_match_data(&pdev->dev);
+	if (!plat_data) {
+		dev_err(&pdev->dev, "Error: No device match data found\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(dev, struct_size(priv, hws, plat_data->nr_clks), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->num = NR_CLKS;
+	priv->num = plat_data->nr_clks;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -996,35 +1130,35 @@ static int th1520_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-	for (i = 0; i < ARRAY_SIZE(th1520_pll_clks); i++) {
-		struct ccu_pll *cp = hw_to_ccu_pll(&th1520_pll_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_pll_clks; i++) {
+		struct ccu_pll *cp = hw_to_ccu_pll(&plat_data->th1520_pll_clks[i]->hw);
 
-		th1520_pll_clks[i]->map = map;
+		plat_data->th1520_pll_clks[i]->map = map;
 
-		ret = devm_clk_hw_register(dev, &th1520_pll_clks[i]->hw);
+		ret = devm_clk_hw_register(dev, &plat_data->th1520_pll_clks[i]->hw);
 		if (ret)
 			return ret;
 
 		priv->hws[cp->common.clkid] = &cp->common.hw;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(th1520_div_clks); i++) {
-		struct ccu_div *cd = hw_to_ccu_div(&th1520_div_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_div_clks; i++) {
+		struct ccu_div *cd = hw_to_ccu_div(&plat_data->th1520_div_clks[i]->hw);
 
-		th1520_div_clks[i]->map = map;
+		plat_data->th1520_div_clks[i]->map = map;
 
-		ret = devm_clk_hw_register(dev, &th1520_div_clks[i]->hw);
+		ret = devm_clk_hw_register(dev, &plat_data->th1520_div_clks[i]->hw);
 		if (ret)
 			return ret;
 
 		priv->hws[cd->common.clkid] = &cd->common.hw;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(th1520_mux_clks); i++) {
-		struct ccu_mux *cm = hw_to_ccu_mux(&th1520_mux_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_mux_clks; i++) {
+		struct ccu_mux *cm = hw_to_ccu_mux(&plat_data->th1520_mux_clks[i]->hw);
 		const struct clk_init_data *init = cm->common.hw.init;
 
-		th1520_mux_clks[i]->map = map;
+		plat_data->th1520_mux_clks[i]->map = map;
 		hw = devm_clk_hw_register_mux_parent_data_table(dev,
 								init->name,
 								init->parent_data,
@@ -1040,10 +1174,10 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		priv->hws[cm->common.clkid] = hw;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(th1520_gate_clks); i++) {
-		struct ccu_gate *cg = hw_to_ccu_gate(&th1520_gate_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_gate_clks; i++) {
+		struct ccu_gate *cg = hw_to_ccu_gate(&plat_data->th1520_gate_clks[i]->hw);
 
-		th1520_gate_clks[i]->map = map;
+		plat_data->th1520_gate_clks[i]->map = map;
 
 		hw = devm_clk_hw_register_gate_parent_data(dev,
 							   cg->common.hw.init->name,
@@ -1057,19 +1191,21 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		priv->hws[cg->common.clkid] = hw;
 	}
 
-	ret = devm_clk_hw_register(dev, &osc12m_clk.hw);
-	if (ret)
-		return ret;
-	priv->hws[CLK_OSC12M] = &osc12m_clk.hw;
+	if (plat_data == &th1520_ap_platdata) {
+		ret = devm_clk_hw_register(dev, &osc12m_clk.hw);
+		if (ret)
+			return ret;
+		priv->hws[CLK_OSC12M] = &osc12m_clk.hw;
 
-	ret = devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
-	if (ret)
-		return ret;
-	priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
+		ret = devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
+		if (ret)
+			return ret;
+		priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
 
-	ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
-	if (ret)
-		return ret;
+		ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
+		if (ret)
+			return ret;
+	}
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
 	if (ret)
@@ -1081,6 +1217,11 @@ static int th1520_clk_probe(struct platform_device *pdev)
 static const struct of_device_id th1520_clk_match[] = {
 	{
 		.compatible = "thead,th1520-clk-ap",
+		.data = &th1520_ap_platdata,
+	},
+	{
+		.compatible = "thead,th1520-clk-vo",
+		.data = &th1520_vo_platdata,
 	},
 	{ /* sentinel */ },
 };
-- 
2.34.1

