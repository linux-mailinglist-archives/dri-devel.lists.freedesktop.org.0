Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7813B6F4BC9
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 23:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F0E10E0E4;
	Tue,  2 May 2023 21:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D9610E0E1;
 Tue,  2 May 2023 21:03:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342KJQ2R028846; Tue, 2 May 2023 21:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=CfdV12xnsDBHT7l/NywMz7xMho8es15MIE2WZGE6BPQ=;
 b=PhKfSuc8BfB213NH7y8iAM2cm1lgO6d1dgl/t6Mk0HtIEqdy5g1AZuwdFN1OJN16AgF1
 4SjNuzAYoXcj/Ma3CuJTUZMWBH33WFmTZYW+D8Q+igzoO+8xRyQ/dHBnGCzStSOJmcUl
 3Duh7mPJp9RQN8xnxU4/tPjvBTG3fOccizFVIYwb0IQdwKIIyN5Qq2otNozGSOjpBggp
 8OmzvW4BqoOd8h9oqOi238nrjsPW5qhMzM+yDbcin6hjsKUzpgxOtmIKFb5aeKucQKgD
 72Qqx/edehCaPC9e/MkGfhI/sHCynR6tSClvqdGj0bUTobzz/efShkn9ilcwaPZhA9+I dw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qb4e98ukv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 21:03:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342L3NQH029227
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 21:03:23 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 2 May 2023 14:03:22 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v3 4/7] drm/msm/dpu: add PINGPONG_NONE to disconnect DSC from
 PINGPONG
Date: Tue, 2 May 2023 14:02:59 -0700
Message-ID: <1683061382-32651-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QWCfN-D1H5JwBXoLeciicIQzSfZcn9ak
X-Proofpoint-ORIG-GUID: QWCfN-D1H5JwBXoLeciicIQzSfZcn9ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020179
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

During DSC setup, the crossbar mux need to be programmed to engage
DSC to specified PINGPONG. Hence during tear down, the crossbar mux
need to be reset to disengage DSC from PINGPONG. This patch add
PINGPONG_NONE to serve as disable to reset crossbar mux.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 3 ++-
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1dc5dbe..d9ad334 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1839,7 +1839,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 		hw_pp->ops.setup_dsc(hw_pp);
 
 	if (hw_dsc->ops.dsc_bind_pingpong_blk)
-		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, true, hw_pp->idx);
+		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, hw_pp->idx);
 
 	if (hw_pp->ops.enable_dsc)
 		hw_pp->ops.enable_dsc(hw_pp);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 4a6bbcc..3e68d47 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -157,7 +157,6 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
 
 static void dpu_hw_dsc_bind_pingpong_blk(
 		struct dpu_hw_dsc *hw_dsc,
-		bool enable,
 		const enum dpu_pingpong pp)
 {
 	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
@@ -166,13 +165,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 
 	dsc_ctl_offset = DSC_CTL(hw_dsc->idx);
 
-	if (enable)
+	if (pp)
 		mux_cfg = (pp - PINGPONG_0) & 0x7;
 
 	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
-			enable ? "Binding" : "Unbinding",
+			pp ? "Binding" : "Unbinding",
 			hw_dsc->idx - DSC_0,
-			enable ? "to" : "from",
+			pp ? "to" : "from",
 			pp - PINGPONG_0);
 
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index 287ec5f..138080a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -44,7 +44,6 @@ struct dpu_hw_dsc_ops {
 				  struct drm_dsc_config *dsc);
 
 	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
-				  bool enable,
 				  enum dpu_pingpong pp);
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 2d9192a..56826a9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -191,7 +191,8 @@ enum dpu_dsc {
 };
 
 enum dpu_pingpong {
-	PINGPONG_0 = 1,
+	PINGPONG_NONE,
+	PINGPONG_0,
 	PINGPONG_1,
 	PINGPONG_2,
 	PINGPONG_3,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

