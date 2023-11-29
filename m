Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD37FE107
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 21:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3583D10E673;
	Wed, 29 Nov 2023 20:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006D910E673;
 Wed, 29 Nov 2023 20:31:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ATK6mNJ009375; Wed, 29 Nov 2023 20:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=5KqutIxZnAHGo7kpr3+C7uJULTrGEiihfCuwTAWKZdo=;
 b=ZZGvx5tJfRIdbGOhLnWzNtqOVbLQ0WlQP8yCFe/Gt1usLgCNuwVFq7Yj3F9HBx0TWHnx
 HQDtxl3tcI7/sgxq85kxEo8sET6Bj/G7WhcL3qmRQFqHx9M08VWZI790xGpsgk9I2Dr0
 8f7RuXpz7pfNLwpLfPlgfig/sIFBr8mpLbYTwriQZ3WXIiOi4rgCNCC0egs92YSRZlmF
 DTIuSmbZgo9bXji2PD3d+/mHHUgCcL27RGrPYVU6NLD+DbzGeIO8dfueZ2JadAqh+S43
 poI7wa9MVe8X2hJxly8srDry4QH1eCDEsSPapGTZghYJa0F08o5blfyXpuOhzl3mOuG9 xg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unmrabmyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Nov 2023 20:31:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATKVn6v004691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Nov 2023 20:31:49 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 12:31:48 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1] drm/msm/dpu: improve DSC allocation
Date: Wed, 29 Nov 2023 12:31:38 -0800
Message-ID: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NrbIISQm5L4ZZzKkyTUZNzSXpKDIVA2Y
X-Proofpoint-ORIG-GUID: NrbIISQm5L4ZZzKkyTUZNzSXpKDIVA2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_19,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=814 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290156
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

A DCE (Display Compression Engine) contains two DSC hard slice encoders.
Each DCE start with even DSC encoder index followed by an odd DSC encoder
index. Each encoder can work independently. But Only two DSC encoders from
same DCE can be paired to work together to support merge mode. In addition,
the DSC with even index have to mapping to even pingpong index and DSC with
odd index have to mapping to odd pingpong index at its data path. This patch
improve DSC allocation mechanism with consideration of above factors.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 94 +++++++++++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9215643..427d70d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -466,24 +466,94 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 			       struct drm_encoder *enc,
 			       const struct msm_display_topology *top)
 {
-	int num_dsc = top->num_dsc;
-	int i;
+	int num_dsc = 0;
+	int i, pp_idx;
+	bool pair = false;
+	int dsc_idx[DSC_MAX - DSC_0];
+	uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
+	int pp_max = PINGPONG_MAX - PINGPONG_0;
+
+	if (!top->num_dsc || !top->num_intf)
+		return 0;
+
+	/*
+	 * Truth:
+	 * 1) every layer mixer only connects to one pingpong
+	 * 2) no pingpong split -- two layer mixers shared one pingpong
+	 * 3) each DSC engine contains two dsc encoders
+	 *    -- index(0,1), index (2,3),... etc
+	 * 4) dsc pair can only happens with same DSC engine except 4 dsc
+	 *    merge mode application (8k) which need two DSC engines
+	 * 5) odd pingpong connect to odd dsc
+	 * 6) even pingpong connect even dsc
+	 */
+
+	/* num_dsc should be either 1, 2 or 4 */
+	if (top->num_dsc > top->num_intf)	/* merge mode */
+		pair = true;
+
+	/* fill working copy with pingpong list */
+	memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
+
+	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
+		if (!rm->dsc_blks[i])	/* end of dsc list */
+			break;
 
-	/* check if DSC required are allocated or not */
-	for (i = 0; i < num_dsc; i++) {
-		if (!rm->dsc_blks[i]) {
-			DPU_ERROR("DSC %d does not exist\n", i);
-			return -EIO;
+		if (global_state->dsc_to_enc_id[i]) {	/* used */
+			/* consective dsc index to be paired */
+			if (pair && num_dsc) {	/* already start pairing, re start */
+				num_dsc = 0;
+				/* fill working copy with pingpong list */
+				memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
+								sizeof(pp_to_enc_id));
+			}
+			continue;
 		}
 
-		if (global_state->dsc_to_enc_id[i]) {
-			DPU_ERROR("DSC %d is already allocated\n", i);
-			return -EIO;
+		/* odd index can not become start of pairing */
+		if (pair && (i & 0x01) && !num_dsc)
+			continue;
+
+		/*
+		 * find the pingpong index which had been reserved
+		 * previously at layer mixer allocation
+		 */
+		for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
+			if (pp_to_enc_id[pp_idx] == enc->base.id)
+				break;
 		}
+
+		/*
+		 * dsc even index must map to pingpong even index
+		 * dsc odd index must map to pingpong odd index
+		 */
+		if ((i & 0x01) != (pp_idx & 0x01))
+			continue;
+
+		/*
+		 * delete pp_idx so that it can not be found at next search
+		 * in the case of pairing
+		 */
+		pp_to_enc_id[pp_idx] = NULL;
+
+		dsc_idx[num_dsc++] = i;
+		if (num_dsc >= top->num_dsc)
+			break;
 	}
 
-	for (i = 0; i < num_dsc; i++)
-		global_state->dsc_to_enc_id[i] = enc->base.id;
+	if (num_dsc < top->num_dsc) {
+		DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
+						num_dsc, top->num_dsc );
+		return -ENAVAIL;
+	}
+
+	/* reserve dsc */
+	for (i = 0; i < top->num_dsc; i++) {
+		int j;
+
+		j = dsc_idx[i];
+		global_state->dsc_to_enc_id[j] = enc->base.id;
+	}
 
 	return 0;
 }
-- 
2.7.4

