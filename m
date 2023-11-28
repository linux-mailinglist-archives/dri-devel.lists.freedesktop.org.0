Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13C7FAF69
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 02:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFE210E31E;
	Tue, 28 Nov 2023 01:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB5510E004;
 Tue, 28 Nov 2023 01:12:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AS0uuH1028511; Tue, 28 Nov 2023 01:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=4O9nT9qrVkrTkIAh9FoKyL3NTb7WlObxESj18pHOOiE=;
 b=fwwgMQpZY6QTyUANzgsNmlGlTJXaoGN7XMIoL6CtYoGma2UevL9CgSj+JIVCKmsTJ8ne
 f+aNbPrZtsi5KKmjhBtB1nrm22ncUW3gvAKUZ5vGGKCjwgSO1qgMxuDUYbKElOlR4NV2
 iQTaVS8HMQlj9ATednmMejCynWt44yRZBas38xJKyIIygNnq3DkpG5kNtGOxRKAOzrPp
 wWCEVMoK8s7II5suWyxIuheoUENolkH75O3w59spy3OYp4mDWFCDN+FFpemmkY/WRAlo
 1fllO4+bxAp93C3LRk9QXPx9iHyu6QhetnK8W7x1OO7/4iGc+u8pw4SWd4s5OrZqbVyj 2w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umwn5sac4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 01:12:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS1C5DT024493
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 01:12:05 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 17:12:04 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dpu: Capture dpu snapshot when frame_done_timer
 timeouts
Date: Mon, 27 Nov 2023 17:11:17 -0800
Message-ID: <20231128011122.14711-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6KAe7elOGMvnSlo6GzDQOLnXgEP8RFjx
X-Proofpoint-GUID: 6KAe7elOGMvnSlo6GzDQOLnXgEP8RFjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280007
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trigger a devcoredump to dump dpu registers and capture the drm atomic
state when the frame_done_timer timeouts.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..5cf7594feb5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -191,6 +191,7 @@ struct dpu_encoder_virt {
 	void *crtc_frame_event_cb_data;
 
 	atomic_t frame_done_timeout_ms;
+	atomic_t frame_done_timeout_cnt;
 	struct timer_list frame_done_timer;
 
 	struct msm_display_info disp_info;
@@ -1204,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
 
+	atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
+
 	if (disp_info->intf_type == INTF_DP)
 		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
 	else if (disp_info->intf_type == INTF_DSI)
@@ -2115,11 +2118,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
+		seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    frame_done_cnt:%d",
 				phys->hw_intf ? phys->hw_intf->idx - INTF_0 : -1,
 				phys->hw_wb ? phys->hw_wb->idx - WB_0 : -1,
 				atomic_read(&phys->vsync_cnt),
-				atomic_read(&phys->underrun_cnt));
+				atomic_read(&phys->underrun_cnt),
+				atomic_read(&dpu_enc->frame_done_timeout_cnt));
 
 		seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
 	}
@@ -2341,6 +2345,10 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 	DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
 
+	atomic_inc(&dpu_enc->frame_done_timeout_cnt);
+	if (atomic_read(&dpu_enc->frame_done_timeout_cnt) == 1)
+		msm_disp_snapshot_state(drm_enc->dev);
+
 	event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
 	dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
@@ -2392,6 +2400,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 		goto fail;
 
 	atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
+	atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-- 
2.41.0

