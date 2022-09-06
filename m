Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934D5AEA5F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 15:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D309E10E677;
	Tue,  6 Sep 2022 13:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1043 seconds by postgrey-1.36 at gabe;
 Tue, 06 Sep 2022 13:46:37 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ED210E677
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 13:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6o06f6lKEImR2OALb/GgSAF0FPbhPTKph1QDZj138Gs=; b=mlJoEm3gOrgipKrMLw7+fmkhwA
 icULGhxlu2+CTE/QvUwru+8kzP63sy4ZgLowIxrT4j4sUJE4s3Wd97FJ6j1sfkGjF9dztFgFTkKVL
 qsumQJ0DpMl6CI6UhghevD4HxfBvzykCW95ANoeHFmRNxC2z7zIBqb4nimOQ1nYRSQkAdQfHqm+Dj
 /0a0NquLer6Geie8YjTNBiompUKPdmIW4S2RFlgWZ3XC2A4SxePmcL9Sz+/LRDKiBzqpVupm1Cktl
 oD5riuT3ik1VpWJRVMOAr99k7kL5u5hoCt4NvQMPi0QMadeLM2kOf3hEpEhFu84k6kWbZVOpUy5Lx
 9pmhTWfQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVYdZ-008sZV-Hj; Tue, 06 Sep 2022 16:29:09 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 8/8] drm/tegra: Add Tegra234 support to NVDEC driver
Date: Tue,  6 Sep 2022 16:28:23 +0300
Message-Id: <20220906132823.2390953-9-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220906132823.2390953-1-cyndis@kapsi.fi>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add support for the Tegra234 version of NVDEC to the NVDEC driver.
This version sports a RISC-V controller and requires a few additional
clocks. After firmware has been loaded, the behavior is, however,
backwards compatible.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c   |   1 +
 drivers/gpu/drm/tegra/nvdec.c | 140 ++++++++++++++++++++++++++++++----
 2 files changed, 126 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6748ec1e0005..a014f11e9edb 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1382,6 +1382,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra194-vic", },
 	{ .compatible = "nvidia,tegra194-nvdec", },
 	{ .compatible = "nvidia,tegra234-vic", },
+	{ .compatible = "nvidia,tegra234-nvdec", },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 05af4d107421..10fd21517281 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -16,18 +17,21 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include <soc/tegra/pmc.h>
+#include <soc/tegra/mc.h>
 
 #include "drm.h"
 #include "falcon.h"
+#include "riscv.h"
 #include "vic.h"
 
+#define NVDEC_FALCON_DEBUGINFO			0x1094
 #define NVDEC_TFBIF_TRANSCFG			0x2c44
 
 struct nvdec_config {
 	const char *firmware;
 	unsigned int version;
 	bool supports_sid;
+	bool has_riscv;
 	bool has_extra_clocks;
 };
 
@@ -40,9 +44,14 @@ struct nvdec {
 	struct device *dev;
 	struct clk_bulk_data clks[3];
 	unsigned int num_clks;
+	struct reset_control *reset;
 
 	/* Platform configuration */
 	const struct nvdec_config *config;
+
+	/* RISC-V specific data */
+	struct tegra_drm_riscv riscv;
+	phys_addr_t carveout_base;
 };
 
 static inline struct nvdec *to_nvdec(struct tegra_drm_client *client)
@@ -56,7 +65,7 @@ static inline void nvdec_writel(struct nvdec *nvdec, u32 value,
 	writel(value, nvdec->regs + offset);
 }
 
-static int nvdec_boot(struct nvdec *nvdec)
+static int nvdec_boot_falcon(struct nvdec *nvdec)
 {
 #ifdef CONFIG_IOMMU_API
 	struct iommu_fwspec *spec = dev_iommu_fwspec_get(nvdec->dev);
@@ -92,6 +101,64 @@ static int nvdec_boot(struct nvdec *nvdec)
 	return 0;
 }
 
