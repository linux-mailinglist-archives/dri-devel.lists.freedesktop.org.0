Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AD31AAB9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 11:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074956E2ED;
	Sat, 13 Feb 2021 10:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3D6E2ED
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nB61/ZboUU7WKpLyNjcWrA84gtduimiIydHtgNCVxSY=; b=xCkR+xbWKKm1MrM78baQQ0Ax8t
 YUFQP47ONIpMDGF0e0dJR86M/PdEzz6BiIRu5YVKFfx7LII27CCo4y/W9l97u2SFjGD6c6LkTIx+i
 gDJe+8bpN47GfjMuaF0NrUefEkmI0PoBmM9f1I84p5QWbWG3sTb9GlbiJInVsBAui0n8zs4INZH35
 7/qwG93aFi2A4ivfptVUBRj2MVTEDgxXiIUPcKQVyz43KSZz/MdKdq/FxoKGRxYETLUHccv2zZCRl
 tEUaq7NW8RpTRhbrwg/UfHNVd25sGFugYvKo71u1sawlwn1Vq6NHxLuIhMUNOGbJJgGEutIlLLbS5
 UNEqlmAw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lArxe-0002D2-Qn; Sat, 13 Feb 2021 12:15:34 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Subject: [PATCH 3/3] drm/tegra: Add NVDEC driver
Date: Sat, 13 Feb 2021 12:15:12 +0200
Message-Id: <20210213101512.3275069-4-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210213101512.3275069-1-mperttunen@nvidia.com>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for booting and using NVDEC on Tegra210, Tegra186
and Tegra194 to the Host1x and TegraDRM drivers. Booting in
secure mode is not currently supported.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/Makefile |   3 +-
 drivers/gpu/drm/tegra/drm.c    |   4 +
 drivers/gpu/drm/tegra/drm.h    |   1 +
 drivers/gpu/drm/tegra/nvdec.c  | 497 +++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/dev.c       |  12 +
 include/linux/host1x.h         |   1 +
 6 files changed, 517 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 4e3295f436f1..a736bb5e5376 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -24,7 +24,8 @@ tegra-drm-y := \
 	gr2d.o \
 	gr3d.o \
 	falcon.o \
-	vic.o
+	vic.o \
+	nvdec.o
 
 tegra-drm-y += trace.o
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 60eab403ae9b..accc41bff173 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1338,15 +1338,18 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra210-sor", },
 	{ .compatible = "nvidia,tegra210-sor1", },
 	{ .compatible = "nvidia,tegra210-vic", },
+	{ .compatible = "nvidia,tegra210-nvdec", },
 	{ .compatible = "nvidia,tegra186-display", },
 	{ .compatible = "nvidia,tegra186-dc", },
 	{ .compatible = "nvidia,tegra186-sor", },
 	{ .compatible = "nvidia,tegra186-sor1", },
 	{ .compatible = "nvidia,tegra186-vic", },
+	{ .compatible = "nvidia,tegra186-nvdec", },
 	{ .compatible = "nvidia,tegra194-display", },
 	{ .compatible = "nvidia,tegra194-dc", },
 	{ .compatible = "nvidia,tegra194-sor", },
 	{ .compatible = "nvidia,tegra194-vic", },
+	{ .compatible = "nvidia,tegra194-nvdec", },
 	{ /* sentinel */ }
 };
 
@@ -1370,6 +1373,7 @@ static struct platform_driver * const drivers[] = {
 	&tegra_gr2d_driver,
 	&tegra_gr3d_driver,
 	&tegra_vic_driver,
+	&tegra_nvdec_driver,
 };
 
 static int __init host1x_drm_init(void)
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 1af57c2016eb..ba52718a48bd 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -194,5 +194,6 @@ extern struct platform_driver tegra_sor_driver;
 extern struct platform_driver tegra_gr2d_driver;
 extern struct platform_driver tegra_gr3d_driver;
 extern struct platform_driver tegra_vic_driver;
