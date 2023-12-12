Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527DB80F98C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 22:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93010E691;
	Tue, 12 Dec 2023 21:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD70D10E214;
 Tue, 12 Dec 2023 21:37:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCKPSWg015264; Tue, 12 Dec 2023 21:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type; s=
 qcppdkim1; bh=hhsGxU/qWWOqfefKWpO0M9yGwPlrA51ZAFdB+LK78Og=; b=Ui
 sptYPt716hImd/Wpp8ZWpfvgsnD+3GnGRifTszBvOao18y+UlZW07FGYTa+Wcg/T
 w/6NC98YgN6p+ojt1c8hNhO3tQLjfK+fnRf80O1fUPzG56/csQFeGfNysy8sGAdD
 dwm10eYc0S8iSsWkyru7MfLbtHLf1FkmOmVKYQZY8tVXIz5XTao/3fEP4mtA6gpB
 khWBTk2BULdnGDp5hBuIakmUIZQysgrcyN26cITQpcApjWIylSqHSAeO0vedYKyV
 sOkF6N9GNCeN5gRFQGgQByaRyeN1EEjOs/FK2HJR/GbnhR3TP/u9Y6NuhlwGp+b4
 7dtfr+7j9XAMA5nko6Mw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux6533k1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 21:37:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCLblA7020621
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 21:37:47 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 13:37:47 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v4] drm/msm/dpu: improve DSC allocation
Date: Tue, 12 Dec 2023 13:37:38 -0800
Message-ID: <1702417058-24257-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hgp7sv2OQkzQ8rgJsZBH2vaoEjJNLrBL
X-Proofpoint-GUID: hgp7sv2OQkzQ8rgJsZBH2vaoEjJNLrBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=684 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120167
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 178 ++++++++++++++++++++++++++++++---
 1 file changed, 163 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9215643..15317b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -461,29 +461,177 @@ static int _dpu_rm_reserve_ctls(
 	return 0;
 }
 
