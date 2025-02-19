Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE5A3C10F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458410E805;
	Wed, 19 Feb 2025 14:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="j7C+9GRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3052E10E490
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140303euoutp027f2874eda645b0ebdcc413da2ec262ab~loPAPBafQ0177801778euoutp02W
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250219140303euoutp027f2874eda645b0ebdcc413da2ec262ab~loPAPBafQ0177801778euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973783;
 bh=2RTzJ2qIW6QHJ1xVf28+dD25ff+FzN3lcglLvG7tFCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j7C+9GRcUaURx+kyhyVbVE7IaaO6u9hccoWEvK99QURrZ5hwkctZqQBn2kX+wJan0
 6xpYtTBPJKJvraNCKvMiSeVGBcA0HGA4Kyk7RM2qkcLrqAKisEpuSictoVTDJ/0CHF
 XboCU8TCR3apzAE7H/Tqmo6Yt4y2XSvQDs8Ko+RA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140303eucas1p18de16fe959d9018a588e69a2c8cb6778~loO-tViKe1847718477eucas1p1f;
 Wed, 19 Feb 2025 14:03:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AC.01.20409.794E5B76; Wed, 19
 Feb 2025 14:03:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140302eucas1p24d9900e424b31661217e3c9182105b3a~loO-PNa542656126561eucas1p22;
 Wed, 19 Feb 2025 14:03:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140302eusmtrp175c9fe4248d58e42f86e1f93a19d0741~loO-OadkE2395223952eusmtrp1V;
 Wed, 19 Feb 2025 14:03:02 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-12-67b5e497c90b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C5.86.19920.694E5B76; Wed, 19
 Feb 2025 14:03:02 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140301eusmtip2639420979e5385099dffb8762ed346a7~loO93-NCx0084500845eusmtip2m;
 Wed, 19 Feb 2025 14:03:01 +0000 (GMT)
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
Subject: [PATCH v5 10/21] clk: thead: Add GPU clock gate control with CLKGEN
 reset support
