Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED976BE65
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864B010E1D3;
	Tue,  1 Aug 2023 20:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DDE10E03C;
 Tue,  1 Aug 2023 20:18:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 371JgTAn022312; Tue, 1 Aug 2023 20:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=a0p/MjSCdnnI+norp+lu97kipxBFGguYMOyp15l36pg=;
 b=RAOl/jmnEFu3f7UkovV+9WOSZ8MhFAH92f9YcooPa7zXjCL2T5m1KGOqxWI6iaNpbb9l
 vTHDX71IZsCpzHd3Huqu2/XcAE0huBYbLqw26ipKUur9MzKE8kX6MysZjSeZEpsvVHgg
 pbAOcndJkNYFfcuSXnn9u5p8SrENMIhL60cCHJEOOmrxSgpLN2HEdSro9jxMPKzFQL3N
 DGmMVxae5PmgUu3Dmh1u9u6qC7uje3tn7zuyH4a0brBQu9oFeOkX8HhKmddEK9yI3MhW
 Mc27+mm30Am6s66WMnBtOzphIn6IWTSFUyju4+55TziAfg5RBRzWmT3oxsvp0YpP3g7s eA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s6rhat7qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Aug 2023 20:18:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 371KIbbA032629
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 1 Aug 2023 20:18:37 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 1 Aug 2023 13:18:36 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 1 Aug 2023 13:18:06 -0700
Subject: [PATCH] drm/msm/dpu: Drop encoder vsync_event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230801-encoder-cleanup-v1-1-f9e37fe27997@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAH1oyWQC/x3MQQqAIBBA0avErBPUQqurRAsbpxoIDaUIorsnL
 d/i/wcyJaYMQ/VAooszx1Cg6gpwc2Elwb4YtNSNtFoJChg9JYE7uXAeou27zs7aNGgQSnUkWvj
 +j+P0vh95JWCBYQAAAA==
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690921116; l=5791;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=3d2FLpXgq7AuDkp+ZM+kOA1ojk0FyedzifIZ14n9gmM=;
 b=tZjHfuc6pf3o767b7SZdAq6wy2cF6ciSBShQkRdiCN2mqjoYDHsTLf8rypZpYJ+szU/shqvOu
 pQ9aathZuZAADiSs3430+krrzq72sJt6G8iLx1MdpwqvFlr+0w96HLd
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ErUFRHe9WkR8kf5KK9Zq87j5l440I43L
X-Proofpoint-ORIG-GUID: ErUFRHe9WkR8kf5KK9Zq87j5l440I43L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_18,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308010180
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop vsync_event and vsync_event_work handlers as they are unnecessary.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 65 +----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
 2 files changed, 1 insertion(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f0a2a1dca741..d34e684a4178 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -152,7 +152,6 @@ enum dpu_enc_rc_states {
  * @crtc_frame_event_cb_data:	callback handler private data
  * @frame_done_timeout_ms:	frame done timeout in ms
  * @frame_done_timer:		watchdog timer for frame done event
- * @vsync_event_timer:		vsync timer
  * @disp_info:			local copy of msm_display_info struct
  * @idle_pc_supported:		indicate if idle power collaps is supported
  * @rc_lock:			resource control mutex lock to protect
@@ -160,7 +159,6 @@ enum dpu_enc_rc_states {
  * @rc_state:			resource controller state
  * @delayed_off_work:		delayed worker to schedule disabling of
  *				clks and resources after IDLE_TIMEOUT time.
- * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
  * @wide_bus_en:		wide bus is enabled on this interface
@@ -194,7 +192,6 @@ struct dpu_encoder_virt {
 
 	atomic_t frame_done_timeout_ms;
 	struct timer_list frame_done_timer;
-	struct timer_list vsync_event_timer;
 
 	struct msm_display_info disp_info;
 
@@ -202,7 +199,6 @@ struct dpu_encoder_virt {
 	struct mutex rc_lock;
 	enum dpu_enc_rc_states rc_state;
 	struct delayed_work delayed_off_work;
-	struct kthread_work vsync_event_work;
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
@@ -1770,49 +1766,6 @@ int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time)
 	return 0;
 }
 
-static void dpu_encoder_vsync_event_handler(struct timer_list *t)
-{
-	struct dpu_encoder_virt *dpu_enc = from_timer(dpu_enc, t,
-			vsync_event_timer);
-	struct drm_encoder *drm_enc = &dpu_enc->base;
-	struct msm_drm_private *priv;
-	struct msm_drm_thread *event_thread;
-
-	if (!drm_enc->dev || !drm_enc->crtc) {
-		DPU_ERROR("invalid parameters\n");
-		return;
-	}
-
-	priv = drm_enc->dev->dev_private;
-
-	if (drm_enc->crtc->index >= ARRAY_SIZE(priv->event_thread)) {
-		DPU_ERROR("invalid crtc index\n");
-		return;
-	}
-	event_thread = &priv->event_thread[drm_enc->crtc->index];
-	if (!event_thread) {
-		DPU_ERROR("event_thread not found for crtc:%d\n",
-				drm_enc->crtc->index);
-		return;
-	}
-
-	del_timer(&dpu_enc->vsync_event_timer);
-}
-
-static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
-{
-	struct dpu_encoder_virt *dpu_enc = container_of(work,
-			struct dpu_encoder_virt, vsync_event_work);
-	ktime_t wakeup_time;
-
-	if (dpu_encoder_vsync_time(&dpu_enc->base, &wakeup_time))
-		return;
-
-	trace_dpu_enc_vsync_event_work(DRMID(&dpu_enc->base), wakeup_time);
-	mod_timer(&dpu_enc->vsync_event_timer,
-			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
-}
-
 static u32
 dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
 				  u32 enc_ip_width)
@@ -1972,7 +1925,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_encoder_phys *phys;
-	ktime_t wakeup_time;
 	unsigned long timeout_ms;
 	unsigned int i;
 
@@ -1998,14 +1950,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 			phys->ops.handle_post_kickoff(phys);
 	}
 
-	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
-			!dpu_encoder_vsync_time(drm_enc, &wakeup_time)) {
-		trace_dpu_enc_early_kickoff(DRMID(drm_enc),
-					    ktime_to_ms(wakeup_time));
-		mod_timer(&dpu_enc->vsync_event_timer,
-				nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
-	}
-
 	DPU_ATRACE_END("encoder_kickoff");
 }
 
@@ -2439,11 +2383,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-	if (disp_info->intf_type == INTF_DSI)
-		timer_setup(&dpu_enc->vsync_event_timer,
-				dpu_encoder_vsync_event_handler,
-				0);
-	else if (disp_info->intf_type == INTF_DP)
+	if (disp_info->intf_type == INTF_DP)
 		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
 				priv->dp[disp_info->h_tile_instance[0]]);
 