+extern struct platform_driver tegra_nvdec_driver;
 
 #endif /* HOST1X_DRM_H */
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
new file mode 100644
index 000000000000..0b78ee81d01f
--- /dev/null
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015-2021, NVIDIA Corporation.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <soc/tegra/pmc.h>
+
+#include "drm.h"
+#include "falcon.h"
+#include "vic.h"
+
+struct nvdec_config {
+	const char *firmware;
+	unsigned int version;
+	bool supports_sid;
+};
+
+struct nvdec {
+	struct falcon falcon;
+
+	void __iomem *regs;
+	struct tegra_drm_client client;
+	struct host1x_channel *channel;
+	struct device *dev;
+	struct clk *clk;
+	struct reset_control *rst;
+
+	/* Platform configuration */
+	const struct nvdec_config *config;
+};
+
+static inline struct nvdec *to_vic(struct tegra_drm_client *client)
+{
+	return container_of(client, struct nvdec, client);
+}
+
+static void nvdec_writel(struct nvdec *nvdec, u32 value, unsigned int offset)
+{
+	writel(value, nvdec->regs + offset);
+}
+
+static int nvdec_boot(struct nvdec *nvdec)
+{
+#ifdef CONFIG_IOMMU_API
+	struct iommu_fwspec *spec = dev_iommu_fwspec_get(nvdec->dev);
+#endif
+	int err = 0;
+
+#ifdef CONFIG_IOMMU_API
+	if (nvdec->config->supports_sid && spec) {
+		u32 value;
+
+		value = TRANSCFG_ATT(1, TRANSCFG_SID_FALCON) |
+			TRANSCFG_ATT(0, TRANSCFG_SID_HW);
+		nvdec_writel(nvdec, value, VIC_TFBIF_TRANSCFG);
+
+		if (spec->num_ids > 0) {
+			value = spec->ids[0] & 0xffff;
+
+			nvdec_writel(nvdec, value, VIC_THI_STREAMID0);
+			nvdec_writel(nvdec, value, VIC_THI_STREAMID1);
+		}
+	}
+#endif
+
+	err = falcon_boot(&nvdec->falcon);
+	if (err < 0)
+		return err;
+
+	err = falcon_wait_idle(&nvdec->falcon);
+	if (err < 0) {
+		dev_err(nvdec->dev,
+			"failed to set application ID and FCE base\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int nvdec_init(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct nvdec *nvdec = to_vic(drm);
+	int err;
+
+	err = host1x_client_iommu_attach(client);
+	if (err < 0 && err != -ENODEV) {
+		dev_err(nvdec->dev, "failed to attach to domain: %d\n", err);
+		return err;
+	}
+
+	nvdec->channel = host1x_channel_request(client);
+	if (!nvdec->channel) {
+		err = -ENOMEM;
+		goto detach;
+	}
+
+	client->syncpts[0] = host1x_syncpt_request(client, 0);
+	if (!client->syncpts[0]) {
+		err = -ENOMEM;
+		goto free_channel;
+	}
+
+	err = tegra_drm_register_client(tegra, drm);
+	if (err < 0)
+		goto free_syncpt;
+
+	/*
+	 * Inherit the DMA parameters (such as maximum segment size) from the
+	 * parent host1x device.
+	 */
+	client->dev->dma_parms = client->host->dma_parms;
+
+	return 0;
+
+free_syncpt:
+	host1x_syncpt_put(client->syncpts[0]);
+free_channel:
+	host1x_channel_put(nvdec->channel);
+detach:
+	host1x_client_iommu_detach(client);
+
+	return err;
+}
+
+static int nvdec_exit(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct nvdec *nvdec = to_vic(drm);
+	int err;
+
+	/* avoid a dangling pointer just in case this disappears */
+	client->dev->dma_parms = NULL;
+
+	err = tegra_drm_unregister_client(tegra, drm);
+	if (err < 0)
+		return err;
+
+	host1x_syncpt_put(client->syncpts[0]);
+	host1x_channel_put(nvdec->channel);
+	host1x_client_iommu_detach(client);
+
+	if (client->group) {
+		dma_unmap_single(nvdec->dev, nvdec->falcon.firmware.phys,
+				 nvdec->falcon.firmware.size, DMA_TO_DEVICE);
+		tegra_drm_free(tegra, nvdec->falcon.firmware.size,
+			       nvdec->falcon.firmware.virt,
+			       nvdec->falcon.firmware.iova);
+	} else {
+		dma_free_coherent(nvdec->dev, nvdec->falcon.firmware.size,
+				  nvdec->falcon.firmware.virt,
+				  nvdec->falcon.firmware.iova);
+	}
+
+	return 0;
+}
+
+static const struct host1x_client_ops nvdec_client_ops = {
+	.init = nvdec_init,
+	.exit = nvdec_exit,
+};
+
+static int nvdec_load_firmware(struct nvdec *nvdec)
+{
+	struct host1x_client *client = &nvdec->client.base;
+	struct tegra_drm *tegra = nvdec->client.drm;
+	dma_addr_t iova;
+	size_t size;
+	void *virt;
+	int err;
+
+	if (nvdec->falcon.firmware.virt)
+		return 0;
+
+	err = falcon_read_firmware(&nvdec->falcon, nvdec->config->firmware);
+	if (err < 0)
+		return err;
+
+	size = nvdec->falcon.firmware.size;
+
+	if (!client->group) {
+		virt = dma_alloc_coherent(nvdec->dev, size, &iova, GFP_KERNEL);
+
+		err = dma_mapping_error(nvdec->dev, iova);
+		if (err < 0)
+			return err;
+	} else {
+		virt = tegra_drm_alloc(tegra, size, &iova);
+	}
+
+	nvdec->falcon.firmware.virt = virt;
+	nvdec->falcon.firmware.iova = iova;
+
+	err = falcon_load_firmware(&nvdec->falcon);
+	if (err < 0)
+		goto cleanup;
+
+	/*
+	 * In this case we have received an IOVA from the shared domain, so we
+	 * need to make sure to get the physical address so that the DMA API
+	 * knows what memory pages to flush the cache for.
+	 */
+	if (client->group) {
+		dma_addr_t phys;
+
+		phys = dma_map_single(nvdec->dev, virt, size, DMA_TO_DEVICE);
+
+		err = dma_mapping_error(nvdec->dev, phys);
+		if (err < 0)
+			goto cleanup;
+
+		nvdec->falcon.firmware.phys = phys;
+	}
+
+	return 0;
+
+cleanup:
+	if (!client->group)
+		dma_free_coherent(nvdec->dev, size, virt, iova);
+	else
+		tegra_drm_free(tegra, size, virt, iova);
+
+	return err;
+}
+
+
+static int nvdec_runtime_resume(struct device *dev)
+{
+	struct nvdec *nvdec = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(nvdec->clk);
+	if (err < 0)
+		return err;
+
+	usleep_range(10, 20);
+
+	err = reset_control_deassert(nvdec->rst);
+	if (err < 0)
+		goto disable;
+
+	usleep_range(10, 20);
+
+	err = nvdec_load_firmware(nvdec);
+	if (err < 0)
+		goto assert;
+
+	err = nvdec_boot(nvdec);
+	if (err < 0)
+		goto assert;
+
+	return 0;
+
+assert:
+	reset_control_assert(nvdec->rst);
+disable:
+	clk_disable_unprepare(nvdec->clk);
+	return err;
+}
+
+static int nvdec_runtime_suspend(struct device *dev)
+{
+	struct nvdec *nvdec = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_assert(nvdec->rst);
+	if (err < 0)
+		return err;
+
+	usleep_range(2000, 4000);
+
+	clk_disable_unprepare(nvdec->clk);
+
+	return 0;
+}
+
+static int nvdec_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct nvdec *nvdec = to_vic(client);
+	int err;
+
+	err = pm_runtime_get_sync(nvdec->dev);
+	if (err < 0) {
+		pm_runtime_put(nvdec->dev);
+		return err;
+	}
+
+	context->channel = host1x_channel_get(nvdec->channel);
+	if (!context->channel) {
+		pm_runtime_put(nvdec->dev);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void nvdec_close_channel(struct tegra_drm_context *context)
+{
+	struct nvdec *nvdec = to_vic(context->client);
+
+	host1x_channel_put(context->channel);
+	pm_runtime_put(nvdec->dev);
+}
+
+static const struct tegra_drm_client_ops nvdec_ops = {
+	.open_channel = nvdec_open_channel,
+	.close_channel = nvdec_close_channel,
+	.submit = tegra_drm_submit,
+};
+
+#define NVIDIA_TEGRA_210_NVDEC_FIRMWARE "nvidia/tegra210/nvdec.bin"
+
+static const struct nvdec_config nvdec_t210_config = {
+	.firmware = NVIDIA_TEGRA_210_NVDEC_FIRMWARE,
+	.version = 0x21,
+	.supports_sid = false,
+};
+
+#define NVIDIA_TEGRA_186_NVDEC_FIRMWARE "nvidia/tegra186/nvdec.bin"
+
+static const struct nvdec_config nvdec_t186_config = {
+	.firmware = NVIDIA_TEGRA_186_NVDEC_FIRMWARE,
+	.version = 0x18,
+	.supports_sid = true,
+};
+
+#define NVIDIA_TEGRA_194_NVDEC_FIRMWARE "nvidia/tegra194/nvdec.bin"
+
+static const struct nvdec_config nvdec_t194_config = {
+	.firmware = NVIDIA_TEGRA_194_NVDEC_FIRMWARE,
+	.version = 0x19,
+	.supports_sid = true,
+};
+
+static const struct of_device_id tegra_nvdec_of_match[] = {
+	{ .compatible = "nvidia,tegra210-nvdec", .data = &nvdec_t210_config },
+	{ .compatible = "nvidia,tegra186-nvdec", .data = &nvdec_t186_config },
+	{ .compatible = "nvidia,tegra194-nvdec", .data = &nvdec_t194_config },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_nvdec_of_match);
+
+static int nvdec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct host1x_syncpt **syncpts;
+	struct resource *regs;
+	struct nvdec *nvdec;
+	int err;
+
+	/* inherit DMA mask from host1x parent */
+	err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
+	nvdec = devm_kzalloc(dev, sizeof(*nvdec), GFP_KERNEL);
+	if (!nvdec)
+		return -ENOMEM;
+
+	nvdec->config = of_device_get_match_data(dev);
+
+	syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
+	if (!syncpts)
+		return -ENOMEM;
+
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!regs) {
+		dev_err(&pdev->dev, "failed to get registers\n");
+		return -ENXIO;
+	}
+
+	nvdec->regs = devm_ioremap_resource(dev, regs);
+	if (IS_ERR(nvdec->regs))
+		return PTR_ERR(nvdec->regs);
+
+	nvdec->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(nvdec->clk)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		return PTR_ERR(nvdec->clk);
+	}
+
+	if (!dev->pm_domain) {
+		nvdec->rst = devm_reset_control_get(dev, "nvdec");
+		if (IS_ERR(nvdec->rst)) {
+			dev_err(&pdev->dev, "failed to get reset\n");
+			return PTR_ERR(nvdec->rst);
+		}
+	}
+
+	nvdec->falcon.dev = dev;
+	nvdec->falcon.regs = nvdec->regs;
+
+	err = falcon_init(&nvdec->falcon);
+	if (err < 0)
+		return err;
+
+	platform_set_drvdata(pdev, nvdec);
+
+	INIT_LIST_HEAD(&nvdec->client.base.list);
+	nvdec->client.base.ops = &nvdec_client_ops;
+	nvdec->client.base.dev = dev;
+	nvdec->client.base.class = HOST1X_CLASS_NVDEC;
+	nvdec->client.base.syncpts = syncpts;
+	nvdec->client.base.num_syncpts = 1;
+	nvdec->dev = dev;
+
+	INIT_LIST_HEAD(&nvdec->client.list);
+	nvdec->client.version = nvdec->config->version;
+	nvdec->client.ops = &nvdec_ops;
+
+	err = host1x_client_register(&nvdec->client.base);
+	if (err < 0) {
+		dev_err(dev, "failed to register host1x client: %d\n", err);
+		goto exit_falcon;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = nvdec_runtime_resume(&pdev->dev);
+		if (err < 0)
+			goto unregister_client;
+	}
+
+	return 0;
+
+unregister_client:
+	host1x_client_unregister(&nvdec->client.base);
+exit_falcon:
+	falcon_exit(&nvdec->falcon);
+
+	return err;
+}
+
+static int nvdec_remove(struct platform_device *pdev)
+{
+	struct nvdec *nvdec = platform_get_drvdata(pdev);
+	int err;
+
+	err = host1x_client_unregister(&nvdec->client.base);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
+			err);
+		return err;
+	}
+
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
+	else
+		nvdec_runtime_suspend(&pdev->dev);
+
+	falcon_exit(&nvdec->falcon);
+
+	return 0;
+}
+
+static const struct dev_pm_ops nvdec_pm_ops = {
+	SET_RUNTIME_PM_OPS(nvdec_runtime_suspend, nvdec_runtime_resume, NULL)
+};
+
+struct platform_driver tegra_nvdec_driver = {
+	.driver = {
+		.name = "tegra-nvdec",
+		.of_match_table = tegra_nvdec_of_match,
+		.pm = &nvdec_pm_ops
+	},
+	.probe = nvdec_probe,
+	.remove = nvdec_remove,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_210_NVDEC_FIRMWARE);
+#endif
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_186_NVDEC_FIRMWARE);
+#endif
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_194_NVDEC_FIRMWARE);
+#endif
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 8b50fbb22846..121241332876 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -132,6 +132,12 @@ static const struct host1x_sid_entry tegra186_sid_table[] = {
 		.offset = 0x30,
 		.limit = 0x34
 	},
+	{
+		/* NVDEC */
+		.base = 0x1b00,
+		.offset = 0x30,
+		.limit = 0x34
+	},
 };
 
 static const struct host1x_info host1x06_info = {
@@ -156,6 +162,12 @@ static const struct host1x_sid_entry tegra194_sid_table[] = {
 		.offset = 0x30,
 		.limit = 0x34
 	},
+	{
+		/* NVDEC */
+		.base = 0x1b00,
+		.offset = 0x30,
+		.limit = 0x34
+	},
 };
 
 static const struct host1x_info host1x07_info = {
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index a1d9cee8bead..17de9540e18e 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -15,6 +15,7 @@ enum host1x_class {
 	HOST1X_CLASS_GR2D_SB = 0x52,
 	HOST1X_CLASS_VIC = 0x5D,
 	HOST1X_CLASS_GR3D = 0x60,
+	HOST1X_CLASS_NVDEC = 0xF0,
 };
 
 struct host1x;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
