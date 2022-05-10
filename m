Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE24C5227DA
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 01:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F41D10E7B5;
	Tue, 10 May 2022 23:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8671D10E68C;
 Tue, 10 May 2022 23:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652226899; x=1683762899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wT2j+jrzjLxbDpBnJ54OaxdGcK+euAabFfLysB78OB4=;
 b=Gw+6pVeeowjRUO6t/6rFCLQWj0q8JIISkCqIVjSLi+uLKriuXCNM0yGB
 0ibiix3XtiquMmd1zgYPInE4ES39LYNSAzayIXzp0fsfI/DcWP33o7ip1
 gwyauQYtcQpXEdcid6fHIyqxWdt0jqFJe5do/HrWp+R5oQneLb8LT8jXU A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 10 May 2022 16:54:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 16:54:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 16:54:58 -0700
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 16:54:57 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dpu: add writeback support for sc7180
Date: Tue, 10 May 2022 16:54:39 -0700
Message-ID: <20220510235439.31916-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add writeback support for sc7180 devices. This has been
validated on sc7180 chromebook using IGT writeback test
suite.

localhost /usr/local/libexec/igt-gpu-tools # ./kms_writeback
Starting subtest: writeback-pixel-formats
Subtest writeback-pixel-formats: SUCCESS (0.001s)
Starting subtest: writeback-invalid-parameters
Subtest writeback-invalid-parameters: SUCCESS (0.004s)
Starting subtest: writeback-fb-id
Subtest writeback-fb-id: SUCCESS (0.009s)
Starting subtest: writeback-check-output
Subtest writeback-check-output: SUCCESS (0.203s)

Adding this will increase IGT coverage on chromebooks and also
allow using writeback functionality for other use-cases as
necessary.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 400ebceb56bb..210becd2a9b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1803,6 +1803,8 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.pingpong = sc7180_pp,
 		.intf_count = ARRAY_SIZE(sc7180_intf),
 		.intf = sc7180_intf,
+		.wb_count = ARRAY_SIZE(sm8250_wb),
+		.wb = sm8250_wb,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-- 
2.35.1

