Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C25694408
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F50E10E568;
	Mon, 13 Feb 2023 11:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A11810E559;
 Mon, 13 Feb 2023 11:11:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31D8sM8a004355; Mon, 13 Feb 2023 11:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=/41C6LTPlDbTiWcxo7yorrzxHYe7ok4515BXT+VEnI0=;
 b=A1qoF6odg2YV0qzNamuKV68fuy3disqHbjtHLtt5ui3K6/Jzhs2PXSGapZK8V9bywmjN
 lEbdcYwCwNgYq7sTXhJ9bofahT7kbawycdbKtFruDwYVn2VPsOfeNPhMncIFmFjwp+xP
 f9nZW7ieProSR2neDLhn4dXob4+pyL+/GIH6ItHYuED+ckskbZZ4FYAbQkS17GmSHmFv
 RPrwdg8FTMRi816c+WcuUZZp1VbWLu4pa+QPRqwEXReiMY0HZlhS60WIEtPRJRuc50+N
 9FNO16ehpJf1FomzmpkKOkHKYGrrBGQETETOhBRmmq4zonhi23C99jw7Orkv4UGnNQz9 /Q== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3npmvrjkb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 11:11:53 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 31DBBn6D018454; 
 Mon, 13 Feb 2023 11:11:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3np43k9ktb-1;
 Mon, 13 Feb 2023 11:11:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DBBn3p018427;
 Mon, 13 Feb 2023 11:11:49 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 31DBBn7H018419;
 Mon, 13 Feb 2023 11:11:49 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 67CF04C07; Mon, 13 Feb 2023 03:11:48 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 2/4] drm/msm/dpu: add DSPPs into reservation upon a CTM
 request
Date: Mon, 13 Feb 2023 03:11:42 -0800
Message-Id: <1676286704-818-3-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hdXeWfzgj4F4qO2oPB1Uw83uk4vfJruK
X-Proofpoint-GUID: hdXeWfzgj4F4qO2oPB1Uw83uk4vfJruK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_06,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 mlxlogscore=690 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130101
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DSPP blocks into the topology for reservation, if there
is a CTM request for that composition.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v1:
- Minor nits (Dmitry)

Changes in v2:
- Populate DSPPs into the reservation only if CTM is requested (Dmitry)
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..46d2a5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
-			struct drm_display_mode *mode)
+			struct drm_display_mode *mode,
+			struct drm_crtc_state *crtc_state)
 {
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
@@ -563,8 +564,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * Adding color blocks only to primary interface if available in
-	 * sufficient number
+	 * Add dspps to the reservation requirements if ctm is requested
 	 */
 	if (intf_count == 2)
 		topology.num_lm = 2;
@@ -573,11 +573,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
-		if (dpu_kms->catalog->dspp &&
-			(dpu_kms->catalog->dspp_count >= topology.num_lm))
-			topology.num_dspp = topology.num_lm;
-	}
+	if (crtc_state->ctm)
+		topology.num_dspp = topology.num_lm;
 
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
@@ -643,7 +640,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
-- 
2.7.4

