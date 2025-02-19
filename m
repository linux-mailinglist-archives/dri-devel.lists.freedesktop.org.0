Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB24FA3C108
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9644B10E81C;
	Wed, 19 Feb 2025 14:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="jL+R17fA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13E810E490
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:59 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140258euoutp010f78376b3dda4def2b6b9f89b9b33e30~loO7A4XMT1473614736euoutp01O
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140258euoutp010f78376b3dda4def2b6b9f89b9b33e30~loO7A4XMT1473614736euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973778;
 bh=19ym9OK9GQAmFQwWcXEXSpa9bIXa4LVETQ4napfp3Hw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jL+R17fAuP6K95LxutrwxIO7OCnGt8s9CIr3d04n5ymQ5TaqiINVQQdakIXU3Vuxv
 l3c+8yjRBGVwliIe3zWkP2bv0ZboN1SY8NlH0/MfmgOq9ce+oC1lI96mGFlwR55l/t
 iw6m3AQIt3uQLsuxcDkXa++pNqAeLTs6g42SR7yY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140257eucas1p1db757f912e4578554bfa33b8381972fb~loO6kqTyi1246612466eucas1p1p;
 Wed, 19 Feb 2025 14:02:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C6.73.20821.194E5B76; Wed, 19
 Feb 2025 14:02:57 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250219140257eucas1p1cc06395993336a6244f6ae0ce2923d71~loO6FdJ2Y1050110501eucas1p12;
 Wed, 19 Feb 2025 14:02:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140257eusmtrp1c25b9d802134c0bc40606d58936e2e48~loO6EmOUu2416524165eusmtrp1X;
 Wed, 19 Feb 2025 14:02:57 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-2a-67b5e49136fa
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.52.19654.194E5B76; Wed, 19
 Feb 2025 14:02:57 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140255eusmtip21763dbe52d985cb0683de8ae532326a7~loO4x4nTP0084500845eusmtip2j;
 Wed, 19 Feb 2025 14:02:55 +0000 (GMT)
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
Subject: [PATCH v5 06/21] pmdomain: thead: Add power-domain driver for TH1520
Date: Wed, 19 Feb 2025 15:02:24 +0100
Message-Id: <20250219140239.1378758-7-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzdfe/1vVJXfVQcV1AnJGpkswLZkpvgBhtze4s6cG5xcV8WfClk
 BUxr/WAbrUKrsoKAELfyDZ10OARZy1o+Q0WKwHB8WCGhyAyEFWFdQcw2B5v04eZ/5/c759xz
 fsnl4yIzGcBPTD7GypMlsmBSQDR0/nlrR+6EWRr6e92LqOtOBYbMj/QU+r6lD0OlHX08NDZg
 wtDQgptEVyd/ptCvLacJ5DAWUyi9s5ZELv0YiTy6MR4abCwi0XxWB0AN8xkkqulwUqh2oRRD
 5R4zgQyWRoC05y/zUH/3buQc6yKQa1CHI61+Dfqn2UKhJcc1AhX+1kYh00wuD9lrDqKMtnwi
 ahPjHtZQzIzLRTDXzz2gmJaHZQRj1TspRmftBUx99XmSGXU0k0zJzf3M3a/sGPODQcVk1HRi
 zIXFUMbdeptksk3VgBlIv0PFig4Jdh1hZYnHWfnOVw8LEromHmJHv37n5Oy0iVSDuahM4MOH
 9Etwqs4JMoGAL6KNAJY5XBQ3PAAwZ/w6jxvmAfxx0ch7Yrl634FzRBWAlWeziGVCRM8AWNMb
 uYxJOhyOV5V63X60hoCaG6e9ITg9BWDDRBGZCfj8tXQMdGeJlw0EvQWqhzK8CUI6EjpHnRSX
 9jxsa/8JX5b70FGwtT+Ak/jCm99MeHPxx5J0c6G3EKRrBNCY58Y47xvQ0J1PcngtnLabVt7c
 AHsu6ggOp8Bx8xzO4S+gVWdfwRFwtO8vb02c3g5rG3dy69dgwY3viOU1pFfD4VlfrsJqmNdw
 CefWQnhOK+LUW2GBLuu/0D5jw0oxBmo8s2QOCNI/dYz+qWP0/+eWAbwa+LNKRZKUVYQlsyfE
 CkmSQpksFcenJNWDxz+7Z8k+ZwHF0x6xDWB8YAOQjwf7CbUqk1QkPCI5lcrKUz6VK2WswgYC
 +USwv7CiTSMV0VLJMfYzlj3Kyp+wGN8nQI19ImNsBepf8m9Hll88nmp5BYZnazUj4sRLdufl
 z4tmt62PN9DuNSeG4zDf7HcJ4fvt2hL7NWvamZC7b9la5QkVwRtfeLbprGFvyZ79B6Y23l9U
 xgVtCX/5ilz4cVp8uqdpe3RTRFhWzIDz2/f0m+MGXbrovblvFpVjCs2p6l2+tbHO3R8E3lqa
 bFl/crPm3pf+ysqteYc3xDxStfckGc80F6cWrVt8XR16r3zBP/rvTcnP7RksC3tmX0v/ZBjq
 7h2yBn0YolvlkFn7u9PqwbaR2E73juzsGd0ByravtfJQ/6LB7wLmX95ZVVin0qtz0Kq4j9ZZ
 ct5OMh2MwTwhESOqPwKvBBOKBElYCC5XSP4FFw6zbkgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7oTn2xNN/j3jM/ixPVFTBZbf89i
 t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
 xeVdc9gsPvceYbTY9rmFzWLtkbvsFuu/zmeyWPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
 l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
 X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
 +66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexokn35gKZvhVvH21ha2B8ZNDFyMnh4SAicS619eYQWwhgaWMEjNa0iHi
 MhLXul+yQNjCEn+udbF1MXIB1bxilLjy6xNYA5uAkcSD5fNZQWwRgcUsEnv3VYIUMQu8ZZS4
 PnMjWLewgK/EhtcH2UFsFgFViYYrLWANvAL2Enfv3GWH2CAvsf/gWaChHBycAg4S+y5KQRxk
 L3Gu7z5UuaDEyZlPwEYyA5U3b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PTc4uN9IoTc4tL89L1
 kvNzNzECk8u2Yz+37GBc+eqj3iFGJg7GQ4wSHMxKIrxt9VvShXhTEiurUovy44tKc1KLDzGa
 Ap09kVlKNDkfmN7ySuINzQxMDU3MLA1MLc2MlcR52a6cTxMSSE8sSc1OTS1ILYLpY+LglGpg
 WrOyrnprqdzaZx/XNK7mjxHesqBQ2kDRtUayV5pH7I4v11vj50USnbc/rrTSvdL4aPbJnpUK
 h+Wjv1v65pl1Wiz1UW+eYBF9T2TnftGA3tKdRzcGHitv+zf5sHVXUs1Dp/vnz3XVbK2RS5ip
 wB60auOmRw5izx9duWlhvX7i3VNqJzzyQuI+TlP2yRWJzHvL0xCaJz1rb4xWwvSH+kcd/BxY
 L7MxR33t2H0qb/8h5wvTnXfueXE2/pyhdt3JGWm2Dkk5OzT7193dGsfrKMWQZi2kO3H7U4+p
 fuFcz9NfL5zS1Fx4/tX/pywJ3w7Z9Gz7pc16xsv94ub8e77y73QY/s6dEFtQVZF6TPVEdG6j
 EktxRqKhFnNRcSIASdnUdrcDAAA=
