Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DA4D8744
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4282B10E7A9;
	Mon, 14 Mar 2022 14:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B6810E6F0;
 Mon, 14 Mar 2022 14:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647269238; x=1678805238;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=IhsfA4MbLU1xdZeUDgNxUNg67muwdhcXp/lRtayTpWs=;
 b=stUiehx0pwaVL9SmNDDau33sRI8pUxgo7gqqTdMxykhSnmPJ3Qyb6JnZ
 hh05mEIFfOOjAtzZebxTUNnrtd47udyS2R06JE8h19aPLwaw4lfPZ0OhO
 evXY/dtH3dRZbsoPlxz/ayvuHhn0fbY3ttqw+5DEM+cAe5Sq37gpFpFjA k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 14 Mar 2022 07:47:18 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Mar 2022 07:47:17 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 14 Mar 2022 20:17:02 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 4225E2BC9; Mon, 14 Mar 2022 20:17:01 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Date: Mon, 14 Mar 2022 20:16:53 +0530
Message-Id: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
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

use max clock during probe/bind sequence from the opp table.
The clock will be scaled down when framework sends an update.

Fixes: 25fdd5933("drm/msm: Add SDM845 DPU support")
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
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