Date: Wed, 19 Feb 2025 15:02:28 +0100
Message-Id: <20250219140239.1378758-11-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGd3q/CqTsUtw4onGRBN2MgDBDzjK3SbKZG80SN5ewETNp9FoQ
 aF0rjs1uYmhrxSrOIWhxgg0KgXUMbGvpgGpBWsdHoCACo4y5ipSgXceHGQRcy8XN/37nOc9z
 nvdNDh8TmshofqbkCCuTiLJjyFDc3P5Pd1ypxyTe8nggEjnv63nItKCj0I/N3TxU3tZNoFGX
 kYf6Z30k+ulhD4Ummk/gaKD6BwoVtNeRyKsbJZFfO0qgPutlEk2faQPIPK0kkaHNTaG62XIe
 uuo34ajSYgVIfeo6gXp//QC5R5048vZpMaTWvYyeNVkotDRQj6OyJzYKGae+I5DDkIqUtmJ8
 +zrGN6iimCmvF2daNTMU0zxXgTONOjfFaBs7AdNQc4pkRgaaSObK3Y+Y3087eMyNyuOM0tDO
 Y4oWtzC+lnskc9ZYAxhXwX1qtzAtdNsBNjvzKCtLeDc9NKO100AcXojLW9LMgnzg3FAIQviQ
 3grHa+uwQhDKF9LVAJq9ZQR3mAGw4akeBF1CehrA+adZzxPGpVuAM1UBOGUykpxpKmCaiwoy
 SSfBsary5ZdW0Socqu6cWE5g9KNAh+fyciKS3gtPuheJION0LLxpzl9mAb0d3lNNUFzda9B2
 uyswIJ8fEtBbeqM5SwS8e8mDBxkLWApMZcs7QLo+FE60tvC47Puwoqie4DgSTjqMK2+uhR3f
 a3GOpXDM9DfGsQI2ah0r/DYc6Z4ng70Y/QassyZwcgpcaCwkgjKkw+Hg4whuhHB43lyKcbIA
 atRCzr0BXtCe+a+0u9q8MhgDW2oniXNgve6FZXQvLKP7v7cCYDUgis2V54hZeZKE/TJeLsqR
 50rE8fulOQ0g8LM7lhwzFlA16Y+3Ax4f2AHkYzGrBOrjRrFQcED01desTLpPlpvNyu1gDR+P
 iRLobSqxkBaLjrBZLHuYlT2/5fFDovN5JS1yc+p6f+Z47J8bLZHUUI/PfX413VV11LaxK++9
 4QyZZy7us7jRsAfDHmeh3R72cX7ZwWu7r49bxXmKHdJDJTmJ+ji2b7NksCw+MeVm2poPT1q+
 KNpzsOPQxTfTS7/Z9On+NFfS0Ot0YoXs6hNS/4s/8Zg61sY661POFWuKOl+NuvJzrcL01x/9
 tEU554m4Fn/WtOvh5J0h1859zb85xxJ6Kp5d6Iw9nTyv7VV80it1EbtGwtfmPkpbutj0TnJ/
 MjmUB7qUL13KCnM98I1LFFv7kPnziP7YSmtqanRJQX6mf7NAcmyPUgNvrEuv3Fu42r2tuHl+
 563bwh2vaL99a3jREIPLM0SJmzCZXPQv9gOajUgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7rTnmxNN2jep29x4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEv4/CZtawFv3Ur/nV8ZWxgPKHWxcjJISFgIrHl3wHGLkYuDiGBpYwSZy7P
 Z4ZIyEhc637JAmELS/y51sUGUfSKUWLzoU5WkASbgJHEg+XzwWwRgcUsEnv3VYIUMQu8ZZS4
 PnMjWLewQJTE9zfbGEFsFgFVie3bGsAaeAUcJK62vmCH2CAvsf/gWaDNHBycQPF9F6VAwkIC
 9hLn+u5DlQtKnJz5BGwkM1B589bZzBMYBWYhSc1CklrAyLSKUSS1tDg3PbfYUK84Mbe4NC9d
 Lzk/dxMjML1sO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMLbVr8lXYg3JbGyKrUoP76oNCe1+BCj
 KdDZE5mlRJPzgQkuryTe0MzA1NDEzNLA1NLMWEmc1+3y+TQhgfTEktTs1NSC1CKYPiYOTqkG
 pnYFu5+Xdzmk3b2ZyxWQdO2hw8JO/nWhqzOPxhyP8+B+nLbi8ea/y/xVOrNuvqhJiPZLP3tx
 2+pVp+PONSooZkzZlil7Sc60XuVhGXOc/dmQ7b8VlF31Xv/Zobc3P/GL/hYf26kiSV9jv3Pn
 ZbyRmK4y/cvewm3v86sFJedzZ8XGfFrwtPEK572yf/ZKT8xTFU6cO5PUeWniA1bPRdGvQqzc
 Ck6ZKRxr0XJq8/Lb9fh9WM+HvLP6+vN4ZhqLnfLbuqJjlt43x/9vzM6+esbqwqjBf7F0Z/r2
 3Auzl0z7MUPG/uHRdqUpNYFzip9fu/az2FM96O6/S9sL5iRcCHy8MYLdYK566u/5R9ecXjsv
 ukqJpTgj0VCLuag4EQCLbw7buAMAAA==
X-CMS-MailID: 20250219140302eucas1p24d9900e424b31661217e3c9182105b3a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140302eucas1p24d9900e424b31661217e3c9182105b3a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140302eucas1p24d9900e424b31661217e3c9182105b3a
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140302eucas1p24d9900e424b31661217e3c9182105b3a@eucas1p2.samsung.com>
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

The T-HEAD TH1520 has three GPU clocks: core, cfg, and mem. The mem
clock gate is marked as "Reserved" in hardware, while core and cfg are
configurable. In order for these clock gates to work properly, the
CLKGEN reset must be managed in a specific sequence.

Move the CLKGEN reset handling to the clock driver since it's
fundamentally a clock-related workaround [1]. This ensures that clk_enabled
GPU clocks stay physically enabled without external interference from
the reset driver.  The reset is now deasserted only when both core and
cfg clocks are enabled, and asserted when either of them is disabled.

The mem clock is configured to use nop operations since it cannot be
controlled.

Link: https://lore.kernel.org/all/945fb7e913a9c3dcb40697328b7e9842b75fea5c.camel@pengutronix.de [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 87 ++++++++++++++++++++++++++++---
 1 file changed, 81 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ea96d007aecd..1dfcde867233 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 
 #define TH1520_PLL_POSTDIV2	GENMASK(26, 24)
 #define TH1520_PLL_POSTDIV1	GENMASK(22, 20)
@@ -862,17 +863,70 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
 static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
 static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
 
+static struct reset_control *gpu_reset;
+static DEFINE_SPINLOCK(gpu_reset_lock); /* protect GPU reset sequence */
+
+static void ccu_gpu_clk_disable(struct clk_hw *hw);
+static int ccu_gpu_clk_enable(struct clk_hw *hw);
+
+static const struct clk_ops ccu_gate_gpu_ops = {
+	.disable	= ccu_gpu_clk_disable,
+	.enable		= ccu_gpu_clk_enable
+};
+
 static const struct clk_ops clk_nop_ops = {};
 
 static CCU_GATE_CLK_OPS(CLK_GPU_MEM, gpu_mem_clk, "gpu-mem-clk",
 			video_pll_clk_pd, 0x0, BIT(2), 0, clk_nop_ops);
