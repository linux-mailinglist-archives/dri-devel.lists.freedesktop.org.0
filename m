Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF57A1713F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5EE10E45D;
	Mon, 20 Jan 2025 17:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="SbUIJRvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117F10E45A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172127euoutp02c3bf71d65ab4c4c2c8d0cd61afed327d~cdlqDq4111548115481euoutp02z
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172127euoutp02c3bf71d65ab4c4c2c8d0cd61afed327d~cdlqDq4111548115481euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393687;
 bh=iYT1w+/Dd518pn6hLQh14JBk4rMm96TOguMA+BPTxKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SbUIJRvpxoIM6OdZac69PjOlm87GRgeGY7E94R5CDJW3pl571ewbr9nnUYuQ7J3b+
 hQu22EaFfMtiHIl9XmXcbcpdwrRteuL/6vLtwc/3KQkE3+K6MPO+0J98h+HsK88/Ma
 tvFLyPPc2xLUuGgCG5KiEBQUXItZExc+vcVscGwk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250120172126eucas1p1db54330cb14a4773b4e232b4546edd38~cdlppR8DM1582415824eucas1p1H;
 Mon, 20 Jan 2025 17:21:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 03.76.20409.6168E876; Mon, 20
 Jan 2025 17:21:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0~cdlos4Mcb1001110011eucas1p1a;
 Mon, 20 Jan 2025 17:21:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172125eusmtrp20f719d71305ff3bfc9c4da7384cdb4a1~cdlolQ8Ga0490804908eusmtrp2k;
 Mon, 20 Jan 2025 17:21:25 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-c6-678e86162ebb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.95.19654.5168E876; Mon, 20
 Jan 2025 17:21:25 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172124eusmtip1fc55a85f3401af220c94dce8ebf491f2~cdlnSNFmS1307113071eusmtip1P;
 Mon, 20 Jan 2025 17:21:24 +0000 (GMT)
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
Subject: [RFC v3 05/18] pmdomain: thead: Add power-domain driver for TH1520
Date: Mon, 20 Jan 2025 18:20:58 +0100
Message-Id: <20250120172111.3492708-6-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH+T7Ps+cZcKOHofANyo6dadkJRBHfuzqClOtJ5M6uTA4rG/I0
 MH7dJgheXSobqU2Cjq5zMjYmwuQcGzIW4yBsIJs/QJAfwgnbMowf8UMCNI0wxmb53/v7+bze
 3/fnc/fh4vyfyGBuetZBVpwlzBCQPoSp8+GNrYFFxaKIHsdryHZLg6HGvxUUutDajSFVRzcH
 2W8aMdS/NEeiurs9FJpoPUqgQa2SQoWdehJNKuwkmpfbOaivuZxEC6c6ADItSEmk6xilkH5J
 haHK+UYCVTU1A1R0opqDeq/Go1G7jUCTfXIcFSmeQY9bmii0MlhPoDOzbRQyTpdykFW3B0nb
 yojYDczckIxipicnCab9+CLFtN5XE4xZMUoxcvN1wFysPUEyI4MtJFNx5X3G8a0VYxqqvmak
 uk6M+e6fCGbu5wGSKTbWAuZm4S1qFz/Z561UNiM9jxWHx3zmk6YxVHFyDNvylWYZdgQsR58E
 3lxIvw5blJeok8CHy6e1ANadHwfuxyKA5VIDcFF8egHAXn3ME4ehbxp3QzUAalQaj2MaQOmv
 PRwXRdKR0Fmj4rga62gZAWWXj65ROD0OoGmsnHRRAXQCvHP/xpqDoF+ELYXFmEvz6LehZlZG
 ufNegG2/dOEu7U3HwgcDrZSb8YdXTo8RLo2vMoWNZ9ZmgrTOB/bbVoDbvB06K87ibh0Ap6xG
 z6fPwcdmFebW2dDZ+KeH+RKa5VaPfhOOdD9aHZS7GvAy1DeHu8txsH1KibvKkPaDQzP+7hH8
 4PemHz1lHjxexHfTm+AP8lP/hXZrTZ5QBtafv0eVgFDFU8sonlpG8X+uGuC1IIjNlWSKWElk
 FnsoTCLMlORmicL2Z2deBKu3fW3FutgEaqbmwywA4wILgFxcsI63/p5cxOelCgsOs+LsfeLc
 DFZiASFcQhDE07TJRHxaJDzIfsGyOaz4SRfjegcfwYJiU7JHhlOuarb2J174PdKUr1WFTxSI
 HZV31H7f2K75flJZaslWO2FNRe/QXke6JakkUDf1bM7Z9fZHtcRLuoYSr1dCNu+K5OVEbPoo
 JTHPkrD3N9OO0urqzVjyPuOoIK7r9jsFM97nHNG7I3ZLU/vCgsu1d49lRvnTx/Z/DroCkga8
 DtVdfoOzmOf7Qew5357hwzsnNWW8D0ejgSykPClxR4MtdaMthGuXVw/mbxmPmEn23xDeGees
 ejdpSfnXe2msYea2PnDbV8Pkw09DQoPE1sqNzgdlByaGxvfMRuPR25frP1aGX/dKyLSEtqov
 Rf3hOKAbarc+H59sirKNxXcsxwgISZrw1S24WCL8F1A8aJVKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUwbdRzH87+73pXFjrNQvTAR1zhNMJS2K92/OtgComdIzPbCmWgIVjgL
 rA+zLTII7iEtKFBRGqdSYGXlaSPioCus3ehQRoBZ2XTQAhvtjGHEUgQJg4nbqi1osnef5Pv0
 e/Fjo9x2VgK7SK1ntGq5ko9vwzzhUX8Kr6pOIXxw6yU4NmVDYN8DCwG/dV9HoHX4OgsGbjoQ
 OLm2jMPv7v5MwN/dJzHoO9tMQMPIeRwGLQEcrpgCLDhxqQmHq58NA9i/asRh97CfgOfXrAg8
 s9KHwTbnJQCrqjtY8Jcfs6E/MIbB4IQJhVWWWPjPgJOAYV8vBhuXBgnoWKxnwdHut6Fx8Ets
 /7P08nQlQS8Ggxh99dN7BO1eb8Fol8VP0CbXT4C2d1Xj9KxvAKdPXztI36kdRegLbcdpY/cI
 Qn/+SEgvX/HidJ2jC9A3DVPEAe47gr1aTYmeea5Qo9On898VQbFAJIMCsUQmEO3ek/uyOI2f
 mrG3gFEWfcRoUzPeExTaetpYR3qyjja7KpET4OGeGhDDpkgJ1TOxiNaAbWwu2Q6o0FgI2xKe
 oXy1wf84jnroq8GjzCUXIqaWpCjjpJj6tdPKinI82YpR7itl0SKU/ANQUw29m+E4Mof6bf3G
 pgkjd1EDhjokyhxyH2VbqiS2BpKowR/G0SjHkPup+143sTW2j5r11oIt/5PUtYa5zU404jf0
 NaJfANLymGR5TGoBSBeIZ0p0KoVKJxbo5CpdiVohyNeo7CDyL/0jGw4nOLewIhgCCBsMAYqN
 8uM5vD9NCi6nQF5Wzmg1edoSJaMbAmmRu+vRBF6+JvJwan2eSCpME0mkMmGaTLqb/zQHn7zx
 AZdUyPXMYYY5wmj/zyHsmIQTSOLHpmKp0UMeUlmzXYdiG53TfCZxR8ob0lDDUW4pESz/RGm9
 J1G++ddVta0oFPf16+a2C2bqYufkyfkK9dz6qlRy/7Rz5v2UrEfmpeCGfWcYkrlKdovslui2
 8qtXZeVh11S2IqR8StsX7szJzJ55MfB35oHOJ6yWxKyMrNZW+/hcylus7lc6JvpnD64XZ6Yy
 AfP2ZM8xTxs6PVL2fZ4Qb/Lf3VEvOZ7vZvFs4/rkmcsFS7fJBe9ry97xcwOmO0kGizF2Ib1H
 3SRZVJUers6tuGxx8DnY87L5jt6N9p3N6bvO6L+ppfxmT479VOn2smNrPLf8w7PFGxUX54Uv
 aPmYrlAuSka1Ovm/ELO5PbgDAAA=
