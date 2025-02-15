Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD52A369C5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2BE10ED65;
	Sat, 15 Feb 2025 00:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oVBtp2LL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C11F10ED43;
 Sat, 15 Feb 2025 00:15:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EJ28dF024638;
 Sat, 15 Feb 2025 00:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SyFRIjgwqZRv8TNLPM8OodnVrmxwCcK5YVr6PD513jo=; b=oVBtp2LLdGcmwInR
 zQUOzMdym/8tw27h9uXyGI0FJd4jYGDu76jyiHqUBWFW+AJ2g7bVyfT7jzqdT91y
 XcQr2SQbhUafFdWaWG6HOaYIgean7/H7F/lfnD+3ZEhFKnmebBBTLIu9cX7/+SnB
 BN5ZlB0rjVR54f8BTmb+V05jb9Thc9NaJ5cWyp+wCMOPspLd87SZm9SGDrdEH9i0
 ta887GR2UM+Dnu/poPgGYaHAAbM/Wm3n7FGUVYInn0yIkYoLQsx2kWIgBI/Hln5h
 U/+o+lkaqDiAqHIygD1gVZczyBumqvBbZDi8wrMoBNvMoEu38lgThHnFgIOiZaZ4
 yZ1ZSg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tbms0jag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0FSNv009368
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:15:28 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:14:36 -0800
Subject: [PATCH v6 13/14] drm/msm/dpu: Reorder encoder kickoff for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-concurrent-wb-v6-13-a44c293cf422@quicinc.com>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
In-Reply-To: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578524; l=4414;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=cuhKQoGfK9+UJZMhHCTsWxvRhZaf1bDsBsTxO/vq/84=;
 b=GAKDkUwuxguKVqGKHwRzRYogmFQs5uzw41UWIjUyHpyalLiJF3RzzDXo4np4JsaTv/yFwyVyM
 oE1NhhqpkxYAFnBcdShw/12mUiRGVV7yuBMHaBqp3JANzbQdKoEySEw
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PtM7ttOpaSk2uA3z9xsE5QrWvHzvm3ex
X-Proofpoint-ORIG-GUID: PtM7ttOpaSk2uA3z9xsE5QrWvHzvm3ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502150000
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

Add a helper that will handle the correct order of the encoder kickoffs
for concurrent writeback.

For concurrent writeback, the realtime encoder must always kickoff last
as it will call the trigger flush and start.

This avoids the following scenario where the writeback encoder
increments the pending kickoff count after the WB_DONE interrupt is
fired:

If the realtime encoder is kicked off first, the encoder kickoff will
flush/start the encoder and increment the pending kickoff count. The
WB_DONE interrupt then fires (before the writeback encoder is kicked
off). When the writeback encoder enters its kickoff, it will skip the
flush/start (due to CWB being enabled) and hit a frame done timeout
as the frame was kicked off (and the WB_DONE interrupt fired) without
the pending kickoff count being incremented.

In addition, the writeback timer should only start after the realtime
encoder is kicked off to ensure that we don't get timeouts when the
system has a heavy load (ex. when debug logs are enabled)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 74 ++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 60df3ee9419a..4073d821158c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -953,6 +953,45 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
 	return rc;
 }
 
+static int dpu_crtc_kickoff_clone_mode(struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+	struct drm_encoder *rt_encoder = NULL, *wb_encoder;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/* Find encoder for real time display */
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc->state->encoder_mask) {
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			wb_encoder = encoder;
+		else
+			rt_encoder = encoder;
+	}
+
+	if (!rt_encoder || !wb_encoder) {
+		DRM_DEBUG_ATOMIC("real time or wb encoder not found\n");
+		return -EINVAL;
+	}
+
+	dpu_encoder_prepare_for_kickoff(wb_encoder);
+	dpu_encoder_prepare_for_kickoff(rt_encoder);
+
+	dpu_vbif_clear_errors(dpu_kms);
+
+	/*
+	 * Kickoff real time encoder last as it's the encoder that
+	 * will do the flush
+	 */
+	dpu_encoder_kickoff(wb_encoder);
+	dpu_encoder_kickoff(rt_encoder);
+
+	/* Don't start frame done timers until the kickoffs have finished */
+	dpu_encoder_start_frame_done_timer(wb_encoder);
+	dpu_encoder_start_frame_done_timer(rt_encoder);
+
+	return 0;
+}
+
 /**
  * dpu_crtc_commit_kickoff - trigger kickoff of the commit for this crtc
  * @crtc: Pointer to drm crtc object
@@ -981,13 +1020,27 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 			goto end;
 		}
 	}
-	/*
-	 * Encoder will flush/start now, unless it has a tx pending. If so, it
-	 * may delay and flush at an irq event (e.g. ppdone)
-	 */
-	drm_for_each_encoder_mask(encoder, crtc->dev,
-				  crtc->state->encoder_mask)
-		dpu_encoder_prepare_for_kickoff(encoder);
+
+	if (drm_crtc_in_clone_mode(crtc->state)) {
+		if (dpu_crtc_kickoff_clone_mode(crtc))
+			goto end;
+	} else {
+		/*
+		 * Encoder will flush/start now, unless it has a tx pending.
+		 * If so, it may delay and flush at an irq event (e.g. ppdone)
+		 */
+		drm_for_each_encoder_mask(encoder, crtc->dev,
+				crtc->state->encoder_mask)
+			dpu_encoder_prepare_for_kickoff(encoder);
+
+		dpu_vbif_clear_errors(dpu_kms);
+
+		drm_for_each_encoder_mask(encoder, crtc->dev,
+				crtc->state->encoder_mask) {
+			dpu_encoder_kickoff(encoder);
+			dpu_encoder_start_frame_done_timer(encoder);
+		}
+	}
 
 	if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
 		/* acquire bandwidth and other resources */
@@ -997,13 +1050,6 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	dpu_crtc->play_count++;
 
-	dpu_vbif_clear_errors(dpu_kms);
-
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
-		dpu_encoder_kickoff(encoder);
-		dpu_encoder_start_frame_done_timer(encoder);
-	}
-
 	reinit_completion(&dpu_crtc->frame_done_comp);
 
 end:

-- 
2.48.1