@@ -2451,9 +2391,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 			dpu_encoder_off_work);
 	dpu_enc->idle_timeout = IDLE_TIMEOUT;
 
-	kthread_init_work(&dpu_enc->vsync_event_work,
-			dpu_encoder_vsync_event_work_handler);
-
 	memcpy(&dpu_enc->disp_info, disp_info, sizeof(*disp_info));
 
 	DPU_DEBUG_ENC(dpu_enc, "created\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 1a92d21094f4..7352903eab04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -467,10 +467,6 @@ DECLARE_EVENT_CLASS(dpu_enc_ktime_template,
 	TP_printk("id=%u, time=%lld", __entry->drm_id,
 		  ktime_to_ms(__entry->time))
 );
-DEFINE_EVENT(dpu_enc_ktime_template, dpu_enc_vsync_event_work,
-	TP_PROTO(uint32_t drm_id, ktime_t time),
-	TP_ARGS(drm_id, time)
-);
 DEFINE_EVENT(dpu_enc_ktime_template, dpu_enc_early_kickoff,
 	TP_PROTO(uint32_t drm_id, ktime_t time),
 	TP_ARGS(drm_id, time)

---
base-commit: eab616ad7f56cafc8af85e9774816f0901e1efa2
change-id: 20230721-encoder-cleanup-49887b263c6c

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

