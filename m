Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242B5BDF7C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 10:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D0510E39E;
	Tue, 20 Sep 2022 08:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2820510E398
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cC12j9P8ru5KBXVnbrH+bmEMVgxfMYkSNhABeawipyA=; b=lvuhEPUQpr7SKTTC7j05rgcgYo
 kxksYdBNa1PkgKemzFZ/q4YjcsY3DcQJ/1Y0iTQdXCal8EaSaB1Jici+UeQPcLtXTjsWxLZ8v7n1a
 1NNXq8tke0z4Vy+Nz7ersJrlMiMBxY0lYvQt9T50ju/16PNemIVH1ha6IO7R4LGfgoQCHAaHZUguM
 ateW9gfbJs1YMqx80LhIl02oG7lVzC0g5XFklglRQ5DtHI7Xns3aRGRWRHKcbmsGWbgY1HFly9rY1
 Sle6+OU91w96DPWUJv422VtJsZWw7Juv73hCWa4uo2WFd30zkrhdI8/WhdoBreIuXf4NRlGApMmZ3
 NwLAjOcg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oaYMp-0017q3-EU; Tue, 20 Sep 2022 11:12:31 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v3 6/8] drm/tegra: nvdec: Support multiple clocks
Date: Tue, 20 Sep 2022 11:12:01 +0300
Message-Id: <20220920081203.3237744-7-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220920081203.3237744-1-cyndis@kapsi.fi>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
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

NVDEC on Tegra234 requires multiple clocks. Add support for that.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 276fe0472730..05af4d107421 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015-2021, NVIDIA Corporation.
+ * Copyright (c) 2015-2022, NVIDIA Corporation.
  */
 
 #include <linux/clk.h>
@@ -28,6 +28,7 @@ struct nvdec_config {
 	const char *firmware;
 	unsigned int version;
 	bool supports_sid;
+	bool has_extra_clocks;
 };
 
 struct nvdec {
@@ -37,7 +38,8 @@ struct nvdec {
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
 	struct device *dev;
-	struct clk *clk;
+	struct clk_bulk_data clks[3];
+	unsigned int num_clks;
 
 	/* Platform configuration */
 	const struct nvdec_config *config;
@@ -258,7 +260,7 @@ static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 	int err;
 
-	err = clk_prepare_enable(nvdec->clk);
+	err = clk_bulk_prepare_enable(nvdec->num_clks, nvdec->clks);
 	if (err < 0)
 		return err;
 
@@ -275,7 +277,7 @@ static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 	return 0;
 
 disable:
-	clk_disable_unprepare(nvdec->clk);
+	clk_bulk_disable_unprepare(nvdec->num_clks, nvdec->clks);
 	return err;
 }
 
@@ -285,7 +287,7 @@ static __maybe_unused int nvdec_runtime_suspend(struct device *dev)
 
 	host1x_channel_stop(nvdec->channel);
 
-	clk_disable_unprepare(nvdec->clk);
+	clk_bulk_disable_unprepare(nvdec->num_clks, nvdec->clks);
 
 	return 0;
 }
@@ -383,13 +385,22 @@ static int nvdec_probe(struct platform_device *pdev)
 	if (IS_ERR(nvdec->regs))
 		return PTR_ERR(nvdec->regs);
 
-	nvdec->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(nvdec->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(nvdec->clk);
+	nvdec->clks[0].id = "nvdec";
+	nvdec->num_clks = 1;
+
+	if (nvdec->config->has_extra_clocks) {
+		nvdec->num_clks = 3;
+		nvdec->clks[1].id = "fuse";
+		nvdec->clks[2].id = "tsec_pka";
+	}
+
+	err = devm_clk_bulk_get(dev, nvdec->num_clks, nvdec->clks);
+	if (err) {
+		dev_err(&pdev->dev, "failed to get clock(s)\n");
+		return err;
 	}
 
-	err = clk_set_rate(nvdec->clk, ULONG_MAX);
+	err = clk_set_rate(nvdec->clks[0].clk, ULONG_MAX);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to set clock rate\n");
 		return err;
-- 
2.37.0

