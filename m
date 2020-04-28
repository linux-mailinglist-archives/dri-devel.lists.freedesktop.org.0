Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CD71BBFC9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04E16E444;
	Tue, 28 Apr 2020 13:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793706E444
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:39:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588081147; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=pPJvnA6dYbYd5jjnGYTz8FPL2asvlvhulCagKLHtD7s=;
 b=U2Ww2Xf9X+EKMY+QV3WAiVMzVjNfjQs8RUblwVpQTqlIUFArC6N0uS67cLwzK86qx6jtFU59
 gVeCkS4JdMBWj7W99adx37dkuReeyCwlim5Wc37ksdjGddnd+uFGs7jQMq8SX7p9a7OpLEO1
 OG0wA6ZVi/phmBj3Z3yXL5nzVtQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea831f9.7f1f2a06f030-smtp-out-n04;
 Tue, 28 Apr 2020 13:39:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 19A07C44791; Tue, 28 Apr 2020 13:39:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 04CA4C433CB;
 Tue, 28 Apr 2020 13:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04CA4C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: viresh.kumar@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org
Subject: [PATCH v3 06/17] drm/msm: dsi: Use OPP API to set clk/perf state
Date: Tue, 28 Apr 2020 19:02:54 +0530
Message-Id: <1588080785-6812-7-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mka@chromium.org, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On SDM845 DSI needs to express a perforamnce state
requirement on a power domain depending on the clock rates.
Use OPP table from DT to register with OPP framework and use
dev_pm_opp_set_rate() to set the clk/perf state.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  |  4 +--
 drivers/gpu/drm/msm/dsi/dsi_host.c | 58 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 4de771d..ba7583c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -180,10 +180,12 @@ int msm_dsi_runtime_suspend(struct device *dev);
 int msm_dsi_runtime_resume(struct device *dev);
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
 int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
+int dsi_link_clk_set_rate_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
 void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
 void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
+void dsi_link_clk_disable_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
 int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
 void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 813d69d..773c4fe 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -210,9 +210,9 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_host_ops = {
 };
 
 static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
-	.link_clk_set_rate = dsi_link_clk_set_rate_6g,
+	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2,
 	.link_clk_enable = dsi_link_clk_enable_6g,
-	.link_clk_disable = dsi_link_clk_disable_6g,
+	.link_clk_disable = dsi_link_clk_disable_6g_v2,
 	.clk_init_ver = dsi_clk_init_6g_v2,
 	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
 	.tx_buf_get = dsi_tx_buf_get_6g,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 11ae5b8..3844fdc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -14,6 +14,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_opp.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
@@ -111,6 +112,9 @@ struct msm_dsi_host {
 	struct clk *pixel_clk_src;
 	struct clk *byte_intf_clk;
 
+	struct opp_table *opp_table;
+	bool has_opp_table;
+
 	u32 byte_clk_rate;
 	u32 pixel_clk_rate;
 	u32 esc_clk_rate;
@@ -537,6 +541,38 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
+int dsi_link_clk_set_rate_6g_v2(struct msm_dsi_host *msm_host)
+{
+	int ret;
+	struct device *dev = &msm_host->pdev->dev;
+
+	DBG("Set clk rates: pclk=%d, byteclk=%d",
+		msm_host->mode->clock, msm_host->byte_clk_rate);
+
+	ret = dev_pm_opp_set_rate(dev, msm_host->byte_clk_rate);
+	if (ret) {
+		pr_err("%s: dev_pm_opp_set_rate failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	ret = clk_set_rate(msm_host->pixel_clk, msm_host->pixel_clk_rate);
+	if (ret) {
+		pr_err("%s: Failed to set rate pixel clk, %d\n", __func__, ret);
+		return ret;
+	}
+
+	if (msm_host->byte_intf_clk) {
+		ret = clk_set_rate(msm_host->byte_intf_clk,
+				   msm_host->byte_clk_rate / 2);
+		if (ret) {
+			pr_err("%s: Failed to set rate byte intf clk, %d\n",
+			       __func__, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
 
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
@@ -665,6 +701,13 @@ void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+void dsi_link_clk_disable_6g_v2(struct msm_dsi_host *msm_host)
+{
+	/* Drop the performance state vote */
+	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
+	dsi_link_clk_disable_6g(msm_host);
+}
+
 void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 {
 	clk_disable_unprepare(msm_host->pixel_clk);
@@ -1879,6 +1922,18 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
+	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "byte");
+	if (IS_ERR(msm_host->opp_table))
+		return PTR_ERR(msm_host->opp_table);
+	/* OPP table is optional */
+	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	if (!ret) {
+		msm_host->has_opp_table = true;
+	} else if (ret != -ENODEV) {
+		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
+		return ret;
+	}
+
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);
 	mutex_init(&msm_host->dev_mutex);
@@ -1904,6 +1959,9 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
 	DBG("");
+	if (msm_host->has_opp_table)
+		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
+	dev_pm_opp_put_clkname(msm_host->opp_table);
 	dsi_tx_buf_free(msm_host);
 	if (msm_host->workqueue) {
 		flush_workqueue(msm_host->workqueue);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
