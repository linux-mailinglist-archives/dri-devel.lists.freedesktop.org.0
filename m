Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E822707736
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 03:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035910E4C3;
	Thu, 18 May 2023 01:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBFF10E4C1;
 Thu, 18 May 2023 01:14:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34I0rIbe021546; Thu, 18 May 2023 01:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=gNoqCNRNCNpkQ67n5X4OU/D0MPsC7jizsZ85ptmmnck=;
 b=GaH8u9VtaM1uwU9Lj8su4veoyAeLR6u92PgRZWmJMuOOnJa9Ehv51HIPIlLDPm6Q+ctc
 PoACe0BADoxfCDTkvrHjXImI4wjZ5ugFVw/Mlu0QGDSZQREvIQeo+Jo8x6kqf076pNZB
 PKyPBl7/NjAX6JKgar5Me6VYlFDZARIJTIdt4aocpr16dSKA1kCbSHAg6RBXOre2QTHO
 GOkz1/k3S7ZbCHoZ6968AJELRAxhIU9fstRVz70cnbD1s4s8w74TfnG+9/nFOKHUkA4t
 4ATOnksnrSnt61rVu9DppU4UKVOJo63surZ4Vjx+7enbTrbJvrtuqN6q+wAPd9LoIbX8 Nw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmnypjpbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I1EcMo001628
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:39 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 18:14:38 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 17 May 2023 18:14:27 -0700
Subject: [PATCH v13 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v13-1-d7581e7becec@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684372478; l=1239;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=3fkPhmvTBx2rVyWf9UTbIpAw0E4DkWKcYsbd6Qc3qM4=;
 b=Bdb18JWBardlkgTdjEdpVH3bSjjNjcxT9ELb3IKlOXmnOjURjgemCsotszL3FbZUjXscEJKwW
 lHoMCxSCCVOAq7NjqruSDXlwSolt9tEGZIT/RkzVBkZE+e0Ei3V9YmX
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Q84MAT3VQmJnU17wlWOEsTPvKI4JMfDa
X-Proofpoint-ORIG-GUID: Q84MAT3VQmJnU17wlWOEsTPvKI4JMfDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180005
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to calculate det_thresh_flatness and initial_scale_value as
these calculations are defined within the DSC spec.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 include/drm/display/drm_dsc_helper.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index fc2104415dcb..753b0034eda7 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
+static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
+{
+	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
+}
+
+static inline u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
+{
+	return 2 << (dsc->bits_per_component - 8);
+}
+
 #endif /* _DRM_DSC_HELPER_H_ */
 

-- 
2.40.1

