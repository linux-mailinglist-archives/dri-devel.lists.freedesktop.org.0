Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDD6F2156
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 01:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92210EE16;
	Fri, 28 Apr 2023 23:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9071310EE09;
 Fri, 28 Apr 2023 23:45:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SNUpBI019801; Fri, 28 Apr 2023 23:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=uAQRL3ffR0u7Yz8CO+AlZ8N+I71x2dcOjfkbG2Uljns=;
 b=VUHdfzvA74JAb+WpW1kj1kaEso8ifpfAHV9KxtnyxOUyGKkLCDFlmXPKXqiZMnC/cXDz
 rULEslGuTAI2JfZcllDSbYYJuTo82GJx/1kxb3fefIqykfP/rKWP3agD36vP2yJV2lUw
 7hSrLsAy5uURWwLVT3pM3ar77gRKu0zzSnN3uYNorCDGaiX1VRPA5XkFbOI9Rn4w8zO1
 qAdz7uWdBeEqcoIDUhV/3HCZLLFCzrjbTogI0VTB3CRoLJ2RV0jzpeksZ4/OmhIWIxvI
 LNKxI50h0VpIY8vhympGjPRnSZr/S7igs5yascSn7aKDIiUig7iv+JZJjimLHYhxAkd9 bA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q88fyjqb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 23:45:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SNjb0X015668
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 23:45:37 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 16:45:37 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2 6/7] drm/msm/dpu: save dpu topology configuration
Date: Fri, 28 Apr 2023 16:45:10 -0700
Message-ID: <1682725511-18185-7-git-send-email-quic_khsieh@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lrjWx3TmkAtbublFvSMFx35qkuulQwlv
X-Proofpoint-GUID: lrjWx3TmkAtbublFvSMFx35qkuulQwlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

At current implementation, topology configuration is thrown away after
dpu_rm_reserve(). This patch save the topology so that it can be used
for DSC related calculation later.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ecb87bc..2fdacf1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -542,13 +542,13 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
 
-static struct msm_display_topology dpu_encoder_get_topology(
+static void dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
-			struct drm_crtc_state *crtc_state)
+			struct drm_crtc_state *crtc_state,
+			struct msm_display_topology *topology)
 {
-	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -567,16 +567,16 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	 * Add dspps to the reservation requirements if ctm is requested
 	 */
 	if (intf_count == 2)
-		topology.num_lm = 2;
+		topology->num_lm = 2;
 	else if (!dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = 1;
+		topology->num_lm = 1;
 	else
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology->num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
 	if (crtc_state->ctm)
-		topology.num_dspp = topology.num_lm;
+		topology->num_dspp = topology->num_lm;
 
-	topology.num_intf = intf_count;
+	topology->num_intf = intf_count;
 
 	if (dpu_enc->dsc) {
 		/*
@@ -585,12 +585,10 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		 * this is power optimal and can drive up to (including) 4k
 		 * screens
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
+		topology->num_dsc = 2;
+		topology->num_lm = 2;
+		topology->num_intf = 1;
 	}
-
-	return topology;
 }
 
 static int dpu_encoder_virt_atomic_check(
@@ -602,7 +600,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
-	struct msm_display_topology topology;
+	struct msm_display_topology *topology;
 	struct dpu_global_state *global_state;
 	int i = 0;
 	int ret = 0;
@@ -639,7 +637,9 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
+	topology = &dpu_enc->topology;
+	memset(topology, 0, sizeof (*topology));
+	dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, topology);
 
 	/*
 	 * Release and Allocate resources on every modeset
@@ -650,7 +650,7 @@ static int dpu_encoder_virt_atomic_check(
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+					drm_enc, crtc_state, *topology);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

