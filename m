Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334E811DAB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 19:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367710E12D;
	Wed, 13 Dec 2023 18:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4F10E12D;
 Wed, 13 Dec 2023 18:58:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDHhTWM018512; Wed, 13 Dec 2023 18:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type; s=
 qcppdkim1; bh=HnbiFdeXaBpD/ly87YP7EIgnbAl0ppzelNTm3H7KtII=; b=NO
 LKVW+1JBqKFPFegWfhxinz7qLjeeXK3MwHnNKlKKuAbdRBA+iYHnuaMdE0+do5o9
 RohsW3VREPAzI6/JwPqb/JXFNQJ79kY4fMCZAKB+uMFNdq0ICKqlGrcFGMh/Dv0V
 9z68tZRUwAUzIyniqhLart/d9XjLJWFYN+HKWfi5rlVa6XR+efQXhXu1gZiqmPWi
 HMu6J8/fV5O9G3Q+YyP49QQeW/YXF7TZh+IO5nOhiyuFRZu3H2RyyKjVte5vj2yK
 oqUyfi1SQG47NL2xWTIVoGb0RTxGMV3uGARhUjs4W1ONy7RGoQ9pMQBir70bArTe
 Ix7kOKC9tKxwbUyAfFbQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy9gd1dsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 18:58:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDIwBRF005849
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 18:58:11 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 10:58:10 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v5] drm/msm/dpu: improve DSC allocation
Date: Wed, 13 Dec 2023 10:58:03 -0800
Message-ID: <1702493883-30148-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: E9B7IaHlpTTYE0L2gzpIebJ5JNmClQ4o
X-Proofpoint-GUID: E9B7IaHlpTTYE0L2gzpIebJ5JNmClQ4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=784
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130136
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

At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
index and another one has an even index. Each encoder can work
independently. But only two DSC encoders from same DCE can be paired
to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
two consecutive DSC encoders (start with even index) have to be paired
to support DSC merge mode.  In addition, the DSC with even index have
to be mapped to even PINGPONG index and DSC with odd index have to be
mapped to odd PINGPONG index at its data path in regardless of DSC
V1.1 or V1.2. This patch improves DSC allocation mechanism with
consideration of those factors.

Changes in V5:
-- delete dsc_id[]
-- update to global_state->dsc_to_enc_id[] directly
-- replace ndx with idx
-- fix indentation at function declaration
-- only one for loop at _dpu_rm_reserve_dsc_single()

Changes in V4:
-- rework commit message
-- use reserved_by_other()
-- add _dpu_rm_pingpong_next_index()
-- revise _dpu_rm_pingpong_dsc_check()

Changes in V3:
-- add dpu_rm_pingpong_dsc_check()
-- for pair allocation use i += 2 at for loop

Changes in V2:
    -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
       _dpu_rm_reserve_dsc_pair()

Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 162 +++++++++++++++++++++++++++++----
 1 file changed, 146 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9215643..7c7a88f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -461,29 +461,159 @@ static int _dpu_rm_reserve_ctls(
 	return 0;
 }
 
-static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
-			       struct dpu_global_state *global_state,
-			       struct drm_encoder *enc,
-			       const struct msm_display_topology *top)
+static int _dpu_rm_pingpong_next_index(int start,
+				       uint32_t enc_id,
+				       uint32_t *pp_to_enc_id,
+				       int pp_max)
 {
-	int num_dsc = top->num_dsc;
 	int i;
 
-	/* check if DSC required are allocated or not */
-	for (i = 0; i < num_dsc; i++) {
-		if (!rm->dsc_blks[i]) {
-			DPU_ERROR("DSC %d does not exist\n", i);
-			return -EIO;
-		}
+	for (i = start; i < pp_max; i++) {
+		if (pp_to_enc_id[i] == enc_id)
+			return i;
+	}
+
+	return -ENAVAIL;
+}
+
+static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
+{
+
+	/*
+	 * DSC with even index must be used with the PINGPONG with even index
+	 * DSC with odd index must be used with the PINGPONG with odd index
+	 */
+	if ((dsc_idx & 0x01) != (pp_idx & 0x01))
+		return -ENAVAIL;
+
+	return 0;
+}
+
+static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
+				      struct dpu_global_state *global_state,
+				      uint32_t enc_id,
+				      const struct msm_display_topology *top)
+{
+	int num_dsc = 0;
+	uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
+	uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
+	int pp_max = PINGPONG_MAX - PINGPONG_0;
+	int pp_idx;
+	int dsc_idx;
+	int ret;
+
+	for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
+			  num_dsc < 1; dsc_idx++) {
+		if (!rm->dsc_blks[dsc_idx])
+			continue;
+
+		if (reserved_by_other(dsc_enc_id, dsc_idx, enc_id))
+			continue;
+
+		pp_idx = _dpu_rm_pingpong_next_index(0, enc_id,
+						     pp_to_enc_id, pp_max);
+		if (pp_idx < 0)
+			return -ENAVAIL;
+
+		ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
+		if (ret)
+			return -ENAVAIL;
+
+		dsc_enc_id[dsc_idx] = enc_id;
+		num_dsc++;
+	}
+
+	if (!num_dsc) {
+		DPU_ERROR("DSC allocation failed num_dsc=%d\n", num_dsc);
+		return -ENAVAIL;
+	}
 