-static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
+static int _dpu_rm_pingpong_next_index(int start,
+				 uint32_t enc_id,
+				 uint32_t *pp_to_enc_id,
+				 int pp_max)
+{
+	int pp_ndx;
+
+	for (pp_ndx = start; pp_ndx < pp_max; pp_ndx++) {
+		if (pp_to_enc_id[pp_ndx] == enc_id)
+			return pp_ndx;
+	}
+
+	return -ENAVAIL;
+}
+
+static int _dpu_rm_pingpong_dsc_check(int dsc_ndx, int pp_ndx)
+{
+
+	/*
+	 * dsc even index must be mapped to pingpong even index
+	 * dsc odd index must be mapped to pingpong odd index
+	 */
+	if ((dsc_ndx & 0x01) != (pp_ndx & 0x01))
+		return -ENAVAIL;
+
+	return 0;
+}
+
+static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       struct drm_encoder *enc,
+			       uint32_t enc_id,
+			       int *dsc_id,
 			       const struct msm_display_topology *top)
 {
-	int num_dsc = top->num_dsc;
-	int i;
+	int num_dsc = 0;
+	uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
+	uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
+	int pp_max = PINGPONG_MAX - PINGPONG_0;
+	int pp_ndx;
+	int dsc_ndx;
+	int ret;
 
-	/* check if DSC required are allocated or not */
-	for (i = 0; i < num_dsc; i++) {
-		if (!rm->dsc_blks[i]) {
-			DPU_ERROR("DSC %d does not exist\n", i);
-			return -EIO;
-		}
+	for (dsc_ndx = 0; dsc_ndx < ARRAY_SIZE(rm->dsc_blks); dsc_ndx++) {
+		if (!rm->dsc_blks[dsc_ndx])
+			continue;
+
+		if (reserved_by_other(dsc_enc_id, dsc_ndx, enc_id))
+			continue;
+
+		pp_ndx = _dpu_rm_pingpong_next_index(0, enc_id, pp_to_enc_id, pp_max);
+		if (pp_ndx < 0)
+			return -ENAVAIL;
+
+		ret = _dpu_rm_pingpong_dsc_check(dsc_ndx, pp_ndx);
+		if (ret)
+			return -ENAVAIL;
+
+		dsc_id[num_dsc++] = DSC_0 + dsc_ndx;	/* found */
+
+		if (num_dsc >= top->num_dsc)
+			break;
+	}
 
-		if (global_state->dsc_to_enc_id[i]) {
-			DPU_ERROR("DSC %d is already allocated\n", i);
-			return -EIO;
+	if (num_dsc < top->num_dsc) {
+		DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
+						num_dsc, top->num_dsc);
+		return -ENAVAIL;
+	}
+
+	return 0;
+}
+
+static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t enc_id,
+			       int *dsc_id,
+			       const struct msm_display_topology *top)
+{
+	int num_dsc = 0;
+	uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
+	uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
+	int pp_max = PINGPONG_MAX - PINGPONG_0;
+	int start_pp_ndx = 0;
+	int dsc_ndx, pp_ndx;
+	int ret;
+
+	/* only start from even dsc index */
+	for (dsc_ndx = 0; dsc_ndx < ARRAY_SIZE(rm->dsc_blks); dsc_ndx += 2) {
+		if (!rm->dsc_blks[dsc_ndx] || !rm->dsc_blks[dsc_ndx + 1])
+			continue;
+
+		/* consective dsc index to be paired */
+		if (reserved_by_other(dsc_enc_id, dsc_ndx, enc_id) ||
+				reserved_by_other(dsc_enc_id, dsc_ndx + 1, enc_id))
+			continue;
+
+		pp_ndx = _dpu_rm_pingpong_next_index(start_pp_ndx, enc_id, pp_to_enc_id, pp_max);
+		if (pp_ndx < 0)
+			return -ENAVAIL;
+
+		ret = _dpu_rm_pingpong_dsc_check(dsc_ndx, pp_ndx);
+		if (ret) {
+			pp_ndx = 0;
+			continue;
 		}
+
+		pp_ndx = _dpu_rm_pingpong_next_index(pp_ndx + 1, enc_id, pp_to_enc_id, pp_max);
+		if (pp_ndx < 0)
+			return -ENAVAIL;
+
+		/* pair found */
+		dsc_id[num_dsc++] = DSC_0 + dsc_ndx;
+		dsc_id[num_dsc++] = DSC_0 + dsc_ndx + 1;
+
+		start_pp_ndx = pp_ndx + 1;	/* start for next pair */
+
+		if (num_dsc >= top->num_dsc)
+			break;
+	}
+
+	if (num_dsc < top->num_dsc) {
+		DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
+						num_dsc, top->num_dsc);
+		return -ENAVAIL;
 	}
 
-	for (i = 0; i < num_dsc; i++)
-		global_state->dsc_to_enc_id[i] = enc->base.id;
+	return 0;
+}
+
+static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       struct drm_encoder *enc,
+			       const struct msm_display_topology *top)
+{
+	uint32_t enc_id = enc->base.id;
+	int dsc_id[DSC_MAX - DSC_0];
+	int i, ret;
+
+	if (!top->num_dsc || !top->num_intf)
+		return 0;
+
+	memset(dsc_id, 0, sizeof(dsc_id));
+
+	/*
+	 * Truth:
+	 * 1) every layer mixer only connects to one interface
+	 * 2) no pingpong split -- which is two layer mixers shared one pingpong
+	 * 3) DSC pair start from even index, such as index(0,1), index (2,3), etc
+	 * 4) odd pingpong connect to odd dsc
+	 * 5) even pingpong connect to even dsc
+	 * 6) pair: encoder +--> pp_idx_0 --> dsc_idx_0
+			    +--> pp_idx_1 --> dsc_idx_1
+	 */
+
+	/* num_dsc should be either 1, 2 or 4 */
+	if (top->num_dsc > top->num_intf)	/* merge mode */
+		ret =  _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, dsc_id, top);
+	else
+		ret =  _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, dsc_id, top);
+
+	if (ret)
+		return ret;
+
+	/* everything is good proceed to allocate dsc */
+	for (i = 0; i < top->num_dsc; i++) {
+		int id;
+
+		id = dsc_id[i];
+		if (id >= DSC_0)
+			global_state->dsc_to_enc_id[id - DSC_0] = enc_id;
+	}
 
 	return 0;
 }
-- 
2.7.4

