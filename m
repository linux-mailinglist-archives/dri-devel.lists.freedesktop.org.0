Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588AC997B63
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 05:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376E810E83E;
	Thu, 10 Oct 2024 03:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SFwT0PtT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F510E83D;
 Thu, 10 Oct 2024 03:41:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bejp006584;
 Thu, 10 Oct 2024 03:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=fYrdB4/WfycN1oxps4sUnN
 zNaq2Ih9iUawmH75fg1ig=; b=SFwT0PtTeXiKBpNAeFi0sy03YIpnqLCuwzjoiX
 lAFlFfAHfgprUXnFRCLhWlvL9hv3cZQCBN0N1DVf/jWsVV/aKWFDDWomQusBRGlo
 DWV3JE7EDZ/joNZeZ8rT3EgvzbM5+I03rf7hGAaMrDwj6uP5Od/WvOrxEaGIILrz
 sHRbfBD66+PunDmJOIGzGd0Swl4GxMbXXn7bRoDOH/7FrtR3CadtcP7BKYiEwzhY
 nsiz9nV5pXlEEYjAiHgQQB/KPHIQ1QC5Mab4QFHY0OkkC/3T3PLw70sOjLClOILP
 Om7AqsU8AmEV4MrRGa23515ld09jSMylHC7jwNmyXeZRcj4Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj070v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 03:41:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A3fSHb021560
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 03:41:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 20:41:28 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 9 Oct 2024 20:41:13 -0700
Subject: [PATCH] drm/msm/dpu: Don't always set merge_3d pending flush
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANhMB2cC/x2MQQqAIBAAvyJ7TnDVi30lOpSutYc0FCIQ/550n
 IGZBpUKU4VZNCj0cOWcBuAkwJ9bOkhyGAxaaYtKOXnlQCbIyK+03nhEGyPtDkZwFxr6ny1r7x/
 Un9L4XAAAAA==
X-Change-ID: 20241009-mode3d-fix-4c3c114ffeb9
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728531688; l=3939;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Y6J43y1bm4oYmPAAl5URkUEdqTZ6Hp2/YqXXEVJdI7c=;
 b=oDYbdcFbDtbkDgf9z7G/1rcUYR2l1oc1E3KbCxWa3i/sfVb0m+WrV5WrZML2oi9oTlyXpmrTB
 Mft34ncN/LEBFtzVLEy1ikFY4BOtkAi3eD3bwwL0YO3iL6tR96y6Unr
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iJMSKF0DvP_KOkIfz9UCW92_jaExW2J5
X-Proofpoint-ORIG-GUID: iJMSKF0DvP_KOkIfz9UCW92_jaExW2J5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100022
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

Don't set the merge_3d pending flush bits if the mode_3d is
BLEND_3D_NONE.

Always flushing merge_3d can cause timeout issues when there are
multiple commits with concurrent writeback enabled.

This is because the video phys enc waits for the hw_ctl flush register
to be completely cleared [1] in its wait_for_commit_done(), but the WB
encoder always sets the merge_3d pending flush during each commit
regardless of if the merge_3d is actually active.

This means that the hw_ctl flush register will never be 0 when there are
multiple CWB commits and the video phys enc will hit vblank timeout
errors after the first CWB commit.

[1] commit fe9df3f50c39 ("drm/msm/dpu: add real wait_for_commit_done()")

Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ba8878d21cf0e1945a393cca806cb64f03b16640..8864ace938e03483492e25734f834fbdd615d127 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -440,10 +440,12 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_ctl *ctl;
 	const struct msm_format *fmt;
 	u32 fmt_fourcc;
+	u32 mode_3d;
 
 	ctl = phys_enc->hw_ctl;
 	fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
 	fmt = mdp_get_format(&phys_enc->dpu_kms->base, fmt_fourcc, 0);
+	mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
@@ -466,7 +468,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		goto skip_flush;
 
 	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
-	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
+	if (mode_3d && ctl->ops.update_pending_flush_merge_3d &&
+	    phys_enc->hw_pp->merge_3d)
 		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
 
 	if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 882c717859cec6dfc4b646200e68a748a5294ac9..07035ab77b792e76c08eb3e18c12a4afddeac902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -275,6 +275,7 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_pingpong *hw_pp;
 	struct dpu_hw_cdm *hw_cdm;
 	u32 pending_flush = 0;
+	u32 mode_3d;
 
 	if (!phys_enc)
 		return;
@@ -283,6 +284,7 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	hw_pp = phys_enc->hw_pp;
 	hw_ctl = phys_enc->hw_ctl;
 	hw_cdm = phys_enc->hw_cdm;
+	mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 
 	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
 
@@ -294,7 +296,8 @@ static void _dpu_encoder_phys_wb_update_flush(struct dpu_encoder_phys *phys_enc)
 	if (hw_ctl->ops.update_pending_flush_wb)
 		hw_ctl->ops.update_pending_flush_wb(hw_ctl, hw_wb->idx);
 
-	if (hw_ctl->ops.update_pending_flush_merge_3d && hw_pp && hw_pp->merge_3d)
+	if (mode_3d && hw_ctl->ops.update_pending_flush_merge_3d &&
+	    hw_pp && hw_pp->merge_3d)
 		hw_ctl->ops.update_pending_flush_merge_3d(hw_ctl,
 				hw_pp->merge_3d->idx);
 

---
base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
change-id: 20241009-mode3d-fix-4c3c114ffeb9

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

