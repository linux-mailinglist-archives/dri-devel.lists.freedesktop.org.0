Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D5C707562
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 00:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CE010E4A7;
	Wed, 17 May 2023 22:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D768210E2D9;
 Wed, 17 May 2023 22:27:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HMHPLB024513; Wed, 17 May 2023 22:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=un4UVF/Dz+NtIJyGIT7bKb59fc7+r5Cnjw68JIw0pgI=;
 b=ej48QFpjFzSfYTvosfIi5iF9JgJ4Z9bW8kuB+SQQiUeuDO3JkuyzEiqBueKQoyihZjLM
 acJujaSJVYoq67vWPqfAOxjkuSAAFY7dQcB9Df0JVmSif0S4SMKHg4ffgCXaXDI7WABw
 e6sdL9u1umfAxmJsgYYatfYhuU45VcoLgMhqgi1kePj8YUbmLC5HLy7ZvZ3+5ZNyeEU0
 uvrEO0RAbIRlu/Ut8R1rg6AbFWOdCxPEqfsEd7FuyARHgbVsoiNa6TaskzXmQw2zpKmf
 /h9qVwgWBNTqj2cHTqQh03J3oUPz2EkAEWzrutoV1W9ntD0boxCEJzkIUPVDfF52U65P VA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmk9m2q4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:27:26 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HMRPNG029257
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:27:25 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 15:27:25 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 17 May 2023 15:27:15 -0700
Subject: [PATCH v12 2/9] drm/display/dsc: add helper to set semi-const
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v12-2-9cdb7401f614@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684362444; l=2677;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=y3sxC4iTh99jj4AdPYMXf61SpsTec7/5mKWuhDUFXdQ=;
 b=o4sf5Rqr08u1VfvME2JvHln6Au0CNU2kruHq9A4dzHMPVRZxaZBdFp3eNR3ON0YngeBI+p9Od
 F46hVqs3/esDSvdy9v7b+fbCdw5ynXgNMr2SghtElWttXBI4tHIlIAG
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aDmx79lDpNh5cWqEQcxth8-b8YAwbtIX
X-Proofpoint-ORIG-GUID: aDmx79lDpNh5cWqEQcxth8-b8YAwbtIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170185
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add a helper setting config values which are typically constant across
operating modes (table E-4 of the standard) and mux_word_size (which is
a const according to 3.5.2).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 22 ++++++++++++++++++++++
 include/drm/display/drm_dsc_helper.h     |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index fc187a8d8873..440da64d4129 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -270,6 +270,28 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
 }
 EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
 
+/**
+ * drm_dsc_set_const_params() - Set DSC parameters considered typically
+ * constant across operation modes
+ *
+ * @vdsc_cfg:
+ * DSC Configuration data partially filled by driver
+ */
+void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg)
+{
+	if (!vdsc_cfg->rc_model_size)
+		vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
+	vdsc_cfg->rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST;
+	vdsc_cfg->rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST;
+	vdsc_cfg->rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST;
+
+	if (vdsc_cfg->bits_per_component <= 10)
+		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
+	else
+		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
+}
+EXPORT_SYMBOL(drm_dsc_set_const_params);
+
 /* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
 static const u16 drm_dsc_rc_buf_thresh[] = {
 	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
index 753b0034eda7..e0cbc38ada26 100644
--- a/include/drm/display/drm_dsc_helper.h
+++ b/include/drm/display/drm_dsc_helper.h
@@ -21,6 +21,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 			      const struct drm_dsc_config *dsc_cfg);
+void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg);
 void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
 int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);

-- 
2.40.1

