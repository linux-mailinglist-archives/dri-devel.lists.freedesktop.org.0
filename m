Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39EA88BCB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 20:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CBF10E28E;
	Mon, 14 Apr 2025 18:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Xd/z5zZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B32C10E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 18:53:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250414185318euoutp01adc66a7eefe862d8d5fb91a857a94e23~2RB1Qx38b1299112991euoutp01D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 18:53:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250414185318euoutp01adc66a7eefe862d8d5fb91a857a94e23~2RB1Qx38b1299112991euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744656798;
 bh=DQTOyLKAGRtuiD2jDe6tDcu2NLVXrqiPC95NFuwZmvo=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=Xd/z5zZwvv68Vzh13wdEK9KmOaReyVeT8/dNdrabUcTsyHj1cHLDrpeZO+IolFzOT
 g7/H3pMk3CpGXgLG2WHQIdYoAOpCzj2JZw76r6WyvZlmdVozmUBYYANWM5DQENfMOK
 jDrvI4dM7aIzv5z+i5wZdzeuGN9fLc0pm71WI2dc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250414185317eucas1p13d851746e90858801847e687c0dd7132~2RB0kUy4Z3082430824eucas1p1X;
 Mon, 14 Apr 2025 18:53:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4B.72.20397.D995DF76; Mon, 14
 Apr 2025 19:53:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288~2RBzbdZqR1774617746eucas1p21;
 Mon, 14 Apr 2025 18:53:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250414185316eusmtrp28a9d03d189e78edca36f5f681b6e8ed2~2RBzatcIN1486514865eusmtrp2g;
 Mon, 14 Apr 2025 18:53:16 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-3a-67fd599d5517
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 92.A9.19920.C995DF76; Mon, 14
 Apr 2025 19:53:16 +0100 (BST)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250414185315eusmtip21d91afa07f159a888a3bde5e07d3cd29~2RBySkJ-c2237122371eusmtip2t;
 Mon, 14 Apr 2025 18:53:15 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 14 Apr 2025 20:52:57 +0200
