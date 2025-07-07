Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757CAFB08D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553B910E318;
	Mon,  7 Jul 2025 09:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="nKhuQZle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3F310E318
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DJTmg+WhfK7CgNVvUl2qBtbYazeyB4bBuWMjCQQUljw=; b=nKhuQZleEvyG0SR1w10ngQz4pU
 soNjHDDfGpzJnV0HmdwVlXtsCUnPmc/yihuJ2+7u99keOUcGLCvjkOoF9MxQRTMuFqt/Qdl0S9nRz
 bYugarW1bArLJElUSgaU3g+SBeZJottEun2B0i8yASBrEG/nEKJH3opLw+JotZuxCyFNLzKtZZ9Qe
 sTOZpmObzShKGTvgjP2K83hGuxs/OOQgwuKYVQVjKR3fGMj/pKe0pk7/ppCvnhrI0O1CkFP1cHLDa
 gVHOTwj1s9uJ0Nlpa0uF3koEDdjKsIsHDKQ+yeS6QcY43weMeK3QfODCd9bZGRf1iHVR3TNM8LpC8
 fjq2pDQA==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 (helo=senjougahara.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uYicZ-003up3-2D;
 Mon, 07 Jul 2025 12:58:48 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Mon, 07 Jul 2025 18:58:32 +0900
Subject: [PATCH] gpu: host1x: Syncpoint interrupt performance optimization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-host1x-syncpt-irq-perf-v1-1-16d53e516895@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAEeaa2gC/x3MwQqDMAyA4VeRnA00Finbq4wdnE1nLrVLRJTiu
 694/A7/X8FYhQ2eXQXlXUzW3EB9B/My5S+jxGYY3DC64AIuq210oJ15LhuK/rCwJpzIfSg+PPm
 YoMVFOclxj1/v6/oDGlzGMmgAAAA=
X-Change-ID: 20250707-host1x-syncpt-irq-perf-a10b1d9313df
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Optimize performance of syncpoint interrupt handling by reading
the status register in 64-bit chunks when possible, and skipping
processing when the read value is zero.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c        |  9 +++++++++
 drivers/gpu/host1x/dev.h        |  3 +++
 drivers/gpu/host1x/hw/intr_hw.c | 40 ++++++++++++++++++++++++++++++----------
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0835eac2f713ffcd60a9db8db2c21..80380b6138276877be9709048c15da85d079f977 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -71,6 +71,15 @@ u32 host1x_sync_readl(struct host1x *host1x, u32 r)
 	return readl(sync_regs + r);
 }
 
+#ifdef CONFIG_64BIT
+u64 host1x_sync_readq(struct host1x *host1x, u32 r)
+{
+	void __iomem *sync_regs = host1x->regs + host1x->info->sync_offset;
+
+	return readq(sync_regs + r);
+}
+#endif
+
 void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r)
 {
 	writel(v, ch->regs + r);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index d3855a1c6b472a9bd289c753d79906463e6bcdb4..ef44618ed88a128bae9ab712bf49f8abc0f3b778 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -179,6 +179,9 @@ void host1x_hypervisor_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
 void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r);
 u32 host1x_sync_readl(struct host1x *host1x, u32 r);
+#ifdef CONFIG_64BIT
+u64 host1x_sync_readq(struct host1x *host1x, u32 r);
+#endif
 void host1x_ch_writel(struct host1x_channel *ch, u32 v, u32 r);
 u32 host1x_ch_readl(struct host1x_channel *ch, u32 r);
 
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index 415f8d7e42021b791550ca719adafa088cd34101..fe45890a9bfb1dfcbc0354f76d625e78e72ee548 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -11,26 +11,46 @@
 #include "../intr.h"
 #include "../dev.h"
 
+static void process_32_syncpts(struct host1x *host, u32 val, u32 reg_offset)
+{
+	unsigned int id;
+
+	if (!val)
+		return;
+
+	host1x_sync_writel(host, val, HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(reg_offset));
+	host1x_sync_writel(host, val, HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(reg_offset));
+
+	for_each_set_bit(id, (unsigned long *)&val, 32)
+		host1x_intr_handle_interrupt(host, reg_offset * 32 + id);
+}
+
 static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
 {
 	struct host1x_intr_irq_data *irq_data = dev_id;
 	struct host1x *host = irq_data->host;
 	unsigned long reg;
-	unsigned int i, id;
+	unsigned int i;
 
+#if !defined(CONFIG_64BIT)
 	for (i = irq_data->offset; i < DIV_ROUND_UP(host->info->nb_pts, 32);
 	     i += host->num_syncpt_irqs) {
 		reg = host1x_sync_readl(host,
 			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
 
-		host1x_sync_writel(host, reg,
-			HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(i));
-		host1x_sync_writel(host, reg,
-			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
+		process_32_syncpts(host, reg, i);
+	}
+#else
+	/* All 64-bit capable SoCs have number of syncpoints divisible by 64 */
+	for (i = irq_data->offset; i < DIV_ROUND_UP(host->info->nb_pts, 64);
+	     i += host->num_syncpt_irqs) {
+		reg = host1x_sync_readq(host,
+			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i*2));
 
-		for_each_set_bit(id, &reg, 32)
-			host1x_intr_handle_interrupt(host, i * 32 + id);
+		process_32_syncpts(host, lower_32_bits(reg), i*2+0);
+		process_32_syncpts(host, upper_32_bits(reg), i*2+1);
 	}
+#endif
 
 	return IRQ_HANDLED;
 }
@@ -68,12 +88,12 @@ host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
 
 	/*
 	 * Program threshold interrupt destination among 8 lines per VM,
-	 * per syncpoint. For each group of 32 syncpoints (corresponding to one
-	 * interrupt status register), direct to one interrupt line, going
+	 * per syncpoint. For each group of 64 syncpoints (corresponding to two
+	 * interrupt status registers), direct to one interrupt line, going
 	 * around in a round robin fashion.
 	 */
 	for (id = 0; id < host->info->nb_pts; id++) {
-		u32 reg_offset = id / 32;
+		u32 reg_offset = id / 64;
 		u32 irq_index = reg_offset % host->num_syncpt_irqs;
 
 		host1x_sync_writel(host, irq_index, HOST1X_SYNC_SYNCPT_INTR_DEST(id));

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250707-host1x-syncpt-irq-perf-a10b1d9313df

