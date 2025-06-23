Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99CDAE3E40
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 13:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4B210E37A;
	Mon, 23 Jun 2025 11:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="OnhoKDKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7598510E370
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 11:44:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250623114433euoutp01462f13da4b7553b5e7fbffba228aa0b4~LqVd4i_oG3249832498euoutp01v
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 11:44:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250623114433euoutp01462f13da4b7553b5e7fbffba228aa0b4~LqVd4i_oG3249832498euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750679073;
 bh=tNSG9xdO/yT874UKULeA9IupmCwWnGM0EeVN9ziifd8=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=OnhoKDKUJlMu/iX+3AiCvoLOUUqaaH2ZSv/MNJ2FDG3W8gBnNFkFQIxEeKxzsln+u
 6DovMPJbN0tZTKmcB6CY24kVWpKzkZRkT7cxnnSudcy7HNI+ztOsw2C1TIuh7Gncjc
 pol13vVuUqvVKqvMrGMxmYM6Gl0G0g4K6uYeCP1k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250623114432eucas1p2642e24f2dea577c211f26e2738210c4a~LqVdXeNiM1259112591eucas1p29;
 Mon, 23 Jun 2025 11:44:32 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250623114431eusmtip17d8774218f038c94d99c5c902eb2247c~LqVcV2wB-1799017990eusmtip1j;
 Mon, 23 Jun 2025 11:44:31 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 23 Jun 2025 13:42:41 +0200
Subject: [PATCH v6 3/8] pmdomain: thead: Instantiate GPU power sequencer via
 auxiliary bus
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-apr_14_for_sending-v6-3-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
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
 dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250623114432eucas1p2642e24f2dea577c211f26e2738210c4a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250623114432eucas1p2642e24f2dea577c211f26e2738210c4a
X-EPHeader: CA
X-CMS-RootMailID: 20250623114432eucas1p2642e24f2dea577c211f26e2738210c4a
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114432eucas1p2642e24f2dea577c211f26e2738210c4a@eucas1p2.samsung.com>
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

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

