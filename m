Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9984352BB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546C46E0F3;
	Wed, 20 Oct 2021 18:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1548589F85
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:34:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634754894; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=B2TjKcLNRQ5IG8/kowOe6QFC6qfz68TcGJVbcMH4U3E=;
 b=FiLDRIGefbVEwSckq9o/nskVZirSn5MtNB144rb5kbbfPKghvnE+znmtPaL+zuvAPEsM0X0M
 JI30Pxhd68v4XOgND0W2J8SzErH8AnZ1X2wGtjShtrQ8Z9SDi/hb5X0I41iuIp4wyHOwToIA
 jtyoCc0upuVWLA8m/scOZwGD9G4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6170614d5ca800b6c1883180 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 18:34:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C3118C4360D; Wed, 20 Oct 2021 18:34:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F87FC4338F;
 Wed, 20 Oct 2021 18:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6F87FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jessica Zhang <jesszhan@codeaurora.org>
To: freedreno@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dan.carpenter@oracle.com, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org, nganji@codeaurora.org,
 aravindh@codeaurora.org, abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: [PATCH] drm/msm/dsi: fix wrong type in msm_dsi_host
Date: Wed, 20 Oct 2021 11:34:38 -0700
Message-Id: <20211020183438.32263-1-jesszhan@codeaurora.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Change byte_clk_rate, pixel_clk_rate, esc_clk_rate, and src_clk_rate
from u32 to unsigned long, since clk_get_rate() returns an unsigned long.

Fixes: a6bcddbc2ee1 ("drm/msm: dsi: Handle dual-channel for 6G as well")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c86b5090fae6..20a92cb967d0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -115,16 +115,16 @@ struct msm_dsi_host {
 	struct clk *pixel_clk_src;
 	struct clk *byte_intf_clk;
 
-	u32 byte_clk_rate;
-	u32 pixel_clk_rate;
-	u32 esc_clk_rate;
+	unsigned long byte_clk_rate;
+	unsigned long pixel_clk_rate;
+	unsigned long esc_clk_rate;
 
 	/* DSI v2 specific clocks */
 	struct clk *src_clk;
 	struct clk *esc_clk_src;
 	struct clk *dsi_clk_src;
 
-	u32 src_clk_rate;
+	unsigned long src_clk_rate;
 
 	struct gpio_desc *disp_en_gpio;
 	struct gpio_desc *te_gpio;
@@ -498,10 +498,10 @@ int msm_dsi_runtime_resume(struct device *dev)
 
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 {
-	u32 byte_intf_rate;
+	unsigned long byte_intf_rate;
 	int ret;
 
-	DBG("Set clk rates: pclk=%d, byteclk=%d",
+	DBG("Set clk rates: pclk=%d, byteclk=%lu",
 		msm_host->mode->clock, msm_host->byte_clk_rate);
 
 	ret = dev_pm_opp_set_rate(&msm_host->pdev->dev,
@@ -583,7 +583,7 @@ int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host)
 {
 	int ret;
 
-	DBG("Set clk rates: pclk=%d, byteclk=%d, esc_clk=%d, dsi_src_clk=%d",
+	DBG("Set clk rates: pclk=%d, byteclk=%lu, esc_clk=%lu, dsi_src_clk=%lu",
 		msm_host->mode->clock, msm_host->byte_clk_rate,
 		msm_host->esc_clk_rate, msm_host->src_clk_rate);
 
@@ -673,10 +673,10 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
-static u32 dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	struct drm_display_mode *mode = msm_host->mode;
-	u32 pclk_rate;
+	unsigned long pclk_rate;
 
 	pclk_rate = mode->clock * 1000;
 
@@ -696,7 +696,7 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	u32 pclk_rate = dsi_get_pclk_rate(msm_host, is_bonded_dsi);
+	unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, is_bonded_dsi);
 	u64 pclk_bpp = (u64)pclk_rate * bpp;
 
 	if (lanes == 0) {
@@ -713,7 +713,7 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	msm_host->pixel_clk_rate = pclk_rate;
 	msm_host->byte_clk_rate = pclk_bpp;
 
-	DBG("pclk=%d, bclk=%d", msm_host->pixel_clk_rate,
+	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
 				msm_host->byte_clk_rate);
 
 }
@@ -772,7 +772,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	msm_host->esc_clk_rate = msm_host->byte_clk_rate / esc_div;
 
-	DBG("esc=%d, src=%d", msm_host->esc_clk_rate,
+	DBG("esc=%lu, src=%lu", msm_host->esc_clk_rate,
 		msm_host->src_clk_rate);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