X-CMS-MailID: 20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0@eucas1p1.samsung.com>
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

The T-Head TH1520 SoC contains multiple power islands that can be
programmatically turned on and off using the AON (Always-On) protocol
and a hardware mailbox [1]. The relevant mailbox driver has already been
merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
Introduce support for T-head TH1520 Mailbox driver");

This commit introduces a power-domain driver for the TH1520 SoC, which
is using AON firmware protocol to communicate with E902 core through the
hardware mailbox. This way it can send power on/off commands to the E902
core.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                |   1 +
 drivers/pmdomain/Kconfig                   |   1 +
 drivers/pmdomain/Makefile                  |   1 +
 drivers/pmdomain/thead/Kconfig             |  12 ++
 drivers/pmdomain/thead/Makefile            |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c | 174 +++++++++++++++++++++
 6 files changed, 191 insertions(+)
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c96a1e6c8831..363bb3471a33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20195,6 +20195,7 @@ F:	drivers/firmware/thead,th1520-aon.c
 F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
+F:	drivers/pmdomain/thead/
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/firmware/thead,th1520-aon.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 23c64851a5b0..91f04ace35d4 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -16,6 +16,7 @@ source "drivers/pmdomain/st/Kconfig"
 source "drivers/pmdomain/starfive/Kconfig"
 source "drivers/pmdomain/sunxi/Kconfig"
 source "drivers/pmdomain/tegra/Kconfig"
