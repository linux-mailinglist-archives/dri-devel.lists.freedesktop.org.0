Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB46DFE78
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 21:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB5A10E938;
	Wed, 12 Apr 2023 19:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2744910E92F;
 Wed, 12 Apr 2023 19:10:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CI0u1t017398; Wed, 12 Apr 2023 19:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=0BIDHXsxDrh5nRhPRMlq7GoVXIW0YTBjByS/hsjmorE=;
 b=k7hQsQeh/Q19nFeyngdmfAxnaVyTifGdlztROIsovY7aNNJbgGIFEMvLpsDCH1jLNmW0
 5t/0w/2e94uIsYuYn7Uje704Xgr1GT7dp5yT/METoxKZxP1utUypcpQVRt0PocdJrRsG
 uEDgGiXkw9QAzgB8YX97NsQDpACHOilcWIH8aoDGPs2+HMWMS/cXVmqq1Gm7zAs8wL72
 8+YZZyTNfE3XwTMsYUGp2OuWHCnQ7dbzGGQH8rZUBKc4QZTaZ7mFxu5I3FAOqWT7y9w1
 DSpdlIRf+X2Yb7CunG48e/DKjTAV4Wj6sfAmwNTkw+CPKOg6djMdpk5Gf9B/GkPw2ECF kw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwe6m2kun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 19:09:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CJ9v31019214
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 19:09:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 12:09:57 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 12 Apr 2023 12:09:43 -0700
Subject: [PATCH v5 3/8] drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v5-3-0108401d7886@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681326596; l=1282;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=miwaTqKJX3w3HDahg7jImz20J6rL9IpfTJm6EPOS6AI=;
 b=xCtJ9Xu3A+934ZwrzC2mghTIV4WKmHh85f+0ZSqL+I59UidS1dRW9+ALQ7Ot17Za1m5aezLGo
 JSKaKXgi6qoD1yddO+xr2Bbg4e5Kz7IVFzEVT2kJUoKE2r6+p/u6gig
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vjfmUG0kuefpMh8B91K_hMCPoV1t8k_D
X-Proofpoint-ORIG-GUID: vjfmUG0kuefpMh8B91K_hMCPoV1t8k_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=712 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120164
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DRM DSC helper for det_thresh_flatness to match downstream
implementation and the DSC spec.

Changes in V2:
- Added a Fixes tag

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 619926da1441..b952f7d2b7f5 100644
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
+	det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
 	data = det_thresh_flatness << 10;
 	data |= dsc->flatness_max_qp << 5;
 	data |= dsc->flatness_min_qp;

-- 
2.40.0

