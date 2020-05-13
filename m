Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D41D10D5
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9436EA02;
	Wed, 13 May 2020 11:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AC56EA02
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:13:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589368431; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YaWILtQCXBApb7m7Gjs+IdwV4BBSRnIHk6AJlhSBbkM=;
 b=gGy+uj2CF8wEZp3IbjNBqkqAlHmvPneBfIrMYMI+ZQuZ8DUASw4LZsTsL2iQrIIvovScVIvD
 Zbj3Sq/fMkSML11tXm/UjSWTkPOmlp0CuyfsGifzT8vJyM8BF0gIr+h2dLU5z8V/hCVJmoA2
 sxV+rX1mMXgAhU2yNIvrP/Ld26Y=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebbd665.7f1f28b3e650-smtp-out-n04;
 Wed, 13 May 2020 11:13:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46278C433F2; Wed, 13 May 2020 11:13:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E2B9C433BA;
 Wed, 13 May 2020 11:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0E2B9C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: viresh.kumar@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org
Subject: [PATCH v5 3/6] drm/msm/dpu: Use OPP API to set clk/perf state
Date: Wed, 13 May 2020 16:42:59 +0530
Message-Id: <1589368382-19607-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589368382-19607-1-git-send-email-rnayak@codeaurora.org>
References: <1589368382-19607-1-git-send-email-rnayak@codeaurora.org>
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
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mka@chromium.org, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some qualcomm platforms DPU needs to express a performance state
requirement on a power domain depending on the clock rates.
Use OPP table from DT to register with OPP framework and use
dev_pm_opp_set_rate() to set the clk/perf state.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org
---
Change in v5: left msm_dss_clk_set_rate() as-is since its used by the DP driver
under review on the lists.

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 11f2beb..fe5717df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -7,6 +7,7 @@
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/mutex.h>
+#include <linux/pm_opp.h>
 #include <linux/sort.h>
 #include <linux/clk.h>
 #include <linux/bitmap.h>
@@ -239,7 +240,7 @@ static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
 		rate = core_clk->max_rate;
 
 	core_clk->rate = rate;
-	return msm_dss_clk_set_rate(core_clk, 1);
+	return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
 }
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ce19f1d..d3a46b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
+#include <linux/pm_opp.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
@@ -1033,11 +1034,23 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	if (!dpu_kms)
 		return -ENOMEM;
 
+	dpu_kms->opp_table = dev_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(dpu_kms->opp_table))
+		return PTR_ERR(dpu_kms->opp_table);
+	/* OPP table is optional */
+	ret = dev_pm_opp_of_add_table(dev);
+	if (!ret) {
+		dpu_kms->has_opp_table = true;
+	} else if (ret != -ENODEV) {
+		dev_err(dev, "invalid OPP table in device tree\n");
+		return ret;
+	}
+
 	mp = &dpu_kms->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
 	if (ret) {
 		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
+		goto err;
 	}
 
 	platform_set_drvdata(pdev, dpu_kms);
@@ -1051,6 +1064,11 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 
 	priv->kms = &dpu_kms->base;
 	return ret;
+err:
+	if (dpu_kms->has_opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(dpu_kms->opp_table);
+	return ret;
 }
 
 static void dpu_unbind(struct device *dev, struct device *master, void *data)
@@ -1065,6 +1083,10 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 
 	if (dpu_kms->rpm_enabled)
 		pm_runtime_disable(&pdev->dev);
+
+	if (dpu_kms->has_opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 }
 
 static const struct component_ops dpu_ops = {
@@ -1090,6 +1112,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
+	/* Drop the performance state vote */
+	dev_pm_opp_set_rate(dev, 0);
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
 	if (rc)
 		DPU_ERROR("clock disable failed rc:%d\n", rc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 211f5de9..2a52e4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -128,6 +128,10 @@ struct dpu_kms {
 
 	struct platform_device *pdev;
 	bool rpm_enabled;
+
+	struct opp_table *opp_table;
+	bool has_opp_table;
+
 	struct dss_module_power mp;
 
 	/* reference count bandwidth requests, so we know when we can
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
