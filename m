Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1A225E64
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 14:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6586E3B8;
	Mon, 20 Jul 2020 12:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5C6E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 12:20:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595247662; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GDx0nZdKB25CRIUyjKxQQDbAK/QAtU1kBJYtFizHoOM=;
 b=U6NVh763AJJHF0G0uqXaENuB2R7gK/movjrc3KkoJ54y77AGeaIrTr/oXX7vguDas74taqId
 q0i1mV5FI9hOt3gC1teRmdMq4neKqgoo59irT7Cqobw/MKAhHpu1T1kdr8+Awm0Q/EPbtX8e
 rtZWUjt9qW79O+r5yN7Vbm5Jehw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f158b89d50c36e729f6a2e1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 12:18:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E649AC433C6; Mon, 20 Jul 2020 12:18:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8710EC433C9;
 Mon, 20 Jul 2020 12:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8710EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH] drm/msm/dpu: dev_pm_opp_put_clkname() only when an opp_table
 exists
Date: Mon, 20 Jul 2020 17:47:56 +0530
Message-Id: <1595247476-12968-1-git-send-email-rnayak@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Its possible that dpu_bind() fails early enough before
dev_pm_opp_set_clkname() is called. In such cases, unconditionally
calling dev_pm_opp_put_clkname() in dpu_unbind() can result in
a crash. Put an additional check so that dev_pm_opp_put_clkname()
is called only when an opp_table exists.

Fixes: aa3950767d05 ("drm/msm/dpu: Use OPP API to set clk/perf state")
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f2bbce4..843a1c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1079,7 +1079,8 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 
 	if (dpu_kms->has_opp_table)
 		dev_pm_opp_of_remove_table(dev);
-	dev_pm_opp_put_clkname(dpu_kms->opp_table);
+	if (dpu_kms->opp_table)
+		dev_pm_opp_put_clkname(dpu_kms->opp_table);
 }
 
 static const struct component_ops dpu_ops = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