X-CMS-MailID: 20250219140257eucas1p1cc06395993336a6244f6ae0ce2923d71
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140257eucas1p1cc06395993336a6244f6ae0ce2923d71
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140257eucas1p1cc06395993336a6244f6ae0ce2923d71
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140257eucas1p1cc06395993336a6244f6ae0ce2923d71@eucas1p1.samsung.com>
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

Introduce a power-domain driver for the TH1520 SoC, which is using AON
firmware protocol to communicate with E902 core through the hardware
mailbox. This way it can send power on/off commands to the E902 core.

The interaction with AUDIO power island e.g trying to turn it OFF proved
to crash the firmware running on the E902 core. Introduce the workaround
to disable interacting with the power island.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                |   1 +
 drivers/pmdomain/Kconfig                   |   1 +
 drivers/pmdomain/Makefile                  |   1 +
 drivers/pmdomain/thead/Kconfig             |  12 ++
 drivers/pmdomain/thead/Makefile            |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c | 209 +++++++++++++++++++++
 6 files changed, 226 insertions(+)
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 781129d60349..18f0eb293519 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20423,6 +20423,7 @@ F:	drivers/firmware/thead,th1520-aon.c
 F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
+F:	drivers/pmdomain/thead/
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/power/thead,th1520-power.h
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
index 000000000000..7c78cf3955d2
--- /dev/null
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -0,0 +1,209 @@
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
+#include <dt-bindings/power/thead,th1520-power.h>
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
+	bool disabled;
+};
+
+/*
+ * The AUDIO power domain is marked as disabled to prevent the driver from
+ * managing its power state. Direct AON firmware calls to control this power
+ * island trigger a firmware bug causing system instability. Until this
+ * firmware issue is resolved, the AUDIO power domain must remain disabled
+ * to avoid crashes.
+ */
+static const struct th1520_power_info th1520_pd_ranges[] = {
+	[TH1520_AUDIO_PD] = {"audio", TH1520_AON_AUDIO_PD, true },
+	[TH1520_VDEC_PD] = { "vdec", TH1520_AON_VDEC_PD, false },
+	[TH1520_NPU_PD] = { "npu", TH1520_AON_NPU_PD, false },
+	[TH1520_VENC_PD] = { "venc", TH1520_AON_VENC_PD, false },
+	[TH1520_GPU_PD] = { "gpu", TH1520_AON_GPU_PD, false },
+	[TH1520_DSP0_PD] = { "dsp0", TH1520_AON_DSP0_PD, false },
+	[TH1520_DSP1_PD] = { "dsp1", TH1520_AON_DSP1_PD, false }
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
+		if (th1520_pd_ranges[i].disabled)
+			continue;
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
+		struct th1520_power_domain *pd;
+
+		if (th1520_pd_ranges[i].disabled)
+			continue;
+
+		pd = to_th1520_power_domain(domains[i]);
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
+	aon_chan = th1520_aon_init(dev);
+	if (IS_ERR(aon_chan))
+		return dev_err_probe(dev, PTR_ERR(aon_chan),
+				     "Failed to get AON channel\n");
+
+	platform_set_drvdata(pdev, aon_chan);
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
+		if (th1520_pd_ranges[i].disabled)
+			continue;
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
+	return of_genpd_add_provider_onecell(dev->of_node, pd_data);
+}
+
+static void th1520_pd_remove(struct platform_device *pdev)
+{
+	struct th1520_aon_chan *aon_chan = platform_get_drvdata(pdev);
+
+	th1520_aon_deinit(aon_chan);
+}
+
+static const struct of_device_id th1520_pd_match[] = {
+	{ .compatible = "thead,th1520-aon" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, th1520_pd_match);
+
+static struct platform_driver th1520_pd_driver = {
+	.driver = {
+		.name = "th1520-pd",
+		.of_match_table = th1520_pd_match,
+	},
+	.probe = th1520_pd_probe,
+	.remove = th1520_pd_remove,
+};
+module_platform_driver(th1520_pd_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
+MODULE_LICENSE("GPL");
-- 
2.34.1

