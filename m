Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51CE528140
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D42D10E8C5;
	Mon, 16 May 2022 10:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ADC10E7B7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dC/cTQo/MJ767nLnh5GC42ACRkqVvW3EbSSHwsx8exs=; b=eWpIEKWn4b6F9NYXDMKPoozdTz
 iYbtZk7lvve0PKLiXxgCOSdtABK1nUYLq2VNvVx2tsPU6ssdoT6NZBykMoqEpBHXHMoeKR4YKWCUw
 Xac3P7g+Q2iUKqUWiOCrtT3aKQgWvU4fTheD+6TsaM7G7r3e4NCbQKO5Q3dfbBrSR5IRRzqhzAhJK
 zed2XtB2SC9hs21ijIry5O7IxtshMX1Baz+2o1vAIRKDOYSPVo7Q7sf5o6hNLzQHjnx6iei0pUNim
 EivaIwxq0e7p/1bTXiXDN788XM7XSCbXVXE5yVZSK9KBrg53zcFqMZTAXyBU6uJsG5aOhLIcx+HmA
 O1t3GZWA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXYf-0005yU-CT; Mon, 16 May 2022 13:02:33 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Subject: [PATCH v1 05/13] gpu: host1x: Simplify register mapping and add
 common aperture
Date: Mon, 16 May 2022 13:02:05 +0300
Message-Id: <20220516100213.1536571-6-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Refactor 'regs' property loading using devm_platform_ioremap_*
and add loading of the 'common' region found on Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 46 +++++++++++++++++-----------------------
 drivers/gpu/host1x/dev.h |  3 +++
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 89cc79a48eab..8c6ce8014c09 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -40,6 +40,11 @@
 #include "hw/host1x06.h"
 #include "hw/host1x07.h"
 
+void host1x_common_writel(struct host1x *host1x, u32 v, u32 r)
+{
+	writel(v, host1x->common_regs + r);
+}
+
 void host1x_hypervisor_writel(struct host1x *host1x, u32 v, u32 r)
 {
 	writel(v, host1x->hv_regs + r);
@@ -412,7 +417,6 @@ static int host1x_get_resets(struct host1x *host)
 static int host1x_probe(struct platform_device *pdev)
 {
 	struct host1x *host;
-	struct resource *regs, *hv_regs = NULL;
 	int syncpt_irq;
 	int err;
 
@@ -423,25 +427,23 @@ static int host1x_probe(struct platform_device *pdev)
 	host->info = of_device_get_match_data(&pdev->dev);
 
 	if (host->info->has_hypervisor) {
-		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vm");
-		if (!regs) {
-			dev_err(&pdev->dev, "failed to get vm registers\n");
-			return -ENXIO;
-		}
+		host->regs = devm_platform_ioremap_resource_byname(pdev, "vm");
+		if (IS_ERR(host->regs))
+			return PTR_ERR(host->regs);
+
+		host->hv_regs = devm_platform_ioremap_resource_byname(pdev, "hypervisor");
+		if (IS_ERR(host->hv_regs))
+			return PTR_ERR(host->hv_regs);
 
-		hv_regs = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						       "hypervisor");
-		if (!hv_regs) {
-			dev_err(&pdev->dev,
-				"failed to get hypervisor registers\n");
-			return -ENXIO;
+		if (host->info->has_common) {
+			host->common_regs = devm_platform_ioremap_resource_byname(pdev, "common");
+			if (IS_ERR(host->common_regs))
+				return PTR_ERR(host->common_regs);
 		}
 	} else {
-		regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!regs) {
-			dev_err(&pdev->dev, "failed to get registers\n");
-			return -ENXIO;
-		}
+		host->regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(host->regs))
+			return PTR_ERR(host->regs);
 	}
 
 	syncpt_irq = platform_get_irq(pdev, 0);
@@ -456,16 +458,6 @@ static int host1x_probe(struct platform_device *pdev)
 	/* set common host1x device data */
 	platform_set_drvdata(pdev, host);
 
-	host->regs = devm_ioremap_resource(&pdev->dev, regs);
-	if (IS_ERR(host->regs))
-		return PTR_ERR(host->regs);
-
-	if (host->info->has_hypervisor) {
-		host->hv_regs = devm_ioremap_resource(&pdev->dev, hv_regs);
-		if (IS_ERR(host->hv_regs))
-			return PTR_ERR(host->hv_regs);
-	}
-
 	host->dev->dma_parms = &host->dma_parms;
 	dma_set_max_seg_size(host->dev, UINT_MAX);
 
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 7552a4554534..85edcc6e0fc7 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -100,6 +100,7 @@ struct host1x_info {
 	u64 dma_mask; /* mask of addressable memory */
 	bool has_wide_gather; /* supports GATHER_W opcode */
 	bool has_hypervisor; /* has hypervisor registers */
+	bool has_common; /* has common registers separate from hypervisor */
 	unsigned int num_sid_entries;
 	const struct host1x_sid_entry *sid_table;
 	/*
@@ -115,6 +116,7 @@ struct host1x {
 
 	void __iomem *regs;
 	void __iomem *hv_regs; /* hypervisor region */
+	void __iomem *common_regs;
 	struct host1x_syncpt *syncpt;
 	struct host1x_syncpt_base *bases;
 	struct device *dev;
@@ -156,6 +158,7 @@ struct host1x {
 	struct host1x_bo_cache cache;
 };
 
+void host1x_common_writel(struct host1x *host1x, u32 v, u32 r);
 void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
 u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
 void host1x_sync_writel(struct host1x *host1x, u32 r, u32 v);
-- 
2.36.1

