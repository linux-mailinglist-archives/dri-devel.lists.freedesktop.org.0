Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72524219EB2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 13:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B96EA3F;
	Thu,  9 Jul 2020 11:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6016EA3F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 11:05:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594292724; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=HJWdyO0UDBgRKgOYKL4fiuT5Fdu/5iVjgEtgN+UMip4=;
 b=wtSsmHQJ/UgObDmg3KlsTvZG8NaJ/mzaFcJT3JbmAk2JBsZjwb0DoXomKzWn6KPslbav2gi+
 aikahYX28naRPme7cWHyB/q6yFSCasv5wAAEC2FTnauDySLkxs1NuHAkX8HxR8NtJboawUwI
 uGF7VGRaW2s9vrtfb4xNDZ8Lfu8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-west-2.postgun.com with SMTP id
 5f06f9e19b7f1f3df7ea6da6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 11:05:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E2CB9C433C8; Thu,  9 Jul 2020 11:05:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 314D0C433CA;
 Thu,  9 Jul 2020 11:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 314D0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
 bjorn.andersson@linaro.org
Subject: [PATCH v3 2/4] drm/msm: dsi: Use OPP API to set clk/perf state
Date: Thu,  9 Jul 2020 16:34:32 +0530
Message-Id: <1594292674-15632-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
References: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
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
 dri-devel@lists.freedesktop.org, mka@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On SDM845 and SC7180 DSI needs to express a performance state
requirement on a power domain depending on the clock rates.
Use OPP table from DT to register with OPP framework and use
dev_pm_opp_set_rate() to set the clk/perf state.

dev_pm_opp_set_rate() is designed to be equivalent to clk_set_rate()
for devices without an OPP table, hence the change works fine
on devices/platforms which only need to set a clock rate.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 11ae5b8..0a14c4a 100644
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
@@ -512,9 +516,10 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	DBG("Set clk rates: pclk=%d, byteclk=%d",
 		msm_host->mode->clock, msm_host->byte_clk_rate);
 
-	ret = clk_set_rate(msm_host->byte_clk, msm_host->byte_clk_rate);
+	ret = dev_pm_opp_set_rate(&msm_host->pdev->dev,
+				  msm_host->byte_clk_rate);
 	if (ret) {
-		pr_err("%s: Failed to set rate byte clk, %d\n", __func__, ret);
+		pr_err("%s: dev_pm_opp_set_rate failed %d\n", __func__, ret);
 		return ret;
 	}
 
@@ -658,6 +663,8 @@ int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host)
 
 void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
 {
+	/* Drop the performance state vote */
+	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
 	clk_disable_unprepare(msm_host->esc_clk);
 	clk_disable_unprepare(msm_host->pixel_clk);
 	if (msm_host->byte_intf_clk)
@@ -1879,6 +1886,19 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
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
+		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
+		dev_pm_opp_put_clkname(msm_host->opp_table);
+		return ret;
+	}
+
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);
 	mutex_init(&msm_host->dev_mutex);
@@ -1914,6 +1934,9 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	mutex_destroy(&msm_host->cmd_mutex);
 	mutex_destroy(&msm_host->dev_mutex);
 
+	if (msm_host->has_opp_table)
+		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
+	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
