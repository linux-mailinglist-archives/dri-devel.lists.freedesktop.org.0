Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0D70774B
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 03:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B67B10E4D2;
	Thu, 18 May 2023 01:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5544510E4C6;
 Thu, 18 May 2023 01:14:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34I0vaiF015463; Thu, 18 May 2023 01:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=FcSdjQh5mdW+bcWXKi0TH0pFKBv9WTDlxBXYpJrwgNA=;
 b=oVRzUk2r9JGsJTyk8s/s1yAT7ZOAvVjl4C2sB1Jfsh5VbfwNKat89kOnsU1wIaQzfFtc
 xIkRIVHtbgj+Ek7A5tEjzAIGxvT0J87oxkIdfZp7z0UIO6yqqRhMe0NuTSCVpBikhBDV
 e1B5aBgjbmaGCCJhBXdKj4ppXakVG1fhLkFP7Ui3uwTqdDTlrryFzRkoPLGZBFeUflAt
 cVMNNxyDk/hEEv5DAmnS/2isJdcq0c5oj6R8MQvL981vQJUrkoM/cj5UZZNBhIfAiPkq
 uMXbFUSryCM5KMdVy4UiOIoGbmkAzA206FpN4iPsOtySiZui5PTKo8BduYt/5bAQ4hI6 Ow== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmts2a45r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I1Ed7W003076
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:39 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 18:14:39 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 17 May 2023 18:14:29 -0700
Subject: [PATCH v13 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v13-3-d7581e7becec@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684372478; l=1320;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=sjbju8Rx6XS+h75pST5l3yWBEWY/UZ6jB96HfzV32oE=;
 b=RFV1l3H4Z4NRgxzmozJA6q3Pe3QR3jfK0TKbaQ3SFqAahhM8paZbSweGsN6i50wv5V1gUUE5r
 OyIsd4nbGOJBk7/zQ4MS6JcGa/C6uDA1PJAGLCnIzGHJSwUeB9vnSoG
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Mf2yVZuRkiy7KMPJLW7OhW7hUpXw3ldd
X-Proofpoint-ORIG-GUID: Mf2yVZuRkiy7KMPJLW7OhW7hUpXw3ldd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_05,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=922 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305180006
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

Add helper to get the integer value of drm_dsc_config.bits_per_pixel

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 include/drm/display/drm_dsc_helper.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index e0cbc38ada26..7bf7e8ff8eb4 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -9,6 +9,7 @@
 #define DRM_DSC_HELPER_H_
 
 #include <drm/display/drm_dsc.h>
+#include <linux/bug.h>
 
 enum drm_dsc_params_type {
 	DRM_DSC_1_2_444,
@@ -26,6 +27,12 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
 
+static inline u32 drm_dsc_get_bpp_int(const struct drm_dsc_config *dsc)
+{
+	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
+	return dsc->bits_per_pixel >> 4;
+}
+
 static inline u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
 {
 	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);

-- 
2.40.1