+static int nvdec_wait_debuginfo(struct nvdec *nvdec, const char *phase)
+{
+	int err;
+	u32 val;
+
+	err = readl_poll_timeout(nvdec->regs + NVDEC_FALCON_DEBUGINFO, val, val == 0x0, 10, 100000);
+	if (err) {
+		dev_err(nvdec->dev, "failed to boot %s, debuginfo=0x%x\n", phase, val);
+		return err;
+	}
+
+	return 0;
+}
+
+static int nvdec_boot_riscv(struct nvdec *nvdec)
+{
+	int err;
+
+	err = reset_control_acquire(nvdec->reset);
+	if (err)
+		return err;
+
+	nvdec_writel(nvdec, 0xabcd1234, NVDEC_FALCON_DEBUGINFO);
+
+	err = tegra_drm_riscv_boot_bootrom(&nvdec->riscv, nvdec->carveout_base, 1,
+					   &nvdec->riscv.bl_desc);
+	if (err) {
+		dev_err(nvdec->dev, "failed to execute bootloader\n");
+		goto release_reset;
+	}
+
+	err = nvdec_wait_debuginfo(nvdec, "bootloader");
+	if (err)
+		goto release_reset;
+
+	err = reset_control_reset(nvdec->reset);
+	if (err)
+		goto release_reset;
+
+	nvdec_writel(nvdec, 0xabcd1234, NVDEC_FALCON_DEBUGINFO);
+
+	err = tegra_drm_riscv_boot_bootrom(&nvdec->riscv, nvdec->carveout_base, 1,
+					   &nvdec->riscv.os_desc);
+	if (err) {
+		dev_err(nvdec->dev, "failed to execute firmware\n");
+		goto release_reset;
+	}
+
+	err = nvdec_wait_debuginfo(nvdec, "firmware");
+	if (err)
+		goto release_reset;
+
+release_reset:
+	reset_control_release(nvdec->reset);
+
+	return err;
+}
+
 static int nvdec_init(struct host1x_client *client)
 {
 	struct tegra_drm_client *drm = host1x_to_drm_client(client);
@@ -191,7 +258,7 @@ static const struct host1x_client_ops nvdec_client_ops = {
 	.exit = nvdec_exit,
 };
 
-static int nvdec_load_firmware(struct nvdec *nvdec)
+static int nvdec_load_falcon_firmware(struct nvdec *nvdec)
 {
 	struct host1x_client *client = &nvdec->client.base;
 	struct tegra_drm *tegra = nvdec->client.drm;
@@ -254,7 +321,6 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
 	return err;
 }
 
-
 static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
@@ -266,13 +332,19 @@ static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 
 	usleep_range(10, 20);
 
-	err = nvdec_load_firmware(nvdec);
-	if (err < 0)
-		goto disable;
+	if (nvdec->config->has_riscv) {
+		err = nvdec_boot_riscv(nvdec);
+		if (err < 0)
+			goto disable;
+	} else {
+		err = nvdec_load_falcon_firmware(nvdec);
+		if (err < 0)
+			goto disable;
 
-	err = nvdec_boot(nvdec);
-	if (err < 0)
-		goto disable;
+		err = nvdec_boot_falcon(nvdec);
+		if (err < 0)
+			goto disable;
+	}
 
 	return 0;
 
@@ -348,10 +420,18 @@ static const struct nvdec_config nvdec_t194_config = {
 	.supports_sid = true,
 };
 
+static const struct nvdec_config nvdec_t234_config = {
+	.version = 0x23,
+	.supports_sid = true,
+	.has_riscv = true,
+	.has_extra_clocks = true,
+};
+
 static const struct of_device_id tegra_nvdec_of_match[] = {
 	{ .compatible = "nvidia,tegra210-nvdec", .data = &nvdec_t210_config },
 	{ .compatible = "nvidia,tegra186-nvdec", .data = &nvdec_t186_config },
 	{ .compatible = "nvidia,tegra194-nvdec", .data = &nvdec_t194_config },
+	{ .compatible = "nvidia,tegra234-nvdec", .data = &nvdec_t234_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_nvdec_of_match);
@@ -410,12 +490,42 @@ static int nvdec_probe(struct platform_device *pdev)
 	if (err < 0)
 		host_class = HOST1X_CLASS_NVDEC;
 
-	nvdec->falcon.dev = dev;
-	nvdec->falcon.regs = nvdec->regs;
+	if (nvdec->config->has_riscv) {
+		struct tegra_mc *mc;
 
-	err = falcon_init(&nvdec->falcon);
-	if (err < 0)
-		return err;
+		mc = devm_tegra_memory_controller_get(dev);
+		if (IS_ERR(mc)) {
+			dev_err_probe(dev, PTR_ERR(mc),
+				"failed to get memory controller handle\n");
+			return PTR_ERR(mc);
+		}
+
+		err = tegra_mc_get_carveout_info(mc, 1, &nvdec->carveout_base, NULL);
+		if (err) {
+			dev_err(dev, "failed to get carveout info: %d\n", err);
+			return err;
+		}
+
+		nvdec->reset = devm_reset_control_get_exclusive_released(dev, "nvdec");
+		if (IS_ERR(nvdec->reset)) {
+			dev_err_probe(dev, PTR_ERR(nvdec->reset), "failed to get reset\n");
+			return PTR_ERR(nvdec->reset);
+		}
+
+		nvdec->riscv.dev = dev;
+		nvdec->riscv.regs = nvdec->regs;
+
+		err = tegra_drm_riscv_read_descriptors(&nvdec->riscv);
+		if (err < 0)
+			return err;
+	} else {
+		nvdec->falcon.dev = dev;
+		nvdec->falcon.regs = nvdec->regs;
+
+		err = falcon_init(&nvdec->falcon);
+		if (err < 0)
+			return err;
+	}
 
 	platform_set_drvdata(pdev, nvdec);
 
-- 
2.37.0

