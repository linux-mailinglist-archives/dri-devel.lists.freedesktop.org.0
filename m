Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2DB7FFEB9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 23:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CC910E062;
	Thu, 30 Nov 2023 22:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA8610E062;
 Thu, 30 Nov 2023 22:48:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AULknpO032003; Thu, 30 Nov 2023 22:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=A3SdIOwkp+raoZKeD++WfooMkWxcrdLVxMc2AMfPLs8=;
 b=eeKd4MA2C7XXmEXgfs7uuACbtCLlKqAM730dQlvyyuyMv7pjmNyTbB7sEtwBzGCJAMNj
 NwFtJaHJWtZPYQDvGteiZdE4LP0C78ea1F724mu5SFfTS7fOogtoZy8bX3Bjl8jODfHg
 b6OicAMngNnuOsXojbJ7orJDP1Qinvo+cRqXqfcvpbqSUA5zUiUdzuor7nx21F20CzuL
 lcg4gzZCEX7W2bQhvwWbAqEIk4JKVUb+o/hJ1w8SBJKiJquYURCwIFsNNojhYjX+9NbE
 j9BYdgChIW5Ovn2vF+yztSmsBTJopdFIA8SXrYmp/YO4nM4CqleJa85EaFqceR1XCyDU 1w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq2kp83xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 22:47:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUMlt1X006166
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 22:47:55 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 14:47:54 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3] drm/msm/dpu: Capture dpu snapshot when frame_done_timer
 timeouts
Date: Thu, 30 Nov 2023 14:47:37 -0800
Message-ID: <20231130224740.24383-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ly9GfYG9tBvzHilOahlA_xu6i1AQamog
X-Proofpoint-GUID: ly9GfYG9tBvzHilOahlA_xu6i1AQamog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_22,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 spamscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300168
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
 kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org, Paloma Arellano <quic_parellan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trigger a devcoredump to dump dpu registers and capture the drm atomic
state when the frame_done_timer timeouts.

v2: Optimize the format in which frame_done_timeout_cnt is incremented
v3: Describe parameter frame_done_timeout_cnt in dpu_encoder_virt

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312010225.2OJWLKmA-lkp@intel.com/
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4e..1c3560e1c6252 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -151,6 +151,8 @@ enum dpu_enc_rc_states {
  * @crtc_frame_event_cb:	callback handler for frame event
  * @crtc_frame_event_cb_data:	callback handler private data
  * @frame_done_timeout_ms:	frame done timeout in ms
+ * @frame_done_timeout_cnt:	atomic counter tracking the number of frame
+ * 				done timeouts
  * @frame_done_timer:		watchdog timer for frame done event
  * @disp_info:			local copy of msm_display_info struct
  * @idle_pc_supported:		indicate if idle power collaps is supported
@@ -191,6 +193,7 @@ struct dpu_encoder_virt {
 	void *crtc_frame_event_cb_data;
 
 	atomic_t frame_done_timeout_ms;
+	atomic_t frame_done_timeout_cnt;
 	struct timer_list frame_done_timer;
 
 	struct msm_display_info disp_info;
@@ -1204,6 +1207,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
 
+	atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
+
 	if (disp_info->intf_type == INTF_DP)
 		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
 	else if (disp_info->intf_type == INTF_DSI)
@@ -2115,11 +2120,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
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
@@ -2341,6 +2347,9 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 	DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
 
+	if (atomic_inc_return(&dpu_enc->frame_done_timeout_cnt) == 1)
+		msm_disp_snapshot_state(drm_enc->dev);
+
 	event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
 	dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
@@ -2392,6 +2401,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 		goto fail;
 
 	atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
+	atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-- 
2.39.2

