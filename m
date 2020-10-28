Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F329D05F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 15:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5F66E52C;
	Wed, 28 Oct 2020 14:35:47 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4A36E532
 for <dri-devel@freedesktop.org>; Wed, 28 Oct 2020 14:35:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603895745; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/ZGUMfp1A0aHVNO/vay/6ICqzhjKvdAharx01TPBxAI=;
 b=DOk50rMvLnPg2akzHbxHEjQLLrBrCyBH9W0F6EEg104WByYwPmbeISetpugUJyZCtgyxbaYh
 CntUIwmVX3Y3NJWrDZZtvI7D1QjL1wmm1KUce3XsVWy42xBOo/rdNjyqPluIWOEA/wZgTg5f
 V0NWdEWae/3f+l+W0J6zz30ALvo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f9981a7807e82a153aeac86 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 14:35:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D7912C433F0; Wed, 28 Oct 2020 14:35:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E2770C433CB;
 Wed, 28 Oct 2020 14:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2770C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: Implement shutdown callback for adreno
Date: Wed, 28 Oct 2020 20:05:10 +0530
Message-Id: <1603895711-23755-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the shutdown callback for adreno gpu platform device
to safely shutdown it before a system reboot. This helps to avoid
futher transactions from gpu after the smmu is moved to bypass mode.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 58e03b2..87c8b03 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -475,6 +475,11 @@ static int adreno_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void adreno_shutdown(struct platform_device *pdev)
+{
+	pm_runtime_force_suspend(&pdev->dev);
+}
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,adreno-3xx" },
@@ -509,6 +514,7 @@ static const struct dev_pm_ops adreno_pm_ops = {
 static struct platform_driver adreno_driver = {
 	.probe = adreno_probe,
 	.remove = adreno_remove,
+	.shutdown = adreno_shutdown,
 	.driver = {
 		.name = "adreno",
 		.of_match_table = dt_match,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
