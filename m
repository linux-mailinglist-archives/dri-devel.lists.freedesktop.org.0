Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A835FA21262
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6D010E6F7;
	Tue, 28 Jan 2025 19:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="aBYe0YSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DDB10E6F6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194830euoutp0235fda319d60e877f8e292b858a288484~e8wU9LBtU0761907619euoutp02D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194830euoutp0235fda319d60e877f8e292b858a288484~e8wU9LBtU0761907619euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093710;
 bh=wuhyuqSqo6HVIvqyUq2c5/LF8oCKIYFSYyPVyjnS8rI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aBYe0YSqdY6ZUwOeFx71GCb1C03rn/9a8Au2a/CzgTmHvq0H4Wwa+9I9IruYeRmhf
 UaB2NV6GSXWHo4gdirtQKyh87d6uGMp4hrROFzecfkLkbkMbdasroh8J/9kxBC6L0H
 eeS2CotlwNOU4N6/2hhtB6OgissxRV9Y50TGM/hs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194828eucas1p16f6db58a3aad64fd828ed674245d0edf~e8wT6XUQh1987819878eucas1p1g;
 Tue, 28 Jan 2025 19:48:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 04.A2.20397.C8439976; Tue, 28
 Jan 2025 19:48:28 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250128194827eucas1p25db822456e223563b8b411f77754c760~e8wS0WXeY2286822868eucas1p2D;
 Tue, 28 Jan 2025 19:48:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194827eusmtrp2fa8a7dd8db73e1d7aa3cd3476609e775~e8wSzfD833008430084eusmtrp2U;
 Tue, 28 Jan 2025 19:48:27 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-ca-6799348cae46
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 20.E0.19920.B8439976; Tue, 28
 Jan 2025 19:48:27 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194826eusmtip1e3aeec7153dc209e425cb81b17f4a530~e8wRg5Wgq0291602916eusmtip1Y;
 Tue, 28 Jan 2025 19:48:26 +0000 (GMT)
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
Subject: [PATCH v4 02/18] clk: thead: Add clock support for VO subsystem in
 T-Head TH1520 SoC
Date: Tue, 28 Jan 2025 20:48:00 +0100
Message-Id: <20250128194816.2185326-3-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzNfe/1vdfG6qPivNpmi2Rzjo2PTTfuZJm4KXnGGTHTycw218hL
 IQI1LagTyGC0BFhB0KlYFKQhtTI6vtryIQzBQpFpt1FEDaXDydz4GA0CylBwwMPN/875/c65
 5/ySS+MSG7majolP4FTx8lg/UkTY2v/5OUC34awi+GRBEOq4ZcCQ9bGeQuVNTgwV250C5Omy
 YKh70kuiH/74hUJ/NaURqMd0nkLp7RUkGtR7SDSm8wiQq+EcicZz7ADZxjUkMtv7KFQxWYyh
 kjErgUrrGgDKyDIK0K+dW1Gfp4NAgy4djjL0y9DTxjoKzfZUEahwtJlClpF8AXKY9yJN83dE
 2Ius97aWYkcGBwn2auYExTY9vECw9fo+itXVXwdsdVkWybp7Gkm26Nou9rdvHRhbU/o1qzG3
 Y+zxmWDW++NNks21lAG2K/0WFSHZJ3oviouNOcypgt7/UhT95LRWcGg08qhlogakgu7t2UBI
 Q2YDHO3qBNlAREsYE4DTmiyMJxMAXu09KeDJOICulibBM4vR1kLyi4sAXtK24TwZAfB6qoaa
 V5HMW7D/YvGC3ZfRElDblraQgjN/AmgbODfnp+nlzH5Y7lk1byCYV2DalT4wj8XMJng500jx
 cS/B5pYb+DwWMmGwesZE8BofeO3swALG5zTp1kKc11eJoHdQxuMtsH36xmLt5XDIYVl8Uwaf
 1hdjPFbCfuuDRW8yrNc5FnEodDunF2rizGuwoiGIH2+G/efbqPkxZJbC23/78A2WwhO2Mzg/
 FsPMDAmvXgtP6XL+C3WabIuhLDzz6AqeB9bon7tF/9wt+v9zLwC8DKzkEtVxCk69Pp47EqiW
 x6kT4xWBB5Rx1WDua/8065isA6ahscBWgNGgFUAa9/MVf+4sUEjEUfKvjnEq5X5VYiynbgVS
 mvBbKTY0axUSRiFP4A5y3CFO9WyL0cLVqViJueUTpA1wqn3CfPfticj/vdBfn5y8Ne/I66XK
 +2sue4KCU0zpGmW3wDZr3TlDC4uScrZUln+6ojTqhSzLh++GTPRu+ua4dJug/+Abu0o+9v1+
 dwcrDZAdiNxe+86qgf6wmPu5YdOOj5KyZEOR7hBn7+nQtSu6l9UG3cwviEj/IuVx6bon0pcP
 10Q7T+U+JKM7h/eOjtgNWt3de8Pr7xm8yinv27P+9nVoanPKXTpUBg0usnVamhLesKNmT4L5
 TuBnD9qPFTcKvUvyuVcduyVH82r9NZOVXe5LrqmNEX0fPPIPD6+3mUMqi6qHa1XZxjvZ8duM
 ZretSjPqMUYtQaKNSX6EOlr+pj+uUsv/BeRC2DNJBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7rdJjPTDdrfqVmcuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DL+DOtlbXgXUTFli+bGRsYr3h3MXJySAiYSCzbdpCti5GLQ0hgKaPEwp8f
 2CASMhLXul+yQNjCEn+udYHFhQReMUpsuJsJYrMJGEk8WD6fFcQWEVjMIrF3XyXIIGaBt4wS
 12duBGsWFoiVWH9nDzOIzSKgKtF44C4jiM0rYC+xu2MZO8QCeYn9B8+C1XAKOEhs+ruCBWKZ
 vcSjtzPYIOoFJU7OfAIWZwaqb946m3kCo8AsJKlZSFILGJlWMYqklhbnpucWG+oVJ+YWl+al
 6yXn525iBKaXbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4Y8/NSBfiTUmsrEotyo8vKs1JLT7E
 aAp090RmKdHkfGCCyyuJNzQzMDU0MbM0MLU0M1YS53W7fD5NSCA9sSQ1OzW1ILUIpo+Jg1Oq
 gcnsT+ak6H1vGW/d9TyYfcDD5AP/Ct/Cz2mHkvcFPSoJsxSb+lSm/6lw4BOpw18k7m47tPmM
 zXnj/+26EQv6XcrfXXLZvTBp/2zGt5Mu9x5JOxu+5lT81Sb+ls6AbTvvJN1r+FH6XOnz5ftO
 Da2ek11zdyjuK76rH9+SbFzVbfZjmXadwd36fXU9iixS8XaHftj89z5cKhJu/kdx3aUwSw05
 g8h7cysfNp9SYNZqu7Njld/WRDEFhwYj5ZN7hU9yVF9wffvmaTtvzKMPD8um7/svkMht8KJH
 4mziv1lPA8ymrLjz4/6vyZwvODhuHpw0MUXms6xRftJSVi5tViEj0w9VbgwiSx/+i8hX8oo8
 7a3EUpyRaKjFXFScCADkG4BQuAMAAA==
X-CMS-MailID: 20250128194827eucas1p25db822456e223563b8b411f77754c760
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194827eucas1p25db822456e223563b8b411f77754c760
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194827eucas1p25db822456e223563b8b411f77754c760
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194827eucas1p25db822456e223563b8b411f77754c760@eucas1p2.samsung.com>
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

