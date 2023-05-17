Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD6570756C
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 00:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E6710E4B5;
	Wed, 17 May 2023 22:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49CA10E2BE;
 Wed, 17 May 2023 22:27:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HLKi1B014213; Wed, 17 May 2023 22:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=T+RG0NCUK7seSOqljeNsqBVRreNAluR7v/tuYQ/EA7o=;
 b=WAlj2bWwDkyj9/UmQKBRTjzdPIPxjpypsiju2PVIoIb4PzS1hkuhf2mrWNkH8nVO2iTK
 9uyXvFrhZLMfqGg0ez6o09GH4d1ZIi5rv24u8ZIbEkK7p9/PVCQByCpC8epG9c9UV05o
 58cStU0jmsmhIFWHBaEUR/fbxlNBOhgqUwErQ7SxeDaqtcPTdm1yZQthhmQ9i85tQQRi
 8J73IJt15EJW03VWWvpghjSRXFxGsQNGKk9s2KbkwKy3K1+IMgM9cf0jeu9bf4P9ys2J
 FiLn/0pNbTXf+PZKjv8mcM26CRToBPQSfTd/VLGhfAoyvheLHWd6eTmCGP8cQZWhZWk6 Ag== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmbk7bska-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:27:28 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HMRQac028560
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 22:27:26 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 15:27:26 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 17 May 2023 15:27:19 -0700
Subject: [PATCH v12 6/9] drm/msm/dpu: Use fixed DRM DSC helper for
 det_thresh_flatness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v12-6-9cdb7401f614@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684362444; l=1416;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=hh1KdptbnGp+cN1KZZ5tztNBtU1X7gYJ7uv+ZikLd4E=;
 b=5gtvtJ/zGOopXs8tO0n/yUe3pW3/LyNQAD+VCxF1CdzsW8HT51/4uKLcET4FjiUe6gmqU2d9P
 d6vZpNweJ43AW0JttBm9eRqjY3b0Km27n0F1f9WlnNH5+bIxdTrOLTy
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jmHHNYry5p3pYUBh1b1GA750ZQU_JZiK
X-Proofpoint-ORIG-GUID: jmHHNYry5p3pYUBh1b1GA750ZQU_JZiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 adultscore=0 priorityscore=1501 mlxlogscore=800 bulkscore=0 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
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

The current dpu_hw_dsc calculation for det_thresh_flatness does not
match the downstream calculation or the DSC spec.

Use the DRM DSC helper for det_thresh_flatness to match downstream
implementation and the DSC spec.

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 4e1396575e6a..3cad6a80af97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2020-2022, Linaro Limited
  */
 
+#include <drm/display/drm_dsc_helper.h>
+
 #include "dpu_kms.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hwio.h"
@@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	data |= dsc->final_offset;
 	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
 
-	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
+	det_thresh_flatness = drm_dsc_flatness_det_thresh(dsc);
 	data = det_thresh_flatness << 10;
 	data |= dsc->flatness_max_qp << 5;
 	data |= dsc->flatness_min_qp;

-- 
2.40.1

