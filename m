Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD17074F1
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 00:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DDD10E4A3;
	Wed, 17 May 2023 22:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FB110E4A7;
 Wed, 17 May 2023 22:02:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HLTdA6014472; Wed, 17 May 2023 22:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=ZluKuzLdZV4GHizD1T3TTMsSimBTjFQ563W+ab84WuA=;
 b=cYivNPSd+qdLDHbf/mK+soyidPALGLD4hevTzU714vYKHn8xFQbKYtrZU8t53PqJ2X8a
 mIxDK2SK3GUjtTQE0nlWMtubvP0H4xJJ67ph7xV2LySVWZbCWsWlIiWz4jg21xICvZRV
 sgoFbYgABGcn0cyv/BkV7c8XUOADLt5h+DLnO5zSmYLHkxfuot/U2BfXTE/+/B/z6Jxo
 lkyBQVOwa5dbQZpSSsJ8ShQ4VCryHkzJStLdlc3M+KVc8TKnokaJjV6k1VBqcA2aHxRI
 qMyL5ruN/n0gpFMu0K9EeEI1r1ZA9B2LzoQkPoBWgCy4qBgR32GDnZ7WxSwl9ztrDMqp xQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmcc63g82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:02:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HM2EuW013313
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:02:15 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 15:02:14 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v10 4/8] drm/msm/dpu: Introduce PINGPONG_NONE to disconnect
 DSC from PINGPONG
Date: Wed, 17 May 2023 15:01:55 -0700
Message-ID: <1684360919-28458-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: if3vbHo4zC4v18rmtTepqSc5UaEZFxvf
X-Proofpoint-ORIG-GUID: if3vbHo4zC4v18rmtTepqSc5UaEZFxvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170181
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disabling the crossbar mux between DSC and PINGPONG currently
requires a bogus enum dpu_pingpong value to be passed when calling
dsc_bind_pingpong_blk() with enable=false, even though the register
value written is independent of the current PINGPONG block.  Replace
that `bool enable` parameter with a new PINGPONG_NONE dpu_pingpong
flag that triggers the write of the "special" 0xF "crossbar
disabled" value to the register instead.

Changes in v4:
-- more details to commit text

Changes in v5:
-- rewording commit text suggested by Marijn
-- add DRM_DEBUG_KMS for DSC unbinding case

Changes in v8:
-- fix checkpatch warning

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 14 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 ++-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index cf1de5d..ffa6f04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1850,7 +1850,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 		hw_pp->ops.setup_dsc(hw_pp);
 
 	if (hw_dsc->ops.dsc_bind_pingpong_blk)
-		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, true, hw_pp->idx);
+		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, hw_pp->idx);
 
 	if (hw_pp->ops.enable_dsc)
 		hw_pp->ops.enable_dsc(hw_pp);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 4a6bbcc..f134fb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -157,7 +157,6 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
 
 static void dpu_hw_dsc_bind_pingpong_blk(
 		struct dpu_hw_dsc *hw_dsc,
-		bool enable,
 		const enum dpu_pingpong pp)
 {
 	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
@@ -166,14 +165,15 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 
 	dsc_ctl_offset = DSC_CTL(hw_dsc->idx);
 
-	if (enable)
+	if (pp)
 		mux_cfg = (pp - PINGPONG_0) & 0x7;
 
-	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
-			enable ? "Binding" : "Unbinding",
-			hw_dsc->idx - DSC_0,
-			enable ? "to" : "from",
-			pp - PINGPONG_0);
+	if (pp)
+		DRM_DEBUG_KMS("Binding dsc:%d to pp:%d\n",
+			      hw_dsc->idx - DSC_0, pp - PINGPONG_0);
+	else
+		DRM_DEBUG_KMS("Unbinding dsc:%d from any pp\n",
+			      hw_dsc->idx - DSC_0);
 
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
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
index 1913a19..02a0f48 100644
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
2.7.4

