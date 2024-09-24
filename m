Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB5984E69
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44610E8FB;
	Tue, 24 Sep 2024 23:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="I1iuBMPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D4410E775;
 Tue, 24 Sep 2024 23:00:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OGs4ZN017527;
 Tue, 24 Sep 2024 23:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p4HLFAKAwF39LY1TL5UYRvbpLZQAW45NQgmPHJu/uwQ=; b=I1iuBMPq+E1LVAns
 NgfrCP7bqg5tSljNmXk4b1wJ8Cp8kUbI3SCu0KAVYX/0qkF3jA+yD7M1959kiZYl
 Kvflam4jz0dW/U2jIA1Dk+llmUu59+JAy/hAIfrSToP6Azggf4mdkIjZHbF/PoKL
 5LEwu6iQGLCJ62s0O18hImXoc+PrbcqqzmywpXmD3XRIAV5TXx+sUWq50hFT/0n4
 NzCP6QvR83XA7CXbakjUugqgAaUiGkS7tGAozxPsgLPWjWsk40Du84Mx4TMh4oHx
 3uF136f5KyEiTz7P9WDMegR2M7oXabkgqUKnaR1nvv4P15N6NVSh5ZgH1cwsPBZO
 VgkhkA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2t1r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 23:00:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxxe7024998
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:59 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:59 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:36 -0700
Subject: [PATCH v2 20/22] drm/msm/dpu: Skip trigger flush and start for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-20-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=2270;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=vTd5wZD++p6l2VT711s6dJ+3qBnB6Idl+lQDvIxPUTM=;
 b=ap928yEnbTX1FAk4D91Ks/Mvp9uGa0Qgje2qedyK2ryZvKrBLbE1c3rCSQcoJlqSbeoUoABAH
 3nP1iHSAcQjB6qh9cnX5kCgOLw1XXE0H8KflCYqEAVi8WXZKpzTKDQx
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Uo7RJH0lEU9HTAOBrYKjnmpMbBC9I6xk
X-Proofpoint-ORIG-GUID: Uo7RJH0lEU9HTAOBrYKjnmpMbBC9I6xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160
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

For concurrent writeback, the real time encoder is responsible for
trigger flush and trigger start. Return early for trigger start and
trigger flush for the concurrent writeback encoders.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ac3ff13b65c3..87eaaf1196c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1488,6 +1488,7 @@ static void dpu_encoder_off_work(struct work_struct *work)
 static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct dpu_hw_ctl *ctl;
 	int pending_kickoff_cnt;
 	u32 ret = UINT_MAX;
@@ -1505,6 +1506,15 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 
 	pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
 
+	/* Return early if encoder is writeback and in clone mode */
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+	    dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d skip flush for concurrent writeback encoder\n",
+				DRMID(drm_enc));
+		return;
+	}
+
+
 	if (extra_flush_bits && ctl->ops.update_pending_flush)
 		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
 
@@ -1527,6 +1537,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
 		return;
@@ -1537,6 +1549,12 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		return;
 	}
 
+	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+	    dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
+		return;
+	}
+
 	if (phys->ops.trigger_start && phys->enable_state != DPU_ENC_DISABLED)
 		phys->ops.trigger_start(phys);
 }

-- 
2.34.1