+static CCU_GATE_CLK_OPS(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk",
+			video_pll_clk_pd, 0x0, BIT(3), 0, ccu_gate_gpu_ops);
+static CCU_GATE_CLK_OPS(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
+			video_pll_clk_pd, 0x0, BIT(4), 0, ccu_gate_gpu_ops);
+
+static void ccu_gpu_clk_disable(struct clk_hw *hw)
+{
+	struct ccu_gate *cg = hw_to_ccu_gate(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpu_reset_lock, flags);
+
+	ccu_disable_helper(&cg->common, cg->enable);
+
+	if ((cg == &gpu_core_clk &&
+	     !clk_hw_is_enabled(&gpu_cfg_aclk.common.hw)) ||
+	    (cg == &gpu_cfg_aclk &&
+	     !clk_hw_is_enabled(&gpu_core_clk.common.hw)))
+		reset_control_assert(gpu_reset);
+
+	spin_unlock_irqrestore(&gpu_reset_lock, flags);
+}
+
+static int ccu_gpu_clk_enable(struct clk_hw *hw)
+{
+	struct ccu_gate *cg = hw_to_ccu_gate(hw);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&gpu_reset_lock, flags);
+
+	ret = ccu_enable_helper(&cg->common, cg->enable);
+	if (ret) {
+		spin_unlock_irqrestore(&gpu_reset_lock, flags);
+		return ret;
+	}
+
+	if ((cg == &gpu_core_clk &&
+	     clk_hw_is_enabled(&gpu_cfg_aclk.common.hw)) ||
+	    (cg == &gpu_cfg_aclk && clk_hw_is_enabled(&gpu_core_clk.common.hw)))
+		ret = reset_control_deassert(gpu_reset);
+
+	spin_unlock_irqrestore(&gpu_reset_lock, flags);
+
+	return ret;
+}
 
 static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
 		video_pll_clk_pd, 0x0, BIT(0), 0);
-static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
-		0x0, BIT(3), 0);
-static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
-		video_pll_clk_pd, 0x0, BIT(4), 0);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
 		video_pll_clk_pd, 0x0, BIT(5), 0);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
@@ -1046,8 +1100,6 @@ static struct ccu_common *th1520_gate_clks[] = {
 
 static struct ccu_common *th1520_vo_gate_clks[] = {
 	&axi4_vo_aclk.common,
-	&gpu_core_clk.common,
-	&gpu_cfg_aclk.common,
 	&dpu0_pixelclk.common,
 	&dpu1_pixelclk.common,
 	&dpu_hclk.common,
@@ -1150,6 +1202,13 @@ static int th1520_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
+	if (plat_data == &th1520_vo_platdata) {
+		gpu_reset = devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(gpu_reset))
+			return dev_err_probe(dev, PTR_ERR(gpu_reset),
+					     "GPU reset is required for VO clock controller\n");
+	}
+
 	for (i = 0; i < plat_data->nr_pll_clks; i++) {
 		struct ccu_pll *cp = hw_to_ccu_pll(&plat_data->th1520_pll_clks[i]->hw);
 
@@ -1226,11 +1285,27 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	} else if (plat_data == &th1520_vo_platdata) {
+		/* GPU clocks need to be treated differently, as MEM clock
+		 * is non-configurable, and the reset needs to be de-asserted
+		 * after enabling CORE and CFG clocks.
+		 */
 		ret = devm_clk_hw_register(dev, &gpu_mem_clk.common.hw);
 		if (ret)
 			return ret;
 		gpu_mem_clk.common.map = map;
 		priv->hws[CLK_GPU_MEM] = &gpu_mem_clk.common.hw;
+
+		ret = devm_clk_hw_register(dev, &gpu_core_clk.common.hw);
+		if (ret)
+			return ret;
+		gpu_core_clk.common.map = map;
+		priv->hws[CLK_GPU_CORE] = &gpu_core_clk.common.hw;
+
+		ret = devm_clk_hw_register(dev, &gpu_cfg_aclk.common.hw);
+		if (ret)
+			return ret;
+		gpu_cfg_aclk.common.map = map;
+		priv->hws[CLK_GPU_CFG_ACLK] = &gpu_cfg_aclk.common.hw;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
-- 
2.34.1

