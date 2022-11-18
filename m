Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BA62F458
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 13:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A973610E70F;
	Fri, 18 Nov 2022 12:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E181110E70D;
 Fri, 18 Nov 2022 12:16:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIBjdMG029423; Fri, 18 Nov 2022 12:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=FcBLrYDz5MLJ+JQbxLtt5oyeeAzeEZbn+lgGXcvd7CA=;
 b=pYdCHEIOSejvvZaJXtigtufXDc5Qx9edu09VkiLwC9ZqRkpSXHKRVYIlb4QAB/aSJ32O
 dtMi9xGwjzf0LvOa5Hk4sTe3fhKA/jUe/DXa9ugelIOZ3HZDEj1LCzy3bn3woyZHMF2e
 dBEeCSThS+4Pu4YEM4DyKpb9/NBocYp6MWUvGTniy6rvo9fjQXeopykKHIpgNIeYZslb
 g8CVMKNJvg3O+o7kFW7vJL7f3638x7lP2W6qOmg+BU4QX0aXay8mb0l5fWjWKHUvt618
 FRqPFNy7QgepcnnqFb9tei5qyD0Kyu8UQm6G0KidLUpvvKB08DIsb0LbZyTOq5XEsj/v Sw== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0se9jxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 12:16:54 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AICGokZ013696; 
 Fri, 18 Nov 2022 12:16:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kt4jkkc6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Nov 2022 12:16:51 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AICGoTl013689;
 Fri, 18 Nov 2022 12:16:50 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2AICGoN8013687;
 Fri, 18 Nov 2022 12:16:50 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 8EBF52F35; Fri, 18 Nov 2022 04:16:49 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Date: Fri, 18 Nov 2022 04:16:45 -0800
Message-Id: <1668773807-19598-2-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
References: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: t6XeefnkvIFNUrbioQQLbut3W0meHsXL
X-Proofpoint-ORIG-GUID: t6XeefnkvIFNUrbioQQLbut3W0meHsXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211180073
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
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pin each crtc with one encoder. This arrangement will
disallow crtc switching between encoders and also will
facilitate to advertise certain features on crtc based
on encoder type.

Changes in v1:
- use drm_for_each_encoder macro while iterating through
  encoder list (Dmitry)

Changes in v2:
- make sure no encoder miss to have a crtc (Dmitry)
- revisit various factors in deciding the crtc count
  such as num_mixers, num_sspp (Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a5fabc..4784db8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -763,7 +763,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	drm_for_each_encoder(encoder, dev)
 		num_encoders++;
 
-	max_crtc_count = min(catalog->mixer_count, num_encoders);
+	max_crtc_count = num_encoders;
 
 	/* Create the planes, keeping track of one primary/cursor per crtc */
 	for (i = 0; i < catalog->sspp_count; i++) {
@@ -795,22 +795,25 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
-	max_crtc_count = min(max_crtc_count, primary_planes_idx);
+	/*
+	 * All the platforms should have at least 1 primary plane for an
+	 * encoder. The below warn should help in setting up the catalog
+	 */
+	WARN_ON(num_encoders > primary_planes_idx);
 
 	/* Create one CRTC per encoder */
-	for (i = 0; i < max_crtc_count; i++) {
+	i = 0;
+	drm_for_each_encoder(encoder, dev) {
 		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
 		priv->crtcs[priv->num_crtcs++] = crtc;
+		encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
+		i++;
 	}
 
-	/* All CRTCs are compatible with all encoders */
-	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
-
 	return 0;
 }
 
-- 
2.7.4

