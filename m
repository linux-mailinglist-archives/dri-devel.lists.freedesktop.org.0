Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC56CF6E0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 01:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8B210EC4D;
	Wed, 29 Mar 2023 23:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C45010E1F7;
 Wed, 29 Mar 2023 23:19:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TLv5Dv007364; Wed, 29 Mar 2023 23:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=t0Tf0fxo3VDBGMZgYus/GNKBMhJyMx3WSyy9Bqsx7x0=;
 b=DXnq7kXNu+MfKQarkc9jLWhitft72x0rY8GtrovCuiSskDfIqYp5F6mStM8p2JPg2G7x
 U6ldhE1/HkSDVkCfvssbW3PaM7c81rt/wE9vfn5PAPi67zzG5PRPHMApc84qmELX9Zjf
 J6IjCB+9sDRp2bkbMBxWl9tAoM+zogEUTxgMyg3z1udHPjvQR5X9AQXRrTu0GA1tFz26
 HPwKN3px2j/dKu4VMyZoYaWqDOGp3uMofgx7kRIrdvn+iqNP4KBi7k+5PZiuQDZnMkX2
 KEFiw03P1/bjp2EMQDpINZMRbXlOmvqO+av+jStxHfZYtVG07yTGZ0am/ZYfK0Dqeigr lA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmpbm1gxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 23:19:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNJOju001701
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 23:19:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:19:24 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 29 Mar 2023 16:18:48 -0700
Subject: [PATCH RFC 3/5] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680131963; l=1014;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=PeUoqn42vHHdMQ4PdFlqVoAL//N1PJ2g2Ngm2c7IwqU=;
 b=4ikp2F0tuBHGBDCCE4WpMa/QewYQxs4HSFMd4LfWNHNYAhpvs/C7StH5A3DOrXQARiG7VbW5l
 kvQLtSFmqEPDpwIKiCO2+ohY2KASmILRw/FugXWkGT9kKAVUWXg6Fbp
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZoHVAIBHemoL8ciigkc2jTpS3nbB-zpF
X-Proofpoint-ORIG-GUID: ZoHVAIBHemoL8ciigkc2jTpS3nbB-zpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=613 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290174
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

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 619926da1441..648c530b5d05 100644
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
+	det_thresh_flatness = drm_dsc_calculate_det_thresh_flatness(dsc);
 	data = det_thresh_flatness << 10;
 	data |= dsc->flatness_max_qp << 5;
 	data |= dsc->flatness_min_qp;

-- 
2.39.2

