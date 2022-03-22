Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB0B4E376E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 04:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257B410E507;
	Tue, 22 Mar 2022 03:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC67210E046;
 Tue, 22 Mar 2022 03:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647919650; x=1679455650;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=5oVRZuucaffVlCcq38pjgMlQwwxBCMH83akkiqAngfI=;
 b=gBB8+0x+xqlrSGo/gDZ0zWYXwlfcNWDoDFg92KOIJQXkcJ8DJFbI9Lcm
 LvMiGkAveMw6oVqPHB2CEOSHF6a9eJ7r9UyWE38xiads2w4S2urK7Pqk3
 8A49IHQ/7u5lfjuLmPpBKQQmeaOwXPX0v9P1Cm4izcyo1eyDWDYC/K+lw k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 20:27:30 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Mar 2022 20:27:28 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 22 Mar 2022 08:57:13 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 2E7BD34EC; Tue, 22 Mar 2022 08:57:13 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Date: Tue, 22 Mar 2022 08:57:07 +0530
Message-Id: <1647919631-14447-2-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set mdp clock to max clock rate during probe/bind sequence from the
opp table so that rails are not at undetermined state. Since we do not
know what will be the rate set in boot loader, it would be ideal to
vote at max frequency. There could be a firmware display programmed
in bootloader and we want to transition it to kernel without underflowing.
The clock will be scaled down later when framework sends an update.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c..9c346ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1202,7 +1202,9 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *ddev = priv->dev;
 	struct dpu_kms *dpu_kms;
+	struct dev_pm_opp *opp;
 	int ret = 0;
+	unsigned long max_freq = ULONG_MAX;
 
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
@@ -1225,6 +1227,12 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	}
 	dpu_kms->num_clocks = ret;
 
+	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
+	if (!IS_ERR(opp))
+		dev_pm_opp_put(opp);
+
+	dev_pm_opp_set_rate(dev, max_freq);
+
 	platform_set_drvdata(pdev, dpu_kms);
 
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
-- 
2.7.4