Subject: [PATCH v2 3/4] pmdomain: thead: Add GPU-specific clock and reset
 handling for TH1520
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-apr_14_for_sending-v2-3-70c5af2af96c@samsung.com>
In-Reply-To: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,  Danilo Krummrich
 <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,  Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei <wefu@redhat.com>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  m.szyprowski@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjeuff29rYL5FpdOGOGTZybYATULZxtQDAwuC5zm+7D6Q9dN+6K
 Gy2khX3IEGSMgCsULDCp1mKDKyLUDGjXolAlDeUrRTaFKbQzASNDKcUKmxhglls3/z3P8z7v
 eZ/3zaFwkZoMpQ7Kslm5TJwRTgoJc/eDwc3avYuSmBuXQlHPiB5DTR1ODN2p8ZJIZ3fykPu3
 NgxdnZshkfHWFT6a7DhCoL80bhL93n6SRL4yO0BmXxGJmu0uPjo/p8PQ6VkTgeot7QAVl/7M
 Qy53D4FKZgpwpL1fjaPlixY+OuGx8VHb3UoecjTvQUW2KiLxWaZjvo5grBoXn1FaBwDT0lhK
 MmPDF0nmVO8u5s8fHRjTWp/PFDV3Y4xqMYaZ6bxGMuVtjYBp7c9lfC1h7wXvE8alsRkHv2Ll
 0QmfCNM9yiUyqzLpG5/XjRUAY+xRIKAg/QrsGr5BHgVCSkQ3AHin0kZw5D6AHrsScMQH4Fin
 jv+4pcY4yeMKBgBHTF4+R4oxeHp4gvC7SHorvGnQPXJRFEFvgDVVm/zyavoAPFHmAn4cRK+C
 vbWcHaefh79On8Q5PRX2zdeT/lYBzUCrer//+TX0Qx4sKezG/QSntQB2mb8nuETPwIfq9pXc
 kC4XwiH7FMYVkmFJqSWAV8MpR1tghbVw2aoL6JnwpukezuHvoFXpCOA34JhzYSUFTkfA8+3R
 nLwd9vxydmUvSAfDP6ZXcfmD4THzTzgnB8GSYhHnfglWK8v+G+psMAeGMrDbreJVgHWaJy6h
 eeISmv/n1gG8EYSwOQqphFVsk7FfRynEUkWOTBL1Waa0BTz6t/1LjjkLaJiajeoCGAW6AKTw
 8DVBwqQFiSgoTfztIVaeeUCek8EqusBzFBEeEqS3/SAR0RJxNvsly2ax8sdVjBKEFmCm0rF3
 6lqf2l1UPeTYnehaWpuZsONa5HZvbHZDhf7IzlzVVelddd6pbU9XlibasTxL/OTmWq2q7+Mm
 1YBQt7BssCfFpOWljg++W2EZ33E8ZWdIYcrEB/lFfXn5Ubkzalv/F9dxw+KZcSdbHhbmfTXr
 9Rf+iZyYnRecub4lOcGo7P3w8kDS4T0JoxtHRp3khdwLEcAc7zr7ueBcrfbv1NvrCazq9tsG
 Z9X+5g1qqvCjw+rX0uGCJiXylpBn+lRwrzeent6kjR2J9vhYb9PQIHxwfGucvkW87+XOXfI4
 mBN75VzEqH7voYyYDtPc+xulNcnGFy/p+y6/tf7N+CinR7bOHhpOKNLFWyJxuUL8LzkWMrMm
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsVy+t/xe7pzIv+mG3RO5LE4cX0Rk8WaveeY
 LF5P+8BmMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYvJx1j83i8q45bBafe48wWmz73MJm
 sfbIXXaL9V/nM1ks/LiVxWLJjl2MFm2dy1gt7t47wWLR8b6B2WLul6nMFv/37GC3mP1uP7vF
 ljcTWS2Orw23aNk/hcVB0mPvtwUsHjtn3WX36Nl5htFj06pONo871/awecw7Gehxv/s4k8fm
 JfUeLWuPMXn0/zXweL/vKptH35ZVjB6bT1d7fN4kF8AXpWdTlF9akqqQkV9cYqsUbWhhpGdo
 aaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxrucfW8FE54rPH+4xNTCuM+9i5OSQEDCR
 mLbuBWsXIxeHkMBSRonDC1axQyRkJK51v2SBsIUl/lzrYoMoamGSmHN2BxtIgk3ASOLB8vlA
 3RwcLAKqEtOmaIOEhQXiJWb33mUEsXkFBCVOznzCAlLCLKApsX6XPkiYWUBeYvvbOcwQJe4S
 p74tAZsoBGRPW/CVDaScU8BDYufkOJCtIgJNbBLftn8GO4FZYB6jxKd5E6BuE5X4PXkXywRG
 wVlI1s1CWDcLyboFjMyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxApPItmM/N+9gnPfqo94h
 RiYOxkOMEhzMSiK8XM6/0oV4UxIrq1KL8uOLSnNSiw8xmgJ9PJFZSjQ5H5jG8kriDc0MTA1N
 zCwNTC3NjJXEed0un08TEkhPLEnNTk0tSC2C6WPi4JRqYFqcHlp33jOev1Ut78SLgrJDDvY7
 OFR5xK+dr8xMsDUpLygRTNAT3mUrrXGl5XnCpYc7SxbXf3cLnPTrrExCqcglpUmOLIZCO5Y3
 VRvcXG6+3/pH5q6UPvHkLPtwnv1xKQvjPSMWcpdsccn8MLXPnIVjX2nftbVi7ueqH4W+vXZQ
 K35HXsj9xVU7DQ6VRr29rBXysdFdp2S7cuk3rvNr3luHcSc9+++hk7m+T3PHnZ/3hVwznyrO
 WXy2y0f7yVc3xTnMITMOn2UQvNk9J6VJ4FlN7O0ktdjMvQ+K9i/XLqm9G7zau+DPl7zwbMf0
 o3ybfpz6sN0gY+vC//znluzNk1y/bv6PyfHX2apkpH4xKrEUZyQaajEXFScCAKmFtG+rAwAA
X-CMS-MailID: 20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <CGME20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288@eucas1p2.samsung.com>
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

Extend the TH1520 power domain driver to manage GPU related clocks and
resets via generic PM domain start/stop callbacks.

