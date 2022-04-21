Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAFA50AA52
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 22:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A4410E10D;
	Thu, 21 Apr 2022 20:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2172510E010;
 Thu, 21 Apr 2022 20:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650574158; x=1682110158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PqWYflyWaeuf/LzHYx0yzKmFCeBG/BbgB/NRuydde+E=;
 b=LddxrpLTHnbrXuNjwJkSZhnP/HQ1w9+RriQZNyj19MjvXRcTtwrlBFKT
 L8ttGABpqkbbUHh2PvHo3ZS6N8j9u+J3jECoZQjvfxS62XQv1pwvC5N2I
 ygwuhL3nHzHiQXhYfMCUGhcwuNSkr4CW/BXKc4ZYKDOijsRfNgrd5Rsje g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Apr 2022 13:49:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:49:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:47 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:46 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC 4/4] drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder
Date: Thu, 21 Apr 2022 13:48:32 -0700
Message-ID: <1650574112-25294-5-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Change the DRM traces to include both the intf_mode
and wb_idx similar to the DRM prints in the previous change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 26 ++++++++++++++++++--------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 871ce87..42affd3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1345,8 +1345,9 @@ static void dpu_encoder_frame_done_callback(
 			 * suppress frame_done without waiter,
 			 * likely autorefresh
 			 */
-			trace_dpu_enc_frame_done_cb_not_busy(DRMID(drm_enc),
-					event, ready_phys->intf_idx);
+			trace_dpu_enc_frame_done_cb_not_busy(DRMID(drm_enc), event,
+					dpu_encoder_helper_get_intf_type(ready_phys->intf_mode),
+					ready_phys->intf_idx, ready_phys->wb_idx);
 			return;
 		}
 
@@ -1424,9 +1425,11 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 	if (ctl->ops.get_pending_flush)
 		ret = ctl->ops.get_pending_flush(ctl);
 
-	trace_dpu_enc_trigger_flush(DRMID(drm_enc), phys->intf_idx,
-				    pending_kickoff_cnt, ctl->idx,
-				    extra_flush_bits, ret);
+	trace_dpu_enc_trigger_flush(DRMID(drm_enc),
+			dpu_encoder_helper_get_intf_type(phys->intf_mode),
+			phys->intf_idx, phys->wb_idx,
+			pending_kickoff_cnt, ctl->idx,
+			extra_flush_bits, ret);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 58b411f..1106d44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -380,20 +380,26 @@ TRACE_EVENT(dpu_enc_rc,
 );
 
 TRACE_EVENT(dpu_enc_frame_done_cb_not_busy,
-	TP_PROTO(uint32_t drm_id, u32 event, enum dpu_intf intf_idx),
-	TP_ARGS(drm_id, event, intf_idx),
+	TP_PROTO(uint32_t drm_id, u32 event, char *intf_mode, enum dpu_intf intf_idx,
+			enum dpu_wb wb_idx),
+	TP_ARGS(drm_id, event, intf_mode, intf_idx, wb_idx),
 	TP_STRUCT__entry(
 		__field(	uint32_t,	drm_id		)
 		__field(	u32,		event		)
+		__string(	intf_mode_str,		intf_mode	)
 		__field(	enum dpu_intf,	intf_idx	)
+		__field(    enum dpu_wb,  wb_idx    )
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->event = event;
+		__assign_str(intf_mode_str, intf_mode);
 		__entry->intf_idx = intf_idx;
+		__entry->wb_idx = wb_idx;
 	),
-	TP_printk("id=%u, event=%u, intf=%d", __entry->drm_id, __entry->event,
-		  __entry->intf_idx)
+	TP_printk("id=%u, event=%u, intf_mode=%s intf=%d wb=%d", __entry->drm_id,
+			__entry->event, __get_str(intf_mode_str),
+			__entry->intf_idx, __entry->wb_idx)
 );
 
 TRACE_EVENT(dpu_enc_frame_done_cb,
@@ -415,14 +421,16 @@ TRACE_EVENT(dpu_enc_frame_done_cb,
 );
 
 TRACE_EVENT(dpu_enc_trigger_flush,
-	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
+	TP_PROTO(uint32_t drm_id, char *intf_mode, enum dpu_intf intf_idx, enum dpu_wb wb_idx,
 		 int pending_kickoff_cnt, int ctl_idx, u32 extra_flush_bits,
 		 u32 pending_flush_ret),
-	TP_ARGS(drm_id, intf_idx, pending_kickoff_cnt, ctl_idx,
+	TP_ARGS(drm_id, intf_mode, intf_idx, pending_kickoff_cnt, ctl_idx,
 		extra_flush_bits, pending_flush_ret),
 	TP_STRUCT__entry(
 		__field(	uint32_t,	drm_id			)
+		__string(	intf_mode_str,	intf_mode	)
 		__field(	enum dpu_intf,	intf_idx		)
+		__field(    enum dpu_wb,  wb_idx        )
 		__field(	int,		pending_kickoff_cnt	)
 		__field(	int,		ctl_idx			)
 		__field(	u32,		extra_flush_bits	)
@@ -430,15 +438,17 @@ TRACE_EVENT(dpu_enc_trigger_flush,
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
+		__assign_str(intf_mode_str, intf_mode);
 		__entry->intf_idx = intf_idx;
+		__entry->wb_idx = wb_idx;
 		__entry->pending_kickoff_cnt = pending_kickoff_cnt;
 		__entry->ctl_idx = ctl_idx;
 		__entry->extra_flush_bits = extra_flush_bits;
 		__entry->pending_flush_ret = pending_flush_ret;
 	),
-	TP_printk("id=%u, intf_idx=%d, pending_kickoff_cnt=%d ctl_idx=%d "
+	TP_printk("id=%u, intf_mode=%s, intf_idx=%d, wb_idx=%d, pending_kickoff_cnt=%d ctl_idx=%d "
 		  "extra_flush_bits=0x%x pending_flush_ret=0x%x",
-		  __entry->drm_id, __entry->intf_idx,
+		  __entry->drm_id, __get_str(intf_mode_str), __entry->intf_idx, __entry->wb_idx,
 		  __entry->pending_kickoff_cnt, __entry->ctl_idx,
 		  __entry->extra_flush_bits, __entry->pending_flush_ret)
 );
-- 
2.7.4

