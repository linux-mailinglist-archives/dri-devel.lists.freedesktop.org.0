Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACE6F4BC2
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 23:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2262810E0D4;
	Tue,  2 May 2023 21:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B02010E0C4;
 Tue,  2 May 2023 21:03:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342IqHkf015996; Tue, 2 May 2023 21:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=zGAmJWdNN+t4cBs2EEzcQVtU++z0/PUeCXe62hTqu2s=;
 b=fusbsiW3MAKZ12QTG0LJe7hFa+saaAARy5rwtJ6ZVXalrCdKdN7cTmK+XTw1BTdMq+3g
 cjDODdNrZ6s7VMgTqmeo8WZhTmVBl7s0rVsKntArv+lrIOdCa2/cNxkKOwRmpPh+3AUC
 fb6sQOtTpOgjlciPgWy614l0iXDQRM7ZYpMondbMGnE4Z44KB9gBir0GrD5rBuJX0IWk
 Y/wpPVOJuBffEo3D/rlQdSBiMcL0pxMAyUsUrLSejNdVTxwXMGLZprkMwdGAuxMHOj6u
 7ajJtCZoBVeajnE7hqZe36Xst7WU8X3aPWBuTmt/oeklOq03K8xvC+9I/x2eaBcTYW2V QA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qaj3wk5h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 21:03:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342L3Kca020599
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 21:03:20 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 2 May 2023 14:03:19 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v3 2/7] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit
Date: Tue, 2 May 2023 14:02:57 -0700
Message-ID: <1683061382-32651-3-git-send-email-quic_khsieh@quicinc.com>
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
X-Proofpoint-GUID: cWDCC__ArhFz9AMdozX52gbI_5syU-5W
X-Proofpoint-ORIG-GUID: cWDCC__ArhFz9AMdozX52gbI_5syU-5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

Legacy DPU requires PP block to be involved during DSC setting up.
This patch adds DDPU_PINGPONG_DSC feature bit to indicate that both
dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_enable() pingpong ops
functions are required to complete DSC data path set up and start
DSC engine.

Reported-by : Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h  | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd..c07a6b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -144,6 +144,7 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER,    Dither blocks
+ * @DPU_PINGPONG_DSC,	    PP ops functions required for DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
@@ -152,6 +153,7 @@ enum {
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
+	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 3822e06..f255a04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -264,9 +264,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
-	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
-	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
-	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
+
+	if (features & BIT(DPU_PINGPONG_DSC)) {
+		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
+		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
+		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
+	}
 
 	if (test_bit(DPU_PINGPONG_DITHER, &features))
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