The TH1520 GPU requires a special sequence to correctly initialize:
- Enable the GPU clocks
- Deassert the GPU clkgen reset
- Delay for a few cycles to satisfy hardware requirements
- Deassert the GPU core reset

This sequence is SoC-specific and must be abstracted away from the
Imagination GPU driver, which expects only a standard single reset
interface. Following discussions with kernel maintainers [1], this
logic is placed inside a PM domain, rather than polluting the clock or
reset frameworks, or the GPU driver itself.

To support this, the TH1520 PM domain implements `attach_dev` and
`detach_dev` callbacks, allowing it to dynamically acquire clock and
reset resources from the GPU device tree node at runtime. This allows to
maintain the separation between generic drivers and SoC-specific
integration logic.

As a result, the PM domain not only handles power sequencing but also
effectively acts as the SoC specific "glue driver" for the GPU device,
encapsulating all TH1520-specific clock and reset management.

This approach improves maintainability and aligns with the broader
direction of treating PM domains as lightweight SoC-specific power
management drivers [2].

[1] - https://lore.kernel.org/all/CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com/
[2] - https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pmdomain/thead/th1520-pm-domains.c | 199 +++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
index f702e20306f469aeb0ed15e54bd4f8309f28018c..75412efb195eb534c2e8ff10ced65ed4c4d2452c 100644
--- a/drivers/pmdomain/thead/th1520-pm-domains.c
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -5,10 +5,13 @@
  * Author: Michal Wilczynski <m.wilczynski@samsung.com>
  */
 
+#include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/firmware/thead/thead,th1520-aon.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/reset.h>
 
 #include <dt-bindings/power/thead,th1520-power.h>
 
@@ -16,6 +19,15 @@ struct th1520_power_domain {
 	struct th1520_aon_chan *aon_chan;
 	struct generic_pm_domain genpd;
 	u32 rsrc;
+
+	/* PM-owned reset */
+	struct reset_control *clkgen_reset;
+
+	/* Device-specific resources */
+	struct device *attached_dev;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct reset_control *gpu_reset;
 };
 
 struct th1520_power_info {
@@ -61,6 +73,177 @@ static int th1520_pd_power_off(struct generic_pm_domain *domain)
 	return th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
 }
 