+source "drivers/pmdomain/thead/Kconfig"
 source "drivers/pmdomain/ti/Kconfig"
 source "drivers/pmdomain/xilinx/Kconfig"
 
diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
index a68ece2f4c68..7030f44a49df 100644
--- a/drivers/pmdomain/Makefile
+++ b/drivers/pmdomain/Makefile
@@ -14,6 +14,7 @@ obj-y					+= st/
 obj-y					+= starfive/
 obj-y					+= sunxi/
 obj-y					+= tegra/
+obj-y					+= thead/
 obj-y					+= ti/
 obj-y					+= xilinx/
 obj-y					+= core.o governor.o
diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
new file mode 100644
index 000000000000..c7a1ac0c61dc
--- /dev/null
+++ b/drivers/pmdomain/thead/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config TH1520_PM_DOMAINS
+	tristate "Support TH1520 Power Domains"
+	depends on TH1520_AON_PROTOCOL || !TH1520_AON_PROTOCOL
+	select REGMAP_MMIO
+	help
+	  This driver enables power domain management for the T-HEAD
+	  TH-1520 SoC. On this SoC there are number of power domains,
+	  which can be managed independently. For example GPU, NPU,
+	  and DPU reside in their own power domains which can be
+	  turned on/off.
diff --git a/drivers/pmdomain/thead/Makefile b/drivers/pmdomain/thead/Makefile
new file mode 100644
index 000000000000..adfdf5479c68
--- /dev/null
+++ b/drivers/pmdomain/thead/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_TH1520_PM_DOMAINS)		+= th1520-pm-domains.o
diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
new file mode 100644
index 000000000000..d913ad40fb76
--- /dev/null
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#include <linux/firmware/thead/thead,th1520-aon.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+
+#include <dt-bindings/firmware/thead,th1520-aon.h>
+
+struct th1520_power_domain {
+	struct th1520_aon_chan *aon_chan;
+	struct generic_pm_domain genpd;
+	u32 rsrc;
+};
+
+struct th1520_power_info {
+	const char *name;
+	u32 rsrc;
+};
+
+static const struct th1520_power_info th1520_pd_ranges[] = {
+	{ "vdec", TH1520_AON_VDEC_PD },
+	{ "npu", TH1520_AON_NPU_PD },
+	{ "venc", TH1520_AON_VENC_PD },
+	{ "gpu", TH1520_AON_GPU_PD },
+	{ "dsp0", TH1520_AON_DSP0_PD },
+	{ "dsp1", TH1520_AON_DSP1_PD }
+};
+
+static inline struct th1520_power_domain *
+to_th1520_power_domain(struct generic_pm_domain *genpd)
+{
+	return container_of(genpd, struct th1520_power_domain, genpd);
+}
+
+static int th1520_pd_power_on(struct generic_pm_domain *domain)
+{
+	struct th1520_power_domain *pd = to_th1520_power_domain(domain);
+
+	return th1520_aon_power_update(pd->aon_chan, pd->rsrc, true);
+}
+
+static int th1520_pd_power_off(struct generic_pm_domain *domain)
+{
+	struct th1520_power_domain *pd = to_th1520_power_domain(domain);
+
+	return th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
+}
+
+static struct generic_pm_domain *th1520_pd_xlate(const struct of_phandle_args *spec,
+						 void *data)
+{
+	struct generic_pm_domain *domain = ERR_PTR(-ENOENT);
+	struct genpd_onecell_data *pd_data = data;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
+		struct th1520_power_domain *pd;
+
+		pd = to_th1520_power_domain(pd_data->domains[i]);
+		if (pd->rsrc == spec->args[0]) {
+			domain = &pd->genpd;
+			break;
+		}
+	}
+
+	return domain;
+}
+
+static struct th1520_power_domain *
+th1520_add_pm_domain(struct device *dev, const struct th1520_power_info *pi)
+{
+	struct th1520_power_domain *pd;
+	int ret;
+
+	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return ERR_PTR(-ENOMEM);
+
+	pd->rsrc = pi->rsrc;
+	pd->genpd.power_on = th1520_pd_power_on;
+	pd->genpd.power_off = th1520_pd_power_off;
+	pd->genpd.name = pi->name;
+
+	ret = pm_genpd_init(&pd->genpd, NULL, true);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pd;
+}
+
+static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
+				   struct device *dev)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
+		struct th1520_power_domain *pd =
+			to_th1520_power_domain(domains[i]);
+
+		ret = th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
+		if (ret)
+			dev_err(dev,
+				"Failed to initially power down power domain %s\n",
+				pd->genpd.name);
+	}
+}
+
+static int th1520_pd_probe(struct platform_device *pdev)
+{
+	struct generic_pm_domain **domains;
+	struct genpd_onecell_data *pd_data;
+	struct th1520_aon_chan *aon_chan;
+	struct device *dev = &pdev->dev;
+	int i;
+
+	aon_chan = dev_get_drvdata(dev->parent);
+	if (!aon_chan) {
+		dev_err(dev, "Failed to get AON channel from parent\n");
+		return -EINVAL;
+	}
+
+	domains = devm_kcalloc(dev, ARRAY_SIZE(th1520_pd_ranges),
+			       sizeof(*domains), GFP_KERNEL);
+	if (!domains)
+		return -ENOMEM;
+
+	pd_data = devm_kzalloc(dev, sizeof(*pd_data), GFP_KERNEL);
+	if (!pd_data)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
+		struct th1520_power_domain *pd;
+
+		pd = th1520_add_pm_domain(dev, &th1520_pd_ranges[i]);
+		if (IS_ERR(pd))
+			return PTR_ERR(pd);
+
+		pd->aon_chan = aon_chan;
+		domains[i] = &pd->genpd;
+		dev_dbg(dev, "added power domain %s\n", pd->genpd.name);
+	}
+
+	pd_data->domains = domains;
+	pd_data->num_domains = ARRAY_SIZE(th1520_pd_ranges);
+	pd_data->xlate = th1520_pd_xlate;
+
+	/*
+	 * Initialize all power domains to off to ensure they start in a
+	 * low-power state. This allows device drivers to manage power
+	 * domains by turning them on or off as needed.
+	 */
+	th1520_pd_init_all_off(domains, dev);
+
+	return of_genpd_add_provider_onecell(dev->parent->of_node, pd_data);
+}
+
+static struct platform_driver th1520_pd_driver = {
+	.driver = {
+		.name = "th1520-pd",
+	},
+	.probe = th1520_pd_probe,
+};
+module_platform_driver(th1520_pd_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
+MODULE_LICENSE("GPL");
-- 
2.34.1

