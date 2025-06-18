Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63CADE891
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408410E7F9;
	Wed, 18 Jun 2025 10:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="MGmjqVSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06AF10E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:30 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618102229euoutp022992be210276f825376c3806473d9081~KG-Ybi-1n2447824478euoutp02f
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250618102229euoutp022992be210276f825376c3806473d9081~KG-Ybi-1n2447824478euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750242149;
 bh=tFyef9Zk5foTthqWHu/oFmYdMYhqggHXZgBAaGBnWFU=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=MGmjqVSP4FIayvMOMwTgyV2A8OHTlORbdxEeX56KWV4ihe630Tjpq1LMgZxE2z6oD
 eoR44u8VIwHSTdHmaWI1EPIPbt2kfDF/ZDjwDjcUbCDISbrk+hTKBm3PXPcgFk6S1p
 u//DZJGksCAG52PKB0kHjkhyhXINMvcQxkdHCJvo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3~KG-X8Syqe1595015950eucas1p1U;
 Wed, 18 Jun 2025 10:22:28 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250618102227eusmtip11305416c6f5b7e92a8f4c4b15a74c1b9~KG-W_GGjU1000610006eusmtip1F;
 Wed, 18 Jun 2025 10:22:27 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 18 Jun 2025 12:22:09 +0200
Subject: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer via
 auxiliary bus
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
 Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3
X-EPHeader: CA
X-CMS-RootMailID: 20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
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

In order to support the complex power sequencing required by the TH1520
GPU, the AON power domain driver must be responsible for initiating the
corresponding sequencer driver. This functionality is specific to
platforms where the GPU power sequencing hardware is controlled by the
AON block.

Extend the AON power domain driver to check for the presence of the
"gpu-clkgen" reset in its own device tree node.

If the property is found, create and register a new auxiliary device.
This device acts as a proxy that allows the dedicated `pwrseq-thead-gpu`
auxiliary driver to bind and take control of the sequencing logic.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/pmdomain/thead/Kconfig             |  1 +
 drivers/pmdomain/thead/th1520-pm-domains.c | 51 ++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
index 7d52f8374b074167d508a80fd807929c53faef12..208828e0fa0dc91256bf808b905bea32bb84250d 100644
--- a/drivers/pmdomain/thead/Kconfig
+++ b/drivers/pmdomain/thead/Kconfig
@@ -4,6 +4,7 @@ config TH1520_PM_DOMAINS
 	tristate "Support TH1520 Power Domains"
 	depends on TH1520_AON_PROTOCOL
 	select REGMAP_MMIO
+	select AUXILIARY_BUS
 	help
 	  This driver enables power domain management for the T-HEAD
 	  TH-1520 SoC. On this SoC there are number of power domains,
diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
index f702e20306f469aeb0ed15e54bd4f8309f28018c..9040b698e7f7f2400163841530fecacfb0f917bc 100644
--- a/drivers/pmdomain/thead/th1520-pm-domains.c
+++ b/drivers/pmdomain/thead/th1520-pm-domains.c
@@ -5,6 +5,7 @@
  * Author: Michal Wilczynski <m.wilczynski@samsung.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/firmware/thead/thead,th1520-aon.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -128,6 +129,50 @@ static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
 	}
 }
 
+static void th1520_pd_pwrseq_unregister_adev(void *adev)
+{
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int th1520_pd_pwrseq_gpu_init(struct device *dev)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	/*
+	 * Correctly check only for the property's existence in the DT node.
+	 * We don't need to get/claim the reset here; that is the job of
+	 * the auxiliary driver that we are about to spawn.
+	 */
+	if (device_property_match_string(dev, "reset-names", "gpu-clkgen") < 0)
+		/*
+		 * This is not an error. It simply means the optional sequencer
+		 * is not described in the device tree.
+		 */
+		return 0;
+
+	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = "pwrseq-gpu";
+	adev->dev.parent = dev;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, th1520_pd_pwrseq_unregister_adev,
+					adev);
+}
+
 static int th1520_pd_probe(struct platform_device *pdev)
 {
 	struct generic_pm_domain **domains;
@@ -186,8 +231,14 @@ static int th1520_pd_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clean_genpd;
 
+	ret = th1520_pd_pwrseq_gpu_init(dev);
+	if (ret)
+		goto err_clean_provider;
+
 	return 0;
 
+err_clean_provider:
+	of_genpd_del_provider(dev->of_node);
 err_clean_genpd:
 	for (i--; i >= 0; i--)
 		pm_genpd_remove(domains[i]);

-- 
2.34.1

