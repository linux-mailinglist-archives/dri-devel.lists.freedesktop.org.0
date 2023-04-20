Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259626E9FE4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A883C10ED43;
	Thu, 20 Apr 2023 23:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839E510ED3F;
 Thu, 20 Apr 2023 23:25:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KMDVt9002561; Thu, 20 Apr 2023 23:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=uAQRL3ffR0u7Yz8CO+AlZ8N+I71x2dcOjfkbG2Uljns=;
 b=bU3oDIUbDwXtk6tuqrjB9noFLFM6PLm9c5FbyRp6k8xuZV5zgcy4yGM0viDihdiPKN59
 /CDhahli9BydgiHGG6/Bu/BoGqVNultkTvGcyq+/xyPpwoDP1egNTn6Yc9ehqvLLjtlT
 uiLQySCMzhL3mv9RUIyYBVsqWLxqmnFFv2KWoHl3k1jX78GpMXdFa4lflbkVMilWsemp
 aL54bF1I9qnztaRqIRiIutfCzR5V4yPvJm5USAL0L6SkY8Iw08ViDUffTab2lVcEAIi4
 Vg1PFpo3OOedQ8jPGyWGmhEYMXIYIoiZ1byK0gD1w/v2KIDQ+w46Xyh0dfCiBqsPsOMi JQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2uh3jt8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 23:25:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KNPVOp031839
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 23:25:31 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 16:25:30 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 3/5] drm/msm/dpu: save dpu topology configuration
Date: Thu, 20 Apr 2023 16:25:12 -0700
Message-ID: <1682033114-28483-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oJ0T7-LdXN7m2Bk3s0ccD45PyzfcHOzn
X-Proofpoint-GUID: oJ0T7-LdXN7m2Bk3s0ccD45PyzfcHOzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_15,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200200
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

