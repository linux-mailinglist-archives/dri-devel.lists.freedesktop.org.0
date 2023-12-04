Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E328042EF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 00:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2D10E444;
	Mon,  4 Dec 2023 23:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2341F10E0F9;
 Mon,  4 Dec 2023 23:55:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B4Mc5D7027914; Mon, 4 Dec 2023 23:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=HnR2MSidO4qvnQE/bxyNOPlmhvp3upDXTUwdfaJAqE0=;
 b=QIipAspClhrNCKHCTwZC2R+JrgFLqlaTGHLR3hZ97d8lA8wm+MOnAfc7gXyU4e4yDCj3
 o1QJn8csjBvHfAMLBZhvtqgBwIwUywy9/hJ2ds9idO0QV5BaEy0+XlNJJ3lpHuK61Hx4
 9RKM2jl0q+oikBArYafrZFado5PbgFBfejiZVaO7E2VwvmijVDDhRep86oM35WcMidCA
 wKo/ubHnp0r3z73sEKSGlTzhS6tuLbPtAqiDCJAylbNeMg8b12tTOyb986rDZT7mmfAx
 +pC4jIyB8DyqLRUMR/icmP57Q1La54iy9NlfKTAg96vj7lEbMBg2Lraolrq5b6dIt4+I VA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usdbn9u8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 23:55:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4NtjLc029701
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Dec 2023 23:55:45 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Dec 2023 15:55:44 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2] drm/msm/dpu: improve DSC allocation
Date: Mon, 4 Dec 2023 15:55:34 -0800
Message-ID: <1701734134-7816-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QcWiVb30s17goeulHLsgXTWgn4FSol_h
X-Proofpoint-GUID: QcWiVb30s17goeulHLsgXTWgn4FSol_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_22,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=838 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312040188
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

A DCE (Display Compression Engine) contains two DSC hard slice
encoders. Each DCE start with even DSC encoder index followed by
an odd DSC encoder index. Each encoder can work independently.
But Only two DSC encoders from same DCE can be paired to work
together to support merge mode. In addition, the DSC with even
index have to mapping to even pingpong index and DSC with odd
index have to mapping to odd pingpong index at its data path.
This patch improve DSC allocation mechanism with consideration
of above factors.

Changes in V2:
-- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
   _dpu_rm_reserve_dsc_pair()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171 ++++++++++++++++++++++++++++++---
 1 file changed, 156 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 17ecf23..dafe1ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -470,33 +470,174 @@ static int _dpu_rm_reserve_ctls(
 	return 0;
 }
 
-static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
+static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       struct drm_encoder *enc,
+			       uint32_t enc_id,
 			       const struct msm_display_topology *top)
 {
-	int num_dsc = top->num_dsc;
-	int i;
+	int num_dsc = 0;
+	int i, pp_idx;
+	int dsc_idx[DSC_MAX - DSC_0];
+	uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
+	int pp_max = PINGPONG_MAX - PINGPONG_0;
+
+	for (i = 0; i < DSC_MAX - DSC_0; i++)
+		dsc_idx[i] = 0;
+
+	/* fill working copy with pingpong list */
+	memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
+
+	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {
+		if (!rm->dsc_blks[i])
+			continue;
 
-	/* check if DSC required are allocated or not */
-	for (i = 0; i < num_dsc; i++) {
-		if (!rm->dsc_blks[i]) {
-			DPU_ERROR("DSC %d does not exist\n", i);
-			return -EIO;
+		if (global_state->dsc_to_enc_id[i])	/* used */
+			continue;
+
+		/*
+		 * find the pingpong index which had been reserved
+		 * previously at layer mixer allocation
+		 */
+		for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
+			if (pp_to_enc_id[pp_idx] == enc_id)
+				break;
 		}
 
-		if (global_state->dsc_to_enc_id[i]) {
-			DPU_ERROR("DSC %d is already allocated\n", i);
-			return -EIO;
+		/*
+		 * dsc even index must map to pingpong even index
+		 * dsc odd index must map to pingpong odd index
+		 */
+		if ((i & 0x01) != (pp_idx & 0x01))
+			continue;
+
+		dsc_idx[num_dsc++] = i + 1;	/* found, start from 1 */
+	}
+
+	if (num_dsc < top->num_dsc) {
+		DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
+						num_dsc, top->num_dsc);
+		return -ENAVAIL;
+	}
+
+	/* reserve dsc */
+	for (i = 0; i < top->num_dsc; i++) {
+		int j;
+
+		j = dsc_idx[i];
+		if (j)
+			global_state->dsc_to_enc_id[j-1] = enc_id;
+	}
+
+	return 0;
+}
+
+static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t enc_id,
+			       const struct msm_display_topology *top)
+{
+	int num_dsc = 0;
+	int i, pp_idx;
+	int dsc_idx[DSC_MAX - DSC_0];
+	uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
+	int pp_max = PINGPONG_MAX - PINGPONG_0;
+
+	for (i = 0; i < DSC_MAX - DSC_0; i++)
+		dsc_idx[i] = 0;
+
+	/* fill working copy with pingpong list */
+	memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
+
+	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {
+		if (!rm->dsc_blks[i])
+			continue;
+
+		if (global_state->dsc_to_enc_id[i]) {	/* used */
+			/* consective dsc index to be paired */
+			if (num_dsc) {	/* already start pairing, re start search */
+				num_dsc = 0;
+				/* fill working copy with pingpong list */
+				memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
+								sizeof(pp_to_enc_id));
+			}
+			continue;
+		}
+
+		/* odd index can not become start of pairing */
+		if (i & 0x01 && !num_dsc)
+			continue;
+
+		/*
+		 * find the pingpong index which had been reserved
+		 * previously at layer mixer allocation
+		 */
+		for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
+			if (pp_to_enc_id[pp_idx] == enc_id)
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
+		 * delete pp_idx so that next pp_idx can be paired with
+		 * next dsc_idx
+		 */
+		pp_to_enc_id[pp_idx] = 0xffff;
+
+		dsc_idx[num_dsc++] = i + 1;	/* found, start from 1 */
 	}
 
-	for (i = 0; i < num_dsc; i++)
-		global_state->dsc_to_enc_id[i] = enc->base.id;
+	if (num_dsc < top->num_dsc) {
+		DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
+						num_dsc, top->num_dsc);
+		return -ENAVAIL;
+	}
+
+	/* reserve dsc */
+	for (i = 0; i < top->num_dsc; i++) {
+		int j;
+
+		j = dsc_idx[i];
+		if (j)
+			global_state->dsc_to_enc_id[j-1] = enc_id;
+	}
 
 	return 0;
 }
 
+static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t enc_id,
+			       const struct msm_display_topology *top)
+{
+	if (!top->num_dsc || !top->num_intf)
+		return 0;
+
+	/*
+	 * Truth:
+	 * 1) every layer mixer only connects to one pingpong
+	 * 2) no pingpong split -- which is two layer mixers shared one pingpong
+	 * 3) each DSC engine contains two dsc encoders
+	 *    -- index(0,1), index (2,3),... etc
+	 * 4) dsc pair can only happens with same DSC engine
+	 * 5) odd pingpong connect to odd dsc
+	 * 6) even pingpong connect to even dsc
+	 * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
+			    +--> pp_idx_1 --> dsc_idx_1
+	 */
+
+	/* num_dsc should be either 1, 2 or 4 */
+	if (top->num_dsc > top->num_intf)	/* merge mode */
+		return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
+	else
+		return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);
+}
+
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -518,7 +659,7 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
-	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc->base.id, &reqs->topology);
 	if (ret)
 		return ret;
 
-- 
2.7.4

