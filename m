Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBEB70FD04
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25A610E5BE;
	Wed, 24 May 2023 17:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5565010E5B0;
 Wed, 24 May 2023 17:45:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OEns1o015401; Wed, 24 May 2023 17:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=VQy3mfKHk2i7x5VG1IagFalmXYMmgG9jN1vwa6WRk20=;
 b=nZZjHL953W1oxbpZoI30Kgpkr2+aaUaVzWizwT/BRK77oVu9F2ugWJAhkrq8MgNRYNjx
 U25SfKNgXxRIBhHHCah+hZWtkJJpT9MJO+ll/o9BK8uw3KPiGrZC5LP74m6Nn0OTXryE
 4mQtIO4Adjy9MaiEqA3jZY51ZwP0DaQ9VzP++KmnPgGJsYwb0PbBm/BE4aMTXOJTew48
 0SJbouqE0qLCPUl2spP0Uq+Ifcwm8o5HxVZWtejOb1fVA5opse2fV6qs77PTCAkHXNIK
 hbV2zOs0z1e9saoWJHlg4rTLs0RpQMsLxAV78qrYg1SGUY9PVK+TTGSsSCY2sYsb+xSG 4A== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsdhh1fsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 17:45:36 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OHjZIW021884
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 17:45:35 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 24 May 2023 10:45:34 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 24 May 2023 10:45:14 -0700
Subject: [PATCH v14 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v14-1-bafc7be95691@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684950334; l=2387;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=xjGe2UNkyRMuSXaeNinJgb6hQA9cqK62h9D5nSOCqfU=;
 b=rweo1lTjnREy0oqGMILL7/AP4KEDBRQn1LYEV9wtvhkiRTS3uroGZzoaXIFFOMbIzGPB8Tz71
 egwyv4bR1KdBxdcvG8TRNzGBqVCsXAqEL+iRoCej/J9uqComIXKKCED
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VYckhBy3dCWRxWQzy6Rk-OyL8FYRMk9w
X-Proofpoint-ORIG-GUID: VYckhBy3dCWRxWQzy6Rk-OyL8FYRMk9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_13,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240146
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
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
 drivers/gpu/drm/display/drm_dsc_helper.c | 24 ++++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h     |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index fc187a8d8873..4efb6236d22c 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -1413,3 +1413,27 @@ int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg)
 	return 0;
 }
 EXPORT_SYMBOL(drm_dsc_compute_rc_parameters);
+
+/**
+ * drm_dsc_initial_scale_value() - Calculate the initial scale value for the given DSC config
+ * @dsc: Pointer to DRM DSC config struct
+ *
+ * Return: Calculated initial scale value
+ */
+u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
+{
+	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
+}
+EXPORT_SYMBOL(drm_dsc_initial_scale_value);
+
+/**
+ * drm_dsc_flatness_det_thresh() - Calculate the flatness_det_thresh for the given DSC config
+ * @dsc: Pointer to DRM DSC config struct
+ *
+ * Return: Calculated flatness det thresh value
+ */
+u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
+{
+	return 2 << (dsc->bits_per_component - 8);
+}
+EXPORT_SYMBOL(drm_dsc_flatness_det_thresh);
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index fc2104415dcb..71789fb34e17 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -24,6 +24,8 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
+u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc);
+u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc);
 
 #endif /* _DRM_DSC_HELPER_H_ */
 

-- 
2.40.1

