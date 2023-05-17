Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1B707143
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 20:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF9610E462;
	Wed, 17 May 2023 18:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA2B10E25F;
 Wed, 17 May 2023 18:52:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HHlDul022846; Wed, 17 May 2023 18:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=OA8lyceil03TsVaVcMPxMOMJzeLCLiEwXaxWB1ibz1A=;
 b=E9/F4eSJes1CZ2B0ZYTDSORghBo6nRJLMMiXK4MyMoIdJtmJc880fyCp2rEHudrfRHnE
 RNIX378ZMpdZK/45tysA+eNz12ho2zxVQJ4xcoi4Z2kCIHPuHX9fAHv2Leb0Ayqb4lRb
 QhawUpZDXw4bYf54BqyOzk1qnL6NFGfGgo9hAdfo5EbUet6cgmrOQ2KHRBhL0XoQllq2
 MtPAcQfMVQO4ZHHEF68vRDzz9UN48u5GP+y7h414bkZsv0JQO62TiNGN5z3QXxk3RKgU
 VaAXIIkmw+Ua/x2qjIq4fE7EIo/fvGg8lKqWzNtipF0SPrzOBa3H/MDjLhX7MdhmE4KH +Q== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmk9m2b5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 18:52:23 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HIqMq3001913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 18:52:22 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 11:52:22 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 17 May 2023 11:51:12 -0700
Subject: [PATCH v11 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v11-3-30270e1eeac3@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684349541; l=1198;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=+0Kq1b99/0BgeKJJVe5tBRw+pclzLyY6kKF10ObSQ6A=;
 b=47xfofW+0/NOwmFTVu2etZJ39zo0k2PbhWZxF0Sb45CcigkaL9FfmSH/naAilJTIEy0Vr3wgq
 ZZZuO+lRPUpAak6K0oekZHdPAp03j1j0umM866QM2GaLbYwnC1zV+a+
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VI7E0DCPhumpwKg81pNCk02QGJBlSEZI
X-Proofpoint-ORIG-GUID: VI7E0DCPhumpwKg81pNCk02QGJBlSEZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_03,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=900 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170156
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

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 include/drm/display/drm_dsc_helper.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index ea99b0b90674..b7956830cab9 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -9,6 +9,7 @@
 #define DRM_DSC_HELPER_H_
 
 #include <drm/display/drm_dsc.h>
+#include <linux/bug.h>
 
 enum drm_dsc_params_kind {
 	DRM_DSC_1_2_444,
@@ -26,6 +27,12 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
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

