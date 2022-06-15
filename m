Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DF154D395
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 23:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF39E1132CB;
	Wed, 15 Jun 2022 21:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCA01132B3;
 Wed, 15 Jun 2022 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655328143; x=1686864143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rXf3W+dh07s4SGe5yGVreuC8xrJE8Qs2WHhYEqRPyLY=;
 b=eCUiBSFf4t32K2SwiIttbxC7fjwIczdtLjHIDpNWxNNuUgxL8sp3NNX3
 Rpv8R1j2VPOc43Pa8Y1nh9b+I7tLgwb69+8IFQ0wcvu6AFl9LhQhPCNfc
 cQOo67GKHXLmMaB0BKli9c80MlK2OdsKcG3GRW4ijbFM52bn8f/EBx0cu k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jun 2022 14:22:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 14:22:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 14:22:20 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 14:22:20 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/msm/dpu: fix maxlinewidth for writeback block
Date: Wed, 15 Jun 2022 14:22:01 -0700
Message-ID: <1655328122-23619-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655328122-23619-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1655328122-23619-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
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
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Writeback block for sm8250 was using the default maxlinewidth
of 2048. But this is not right as it supports upto 4096.

This should have no effect on most resolutions as we are
still limiting upto maxlinewidth of SSPP for adding the modes.

Fix the maxlinewidth for writeback block on sm8250.

Fixes: 53324b99bd7b ("add writeback blocks to the sm8250 DPU catalog")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 400ebceb56bb..dd7537e32f88 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1285,7 +1285,7 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
  * Writeback blocks config
  *************************************************************/
 #define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
-		__xin_id, vbif_id, _reg, _wb_done_bit) \
+		__xin_id, vbif_id, _reg, _max_linewidth, _wb_done_bit) \
 	{ \
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x2c8, \
@@ -1295,13 +1295,13 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
 	.clk_ctrl = _clk_ctrl, \
 	.xin_id = __xin_id, \
 	.vbif_idx = vbif_id, \
-	.maxlinewidth = DEFAULT_DPU_LINE_WIDTH, \
+	.maxlinewidth = _max_linewidth, \
 	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
 	}
 
 static const struct dpu_wb_cfg sm8250_wb[] = {
 	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
-			VBIF_RT, MDP_SSPP_TOP0_INTR, 4),
+			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
 };
 
 /*************************************************************
-- 
2.7.4

