Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA878FC61
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 13:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A0010E79B;
	Fri,  1 Sep 2023 11:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0710E79B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vaae9RzNE3FL4Gsrihk4ZQIvVZZIGT955vGaddnPSVA=; b=aW+Ice2MA86ZS0kuuTzrVkYBNc
 EnEJswecLYgVUZ5K4+uqyyG8l3WahofIUPi2pTBMMdxRtFDK9p6HjfjVAMWtGiughQSkJzl6lDbm6
 sRt9SJVjQI5dA0WCV/IpmehfFl1IMKidYdfvlDtGn3SK9u8M66x7rB0fXTG3KTttU+qWwfCQ2v4v8
 nezWr4+lI0/9IWSxsXkI8axKJzM17RJnloZHufvWYTJt9CbtRZKZOBuDMvl70om147QP5XvQhKt21
 q/Oq02b9SSxL+dqiRFDNYfhalphJSj9tIfo3JnYqGqm5xToV1DiubnUzl/k1oSJVuJP5ylHeuopIY
 vAOLN/Zg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1qc2Va-008s8J-0M;
 Fri, 01 Sep 2023 14:40:14 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: Syncpoint interrupt sharding
Date: Fri,  1 Sep 2023 14:40:07 +0300
Message-ID: <20230901114008.672433-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Support sharded syncpoint interrupts on Tegra234+. This feature
allows specifying one of eight interrupt lines for each syncpoint
to lower processing latency of syncpoint threshold
interrupts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c        | 28 +++++++++++++++++---
 drivers/gpu/host1x/dev.h        |  3 ++-
 drivers/gpu/host1x/hw/intr_hw.c | 46 ++++++++++++++++++++++++---------
 3 files changed, 60 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 7c6699aed7d2..b22821c81394 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -488,7 +488,7 @@ static int host1x_get_resets(struct host1x *host)
 static int host1x_probe(struct platform_device *pdev)
 {
 	struct host1x *host;
-	int err;
+	int err, i;
 
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
 	if (!host)
@@ -516,9 +516,29 @@ static int host1x_probe(struct platform_device *pdev)
 			return PTR_ERR(host->regs);
 	}
 
-	host->syncpt_irq = platform_get_irq(pdev, 0);
-	if (host->syncpt_irq < 0)
-		return host->syncpt_irq;
+	for (i = 0; i < ARRAY_SIZE(host->syncpt_irqs); i++) {
+		char irq_name[] = "syncptX";
+		sprintf(irq_name, "syncpt%d", i);
+
+		err = platform_get_irq_byname_optional(pdev, irq_name);
+		if (err == -ENXIO)
+			break;
+		if (err < 0)
+			return err;
+
+		host->syncpt_irqs[i] = err;
+	}
+
+	host->num_syncpt_irqs = i;
+
+	/* Device tree without irq names */
+	if (i == 0) {
+		host->syncpt_irqs[0] = platform_get_irq(pdev, 0);
+		if (host->syncpt_irqs[0] < 0)
+			return host->syncpt_irqs[0];
+
+		host->num_syncpt_irqs = 1;
+	}
 
 	mutex_init(&host->devices_lock);
 	INIT_LIST_HEAD(&host->devices);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 75de50fe03d0..c8e302de7625 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -124,7 +124,8 @@ struct host1x {
 	void __iomem *regs;
 	void __iomem *hv_regs; /* hypervisor region */
 	void __iomem *common_regs;
-	int syncpt_irq;
+	int syncpt_irqs[8];
+	int num_syncpt_irqs;
 	struct host1x_syncpt *syncpt;
 	struct host1x_syncpt_base *bases;
 	struct device *dev;
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index b915ef7d0348..9880e0c47235 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -13,13 +13,20 @@
 #include "../intr.h"
 #include "../dev.h"
 
+struct host1x_intr_irq_data {
+	struct host1x *host;
+	u32 offset;
+};
+
 static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
 {
-	struct host1x *host = dev_id;
+	struct host1x_intr_irq_data *irq_data = dev_id;
+	struct host1x *host = irq_data->host;
 	unsigned long reg;
 	unsigned int i, id;
 
-	for (i = 0; i < DIV_ROUND_UP(host->info->nb_pts, 32); i++) {
+	for (i = irq_data->offset; i < DIV_ROUND_UP(host->info->nb_pts, 32);
+	     i += host->num_syncpt_irqs) {
 		reg = host1x_sync_readl(host,
 			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
 
@@ -67,26 +74,41 @@ static void intr_hw_init(struct host1x *host, u32 cpm)
 
 	/*
 	 * Program threshold interrupt destination among 8 lines per VM,
-	 * per syncpoint. For now, just direct all to the first interrupt
-	 * line.
+	 * per syncpoint. For each group of 32 syncpoints (corresponding to one
+	 * interrupt status register), direct to one interrupt line, going
+	 * around in a round robin fashion.
 	 */
-	for (id = 0; id < host->info->nb_pts; id++)
-		host1x_sync_writel(host, 0, HOST1X_SYNC_SYNCPT_INTR_DEST(id));
+	for (id = 0; id < host->info->nb_pts; id++) {
+		u32 reg_offset = id / 32;
+		u32 irq_index = reg_offset % host->num_syncpt_irqs;
+
+		host1x_sync_writel(host, irq_index, HOST1X_SYNC_SYNCPT_INTR_DEST(id));
+	}
 #endif
 }
 
 static int
 host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
 {
-	int err;
+	int err, i;
+	struct host1x_intr_irq_data *irq_data;
+
+	irq_data = devm_kcalloc(host->dev, host->num_syncpt_irqs, sizeof(irq_data[0]), GFP_KERNEL);
+	if (!irq_data)
+		return -ENOMEM;
 
 	host1x_hw_intr_disable_all_syncpt_intrs(host);
 
-	err = devm_request_irq(host->dev, host->syncpt_irq,
-			       syncpt_thresh_isr, IRQF_SHARED,
-			       "host1x_syncpt", host);
-	if (err < 0)
-		return err;
+	for (i = 0; i < host->num_syncpt_irqs; i++) {
+		irq_data[i].host = host;
+		irq_data[i].offset = i;
+
+		err = devm_request_irq(host->dev, host->syncpt_irqs[i],
+				       syncpt_thresh_isr, IRQF_SHARED,
+				       "host1x_syncpt", &irq_data[i]);
+		if (err < 0)
+			return err;
+	}
 
 	intr_hw_init(host, cpm);
 
-- 
2.41.0

