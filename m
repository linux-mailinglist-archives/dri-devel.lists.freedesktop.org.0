Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB354E9BB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822E111A4EB;
	Thu, 16 Jun 2022 19:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8C11A4E2;
 Thu, 16 Jun 2022 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655406111; x=1686942111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=roGI+40BZd/tln2Yb85UFAgrf+HsdV+1G9yDFA3vNzg=;
 b=h49Pezc2MyrmQp8QCow7/UIaJAHUyirhkS6wpavkygytkl8UcwuUNnUU
 Nm+AWnnXbaV1hB6Y1cpXhOeX6hPSvf+BCSQmEEwobEpfsUYr9VtPxOXWz
 yq//cQ2Qv1M032KU0JMucpP9emTGLpBFLc858mEYIwrhBD50+1fALl+AG E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 16 Jun 2022 12:01:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 12:01:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:01:49 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:01:48 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 2/3] drm/msm/dpu: fix maxlinewidth for writeback block
Date: Thu, 16 Jun 2022 12:01:23 -0700
Message-ID: <1655406084-17407-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655406084-17407-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1655406084-17407-1-git-send-email-quic_abhinavk@quicinc.com>
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

changes in v3:
	- correct the Fixes tag

Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog")
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

