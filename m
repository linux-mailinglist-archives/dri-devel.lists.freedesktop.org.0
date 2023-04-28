Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E766F2150
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 01:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C5C10E06A;
	Fri, 28 Apr 2023 23:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BAB10E06A;
 Fri, 28 Apr 2023 23:45:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SNiOYR018675; Fri, 28 Apr 2023 23:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=wV4LdEJ2ofwpa9JtcSJW3D1ZqHtuyZ1wracfC5aYXyg=;
 b=B47rvZvpK0GwoDfCHVs//s0/kmMN7fxUBEtkQVYod+UFR+KEYd8N+OHGGFBJD7FoOBp7
 cWPpg8Nlsd7kPQ5wvnGU50ktIurJgRUn05aowUcivYma4/mWYtfQt57tiFzw66kEleCp
 uloYC6OWe7HUpstfcJPLDtAEFc8JxJ4nNpnuzkATa2x/CdYA77l1aRdm0oXJrGWQ11PO
 aDbpixeFK8A7i+EXnZRZ3W1iMQ3DIN9qL+rC3NmI9fQAmkFkmeQaY8l1uVt+VN2TvOgr
 K/RUvKkrk6uVjzuSPPxbCmIR+62QZr8UQFDiEHTFJGuk7BCLX/FhQVBvvZCkZP5KP1X+ /g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8abptb41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 23:45:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SNjef5015680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 23:45:40 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 16:45:39 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2 7/7] drm/msm/dpu: calculate DSC encoder parameters
 dynamically
Date: Fri, 28 Apr 2023 16:45:11 -0700
Message-ID: <1682725511-18185-8-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4vm5h3j3rUeMGu9EzRr4Em6jl3s4I-Ib
X-Proofpoint-GUID: 4vm5h3j3rUeMGu9EzRr4Em6jl3s4I-Ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280199
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During DSC preparation, add run time calculation to figure out what
usage modes, split mode and merge mode, is going to be setup.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 56 ++++++++++++++++-------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2fdacf1..3d18642 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -529,17 +529,9 @@ void dpu_encoder_helper_split_config(
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i, intf_count = 0, num_dsc = 0;
+	struct msm_display_topology *topology = &dpu_enc->topology;
 
-	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
-		if (dpu_enc->phys_encs[i])
-			intf_count++;
-
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
-	if (dpu_enc->dsc)
-		num_dsc = 2;
-
-	return (num_dsc > 0) && (num_dsc > intf_count);
+	return (topology->num_dsc > topology->num_intf);
 }
 
 static void dpu_encoder_get_topology(
@@ -1861,41 +1853,55 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	int this_frame_slices;
+	struct msm_display_topology *topology = &dpu_enc->topology;
 	int intf_ip_w, enc_ip_w;
-	int dsc_common_mode;
-	int pic_width;
+	int dsc_common_mode = 0;
 	u32 initial_lines;
+	int num_dsc = topology->num_dsc;
+	int num_intf = topology->num_intf;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
 		if (!hw_pp[i] || !hw_dsc[i]) {
 			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
 			return;
-		}
+		} 
 	}
 
-	dsc_common_mode = 0;
-	pic_width = dsc->pic_width;
+	intf_ip_w = dsc->pic_width;
 
-	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
 	if (enc_master->intf_mode == INTF_MODE_VIDEO)
 		dsc_common_mode |= DSC_MODE_VIDEO;
 
-	this_frame_slices = pic_width / dsc->slice_width;
-	intf_ip_w = this_frame_slices * dsc->slice_width;
-
 	/*
-	 * dsc merge case: when using 2 encoders for the same stream,
-	 * no. of slices need to be same on both the encoders.
+	 * If this encoder is driving more than one DSC encoder, they
+	 * operate in tandem, same pic dimension needs to be used by
+	 * each of them.(pp-split is assumed to be not supported)
+	 *
 	 */
-	enc_ip_w = intf_ip_w / 2;
+	enc_ip_w = intf_ip_w;
+
+	intf_ip_w /= num_intf;
+
+	if (num_dsc > 1)
+		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
+
+	if (dpu_encoder_use_dsc_merge(&dpu_enc->base)) {
+		dsc_common_mode |= DSC_MODE_MULTIPLEX;
+		/*
+		 * in dsc merge case: when using 2 encoders for the same
+		 * stream, no. of slices need to be same on both the
+		 * encoders.
+		 */
+		enc_ip_w = intf_ip_w / 2;
+	}
+
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
 					dsc_common_mode, initial_lines);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

