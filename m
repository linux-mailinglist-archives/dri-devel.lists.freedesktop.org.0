Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE23A21267
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D53110E6F8;
	Tue, 28 Jan 2025 19:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="AqtLg8Ni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C2210E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194834euoutp022696289c6f97b26ff8b66776e7a1cfb8~e8wZH7Aj-0761907619euoutp02O
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194834euoutp022696289c6f97b26ff8b66776e7a1cfb8~e8wZH7Aj-0761907619euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093714;
 bh=iLEsd2am1X+5vZM/OLyAto1b0UDJ7Gnw3qAm7HDZ/5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AqtLg8NipilVTmfOs8S9H2LWfK3AaCz5/j9ON2UKjZnfVavuqKSIvrTY8W4TrV9ZZ
 AraoeJc0zRxJbfOikG1/zyAlJ+l6YoF6WqmyzNmj25pnDF+pZ6QkRvxbKjSeeLdM68
 nK3KkblR4IPBVN6etZeCnQktMmTk5n3/I8AlE2rc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194833eucas1p141088e195ba3980974a973d85884569d~e8wYbtQoD1988619886eucas1p1x;
 Tue, 28 Jan 2025 19:48:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 18.B2.20409.19439976; Tue, 28
 Jan 2025 19:48:33 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861~e8wXsa9oe1989019890eucas1p1p;
 Tue, 28 Jan 2025 19:48:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194832eusmtrp225cf6ccb1db3e50534ab5c4bb748b04c~e8wXrpw5y3008430084eusmtrp2Z;
 Tue, 28 Jan 2025 19:48:32 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-10-67993491db44
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 12.BB.19654.09439976; Tue, 28
 Jan 2025 19:48:32 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194831eusmtip143f0d921494e2f4f578bdda147f34f65~e8wWYl26z2620826208eusmtip1n;
 Tue, 28 Jan 2025 19:48:31 +0000 (GMT)
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
Subject: [PATCH v4 06/18] pmdomain: thead: Add power-domain driver for TH1520
Date: Tue, 28 Jan 2025 20:48:04 +0100
Message-Id: <20250128194816.2185326-7-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUZRjG+845e86BXDouO/ENlRZFo5VA4jhfE4LMZHOgaRSnEbXQtjiz
 OMBCe8CwmAkGdlMuCg4lLsYtdJdVJLfdDTZgi8suGpKAwU7jIg4gF7nIRSMRiN1D5X+/932f
 73ned+ajcYmZ9KWPKFI4pUKW4Ed6Embb379vKdx2Vh5kO/MKau+rxJBpUUOhS42dGCpr7RSh
 /m4jhm4+mCbR5eEbFBptzCRQr+47CmXZakk0pukn0Uxevwj1WM6RaC6/FSDzXDaJalqdFKp9
 UIahihkTgarqLACpT1wQoa5ru5Czv51AYz15OFJrnkErDXUUWu69QqCSKSuFjBOFImSviUbZ
 1iJi5wZ22qGi2ImxMYJtOT5PsY0Pywm2XuOk2Lz6DsAa9CdI9lZvA8mWXo1ib+faMfbHqq/Y
 7Bobxp5aCmKnm/4g2ZNGPWC7s/qoPZKDniGxXMKRo5wyMPRjz7iJil4quTsybTpXi2eAuR05
 wIOGzDZYfN8hygGetITRAdj3bSYpFPMAVl9TE0IxB2DGctfqhHY/0V+KFvpaAE1OKxCKCQBv
 3KvCXb4ksxUOaMvcvlJGRUBVW6ZbhTMjAJqHzpEulTezG3Z0dGAuJhh/aBh9SLhYzITBjB+m
 SGHDjdD663W3qwezExqWdGua9fDq2SE346uaLFMJ7gqAzBVPOP5oQCTs+g60NT0t+HjDcbuR
 Evh5uFJfhgmcBAdMs7jA6bA+z77Gb8NbnY/cJ+PMZlhrCRTa4dBi+B4T3L2gY3K9sIEXPG0+
 gwttMTyulgjqV+E3efn/hXbqzGuhLJyeayUKwEuaJ27RPHGL5v/ccoDrgQ+XyifKOX6rgvs8
 gJcl8qkKecCnSYkGsPq1f1u2z9cB7fhMQDPAaNAMII37ScUxncVyiThWduwLTpl0WJmawPHN
 4Dma8PMRV1pVcgkjl6Vw8RyXzCn/nWK0h28GFkKDohe01vgguC84si1mSaTYHvqsRf2WXM//
 PGi453VHGrF/JPx++1Nppa2Oi5U+7RqzczK/5HST7u6BEXZQGjhTMOydu284+LMsauHdQ5+8
 v5HaG13RsyOCPzy7e8FnQfZhSKzBVtjCFLz3S/2BDQFh61Lkm079lRjmOHRscSzcIyI+Kp20
 m7587N+2Ik3f49h/vqMcL+WLZ4sUDcuzofbImMuTpRWFOfkj+q7r1M2XtyyG/LSppcEr9KiR
 NKY13X7R9EF+VN3C3epdcY9Fuj99kyXqr/XVKvn5TFux9GIyP793KXhwqZrebMr8qH30YPa6
 0u2S5Snn0OvGC3dOit/w9yP4ONmbr+FKXvYPXav0PEkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7oTTGamG3zYbmRx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEv483Ca+wFl7wq3ncvZ25g/GzbxcjBISFgIrFqTXgXIxeHkMBSRomp/y6y
 dzFyAsVlJK51v2SBsIUl/lzrYoMoesUo8WfzTmaQBJuAkcSD5fNZQWwRgcUsEnv3VYIUMQu8
 ZZS4PnMjWLewgK/Ez+8XwKayCKhKbHrxDSzOK2Av0bDhHRvEBnmJ/QfPgg3lFHCQ2PR3BViN
 EFDNo7cz2CDqBSVOznwCFmcGqm/eOpt5AqPALCSpWUhSCxiZVjGKpJYW56bnFhvpFSfmFpfm
 pesl5+duYgSml23Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeGPPzUgX4k1JrKxKLcqPLyrNSS0+
 xGgKdPdEZinR5HxggssriTc0MzA1NDGzNDC1NDNWEudlu3I+TUggPbEkNTs1tSC1CKaPiYNT
 qoFJOcbm1sM8x4tOliefm88+1dAm2Mz1UeXLnfcGHasU5JSjzO+FZHpOnTTxfJEja8nRE7Gp
 hzv2x35uviAm8W56y1Yuz9R9fJMm/8jx2CRVGizWPcU1Tu7dueOeU2Z8d2NbuvT0w4awZlet
 p5M7nzzzFNZvKJKUdf6VWWzQZLPmm+f13SfSjFVjJN+c8G55XrD88FNlxrblIp6fU1IZ5xs8
 Cbu83CbnF1f9/fnWMqqWofvD9t1scU5/s0+3xHDRtpshr/ZdDfr9IdvKMeCepunK/4unRS/d
 doPXdWbftF3HUlfMffpFT83q/A0+4VdydY+O/+Getbdq3rSG67YHhb/wlOvyJWw1manEJGwp
 /fOJEktxRqKhFnNRcSIApX+kMrgDAAA=
X-CMS-MailID: 20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861@eucas1p1.samsung.com>
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
 drivers/pmdomain/thead/th1520-pm-domains.c | 193 +++++++++++++++++++++
 6 files changed, 210 insertions(+)
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4106b0e26589..33c804f1a60f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20350,6 +20350,7 @@ F:	drivers/firmware/thead,th1520-aon.c
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
index 000000000000..7cf4ea519623
--- /dev/null
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -0,0 +1,193 @@
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

