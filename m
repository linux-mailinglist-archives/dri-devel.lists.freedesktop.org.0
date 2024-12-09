Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E109EA121
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 22:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C0610E35A;
	Mon,  9 Dec 2024 21:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="e5IaJets";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21F410E35A;
 Mon,  9 Dec 2024 21:18:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9EdRSg014059;
 Mon, 9 Dec 2024 21:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=m4aexAuehak7NvIr5DBeNT
 ST/5O6gO4/ijkd0L5X0Ac=; b=e5IaJetsaf5dkghK9LGV13GQ/CogWR9m+JOQH8
 K0D3LNmRaUKXOZVhJdlLdyvu6nMPHW2qo+eZwL0UrKb2izia7VIzv5mkNQyJ8uy8
 mJ7nqTaVes2XWv7lX5xxp4Nc8JdB/xuVS3Nwi8881CoZchkPX7o6RcF6/abCGXqO
 rFliLhb6X+7DjVU2rPNMpiwFfTSnoAaysTim8+h7XZqzCdT22ZbxWAJ057t1EvBT
 P/Bs9wYPiQDs8WnfbZYID2Y63AC68Ib+l6aRQsQfOPwTUlaCdD53K04BmQ7G/pRb
 IrIdmUKUPny3s5hb8sBOasyT4A1TQKoBVppgUJ8HaGF9fXJQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyajdhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 21:18:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9LInjL014936
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Dec 2024 21:18:49 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 13:18:48 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 9 Dec 2024 13:18:36 -0800
Subject: [PATCH v3] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKteV2cC/22MQQ7CIBQFr2JYi4GPQOrKexhjEH4ti4KCJTVN7
 y7tqiYu5+XNTCRj8pjJaTeRhMVnH0MFsd8R25nwQOpdZQIMjhyYoiHehOuHkUrgRko0TKmG1Ps
 zYevHNXW5Vu58fsf0WcuFL+ufSOGUUw3GgdLaCBDn1+CtD/ZgY0+WTIGt2mxUqGprjWNS470B/
 FXnef4C9ISFKd0AAAA=
X-Change-ID: 20241206-no_3dmux-521a55ea0669
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733779128; l=2426;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=7kvToMBXdYqpEIXrA50nuIAE88nkuOk3HhqCjzra2QE=;
 b=s6b9vYaESa/PfvO58cC3eeh68nFxSNvZQdUHTsjLtAZltC9Q1d9pNvTASyK0baxXIwWQ6R2Ga
 ntfGDXqc0D8D6bcLUgpXw2pTfrJJKt4ZyzOxMAKXohIhMx+fB4qdmpN
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _TpW9S-WTswLce43EkocgAekO-cQEY7Y
X-Proofpoint-ORIG-GUID: _TpW9S-WTswLce43EkocgAekO-cQEY7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxlogscore=669 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090165
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On chipsets such as QCS615, there is no 3dmux present. In such
a case, a layer exceeding the max_mixer_width cannot be split,
hence cannot be supported.

Filter out the modes which exceed the max_mixer_width when there
is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
to return failure for such modes.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Note: this was only compile tested, so its pending validation on QCS615
---
Changes in v3:
- Move && to previous line
- Link to v2: https://lore.kernel.org/r/20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com

Changes in v2:
- replace MODE_BAD with MODE_BAD_HVALUE to indicate the failure better
- Link to v1: https://lore.kernel.org/r/20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f6ffd344693ecfb633095772a31ada5613345dc..ad3462476a143ec01a3b8817a2c85b0f50435a9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
+	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
+	 * before even checking the width after the split
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge &&
+	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return -E2BIG;
+
 	for (i = 0; i < cstate->num_mixers; i++) {
 		struct drm_rect *r = &cstate->lm_bounds[i];
 		r->x1 = crtc_split_width * i;
@@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
+	/* if there is no 3d_mux block we cannot merge LMs so we cannot
+	 * split the large layer into 2 LMs, filter out such modes
+	 */
+	if (!dpu_kms->catalog->caps->has_3d_merge &&
+	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
+		return MODE_BAD_HVALUE;
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */

---
base-commit: af2ea8ab7a546b430726183458da0a173d331272
change-id: 20241206-no_3dmux-521a55ea0669

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

