Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235026DE634
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 23:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6FD10E368;
	Tue, 11 Apr 2023 21:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A1410E368;
 Tue, 11 Apr 2023 21:09:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BKsDoA007547; Tue, 11 Apr 2023 21:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=i2rscoya1h2h5VboVRI66W0JlClFfDBueFYWIdsH+Lw=;
 b=mJzA60XMy6RRoAA3W8wu/hn8SBUW4JB/D/ktcBw31f3oWOqax1mVydzLaWtxQutwQA6o
 4p1H2DMxsz6TnWVWVoQat3QtnCmn+eMPPiemyPDcnLElNhiWCtdY4WyG6ol0jFQpdKzD
 d8KzSZgUzOveqvj71NlURYYOp4mSnavx88jiTXzt+7Gu7cUo1rezh5GKXOYwzLD2YqAt
 1ol9WxzO6+vTgo/Un4JK91uKg8qNa/ik/wHME0j9e7Gq6R40LzfxAToFO0PGPQPInBFz
 Y+ynSNaRAzWnHRRb69oXZ8zx+3cEcJzwdphInApe1Wz2lcp110eeTmTFz2J5jWSa86NO gw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwe6m03px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 21:09:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33BL9n4K023171
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 21:09:49 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 14:09:48 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH] drm/msm/dpu: add DSC range checking during resource
 reservation
Date: Tue, 11 Apr 2023 14:09:40 -0700
Message-ID: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WKmBajXDpqpBM9OQIlelBY97t9wQLLFL
X-Proofpoint-ORIG-GUID: WKmBajXDpqpBM9OQIlelBY97t9wQLLFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_14,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110190
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Perform DSC range checking to make sure correct DSC is requested before
reserve resource for it.

Fixes: c985d7bb64ff ("drm/msm/disp/dpu1: Add DSC support in RM")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88..95e58f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
@@ -250,6 +251,11 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dsc *hw;
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
+		if (dsc->id < DSC_0 || dsc->id >= DSC_MAX) {
+			DPU_ERROR("skip dsc %d with invalid id\n", dsc->id);
+			continue;
+		}
+
 		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
@@ -557,8 +563,10 @@ static int _dpu_rm_make_reservation(
 	}
 
 	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
-	if (ret)
+	if (ret) {
+		DPU_ERROR("unable to find appropriate DSC\n");
 		return ret;
+	}
 
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

