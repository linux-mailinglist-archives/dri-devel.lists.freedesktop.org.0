Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DE622B4B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C3E10E5B9;
	Wed,  9 Nov 2022 12:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BDF10E4D1;
 Wed,  9 Nov 2022 12:16:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9AvWEE002199; Wed, 9 Nov 2022 12:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=MSrVexxyBZ4hcfWqH3Zo/PYvPduj+u8s7BV7aJw1Aig=;
 b=othPQ2fLf3MYWU/SfDo5VqeNy+bkcP5JNsc4O+jQBSYYIaqPLNghB8N9IT/LYDINDQJl
 IMnMhILp84VWb4pfAR1YLG9spmVv8bIk75ieRXjGskEuPrYPXtlkQpHlM4t2eQpcLJ89
 h9kx63qb22npWOnWhiv6OGBpngHqyvNIuN6EmSt0MBzX56QEix7pd11Arntqo/Ubn6q9
 139Q/xoEuYWh/bp0oFx/dg7Oi+u1eMu/Q21Wl8PWOF/GtyeCzicTcrtK93q5nm4+hyK/
 5l9LvHLuUO7BG6OYHCNixTSOad07ITdHfDpt4qQZ24u+ItbkILpFePF4OJcxzqHYRXgP HA== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kr6e4ry74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 12:16:54 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A9CGpPT008029; 
 Wed, 9 Nov 2022 12:16:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3kngwkn0wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 09 Nov 2022 12:16:51 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A9CGobN008023;
 Wed, 9 Nov 2022 12:16:50 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2A9CGoV5008021;
 Wed, 09 Nov 2022 12:16:50 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 8E8E548B5; Wed,  9 Nov 2022 04:16:49 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/4] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Date: Wed,  9 Nov 2022 04:16:43 -0800
Message-Id: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DsE0kOQSZiIbp7zPjPOAwmHSacVmU_Zk
X-Proofpoint-GUID: DsE0kOQSZiIbp7zPjPOAwmHSacVmU_Zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_05,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211090094
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

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a5fabc..552a89c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -798,19 +798,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
 
 	/* Create one CRTC per encoder */
+	encoder = list_first_entry(&(dev)->mode_config.encoder_list,
+		struct drm_encoder, head);
 	for (i = 0; i < max_crtc_count; i++) {
 		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
-		if (IS_ERR(crtc)) {
+		if (IS_ERR(crtc) || IS_ERR_OR_NULL(encoder)) {
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
 		priv->crtcs[priv->num_crtcs++] = crtc;
+		encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
+		encoder = list_next_entry(encoder, head);
 	}
 
-	/* All CRTCs are compatible with all encoders */
-	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
-
 	return 0;
 }
 
-- 
2.7.4