-		if (global_state->dsc_to_enc_id[i]) {
-			DPU_ERROR("DSC %d is already allocated\n", i);
-			return -EIO;
+	return 0;
+}
+
+static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
+				    struct dpu_global_state *global_state,
+				    uint32_t enc_id,
+				    const struct msm_display_topology *top)
+{
+	int num_dsc = 0;
+	uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
+	uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
+	int pp_max = PINGPONG_MAX - PINGPONG_0;
+	int start_pp_idx = 0;
+	int dsc_idx, pp_idx;
+	int ret;
+
+	/* only start from even dsc index */
+	for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
+			  num_dsc < top->num_dsc; dsc_idx += 2) {
+		if (!rm->dsc_blks[dsc_idx] ||
+		    !rm->dsc_blks[dsc_idx + 1])
+			continue;
+
+		/* consective dsc index to be paired */
+		if (reserved_by_other(dsc_enc_id, dsc_idx, enc_id) ||
+		    reserved_by_other(dsc_enc_id, dsc_idx + 1, enc_id))
+			continue;
+
+		pp_idx = _dpu_rm_pingpong_next_index(start_pp_idx, enc_id,
+						     pp_to_enc_id, pp_max);
+		if (pp_idx < 0)
+			return -ENAVAIL;
+
+		ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
+		if (ret) {
+			pp_idx = 0;
+			continue;
 		}
+
+		pp_idx = _dpu_rm_pingpong_next_index(pp_idx + 1, enc_id,
+						     pp_to_enc_id, pp_max);
+		if (pp_idx < 0)
+			return -ENAVAIL;
+
+		dsc_enc_id[dsc_idx] = enc_id;
+		dsc_enc_id[dsc_idx + 1] = enc_id;
+		num_dsc += 2;
+
+		start_pp_idx = pp_idx + 1;	/* start for next pair */
 	}
 
-	for (i = 0; i < num_dsc; i++)
-		global_state->dsc_to_enc_id[i] = enc->base.id;
+	if (num_dsc < top->num_dsc) {
+		DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
+						num_dsc, top->num_dsc);
+		return -ENAVAIL;
+	}
+
+	return 0;
+}
+
+static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       struct drm_encoder *enc,
+			       const struct msm_display_topology *top)
+{
+	uint32_t enc_id = enc->base.id;
+
+	if (!top->num_dsc || !top->num_intf)
+		return 0;
+
+	/*
+	 * Facts:
+	 * 1) DSCs ouput to an interface
+	 * 2) no pingpong split (two layer mixers shared one pingpong)
+	 * 3) DSC pair start from even index, such as index(0,1), (2,3), etc
+	 * 4) even PINGPONG connects to even DSC
+	 * 5) odd PINGPONG connects to odd DSC
+	 * 6) pair: encoder +--> pp_idx_0 --> dsc_idx_0
+	 *                  +--> pp_idx_1 --> dsc_idx_1
+	 */
+
+	/* num_dsc should be either 1, 2 or 4 */
+	if (top->num_dsc > top->num_intf)	/* merge mode */
+		return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
+	else
+		return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);
 
 	return 0;
 }
-- 
2.7.4

