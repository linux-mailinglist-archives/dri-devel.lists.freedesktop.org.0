Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9BCD3572
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 19:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6010E31B;
	Sat, 20 Dec 2025 18:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="YxRCapuL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADA110E317
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 18:51:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766256646; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k+ps33RBoTWzNAlrymFBqhrJ55XvdVPAT3xq+aTba7zUdV7Z+/k3sFXbqkjStnwU3fKC4DLCfbfstyss83JbuvavywOY0EcDg3VIAPGHH3hBOKeMPjfB6xGPa73x19e+tvR3/xrJ+igMvn99fS524VdlG+VU1mvIh/aMxVQmBqA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766256646;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5j17v1GY5ZUui5Rtx97+9pI639Hi6bT0WnwCtzvrtAQ=; 
 b=DXXW5zq0m7GofuoNuxOsUEqA1LuHa4dN/fLdZPkE1PXL79G/77pNl7LEZ5RoXzPQJ6ptLSf8TVX25ws6N8kMHKFepV2GWyZw0sMPwxApZhcmIXUVM2QWGhKoHoqgbAMoxlBJw+mQ0RebKzWb9RnkajGbAmGyL4unhOdY/vuyfHU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766256646; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=5j17v1GY5ZUui5Rtx97+9pI639Hi6bT0WnwCtzvrtAQ=;
 b=YxRCapuLlpcgveZ8ge+9Vt9yL4zoF7BeXltj21O4pBcGxMmo4PKr67dZOWJgacT9
 4LGATQCtFbN3QrbIoPAc5Wyk8dy9fLAHt1gHOZDn198/kWRImzStGT7ic1eIp2BDdU8
 EIaJSJZXXNJaG07RIi1ArCYZ4JYC0mCUo1E3Vuf4=
Received: by mx.zohomail.com with SMTPS id 1766256644626461.8229840632764;
 Sat, 20 Dec 2025 10:50:44 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 20 Dec 2025 19:49:55 +0100
Subject: [PATCH v2 4/4] pmdomain: mediatek: mtk-mfg: Expose shader_present
 as nvmem cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-mt8196-shader-present-v2-4-45b1ff1dfab0@collabora.com>
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

Implement nvmem-provider functionality in mtk-mfg-pmdomain, such that it
can expose its GF_REG_SHADER_PRESENT value in the shared memory as an
nvmem cell for panthor.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index 9bad577b3ae4..3ce6fb74dd53 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/container_of.h>
 #include <linux/iopoll.h>
+#include <linux/nvmem-provider.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -872,6 +873,60 @@ static int mtk_mfg_init_clk_provider(struct mtk_mfg *mfg)
 	return 0;
 }
 
+static int mtk_mfg_read_nvmem(void *priv, unsigned int offset, void *val, size_t bytes)
+{
+	struct mtk_mfg *mfg = priv;
+	u32 *buf = val;
+
+	if (bytes != 4)
+		return -EINVAL;
+
+	if (!mfg->shared_mem)
+		return -ENODEV;
+
+	if (offset + bytes >= mfg->shared_mem_size)
+		return -EINVAL;
+
+	*buf = readl(mfg->shared_mem + offset);
+
+	return 0;
+}
+
+static int mtk_mfg_init_nvmem_provider(struct mtk_mfg *mfg)
+{
+	struct device *dev = &mfg->pdev->dev;
+	struct nvmem_cell_info cell = {};
+	struct nvmem_config config = {};
+	struct nvmem_device *nvdev;
+	int ret;
+
+	config.reg_read = mtk_mfg_read_nvmem;
+	config.dev = dev;
+	config.read_only = true;
+	config.priv = mfg;
+	config.size = 4;
+	config.word_size = 4;
+
+	nvdev = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvdev))
+		return dev_err_probe(dev, PTR_ERR(nvdev), "Couldn't register nvmem provider\n");
+
+	cell.name = "shader-present";
+	cell.offset = GF_REG_SHADER_PRESENT;
+	cell.bytes = 4;
+	cell.np = of_get_child_by_name(dev->of_node, cell.name);
+
+	ret = nvmem_add_one_cell(nvdev, &cell);
+	if (ret) {
+		of_node_put(cell.np);
+		return dev_err_probe(dev, ret, "Couldn't add cell %s\n", cell.name);
+	}
+
+	/* cell.np purposefully not put as nvmem_add_one_cell does not increase refcount */
+
+	return 0;
+}
+
 static int mtk_mfg_probe(struct platform_device *pdev)
 {
 	struct mtk_mfg *mfg;
@@ -984,6 +1039,10 @@ static int mtk_mfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_power_off;
 
+	ret = mtk_mfg_init_nvmem_provider(mfg);
+	if (ret)
+		goto err_power_off;
+
 	ret = of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to add pmdomain provider\n");

-- 
2.52.0

