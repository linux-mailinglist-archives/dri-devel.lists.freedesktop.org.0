Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D7476D486
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFF810E1A0;
	Wed,  2 Aug 2023 17:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202B110E0E3;
 Wed,  2 Aug 2023 17:01:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372F7F4g025933; Wed, 2 Aug 2023 17:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=1unoftQq1XBOD7bFKjkLUdzJuvVwLfX/7dC74JUVrLo=;
 b=LqHBSjVKMKvxAcG1ge5I+9gJUzfWhI9jHK+i//P1oeoKF3ssLzQLnLOXRuSbCO3PNshw
 I2+vizq5KLREKppc9alITjIIhFzNo4lk4KtJzFzW3CC4OUw0hiahid9mW1m+oG68JSBc
 nx7KTvYsISdR9+cbrxVNioIPgsKVNwmU8ad4Qa1f27aTRZyvtJ2TzQpLxO+ymwZxSZ4N
 IWLqp8MqJCTtgbGiRIliWAQO/1nMF62zVZWHZqJIHXnZpMAFeiKcjMp+91dUQKQWD+Hq
 FG/ABFIyYytnFmLofKj/DeEV6yiRnKVlqnH3lgM1V3muYILXKO8qXvrscuIGsTMVjU6w xA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7sgng8ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 17:01:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372H1ieY002027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 17:01:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 10:01:44 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 2 Aug 2023 10:01:13 -0700
Subject: [PATCH v2] drm/msm/dpu: Drop encoder vsync_event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANiLymQC/2WNQQ6CMBBFr0JmbU1bDKWuvIdhgcMgk2iLrTQa0
 rtbcenyveS/v0KkwBThWK0QKHFk7wroXQU49e5KgofCoKWupdFKkEM/UBB4o94tszjYtjUX3dT
 YIJTVHGjk11Y8d4Unjk8f3ttBUl/7a7Xyv5WUUGK0VJuRtLHWnB4LIzvco79Dl3P+ABfTG+GwA
 AAA
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690995703; l=6583;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=UpW7L7Fv/5GVMwQ8eidoEDPd67J2FXiqAmKooYsaVEU=;
 b=7KuVd74NsUxNkF4FZ0Gfhg3LrVqbYsZcFwqCrlQbSAIFKAs1JyWHuwEGwOGak3pSwgl31n3jQ
 EIcnu1/IWNxAdtchkINg5ZVd0ovgU4ZyGNjnqMgHfWe8RkxXTjkBkRT
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7QhhIU2O6-pLTwEwu6Cu_lhs3B-RG1M1
X-Proofpoint-GUID: 7QhhIU2O6-pLTwEwu6Cu_lhs3B-RG1M1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_13,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020150
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
In addition drop the dpu_enc_ktime_template event class as it will be
unused after the vsync_event handlers are dropped.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v2:
- Dropped dpu_enc_early_kickoff event and dpu_enc_ktime_template event class
- Link to v1: https://lore.kernel.org/r/20230801-encoder-cleanup-v1-1-f9e37fe27997@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 65 +----------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 23 ----------
 2 files changed, 1 insertion(+), 87 deletions(-)

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
index 1a92d21094f4..c74b9be25e68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -453,29 +453,6 @@ TRACE_EVENT(dpu_enc_trigger_flush,
 		  __entry->extra_flush_bits, __entry->pending_flush_ret)
 );
 
-DECLARE_EVENT_CLASS(dpu_enc_ktime_template,
-	TP_PROTO(uint32_t drm_id, ktime_t time),
-	TP_ARGS(drm_id, time),
-	TP_STRUCT__entry(
-		__field(	uint32_t,	drm_id	)
-		__field(	ktime_t,	time	)
-	),
-	TP_fast_assign(
-		__entry->drm_id = drm_id;
-		__entry->time = time;
-	),
-	TP_printk("id=%u, time=%lld", __entry->drm_id,
-		  ktime_to_ms(__entry->time))
-);
-DEFINE_EVENT(dpu_enc_ktime_template, dpu_enc_vsync_event_work,
-	TP_PROTO(uint32_t drm_id, ktime_t time),
-	TP_ARGS(drm_id, time)
-);
-DEFINE_EVENT(dpu_enc_ktime_template, dpu_enc_early_kickoff,
-	TP_PROTO(uint32_t drm_id, ktime_t time),
-	TP_ARGS(drm_id, time)
-);
-
 DECLARE_EVENT_CLASS(dpu_id_event_template,
 	TP_PROTO(uint32_t drm_id, u32 event),
 	TP_ARGS(drm_id, event),

---
base-commit: eab616ad7f56cafc8af85e9774816f0901e1efa2
change-id: 20230721-encoder-cleanup-49887b263c6c

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