+static int th1520_gpu_init_consumer_clocks(struct device *dev,
+					   struct th1520_power_domain *pd)
+{
+	static const char *const clk_names[] = { "core", "sys" };
+	int i, ret;
+
+	pd->num_clks = ARRAY_SIZE(clk_names);
+	pd->clks = devm_kcalloc(dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
+	if (!pd->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < pd->num_clks; i++)
+		pd->clks[i].id = clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, pd->num_clks, pd->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get GPU clocks\n");
+
+	return 0;
+}
+
+static int th1520_gpu_init_consumer_reset(struct device *dev,
+					  struct th1520_power_domain *pd)
+{
+	int ret;
+
+	pd->gpu_reset = reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(pd->gpu_reset)) {
+		ret = PTR_ERR(pd->gpu_reset);
+		pd->gpu_reset = NULL;
+		return dev_err_probe(dev, ret, "Failed to get GPU reset\n");
+	}
+
+	return 0;
+}
+
+static int th1520_gpu_init_pm_reset(struct device *dev,
+				    struct th1520_power_domain *pd)
+{
+	pd->clkgen_reset = devm_reset_control_get_exclusive(dev, "gpu-clkgen");
+	if (IS_ERR(pd->clkgen_reset))
+		return dev_err_probe(dev, PTR_ERR(pd->clkgen_reset),
+				     "Failed to get GPU clkgen reset\n");
+
+	return 0;
+}
+
+static int th1520_gpu_domain_attach_dev(struct generic_pm_domain *genpd,
+					struct device *dev)
+{
+	struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
+	int ret;
+
+	/* Enforce 1:1 mapping - only one device can be attached. */
+	if (pd->attached_dev)
+		return -EBUSY;
+
+	/* Initialize clocks using the consumer device */
+	ret = th1520_gpu_init_consumer_clocks(dev, pd);
+	if (ret)
+		return ret;
+
+	/* Initialize consumer reset using the consumer device */
+	ret = th1520_gpu_init_consumer_reset(dev, pd);
+	if (ret) {
+		if (pd->clks) {
+			clk_bulk_put(pd->num_clks, pd->clks);
+			kfree(pd->clks);
+			pd->clks = NULL;
+			pd->num_clks = 0;
+		}
+		return ret;
+	}
+
+	/* Mark device as platform PM driver managed */
+	device_platform_resources_set_pm_managed(dev, true);
+	pd->attached_dev = dev;
+
+	return 0;
+}
+
+static void th1520_gpu_domain_detach_dev(struct generic_pm_domain *genpd,
+					 struct device *dev)
+{
+	struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
+
+	/* Ensure this is the device we have attached */
+	if (pd->attached_dev != dev) {
+		dev_warn(dev,
+			 "tried to detach from GPU domain but not attached\n");
+		return;
+	}
+
+	/* Remove PM managed flag when detaching */
+	device_platform_resources_set_pm_managed(dev, false);
+
+	/* Clean up the consumer-owned resources */
+	if (pd->gpu_reset) {
+		reset_control_put(pd->gpu_reset);
+		pd->gpu_reset = NULL;
+	}
+
+	if (pd->clks) {
+		clk_bulk_put(pd->num_clks, pd->clks);
+		kfree(pd->clks);
+		pd->clks = NULL;
+		pd->num_clks = 0;
+	}
+
+	pd->attached_dev = NULL;
+}
+
+static int th1520_gpu_domain_start(struct device *dev)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
+	int ret;
+
+	/* Check if we have all required resources */
+	if (pd->attached_dev != dev || !pd->clks || !pd->gpu_reset ||
+	    !pd->clkgen_reset)
+		return -ENODEV;
+
+	ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(pd->clkgen_reset);
+	if (ret)
+		goto err_disable_clks;
+
+	/*
+	 * According to the hardware manual, a delay of at least 32 clock
+	 * cycles is required between de-asserting the clkgen reset and
+	 * de-asserting the GPU reset. Assuming a worst-case scenario with
+	 * a very high GPU clock frequency, a delay of 1 microsecond is
+	 * sufficient to ensure this requirement is met across all
+	 * feasible GPU clock speeds.
+	 */
+	udelay(1);
+
+	ret = reset_control_deassert(pd->gpu_reset);
+	if (ret)
+		goto err_assert_clkgen;
+
+	return 0;
+
+err_assert_clkgen:
+	reset_control_assert(pd->clkgen_reset);
+err_disable_clks:
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
+	return ret;
+}
+
+static int th1520_gpu_domain_stop(struct device *dev)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
+
+	/* Check if we have all required resources and if this is the attached device */
+	if (pd->attached_dev != dev || !pd->clks || !pd->gpu_reset ||
+	    !pd->clkgen_reset)
+		return -ENODEV;
+
+	reset_control_assert(pd->gpu_reset);
+	reset_control_assert(pd->clkgen_reset);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
+
+	return 0;
+}
+
 static struct generic_pm_domain *th1520_pd_xlate(const struct of_phandle_args *spec,
 						 void *data)
 {
@@ -99,6 +282,22 @@ th1520_add_pm_domain(struct device *dev, const struct th1520_power_info *pi)
 	pd->genpd.power_off = th1520_pd_power_off;
 	pd->genpd.name = pi->name;
 
+	/* there are special callbacks for the GPU */
+	if (pi == &th1520_pd_ranges[TH1520_GPU_PD]) {
+		/* Initialize the PM-owned reset */
+		ret = th1520_gpu_init_pm_reset(dev, pd);
+		if (ret)
+			return ERR_PTR(ret);
+
+		/* No device attached yet */
+		pd->attached_dev = NULL;
+
+		pd->genpd.dev_ops.start = th1520_gpu_domain_start;
+		pd->genpd.dev_ops.stop = th1520_gpu_domain_stop;
+		pd->genpd.attach_dev = th1520_gpu_domain_attach_dev;
+		pd->genpd.detach_dev = th1520_gpu_domain_detach_dev;
+	}
+
 	ret = pm_genpd_init(&pd->genpd, NULL, true);
 	if (ret)
 		return ERR_PTR(ret);

-- 
2.34.1

