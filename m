Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC844D1DE6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 17:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259BA10E608;
	Tue,  8 Mar 2022 16:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924410E52C;
 Tue,  8 Mar 2022 16:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646758521; x=1678294521;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Krx54VrV7dlrLmC7GO6l/PqPdu8mz9flBFKLOOJ8Ybs=;
 b=Ug2X7LyVAUw56wNobjGumSpEr337RVIpcgHCBj9Y4D3J0iRJfvs1SM5/
 XWCCdHF1hWp6+WvalzeNNBhlMYnH2BdV5TZdw7D9BsjQ47yhAIQlFaPqW
 /H/KxGtmpV8vC6kxCEJM3fUvh2KsQ0L4r/RYotTJBytdomFWP5s5np9/R 0=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 08 Mar 2022 08:55:20 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 08 Mar 2022 08:55:19 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 08 Mar 2022 22:25:05 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 94A1C53F1; Tue,  8 Mar 2022 22:25:02 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
Date: Tue,  8 Mar 2022 22:25:00 +0530
Message-Id: <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
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
 linux-kernel@vger.kernel.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

use max clock during probe/bind sequence from the opp table.
The clock will be scaled down when framework sends an update.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d550f90..d9922b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1221,6 +1221,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	struct dpu_kms *dpu_kms;
 	struct dss_module_power *mp;
 	int ret = 0;
+	unsigned long max_freq = ULONG_MAX;
 
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
@@ -1243,6 +1244,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	dev_pm_opp_find_freq_floor(dev, &max_freq);
+	dev_pm_opp_set_rate(dev, max_freq);
 	platform_set_drvdata(pdev, dpu_kms);
 
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
-- 
2.7.4

